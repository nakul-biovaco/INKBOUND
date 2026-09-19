import { z } from 'zod';

// ==========================================
// 1. GAME STATES & CONSTANTS
// ==========================================
export const GameStatus = {
  LOBBY: 'LOBBY',
  COUNTDOWN: 'COUNTDOWN',
  STORY_SELECTION: 'STORY_SELECTION',
  STORY_SELECTED: 'STORY_SELECTED',
  CASE_INTRO: 'CASE_INTRO',
  ROUND_START: 'ROUND_START',
  PROMPT_SELECTION: 'PROMPT_SELECTION',
  DRAWING: 'DRAWING',
  GUESSING: 'GUESSING',
  CLUE_SOLVED: 'CLUE_SOLVED',
  EVIDENCE_DISCOVERED: 'EVIDENCE_DISCOVERED',
  STORY_REVEAL: 'STORY_REVEAL',
  NEXT_TURN: 'NEXT_TURN',
  DISCUSSION: 'DISCUSSION',
  FINAL_INVESTIGATION: 'FINAL_INVESTIGATION',
  TRUTH_REVEAL: 'TRUTH_REVEAL',
  ENDING: 'ENDING',
  GAME_COMPLETE: 'GAME_COMPLETE',
} as const;

export type GameStatus = (typeof GameStatus)[keyof typeof GameStatus];

export const VALID_TRANSITIONS: Record<GameStatus, GameStatus[]> = {
  LOBBY: ['COUNTDOWN'],
  COUNTDOWN: ['STORY_SELECTION', 'STORY_SELECTED', 'ROUND_START', 'LOBBY'],
  STORY_SELECTION: ['STORY_SELECTED', 'LOBBY'],
  STORY_SELECTED: ['ROUND_START', 'CASE_INTRO'],
  CASE_INTRO: ['ROUND_START'],
  ROUND_START: ['DRAWING', 'PROMPT_SELECTION'],
  PROMPT_SELECTION: ['DRAWING', 'NEXT_TURN'],
  DRAWING: ['GUESSING', 'CLUE_SOLVED', 'NEXT_TURN'],
  GUESSING: ['CLUE_SOLVED', 'NEXT_TURN'],
  CLUE_SOLVED: ['STORY_REVEAL', 'EVIDENCE_DISCOVERED'],
  EVIDENCE_DISCOVERED: ['NEXT_TURN', 'DISCUSSION', 'FINAL_INVESTIGATION'],
  STORY_REVEAL: ['NEXT_TURN', 'FINAL_INVESTIGATION', 'EVIDENCE_DISCOVERED'],
  NEXT_TURN: ['ROUND_START', 'DRAWING', 'PROMPT_SELECTION', 'FINAL_INVESTIGATION', 'DISCUSSION'],
  DISCUSSION: ['ROUND_START', 'DRAWING', 'NEXT_TURN', 'FINAL_INVESTIGATION'],
  FINAL_INVESTIGATION: ['TRUTH_REVEAL', 'ENDING'],
  TRUTH_REVEAL: ['ENDING'],
  ENDING: ['GAME_COMPLETE'],
  GAME_COMPLETE: ['LOBBY', 'COUNTDOWN', 'STORY_SELECTION'],
};

// ==========================================
// 2. ERROR CODES
// ==========================================
export const ErrorCode = {
  ROOM_NOT_FOUND: 'ROOM_NOT_FOUND',
  ROOM_FULL: 'ROOM_FULL',
  NOT_AUTHORIZED: 'NOT_AUTHORIZED',
  NOT_YOUR_TURN: 'NOT_YOUR_TURN',
  INVALID_GAME_STATE: 'INVALID_GAME_STATE',
  INVALID_PROMPT: 'INVALID_PROMPT',
  PROMPT_ALREADY_SELECTED: 'PROMPT_ALREADY_SELECTED',
  DRAWING_NOT_ACTIVE: 'DRAWING_NOT_ACTIVE',
  GUESS_NOT_ALLOWED: 'GUESS_NOT_ALLOWED',
  RATE_LIMITED: 'RATE_LIMITED',
  GAME_ALREADY_STARTED: 'GAME_ALREADY_STARTED',
  GAME_FINISHED: 'GAME_FINISHED',
  PLAYER_NOT_FOUND: 'PLAYER_NOT_FOUND',
  NOT_ENOUGH_PLAYERS: 'NOT_ENOUGH_PLAYERS',
  NOT_ALL_READY: 'NOT_ALL_READY',
  ALREADY_IN_ROOM: 'ALREADY_IN_ROOM',
  INVALID_PAYLOAD: 'INVALID_PAYLOAD',
  INTERNAL_ERROR: 'INTERNAL_ERROR',
} as const;

