import { StrokeChunk } from '../types/index.js';
import { stateStore } from '../redis/StateStore.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('DrawingManager');

export class DrawingManager {
  /**
   * Records an active stroke chunk into the ephemeral turn buffer
   */
  public static async recordStroke(roomId: string, turnIndex: number, stroke: StrokeChunk): Promise<void> {
    await stateStore.appendStroke(roomId, turnIndex, stroke);
  }

  /**
   * Retrieves full stroke history for the current turn (used for rejoining players)
   */
  public static async getTurnStrokes(roomId: string, turnIndex: number): Promise<StrokeChunk[]> {
    return await stateStore.getStrokes(roomId, turnIndex);
  }

  /**
   * Clears stroke history for the turn (e.g. drawer clears canvas)
   */
  public static async clearTurnStrokes(roomId: string, turnIndex: number): Promise<void> {
    await stateStore.clearStrokes(roomId, turnIndex);
    logger.info(`Cleared stroke buffer for room ${roomId}, turn ${turnIndex}`);
  }
}
