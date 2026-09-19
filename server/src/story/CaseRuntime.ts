import {
  CaseProgress,
  EvidenceCard,
  InvestigationEvent,
  NarrativePassage,
  StoryDefinition,
  StoryEvent,
  SuspectEntry,
} from '../types/index.js';
import { GeneratedStory } from '../types/storyCatalog.js';
import { InvestigationEventAdapter } from './InvestigationEventAdapter.js';
import { StoryCatalog } from './StoryCatalog.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('CaseRuntime');

/**
 * Runtime manager for a single case (game session).
 * Layered ON TOP of StoryEngine — does NOT replace it.
 *
 * Responsibilities:
 * - Narrative log (Story So Far)
 * - Evidence board
 * - Suspect profiles (public, no secrets)
 * - Case progress tracking
 * - Discussion trigger logic
 * - Case intro generation
 * - Truth reveal assembly
 */
export class CaseRuntime {
  private storyDef: StoryDefinition;
  private catalogStory: GeneratedStory | null;
  private narrativeLog: NarrativePassage[] = [];
  private evidenceBoard: EvidenceCard[] = [];
  private suspects: SuspectEntry[] = [];
  private investigationEvents: InvestigationEvent[] = [];
  private solvedEventCount = 0;
  private lastDiscussionAtSolveCount = 0;
  private minEventsBetweenDiscussions = 3;
  /** Catalog distorter objective — role assignment deferred to a later sprint. */
  private distorterObjective: string | null = null;

  constructor(storyDef: StoryDefinition) {
    this.storyDef = storyDef;
    this.catalogStory = this.loadCatalogStory(storyDef.id);

    // Pre-adapt all events
    this.investigationEvents = InvestigationEventAdapter.adaptAll(
      storyDef.events,
      this.catalogStory,
      storyDef.title,
      storyDef.genre,
      this.catalogStory?.setting
    );

    // Build suspect profiles (public only — no secrets exposed)
    this.suspects = this.buildSuspectList();
    this.distorterObjective = this.catalogStory?.distorter_objective || null;

    logger.info('CaseRuntime initialized', {
      storyId: storyDef.id,
      title: storyDef.title,
      eventCount: this.investigationEvents.length,
      suspectCount: this.suspects.length,
      hasCatalogStory: !!this.catalogStory,
    });
  }

  // ==========================================
  // CASE INTRO
  // ==========================================

  /**
   * Returns the cinematic case intro passage for the CASE_INTRO state.
   */
  public getCaseIntroPassage(): NarrativePassage {
    const intro = this.catalogStory
      ? this.buildCinematicIntro()
      : this.storyDef.description;

    const passage: NarrativePassage = {
      id: `intro_${this.storyDef.id}`,
      text: intro,
      type: 'INTRO',
      timestamp: Date.now(),
    };

    // Add to narrative log
    this.narrativeLog.push(passage);
    return passage;
  }

  /**
   * Returns structured case intro data for the CASE_INTRO event payload.
   */
  public getCaseIntroData(): {
    title: string;
    genre: string;
    setting: string;
    difficulty: string;
    description: string;
    introText: string;
    mainMystery: string;
    suspects: SuspectEntry[];
  } {
    const existingIntro = this.narrativeLog.find((p) => p.type === 'INTRO');
    return {
      title: this.storyDef.title,
      genre: this.storyDef.genre,
      setting: this.catalogStory?.setting || '',
      difficulty: this.storyDef.difficulty,
      description: this.storyDef.description,
      introText: existingIntro?.text || this.getCaseIntroPassage().text,
      mainMystery: this.catalogStory?.main_mystery || this.storyDef.description,
      suspects: this.suspects,
    };
  }

  private buildCinematicIntro(): string {
    if (!this.catalogStory) return this.storyDef.description;

    const parts: string[] = [];

    // Use dynamic wording intros if available
    const intros = this.catalogStory.dynamic_wording?.intros;
    if (intros && intros.length > 0) {
      parts.push(intros[Math.floor(Math.random() * intros.length)]);
    } else {
      parts.push(this.catalogStory.description);
    }

    // Add setting atmosphere
    if (this.catalogStory.setting) {
      parts.push(`\nLocation: ${this.catalogStory.setting}`);
    }

    // Add the hook/mystery
    if (this.catalogStory.main_mystery) {
      parts.push(`\n${this.catalogStory.main_mystery}`);
    }

    return parts.join('\n');
  }

  // ==========================================
  // INVESTIGATION EVENTS
  // ==========================================

  /**
   * Gets the enriched InvestigationEvent for a given StoryEvent.
   */
  public getInvestigationEvent(event: StoryEvent): InvestigationEvent {
    const found = this.investigationEvents.find((ie) => ie.eventId === event.eventId);
    if (found) return found;

    // Fallback: adapt on-the-fly
    return InvestigationEventAdapter.adapt(
      event,
      this.catalogStory,
      this.storyDef.title,
      this.storyDef.genre,
      this.catalogStory?.setting
    );
  }