export type ErrorCode = (typeof ErrorCode)[keyof typeof ErrorCode];

// ==========================================
// 3. DRAWING & STROKES
// ==========================================
export interface Point {
  x: number; // Normalized 0.0 - 1.0
  y: number; // Normalized 0.0 - 1.0
}

export type DrawingTool = 'pencil' | 'brush' | 'marker' | 'eraser' | 'line' | 'rectangle' | 'circle' | 'fill';

export interface StrokeChunk {
  strokeId: string;
  turnIndex: number;
  playerId: string;
  tool: DrawingTool;
  color: string;
  width: number;
  points: Point[];
  isComplete: boolean;
  timestamp: number;
}

// ==========================================
// 4. STORY DEFINITION SCHEMA
// ==========================================

/** Visual category for investigation prompt type classification */
export type PromptType = 'OBJECT' | 'LOCATION' | 'PERSON' | 'ACTION' | 'MEMORY' | 'EVIDENCE' | 'EVENT' | 'SCENE' | 'SUSPECT';

/** Category of the visual element to draw */
export type VisualCategory = 'OBJECT' | 'PERSON' | 'PLACE' | 'ACTION' | 'DOCUMENT' | 'TOOL' | 'VEHICLE' | 'ANIMAL' | 'ABSTRACT';

export interface StoryEvent {
  eventId: string;
  act: number;
  sequence: number;
  eventType: 'DRAW_EVENT' | 'NARRATIVE_TWIST' | 'DISCOVERY';
  drawingObjective: string;
  visualElements: string[];
  acceptedConcepts: string[];
  semanticKeywords: string[];
  hint: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  narrativeDescription: string;
  consequenceReveal: string;
  requiredVariables?: Record<string, boolean | number | string>;
  setVariables?: Record<string, boolean | number | string>;
  timeLimitSeconds?: number;
  basePoints?: number;
  choices?: Array<{ text: string; isCanon: boolean }>;
  // === NEW OPTIONAL FIELDS (backward-compatible) ===
  /** Narrative scene prompt shown privately to the drawer */
  drawerPrompt?: string;
  /** Narrative context for the scene (shown before drawing begins) */
  narrativeContext?: string;
  /** Text revealed when this evidence is discovered */
  evidenceReveal?: string;
  /** Investigation prompt type (OBJECT, PERSON, LOCATION, etc.) */
  promptType?: PromptType;
  /** Visual category for the canonical answer */
  visualCategory?: VisualCategory;
  /** Story consequence text after discovery */
  storyConsequence?: string;
  /** Whether this is a key plot event that triggers discussion */
  isKeyEvent?: boolean;
  /** Public investigation objective shown to guessers (explains WHAT to deduce without leaking answer) */
  investigationObjective?: string;
}

/**
 * Extended investigation event produced by InvestigationEventAdapter.
 * Superset of StoryEvent with guaranteed narrative fields.
 */
export interface InvestigationEvent extends StoryEvent {
  /** Always populated: narrative scene prompt for the drawer */
  drawerPrompt: string;
  /** Always populated: narrative context shown to all before investigation */
  narrativeContext: string;
  /** Always populated: text revealed when evidence is discovered */
  evidenceReveal: string;
  /** Always populated: investigation prompt type */
  promptType: PromptType;
  /** Always populated: visual category */
  visualCategory: VisualCategory;
  /** Canonical answer (same as drawingObjective) */
  canonicalAnswer: string;
  /** All accepted answer variations */
  acceptedAnswers: string[];
  /** Story consequence after discovery */
  storyConsequence: string;
  /** Whether this triggers a discussion break */
  isKeyEvent: boolean;
  /** Public investigation objective shown to guessers */
  investigationObjective: string;
}

