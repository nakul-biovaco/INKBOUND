import React, { useEffect, useState } from 'react';
import { Clock, ArrowRight, Trophy, AlertCircle, Pencil, Eye } from 'lucide-react';
import { Player } from '../../types/player';
import { AvatarBadge } from './AvatarBadge';
import { SoundService } from '../../services/soundService';

export interface TurnTransitionData {
  completedTurnIndex: number;
  previousDrawerId: string;
  previousDrawerName: string;
  revealedObjective: string;
  solved: boolean;
  solverPlayerId?: string;
  solverName?: string;
  scoreAward?: { solverPoints?: number; drawerPoints?: number };
  nextDrawerPlayerId: string;
  nextDrawerName: string;
  nextTurnInSeconds: number;
}

interface TurnTransitionOverlayProps {
  transitionData: TurnTransitionData | null;
  currentUser: Player;
  players: Player[];
  onComplete?: () => void;
}

export const TurnTransitionOverlay: React.FC<TurnTransitionOverlayProps> = ({
  transitionData,
  currentUser,
  players,
  onComplete,
}) => {
  if (!transitionData) return null;

  const [secondsLeft, setSecondsLeft] = useState<number>(transitionData.nextTurnInSeconds || 4);

  const prevDrawerPlayer = players.find((p) => p.id === transitionData.previousDrawerId);
  const nextDrawerPlayer = players.find((p) => p.id === transitionData.nextDrawerPlayerId);

  const isNextDrawerMe = Boolean(
    currentUser &&
    (currentUser.id === transitionData.nextDrawerPlayerId ||
      currentUser.nickname.trim().toLowerCase() === transitionData.nextDrawerName.trim().toLowerCase())
  );

  useEffect(() => {
    setSecondsLeft(transitionData.nextTurnInSeconds || 4);
    SoundService.playTurnStart();

    const interval = setInterval(() => {
      setSecondsLeft((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          if (onComplete) onComplete();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(interval);
  }, [transitionData, onComplete]);

  // Clean the revealed objective for display
  const displayClue = transitionData.revealedObjective
    ? transitionData.revealedObjective.replace(/^#*\s*\d+\s*[—–-]\s*/, '').replace(/^A\s+|^An\s+|^The\s+/i, '').trim()
    : 'Mystery Clue';

  const progressPercent = Math.max(0, Math.min(100, (secondsLeft / (transitionData.nextTurnInSeconds || 4)) * 100));

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/85 backdrop-blur-md select-none animate-fadeIn transition-all duration-300">
      <div className="relative w-full max-w-2xl bg-[#0d1322] border-2 border-slate-700/80 rounded-3xl p-6 sm:p-8 shadow-[0_0_60px_rgba(0,0,0,0.85)] overflow-hidden text-center space-y-6">
        {/* Background ambient radial glows */}
        <div
          className={`absolute -top-24 -left-24 w-64 h-64 rounded-full blur-3xl pointer-events-none opacity-20 ${
            transitionData.solved ? 'bg-emerald-500' : 'bg-amber-500'
          }`}
        />
        <div
          className={`absolute -bottom-24 -right-24 w-64 h-64 rounded-full blur-3xl pointer-events-none opacity-25 ${
            isNextDrawerMe ? 'bg-red-500' : 'bg-sky-500'
          }`}
        />

        {/* 1. ROUND OUTCOME HEADER */}
        <div className="space-y-2">
          {transitionData.solved ? (
            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/40 text-emerald-300 text-xs font-mono font-bold uppercase tracking-wider">
              <Trophy className="w-3.5 h-3.5 text-emerald-400" />
              <span>ROUND {transitionData.completedTurnIndex + 1} SOLVED!</span>
            </div>
          ) : (
            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-amber-500/15 border border-amber-500/40 text-amber-300 text-xs font-mono font-bold uppercase tracking-wider">
              <AlertCircle className="w-3.5 h-3.5 text-amber-400" />
              <span>ROUND {transitionData.completedTurnIndex + 1} TIME'S UP!</span>
            </div>
          )}

          {/* Secret Clue Reveal (Gives immediate closure to guessers & drawer!) */}
          <div className="pt-1">
            <span className="text-xs font-mono text-slate-400 uppercase tracking-widest block mb-1">
              {transitionData.solved ? 'Solved Secret Clue' : 'Unsolved Secret Clue Was'}
            </span>
            <div
              className={`text-2xl sm:text-3xl font-black font-serif tracking-wide py-1 px-4 inline-block rounded-2xl border ${
                transitionData.solved
                  ? 'text-emerald-300 bg-emerald-950/40 border-emerald-500/50 shadow-[0_0_20px_rgba(16,185,129,0.2)]'
                  : 'text-amber-300 bg-amber-950/40 border-amber-500/50 shadow-[0_0_20px_rgba(245,158,11,0.2)]'
              }`}
            >
              "{displayClue}"
            </div>
          </div>

          {/* Solver recap details if solved */}
          {transitionData.solved && transitionData.solverName && (
            <p className="text-xs sm:text-sm text-slate-300 font-sans font-medium">
              Identified by <span className="font-bold text-white">{transitionData.solverName}</span>
              {transitionData.scoreAward?.solverPoints && (
                <span className="text-emerald-400 font-mono font-bold ml-1.5">
                  (+{transitionData.scoreAward.solverPoints} pts)
                </span>
              )}
            </p>
          )}
        </div>

        {/* 2. PLAYER-TO-PLAYER HANDOVER STAGE */}
        <div className="p-4 sm:p-5 rounded-2xl bg-[#141b2d]/80 border border-slate-700/60 flex items-center justify-around gap-2 relative">
          {/* Previous Drawer */}
          <div className="flex flex-col items-center gap-2 max-w-[140px] text-center">
            <div className="relative">
              <AvatarBadge avatar={prevDrawerPlayer?.avatar || 'detective-1'} size="md" />
              <span className="absolute -bottom-1 -right-1 text-[10px] bg-slate-800 border border-slate-600 rounded-full px-1 text-slate-400">
                Prev
              </span>
            </div>
            <div className="min-w-0 w-full">
              <div className="text-xs font-bold text-slate-300 truncate">
                {transitionData.previousDrawerName}
              </div>
              <div className="text-[10px] font-mono text-slate-400">Finished Drawing</div>
            </div>
          </div>

          {/* Animated Transfer Arrow */}
          <div className="flex flex-col items-center gap-1 text-slate-500 px-2 shrink-0">
            <span className="text-[9px] font-mono uppercase tracking-widest text-slate-400 font-bold">
              HANDING OVER
            </span>
            <div className="flex items-center gap-1 text-red-400 animate-pulse">
              <span className="w-6 h-0.5 bg-red-500/60 rounded" />
              <ArrowRight className="w-5 h-5" />
            </div>
          </div>

          {/* Next Drawer */}
          <div className="flex flex-col items-center gap-2 max-w-[140px] text-center">
            <div className="relative">
              <AvatarBadge avatar={nextDrawerPlayer?.avatar || 'detective-2'} size="md" />
              <span className="absolute -bottom-1 -right-1 text-[10px] bg-red-600 border border-red-400 text-white rounded-full px-1 font-bold animate-bounce">
                Next
              </span>
            </div>
            <div className="min-w-0 w-full">
              <div className="text-xs font-bold text-white truncate">
                {transitionData.nextDrawerName}
              </div>
              <div className="text-[10px] font-mono text-red-400 font-semibold">Artist Up Next</div>
            </div>
          </div>
        </div>

        {/* 3. PERSONALIZED USER ALERT & STATUS */}
        <div
          className={`p-3 rounded-xl border flex items-center justify-center gap-2.5 text-xs sm:text-sm font-medium transition-all ${
            isNextDrawerMe
              ? 'bg-red-950/60 border-red-500/80 text-red-200 shadow-[0_0_20px_rgba(239,68,68,0.25)]'
              : 'bg-sky-950/60 border-sky-500/80 text-sky-200 shadow-[0_0_20px_rgba(56,189,248,0.2)]'
          }`}
        >
          {isNextDrawerMe ? (
            <>
              <Pencil className="w-4 h-4 text-red-400 animate-bounce shrink-0" />
              <span className="font-bold text-white">
                🎨 YOUR TURN TO SKETCH! Choose your fresh clue in a moment...
              </span>
            </>
          ) : (
            <>
              <Eye className="w-4 h-4 text-sky-400 animate-pulse shrink-0" />
              <span>
                <span className="font-bold text-white">{transitionData.nextDrawerName}</span> is sketching next. Get your magnifying glass ready!
              </span>
            </>
          )}
        </div>

        {/* 4. CIRCULAR COUNTDOWN RING & TIMER */}
        <div className="flex flex-col items-center gap-1.5 pt-1">
          <div className="flex items-center gap-2 text-xs font-mono text-slate-400 font-semibold">
            <Clock className="w-3.5 h-3.5 text-red-400 animate-spin" />
            <span>Next Round Starts in <strong className="text-white text-sm">{secondsLeft}s</strong></span>
          </div>

          {/* Sleek Progress Bar */}
          <div className="w-48 h-1.5 bg-slate-800 rounded-full overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-red-600 via-amber-500 to-emerald-500 transition-all duration-1000 ease-linear rounded-full"
              style={{ width: `${progressPercent}%` }}
            />
          </div>
        </div>
      </div>
    </div>
  );
};
