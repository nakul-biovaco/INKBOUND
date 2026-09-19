import { Stroke } from './game';

export type GameEventType =
  | 'PLAYER_JOINED'
  | 'PLAYER_LEFT'
  | 'PLAYER_READY'
  | 'PLAYERS_SYNC'
  | 'SETTINGS_UPDATED'
  | 'GAME_STARTED'
  | 'CASE_CREATED'
  | 'CLUE_ASSIGNED'
  | 'TURN_STARTED'
  | 'TURN_WARNING'
  | 'TURN_ENDED'
  | 'DRAWING_STROKE'
  | 'STROKE_LIVE_UPDATE'
  | 'DRAWING_UNDO'
  | 'DRAWING_CLEARED'
  | 'DRAWING_SUBMITTED'
  | 'EVIDENCE_REVEALED'
  | 'CASE_INTRO'
  | 'NARRATIVE_PASSAGE'
  | 'EVIDENCE_CARD'
  | 'EVIDENCE_DISCOVERED'
  | 'DISCUSSION_STARTED'
  | 'DISCUSSION_VOTE'
  | 'DISCUSSION_RESULT'
  | 'TRUTH_REVEAL'
  | 'CASE_FILE'
  | 'CASE_PROGRESS'
  | 'NEXT_PLAYER'
  | 'INVESTIGATION_STARTED'
  | 'QUESTION_SUBMITTED'
  | 'QUESTION_ANSWERED'
  | 'TIMELINE_UPDATED'
  | 'THEORY_SUBMITTED'
  | 'ACCUSATION_STARTED'
  | 'ACCUSATION_LOCKED'
  | 'REVEAL_STARTED'
  | 'CHAT_MESSAGE'
  | 'GAME_LOG'
  | 'GAME_FINISHED';

export interface RealtimeMessage<T = unknown> {
  eventId: string;
  gameId: string;
  actorId: string;
  timestamp: number;
  sequenceNumber: number;
  type: GameEventType;
  payload: T;
}

export interface StrokeBroadcastPayload {
  drawingId: string;
  stroke: Stroke;
}

export interface StrokeUndoBroadcastPayload {
  drawingId: string;
  playerId: string;
}

export interface DrawingClearBroadcastPayload {
  drawingId: string;
  playerId: string;
}

export interface TurnStartedPayload {
  turnIndex: number;
  playerId: string;
  turnStartedAt: string;
  turnEndsAt: string;
  durationSeconds: number;
}

export interface DrawingSubmittedPayload {
  drawingId: string;
  playerId: string;
  evidenceId: string;
  previewUrl: string;
}

export interface TimelineUpdatedPayload {
  slotTime: string;
  evidenceId: string | null;
  placedBy: string;
}
