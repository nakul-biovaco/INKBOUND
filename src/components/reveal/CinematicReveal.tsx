import React, { useEffect } from 'react';
import { ArrowRight } from 'lucide-react';
import { AuthoritativeGameState } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { AvatarBadge } from '../common/AvatarBadge';
import { SoundService } from '../../services/soundService';
import { CaseManager } from '../../game/CaseManager';

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

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-35 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* TOP UNIVERSAL HEADER */}
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
        {/* LEFT COLUMN: CINEMATIC MUSEUM PHOTO & QUOTE (4 cols) */}
        <div className="md:col-span-4 space-y-4">
          <div className="w-full aspect-[4/3] rounded-2xl overflow-hidden shadow-2xl border border-slate-700/80 bg-slate-900 relative">
            <img
              src="/assets/museum_heist.jpg"
              alt="Museum Crime Scene"
              className="w-full h-full object-cover filter brightness-90 contrast-110"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-transparent to-transparent" />
            <div className="absolute bottom-3 left-4 right-4 text-xs font-mono text-amber-300 font-bold">
              SCENE: {currentCase?.setting || 'Metropolitan Antiquities Museum Vault'}
            </div>
          </div>

          <div className="bg-[#f8f1e0] p-4 rounded-xl shadow-xl -rotate-1 border border-[#d8c3a5] text-[#2c1d10] font-handwriting text-base leading-snug">
            "The truth was right there... in every single drawing."
          </div>
        </div>

        {/* CENTER COLUMN: TIMELINE OF TRUE CRIME EVENTS (5 cols) */}
        <div className="md:col-span-5 bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-5 sm:p-6 shadow-2xl space-y-5 backdrop-blur-md">
          <div className="flex items-center justify-between border-b border-slate-800 pb-3">
            <div className="text-xs font-mono uppercase tracking-wider text-slate-400">
              What Really Happened
            </div>
            <span className="text-[10px] font-mono text-emerald-400 font-bold">● RESOLVED</span>
          </div>

          <div className="relative pl-6 space-y-5">
            {/* Vertical Red Connecting Line */}
            <div className="absolute left-[7px] top-2 bottom-2 w-[2px] bg-red-600/70" />

            {timelineEvents.map((event) => (
              <div key={event.time} className="relative flex items-start gap-3">
                {/* Red Circular Node */}
                <div className="absolute -left-[23px] top-1 w-3.5 h-3.5 rounded-full bg-red-600 border-2 border-[#0e131f] shadow-[0_0_10px_rgba(220,38,38,0.9)]" />

                <div>
                  <span className="text-xs font-mono font-bold text-red-400 block">
                    {event.time}
                  </span>
                  <p className="text-xs text-slate-200 font-medium leading-snug mt-0.5">
                    {event.text}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* RIGHT COLUMN: CULPRIT, MOTIVE, METHOD & DISTORTER DOSSIER (3 cols) */}
        <div className="md:col-span-3 space-y-3.5">
          {/* Culprit Card */}
          <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-2">
            <div className="text-[11px] font-mono uppercase text-slate-400">The Real Culprit</div>
            <div className="flex items-center gap-3">
              <AvatarBadge avatar={culpritChar?.avatar || 'shield'} size="lg" />
              <div>
                <div className="text-sm font-bold text-white font-serif">{culpritName}</div>
                <div className="text-[10px] text-slate-400">{culpritChar?.role || 'Perpetrator'}</div>
              </div>
            </div>
          </div>

          {/* Motive Card */}
          <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-2">
            <div className="text-[11px] font-mono uppercase text-slate-400">True Motive</div>
            <div className="flex items-center gap-3">
              <AvatarBadge avatar="spark" size="lg" />
              <div>
                <div className="text-sm font-bold text-white font-serif">{motiveText}</div>
                <div className="text-[10px] text-slate-400">Secret Motive</div>
              </div>
            </div>
          </div>

          {/* Distorter Identity Card */}
          <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-1.5">
            <div className="text-[11px] font-mono uppercase text-red-400 font-bold">The Secret Impostor</div>
            <div className="flex items-center gap-2 text-xs text-slate-300 font-medium leading-snug">
              <AvatarBadge avatar={distorter?.avatar || 'shield'} size="sm" />
              <span>
                {distorter
                  ? `${distorter.nickname} was the secret Impostor!`
                  : 'There was no impostor in this game.'}
              </span>
            </div>
          </div>

          {/* Proceed to Results Button */}
          <button
            onClick={onProceedToResults}
            className="w-full py-3.5 px-4 rounded-xl bg-gradient-to-r from-[#991b1b] via-[#dc2626] to-[#991b1b] hover:from-[#b91c1c] hover:via-[#ef4444] hover:to-[#b91c1c] text-white font-bold text-xs uppercase tracking-wider shadow-[0_4px_15px_rgba(220,38,38,0.45)] transition-all flex items-center justify-center gap-2 mt-3"
          >
            <span>View Scoreboard</span>
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
