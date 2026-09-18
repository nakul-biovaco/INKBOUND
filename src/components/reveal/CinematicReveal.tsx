import React, { useEffect } from 'react';
import { ArrowRight } from 'lucide-react';
import { AuthoritativeGameState } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { AvatarBadge } from '../common/AvatarBadge';
import { SoundService } from '../../services/soundService';
import { CaseManager } from '../../game/CaseManager';
import { getStoryArtwork } from '../../utils/storyArtwork';

interface CinematicRevealProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  roomCode?: string;
  onProceedToResults: () => void;
  onLeaveRoom?: () => void;
}

export const CinematicReveal: React.FC<CinematicRevealProps> = ({
  gameState,
  currentUser,
  roomCode,
  onProceedToResults,
  onLeaveRoom,
}) => {
  useEffect(() => {
    SoundService.playDramaticSting();
  }, []);

  const resolvedStoryId =
    (gameState as any)?.storyId ||
    gameState.currentCase?.id ||
    gameState.caseId ||
    gameState.currentCase?.title ||
    'story_01_the_midnight_museum';

  const resolvedCase = CaseManager.getCase(resolvedStoryId);

  const currentCase =
    gameState.currentCase &&
    gameState.currentCase.culprit &&
    gameState.currentCase.id === resolvedCase.id
      ? gameState.currentCase
      : resolvedCase;

  const culpritName = currentCase?.culprit || 'Dominic Hart';
  const culpritChar = currentCase?.characters?.find((c) => c.name === culpritName) || currentCase?.characters?.[0];
  const motiveText = currentCase?.motive || 'Massive debts from underground gambling';
  const distorter = gameState.players.find((p) => p.id === gameState.distorterId);

  const timelineEvents = currentCase?.timeline?.length
    ? currentCase.timeline.map((t) => ({ time: t.time, text: t.event }))
    : [
        { time: 'Phase 1', text: `${culpritName} accessed the scene using an unauthorized key.` },
        { time: 'Phase 2', text: 'Critical evidence was compromised during the commotion.' },
        { time: 'Phase 3', text: 'The true motive was hidden to mislead investigators.' },
      ];

  const currentArtwork = getStoryArtwork(currentCase?.genre, currentCase?.title, currentCase?.id);

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-40 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/80 via-[#08090d]/60 to-[#08090d]/95 pointer-events-none" />

      {/* UNIVERSAL HEADER */}
      <GameHeader
        currentUser={currentUser}
        roomCode={roomCode || gameState.roomId.substring(0, 6).toUpperCase()}
        playerCount={gameState.players.length}
        maxPlayers={8}
        currentPhase="TRUTH_REVEAL"
        caseTitle={currentCase?.title || 'The Midnight Museum Heist'}
        roundText="Phase 5 • The Declassified Truth"
        onLeaveRoom={onLeaveRoom}
      />

      {/* MAIN 3-COLUMN LAYOUT */}
      <main className="relative z-10 w-full max-w-[1440px] mx-auto my-auto px-3 sm:px-6 py-5 sm:py-6 grid grid-cols-1 md:grid-cols-12 gap-4 sm:gap-6 items-start">
        {/* LEFT COLUMN: CINEMATIC POLAROID PHOTO & CRIME NOTE (4 cols) */}
        <div className="md:col-span-4 space-y-4">
          <div className="relative bg-[#fdfcf9] p-3 pb-5 rounded-2xl shadow-2xl border-2 border-[#b89e7c] rotate-1">
            {/* Red Push Pin on Photo */}
            <div className="w-4 h-4 rounded-full bg-red-800 absolute -top-2 left-1/2 -translate-x-1/2 shadow-md border-2 border-[#541010] z-10" />
            <div className="w-full aspect-[4/3] rounded-lg overflow-hidden bg-slate-950 relative border border-[#cfbeab]">
              <img
                src={currentArtwork.img}
                alt={currentArtwork.caption}
                className="w-full h-full object-cover filter contrast-115 sepia-[0.25]"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent" />
              <div className="absolute bottom-2 left-3 right-3 text-[11px] font-mono text-amber-200 font-bold uppercase tracking-wider">
                CRIME SCENE: {currentCase?.setting || currentArtwork.caption}
              </div>
            </div>
            <div className="mt-2 text-center font-serif text-xs font-bold text-[#4a3525]">
              EXHIBIT A: {currentArtwork.badge}
            </div>
          </div>

          <div className="bg-[#f5ebd7] p-4 rounded-xl shadow-xl -rotate-1 border-2 border-[#d6be96] text-[#2c1d10] font-handwriting text-base leading-snug">
            {currentArtwork.quote}
          </div>
        </div>

        {/* CENTER COLUMN: TIMELINE OF TRUE CRIME EVENTS (5 cols) */}
        <div
          className="md:col-span-5 text-[#221711] border-3 border-[#8c6d48] rounded-3xl p-5 sm:p-6 shadow-[0_15px_45px_rgba(0,0,0,0.6),inset_0_0_50px_rgba(139,94,60,0.15)] space-y-4 relative overflow-hidden select-none"
          style={{
            background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
            backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
            backgroundSize: '16px 16px, 100% 100%',
          }}
        >
          {/* Corner Accents */}
          <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

          <div className="flex items-center justify-between border-b-2 border-[#bfa98e]/70 pb-2.5">
            <div className="flex items-center gap-2">
              <span className="text-xs font-mono font-bold uppercase tracking-wider text-[#1a110a]">
                Chronological Case Sequence
              </span>
            </div>
            <span className="text-[10px] font-mono text-emerald-950 font-black px-2 py-0.5 rounded bg-emerald-100 border-2 border-emerald-800 shadow-xs -rotate-1">
              ★ CASE RESOLVED
            </span>
          </div>

          <div className="relative pl-6 space-y-5 pt-1">
            {/* Vertical Red Connecting String Yarn */}
            <div className="absolute left-[7px] top-2 bottom-2 w-[2.5px] bg-[#a82424] shadow-xs" />

            {timelineEvents.map((event) => (
              <div key={event.time} className="relative flex items-start gap-3">
                {/* Red Circular Node Stamped Pin */}
                <div className="absolute -left-[23px] top-1 w-3.5 h-3.5 rounded-full bg-[#8a1c1c] border-2 border-[#fffdf9] shadow-sm" />

                <div className="bg-[#fffdf9] p-2.5 rounded-xl border border-[#b89e7c] shadow-xs w-full">
                  <span className="text-[11px] font-mono font-black text-red-900 block">
                    {event.time}
                  </span>
                  <p className="text-xs text-[#2a1d13] font-serif font-medium leading-snug mt-0.5">
                    {event.text}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* RIGHT COLUMN: CULPRIT, MOTIVE & DISTORTER DOSSIERS (3 cols) */}
        <div className="md:col-span-3 space-y-3.5">
          {/* Culprit Polaroid Card */}
          <div
            className="text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-4 shadow-lg space-y-2 relative overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
            }}
          >
            <div className="flex items-center justify-between border-b border-[#bfa98e]/70 pb-1">
              <span className="text-[10px] font-mono uppercase text-[#6e533d] font-bold">THE REAL PERPETRATOR</span>
              <span className="text-[9px] font-mono text-red-900 font-black bg-red-100 border border-red-800 px-1.5 py-0.2 rounded">
                IDENTIFIED
              </span>
            </div>
            <div className="flex items-center gap-3 pt-1">
              <div className="p-1 bg-[#fffdf9] border border-[#b89e7c] rounded shadow-sm">
                <AvatarBadge avatar={culpritChar?.avatar || 'shield'} size="lg" />
              </div>
              <div>
                <div className="text-sm font-bold text-[#1a110a] font-serif">{culpritName}</div>
                <div className="text-[10px] text-[#7a5e45] font-mono">{culpritChar?.role || 'Perpetrator'}</div>
              </div>
            </div>
          </div>

          {/* Motive Card */}
          <div
            className="text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-4 shadow-lg space-y-2 relative overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
            }}
          >
            <div className="text-[10px] font-mono uppercase text-[#6e533d] font-bold border-b border-[#bfa98e]/70 pb-1">
              PROVEN MOTIVE
            </div>
            <div className="flex items-center gap-3 pt-1">
              <div className="w-10 h-10 rounded-lg bg-[#ede1cf] border border-[#b89e7c] flex items-center justify-center text-xl shrink-0 shadow-inner">
                🗝️
              </div>
              <div>
                <div className="text-xs font-bold text-[#1a110a] font-serif leading-snug">{motiveText}</div>
                <div className="text-[10px] text-[#7a5e45] font-mono">Criminal Catalyst</div>
              </div>
            </div>
          </div>

          {/* Distorter / Impostor Unmasked Dossier */}
          <div
            className="text-[#221711] border-2 border-red-800/80 rounded-2xl p-4 shadow-lg space-y-1.5 relative overflow-hidden bg-red-50/50"
          >
            <div className="text-[10px] font-mono uppercase text-red-900 font-black border-b border-red-800/40 pb-1 flex items-center justify-between">
              <span>UNMASKED IMPOSTOR</span>
              <span>★ CONFIDENTIAL</span>
            </div>
            <div className="flex items-center gap-2.5 text-xs text-[#2a1d13] font-mono font-medium pt-1">
              <AvatarBadge avatar={distorter?.avatar || 'shield'} size="sm" />
              <span>
                {distorter
                  ? `${distorter.nickname} was the secret Impostor!`
                  : 'No undercover imposter in this game.'}
              </span>
            </div>
          </div>

          {/* Proceed to Results Button */}
          <button
            onClick={onProceedToResults}
            className="w-full py-3.5 px-4 rounded-xl bg-[#8a1c1c] hover:bg-[#9e2222] text-white font-mono font-black text-xs uppercase tracking-wider shadow-lg border-2 border-[#541010] transition-all flex items-center justify-center gap-2 mt-3 cursor-pointer active:scale-98"
          >
            <span>VIEW FINAL MERIT RANKINGS</span>
            <ArrowRight className="w-4 h-4" />
          </button>
        </div>
      </main>

      {/* FOOTER */}
      <footer className="relative z-10 w-full max-w-5xl mx-auto px-6 py-2 text-center text-[11px] text-slate-500 font-mono">
        INKBOUND • The Mystery Solved
      </footer>
    </div>
  );
};
