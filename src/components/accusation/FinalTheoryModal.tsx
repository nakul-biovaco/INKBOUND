import React, { useState } from 'react';
import { CaseManager } from '../../game/CaseManager';
import { Feather, CheckCircle2, Lock } from 'lucide-react';
import { AuthoritativeGameState, TheorySubmission } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { AvatarBadge } from '../common/AvatarBadge';
import { BackendClient } from '../../realtime/backendClient';
import { SoundService } from '../../services/soundService';

interface FinalTheoryModalProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  roomCode?: string;
  onSubmitTheory: (theory: TheorySubmission) => void;
  onLockAccusations: () => void;
  onLeaveRoom?: () => void;
}

export const FinalTheoryModal: React.FC<FinalTheoryModalProps> = ({
  gameState,
  currentUser,
  roomCode,
  onSubmitTheory,
  onLockAccusations,
  onLeaveRoom,
}) => {
  React.useEffect(() => {
    SoundService.playDramaticSting();
  }, []);

  // Dynamically resolve active case with all characters, methods, and motives
  const resolvedStoryId =
    (gameState as any)?.storyId ||
    gameState.currentCase?.id ||
    gameState.caseId ||
    gameState.currentCase?.title ||
    'story_01_the_midnight_museum';

  const resolvedCase = CaseManager.getCase(resolvedStoryId);

  const activeCase =
    gameState.currentCase &&
    gameState.currentCase.characters &&
    gameState.currentCase.characters.length > 0 &&
    gameState.currentCase.id === resolvedCase.id
      ? gameState.currentCase
      : resolvedCase;

  const characters = (activeCase.characters && activeCase.characters.length > 0)
    ? activeCase.characters
    : CaseManager.getDefaultCase().characters;

  const eventSequenceOptions = CaseManager.getEventOptions(activeCase);
  const crimeMethodOptions = CaseManager.getMethodOptions(activeCase);
  const suspectMotiveOptions = CaseManager.getMotiveOptions(activeCase);

  const existing = gameState.theories[currentUser.id];

  const [culprit, setCulprit] = useState<string>(
    existing?.culprit || characters[0]?.name || ''
  );
  const [whatHappened, setWhatHappened] = useState<string>(existing?.keyEvent || '');
  const [method, setMethod] = useState<string>(existing?.method || '');
  const [motive, setMotive] = useState<string>(existing?.motive || '');
  const [confidence, setConfidence] = useState<number>(existing?.confidence || 8);
  const [distorterGuess, setDistorterGuess] = useState<string>(existing?.distorterGuess || '');
  const [isSubmitted, setIsSubmitted] = useState<boolean>(Boolean(existing));

  // Sync default culprit if initially empty
  React.useEffect(() => {
    if (!culprit && characters.length > 0) {
      setCulprit(characters[0].name);
    }
  }, [characters, culprit]);

  const isHost =
    currentUser.isHost ||
    currentUser.id === gameState.players[0]?.id;

  const otherPlayers = gameState.players.filter((p) => p.id !== currentUser.id);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    SoundService.playClick();
    const theory: TheorySubmission = {
      id: `theory-${gameState.id}-${currentUser.id}`,
      gameId: gameState.id,
      playerId: currentUser.id,
      culprit: culprit || characters[0]?.name || 'Unknown Suspect',
      motive: motive || suspectMotiveOptions[0] || 'Unknown Motive',
      keyEvent: whatHappened || eventSequenceOptions[0] || 'Unknown Event',
      method: method || crimeMethodOptions[0] || 'Unknown Method',
      confidence,
      distorterGuess: distorterGuess || undefined,
      submittedAt: new Date().toISOString(),
    };

    onSubmitTheory(theory);
    setIsSubmitted(true);

    // Send authoritative deduction to game engine
    const deductionAnswer = `Culprit: ${theory.culprit}. Event: ${theory.keyEvent}. Motive: ${theory.motive}. Method: ${theory.method}`;
    BackendClient.getInstance().submitTheory(deductionAnswer, confidence);
  };

  return (
    <div className="relative min-h-screen w-full desk-bg text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-35 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-desk-950/85 via-desk-950/70 to-desk-950/95 pointer-events-none" />

      {/* TOP UNIVERSAL HEADER */}
      <GameHeader
        currentUser={currentUser}
        roomCode={roomCode || gameState.roomId.substring(0, 6).toUpperCase()}
        playerCount={gameState.players.length}
        maxPlayers={8}
        currentPhase="FINAL_THEORY"
        caseTitle={activeCase.title || gameState.currentCase?.title || 'Active Investigation'}
        roundText="Final Guess • Who Did It?"
        onLeaveRoom={onLeaveRoom}
      />

      {/* MAIN CONTENT FORM */}
      <main className="relative z-10 w-full max-w-5xl mx-auto my-auto px-4 py-6 grid grid-cols-1 md:grid-cols-12 gap-6 items-center">
        {/* LEFT CARD: FINAL THEORY FORM (7 cols) - VINTAGE INVESTIGATION DOSSIER */}
        <div
          className="md:col-span-7 relative text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] space-y-4 overflow-hidden select-none"
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

          {/* Vintage Brass Paperclip */}
          <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

          <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
            <div>
              <h2 className="text-xl sm:text-2xl font-black font-serif text-[#1a110a] tracking-wide">
                Make Your Final Guess
              </h2>
              <p className="text-[11px] font-mono text-[#5c422e] mt-0.5">
                Case: <span className="text-red-900 font-bold">{activeCase.title}</span>
              </p>
            </div>
            <span className="text-[10px] font-mono text-red-800 border-2 border-red-800 bg-red-800/10 font-black uppercase tracking-widest px-2.5 py-0.5 rounded -rotate-2 shadow-sm">
              ★ SECRET BALLOT
            </span>
          </div>

          <form onSubmit={handleSubmit} className="space-y-3.5 text-xs">
            {/* 1. Who was the culprit? */}
            <div>
              <label className="block text-[#3e2b1b] font-mono font-bold mb-1">
                Who was the culprit?
              </label>
              <select
                disabled={isSubmitted}
                value={culprit}
                onChange={(e) => setCulprit(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-[#1a110a] font-mono outline-none shadow-inner disabled:opacity-75"
                required
              >
                <option value="">-- Select Chief Suspect --</option>
                {characters.map((c) => (
                  <option key={c.name} value={c.name}>
                    {c.name} {c.role ? `(${c.role})` : ''}
                  </option>
                ))}
              </select>
            </div>

            {/* 2. What happened? */}
            <div>
              <label className="block text-[#3e2b1b] font-mono font-bold mb-1">
                What happened?
              </label>
              <select
                disabled={isSubmitted}
                value={whatHappened}
                onChange={(e) => setWhatHappened(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-[#1a110a] font-mono outline-none shadow-inner disabled:opacity-75"
                required
              >
                <option value="">-- Select Event Sequence --</option>
                {eventSequenceOptions.map((opt, i) => (
                  <option key={i} value={opt}>
                    {opt}
                  </option>
                ))}
              </select>
            </div>

            {/* 3. How did they do it? */}
            <div>
              <label className="block text-[#3e2b1b] font-mono font-bold mb-1">
                How did they do it?
              </label>
              <select
                disabled={isSubmitted}
                value={method}
                onChange={(e) => setMethod(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-[#1a110a] font-mono outline-none shadow-inner disabled:opacity-75"
                required
              >
                <option value="">-- Select Crime Method --</option>
                {crimeMethodOptions.map((opt, i) => (
                  <option key={i} value={opt}>
                    {opt}
                  </option>
                ))}
              </select>
            </div>

            {/* 4. Why did they do it? */}
            <div>
              <label className="block text-[#3e2b1b] font-mono font-bold mb-1">
                Why did they do it?
              </label>
              <select
                disabled={isSubmitted}
                value={motive}
                onChange={(e) => setMotive(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-[#1a110a] font-mono outline-none shadow-inner disabled:opacity-75"
                required
              >
                <option value="">-- Select Suspect Motive --</option>
                {suspectMotiveOptions.map((opt, i) => (
                  <option key={i} value={opt}>
                    {opt}
                  </option>
                ))}
              </select>
            </div>

            {/* 5. Accuse Distorter */}
            <div>
              <label className="block text-[#3e2b1b] font-mono font-bold mb-1">
                Who was the Impostor / Saboteur?
              </label>
              <select
                disabled={isSubmitted}
                value={distorterGuess}
                onChange={(e) => setDistorterGuess(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-[#1a110a] font-mono outline-none shadow-inner disabled:opacity-75"
              >
                <option value="">No impostor / Not sure</option>
                {otherPlayers.map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.nickname}
                  </option>
                ))}
              </select>
            </div>

            {/* 6. Confidence Slider */}
            <div className="pt-1">
              <div className="flex items-center justify-between mb-1">
                <label className="text-[#3e2b1b] font-mono font-bold">How confident are you?</label>
                <span className="font-mono text-red-900 font-black text-sm">{confidence * 10}%</span>
              </div>
              <input
                type="range"
                min="1"
                max="10"
                disabled={isSubmitted}
                value={confidence}
                onChange={(e) => setConfidence(Number(e.target.value))}
                className="w-full accent-red-800 cursor-pointer h-1.5 bg-[#cbba9e] rounded-lg"
              />
            </div>

            {/* Submit Theory Red Button */}
            <div className="pt-2">
              {!isSubmitted ? (
                <button
                  type="submit"
                  className="w-full py-3.5 rounded-xl bg-red-800 hover:bg-red-700 text-white font-mono font-black text-sm uppercase tracking-wider shadow-md transition-all transform active:scale-98 cursor-pointer"
                >
                  LOCK IN MY GUESS
                </button>
              ) : (
                <div className="w-full py-3 rounded-xl bg-emerald-100 border-2 border-emerald-700 text-emerald-950 font-mono font-black text-xs uppercase tracking-wider flex items-center justify-center gap-2 shadow-sm">
                  <CheckCircle2 className="w-4 h-4 text-emerald-800" />
                  <span>GUESS LOCKED IN THE ARCHIVE ✓</span>
                </div>
              )}
            </div>

            <p className="text-[11px] text-[#7a5839] text-center font-mono flex items-center justify-center gap-1">
              <Lock className="w-3 h-3 text-red-800" />
              <span>You cannot change your guess once submitted.</span>
            </p>
          </form>

          {/* Live Detective Lock Status */}
          <div className="pt-3 border-t border-[#bfa98e]/80">
            <div className="text-[10px] font-mono uppercase tracking-wider text-[#6e533d] font-bold mb-2">
              PLAYERS READY ({Object.keys(gameState.theories).length}/{gameState.players.length})
            </div>
            <div className="flex flex-wrap gap-2">
              {gameState.players.map((p) => {
                const hasLocked = Boolean(gameState.theories[p.id]);
                return (
                  <span
                    key={p.id}
                    className={`px-2.5 py-1 rounded-lg text-[10px] font-mono flex items-center gap-1.5 border shadow-sm ${
                      hasLocked
                        ? 'bg-emerald-100 border-emerald-700 text-emerald-950 font-bold'
                        : 'bg-[#ede1cf] border-[#bfa98e] text-[#5c422e]'
                    }`}
                  >
                    <AvatarBadge avatar={p.avatar} size="xs" />
                    <span>{p.nickname}</span>
                    <span className="font-bold">{hasLocked ? '✓' : '...'}</span>
                  </span>
                );
              })}
            </div>
          </div>

          {/* Host / Group Reveal Trigger */}
          <div className="pt-4 border-t border-[#bfa98e]/80 flex flex-col sm:flex-row items-center justify-between gap-3">
            <div className="text-xs text-[#5c422e] font-mono">
              {Object.keys(gameState.theories).length >= gameState.players.length
                ? 'Everyone has locked in their guess! Ready to see the truth.'
                : isHost
                ? 'You can reveal the answer now or wait for everyone.'
                : 'Waiting for the host to reveal the results...'}
            </div>
            {(isHost || Object.keys(gameState.theories).length >= gameState.players.length || gameState.players.length <= 1) && (
              <button
                onClick={onLockAccusations}
                className="w-full sm:w-auto px-6 py-2.5 rounded-xl bg-red-800 hover:bg-red-700 text-white font-mono font-bold text-xs uppercase tracking-wider transition-all shadow-md cursor-pointer hover:shadow-lg shrink-0"
              >
                SEE WHO DID IT →
              </button>
            )}
          </div>
        </div>

        {/* RIGHT CARD: AGED PARCHMENT NOTE WITH FOUNTAIN PEN (5 cols) */}
        <div className="md:col-span-5 relative flex items-center justify-center p-4">
          <div className="relative w-full max-w-sm bg-[#faeed1] border-2 border-[#d6be96] rounded-2xl p-7 shadow-2xl text-[#2a1d0f] font-serif transform rotate-1 flex flex-col items-center justify-between min-h-[400px]">
            {/* Red wax seal or stamp */}
            <div className="w-8 h-8 rounded-full bg-red-700/90 border border-red-900 absolute top-4 right-4 flex items-center justify-center shadow-md text-white font-bold text-[10px]">
              IB
            </div>

            {/* Case file tag */}
            <div className="text-[10px] font-mono uppercase tracking-widest text-[#8c6d46] font-bold text-center pt-1">
              CASE ARCHIVE • {activeCase.genre || 'MYSTERY'}
            </div>

            <div className="text-center space-y-3 my-auto py-2">
              <p className="text-2xl sm:text-3xl font-bold italic leading-relaxed text-[#2a1d0f] drop-shadow-sm font-handwriting">
                "Look at everything.
                <br />
                Trust nothing.
                <br />
                <span className="relative inline-block font-extrabold text-red-900">
                  Solve together.
                  <svg
                    className="absolute -bottom-1 left-0 w-full h-2 text-red-600"
                    viewBox="0 0 100 10"
                    preserveAspectRatio="none"
                  >
                    <path d="M0 6 Q 50 1 100 6" stroke="#dc2626" strokeWidth="2.5" fill="none" />
                  </svg>
                </span>
                "
              </p>

              <div className="text-xs font-serif font-bold text-[#442c16]">
                {activeCase.title}
              </div>
            </div>

            {/* Premise excerpt */}
            <div className="pt-2.5 border-t border-[#d6be96]/90 text-[11px] font-serif text-[#5c4426] italic text-center max-w-[280px] leading-snug">
              "{activeCase.description.length > 115 ? activeCase.description.slice(0, 115) + '...' : activeCase.description}"
            </div>

            {/* Fountain Pen Icon at bottom */}
            <div className="absolute -bottom-5 -right-4 flex items-center gap-1 text-slate-800 transform rotate-45 pointer-events-none">
              <Feather className="w-12 h-12 text-slate-700 drop-shadow-xl fill-slate-800" />
            </div>
          </div>
        </div>
      </main>

      {/* FOOTER */}
      <footer className="relative z-10 w-full max-w-5xl mx-auto px-6 py-3 text-center text-xs font-mono text-slate-500">
        INKBOUND • Dedicated Investigation Roster
      </footer>
    </div>
  );
};