export interface StoryEnding {
  endingId: string;
  title: string;
  conditionDescription: string;
  requiredVariables: Record<string, boolean | number | string>;
  narrativeText: string;
  /** Optional verdict classification */
  verdict?: 'MASTER_DETECTIVE' | 'PARTIAL_SOLUTION' | 'COLD_CASE' | 'WRONG_ACCUSATION' | 'DISTORTED_TRUTH' | 'SOLVED';
}

export interface StoryDefinition {
  id: string;
  title: string;
  genre: string;
  description: string;
  difficulty: 'EASY' | 'NORMAL' | 'HARD';
  version: number;
  author?: string;
  initialVariables: Record<string, boolean | number | string>;
  events: StoryEvent[];
  distractors: Array<{
    distractorId: string;
    text: string;
    category: string;
  }>;
  endings: StoryEnding[];
}

export interface PromptOption {
  optionIndex: number;
  previewText: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  isDistractor: boolean;
  eventId?: string;
  /** Narrative investigation task description (new model) */
  investigationTask?: string;
}

// ==========================================
// 5. PLAYER & ROOM MODEL
// ==========================================
export interface Player {
  playerId: string;
  displayName: string;
  avatar: string;
  connectionId?: string;
  roomId: string;
  score: number;
  isHost: boolean;
  isConnected: boolean;
  isReady: boolean;
  joinedAt: number;
  lastSeen: number;
  turnCount: number;
  correctGuesses: number;
  reconnectToken: string;
}

export interface RoomSettings {
  maxPlayers: number;
  drawingTimeLimit: number;
  promptSelectionTimeLimit: number;
  roundsPerGame: number;
  storyId: string;
  isPublic?: boolean;
  isQuickMatch?: boolean;
}

export interface Room {
  roomId: string;
  joinCode: string;
  hostPlayerId: string;
  players: Player[];
  maxPlayers: number;
  status: 'LOBBY' | 'IN_GAME' | 'COMPLETED' | 'ABANDONED';
  createdAt: number;
  settings: RoomSettings;
  isPublic?: boolean;
  isQuickMatch?: boolean;
}

// ==========================================
// 6. GAME SESSION STATE
// ==========================================
export interface SolvedEventRecord {
  eventId: string;
  solverPlayerId: string;
  drawerPlayerId: string;
  turnIndex: number;
  timeToSolveMs: number;
  pointsAwardedSolver: number;
  pointsAwardedDrawer: number;
  revealedText: string;
  /** Evidence title for the evidence board */
  evidenceTitle?: string;
  /** Narrative evidence reveal text */
  evidenceReveal?: string;
}

// ==========================================
// 6a. CASE RUNTIME TYPES
// ==========================================

/** A narrative passage revealed to all players during the case */
export interface NarrativePassage {
  id: string;
  text: string;
  type: 'INTRO' | 'SCENE' | 'EVIDENCE' | 'REVELATION' | 'CONCLUSION';
  timestamp: number;
  eventId?: string;
}

/** An evidence card displayed on the Investigation Board */
export interface EvidenceCard {
  id: string;
  title: string;
  description: string;
  discoveredBy: string;
  discoveredByName: string;
  drawnBy: string;
  drawnByName: string;
  scene: string;
  timestamp: number;
  category: string;
  eventId: string;
  turnIndex: number;
}

/** A public suspect profile (no secrets exposed) */
export interface SuspectEntry {
  id: string;
  name: string;
  role: string;
  personality: string;
  publicStatement: string;
  avatar: string;
  connection: string;
}

/** Case progress tracker */
export interface CaseProgress {
  totalEvents: number;
  discoveredEvents: number;
  percentage: number;
  caseTitle: string;
  caseSetting?: string;
  caseGenre?: string;
}

