import { Player } from '../types/player';

export interface TurnState {
  currentTurnPlayerId: string | null;
  turnIndex: number;
  turnStartedAt: string | null;
  turnEndsAt: string | null;
  durationSeconds: number;
}

export class TurnManager {
  /**
   * Starts a turn for the player at turnIndex with authoritative timestamps.
   */
  public static createTurn(
    players: Player[],
    turnIndex: number,
    durationSeconds: number = 40
  ): TurnState {
    if (turnIndex < 0 || turnIndex >= players.length) {
      throw new Error(`[TurnManager] Invalid turnIndex: ${turnIndex}. Players count: ${players.length}`);
    }

    const activePlayer = players[turnIndex];
    const now = new Date();
    const endsAt = new Date(now.getTime() + durationSeconds * 1000);

    return {
      currentTurnPlayerId: activePlayer.id,
      turnIndex,
      turnStartedAt: now.toISOString(),
      turnEndsAt: endsAt.toISOString(),
      durationSeconds,
    };
  }

  /**
   * Client helper: strictly derives remaining seconds from authoritative server end timestamp.
   */
  public static calculateRemainingSeconds(turnEndsAt: string | null): number {
    if (!turnEndsAt) return 0;
    const endTime = new Date(turnEndsAt).getTime();
    const now = Date.now();
    const remaining = Math.ceil((endTime - now) / 1000);
    return Math.max(0, remaining);
  }

  /**
   * Checks if the turn time limit has expired.
   */
  public static isTurnExpired(turnEndsAt: string | null): boolean {
    return this.calculateRemainingSeconds(turnEndsAt) <= 0;
  }

  /**
   * Checks whether all players have completed their serial drawing turns.
   */
  public static areAllTurnsComplete(turnIndex: number, totalPlayers: number): boolean {
    return turnIndex >= totalPlayers - 1;
  }

  /**
   * Gets the next player turn index, or null if all turns are completed.
   */
  public static getNextTurnIndex(currentTurnIndex: number, totalPlayers: number): number | null {
    const next = currentTurnIndex + 1;
    return next < totalPlayers ? next : null;
  }
}
