import { Player, PlayerRole } from './player';

export type GameStatus =
  | 'LOBBY'
  | 'GAME_INITIALIZING'
  | 'STORY_SELECTION'
  | 'CASE_INTRO'
  | 'CLUE_DISTRIBUTION'
  | 'TURN_START'
  | 'PLAYER_DRAWING'
  | 'DRAWING_SUBMITTED'
  | 'EVIDENCE_REVEAL'
  | 'NEXT_PLAYER'
  | 'ALL_TURNS_COMPLETE'
  | 'INVESTIGATION'
  | 'QUESTIONING'
  | 'TIMELINE_BUILDING'
  | 'FINAL_THEORY'
  | 'ACCUSATION_LOCK'
  | 'TRUTH_REVEAL'
  | 'SCORING'
  | 'RESULTS'
  | 'GAME_FINISHED';

export type DrawingTool =
  | 'pencil'
  | 'brush'
  | 'marker'
  | 'eraser'
  | 'line'
  | 'rectangle'
  | 'circle'
  | 'text'
  | 'fill';

export interface Point {
  x: number;
  y: number;
}

export interface Stroke {
  id: string;
  drawingId: string;
  playerId: string;
  tool: DrawingTool;
  color: string;
  width: number;
  points: Point[];
  timestamp: number;
}

export interface CaseCharacter {
  name: string;
  role: string;
  alibi: string;
  avatar: string;
}

export interface TimelineEventItem {
  time: string;
  event: string;
}

export interface CaseEvidenceItem {
  id: string;
  title: string;
  detail: string;
}

export interface CaseClueItem {
  order: number;
  title: string;
  text: string;
}

export interface MysteryCase {
  id: string;
  title: string;
  genre: string;
  setting: string;
  description: string;
  characters: CaseCharacter[];
  truth: string;
  culprit: string;
  motive: string;
  timeline: TimelineEventItem[];
  evidence: CaseEvidenceItem[];
  clues: CaseClueItem[];
  misleadingInformation?: string;
  distorterObjective: string;
  difficulty: 'EASY' | 'NORMAL' | 'HARD';
}

export interface PlayerSecretClue {
  id: string;
  gameId: string;
  playerId: string;
  clueTitle: string;
  clueText: string;
  clueOrder: number;
  isRevealed: boolean;
}

export interface Drawing {
  id: string;
  gameId: string;
  playerId: string;
  clueId?: string;
  previewUrl?: string;
  strokeCount: number;
  strokes: Stroke[];
  isSubmitted: boolean;
  submittedAt?: string;
}

export interface EvidenceCard {
  id: string;
  gameId: string;
  drawingId: string;
  sourcePlayerId: string;
  sourcePlayerName: string;
  sourcePlayerAvatar: string;
  title: string;
  drawingPreview?: string;
  notes: string;
  tags: string[];
  timelineSlot?: string;
  position: { x: number; y: number };
  createdAt: string;
}

export interface EvidenceConnection {
  id: string;
  gameId: string;
  fromEvidenceId: string;
  toEvidenceId: string;
  label?: string;
}

export type QuestionType = 'WHO' | 'WHAT' | 'WHERE' | 'WHEN' | 'HOW' | 'WHY';

export interface Question {
  id: string;
  gameId: string;
  askerId: string;
  askerName: string;
  targetPlayerId: string;
  targetPlayerName: string;
  questionType: QuestionType;
  questionText: string;
  answerDrawingId?: string;
  status: 'PENDING' | 'ANSWERED' | 'DISMISSED';
  createdAt: string;
}

export interface TheorySubmission {
  id: string;
  gameId: string;
  playerId: string;
  culprit: string;
  motive: string;
  keyEvent: string;
  method: string;
  confidence: number; // 1 - 10
  distorterGuess?: string; // playerId of suspected Distorter
  submittedAt: string;
}

export interface PlayerScoreBreakdown {
  culpritPoints: number;
  motivePoints: number;
  timelinePoints: number;
  evidencePoints: number;
  distorterPoints: number;
  speedBonus: number;
  totalPoints: number;
  accuracyPercent: number;
  accolades: string[]; // e.g. "Best Detective", "Most Manipulative"
}

export interface GameScoreResult {
  playerId: string;
  nickname: string;
  avatar: string;
  role: PlayerRole;
  score: number;
  breakdown: PlayerScoreBreakdown;
  theory?: TheorySubmission;
}

export interface AuthoritativeGameState {
  id: string;
  roomId: string;
  caseId: string;
  status: GameStatus;
  currentTurnPlayerId: string | null;
  turnIndex: number;
  turnStartedAt: string | null;
  turnEndsAt: string | null;
  turnDuration: number;
  sequenceNumber: number;
  currentCase?: MysteryCase;
  players: Player[];
  evidenceCards: EvidenceCard[];
  connections: EvidenceConnection[];
  timelineSlots: { [slotTime: string]: string | null }; // slotTime -> evidenceId
  theories: { [playerId: string]: TheorySubmission };
  scores: { [playerId: string]: GameScoreResult };
  distorterId: string | null; // Hidden on client until TRUTH_REVEAL
}
