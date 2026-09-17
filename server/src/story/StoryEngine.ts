import { PromptOption, StoryDefinition, StoryEnding, StoryEvent } from '../types/index.js';
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
  public getEligibleEvents(act: number, solvedEventIds: Set<string>): StoryEvent[] {
    return this.story.events.filter((event) => {
      if (event.act !== act) return false;
      if (solvedEventIds.has(event.eventId)) return false;
      return this.isEventUnlocked(event);
    });
  }

  /**
   * Generates 3 secret prompt choices for the drawer:
   * 1 canonical target event + 2 thematic distractors
   */
  public generateThreePromptChoices(
    act: number,
    solvedEventIds: Set<string>
  ): { targetEvent: StoryEvent; options: PromptOption[] } | null {
    const eligible = this.getEligibleEvents(act, solvedEventIds);

    if (eligible.length === 0) {
      logger.warn('No eligible story events found for act', { act });
      return null;
    }

    // Sort by sequence for narrative progression
    eligible.sort((a, b) => a.sequence - b.sequence);
    const targetEvent = eligible[0];

    // Pick 2 distractors: prioritize event-specific choices from story markdown files!
    let distractor1 = '';
    let distractor2 = '';

    if (targetEvent.choices && targetEvent.choices.length >= 2) {
      const altChoices = targetEvent.choices.filter((c) => !c.isCanon).map((c) => c.text);
      if (altChoices.length >= 2) {
        distractor1 = altChoices[0];
        distractor2 = altChoices[1];
      } else if (altChoices.length === 1) {
        distractor1 = altChoices[0];
      }
    }

    if (!distractor1 || !distractor2) {
      const availableDistractors = [...this.story.distractors];
      for (let i = availableDistractors.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [availableDistractors[i], availableDistractors[j]] = [availableDistractors[j], availableDistractors[i]];
      }
      if (!distractor1) distractor1 = availableDistractors[0]?.text || 'A cat knocks over a vase';
      if (!distractor2) distractor2 = availableDistractors[1]?.text || 'A shadow moves past the window';
    }

    const rawOptions: PromptOption[] = [
      {
        optionIndex: 0,
        previewText: targetEvent.drawingObjective,
        difficulty: targetEvent.difficulty,
        isDistractor: false,
        eventId: targetEvent.eventId,
      },
      {
        optionIndex: 1,
        previewText: distractor1,
        difficulty: 'MEDIUM',
        isDistractor: true,
      },
      {
        optionIndex: 2,
        previewText: distractor2,
        difficulty: 'HARD',
        isDistractor: true,
      },
    ];

    // Deterministically or randomly shuffle options so target is not always first
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
