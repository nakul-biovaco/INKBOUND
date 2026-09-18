import { z } from 'zod';

// ==========================================
// 1. GAME STATES & CONSTANTS
// ==========================================
export const GameStatus = {
  LOBBY: 'LOBBY',
  COUNTDOWN: 'COUNTDOWN',
  STORY_SELECTION: 'STORY_SELECTION',
  STORY_SELECTED: 'STORY_SELECTED',
  ROUND_START: 'ROUND_START',
  PROMPT_SELECTION: 'PROMPT_SELECTION',
  DRAWING: 'DRAWING',
  GUESSING: 'GUESSING',
  CLUE_SOLVED: 'CLUE_SOLVED',
  STORY_REVEAL: 'STORY_REVEAL',
  NEXT_TURN: 'NEXT_TURN',
  FINAL_INVESTIGATION: 'FINAL_INVESTIGATION',
  ENDING: 'ENDING',
  GAME_COMPLETE: 'GAME_COMPLETE',
} as const;

export type GameStatus = (typeof GameStatus)[keyof typeof GameStatus];

export const VALID_TRANSITIONS: Record<GameStatus, GameStatus[]> = {
  LOBBY: ['COUNTDOWN'],
  COUNTDOWN: ['STORY_SELECTION', 'ROUND_START', 'LOBBY'],
  STORY_SELECTION: ['STORY_SELECTED', 'LOBBY'],
  STORY_SELECTED: ['ROUND_START'],
  ROUND_START: ['PROMPT_SELECTION'],
  PROMPT_SELECTION: ['DRAWING', 'NEXT_TURN'],
  DRAWING: ['GUESSING', 'CLUE_SOLVED', 'NEXT_TURN'],
  GUESSING: ['CLUE_SOLVED', 'NEXT_TURN'],
  CLUE_SOLVED: ['STORY_REVEAL'],
  STORY_REVEAL: ['NEXT_TURN', 'FINAL_INVESTIGATION'],
  NEXT_TURN: ['ROUND_START', 'PROMPT_SELECTION', 'FINAL_INVESTIGATION'],
  FINAL_INVESTIGATION: ['ENDING'],
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
}

export interface StoryEnding {
  endingId: string;
  title: string;
  conditionDescription: string;
  requiredVariables: Record<string, boolean | number | string>;
  narrativeText: string;
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
  wordLengths?: number[] | null;
  firstLetters?: string[] | null;
  category?: string | null;
}

export interface PrivateDrawerState {
  options: PromptOption[] | null;
  selectedObjective: string | null;
  hint: string | null;
  visualElements: string[] | null;
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
} as const;

export const WSServerEvent = {
  ROOM_STATE: 'ROOM_STATE',
  PLAYER_JOINED: 'PLAYER_JOINED',
  PLAYER_LEFT: 'PLAYER_LEFT',
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
