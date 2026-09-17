import { createLogger } from '../utils/logger.js';

const logger = createLogger('TimerManager');

export type TimerCallback = () => void | Promise<void>;

export class TimerManager {
  private activeTimer: NodeJS.Timeout | null = null;
  private timerName: string | null = null;
  private startedAt: number = 0;
  private durationSeconds: number = 0;
  private remainingMs: number = 0;
  private isPaused: boolean = false;
  private callback: TimerCallback | null = null;

  public startTimer(name: string, seconds: number, callback: TimerCallback): { startedAt: number; endsAt: number } {
    this.cancelTimer();

    this.timerName = name;
    this.durationSeconds = seconds;
    this.startedAt = Date.now();
    this.remainingMs = seconds * 1000;
    this.isPaused = false;
    this.callback = callback;

    const endsAt = this.startedAt + this.remainingMs;

    this.activeTimer = setTimeout(async () => {
      logger.info(`Timer expired: ${name} (${seconds}s)`);
      this.activeTimer = null;
      if (this.callback) {
        try {
          await this.callback();
        } catch (err) {
          logger.error(`Error in timer callback for ${name}`, err);
        }
      }
    }, this.remainingMs);

    logger.info(`Timer started: ${name} (${seconds}s)`);
    return { startedAt: this.startedAt, endsAt };
  }

  public pause(): number {
    if (!this.activeTimer || this.isPaused) return this.getRemainingSeconds();

    clearTimeout(this.activeTimer);
    this.activeTimer = null;
    const elapsed = Date.now() - this.startedAt;
    this.remainingMs = Math.max(0, this.remainingMs - elapsed);
    this.isPaused = true;

    logger.info(`Timer paused: ${this.timerName}, remaining: ${Math.round(this.remainingMs / 1000)}s`);
    return this.getRemainingSeconds();
  }

  public resume(): { startedAt: number; endsAt: number } | null {
    if (!this.isPaused || !this.callback || !this.timerName) return null;

    this.startedAt = Date.now();
    this.isPaused = false;
    const endsAt = this.startedAt + this.remainingMs;

    this.activeTimer = setTimeout(async () => {
      logger.info(`Resumed timer expired: ${this.timerName}`);
      this.activeTimer = null;
      if (this.callback) {
        try {
          await this.callback();
        } catch (err) {
          logger.error(`Error in timer callback for ${this.timerName}`, err);
        }
      }
    }, this.remainingMs);

    logger.info(`Timer resumed: ${this.timerName}, remaining: ${Math.round(this.remainingMs / 1000)}s`);
    return { startedAt: this.startedAt, endsAt };
  }

  public cancelTimer(): void {
    if (this.activeTimer) {
      clearTimeout(this.activeTimer);
      this.activeTimer = null;
    }
    this.timerName = null;
    this.callback = null;
    this.isPaused = false;
    this.remainingMs = 0;
  }

  public getRemainingSeconds(): number {
    if (this.isPaused) {
      return Math.max(0, Math.ceil(this.remainingMs / 1000));
    }
    if (!this.activeTimer) return 0;
    const elapsed = Date.now() - this.startedAt;
    return Math.max(0, Math.ceil((this.remainingMs - elapsed) / 1000));
  }

  public getTimerName(): string | null {
    return this.timerName;
  }
}
