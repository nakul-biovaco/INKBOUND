import {
  InvestigationEvent,
  PromptType,
  StoryEvent,
  VisualCategory,
} from '../types/index.js';
import { GeneratedStory, GeneratedStoryEvent } from '../types/storyCatalog.js';
import { InvestigationPromptGenerator } from './InvestigationPromptGenerator.js';
import { MASTER_MYSTERY_CLUES } from './InfiniteClueEngine.js';
import { MarkdownStoryParser } from './MarkdownStoryParser.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('InvestigationEventAdapter');

/**
 * Adapts existing story events (from the 120-story catalog or markdown parser)
 * into enriched InvestigationEvents with contextual narrative prompts.
 *
 * NEVER mutates stored catalog data — all enrichment is done at runtime.
 */
export class InvestigationEventAdapter {
  /**
   * Enriches a StoryEvent into a full InvestigationEvent using parent story context.
   * If the event already has new optional fields, those are preserved.
   */
  public static adapt(
    event: StoryEvent,
    story: GeneratedStory | null,
    storyTitle: string,
    storyGenre: string,
    storySetting?: string
  ): InvestigationEvent {
    const canonicalAnswer = event.drawingObjective;
    const acceptedAnswers = [...(event.acceptedConcepts || [])];
    if (!acceptedAnswers.includes(canonicalAnswer.toLowerCase())) {
      acceptedAnswers.push(canonicalAnswer.toLowerCase());
    }

    // Find matching GeneratedStoryEvent for richer context
    const catalogEvent = story?.events.find(
      (ev) => ev.id === event.eventId || ev.clue === canonicalAnswer
    ) || null;

    // Determine prompt type from the canonical answer
    const promptType = event.promptType || this.inferPromptType(canonicalAnswer, event.hint, catalogEvent);
    const visualCategory = event.visualCategory || this.inferVisualCategory(canonicalAnswer, event.hint);

    // Build narrative context (why the investigation is happening - sanitized so it never leaks answers to guessers)
    const rawNarrativeContext = event.narrativeContext
      || catalogEvent?.what_happens
      || event.narrativeDescription
      || `The investigation continues at ${storySetting || 'the crime scene'}.`;

    const narrativeContext = InvestigationPromptGenerator.sanitizeForPrompt(
      rawNarrativeContext,
      canonicalAnswer,
      acceptedAnswers
    );

    // Build evidence reveal text
    const evidenceReveal = event.evidenceReveal
      || catalogEvent?.what_to_discover
      || event.consequenceReveal
      || `A crucial piece of evidence has been discovered.`;

    // Build story consequence
    const storyConsequence = event.storyConsequence
      || evidenceReveal;

    // Determine if this is a key event
    const isKeyEvent = event.isKeyEvent
      ?? catalogEvent?.is_key_event
      ?? false;

    // Generate public investigation objective for guessers (explains WHAT to deduce without leaking answers)
    const investigationObjective = event.investigationObjective
      || this.generateInvestigationObjective(promptType, storySetting);

    // Generate the drawer prompt (the most important change)
    const drawerPrompt = event.drawerPrompt
      || InvestigationPromptGenerator.generate({
        canonicalAnswer,
        promptType,
        narrativeContext,
        storyTitle,
        storyGenre,
        storySetting: storySetting || '',
        hint: event.hint,
        eventDescription: catalogEvent?.description || event.narrativeDescription,
        acceptedAnswers,
      });

    return {
      // Spread all existing StoryEvent fields
      ...event,
      // Guaranteed new fields
      drawerPrompt,
      narrativeContext,
      investigationObjective,
      evidenceReveal,
      promptType,
      visualCategory,
      canonicalAnswer,
      acceptedAnswers,
      storyConsequence,
      isKeyEvent,
    };
  }

  /**
   * Generates a high-level public detective objective for guessers.
   * Explains what the room is trying to deduce without leaking the secret concept.
   */
  public static generateInvestigationObjective(
    promptType: PromptType = 'OBJECT',
    storySetting?: string
  ): string {
    const settingSuffix = storySetting && storySetting.trim().length > 3
      ? ` at ${storySetting.trim()}`
      : '';
    switch (promptType) {
      case 'LOCATION':
        return `Trace the movements and evidence to deduce where the next lead is located${settingSuffix}.`;
      case 'PERSON':
      case 'SUSPECT':
        return `Analyze witness reports to deduce the identity of the person of interest${settingSuffix}.`;
      case 'ACTION':
      case 'EVENT':
        return `Reconstruct the timeline to discover what incident unfolded${settingSuffix}.`;
      case 'MEMORY':
        return `Piece together witness testimony to deduce what was seen before the commotion${settingSuffix}.`;
      case 'SCENE':
        return `Scrutinize the crime scene to identify the unusual detail captured by the artist${settingSuffix}.`;
      case 'EVIDENCE':
      case 'OBJECT':
      default:
        return `Examine the crime scene to deduce what critical evidence the sketch artist discovered${settingSuffix}.`;
    }
  }

