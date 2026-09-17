import { ErrorCode, GameStatus, VALID_TRANSITIONS } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('GameStateMachine');

export class GameStateMachine {
  private currentStatus: GameStatus;

  constructor(initialStatus: GameStatus = GameStatus.LOBBY) {
    this.currentStatus = initialStatus;
  }

  public getStatus(): GameStatus {
    return this.currentStatus;
  }

  public canTransitionTo(nextStatus: GameStatus): boolean {
    const allowed = VALID_TRANSITIONS[this.currentStatus];
    return allowed ? allowed.includes(nextStatus) : false;
  }

  /**
   * Asserts and executes a state transition. Throws if illegal.
   */
  public transition(nextStatus: GameStatus): GameStatus {
    if (!this.canTransitionTo(nextStatus)) {
      const allowed = VALID_TRANSITIONS[this.currentStatus] || [];
      const err = new Error(
        `Invalid state transition: Cannot transition from ${this.currentStatus} to ${nextStatus}. Allowed: [${allowed.join(
          ', '
        )}]`
      );
      (err as any).code = ErrorCode.INVALID_GAME_STATE;
      logger.warn('State transition rejected', { from: this.currentStatus, to: nextStatus });
      throw err;
    }

    const prev = this.currentStatus;
    this.currentStatus = nextStatus;
    logger.info(`State transitioned: ${prev} -> ${nextStatus}`);
    return this.currentStatus;
  }

  public isDrawingActive(): boolean {
    return this.currentStatus === GameStatus.DRAWING || this.currentStatus === GameStatus.GUESSING;
  }

  public isGuessingActive(): boolean {
    return this.currentStatus === GameStatus.DRAWING || this.currentStatus === GameStatus.GUESSING;
  }

  public isLobby(): boolean {
    return this.currentStatus === GameStatus.LOBBY;
  }

  public isGameComplete(): boolean {
    return this.currentStatus === GameStatus.GAME_COMPLETE;
  }
}
