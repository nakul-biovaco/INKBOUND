import { config } from '../config/index.js';
import {
  AuthoritativeGameSession,
  DiscussionVote,
  ErrorCode,
  GameStatus,
  InvestigationEvent,
  Player,
  PromptOption,
  Room,
  SolvedEventRecord,
  StoryDefinition,
  StoryEnding,
  StoryEvent,
  StrokeChunk,
} from '../types/index.js';
import { GameStateMachine } from './GameStateMachine.js';
import { TimerManager } from './TimerManager.js';
import { TurnManager } from './TurnManager.js';
import { ScoreEngine } from './ScoreEngine.js';
import { StoryEngine } from '../story/StoryEngine.js';
import { StoryLibrary } from '../story/StoryLibrary.js';
import { StorySelector, StoryChoiceOption } from '../story/StorySelector.js';
import { GuessEngine } from '../guessing/GuessEngine.js';
import { DrawingManager } from '../drawing/DrawingManager.js';
import { RoomManager } from '../rooms/RoomManager.js';
import { AuthService } from '../auth/AuthService.js';
import { MarkdownStoryParser } from '../story/MarkdownStoryParser.js';
import { IdGenerator } from '../utils/idGenerator.js';
import { createLogger } from '../utils/logger.js';
import { stateStore } from '../redis/StateStore.js';
import { CaseRuntime } from '../story/CaseRuntime.js';
import { InvestigationEventAdapter } from '../story/InvestigationEventAdapter.js';
import { InvestigationPromptGenerator } from '../story/InvestigationPromptGenerator.js';

const logger = createLogger('GameEngine');

export type GameEngineCallback = (event: string, payload: unknown, recipientPlayerId?: string) => void;

export class GameEngine {
  private static sessions: Map<string, GameEngine> = new Map();

  private roomId: string;
  private session: AuthoritativeGameSession;
  private stateMachine: GameStateMachine;
  private timerManager: TimerManager;
  private turnManager: TurnManager;
  private storyEngine: StoryEngine | null = null;
  private caseRuntime: CaseRuntime | null = null;
  private broadcastCallback: GameEngineCallback | null = null;
  private drawerDisconnectTimeout: NodeJS.Timeout | null = null;
  private currentInvestigationEvent: InvestigationEvent | null = null;
  private hintTimeouts: NodeJS.Timeout[] = [];

  constructor(room: Room, story: StoryDefinition | null, broadcastCallback: GameEngineCallback) {
    this.roomId = room.roomId;
    this.broadcastCallback = broadcastCallback;
    this.stateMachine = new GameStateMachine(GameStatus.LOBBY);
    this.timerManager = new TimerManager();
    this.turnManager = new TurnManager(room.players);
    if (story) {
      this.storyEngine = new StoryEngine(story);
    }

    this.session = {
      id: IdGenerator.generateSessionId(),
      roomId: room.roomId,
      storyId: story ? story.id : '',
      state: GameStatus.LOBBY,
      currentAct: 1,
      turnIndex: 0,
      storyChooserPlayerId: null,
      offeredStoryOptions: null,
      currentDrawerId: null,
      activePromptOptions: null,
      selectedEvent: null,
      roundStartedAt: null,
      roundEndsAt: null,
      storyVariables: story ? story.initialVariables : {},
      solvedEvents: [],
      turnOrder: this.turnManager.getTurnOrder(),
      drawerTurnIndex: 0,
      drawingStrokes: [],
      finalTheories: {},
      ending: null,
      retiredEventIds: [],
      usedWordObjectives: [],
      offeredPromptHistory: [],
      lastRoundOutcome: null,
      // Case model fields
      narrativeLog: [],
      evidenceBoard: [],
      suspects: [],
      caseProgress: null,
      discussionVotes: [],
      discussionOptions: null,
      storyContext: null,
      investigationObjective: null,
      clueHint: null,
      revealedLetters: null,
    };

    GameEngine.sessions.set(this.roomId, this);
  }

  public static getEngine(roomId: string): GameEngine | null {
    return this.sessions.get(roomId) || null;
  }

  public static removeEngine(roomId: string): void {
    const engine = this.sessions.get(roomId);
    if (engine) {
      engine.timerManager.cancelTimer();
      engine.clearHintTimeouts();
      this.sessions.delete(roomId);
    }
  }

  private clearHintTimeouts(): void {
    for (const t of this.hintTimeouts) {
      clearTimeout(t);
    }
    this.hintTimeouts = [];
  }

  public getSession(): AuthoritativeGameSession {
    return this.session;
  }

  public getStateMachine(): GameStateMachine {
    return this.stateMachine;
  }

