import { StoryEvent } from '../types/index.js';
import { Normalizer } from './Normalizer.js';
import { FuzzyMatcher } from './FuzzyMatcher.js';
import { stateStore } from '../redis/StateStore.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('GuessEngine');

export type GuessVerdict = 'CORRECT' | 'CLOSE' | 'WRONG';

export interface GuessEvaluation {
  verdict: GuessVerdict;
  confidence: number;
  matchedConcept?: string;
  feedbackMessage?: string;
}

export class GuessEngine {
  private static lastPlayerGuesses: Map<string, { text: string; timestamp: number }> = new Map();

  /**
   * Rate limits guesses per player and suppresses identical repeated guesses
   */
  public static async canSubmitGuess(playerId: string, rawGuess: string): Promise<{ allowed: boolean; reason?: string }> {
    const isUnderRateLimit = await stateStore.checkRateLimit(`ratelimit:guess:${playerId}`, 2, 1);
    if (!isUnderRateLimit) {
      return { allowed: false, reason: 'RATE_LIMITED' };
    }

    const normalized = Normalizer.normalize(rawGuess);
    const last = this.lastPlayerGuesses.get(playerId);
    const now = Date.now();

    if (last && last.text === normalized && now - last.timestamp < 2000) {
      return { allowed: false, reason: 'DUPLICATE_GUESS' };
    }

    this.lastPlayerGuesses.set(playerId, { text: normalized, timestamp: now });
    return { allowed: true };
  }

  /**
   * Authoritative layered evaluation of a player's guess against the target story event
   */
  public static evaluate(rawGuess: string, event: StoryEvent): GuessEvaluation {
    const normalizedGuess = Normalizer.normalize(rawGuess);
    if (!normalizedGuess) {
      return { verdict: 'WRONG', confidence: 0 };
    }

    const guessTokens = new Set(Normalizer.tokenize(normalizedGuess));

    // ==========================================
    // LAYER 1 & 2: EXACT & ACCEPTED CONCEPTS MATCH
    // ==========================================
    const normalizedObjective = Normalizer.normalize(event.drawingObjective);
    if (normalizedGuess === normalizedObjective) {
      logger.info('Exact objective match', { rawGuess });
      return { verdict: 'CORRECT', confidence: 1.0, matchedConcept: event.drawingObjective };
    }

    for (const concept of event.acceptedConcepts || []) {
      const normalizedConcept = Normalizer.normalize(concept);
      if (normalizedGuess === normalizedConcept) {
        logger.info('Accepted concept exact match', { rawGuess, concept });
        return { verdict: 'CORRECT', confidence: 1.0, matchedConcept: concept };
      }

      // Check substring containment if concept is meaningful (>6 chars)
      if (normalizedConcept.length > 6 && normalizedGuess.includes(normalizedConcept)) {
        logger.info('Concept substring match', { rawGuess, concept });
        return { verdict: 'CORRECT', confidence: 0.95, matchedConcept: concept };
      }
    }

    // ==========================================
    // LAYER 3: SEMANTIC KEYWORD & ENTITY OVERLAP
    // ==========================================
    if (event.semanticKeywords && event.semanticKeywords.length > 0) {
      const normalizedKeywords = event.semanticKeywords.map((k) => Normalizer.normalize(k));
      let matchedKeywordCount = 0;

      for (const kw of normalizedKeywords) {
        const kwStem = kw.length > 4 ? kw.substring(0, 4) : kw;
        let matched = false;

        if (guessTokens.has(kw) || normalizedGuess.includes(kw)) {
          matched = true;
        } else {
          // Check token stems (e.g. 'hiding' matches 'hide')
          for (const token of guessTokens) {
            if (token.startsWith(kwStem) || kw.startsWith(token.length > 4 ? token.substring(0, 4) : token)) {
              matched = true;
              break;
            }
          }
        }

        if (matched) {
          matchedKeywordCount++;
        }
      }

      const keywordRatio = matchedKeywordCount / normalizedKeywords.length;

      // If they hit primary keywords (e.g. guard + diamond + hide)
      if (matchedKeywordCount >= 3 || (matchedKeywordCount >= 2 && keywordRatio >= 0.5)) {
        logger.info('Semantic keyword solve', { rawGuess, matchedCount: matchedKeywordCount });
        return { verdict: 'CORRECT', confidence: 0.85, matchedConcept: event.drawingObjective };
      }

      // If they hit at least 1 keyword, it's CLOSE ("Almost...")
      if (matchedKeywordCount >= 1) {
        return {
          verdict: 'CLOSE',
          confidence: 0.60,
          feedbackMessage: "You're close! Keep guessing!",
        };
      }
    }

    // ==========================================
    // LAYER 4: FUZZY DISTANCE (DICE & LEVENSHTEIN)
    // ==========================================
    let maxFuzzySimilarity = 0;
    let closestTarget = '';

    const candidateTargets = [event.drawingObjective, ...(event.acceptedConcepts || [])];

    for (const target of candidateTargets) {
      const normTarget = Normalizer.normalize(target);

      // Dice Bigram Coefficient
      const dice = FuzzyMatcher.diceCoefficient(normalizedGuess, normTarget);
      if (dice > maxFuzzySimilarity) {
        maxFuzzySimilarity = dice;
        closestTarget = target;
      }

      // Levenshtein small edit distance on short phrases
      if (normTarget.length > 4 && Math.abs(normalizedGuess.length - normTarget.length) <= 3) {
        const lev = FuzzyMatcher.levenshteinDistance(normalizedGuess, normTarget);
        if (lev <= 2) {
          const ratio = 1 - lev / normTarget.length;
          if (ratio > maxFuzzySimilarity) {
            maxFuzzySimilarity = ratio;
            closestTarget = target;
          }
        }
      }
    }

    if (maxFuzzySimilarity >= 0.78) {
      logger.info('Fuzzy solve', { rawGuess, maxFuzzySimilarity, closestTarget });
      return { verdict: 'CORRECT', confidence: maxFuzzySimilarity, matchedConcept: closestTarget };
    }

    if (maxFuzzySimilarity >= 0.45) {
      return {
        verdict: 'CLOSE',
        confidence: maxFuzzySimilarity,
        feedbackMessage: "Almost there! You're very close!",
      };
    }

    return { verdict: 'WRONG', confidence: maxFuzzySimilarity };
  }
}
