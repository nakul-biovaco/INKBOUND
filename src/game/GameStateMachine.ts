import { GameStatus } from '../types/game';

export class GameStateMachine {
  private static readonly VALID_TRANSITIONS: Record<GameStatus, GameStatus[]> = {
    LOBBY: ['GAME_INITIALIZING'],
    GAME_INITIALIZING: ['STORY_SELECTION', 'CASE_INTRO', 'LOBBY'],
    STORY_SELECTION: ['PLAYER_DRAWING', 'TURN_START', 'CASE_INTRO', 'LOBBY'],
    CASE_INTRO: ['CLUE_DISTRIBUTION', 'PLAYER_DRAWING', 'TURN_START'],
    CLUE_DISTRIBUTION: ['TURN_START'],
    TURN_START: ['PLAYER_DRAWING'],
    PLAYER_DRAWING: ['DRAWING_SUBMITTED'],
    DRAWING_SUBMITTED: ['EVIDENCE_REVEAL'],
    EVIDENCE_REVEAL: ['NEXT_PLAYER', 'ALL_TURNS_COMPLETE', 'EVIDENCE_DISCOVERED', 'DISCUSSION'],
    EVIDENCE_DISCOVERED: ['NEXT_PLAYER', 'DISCUSSION', 'ALL_TURNS_COMPLETE'],
    DISCUSSION: ['NEXT_PLAYER', 'PLAYER_DRAWING', 'ALL_TURNS_COMPLETE'],
    NEXT_PLAYER: ['TURN_START'],
    ALL_TURNS_COMPLETE: ['INVESTIGATION'],
    INVESTIGATION: ['QUESTIONING', 'TIMELINE_BUILDING', 'FINAL_THEORY'],
    QUESTIONING: ['INVESTIGATION', 'TIMELINE_BUILDING', 'FINAL_THEORY'],
    TIMELINE_BUILDING: ['INVESTIGATION', 'QUESTIONING', 'FINAL_THEORY'],
    FINAL_THEORY: ['ACCUSATION_LOCK'],
    ACCUSATION_LOCK: ['TRUTH_REVEAL'],
    TRUTH_REVEAL: ['SCORING'],
    SCORING: ['RESULTS'],
    RESULTS: ['GAME_FINISHED', 'LOBBY'],
    GAME_FINISHED: ['LOBBY'],
  };

  /**
   * Validates whether a state transition from currentStatus to nextStatus is permissible.
   */
  public static canTransition(currentStatus: GameStatus, nextStatus: GameStatus): boolean {
    const allowed = this.VALID_TRANSITIONS[currentStatus];
    return allowed ? allowed.includes(nextStatus) : false;
  }

  /**
   * Asserts valid transition, throwing a descriptive error if invalid.
   */
  public static assertTransition(currentStatus: GameStatus, nextStatus: GameStatus): void {
    if (!this.canTransition(currentStatus, nextStatus)) {
      throw new Error(
        `[GameStateMachine] Invalid state transition: cannot transition from ${currentStatus} to ${nextStatus}. Allowed: ${
          this.VALID_TRANSITIONS[currentStatus]?.join(', ') || 'none'
        }`
      );
    }
  }

  /**
   * Determines if the current state permits active drawing.
   */
  public static isDrawingAllowed(status: GameStatus): boolean {
    return status === 'PLAYER_DRAWING';
  }

  /**
   * Determines if the game is in the collective investigation phase.
   */
  public static isInvestigationPhase(status: GameStatus): boolean {
    return (
      status === 'INVESTIGATION' ||
      status === 'QUESTIONING' ||
      status === 'TIMELINE_BUILDING' ||
      status === 'FINAL_THEORY'
    );
  }

  /**
   * Determines if secrets (Distorter identity, case truth) can be legitimately shown.
   */
  public static isTruthRevealed(status: GameStatus): boolean {
    return (
      status === 'TRUTH_REVEAL' ||
      status === 'SCORING' ||
      status === 'RESULTS' ||
      status === 'GAME_FINISHED'
    );
  }
}
