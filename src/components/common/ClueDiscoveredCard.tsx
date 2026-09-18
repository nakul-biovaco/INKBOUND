import React, { useEffect, useState } from 'react';
import { X, FileText, CheckCircle2, Search, Clock } from 'lucide-react';
import { SoundService } from '../../services/soundService';

interface ClueDiscoveredCardProps {
  isOpen: boolean;
  onClose: () => void;
  clueNumber: number;
  revealedText: string;
  solvedObjective?: string | null;
  solverName?: string | null;
  drawerName?: string | null;
  storyTitle?: string | null;
  durationSeconds?: number;
}

export const ClueDiscoveredCard: React.FC<ClueDiscoveredCardProps> = ({
  isOpen,
  onClose,
  clueNumber,
  revealedText,
  solvedObjective,
  solverName,
  drawerName,
  storyTitle,
  durationSeconds = 15,
}) => {
  const [secondsLeft, setSecondsLeft] = useState<number>(durationSeconds);

  useEffect(() => {
    if (!isOpen) return;

    setSecondsLeft(durationSeconds);
    SoundService.playDramaticSting();

    const interval = setInterval(() => {
      setSecondsLeft((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          onClose();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(interval);
  }, [isOpen, durationSeconds, onClose]);

  if (!isOpen) return null;

  const progressPercent = Math.max(0, Math.min(100, (secondsLeft / durationSeconds) * 100));

  return (
    <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-3 sm:p-6 animate-in fade-in zoom-in-95 duration-200 select-none">
      {/* VINTAGE PARCHMENT CARD CONTAINER */}
      <div
        className="relative w-full max-w-2xl bg-gradient-to-b from-[#f9f5ea] via-[#f4ede0] to-[#eae0cc] text-[#2c221a] rounded-3xl border-4 border-[#8c6d48] shadow-[0_25px_70px_rgba(0,0,0,0.9),inset_0_0_100px_rgba(139,94,60,0.28)] overflow-hidden p-6 sm:p-8"
        style={{
          boxShadow: '0 30px 90px rgba(0, 0, 0, 0.9), inset 0 0 120px rgba(120, 80, 45, 0.25)',
        }}
      >
        {/* PARCHMENT CORNER ACCENTS */}
        <div className="absolute top-2 left-2 w-8 h-8 border-t-2 border-l-2 border-[#8c6d48]/60 pointer-events-none" />
        <div className="absolute top-2 right-2 w-8 h-8 border-t-2 border-r-2 border-[#8c6d48]/60 pointer-events-none" />
        <div className="absolute bottom-2 left-2 w-8 h-8 border-b-2 border-l-2 border-[#8c6d48]/60 pointer-events-none" />
        <div className="absolute bottom-2 right-2 w-8 h-8 border-b-2 border-r-2 border-[#8c6d48]/60 pointer-events-none" />

        {/* TOP BAR: BADGE, GRACE TIMER, AND CLOSE (CROSS) BUTTON */}
        <div className="flex items-start justify-between gap-3 mb-4">
          <div className="flex items-center gap-2.5">
            {/* EVIDENCE RUBBER STAMP */}
            <div className="px-3 py-1 rounded border-2 border-[#8b1e1b] bg-[#8b1e1b]/10 text-[#8b1e1b] font-mono text-xs sm:text-sm font-black uppercase tracking-widest -rotate-1 shadow-sm flex items-center gap-1.5">
              <FileText className="w-4 h-4" />
              <span>CONFIDENTIAL EVIDENCE • CLUE #{clueNumber} DISCOVERED</span>
            </div>
          </div>

          {/* CLOSE (CROSS) BUTTON */}
          <button
            type="button"
            onClick={() => {
              SoundService.playClick();
              onClose();
            }}
            title="Dismiss early"
            className="shrink-0 w-8 h-8 rounded-full bg-[#3d2b1f]/15 hover:bg-[#8b1e1b] text-[#3d2b1f] hover:text-white flex items-center justify-center transition-all border border-[#8c6d48]/60 cursor-pointer shadow-sm"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* CASE TITLE & CLUE HEADER */}
        <div className="mb-4">
          <div className="text-[11px] font-mono uppercase tracking-[0.2em] text-[#7a6047]">
            {storyTitle ? `Case Archive: ${storyTitle}` : 'Official Case Dossier'}
          </div>
          <h2 className="text-xl sm:text-2xl font-serif font-black text-[#1f1712] tracking-wide mt-0.5">
            {solvedObjective ? `Uncovered: ${solvedObjective}` : 'Critical Evidence Uncovered'}
          </h2>
        </div>

        {/* PARCHMENT STORY NARRATIVE BODY (BIG, UNTRUNCATED TEXT) */}
        <div className="relative my-3 p-4 sm:p-5 bg-[#fffcf4]/80 rounded-2xl border border-[#d6c4a8] shadow-inner">
          <p className="font-serif text-base sm:text-lg text-[#2a2017] leading-relaxed italic select-text">
            "{revealedText}"
          </p>
        </div>

        {/* DISCOVERY METADATA */}
        <div className="mt-4 flex flex-wrap items-center justify-between gap-3 text-xs font-mono text-[#5c4736] pt-3 border-t border-[#cbb79a]/80">
          <div className="flex items-center gap-3">
            {solverName && (
              <span className="flex items-center gap-1 text-[#1a5b3a] font-bold">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                Solved by: <strong>{solverName}</strong>
              </span>
            )}
            {drawerName && (
              <span className="flex items-center gap-1 text-[#4a3a2d]">
                <Search className="w-3.5 h-3.5 text-amber-700" />
                Drawn by: <strong>{drawerName}</strong>
              </span>
            )}
          </div>
          <div className="text-[11px] text-[#7a6047] italic">
            Evidence logged into investigation timeline
          </div>
        </div>

        {/* 15-SECOND GRACE PERIOD PROGRESS BAR & COUNTDOWN */}
        <div className="mt-5 space-y-1.5">
          <div className="flex items-center justify-between text-[11px] font-mono text-[#7a6047]">
            <span className="flex items-center gap-1 font-bold text-[#8b1e1b]">
              <Clock className="w-3.5 h-3.5 text-[#8b1e1b]" />
              Grace Period: {secondsLeft}s left to read
            </span>
            <span>Click × to continue immediately</span>
          </div>
          <div className="w-full h-2 bg-[#d8c8af] rounded-full overflow-hidden border border-[#b8a282]">
            <div
              className="h-full bg-gradient-to-r from-amber-700 via-red-700 to-amber-600 transition-all duration-1000 ease-linear rounded-full"
              style={{ width: `${progressPercent}%` }}
            />
          </div>
        </div>
      </div>
    </div>
  );
};