  /**
   * Starts the game from LOBBY into COUNTDOWN -> STORY_SELECTION
   */
  public async startGame(hostPlayerId: string): Promise<void> {
    const room = RoomManager.getRoomOrThrow(this.roomId);
    AuthService.assertHost(room.players.find((p) => p.playerId === hostPlayerId)!);

    if (room.players.length < config.gameplay.minPlayersToStart) {
      const err = new Error(`Need at least ${config.gameplay.minPlayersToStart} players to start`);
      (err as any).code = ErrorCode.NOT_ENOUGH_PLAYERS;
      throw err;
    }

    // For custom hosted rooms (not quick match / online matchmaking), ALL non-host players must be ready!
    const isQuickMatch = Boolean((room.settings as any)?.isQuickMatch || (room as any)?.isQuickMatch);
    if (!isQuickMatch) {
      const nonHostPlayers = room.players.filter(
        (p) => p.playerId !== hostPlayerId && !p.isHost && p.isConnected
      );
      const unreadyPlayers = nonHostPlayers.filter((p) => !p.isReady);
      if (unreadyPlayers.length > 0) {
        const names = unreadyPlayers.map((p) => p.displayName).join(', ');
        const err = new Error(
          `Cannot commence investigation: All detectives must be ready! Waiting for: ${names}`
        );
        (err as any).code = ErrorCode.NOT_ALL_READY;
        throw err;
      }
    }

    this.stateMachine.transition(GameStatus.COUNTDOWN);
    this.session.state = GameStatus.COUNTDOWN;
    RoomManager.updateRoomStatus(this.roomId, 'IN_GAME');

    this.emit('GAME_STARTING', { countdownSeconds: 1 });

    // 1-second countdown before starting directly into the case
    this.timerManager.startTimer('lobby_countdown', 1, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.startDirectGame();
    });
  }

  /**
   * Starts game directly into the investigation without 15s option chooser delay.
   * Always picks a random case from the 120 catalog stories.
   */
  public startDirectGame(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    const room = RoomManager.getRoomOrThrow(this.roomId);
    StoryLibrary.ensureInitialized();

    const rawGenre =
      (room.settings as any)?.genre ||
      (room.settings as any)?.storyGenre ||
      (room.settings as any)?.selectedCaseId ||
      room.settings?.storyId;
    const genreSetting = rawGenre && rawGenre !== 'midnight_museum' ? rawGenre : 'all';

    let selectedStory: StoryDefinition | null = null;

    // Only do a direct story lookup if the setting looks like an actual story ID (e.g. "story_042")
    if (genreSetting && /^story_\d+/i.test(genreSetting)) {
      selectedStory = StoryLibrary.getStory(genreSetting);
    }

    // Otherwise, use StorySelector to pick a random story from the 120 catalog,
    // filtered by genre if a genre was specified
    if (!selectedStory) {
      const genreFilter = genreSetting || 'all';
      const options = StorySelector.getRandomStories(1, genreFilter);
      if (options.length > 0) {
        selectedStory = StoryLibrary.getStory(options[0].storyId);
      }
    }

    // Ultimate fallback: pick any story from the catalog
    if (!selectedStory) {
      const allCatalog = StoryLibrary.getCatalogStories();
      if (allCatalog.length > 0) {
        selectedStory = allCatalog[Math.floor(Math.random() * allCatalog.length)];
      } else {
        selectedStory = StoryLibrary.getAllStories()[0];
      }
    }

    logger.info('Starting game directly with selected case', {
      storyId: selectedStory.id,
      title: selectedStory.title,
      genre: selectedStory.genre,
    });

    this.lockAndStartStory(selectedStory);
  }

  /**
   * Step 1 of Gameplay: Selects 1 random player and gives them 3 random story choices
   */
  public beginStorySelection(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    const room = RoomManager.getRoomOrThrow(this.roomId);
    StoryLibrary.ensureInitialized();

    this.stateMachine.transition(GameStatus.STORY_SELECTION);
    this.session.state = GameStatus.STORY_SELECTION;

    // Pick 1 random player
    const chooser = StorySelector.selectRandomStoryChooser(room.players);
    this.session.storyChooserPlayerId = chooser.playerId;

    // Pick 3 random distinct stories (optionally filtered by room genre setting)
    const rawGenre =
      (room.settings as any)?.genre ||
      (room.settings as any)?.storyGenre ||
      (room.settings as any)?.selectedCaseId ||
      room.settings?.storyId;
    const genreSetting = rawGenre && rawGenre !== 'midnight_museum' ? rawGenre : 'all';
    const options = StorySelector.getRandomStories(3, genreSetting);
    this.session.offeredStoryOptions = options;


    logger.info('Story selection started', {
      chooserPlayerId: chooser.playerId,
      chooserName: chooser.displayName,
      optionsCount: options.length,
    });

    // Broadcast to room that chooser is picking (WITHOUT leaking the choices)
    this.emit('STORY_CHOOSER_SELECTED', {
      chooserPlayerId: chooser.playerId,
      chooserName: chooser.displayName,
      timeLimitSeconds: 20,
    });

    // Unicast the 3 secret story choices ONLY to the chooser
    this.emit(
      'STORY_OPTIONS',
      {
        options,
        timeLimitSeconds: 20,
      },
      chooser.playerId
    );

    // 20-second timer for player to pick
    this.timerManager.startTimer('story_selection', 20, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.autoSelectStory();
    });
  }

  /**
   * Story chooser picks one of the 3 stories
   */
  public chooseStory(playerId: string, storyId: string): void {
    if (this.session.state !== GameStatus.STORY_SELECTION) {
      const err = new Error('Not currently in story selection phase');
      (err as any).code = ErrorCode.INVALID_GAME_STATE;
      throw err;
    }

    if (this.session.storyChooserPlayerId !== playerId) {
      const err = new Error('Only the chosen player can select the story');
      (err as any).code = ErrorCode.NOT_AUTHORIZED;
      throw err;
    }

    const selectedStory = StorySelector.validateStorySelection(storyId, this.session.offeredStoryOptions || []);
    if (!selectedStory) {
      const err = new Error('Invalid story choice');
      (err as any).code = ErrorCode.INVALID_PAYLOAD;
      throw err;
    }

    this.timerManager.cancelTimer();
    this.lockAndStartStory(selectedStory);
  }

  private autoSelectStory(): void {
    if (this.session.state === GameStatus.STORY_SELECTION && this.session.offeredStoryOptions?.length) {
      const fallback = StoryLibrary.getStory(this.session.offeredStoryOptions[0].storyId);
      if (fallback) {
        logger.info('Auto-selecting first story due to selection timeout', { title: fallback.title });
        this.lockAndStartStory(fallback);
      }
    }
  }

  private lockAndStartStory(story: StoryDefinition): void {
    this.stateMachine.transition(GameStatus.STORY_SELECTED);
    this.session.state = GameStatus.STORY_SELECTED;
    this.session.storyId = story.id;
    this.storyEngine = new StoryEngine(story);
    this.caseRuntime = new CaseRuntime(story);
    this.session.storyVariables = this.storyEngine.getVariables();

    // Initialize case model data
    this.session.suspects = this.caseRuntime.getSuspects();
    this.session.caseProgress = this.caseRuntime.getCaseProgress();

    // Broadcast chosen story to everyone in the room
    this.emit('STORY_SELECTED', {
      storyId: story.id,
      title: story.title,
      genre: story.genre,
      difficulty: story.difficulty,
      description: story.description,
      overviewSeconds: 0,
    });

    // Directly start the first investigation turn without any 15-20s choosing timer or 12s delay!
    this.turnManager.randomizeFirstDrawer();
    this.beginTurn();
  }

  /**
   * Begins a new turn: advances drawer, generates 3 secret prompt options
   */
  public beginTurn(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    const room = RoomManager.getRoomOrThrow(this.roomId);
    const turnResult = this.turnManager.advanceTurn(room.players);

    if (!turnResult) {
      logger.error('Failed to advance turn; no players available');
      return;
    }

    this.stateMachine.transition(GameStatus.ROUND_START);
    this.session.state = GameStatus.ROUND_START;
    this.session.currentDrawerId = turnResult.drawerId;
    this.session.turnIndex = turnResult.turnIndex;
    this.session.drawingStrokes = [];

    // Clear old strokes in buffer
    DrawingManager.clearTurnStrokes(this.roomId, this.session.turnIndex);

    // Ensure story engine is ready
    if (!this.storyEngine) {
      const catalogStories = StoryLibrary.getCatalogStories();
      const defaultStory = catalogStories.length > 0
        ? catalogStories[Math.floor(Math.random() * catalogStories.length)]
        : StoryLibrary.getAllStories()[0];
      this.storyEngine = new StoryEngine(defaultStory);
      this.session.storyId = defaultStory.id;
      this.session.storyVariables = this.storyEngine.getVariables();
    }

    // Deduplication & sequential story progression: get next chronological event directly
    let selectedEvent: StoryEvent | null = null;
    let investigationEvent: InvestigationEvent | null = null;

    if (this.caseRuntime) {
      investigationEvent = this.caseRuntime.getChronologicalEvent(
        this.session.turnIndex,
        this.session.retiredEventIds
      );
      selectedEvent = investigationEvent;
    }

    if (!selectedEvent) {
      const solvedSet = new Set(this.session.solvedEvents.map((e) => e.eventId));
      const retiredSet = new Set(this.session.retiredEventIds || []);
      const usedWordSet = new Set((this.session.usedWordObjectives || []).map((w) => w.toLowerCase().trim()));
      const offeredWordSet = new Set((this.session.offeredPromptHistory || []).map((w) => w.toLowerCase().trim()));

      const promptChoices = this.storyEngine.generateThreePromptChoices(
        this.session.currentAct,
        solvedSet,
        retiredSet,
        usedWordSet,
        offeredWordSet
      );

      if (!promptChoices) {
        // If no events in current act, check if there's a next act
        if (this.session.currentAct < 3) {
          this.session.currentAct++;
          logger.info(`Advancing to Act ${this.session.currentAct}`);
          return this.beginTurn();
        } else {
          // Story completed, enter final investigation
          return this.startFinalInvestigation();
        }
      }

      selectedEvent = promptChoices.targetEvent;
    }

    this.session.selectedEvent = selectedEvent;
    this.session.activePromptOptions = []; // No distractor prompt choices needed!

    // Enrich with investigation event if CaseRuntime is available, or fallback adapter
    if (this.caseRuntime && investigationEvent) {
      this.currentInvestigationEvent = investigationEvent;
      this.session.selectedEvent.drawerPrompt = investigationEvent.drawerPrompt;
    } else if (this.session.selectedEvent) {
      const adapted = InvestigationEventAdapter.adapt(
        this.session.selectedEvent,
        null,
        this.session.storyId || 'Investigation',
        'Mystery'
      );
      this.currentInvestigationEvent = adapted;
      this.session.selectedEvent.drawerPrompt = adapted.drawerPrompt;
    }

    // Authoritative deduplication: immediately record event and word as retired/used
    if (this.session.selectedEvent && !this.session.retiredEventIds.includes(this.session.selectedEvent.eventId)) {
      this.session.retiredEventIds.push(this.session.selectedEvent.eventId);
    }
    const cleanWord = MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective).toLowerCase().trim();
    if (!this.session.usedWordObjectives.includes(cleanWord)) {
      this.session.usedWordObjectives.push(cleanWord);
    }

    logger.info('Beginning chronological story turn directly into drawing', {
      turnIndex: this.session.turnIndex,
      eventId: this.session.selectedEvent.eventId,
      objective: this.session.selectedEvent.drawingObjective,
      drawerPlayerId: this.session.currentDrawerId,
    });

    // Directly start drawing phase without any intermediate prompt selection modal
    this.startDrawingPhase();
  }

  /**
   * Safe no-op for any legacy clients attempting selectPrompt
   */
  public selectPrompt(playerId: string, optionIndex: number): void {
    logger.info('selectPrompt called (no-op in chronological story flow)', { playerId, optionIndex });
  }

  private startDrawingPhase(): void {
    const room = RoomManager.getRoomOrThrow(this.roomId);
    this.stateMachine.transition(GameStatus.DRAWING);
    this.session.state = GameStatus.DRAWING;

    const drawSeconds = room.settings.drawingTimeLimit || config.gameplay.defaultDrawingTimeSeconds;
    const { startedAt, endsAt } = this.timerManager.startTimer('drawing_round', drawSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.handleRoundTimeout();
    });

    this.session.roundStartedAt = startedAt;
    this.session.roundEndsAt = endsAt;

    const cleanObjective = this.session.selectedEvent?.drawingObjective
      ? MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective)
      : 'Mystery Clue';

    let category = 'Crime Scene Evidence';
    const combined = ((this.session.selectedEvent?.hint || '') + ' ' + cleanObjective).toLowerCase();
    if (combined.includes('photo') || combined.includes('video') || combined.includes('diary') || combined.includes('letter') || combined.includes('note')) {
      category = 'Personal Memory & Record';
    } else if (combined.includes('key') || combined.includes('cutter') || combined.includes('knife') || combined.includes('poison') || combined.includes('gun') || combined.includes('safe') || combined.includes('lock')) {
      category = 'Crime Tool & Evidence';
    } else if (combined.includes('fare') || combined.includes('train') || combined.includes('car') || combined.includes('ticket') || combined.includes('station') || combined.includes('passenger')) {
      category = 'Transit & Travel';
    } else if (combined.includes('diamond') || combined.includes('painting') || combined.includes('coin') || combined.includes('briefcase') || combined.includes('money') || combined.includes('gold')) {
      category = 'Valuable Property';
    } else if (this.session.selectedEvent?.hint) {
      category = this.session.selectedEvent.hint;
    }

    const drawerPrompt = this.currentInvestigationEvent?.drawerPrompt
      || this.session.selectedEvent?.drawerPrompt
      || 'You examine the crime scene carefully and discover a key piece of evidence. Draw what you discovered.';

    this.clearHintTimeouts();

    const words = cleanObjective.split(/\s+/).filter(Boolean);
    const wordLengths = words.map((w) => w.length);
    const firstLetters = words.map((w) => w[0]?.toUpperCase() || '');

    const revealedLetters: Array<Array<string | null>> = words.map((w) =>
      new Array(w.length).fill(null)
    );

    // Plan progressive reveal steps (skribbl.io style: dynamic reveals at distributed positions over time)
    interface HintRevealStep {
      wordIndex: number;
      charIndex: number;
      letter: string;
      triggerAtSecond: number;
    }
    const revealSteps: HintRevealStep[] = [];

    words.forEach((w, wIdx) => {
      const L = w.length;
      if (L <= 2) return;
      const maxReveals = Math.min(L - 1, Math.max(1, Math.floor(L / 2)));
      const chosenIndices: number[] = [0];

      if (maxReveals >= 2 && L >= 4) {
        const mid = Math.floor(L / 2);
        if (!chosenIndices.includes(mid)) chosenIndices.push(mid);
      }
      if (maxReveals >= 3 && L >= 6) {
        const later = L - 1;
        if (!chosenIndices.includes(later)) chosenIndices.push(later);
      }
      if (maxReveals >= 4 && L >= 8) {
        const earlier = 2;
        if (!chosenIndices.includes(earlier)) chosenIndices.push(earlier);
      }

      chosenIndices.forEach((cIdx) => {
        revealSteps.push({
          wordIndex: wIdx,
          charIndex: cIdx,
          letter: w[cIdx].toUpperCase(),
          triggerAtSecond: 0,
        });
      });
    });

    const totalSteps = revealSteps.length;
    const minPercent = 0.15;
    const maxPercent = 0.82;
    revealSteps.forEach((step, idx) => {
      const fraction = totalSteps === 1
        ? 0.35
        : minPercent + ((maxPercent - minPercent) * idx) / (totalSteps - 1);
      step.triggerAtSecond = Math.max(8, Math.round(drawSeconds * fraction));
    });

    revealSteps.sort((a, b) => a.triggerAtSecond - b.triggerAtSecond);

    revealSteps.forEach((step) => {
      const delayMs = step.triggerAtSecond * 1000;
      const t = setTimeout(() => {
        if (!GameEngine.getEngine(this.roomId) || !this.stateMachine.isDrawingActive()) return;
        if (!this.session.revealedLetters) return;

        this.session.revealedLetters[step.wordIndex][step.charIndex] = step.letter;
        this.emit('HINT_LETTER_REVEALED', {
          revealedLetters: this.session.revealedLetters,
          wordIndex: step.wordIndex,
          charIndex: step.charIndex,
          letter: step.letter,
        });
      }, delayMs);
      this.hintTimeouts.push(t);
    });

    this.session.revealedLetters = revealedLetters;

    // Build sanitized story context & detective objective (Information Balance Rule)
    const rawStoryContext = this.currentInvestigationEvent?.narrativeContext
      || this.session.selectedEvent?.narrativeContext
      || this.session.selectedEvent?.narrativeDescription
      || 'Detectives are investigating the crime scene for unexplained evidence.';

    const storyContext = InvestigationPromptGenerator.sanitizeForPrompt(
      rawStoryContext,
      cleanObjective,
      this.currentInvestigationEvent?.acceptedAnswers
    );

    const investigationObjective = this.currentInvestigationEvent?.investigationObjective
      || InvestigationEventAdapter.generateInvestigationObjective(
        this.currentInvestigationEvent?.promptType || 'OBJECT',
        this.caseRuntime?.getCaseProgress()?.caseSetting
      );

    const rawClueHint = this.currentInvestigationEvent?.hint
      || this.session.selectedEvent?.hint
      || null;

    const clueHint = rawClueHint
      ? InvestigationPromptGenerator.sanitizeForPrompt(
          rawClueHint,
          cleanObjective,
          this.currentInvestigationEvent?.acceptedAnswers
        )
      : null;

    this.session.storyContext = storyContext;
    this.session.investigationObjective = investigationObjective;
    this.session.clueHint = clueHint;
    this.session.hint = clueHint || category;
    this.session.category = category;

    // Send secret objective to Drawer — includes contextual drawing prompt + canonical answer + story context
    this.emit(
      'SECRET_DRAW_OBJECTIVE',
      {
        objective: this.session.selectedEvent!.drawingObjective,
        hint: this.session.selectedEvent!.hint,
        visualElements: this.session.selectedEvent!.visualElements,
        timeLimitSeconds: drawSeconds,
        drawerPrompt,
        canonicalAnswer: this.session.selectedEvent!.drawingObjective,
        narrativeContext: this.currentInvestigationEvent?.narrativeContext || null,
        storyContext,
      },
      this.session.currentDrawerId!
    );

    // Broadcast drawing started to all guessers with story context, investigation objective, clue hint, and letter hints
    this.emit('DRAWING_STARTED', {
      drawerPlayerId: this.session.currentDrawerId,
      turnIndex: this.session.turnIndex,
      roundStartedAt: startedAt,
      roundEndsAt: endsAt,
      timeLimitSeconds: drawSeconds,
      hint: clueHint || category,
      clueHint,
      category,
      storyContext,
      investigationObjective,
      wordLengths,
      firstLetters,
      revealedLetters,
      storyId: this.session.storyId,
      caseProgress: this.caseRuntime?.getCaseProgress() || null,
    });
  }

  public isDrawingActive(): boolean {
    return this.stateMachine.isDrawingActive();
  }

  public getCurrentDrawerId(): string | null {
    return this.session.currentDrawerId;
  }

  /**
   * Handles incoming drawing stroke from active drawer
   */
  public async handleStroke(playerId: string, stroke: StrokeChunk): Promise<void> {
    AuthService.assertDrawer(playerId, this.session.currentDrawerId);

    if (!this.stateMachine.isDrawingActive()) {
      const err = new Error('Drawing is not currently active');
      (err as any).code = ErrorCode.DRAWING_NOT_ACTIVE;
      throw err;
    }

    stroke.playerId = playerId;
    stroke.turnIndex = this.session.turnIndex;
    stroke.timestamp = Date.now();

    if (stroke.isComplete !== false) {
      this.session.drawingStrokes.push(stroke);
      await DrawingManager.recordStroke(this.roomId, this.session.turnIndex, stroke);
    }

    // Broadcast stroke to all players
    this.emit('DRAW_STROKE', stroke);
  }

  /**
   * Synchronizes undo across active game session
   */
  public handleUndo(playerId: string, updatedStrokes?: any[]): void {
    AuthService.assertDrawer(playerId, this.session.currentDrawerId);
    if (!this.stateMachine.isDrawingActive()) return;

    if (Array.isArray(updatedStrokes)) {
      this.session.drawingStrokes = updatedStrokes;
    } else if (this.session.drawingStrokes.length > 0) {
      this.session.drawingStrokes.pop();
    }
  }

  /**
   * Drawer clears canvas
   */
  public async handleClear(playerId: string): Promise<void> {
    AuthService.assertDrawer(playerId, this.session.currentDrawerId);

    if (!this.stateMachine.isDrawingActive()) return;

    this.session.drawingStrokes = [];
    await DrawingManager.clearTurnStrokes(this.roomId, this.session.turnIndex);

    this.emit('DRAW_CLEAR', { turnIndex: this.session.turnIndex });
  }

  /**
   * Evaluates a guess from a player
   */
  public async handleGuess(playerId: string, rawGuess: string): Promise<void> {
    AuthService.assertGuesser(playerId, this.session.currentDrawerId);

    if (!this.stateMachine.isDrawingActive()) {
      if (this.session.state === GameStatus.PROMPT_SELECTION) {
        this.emit(
          'GUESS_FEEDBACK',
          { status: 'WAITING', message: 'Drawer is selecting a secret clue... Guessing starts in a moment!' },
          playerId
        );
        return;
      }
      if (
        this.session.state === GameStatus.CLUE_SOLVED ||
        this.session.state === GameStatus.STORY_REVEAL ||
        this.session.state === GameStatus.EVIDENCE_DISCOVERED ||
        this.session.state === GameStatus.DISCUSSION ||
        this.session.state === GameStatus.CASE_INTRO ||
        this.session.state === GameStatus.TRUTH_REVEAL ||
        this.session.state === GameStatus.NEXT_TURN
      ) {
        this.emit(
          'GUESS_FEEDBACK',
          { status: 'WAITING', message: 'Round completed! Preparing next investigator turn...' },
          playerId
        );
        return;
      }
      const err = new Error('Guessing is not currently active');
      (err as any).code = ErrorCode.GUESS_NOT_ALLOWED;
      throw err;
    }

    const { allowed, reason } = await GuessEngine.canSubmitGuess(playerId, rawGuess);
    if (!allowed) {
      if (reason === 'RATE_LIMITED') {
        this.emit('ERROR', { code: ErrorCode.RATE_LIMITED, message: 'Slow down! Guess rate limit reached.' }, playerId);
      }
      return;
    }

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const player = room.players.find((p) => p.playerId === playerId);
    if (!player) return;

    const evaluation = GuessEngine.evaluate(rawGuess, this.session.selectedEvent!);

    if (evaluation.verdict === 'CORRECT') {
      // Concurrency lock: ensure only ONE player wins FIRST_SOLVER
      const lockToken = await stateStore.acquireLock(`lock:solve:${this.roomId}:${this.session.turnIndex}`, 2000);
      if (!lockToken) {
        // Round was already solved in this tick
        logger.info('Guess arrived right after solve lock; awarding secondary feedback', { playerId });
        this.emit('PUBLIC_GUESS', { playerId, playerName: player.displayName, guess: rawGuess, isClose: true });
        return;
      }

      await this.handleCorrectSolve(player, lockToken);
    } else if (evaluation.verdict === 'CLOSE') {
      // Private feedback to guesser: "Almost..."
      this.emit('GUESS_FEEDBACK', { status: 'CLOSE', message: evaluation.feedbackMessage }, playerId);
      // Public broadcast in room chat with close tag
      this.emit('PUBLIC_GUESS', { playerId, playerName: player.displayName, guess: rawGuess, isClose: true });
    } else {
      // Normal wrong guess in public chat
      this.emit('PUBLIC_GUESS', { playerId, playerName: player.displayName, guess: rawGuess, isClose: false });
    }
  }

  private async handleCorrectSolve(solver: Player, lockToken: string): Promise<void> {
    this.timerManager.cancelTimer();
    this.clearHintTimeouts();
    this.stateMachine.transition(GameStatus.CLUE_SOLVED);
    this.session.state = GameStatus.CLUE_SOLVED;

    this.emit('DRAWING_ENDED', { turnIndex: this.session.turnIndex, reason: 'SOLVED' });

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const drawer = room.players.find((p) => p.playerId === this.session.currentDrawerId)!;
    const remainingSeconds = this.timerManager.getRemainingSeconds();
    const duration = room.settings.drawingTimeLimit || config.gameplay.defaultDrawingTimeSeconds;

    const scoreAward = ScoreEngine.calculateRoundScore(
      this.session.selectedEvent!,
      duration,
      remainingSeconds,
      solver.playerId,
      drawer.playerId
    );

    solver.score += scoreAward.solverPoints;
    solver.correctGuesses++;
    drawer.score += scoreAward.drawerPoints;

    const solvedRecord: SolvedEventRecord = {
      eventId: this.session.selectedEvent!.eventId,
      solverPlayerId: solver.playerId,
      drawerPlayerId: drawer.playerId,
      turnIndex: this.session.turnIndex,
      timeToSolveMs: scoreAward.timeToSolveMs,
      pointsAwardedSolver: scoreAward.solverPoints,
      pointsAwardedDrawer: scoreAward.drawerPoints,
      revealedText: this.session.selectedEvent!.consequenceReveal,
      evidenceTitle: this.session.selectedEvent!.drawingObjective,
      evidenceReveal: this.currentInvestigationEvent?.evidenceReveal || this.session.selectedEvent!.consequenceReveal,
    };

    this.session.solvedEvents.push(solvedRecord);

    // Apply story variables
    this.session.storyVariables = this.storyEngine!.applyEventConsequence(this.session.selectedEvent!);

    // Record evidence in CaseRuntime
    if (this.caseRuntime && this.currentInvestigationEvent) {
      const { evidenceCard, narrativePassage } = this.caseRuntime.recordEvidenceDiscovery(
        this.currentInvestigationEvent,
        solver.playerId,
        solver.displayName,
        drawer.playerId,
        drawer.displayName,
        this.session.turnIndex
      );

      // Update session state
      this.session.evidenceBoard = this.caseRuntime.getEvidenceBoard();
      this.session.narrativeLog = this.caseRuntime.getNarrativeLog();
      this.session.caseProgress = this.caseRuntime.getCaseProgress();

      // Emit evidence card to all players
      this.emit('EVIDENCE_CARD', { evidenceCard });
      this.emit('NARRATIVE_PASSAGE', { passage: narrativePassage });
      this.emit('CASE_PROGRESS', { caseProgress: this.session.caseProgress });
    }

    // Broadcast clue solved (keep existing event for backward compat)
    this.emit('CLUE_SOLVED', {
      solverPlayerId: solver.playerId,
      solverName: solver.displayName,
      drawerPlayerId: drawer.playerId,
      drawerName: drawer.displayName,
      solvedObjective: this.session.selectedEvent!.drawingObjective,
      scoreAward,
      updatedScores: Object.fromEntries(room.players.map((p) => [p.playerId, p.score])),
    });

    await stateStore.releaseLock(`lock:solve:${this.roomId}:${this.session.turnIndex}`, lockToken);

    // Transition to evidence discovered / story reveal after brief 1s pause
    this.timerManager.startTimer('solve_transition', 1, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.showStoryReveal(solvedRecord);
    });
  }

  private showStoryReveal(record: SolvedEventRecord): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;

    // Use EVIDENCE_DISCOVERED state when CaseRuntime is active, otherwise fallback to STORY_REVEAL
    const useEvidenceState = !!this.caseRuntime;
    if (useEvidenceState) {
      this.stateMachine.transition(GameStatus.EVIDENCE_DISCOVERED);
      this.session.state = GameStatus.EVIDENCE_DISCOVERED;
    } else {
      this.stateMachine.transition(GameStatus.STORY_REVEAL);
      this.session.state = GameStatus.STORY_REVEAL;
    }

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const solver = room.players.find((p) => p.playerId === record.solverPlayerId);
    const drawer = room.players.find((p) => p.playerId === record.drawerPlayerId);
    const revealSeconds = config.gameplay.defaultStoryRevealSeconds;

    // Emit EVIDENCE_DISCOVERED for the new model (with narrative reveal)
    if (useEvidenceState) {
      this.emit('EVIDENCE_DISCOVERED', {
        eventId: record.eventId,
        evidenceTitle: record.evidenceTitle || record.revealedText,
        evidenceReveal: record.evidenceReveal || record.revealedText,
        revealedText: record.revealedText,
        storyVariables: this.session.storyVariables,
        solvedCount: this.session.solvedEvents.length,
        solverName: solver?.displayName || 'Detective',
        drawerName: drawer?.displayName || 'The Artist',
        storyTitle: this.storyEngine?.getStory()?.title || this.session.storyId || 'Case Mystery',
        revealSeconds,
        caseProgress: this.session.caseProgress,
      });
    }

    // Also emit existing STORY_REVEAL for backward compat
    this.emit('STORY_REVEAL', {
      eventId: record.eventId,
      revealedText: record.revealedText,
      storyVariables: this.session.storyVariables,
      solvedCount: this.session.solvedEvents.length,
      solvedObjective: this.session.selectedEvent ? this.session.selectedEvent.drawingObjective : null,
      solverName: solver?.displayName || 'Detective',
      drawerName: drawer?.displayName || 'The Artist',
      storyTitle: this.storyEngine?.getStory()?.title || this.session.storyId || 'Case Mystery',
      revealSeconds,
    });

    this.timerManager.startTimer('story_reveal', revealSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.continueAfterEvidenceReveal(record, solver?.displayName);
    });
  }

  private continueAfterEvidenceReveal(record: SolvedEventRecord, solverName?: string): void {
    const cleanWord = this.session.selectedEvent?.drawingObjective
      ? MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective)
      : 'Mystery Clue';

    if (this.caseRuntime && this.currentInvestigationEvent && this.caseRuntime.shouldTriggerDiscussion(this.currentInvestigationEvent)) {
      this.startDiscussion();
    } else {
      this.advanceToNextTurn(
        true,
        cleanWord,
        record.solverPlayerId,
        solverName,
        { solverPoints: record.pointsAwardedSolver, drawerPoints: record.pointsAwardedDrawer }
      );
    }
  }

  private handleRoundTimeout(): void {
    this.clearHintTimeouts();
    logger.info('Round timed out without solve', { turnIndex: this.session.turnIndex });
    if (this.session.selectedEvent) {
      const cleanWord = MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective);
      if (!this.session.retiredEventIds.includes(this.session.selectedEvent.eventId)) {
        this.session.retiredEventIds.push(this.session.selectedEvent.eventId);
      }
      if (!this.session.usedWordObjectives.includes(cleanWord.toLowerCase().trim())) {
        this.session.usedWordObjectives.push(cleanWord.toLowerCase().trim());
      }
    }
    const cleanWord = this.session.selectedEvent?.drawingObjective
      ? MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective)
      : 'Secret Clue';

    this.emit('DRAWING_ENDED', { turnIndex: this.session.turnIndex, reason: 'TIMEOUT', revealedObjective: cleanWord });
    this.advanceToNextTurn(false, cleanWord);
  }

  /** Allows only the active drawer to finish early and advances the shared turn. */
  public endDrawing(playerId: string): void {
    AuthService.assertDrawer(playerId, this.session.currentDrawerId);
    if (!this.stateMachine.isDrawingActive()) {
      const err = new Error('Drawing is not currently active');
      (err as any).code = ErrorCode.DRAWING_NOT_ACTIVE;
      throw err;
    }

    this.timerManager.cancelTimer();
    if (this.session.selectedEvent) {
      const cleanWord = MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective);
      if (!this.session.retiredEventIds.includes(this.session.selectedEvent.eventId)) {
        this.session.retiredEventIds.push(this.session.selectedEvent.eventId);
      }
      if (!this.session.usedWordObjectives.includes(cleanWord.toLowerCase().trim())) {
        this.session.usedWordObjectives.push(cleanWord.toLowerCase().trim());
      }
    }
    const cleanWord = this.session.selectedEvent?.drawingObjective
      ? MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective)
      : 'Secret Clue';

    this.emit('DRAWING_ENDED', { turnIndex: this.session.turnIndex, reason: 'DRAWER_FINISHED', revealedObjective: cleanWord });
    this.advanceToNextTurn(false, cleanWord);
  }

  private advanceToNextTurn(
    wasSolved = false,
    revealedWord?: string,
    solverId?: string,
    solverName?: string,
    scoreAward?: any
  ): void {
    if (
      this.session.state === GameStatus.NEXT_TURN ||
      this.session.state === GameStatus.FINAL_INVESTIGATION ||
      this.session.state === GameStatus.ENDING ||
      this.session.state === GameStatus.GAME_COMPLETE
    ) {
      logger.warn('advanceToNextTurn ignored because game is already in next turn or finished', {
        state: this.session.state,
      });
      return;
    }

    if (this.drawerDisconnectTimeout) {
      clearTimeout(this.drawerDisconnectTimeout);
      this.drawerDisconnectTimeout = null;
    }

    this.emit('TURN_ENDED', {
      completedTurnIndex: this.session.turnIndex,
      drawerPlayerId: this.session.currentDrawerId,
    });

    this.stateMachine.transition(GameStatus.NEXT_TURN);
    this.session.state = GameStatus.NEXT_TURN;

    const room = RoomManager.getRoomOrThrow(this.roomId);

    // Check if max rounds reached (roundsPerGame * playerCount)
    const totalRequiredTurns = Math.max(1, room.settings.roundsPerGame || 1) * Math.max(1, room.players.length);
    if (this.session.turnIndex >= totalRequiredTurns - 1) {
      return this.startFinalInvestigation();
    }

    const prevDrawer = room.players.find((p) => p.playerId === this.session.currentDrawerId);
    const nextDrawer = this.turnManager.peekNextDrawer(room.players);
    const finalRevealedWord =
      revealedWord ||
      (this.session.selectedEvent
        ? MarkdownStoryParser.cleanToClueWord(this.session.selectedEvent.drawingObjective)
        : 'Secret Clue');

    const transitionSeconds = 4;
    const recap = {
      completedTurnIndex: this.session.turnIndex,
      previousDrawerId: prevDrawer?.playerId || this.session.currentDrawerId || '',
      previousDrawerName: prevDrawer?.displayName || 'The Artist',
      revealedObjective: finalRevealedWord,
      solved: Boolean(wasSolved),
      solverPlayerId: solverId,
      solverName: solverName,
      scoreAward,
      nextDrawerPlayerId: nextDrawer?.playerId || '',
      nextDrawerName: nextDrawer?.displayName || 'Next Detective',
      nextTurnInSeconds: transitionSeconds,
    };

    this.session.lastRoundOutcome = recap;

    this.emit('NEXT_TURN', recap);

    this.timerManager.startTimer('next_turn_delay', transitionSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.beginTurn();
    });
  }

  /**
   * Final Investigation: players submit final deduction theories
   */
  public startFinalInvestigation(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    this.stateMachine.transition(GameStatus.FINAL_INVESTIGATION);
    this.session.state = GameStatus.FINAL_INVESTIGATION;

    const investigationSeconds = 60;
    this.timerManager.startTimer('final_investigation', investigationSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.startTruthReveal();
    });

    // Enrich final investigation with case data
    const caseData = this.caseRuntime?.getFinalInvestigationData();

    this.emit('FINAL_INVESTIGATION', {
      storyId: this.session.storyId,
      storyTitle: this.storyEngine?.getStory()?.title || this.session.storyId,
      solvedEvents: this.session.solvedEvents,
      storyVariables: this.session.storyVariables,
      timeLimitSeconds: investigationSeconds,
      // Case model enrichments
      investigationPrompt: caseData?.prompt || 'Who is responsible? Submit your final theory.',
      suspects: caseData?.suspects || this.session.suspects,
      evidenceBoard: caseData?.evidenceBoard || this.session.evidenceBoard,
      narrativeLog: caseData?.narrativeLog || this.session.narrativeLog,
      caseProgress: caseData?.caseProgress || this.session.caseProgress,
    });
  }

  public submitFinalTheory(playerId: string, answer: string, confidence: number): void {
    if (this.session.state !== GameStatus.FINAL_INVESTIGATION) {
      const err = new Error('Not in Final Investigation state');
      (err as any).code = ErrorCode.INVALID_GAME_STATE;
      throw err;
    }

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const player = room.players.find((p) => p.playerId === playerId);
    if (!player) throw new Error('Player not in room');

    this.session.finalTheories[playerId] = {
      answer,
      confidence,
      submittedAt: Date.now(),
    };

    logger.info(`Final theory submitted by ${player.displayName}`, { answer, confidence });

    // If all online players submitted, advance to truth reveal early
    const onlinePlayers = room.players.filter((p) => p.isConnected);
    if (Object.keys(this.session.finalTheories).length >= onlinePlayers.length) {
      this.timerManager.cancelTimer();
      this.startTruthReveal();
    }
  }

  /**
   * TRUTH_REVEAL: Shows the complete story truth before ending.
   */
  private startTruthReveal(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    this.stateMachine.transition(GameStatus.TRUTH_REVEAL);
    this.session.state = GameStatus.TRUTH_REVEAL;

    const truthRevealSeconds = config.gameplay.defaultTruthRevealSeconds;

    // Assemble complete truth from CaseRuntime
    const truthData = this.caseRuntime?.assembleTruthReveal();

    this.emit('TRUTH_REVEAL', {
      storyId: this.session.storyId,
      storyTitle: this.storyEngine?.getStory()?.title || this.session.storyId,
      fullTruth: truthData?.fullTruth || 'The truth has been revealed.',
      timeline: truthData?.timeline || [],
      culprit: truthData?.culprit || 'Unknown',
      motive: truthData?.motive || 'Unknown',
      method: truthData?.method || 'Unknown',
      discoveredEvidence: truthData?.discoveredEvidence || this.session.evidenceBoard,
      missedEvents: truthData?.missedEvents || [],
      correctTheory: truthData?.correctTheory || '',
      finalTheories: this.session.finalTheories,
      solvedEvents: this.session.solvedEvents,
      timeLimitSeconds: truthRevealSeconds,
    });

    // Add conclusion narrative
    if (this.caseRuntime) {
      const conclusionPassage = {
        id: `conclusion_${this.session.storyId}`,
        text: truthData?.fullTruth || 'The case is now closed.',
        type: 'CONCLUSION' as const,
        timestamp: Date.now(),
      };
      this.session.narrativeLog = [...this.session.narrativeLog, conclusionPassage];
    }

    this.timerManager.startTimer('truth_reveal', truthRevealSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.resolveEnding();
    });
  }

  private resolveEnding(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    this.stateMachine.transition(GameStatus.ENDING);
    this.session.state = GameStatus.ENDING;

    let ending = this.storyEngine ? this.storyEngine.determineEnding() : null;
    if (!ending) {
      // Determine verdict from case progress
      const progress = this.caseRuntime?.getCaseProgress();
      const verdict = progress && progress.percentage >= 80 ? 'MASTER_DETECTIVE'
        : progress && progress.percentage >= 50 ? 'PARTIAL_SOLUTION'
        : 'COLD_CASE';

      ending = {
        endingId: 'case_closed',
        title: verdict === 'MASTER_DETECTIVE' ? 'Master Detectives'
          : verdict === 'PARTIAL_SOLUTION' ? 'Partial Solution'
          : 'Cold Case',
        conditionDescription: 'Based on investigation progress',
        requiredVariables: {},
        narrativeText: 'The detectives completed the investigation docket.',
        verdict,
      };
    }
    this.session.ending = ending;

    const currentRoom = RoomManager.getRoom(this.roomId);
    const playerLeaderboard = currentRoom
      ? currentRoom.players.map((p) => ({
          playerId: p.playerId,
          displayName: p.displayName,
          avatar: p.avatar,
          score: p.score,
          correctGuesses: p.correctGuesses,
        }))
      : [];

    this.emit('GAME_END', {
      storyId: this.session.storyId,
      storyTitle: this.storyEngine?.getStory()?.title || this.session.storyId,
      ending,
      storyVariables: this.session.storyVariables,
      solvedEvents: this.session.solvedEvents,
      leaderboard: playerLeaderboard,
      // Case model enrichments
      evidenceBoard: this.session.evidenceBoard,
      caseProgress: this.session.caseProgress,
    });

    this.stateMachine.transition(GameStatus.GAME_COMPLETE);
    this.session.state = GameStatus.GAME_COMPLETE;
    RoomManager.updateRoomStatus(this.roomId, 'COMPLETED');
  }

  // ==========================================
  // DISCUSSION SYSTEM
  // ==========================================

  private startDiscussion(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
    if (!this.caseRuntime) return;

    this.stateMachine.transition(GameStatus.DISCUSSION);
    this.session.state = GameStatus.DISCUSSION;

    this.caseRuntime.markDiscussionTriggered();
    this.session.discussionVotes = [];

    const solvedSet = new Set(this.session.solvedEvents.map((e) => e.eventId));
    const retiredSet = new Set(this.session.retiredEventIds || []);
    const options = this.caseRuntime.generateDiscussionOptions(solvedSet, retiredSet);
    this.session.discussionOptions = options;

    const discussionSeconds = config.gameplay.defaultDiscussionSeconds;

    this.emit('DISCUSSION_STARTED', {
      options,
      timeLimitSeconds: discussionSeconds,
      caseProgress: this.session.caseProgress,
      evidenceBoard: this.session.evidenceBoard,
    });

    this.timerManager.startTimer('discussion', discussionSeconds, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.resolveDiscussion();
    });
  }

  public submitDiscussionVote(playerId: string, optionIndex: number): void {
    if (this.session.state !== GameStatus.DISCUSSION) {
      return;
    }

    // Remove any existing vote from this player
    this.session.discussionVotes = this.session.discussionVotes.filter((v) => v.playerId !== playerId);
    this.session.discussionVotes.push({ playerId, optionIndex, timestamp: Date.now() });

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const player = room.players.find((p) => p.playerId === playerId);

    this.emit('DISCUSSION_VOTE', {
      playerId,
      playerName: player?.displayName || 'Detective',
      optionIndex,
      totalVotes: this.session.discussionVotes.length,
    });

    // If all online players voted, resolve early
    const onlinePlayers = room.players.filter((p) => p.isConnected);
    if (this.session.discussionVotes.length >= onlinePlayers.length) {
      this.timerManager.cancelTimer();
      this.resolveDiscussion();
    }
  }

  private resolveDiscussion(): void {
    if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;

    // Tally votes
    const voteCounts: Record<number, number> = {};
    for (const vote of this.session.discussionVotes) {
      voteCounts[vote.optionIndex] = (voteCounts[vote.optionIndex] || 0) + 1;
    }

    const winningOption = Object.entries(voteCounts)
      .sort(([, a], [, b]) => b - a)[0];
    const winningIndex = winningOption ? parseInt(winningOption[0]) : 0;
    const winningText = this.session.discussionOptions?.[winningIndex] || 'Continue investigating';

    this.emit('DISCUSSION_RESULT', {
      winningOption: winningIndex,
      winningText,
      voteCounts,
    });

    // Clean up discussion state
    this.session.discussionOptions = null;
    this.session.discussionVotes = [];

    // Continue to next turn
    this.timerManager.startTimer('post_discussion', 2, () => {
      if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
      this.advanceToNextTurn(true);
    });
  }

  /**
   * Lets players skip cinematic CASE_INTRO / evidence / truth timers.
   * Never blocks the game if called in an unexpected state.
   */
  public skipNarrative(playerId: string): void {
    if (!playerId) return;

    if (this.session.state === GameStatus.CASE_INTRO) {
      this.timerManager.cancelTimer();
      this.turnManager.randomizeFirstDrawer();
      this.beginTurn();
      return;
    }

    if (
      this.session.state === GameStatus.EVIDENCE_DISCOVERED ||
      this.session.state === GameStatus.STORY_REVEAL
    ) {
      this.timerManager.cancelTimer();
      const last = this.session.solvedEvents[this.session.solvedEvents.length - 1];
      if (last) {
        const room = RoomManager.getRoom(this.roomId);
        const solver = room?.players.find((p) => p.playerId === last.solverPlayerId);
        this.continueAfterEvidenceReveal(last, solver?.displayName);
      } else {
        this.advanceToNextTurn(true);
      }
      return;
    }

    if (this.session.state === GameStatus.TRUTH_REVEAL) {
      this.timerManager.cancelTimer();
      this.resolveEnding();
    }
  }

  public handlePlayerDisconnect(playerId: string): void {
    RoomManager.markPlayerConnection(this.roomId, playerId, false);
    this.emit('PLAYER_LEFT', { playerId });

    // Handle Story Chooser disconnect
    if (this.session.state === GameStatus.STORY_SELECTION && this.session.storyChooserPlayerId === playerId) {
      logger.warn('Story chooser disconnected during story selection; reassigning to another player', { playerId });
      const room = RoomManager.getRoom(this.roomId);
      const remaining = room?.players.filter((p) => p.isConnected && p.playerId !== playerId) || [];
      if (remaining.length > 0) {
        const newChooser = remaining[0];
        this.session.storyChooserPlayerId = newChooser.playerId;
        this.emit('STORY_CHOOSER_SELECTED', {
          chooserPlayerId: newChooser.playerId,
          chooserName: newChooser.displayName,
          timeLimitSeconds: 20,
        });
        this.emit(
          'STORY_OPTIONS',
          {
            options: this.session.offeredStoryOptions,
            timeLimitSeconds: 20,
          },
          newChooser.playerId
        );
      }
    }

    if (
      this.session.currentDrawerId === playerId &&
      (this.stateMachine.isDrawingActive() || this.session.state === GameStatus.PROMPT_SELECTION)
    ) {
      logger.warn('Active drawer disconnected during drawing/prompt selection', { playerId });
      this.timerManager.pause();
      this.emit('TIMER_SYNC', { isPaused: true, reason: 'DRAWER_DISCONNECTED', graceSeconds: 12 });

      if (this.drawerDisconnectTimeout) {
        clearTimeout(this.drawerDisconnectTimeout);
      }

      this.drawerDisconnectTimeout = setTimeout(() => {
        this.drawerDisconnectTimeout = null;
        if (!GameEngine.getEngine(this.roomId) || !RoomManager.getRoom(this.roomId)) return;
        const room = RoomManager.getRoom(this.roomId);
        const player = room?.players.find((p) => p.playerId === playerId);
        if (
          player &&
          !player.isConnected &&
          (this.stateMachine.isDrawingActive() || this.session.state === GameStatus.PROMPT_SELECTION)
        ) {
          logger.info('Drawer did not reconnect within 12s; rotating to next player');
          this.advanceToNextTurn();
        }
      }, 12000);
    }
  }

  public handlePlayerReconnect(player: Player): void {
    RoomManager.markPlayerConnection(this.roomId, player.playerId, true);
    this.emit('PLAYER_RECONNECTED', { playerId: player.playerId, displayName: player.displayName });

    if (this.drawerDisconnectTimeout) {
      clearTimeout(this.drawerDisconnectTimeout);
      this.drawerDisconnectTimeout = null;
    }

    if (this.session.currentDrawerId === player.playerId) {
      const res = this.timerManager.resume();
      if (res) {
        this.emit('TIMER_SYNC', { isPaused: false, roundEndsAt: res.endsAt });
      }

      if (this.session.state === GameStatus.PROMPT_SELECTION && this.session.activePromptOptions) {
        this.emit(
          'PROMPT_OPTIONS',
          {
            options: this.session.activePromptOptions,
            timeLimitSeconds: 30,
          },
          player.playerId
        );
      }
    }

    if (
      this.session.state === GameStatus.STORY_SELECTION &&
      this.session.storyChooserPlayerId === player.playerId &&
      this.session.offeredStoryOptions
    ) {
      this.emit(
        'STORY_OPTIONS',
        {
          options: this.session.offeredStoryOptions,
          timeLimitSeconds: 20,
        },
        player.playerId
      );
    }

    if (this.session.state === GameStatus.CASE_INTRO && this.caseRuntime) {
      this.emit(
        'CASE_INTRO',
        {
          ...this.caseRuntime.getCaseIntroData(),
          timeLimitSeconds: Math.max(3, this.timerManager.getRemainingSeconds() || config.gameplay.defaultCaseIntroSeconds),
        },
        player.playerId
      );
    }

    if (this.session.state === GameStatus.DISCUSSION && this.session.discussionOptions) {
      this.emit(
        'DISCUSSION_STARTED',
        {
          options: this.session.discussionOptions,
          timeLimitSeconds: Math.max(3, this.timerManager.getRemainingSeconds() || config.gameplay.defaultDiscussionSeconds),
          caseProgress: this.session.caseProgress,
          evidenceBoard: this.session.evidenceBoard,
        },
        player.playerId
      );
    }

    if (this.session.state === GameStatus.DRAWING && this.session.currentDrawerId === player.playerId) {
      this.emit(
        'SECRET_DRAW_OBJECTIVE',
        {
          objective: this.session.selectedEvent?.drawingObjective,
          hint: this.session.selectedEvent?.hint,
          visualElements: this.session.selectedEvent?.visualElements,
          drawerPrompt: this.currentInvestigationEvent?.drawerPrompt || this.session.selectedEvent?.drawerPrompt || null,
          canonicalAnswer: this.session.selectedEvent?.drawingObjective || null,
          narrativeContext: this.currentInvestigationEvent?.narrativeContext || null,
        },
        player.playerId
      );
    }
  }

  private emit(event: string, payload: unknown, recipientPlayerId?: string): void {
    if (this.broadcastCallback) {
      this.broadcastCallback(event, payload, recipientPlayerId);
    }
  }
}
