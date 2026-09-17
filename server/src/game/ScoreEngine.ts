import { StoryEvent } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('ScoreEngine');

export interface ScoreAward {
  solverPlayerId: string;
  drawerPlayerId: string;
  solverPoints: number;
  drawerPoints: number;
  speedBonus: number;
  timeToSolveMs: number;
  difficultyMultiplier: number;
}

export class ScoreEngine {
  /**
   * Calculates points awarded to the solver and drawer upon successful clue solve
   */
  public static calculateRoundScore(
    event: StoryEvent,
    roundDurationSeconds: number,
    timeRemainingSeconds: number,
    solverPlayerId: string,
    drawerPlayerId: string
  ): ScoreAward {
    const basePoints = event.basePoints || 150;
    const difficultyMultiplier =
      event.difficulty === 'HARD' ? 1.5 : event.difficulty === 'MEDIUM' ? 1.2 : 1.0;

    // Speed bonus: up to 50 points based on fraction of time remaining
    const timeFraction = Math.max(0, Math.min(1, timeRemainingSeconds / roundDurationSeconds));
    const speedBonus = Math.round(50 * timeFraction);

    const solverPoints = Math.round((basePoints + speedBonus) * difficultyMultiplier);

    // Drawer is rewarded for clear communication: base 100 + half speed bonus
    const drawerPoints = Math.round((100 + speedBonus * 0.5) * difficultyMultiplier);

    const timeToSolveMs = Math.max(0, (roundDurationSeconds - timeRemainingSeconds) * 1000);

    logger.info('Round score calculated', {
      eventId: event.eventId,
      solverPlayerId,
      drawerPlayerId,
      solverPoints,
      drawerPoints,
      speedBonus,
    });

    return {
      solverPlayerId,
      drawerPlayerId,
      solverPoints,
      drawerPoints,
      speedBonus,
      timeToSolveMs,
      difficultyMultiplier,
    };
  }
}
