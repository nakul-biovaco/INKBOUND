export type RoomStatus = 'WAITING' | 'STARTING' | 'IN_GAME' | 'FINISHED' | 'CLOSED';

export interface RoomSettings {
  turnDuration: number; // e.g. 40 seconds
  distorterEnabled: boolean;
  selectedCaseId?: string;
  allowQuestioning: boolean;
  rounds?: number;
  showHints?: boolean;
  matureContent?: boolean;
}

export interface Room {
  id: string;
  code: string; // 6 uppercase characters e.g. "MUSEUM", "NX7K2P"
  hostId: string;
  maxPlayers: number;
  status: RoomStatus;
  settings: RoomSettings;
  createdAt: string;
}