  /**
   * Gets the next chronological investigation event for a given turn.
   * Filters out retired events to ensure continuous forward progress through the storyline.
   */
  public getChronologicalEvent(turnIndex: number, retiredEventIds: string[] = []): InvestigationEvent | null {
    // 1. First find the unretired event with the lowest sequence/chronological order
    const unplayed = this.investigationEvents.filter((ev) => !retiredEventIds.includes(ev.eventId));
    if (unplayed.length > 0) {
      return unplayed[0];
    }
    // 2. If all events in the case were played, wrap around by turnIndex
    if (this.investigationEvents.length > 0) {
      return this.investigationEvents[turnIndex % this.investigationEvents.length];
    }
    return null;
  }

  /**
   * Gets the narrative context passage to show before an investigation begins.
   */
  public getSceneNarrative(event: InvestigationEvent): NarrativePassage {
    const passage: NarrativePassage = {
      id: `scene_${event.eventId}`,
      text: event.narrativeContext,
      type: 'SCENE',
      timestamp: Date.now(),
      eventId: event.eventId,
    };

    this.narrativeLog.push(passage);
    return passage;
  }

  // ==========================================
  // EVIDENCE BOARD
  // ==========================================

  /**
   * Records a discovered evidence card after a clue is solved.
   * Returns the evidence card and narrative passage.
   */
  public recordEvidenceDiscovery(
    event: InvestigationEvent,
    solverPlayerId: string,
    solverName: string,
    drawerPlayerId: string,
    drawerName: string,
    turnIndex: number
  ): { evidenceCard: EvidenceCard; narrativePassage: NarrativePassage } {
    this.solvedEventCount++;

    // Build evidence card
    const evidenceCard: EvidenceCard = {
      id: `evidence_${event.eventId}`,
      title: event.canonicalAnswer,
      description: event.evidenceReveal,
      discoveredBy: solverPlayerId,
      discoveredByName: solverName,
      drawnBy: drawerPlayerId,
      drawnByName: drawerName,
      scene: event.narrativeContext,
      timestamp: Date.now(),
      category: event.visualCategory || 'OBJECT',
      eventId: event.eventId,
      turnIndex,
    };
    this.evidenceBoard.push(evidenceCard);

    // Build narrative passage for evidence reveal
    const narrativePassage: NarrativePassage = {
      id: `evidence_reveal_${event.eventId}`,
      text: event.evidenceReveal,
      type: 'EVIDENCE',
      timestamp: Date.now(),
      eventId: event.eventId,
    };
    this.narrativeLog.push(narrativePassage);

    // If there's a story consequence, add it too
    if (event.storyConsequence && event.storyConsequence !== event.evidenceReveal) {
      this.narrativeLog.push({
        id: `consequence_${event.eventId}`,
        text: event.storyConsequence,
        type: 'REVELATION',
        timestamp: Date.now(),
        eventId: event.eventId,
      });
    }

    logger.info('Evidence discovered', {
      title: evidenceCard.title,
      solver: solverName,
      solvedCount: this.solvedEventCount,
    });

    return { evidenceCard, narrativePassage };
  }

  // ==========================================
  // DISCUSSION TRIGGERS
  // ==========================================

  /**
   * Returns true if the game should enter a DISCUSSION state
   * after the most recently solved event.
   */
  public shouldTriggerDiscussion(lastSolvedEvent: InvestigationEvent): boolean {
    // Don't trigger if we just had a discussion recently
    const eventsSinceLastDiscussion = this.solvedEventCount - this.lastDiscussionAtSolveCount;
    if (eventsSinceLastDiscussion < this.minEventsBetweenDiscussions) {
      return false;
    }

    // Trigger if this was a key event
    if (lastSolvedEvent.isKeyEvent) {
      return true;
    }

    // Also trigger at roughly the halfway point of the case
    const totalEvents = this.investigationEvents.length;
    const halfwayPoint = Math.floor(totalEvents / 2);
    if (this.solvedEventCount === halfwayPoint && halfwayPoint >= 3) {
      return true;
    }

    return false;
  }

  /**
   * Marks that a discussion just occurred.
   */
  public markDiscussionTriggered(): void {
    this.lastDiscussionAtSolveCount = this.solvedEventCount;
  }

  /**
   * Generates discussion options based on available unsolved investigation paths.
   */
  public generateDiscussionOptions(
    solvedEventIds: Set<string>,
    retiredEventIds: Set<string>
  ): string[] {
    const unsolved = this.investigationEvents.filter(
      (ev) => !solvedEventIds.has(ev.eventId) && !retiredEventIds.has(ev.eventId)
    );

    if (unsolved.length === 0) {
      return ['Continue the investigation'];
    }

    // Pick up to 3 different narrative investigation paths
    const options: string[] = [];
    const shuffled = [...unsolved].sort(() => Math.random() - 0.5);

    for (const ev of shuffled.slice(0, 3)) {
      options.push(this.getDiscussionOptionText(ev));
    }

    return options;
  }

