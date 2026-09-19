import { PromptOption, StoryDefinition, StoryEnding, StoryEvent } from '../types/index.js';
import { MarkdownStoryParser } from './MarkdownStoryParser.js';
import { InfiniteClueEngine } from './InfiniteClueEngine.js';
import { InvestigationPromptGenerator } from './InvestigationPromptGenerator.js';
import { InvestigationEventAdapter } from './InvestigationEventAdapter.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryEngine');

export class StoryEngine {
  private story: StoryDefinition;
  private currentVariables: Record<string, boolean | number | string>;

  constructor(story: StoryDefinition, initialVariables?: Record<string, boolean | number | string>) {
    this.story = story;
    this.currentVariables = { ...story.initialVariables, ...(initialVariables || {}) };
  }

  public getStory(): StoryDefinition {
    return this.story;
  }

  public getVariables(): Record<string, boolean | number | string> {
    return { ...this.currentVariables };
  }

  /**
   * Evaluates whether all required preconditions for an event are satisfied
   */
  public isEventUnlocked(event: StoryEvent): boolean {
    if (!event.requiredVariables) return true;
    for (const [key, reqVal] of Object.entries(event.requiredVariables)) {
      if (this.currentVariables[key] !== reqVal) {
        return false;
      }
    }
    return true;
  }

  /**
   * Finds all available events for the current act and state
   */
  public getEligibleEvents(
    act: number,
    solvedEventIds: Set<string>,
    retiredEventIds: Set<string> = new Set(),
    usedWords: Set<string> = new Set()
  ): StoryEvent[] {
    const normUsed = new Set(Array.from(usedWords).map((w) => w.toLowerCase().trim()));
    return this.story.events.filter((event) => {
      if (event.act !== act) return false;
      if (solvedEventIds.has(event.eventId)) return false;
      if (retiredEventIds.has(event.eventId)) return false;
      const cleanObj = MarkdownStoryParser.cleanToClueWord(event.drawingObjective).toLowerCase().trim();
      if (normUsed.has(cleanObj)) return false;
      return this.isEventUnlocked(event);
    });
  }

