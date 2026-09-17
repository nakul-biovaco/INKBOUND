import { AuthoritativeGameState, GameStatus } from '../types/game';

export class ValidationManager {
  public static canStartGame(status: GameStatus, isHost: boolean, playerCount: number): { allowed: boolean; reason?: string } {
    if (!isHost) {
      return { allowed: false, reason: 'Only the detective room host can initiate the case.' };
    }
    if (status !== 'LOBBY') {
      return { allowed: false, reason: 'Case has already commenced or is finishing.' };
    }
    if (playerCount < 2) {
      return { allowed: false, reason: 'At least 2 detectives are required to begin an investigation.' };
    }
    return { allowed: true };
  }

  public static canDraw(state: AuthoritativeGameState, playerId: string): { allowed: boolean; reason?: string } {
    if (state.status !== 'PLAYER_DRAWING') {
      return { allowed: false, reason: 'Canvas is locked. It is not an active drawing phase.' };
    }
    if (state.currentTurnPlayerId !== playerId) {
      return { allowed: false, reason: 'Another detective is currently drafting evidence.' };
    }
    return { allowed: true };
  }

  public static canSubmitTheory(state: AuthoritativeGameState, playerId: string): { allowed: boolean; reason?: string } {
    if (state.status !== 'FINAL_THEORY' && state.status !== 'TIMELINE_BUILDING' && state.status !== 'INVESTIGATION') {
      return { allowed: false, reason: 'Theories can only be submitted during the investigation and theory phases.' };
    }
    if (state.theories[playerId]) {
      return { allowed: true }; // allow updating until locked
    }
    return { allowed: true };
  }
}
