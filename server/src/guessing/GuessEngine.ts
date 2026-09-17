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
    // LAYER 3: 2-WORD CLUE MATCH & SEMANTIC KEYWORDS
    // If ANY 2 clue/keyword/visual words match the guess, mark as CORRECT!
    // ==========================================
    const allClueSources: string[] = [
      event.drawingObjective,
      ...(event.semanticKeywords || []),
      ...(event.visualElements || []),
      ...(event.acceptedConcepts || []),
      ...(event.hint ? [event.hint] : []),
    ];

    const clueWordSet = new Set<string>();
    for (const source of allClueSources) {
      const tokens = Normalizer.tokenize(source);
      for (const t of tokens) {
        if (t.length >= 3) {
          clueWordSet.add(t);
        }
      }
    }

    const matchedClueWords = new Set<string>();
    for (const clueWord of clueWordSet) {
      const stem = clueWord.length > 4 ? clueWord.substring(0, 4) : clueWord;

      if (guessTokens.has(clueWord) || normalizedGuess.includes(clueWord)) {
        matchedClueWords.add(clueWord);
      } else {
        for (const token of guessTokens) {
          if (token.length >= 3) {
            const tokenStem = token.length > 4 ? token.substring(0, 4) : token;
            if (token.startsWith(stem) || clueWord.startsWith(tokenStem) || FuzzyMatcher.diceCoefficient(token, clueWord) >= 0.75) {
              matchedClueWords.add(clueWord);
              break;
            }
          }
        }
      }
    }

    if (matchedClueWords.size >= 2) {
      logger.info('Clue 2-word match solve', { rawGuess, matchedWords: Array.from(matchedClueWords) });
      return { verdict: 'CORRECT', confidence: 0.90, matchedConcept: event.drawingObjective };
    }

    if (matchedClueWords.size === 1) {
      const word = Array.from(matchedClueWords)[0];
      return {
        verdict: 'CLOSE',
        confidence: 0.65,
        feedbackMessage: `You found 1 clue word ("${word}")! Add 1 more word!`,
      };
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