  /**
   * Generates 3 secret prompt choices for the drawer:
   * 1 canonical or procedural target event + 2 fresh thematic distractors.
   * Guarantees zero duplicates against previously used or offered words.
   */
  public generateThreePromptChoices(
    act: number,
    solvedEventIds: Set<string>,
    retiredEventIds: Set<string> = new Set(),
    usedWords: Set<string> = new Set(),
    offeredWords: Set<string> = new Set()
  ): { targetEvent: StoryEvent; options: PromptOption[] } {
    const eligible = this.getEligibleEvents(act, solvedEventIds, retiredEventIds, usedWords);

    let targetEvent: StoryEvent;

    if (eligible.length > 0) {
      // Sort by sequence for narrative progression
      eligible.sort((a, b) => a.sequence - b.sequence);
      targetEvent = eligible[0];
    } else {
      // Check if any eligible events exist in any act
      const allEligible = this.story.events.filter((event) => {
        if (solvedEventIds.has(event.eventId)) return false;
        if (retiredEventIds.has(event.eventId)) return false;
        const cleanObj = MarkdownStoryParser.cleanToClueWord(event.drawingObjective).toLowerCase().trim();
        if (usedWords.has(cleanObj)) return false;
        return true;
      });

      if (allEligible.length > 0) {
        allEligible.sort((a, b) => a.sequence - b.sequence);
        targetEvent = allEligible[0];
      } else {
        // Canonical events in story exhausted: seamlessly generate a procedural mystery event
        logger.info('Canonical story events exhausted; generating procedural mystery clue', {
          storyId: this.story.id,
          act,
        });
        targetEvent = InfiniteClueEngine.generateProceduralEvent(
          act,
          solvedEventIds.size + retiredEventIds.size + 1,
          this.story.genre,
          usedWords,
          offeredWords
        );
      }
    }

    const cleanClue = (txt: string): string => {
      if (!txt) return 'Mystery Clue';
      return MarkdownStoryParser.cleanToClueWord(txt);
    };

    const targetClueClean = cleanClue(targetEvent.drawingObjective);
    const targetNorm = targetClueClean.toLowerCase().trim();

    // Pick 2 fresh distractors guaranteed not to match target, used words, or recently offered words
    let distractor1 = '';
    let distractor2 = '';

    // Check if event has canon choices that are unused
    if (targetEvent.choices && targetEvent.choices.length >= 2) {
      const altChoices = targetEvent.choices
        .filter((c) => !c.isCanon)
        .map((c) => cleanClue(c.text))
        .filter((txt) => {
          const norm = txt.toLowerCase().trim();
          return norm !== targetNorm && !usedWords.has(norm) && !offeredWords.has(norm);
        });

      if (altChoices.length >= 2) {
        distractor1 = altChoices[0];
        distractor2 = altChoices[1];
      } else if (altChoices.length === 1) {
        distractor1 = altChoices[0];
      }
    }

    // Fall back to InfiniteClueEngine for fresh non-repeating distractors
    if (!distractor1 || !distractor2) {
      const combinedOffered = new Set([...Array.from(offeredWords), distractor1].filter(Boolean));
      const [fresh1, fresh2] = InfiniteClueEngine.getTwoFreshDistractors(
        targetClueClean,
        usedWords,
        combinedOffered
      );
      if (!distractor1) distractor1 = fresh1;
      if (!distractor2) distractor2 = fresh2 !== distractor1 ? fresh2 : 'Secret Safe';
    }

    const targetTask = targetEvent.drawerPrompt
      || InvestigationPromptGenerator.generate({
        canonicalAnswer: targetClueClean,
        promptType: targetEvent.promptType || 'OBJECT',
        narrativeContext: targetEvent.narrativeContext || targetEvent.narrativeDescription || '',
        storyTitle: this.story.title,
        storyGenre: this.story.genre,
        storySetting: this.story.description || '',
        hint: targetEvent.hint,
        eventDescription: targetEvent.narrativeDescription,
        acceptedAnswers: targetEvent.acceptedConcepts,
      });

    const distractor1Task = InvestigationEventAdapter.generateTaskForDistractor(
      distractor1,
      'OBJECT',
      0
    );
    const distractor2Task = InvestigationEventAdapter.generateTaskForDistractor(
      distractor2,
      'OBJECT',
      1
    );

    const rawOptions: PromptOption[] = [
      {
        optionIndex: 0,
        previewText: targetClueClean,
        difficulty: targetEvent.difficulty,
        isDistractor: false,
        eventId: targetEvent.eventId,
        investigationTask: targetTask,
      },
      {
        optionIndex: 1,
        previewText: distractor1,
        difficulty: 'MEDIUM',
        isDistractor: true,
        investigationTask: distractor1Task,
      },
      {
        optionIndex: 2,
        previewText: distractor2,
        difficulty: 'HARD',
        isDistractor: true,
        investigationTask: distractor2Task,
      },
    ];

    // Randomly shuffle options so target is not always first
    const shuffled = [...rawOptions].sort(() => Math.random() - 0.5);
    shuffled.forEach((opt, idx) => {
      opt.optionIndex = idx;
    });

    return { targetEvent, options: shuffled };
  }

  /**
   * Applies state updates when a clue is solved
   */
  public applyEventConsequence(event: StoryEvent): Record<string, boolean | number | string> {
    if (event.setVariables) {
      for (const [key, val] of Object.entries(event.setVariables)) {
        this.currentVariables[key] = val;
      }
    }
    logger.info('Story consequence applied', { eventId: event.eventId, vars: this.currentVariables });
    return this.getVariables();
  }

  /**
   * Evaluates the final ending based on story variables and solved clues
   */
  public determineEnding(): StoryEnding {
    for (const ending of this.story.endings) {
      let matches = true;
      for (const [key, reqVal] of Object.entries(ending.requiredVariables)) {
        if (this.currentVariables[key] !== reqVal) {
          matches = false;
          break;
        }
      }
      if (matches) {
        return ending;
      }
    }
    // Fallback to default first ending
    return this.story.endings[0];
  }
}
