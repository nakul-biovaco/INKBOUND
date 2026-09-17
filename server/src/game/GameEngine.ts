import { config } from '../config/index.js';
import {
  AuthoritativeGameSession,
  ErrorCode,
  GameStatus,
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
import { IdGenerator } from '../utils/idGenerator.js';
import { createLogger } from '../utils/logger.js';
import { stateStore } from '../redis/StateStore.js';

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
  private broadcastCallback: GameEngineCallback | null = null;

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
      this.sessions.delete(roomId);
    }
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

    this.stateMachine.transition(GameStatus.COUNTDOWN);
    this.session.state = GameStatus.COUNTDOWN;
    RoomManager.updateRoomStatus(this.roomId, 'IN_GAME');

    this.emit('GAME_STARTING', { countdownSeconds: 1 });

    // 1-second countdown before story selection
    this.timerManager.startTimer('lobby_countdown', 1, () => {
      this.beginStorySelection();
    });
  }

  /**
   * Step 1 of Gameplay: Selects 1 random player and gives them 3 random story choices
   */
  public beginStorySelection(): void {
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
    this.session.storyVariables = this.storyEngine.getVariables();

    logger.info(`Story chosen: "${story.title}" (${story.id})`);

    // Broadcast chosen story to everyone in the room
    this.emit('STORY_SELECTED', {
      storyId: story.id,
      title: story.title,
      genre: story.genre,
      difficulty: story.difficulty,
      description: story.description,
    });

    // Move to round start after a 2-second narrative banner
    this.timerManager.startTimer('story_selected_delay', 2, () => {
      this.turnManager.randomizeFirstDrawer();
      this.beginTurn();
    });
  }

  /**
   * Begins a new turn: advances drawer, generates 3 secret prompt options
   */
  public beginTurn(): void {
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
      const defaultStory = StoryLibrary.getStory('story_01_the_midnight_museum') || StoryLibrary.getAllStories()[0];
      this.storyEngine = new StoryEngine(defaultStory);
      this.session.storyId = defaultStory.id;
      this.session.storyVariables = this.storyEngine.getVariables();
    }

    // Solve check: do we have eligible events left in the story?
    const solvedSet = new Set(this.session.solvedEvents.map((e) => e.eventId));
    const promptChoices = this.storyEngine.generateThreePromptChoices(this.session.currentAct, solvedSet);

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

    this.session.activePromptOptions = promptChoices.options;
    this.session.selectedEvent = promptChoices.targetEvent;

    this.stateMachine.transition(GameStatus.PROMPT_SELECTION);
    this.session.state = GameStatus.PROMPT_SELECTION;

    const selectionSeconds = room.settings.promptSelectionTimeLimit || config.gameplay.defaultPromptSelectionSeconds;
    const { startedAt, endsAt } = this.timerManager.startTimer('prompt_selection', selectionSeconds, () => {
      // Auto-pick option 0 if drawer timed out
      this.autoSelectPrompt();
    });

    this.session.roundStartedAt = startedAt;
    this.session.roundEndsAt = endsAt;

    // Broadcast turn started to everyone (without leaking prompts!)
    this.emit('TURN_STARTED', {
      drawerPlayerId: this.session.currentDrawerId,
      turnIndex: this.session.turnIndex,
      roundStartedAt: startedAt,
      roundEndsAt: endsAt,
      timeLimitSeconds: selectionSeconds,
    });

    // Unicast 3 secret options ONLY to the active drawer
    this.emit(
      'PROMPT_OPTIONS',
      {
        options: this.session.activePromptOptions,
        timeLimitSeconds: selectionSeconds,
      },
      this.session.currentDrawerId
    );
  }

  /**
   * Drawer selects one of the 3 prompt options
   */
  public selectPrompt(playerId: string, optionIndex: number): void {
    AuthService.assertDrawer(playerId, this.session.currentDrawerId);

    if (this.session.state !== GameStatus.PROMPT_SELECTION) {
      const err = new Error('Not currently in prompt selection phase');
      (err as any).code = ErrorCode.INVALID_GAME_STATE;
      throw err;
    }

    if (!this.session.activePromptOptions || !this.session.selectedEvent) {
      const err = new Error('No active prompt options available');
      (err as any).code = ErrorCode.INVALID_PROMPT;
      throw err;
    }

    const chosenOption = this.session.activePromptOptions.find((o) => o.optionIndex === optionIndex) || this.session.activePromptOptions[0];
    if (chosenOption && this.session.selectedEvent) {
      this.session.selectedEvent = {
        ...this.session.selectedEvent,
        drawingObjective: chosenOption.previewText,
        acceptedConcepts: Array.from(
          new Set([
            chosenOption.previewText.toLowerCase(),
            ...this.session.selectedEvent.acceptedConcepts,
          ])
        ),
      };
    }

    this.emit('PROMPT_SELECTED', {
      turnIndex: this.session.turnIndex,
      optionIndex,
    });

    this.timerManager.cancelTimer();
    this.startDrawingPhase();
  }

  private autoSelectPrompt(): void {
    if (this.session.state === GameStatus.PROMPT_SELECTION) {
      logger.info('Auto-selecting prompt for drawer due to timeout');
      this.startDrawingPhase();
    }
  }

  private startDrawingPhase(): void {
    const room = RoomManager.getRoomOrThrow(this.roomId);
    this.stateMachine.transition(GameStatus.DRAWING);
    this.session.state = GameStatus.DRAWING;

    const drawSeconds = room.settings.drawingTimeLimit || config.gameplay.defaultDrawingTimeSeconds;
    const { startedAt, endsAt } = this.timerManager.startTimer('drawing_round', drawSeconds, () => {
      this.handleRoundTimeout();
    });

    this.session.roundStartedAt = startedAt;
    this.session.roundEndsAt = endsAt;

    // Send secret objective to Drawer
    this.emit(
      'SECRET_DRAW_OBJECTIVE',
      {
        objective: this.session.selectedEvent!.drawingObjective,
        hint: this.session.selectedEvent!.hint,
        visualElements: this.session.selectedEvent!.visualElements,
        timeLimitSeconds: drawSeconds,
      },
      this.session.currentDrawerId!
    );

    // Broadcast drawing started to all guessers
    this.emit('DRAWING_STARTED', {
      drawerPlayerId: this.session.currentDrawerId,
      turnIndex: this.session.turnIndex,
      roundStartedAt: startedAt,
      roundEndsAt: endsAt,
      timeLimitSeconds: drawSeconds,
    });
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

    this.session.drawingStrokes.push(stroke);
    await DrawingManager.recordStroke(this.roomId, this.session.turnIndex, stroke);

    // Broadcast stroke to all players except the drawer
    this.emit('DRAW_STROKE', stroke);
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
    };

    this.session.solvedEvents.push(solvedRecord);

    // Apply story variables
    this.session.storyVariables = this.storyEngine!.applyEventConsequence(this.session.selectedEvent!);

    // Broadcast clue solved
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

    // Transition to story reveal after brief 1s pause
    this.timerManager.startTimer('solve_transition', 1, () => {
      this.showStoryReveal(solvedRecord);
    });
  }

  private showStoryReveal(record: SolvedEventRecord): void {
    this.stateMachine.transition(GameStatus.STORY_REVEAL);
    this.session.state = GameStatus.STORY_REVEAL;

    const revealSeconds = config.gameplay.defaultStoryRevealSeconds;

    this.emit('STORY_REVEAL', {
      eventId: record.eventId,
      revealedText: record.revealedText,
      storyVariables: this.session.storyVariables,
      solvedCount: this.session.solvedEvents.length,
      revealSeconds,
    });

    this.timerManager.startTimer('story_reveal', revealSeconds, () => {
      this.advanceToNextTurn();
    });
  }

  private handleRoundTimeout(): void {
    logger.info('Round timed out without solve', { turnIndex: this.session.turnIndex });
    this.emit('DRAWING_ENDED', { turnIndex: this.session.turnIndex, reason: 'TIMEOUT' });
    this.advanceToNextTurn();
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
    this.emit('DRAWING_ENDED', { turnIndex: this.session.turnIndex, reason: 'DRAWER_FINISHED' });
    this.advanceToNextTurn();
  }

  private advanceToNextTurn(): void {
    this.emit('TURN_ENDED', {
      completedTurnIndex: this.session.turnIndex,
      drawerPlayerId: this.session.currentDrawerId,
    });

    this.stateMachine.transition(GameStatus.NEXT_TURN);
    this.session.state = GameStatus.NEXT_TURN;

    const room = RoomManager.getRoomOrThrow(this.roomId);

    // Check if max rounds reached or all 5 events solved
    if (this.session.solvedEvents.length >= 5 || this.session.turnIndex >= room.settings.roundsPerGame - 1) {
      return this.startFinalInvestigation();
    }

    this.emit('NEXT_TURN', {
      completedTurnIndex: this.session.turnIndex,
      nextTurnInSeconds: 3,
    });

    this.timerManager.startTimer('next_turn_delay', 3, () => {
      this.beginTurn();
    });
  }

  /**
   * Final Investigation: players submit final deduction theories
   */
  public startFinalInvestigation(): void {
    this.stateMachine.transition(GameStatus.FINAL_INVESTIGATION);
    this.session.state = GameStatus.FINAL_INVESTIGATION;

    const investigationSeconds = 60;
    this.timerManager.startTimer('final_investigation', investigationSeconds, () => {
      this.resolveEnding();
    });

    this.emit('FINAL_INVESTIGATION', {
      solvedEvents: this.session.solvedEvents,
      storyVariables: this.session.storyVariables,
      timeLimitSeconds: investigationSeconds,
    });
  }

  public submitFinalTheory(playerId: string, answer: string, confidence: number): void {
    if (this.session.state !== GameStatus.FINAL_INVESTIGATION) {
      const err = new Error('Not in Final Investigation state');
      (err as any).code = ErrorCode.INVALID_GAME_STATE;
      throw err;
    }

    this.session.finalTheories[playerId] = {
      answer: answer.trim(),
      confidence,
      submittedAt: Date.now(),
    };

    const room = RoomManager.getRoomOrThrow(this.roomId);
    const allSubmitted = room.players.every((p) => Boolean(this.session.finalTheories[p.playerId]));

    if (allSubmitted) {
      this.timerManager.cancelTimer();
      this.resolveEnding();
    }
  }

  private resolveEnding(): void {
    this.stateMachine.transition(GameStatus.ENDING);
    this.session.state = GameStatus.ENDING;

    const ending = this.storyEngine!.determineEnding();
    this.session.ending = ending;

    this.emit('GAME_END', {
      ending,
      storyVariables: this.session.storyVariables,
      solvedEvents: this.session.solvedEvents,
      leaderboard: RoomManager.getRoomOrThrow(this.roomId).players.map((p) => ({
        playerId: p.playerId,
        displayName: p.displayName,
        avatar: p.avatar,
        score: p.score,
        correctGuesses: p.correctGuesses,
      })),
    });

    this.stateMachine.transition(GameStatus.GAME_COMPLETE);
    this.session.state = GameStatus.GAME_COMPLETE;
    RoomManager.updateRoomStatus(this.roomId, 'COMPLETED');
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

    if (this.session.currentDrawerId === playerId && this.stateMachine.isDrawingActive()) {
      logger.warn('Active drawer disconnected during drawing', { playerId });
      this.timerManager.pause();
      this.emit('TIMER_SYNC', { isPaused: true, reason: 'DRAWER_DISCONNECTED', graceSeconds: 30 });

      setTimeout(() => {
        const room = RoomManager.getRoom(this.roomId);
        const player = room?.players.find((p) => p.playerId === playerId);
        if (player && !player.isConnected) {
          logger.info('Drawer did not reconnect; skipping turn');
          this.advanceToNextTurn();
        }
      }, 30000);
    }
  }

  public handlePlayerReconnect(player: Player): void {
    RoomManager.markPlayerConnection(this.roomId, player.playerId, true);
    this.emit('PLAYER_RECONNECTED', { playerId: player.playerId, displayName: player.displayName });

    if (this.session.currentDrawerId === player.playerId) {
      const res = this.timerManager.resume();
      if (res) {
        this.emit('TIMER_SYNC', { isPaused: false, roundEndsAt: res.endsAt });
      }
    }
  }

  private emit(event: string, payload: unknown, recipientPlayerId?: string): void {
    if (this.broadcastCallback) {
      this.broadcastCallback(event, payload, recipientPlayerId);
    }
  }
}