/** Discussion vote from a player */
export interface DiscussionVote {
  playerId: string;
  optionIndex: number;
  timestamp: number;
}

export interface AuthoritativeGameSession {
  id: string;
  roomId: string;
  storyId: string;
  state: GameStatus;
  currentAct: number;
  turnIndex: number;
  storyChooserPlayerId: string | null;
  offeredStoryOptions: Array<{ storyId: string; title: string; genre: string; difficulty: string; description: string }> | null;
  currentDrawerId: string | null;
  activePromptOptions: PromptOption[] | null;
  selectedEvent: StoryEvent | null;
  roundStartedAt: number | null;
  roundEndsAt: number | null;
  storyVariables: Record<string, boolean | number | string>;
  solvedEvents: SolvedEventRecord[];
  turnOrder: string[]; // List of playerIds in deterministic order
  drawerTurnIndex: number;
  drawingStrokes: StrokeChunk[];
  finalTheories: Record<string, { answer: string; confidence: number; submittedAt: number }>;
  ending: StoryEnding | null;
  retiredEventIds: string[]; // All events attempted/played so they never repeat
  usedWordObjectives: string[]; // All clue words drawn in this session so they never repeat
  offeredPromptHistory: string[]; // All distractor and clue words previously offered
  lastRoundOutcome: {
    completedTurnIndex: number;
    previousDrawerId: string;
    previousDrawerName: string;
    revealedObjective: string;
    solved: boolean;
    solverPlayerId?: string;
    solverName?: string;
    scoreAward?: any;
    nextDrawerPlayerId: string;
    nextDrawerName: string;
    nextTurnInSeconds: number;
  } | null;
  // === NEW CASE-MODEL FIELDS ===
  /** Narrative passages revealed so far (Story So Far) */
  narrativeLog: NarrativePassage[];
  /** Discovered evidence cards */
  evidenceBoard: EvidenceCard[];
  /** Public suspect profiles */
  suspects: SuspectEntry[];
  /** Case progress tracking */
  caseProgress: CaseProgress | null;
  /** Discussion votes for current discussion */
  discussionVotes: DiscussionVote[];
  /** Discussion options currently being voted on */
  discussionOptions: string[] | null;
  /** Sanitized story context for current turn (explains WHY investigation is happening) */
  storyContext?: string | null;
  /** Current investigation objective for current turn */
  investigationObjective?: string | null;
  /** Sanitized narrative clue hint guiding deduction vocabulary without answer leak */
  clueHint?: string | null;
  /** Active hint for the clue */
  hint?: string | null;
  /** Active category for the clue */
  category?: string | null;
  /** Progressively revealed letters in each word (skribbl.io style) */
  revealedLetters?: Array<Array<string | null>> | null;
}

// ==========================================
// 7. PUBLIC VS PRIVATE SERIALIZERS
// ==========================================
export interface PublicGameState {
  id: string;
  roomId: string;
  storyId: string;
  state: GameStatus;
  currentAct: number;
  turnIndex: number;
  currentDrawerId: string | null;
  roundStartedAt: number | null;
  roundEndsAt: number | null;
  players: Array<Omit<Player, 'reconnectToken'>>;
  scores: Record<string, number>;
  solvedEvents: SolvedEventRecord[];
  storyVariables: Record<string, boolean | number | string>;
  drawingStrokeCount: number;
  hint?: string | null;
  /** Sanitized narrative clue hint guiding deduction vocabulary without answer leak */
  clueHint?: string | null;
  /** @deprecated Use category-based hints instead */
  wordLengths?: number[] | null;
  /** @deprecated Use category-based hints instead */
  firstLetters?: string[] | null;
  category?: string | null;
  /** Sanitized story/scene context explaining WHY current investigation is happening (no answer leaks) */
  storyContext?: string | null;
  /** Current investigation objective for the room/guessers (e.g. what detectives are trying to deduce) */
  investigationObjective?: string | null;
  /** Progressively revealed letters in each word (skribbl.io style) */
  revealedLetters?: Array<Array<string | null>> | null;
  // === NEW CASE-MODEL PUBLIC FIELDS ===
  /** Narrative passages revealed so far */
  narrativeLog?: NarrativePassage[];
  /** Discovered evidence cards */
  evidenceBoard?: EvidenceCard[];
  /** Public suspect profiles */
  suspects?: SuspectEntry[];
  /** Case progress (percentage, title, etc.) */
  caseProgress?: CaseProgress | null;
  /** Current discussion options (when in DISCUSSION state) */
  discussionOptions?: string[] | null;
  /** Current discussion votes */
  discussionVotes?: DiscussionVote[];
}

