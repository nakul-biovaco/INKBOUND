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
      {/* VINTAGE INVESTIGATION PARCHMENT CONTAINER */}
      <div
        className="relative w-full max-w-2xl text-[#221711] rounded-3xl border-4 border-[#8c6d48] shadow-[0_25px_80px_rgba(0,0,0,0.9),inset_0_0_90px_rgba(139,94,60,0.22)] overflow-hidden text-center p-6 sm:p-8 space-y-5 select-none"
        style={{
          background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
          backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
          backgroundSize: '16px 16px, 100% 100%',
        }}
      >
        {/* Parchment Corner Decorative Accents */}
        <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
        <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
        <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
        <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

        {/* Vintage Brass Paperclip Illustration */}
        <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

        {/* 1. ROUND OUTCOME HEADER & RUBBER STAMP */}
        <div className="space-y-2">
          {transitionData.solved ? (
            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded border-2 border-emerald-800 bg-emerald-800/10 text-emerald-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm">
              <Trophy className="w-3.5 h-3.5 text-emerald-800" />
              <span>★ CASE PROGRESS // ROUND {transitionData.completedTurnIndex + 1} SOLVED!</span>
            </div>
          ) : (
            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded border-2 border-red-800 bg-red-800/10 text-red-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm">
              <AlertCircle className="w-3.5 h-3.5 text-red-800" />
              <span>⚠️ INCIDENT REPORT // ROUND {transitionData.completedTurnIndex + 1} TIME EXPIRED</span>
            </div>
          )}

          {/* Secret Clue Reveal */}
          <div className="pt-1">
            <span className="text-[11px] font-mono text-[#6e533d] uppercase tracking-[0.2em] font-bold block mb-1">
              {transitionData.solved ? 'IDENTIFIED SECRET EVIDENCE WAS' : 'UNSOLVED SECRET EVIDENCE WAS'}
            </span>
            <div
              className={`text-2xl sm:text-3xl font-black font-serif tracking-wide py-1.5 px-5 inline-block rounded-xl border-2 shadow-sm ${
                transitionData.solved
                  ? 'text-emerald-950 bg-emerald-100/90 border-emerald-700'
                  : 'text-[#1a110a] bg-[#ebe0ce] border-[#8c6d48]'
              }`}
            >
              "{displayClue}"
            </div>
          </div>

          {/* Solver recap details if solved */}
          {transitionData.solved && transitionData.solverName && (
            <p className="text-xs sm:text-sm text-[#4a3525] font-mono font-medium">
              Identified by <span className="font-bold text-[#1a110a] underline">{transitionData.solverName}</span>
              {transitionData.scoreAward?.solverPoints && (
                <span className="text-emerald-800 font-mono font-black ml-1.5">
                  (+{transitionData.scoreAward.solverPoints} pts)
                </span>
              )}
            </p>
          )}
        </div>

        {/* 2. PLAYER-TO-PLAYER HANDOVER STAGE (MANIFEST) */}
        <div className="p-4 sm:p-5 rounded-2xl bg-[#ede3d1]/90 border-2 border-[#b89e7c] flex items-center justify-around gap-2 relative shadow-inner">
          {/* Previous Drawer */}
          <div className="flex flex-col items-center gap-1.5 max-w-[140px] text-center">
            <div className="relative">
              <AvatarBadge avatar={prevDrawerPlayer?.avatar || 'detective-1'} size="md" />
              <span className="absolute -bottom-1 -right-1 text-[9px] font-mono bg-[#ded0bd] border border-[#a88f72] rounded-full px-1 text-[#4a3525] font-bold">
                Prev
              </span>
            </div>
            <div className="min-w-0 w-full">
              <div className="text-xs font-bold text-[#1a110a] truncate">
                {transitionData.previousDrawerName}
              </div>
              <div className="text-[10px] font-mono text-[#7a6047]">Finished Sketching</div>
            </div>
          </div>

          {/* Animated Transfer Arrow */}
          <div className="flex flex-col items-center gap-1 text-[#7a6047] px-2 shrink-0">
            <span className="text-[9px] font-mono uppercase tracking-widest font-black text-[#5c422e]">
              HANDING OVER
            </span>
            <div className="flex items-center gap-1 text-red-800 animate-pulse">
              <span className="w-6 h-0.5 bg-red-800/80 rounded" />
              <ArrowRight className="w-5 h-5" />
            </div>
          </div>

          {/* Next Drawer */}
          <div className="flex flex-col items-center gap-1.5 max-w-[140px] text-center">
            <div className="relative">
              <AvatarBadge avatar={nextDrawerPlayer?.avatar || 'detective-2'} size="md" />
              <span className="absolute -bottom-1 -right-1 text-[9px] font-mono bg-red-800 border border-red-900 text-white rounded-full px-1 font-bold animate-bounce">
                Next
              </span>
            </div>
            <div className="min-w-0 w-full">
              <div className="text-xs font-bold text-[#1a110a] truncate">
                {transitionData.nextDrawerName}
              </div>
              <div className="text-[10px] font-mono text-red-800 font-bold">Artist Up Next</div>
            </div>
          </div>
        </div>

        {/* 3. PERSONALIZED USER ALERT & STATUS */}
        <div
          className={`p-3 rounded-xl border-2 flex items-center justify-center gap-2.5 text-xs sm:text-sm font-medium transition-all ${
            isNextDrawerMe
              ? 'bg-red-800/10 border-red-800 text-red-900 shadow-sm'
              : 'bg-[#ede3d1] border-[#a68d71] text-[#3d2b1f]'
          }`}
        >
          {isNextDrawerMe ? (
            <>
              <Pencil className="w-4 h-4 text-red-800 animate-bounce shrink-0" />
              <span className="font-bold text-red-900 font-mono">
                🎨 YOUR TURN TO SKETCH! Choose your fresh clue in a moment...
              </span>
            </>
          ) : (
            <>
              <Eye className="w-4 h-4 text-[#7a5839] animate-pulse shrink-0" />
              <span className="font-mono text-[#3d2b1f]">
                <strong className="text-[#1a110a]">{transitionData.nextDrawerName}</strong> is sketching next. Ready your investigative eye!
              </span>
            </>
          )}
        </div>

        {/* 4. COUNTDOWN CLOCK & TIMER */}
        <div className="flex flex-col items-center gap-1.5 pt-1">
          <div className="flex items-center gap-2 text-xs font-mono text-[#6e533d] font-bold">
            <Clock className="w-3.5 h-3.5 text-red-800 animate-spin" />
            <span>Next Round Starts in <strong className="text-[#1a110a] text-sm">{secondsLeft}s</strong></span>
          </div>

          {/* Vintage Ink Progress Bar */}
          <div className="w-48 h-2 bg-[#dfd3bf] border border-[#a88f72] rounded-full overflow-hidden p-0.5">
            <div
              className="h-full bg-gradient-to-r from-red-800 via-amber-700 to-emerald-800 transition-all duration-1000 ease-linear rounded-full"
              style={{ width: `${progressPercent}%` }}
            />
          </div>
        </div>
      </div>
    </div>
  );
};