  /**
   * Generates a contextual investigation task for distractor prompt options.
   * Ensures alternative prompt choices are unique, distinct, and never duplicate sentences.
   */
  public static generateTaskForDistractor(
    distractorWord: string,
    promptType: PromptType = 'OBJECT',
    distractorIndex: number = 0
  ): string {
    const cleanWord = distractorWord.trim();
    // Look up in MASTER_MYSTERY_CLUES for realistic forensic hint
    const match = MASTER_MYSTERY_CLUES.find((c) =>
      c.text.toLowerCase().trim() === cleanWord.toLowerCase() ||
      MarkdownStoryParser.cleanToClueWord(c.text).toLowerCase().trim() === cleanWord.toLowerCase()
    );

    if (match && match.hint) {
      return `Secondary lead: ${match.hint} Draw what was found.`;
    }

    const templates = [
      `Search the surrounding area: a secondary physical clue was left behind. Draw what was uncovered.`,
      `Forensics marks an alternate piece of physical evidence near the perimeter. Draw the object found.`,
      `A witness recalls an unexpected detail dropped during the commotion. Draw what was observed.`,
      `Investigators dusted a separate surface and isolated an unusual item. Draw what was recovered.`,
      `A curious item discovered in the shadows might be connected to the mystery. Draw what was found.`,
    ];

    const idx = Math.abs(distractorIndex) % templates.length;
    return templates[idx];
  }

  /**
   * Batch-adapt all events in a story definition.
   * Used when initializing CaseRuntime.
   */
  public static adaptAll(
    events: StoryEvent[],
    story: GeneratedStory | null,
    storyTitle: string,
    storyGenre: string,
    storySetting?: string
  ): InvestigationEvent[] {
    return events.map((ev) =>
      this.adapt(ev, story, storyTitle, storyGenre, storySetting)
    );
  }

  /**
   * Infers prompt type from canonical answer and context clues.
   */
  private static inferPromptType(
    answer: string,
    hint: string,
    catalogEvent: GeneratedStoryEvent | null
  ): PromptType {
    const combined = `${answer} ${hint} ${catalogEvent?.description || ''}`.toLowerCase();

    // Person indicators
    if (
      combined.includes('person') || combined.includes('suspect') ||
      combined.includes('witness') || combined.includes('man') ||
      combined.includes('woman') || combined.includes('figure') ||
      combined.includes('stranger') || combined.includes('guard') ||
      combined.includes('doctor') || combined.includes('detective')
    ) {
      return 'PERSON';
    }

    // Location indicators
    if (
      combined.includes('place') || combined.includes('room') ||
      combined.includes('building') || combined.includes('station') ||
      combined.includes('alley') || combined.includes('garden') ||
      combined.includes('corridor') || combined.includes('basement') ||
      combined.includes('warehouse') || combined.includes('office')
    ) {
      return 'LOCATION';
    }

    // Action indicators
    if (
      combined.includes('running') || combined.includes('fighting') ||
      combined.includes('hiding') || combined.includes('escaping') ||
      combined.includes('climbing') || combined.includes('breaking') ||
      combined.includes('sneaking') || combined.includes('stealing')
    ) {
      return 'ACTION';
    }

    // Scene / camera indicators
    if (
      combined.includes('camera') || combined.includes('footage') ||
      combined.includes('security') || combined.includes('recording') ||
      combined.includes('cctv')
    ) {
      return 'SCENE';
    }

    // Memory indicators
    if (
      combined.includes('remember') || combined.includes('memory') ||
      combined.includes('flashback') || combined.includes('last thing')
    ) {
      return 'MEMORY';
    }

    // Event indicators
    if (
      combined.includes('happened') || combined.includes('incident') ||
      combined.includes('explosion') || combined.includes('crash')
    ) {
      return 'EVENT';
    }

    // Default to OBJECT (most common: physical evidence items)
    return 'OBJECT';
  }

  /**
   * Infers visual category from the canonical answer.
   */
  private static inferVisualCategory(answer: string, hint: string): VisualCategory {
    const combined = `${answer} ${hint}`.toLowerCase();

    if (
      combined.includes('person') || combined.includes('man') ||
      combined.includes('woman') || combined.includes('guard') ||
      combined.includes('suspect') || combined.includes('witness') ||
      combined.includes('figure') || combined.includes('detective')
    ) {
      return 'PERSON';
    }

    if (
      combined.includes('room') || combined.includes('building') ||
      combined.includes('station') || combined.includes('house') ||
      combined.includes('alley') || combined.includes('office') ||
      combined.includes('warehouse') || combined.includes('garden')
    ) {
      return 'PLACE';
    }

    if (
      combined.includes('running') || combined.includes('fighting') ||
      combined.includes('escaping') || combined.includes('hiding') ||
      combined.includes('sneaking')
    ) {
      return 'ACTION';
    }

    if (
      combined.includes('letter') || combined.includes('note') ||
      combined.includes('diary') || combined.includes('document') ||
      combined.includes('passport') || combined.includes('ticket') ||
      combined.includes('receipt') || combined.includes('map')
    ) {
      return 'DOCUMENT';
    }

    if (
      combined.includes('knife') || combined.includes('gun') ||
      combined.includes('hammer') || combined.includes('wrench') ||
      combined.includes('cutter') || combined.includes('saw') ||
      combined.includes('drill') || combined.includes('screwdriver')
    ) {
      return 'TOOL';
    }

    if (
      combined.includes('car') || combined.includes('train') ||
      combined.includes('boat') || combined.includes('bike') ||
      combined.includes('taxi') || combined.includes('bus') ||
      combined.includes('helicopter') || combined.includes('truck')
    ) {
      return 'VEHICLE';
    }

    return 'OBJECT';
  }
}