  private getDiscussionOptionText(event: InvestigationEvent): string {
    // Use the narrative context to create a natural discussion option
    const context = event.narrativeContext || event.narrativeDescription;
    if (context && context.length > 10 && context.length < 80) {
      return context;
    }

    // Fallback to generic investigation direction
    switch (event.promptType) {
      case 'OBJECT': return 'Search for more physical evidence';
      case 'LOCATION': return 'Investigate a new location';
      case 'PERSON': return 'Question another witness';
      case 'ACTION': return 'Review the sequence of events';
      case 'SCENE': return 'Check the surveillance footage';
      default: return 'Continue investigating';
    }
  }

  // ==========================================
  // CASE PROGRESS
  // ==========================================

  /**
   * Returns current case progress.
   */
  public getCaseProgress(): CaseProgress {
    const totalEvents = this.investigationEvents.length;
    const discovered = this.solvedEventCount;
    const percentage = totalEvents > 0 ? Math.round((discovered / totalEvents) * 100) : 0;

    return {
      totalEvents,
      discoveredEvents: discovered,
      percentage,
      caseTitle: this.storyDef.title,
      caseSetting: this.catalogStory?.setting,
      caseGenre: this.storyDef.genre,
    };
  }

  // ==========================================
  // TRUTH REVEAL
  // ==========================================

  /**
   * Assembles the complete truth reveal for the end of the case.
   * ONLY called when transitioning to TRUTH_REVEAL state.
   */
  public assembleTruthReveal(): {
    fullTruth: string;
    timeline: Array<{ time: string; event: string }>;
    culprit: string;
    motive: string;
    method: string;
    discoveredEvidence: EvidenceCard[];
    missedEvents: Array<{ title: string; description: string }>;
    correctTheory: string;
  } {
    const discoveredIds = new Set(this.evidenceBoard.map((e) => e.eventId));
    const missedEvents = this.investigationEvents
      .filter((ev) => !discoveredIds.has(ev.eventId))
      .map((ev) => ({
        title: ev.canonicalAnswer,
        description: ev.evidenceReveal,
      }));

    return {
      fullTruth: this.catalogStory?.final_reveal || this.catalogStory?.truth || 'The truth has been revealed.',
      timeline: this.catalogStory?.timeline || [],
      culprit: this.catalogStory?.culprit || 'Unknown',
      motive: this.catalogStory?.motive || 'Unknown',
      method: this.catalogStory?.method || 'Unknown',
      discoveredEvidence: [...this.evidenceBoard],
      missedEvents,
      correctTheory: this.catalogStory?.theories?.correctTheory || '',
    };
  }

  // ==========================================
  // FINAL INVESTIGATION
  // ==========================================

  /**
   * Returns structured data for the FINAL_INVESTIGATION state.
   */
  public getFinalInvestigationData(): {
    prompt: string;
    suspects: SuspectEntry[];
    evidenceBoard: EvidenceCard[];
    narrativeLog: NarrativePassage[];
    caseProgress: CaseProgress;
  } {
    return {
      prompt: this.catalogStory?.final_investigation_prompt || 'Who is responsible? Submit your final theory.',
      suspects: [...this.suspects],
      evidenceBoard: [...this.evidenceBoard],
      narrativeLog: [...this.narrativeLog],
      caseProgress: this.getCaseProgress(),
    };
  }

  // ==========================================
  // ACCESSORS
  // ==========================================

  public getNarrativeLog(): NarrativePassage[] {
    return [...this.narrativeLog];
  }

  public getEvidenceBoard(): EvidenceCard[] {
    return [...this.evidenceBoard];
  }

  public getSuspects(): SuspectEntry[] {
    return [...this.suspects];
  }

  public getStoryDefinition(): StoryDefinition {
    return this.storyDef;
  }

  public getCatalogStory(): GeneratedStory | null {
    return this.catalogStory;
  }

  /** Present in catalog data; assignment is intentionally not implemented yet. */
  public getDistorterObjective(): string | null {
    return this.distorterObjective;
  }

  // ==========================================
  // PRIVATE HELPERS
  // ==========================================

  private loadCatalogStory(storyId: string): GeneratedStory | null {
    try {
      StoryCatalog.ensureInitialized();
      return StoryCatalog.getStoryById(storyId);
    } catch (err) {
      logger.warn('Could not load catalog story', { storyId });
      return null;
    }
  }

  private buildSuspectList(): SuspectEntry[] {
    if (!this.catalogStory?.characters) return [];

    return this.catalogStory.characters.map((char) => ({
      id: char.id,
      name: char.name,
      role: char.role_description,
      personality: char.personality,
      publicStatement: char.what_they_say,
      avatar: char.avatar,
      connection: char.connection,
      // NOTE: what_they_hide, alibi, what_they_know, what_they_do_not_know
      // are INTENTIONALLY NOT exposed — server-only secrets.
    }));
  }
}