export interface PrivateDrawerState {
  options: PromptOption[] | null;
  selectedObjective: string | null;
  objective?: string | null;
  hint: string | null;
  visualElements: string[] | null;
  /** Narrative scene prompt (new model) */
  drawerPrompt?: string | null;
  /** Canonical answer word(s) so drawer knows what to draw */
  canonicalAnswer?: string | null;
  /** Story scene context explaining why it matters to the case */
  storyContext?: string | null;
}

// ==========================================
// 8. WEBSOCKET PROTOCOL TYPES
// ==========================================
export const WSClientEvent = {
  CREATE_ROOM: 'CREATE_ROOM',
  JOIN_ROOM: 'JOIN_ROOM',
  QUICK_PLAY: 'QUICK_PLAY',
  LEAVE_ROOM: 'LEAVE_ROOM',
  READY: 'READY',
  START_GAME: 'START_GAME',
  CHOOSE_STORY: 'CHOOSE_STORY',
  SELECT_PROMPT: 'SELECT_PROMPT',
  START_DRAWING: 'START_DRAWING',
  DRAW_STROKE: 'DRAW_STROKE',
  DRAW_CLEAR: 'DRAW_CLEAR',
  END_DRAWING: 'END_DRAWING',
  SUBMIT_GUESS: 'SUBMIT_GUESS',
  USE_HINT: 'USE_HINT',
  SUBMIT_THEORY: 'SUBMIT_THEORY',
  UPDATE_SETTINGS: 'UPDATE_SETTINGS',
  CHAT_MESSAGE: 'CHAT_MESSAGE',
  RECONNECT: 'RECONNECT',
  PING: 'PING',
  VOTE_KICK: 'VOTE_KICK',
  REQUEST_SECRET_OBJECTIVE: 'REQUEST_SECRET_OBJECTIVE',
  // === NEW CASE-MODEL CLIENT EVENTS ===
  SUBMIT_DISCUSSION_VOTE: 'SUBMIT_DISCUSSION_VOTE',
  REQUEST_CASE_FILE: 'REQUEST_CASE_FILE',
  SKIP_NARRATIVE: 'SKIP_NARRATIVE',
} as const;

