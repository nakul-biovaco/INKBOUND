export type PlayerRole = 'DETECTIVE' | 'DISTORTER';

export interface Player {
  id: string;
  nickname: string;
  avatar: string; // Avatar token used by the icon badge renderer
  isHost: boolean;
  isReady: boolean;
  role?: PlayerRole; // Hidden from others until TRUTH_REVEAL
  joinedAt: string;
  lastSeenAt: string;
  isOnline: boolean;
  score: number;
}

export interface PlayerPresence {
  playerId: string;
  nickname: string;
  avatar: string;
  isOnline: boolean;
  activeTurn: boolean;
  lastActive: number;
}
