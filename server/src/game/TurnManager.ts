import { Player } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('TurnManager');

export class TurnManager {
  private turnOrder: string[] = [];
  private currentTurnIndex: number = -1;
  private drawerIndex: number = -1;

  constructor(players: Player[]) {
    this.setTurnOrder(players);
  }

  public setTurnOrder(players: Player[]): void {
    // Deterministic order based on join timestamp or player ID
    const sorted = [...players].sort((a, b) => a.joinedAt - b.joinedAt);
    this.turnOrder = sorted.map((p) => p.playerId);
    this.currentTurnIndex = -1;
    this.drawerIndex = -1;
    logger.info('Turn order initialized', { count: this.turnOrder.length, order: this.turnOrder });
  }

  public getTurnOrder(): string[] {
    return [...this.turnOrder];
  }

  /**
   * Randomly chooses the starting drawer once before gameplay starts,
   * after which rotation strictly advances sequentially.
   */
  public randomizeFirstDrawer(): void {
    if (this.turnOrder.length > 0) {
      const randomIndex = Math.floor(Math.random() * this.turnOrder.length);
      this.drawerIndex = randomIndex === 0 ? this.turnOrder.length - 1 : randomIndex - 1;
      logger.info('First drawer randomized', {
        firstDrawerId: this.turnOrder[randomIndex],
        startingIndex: randomIndex,
      });
    }
  }

  /**
   * Advances to the next eligible connected drawer
   */
  public advanceTurn(players: Player[]): { drawerId: string; turnIndex: number } | null {
    if (this.turnOrder.length === 0) return null;

    this.currentTurnIndex++;
    const playerMap = new Map(players.map((p) => [p.playerId, p]));

    // Find next connected drawer (loop up to full turn order length)
    let attempts = 0;
    while (attempts < this.turnOrder.length) {
      this.drawerIndex = (this.drawerIndex + 1) % this.turnOrder.length;
      const candidateId = this.turnOrder[this.drawerIndex];
      const player = playerMap.get(candidateId);

      if (player && player.isConnected) {
        player.turnCount++;
        logger.info(`Next drawer chosen: ${player.displayName} (${candidateId}), turn: ${this.currentTurnIndex}`);
        return { drawerId: candidateId, turnIndex: this.currentTurnIndex };
      }
      attempts++;
    }

    // If everyone is disconnected, pick current index as fallback
    const fallbackId = this.turnOrder[this.drawerIndex];
    return { drawerId: fallbackId, turnIndex: this.currentTurnIndex };
  }

  public getCurrentDrawerId(): string | null {
    if (this.drawerIndex === -1 || this.turnOrder.length === 0) return null;
    return this.turnOrder[this.drawerIndex];
  }

  public getCurrentTurnIndex(): number {
    return this.currentTurnIndex;
  }

  public removePlayer(playerId: string): void {
    const idx = this.turnOrder.indexOf(playerId);
    if (idx !== -1) {
      this.turnOrder.splice(idx, 1);
      if (this.drawerIndex >= this.turnOrder.length) {
        this.drawerIndex = 0;
      }
    }
  }

  public addPlayer(playerId: string): void {
    if (!this.turnOrder.includes(playerId)) {
      this.turnOrder.push(playerId);
    }
  }
}
