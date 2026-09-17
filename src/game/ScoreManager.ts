import {
  GameScoreResult,
  MysteryCase,
  PlayerScoreBreakdown,
  TheorySubmission,
} from '../types/game';
import { Player } from '../types/player';

export class ScoreManager {
  /**
   * Calculates final authoritative scores and accolade awards for all players.
   */
  public static calculateScores(
    mysteryCase: MysteryCase,
    players: Player[],
    theories: Record<string, TheorySubmission>,
    distorterId: string | null,
    timelineSlots: Record<string, string | null>
  ): Record<string, GameScoreResult> {
    const results: Record<string, GameScoreResult> = {};

    // Count how many detectives correctly accused the distorter
    let distorterAccusedCount = 0;
    const nonDistorterPlayers = players.filter((p) => p.id !== distorterId);

    nonDistorterPlayers.forEach((player) => {
      const theory = theories[player.id];
      if (theory && theory.distorterGuess === distorterId) {
        distorterAccusedCount++;
      }
    });

    const isDistorterSuccessful =
      distorterId !== null &&
      (nonDistorterPlayers.length === 0 ||
        distorterAccusedCount / Math.max(1, nonDistorterPlayers.length) < 0.5);

    // Calculate score for each player
    players.forEach((player) => {
      const isDistorter = player.id === distorterId;
      const theory = theories[player.id];
      const breakdown: PlayerScoreBreakdown = {
        culpritPoints: 0,
        motivePoints: 0,
        timelinePoints: 0,
        evidencePoints: 100, // Participation base evidence points
        distorterPoints: 0,
        speedBonus: 50,
        totalPoints: 0,
        accuracyPercent: 0,
        accolades: [],
      };

      if (isDistorter) {
        // Distorter scoring logic
        if (isDistorterSuccessful) {
          breakdown.distorterPoints = 500;
          breakdown.accolades.push('Master Manipulator');
        } else {
          breakdown.distorterPoints = 150;
        }

        // Check if distorter also knew the culprit
        if (
          theory &&
          theory.culprit.toLowerCase().trim() === mysteryCase.culprit.toLowerCase().trim()
        ) {
          breakdown.culpritPoints = 300;
        }

        breakdown.totalPoints =
          breakdown.culpritPoints +
          breakdown.distorterPoints +
          breakdown.evidencePoints;
        breakdown.accuracyPercent = isDistorterSuccessful ? 95 : 60;
      } else {
        // Detective scoring logic
        if (theory) {
          // Culprit check (+300)
          if (
            theory.culprit.toLowerCase().trim() ===
            mysteryCase.culprit.toLowerCase().trim()
          ) {
            breakdown.culpritPoints = 300;
          }

          // Motive check (+200)
          const lowerMotive = theory.motive.toLowerCase();
          const targetMotive = mysteryCase.motive.toLowerCase();
          if (
            lowerMotive.includes('debt') ||
            lowerMotive.includes('gambling') ||
            lowerMotive.includes('money') ||
            lowerMotive.includes('patent') ||
            targetMotive.split(' ').some((word) => word.length > 3 && lowerMotive.includes(word))
          ) {
            breakdown.motivePoints = 200;
          }

          // Distorter accusation check (+200)
          if (theory.distorterGuess === distorterId) {
            breakdown.distorterPoints = 200;
            breakdown.accolades.push('Sharp Intuition');
          }
        }

        // Timeline completion bonus (+300 if majority of timeline slots filled)
        const filledSlots = Object.values(timelineSlots).filter(Boolean).length;
        if (filledSlots >= 3) {
          breakdown.timelinePoints = 300;
        } else if (filledSlots > 0) {
          breakdown.timelinePoints = 150;
        }

        breakdown.totalPoints =
          breakdown.culpritPoints +
          breakdown.motivePoints +
          breakdown.timelinePoints +
          breakdown.evidencePoints +
          breakdown.distorterPoints +
          breakdown.speedBonus;

        const maxDetectiveScore = 1150;
        breakdown.accuracyPercent = Math.min(
          100,
          Math.round((breakdown.totalPoints / maxDetectiveScore) * 100)
        );
      }

      results[player.id] = {
        playerId: player.id,
        nickname: player.nickname,
        avatar: player.avatar,
        role: isDistorter ? 'DISTORTER' : 'DETECTIVE',
        score: breakdown.totalPoints,
        breakdown,
        theory,
      };
    });

    // Assign top accolade
    let highestScore = -1;
    let bestDetectiveId = '';
    Object.values(results).forEach((r) => {
      if (r.role === 'DETECTIVE' && r.score > highestScore) {
        highestScore = r.score;
        bestDetectiveId = r.playerId;
      }
    });

    if (bestDetectiveId && results[bestDetectiveId]) {
      results[bestDetectiveId].breakdown.accolades.unshift('Chief Detective 🏆');
    }

    return results;
  }
}