export const WSServerEvent = {
  ROOM_STATE: 'ROOM_STATE',
  PLAYER_JOINED: 'PLAYER_JOINED',
  PLAYER_LEFT: 'PLAYER_LEFT',
  PLAYER_KICKED: 'PLAYER_KICKED',
  VOTE_KICK_UPDATE: 'VOTE_KICK_UPDATE',
  PLAYER_RECONNECTED: 'PLAYER_RECONNECTED',
  CHAT_MESSAGE: 'CHAT_MESSAGE',
  GAME_STARTING: 'GAME_STARTING',
  STORY_CHOOSER_SELECTED: 'STORY_CHOOSER_SELECTED',
  STORY_OPTIONS: 'STORY_OPTIONS',
  STORY_SELECTED: 'STORY_SELECTED',
  TURN_STARTED: 'TURN_STARTED',
  PROMPT_OPTIONS: 'PROMPT_OPTIONS',
  SECRET_DRAW_OBJECTIVE: 'SECRET_DRAW_OBJECTIVE',
  DRAWING_STARTED: 'DRAWING_STARTED',
  HINT_LETTER_REVEALED: 'HINT_LETTER_REVEALED',
  DRAW_STROKE: 'DRAW_STROKE',
  DRAW_CLEAR: 'DRAW_CLEAR',
  PROMPT_SELECTED: 'PROMPT_SELECTED',
  DRAWING_ENDED: 'DRAWING_ENDED',
  GUESS_FEEDBACK: 'GUESS_FEEDBACK',
  PUBLIC_GUESS: 'PUBLIC_GUESS',
  CLUE_SOLVED: 'CLUE_SOLVED',
  SCORE_UPDATE: 'SCORE_UPDATE',
  STORY_REVEAL: 'STORY_REVEAL',
  TURN_ENDED: 'TURN_ENDED',
  NEXT_TURN: 'NEXT_TURN',
  TIMER_SYNC: 'TIMER_SYNC',
  FINAL_INVESTIGATION: 'FINAL_INVESTIGATION',
  GAME_END: 'GAME_END',
  PONG: 'PONG',
  ERROR: 'ERROR',
  GAME_ERROR: 'GAME_ERROR',
  // === NEW CASE-MODEL SERVER EVENTS ===
  CASE_INTRO: 'CASE_INTRO',
  NARRATIVE_PASSAGE: 'NARRATIVE_PASSAGE',
  EVIDENCE_CARD: 'EVIDENCE_CARD',
  EVIDENCE_DISCOVERED: 'EVIDENCE_DISCOVERED',
  DISCUSSION_STARTED: 'DISCUSSION_STARTED',
  DISCUSSION_VOTE: 'DISCUSSION_VOTE',
  DISCUSSION_RESULT: 'DISCUSSION_RESULT',
  TRUTH_REVEAL: 'TRUTH_REVEAL',
  CASE_FILE: 'CASE_FILE',
  CASE_PROGRESS: 'CASE_PROGRESS',
} as const;

// ==========================================
// 9. ZOD VALIDATION SCHEMAS
// ==========================================
export const CreateRoomSchema = z.object({
  displayName: z.string().min(1).max(30),
  avatar: z.string().default('detective-1'),
  settings: z
    .object({
      maxPlayers: z.number().min(2).max(12).optional(),
      drawingTimeLimit: z.number().min(30).max(180).optional(),
      promptSelectionTimeLimit: z.number().min(10).max(30).optional(),
      roundsPerGame: z.number().min(1).max(30).optional(),
      storyId: z.string().optional(),
      isPublic: z.boolean().optional(),
    })
    .optional(),
});

export const QuickPlaySchema = z.object({
  displayName: z.string().min(1).max(30),
  avatar: z.string().default('detective-1'),
  genre: z.string().optional(),
});

export const JoinRoomSchema = z.object({
  joinCode: z.string().min(4).max(12),
  displayName: z.string().min(1).max(30),
  avatar: z.string().default('detective-1'),
});

export const ChooseStorySchema = z.object({
  storyId: z.string().min(1),
});

export const SelectPromptSchema = z.object({
  optionIndex: z.number().int().min(0).max(2),
});

export const DrawStrokeSchema = z.object({
  chunk: z.object({
    strokeId: z.string(),
    tool: z.enum(['pencil', 'brush', 'marker', 'eraser', 'line', 'rectangle', 'circle', 'fill']),
    color: z.string(),
    width: z.number().min(1).max(100),
    points: z.array(
      z.object({
        x: z.number().transform((v) => Math.max(0, Math.min(1, v))),
        y: z.number().transform((v) => Math.max(0, Math.min(1, v))),
      })
    ),
    isComplete: z.boolean(),
    timestamp: z.number(),
  }),
});

export const SubmitGuessSchema = z.object({
  guess: z.string().min(1).max(200),
});

export const SubmitTheorySchema = z.object({
  answer: z.string().min(1).max(1000),
  confidence: z.number().min(1).max(10),
});

export const ReconnectSchema = z.object({
  roomId: z.string(),
  playerId: z.string(),
  reconnectToken: z.string(),
});

// === NEW CASE-MODEL ZOD SCHEMAS ===
export const SubmitDiscussionVoteSchema = z.object({
  optionIndex: z.number().int().min(0).max(4),
});

export const RequestCaseFileSchema = z.object({});

export const SkipNarrativeSchema = z.object({});
