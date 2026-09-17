import React, { useState } from 'react';
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

  const characters = gameState.currentCase?.characters || [];
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
      culprit,
      motive,
      keyEvent: whatHappened,
      method,
      confidence,
      distorterGuess: distorterGuess || undefined,
      submittedAt: new Date().toISOString(),
    };

    onSubmitTheory(theory);
    setIsSubmitted(true);

    // Send authoritative deduction to game engine
    const deductionAnswer = `Culprit: ${culprit}. Event: ${whatHappened}. Motive: ${motive}. Method: ${method}`;
    BackendClient.getInstance().submitTheory(deductionAnswer, confidence);
  };


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
        currentPhase="FINAL_THEORY"
        caseTitle={gameState.currentCase?.title || 'The Midnight Museum Heist'}
        roundText="Final Guess • Who Did It?"
        onLeaveRoom={onLeaveRoom}
      />

      {/* MAIN CONTENT FORM */}
      <main className="relative z-10 w-full max-w-5xl mx-auto my-auto px-4 py-6 grid grid-cols-1 md:grid-cols-12 gap-6 items-center">
        {/* LEFT CARD: FINAL THEORY FORM (7 cols) */}
        <div className="md:col-span-7 bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 sm:p-8 shadow-2xl space-y-4 backdrop-blur-md">
          <div className="flex items-center justify-between border-b border-slate-800/80 pb-3">
            <h2 className="text-xl font-bold font-serif text-white tracking-wide">
              Make Your Final Guess
            </h2>
            <span className="text-[11px] font-mono text-red-400 font-semibold uppercase">
              Secret Ballot
            </span>
          </div>

          <form onSubmit={handleSubmit} className="space-y-4 text-xs">
            {/* 1. Who was the culprit? */}
            <div>
              <label className="block text-slate-300 font-medium mb-1.5">
                Who was the culprit?
              </label>
              <select
                disabled={isSubmitted}
                value={culprit}
                onChange={(e) => setCulprit(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-red-500 disabled:opacity-75"
              >
                {characters.map((c) => (
                  <option key={c.name} value={c.name}>
                    {c.name} ({c.role})
                  </option>
                ))}
              </select>
            </div>

            {/* 2. What happened? */}
            <div>
              <label className="block text-slate-300 font-medium mb-1.5">
                What happened?
              </label>
              <select
                disabled={isSubmitted}
                value={whatHappened}
                onChange={(e) => setWhatHappened(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-red-500 disabled:opacity-75"
                required
              >
                <option value="">-- Select Event Sequence --</option>
                <option value="Security guard disables cameras and steals diamond">
                  Security guard disables cameras and steals diamond
                </option>
                <option value="Cat burglar descended through the ceiling skylight">
                  Cat burglar descended through the ceiling skylight
                </option>
                <option value="Janitor hid the jewel in the boiler room">
                  Janitor hid the jewel in the boiler room
                </option>
                <option value="Collector switched the diamond for a glass replica">
                  Collector switched the diamond for a glass replica
                </option>
              </select>
            </div>

            {/* 3. How did they do it? */}
            <div>
              <label className="block text-slate-300 font-medium mb-1.5">
                How did they do it?
              </label>
              <select
                disabled={isSubmitted}
                value={method}
                onChange={(e) => setMethod(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-red-500 disabled:opacity-75"
                required
              >
                <option value="">-- Select Crime Method --</option>
                <option value="Used a brass master keycard and staged broken glass">
                  Used a brass master keycard and staged broken glass
                </option>
                <option value="Cut display cables with wire cutter and climbed wall">
                  Cut display cables with wire cutter and climbed wall
                </option>
                <option value="Slipped diamond into cleaning cart laundry basket">
                  Slipped diamond into cleaning cart laundry basket
                </option>
                <option value="Carried out in handbag during evening gala exit">
                  Carried out in handbag during evening gala exit
                </option>
              </select>
            </div>

            {/* 4. Why did they do it? */}
            <div>
              <label className="block text-slate-300 font-medium mb-1.5">
                Why did they do it?
              </label>
              <select
                disabled={isSubmitted}
                value={motive}
                onChange={(e) => setMotive(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-red-500 disabled:opacity-75"
                required
              >
                <option value="">-- Select Suspect Motive --</option>
                <option value="Massive debts from underground gambling">
                  Massive debts from underground gambling
                </option>
                <option value="Obsession with acquiring the 140-carat blue diamond">
                  Obsession with acquiring the 140-carat blue diamond
                </option>
                <option value="Revenge for terminated museum employment">
                  Revenge for terminated museum employment
                </option>
                <option value="To sell on international black market">
                  To sell on international black market
                </option>
              </select>
            </div>

            {/* 5. Accuse Distorter */}
            <div>
              <label className="block text-slate-300 font-medium mb-1.5">
                Who was the Impostor / Saboteur?
              </label>
              <select
                disabled={isSubmitted}
                value={distorterGuess}
                onChange={(e) => setDistorterGuess(e.target.value)}
                className="w-full py-2.5 px-3.5 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-red-500 disabled:opacity-75"
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
              <div className="flex items-center justify-between mb-1.5">
                <label className="text-slate-300 font-medium">How confident are you?</label>
                <span className="font-mono text-white font-bold">{confidence * 10}%</span>
              </div>
              <input
                type="range"
                min="1"
                max="10"
                disabled={isSubmitted}
                value={confidence}
                onChange={(e) => setConfidence(Number(e.target.value))}
                className="w-full accent-red-600 cursor-pointer h-1.5 bg-slate-800 rounded-lg"
              />
            </div>

            {/* Submit Theory Red Button */}
            <div className="pt-2">
              {!isSubmitted ? (
                <button
                  type="submit"
                  className="w-full py-3.5 rounded-xl bg-gradient-to-r from-[#991b1b] via-[#dc2626] to-[#991b1b] hover:from-[#b91c1c] hover:via-[#ef4444] hover:to-[#b91c1c] text-white font-bold text-sm uppercase tracking-wider shadow-[0_4px_20px_rgba(220,38,38,0.45)] transition-all transform active:scale-98"
                >
                  Lock In My Guess
                </button>
              ) : (
                <div className="w-full py-3 rounded-xl bg-emerald-950/60 border border-emerald-500/50 text-emerald-400 font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2">
                  <CheckCircle2 className="w-4 h-4" />
                  <span>Guess Locked In ✓</span>
                </div>
              )}
            </div>

            <p className="text-[11px] text-slate-500 text-center font-mono flex items-center justify-center gap-1">
              <Lock className="w-3 h-3" />
              <span>You cannot change your guess once submitted.</span>
            </p>
          </form>

          {/* Live Detective Lock Status */}
          <div className="pt-3 border-t border-slate-800/80">
            <div className="text-[10px] font-mono uppercase tracking-wider text-slate-400 mb-2">
              Players Ready ({Object.keys(gameState.theories).length}/{gameState.players.length})
            </div>
            <div className="flex flex-wrap gap-2">
              {gameState.players.map((p) => {
                const hasLocked = Boolean(gameState.theories[p.id]);
                return (
                  <span
                    key={p.id}
                    className={`px-2.5 py-1 rounded-lg text-[10px] font-mono flex items-center gap-1.5 border ${
                      hasLocked
                        ? 'bg-emerald-950/50 border-emerald-500/40 text-emerald-300'
                        : 'bg-slate-900/60 border-slate-800 text-slate-400'
                    }`}
                  >
                    <AvatarBadge avatar={p.avatar} size="xs" />
                    <span>{p.nickname}</span>
                    <span>{hasLocked ? '✓' : '...'}</span>
                  </span>
                );
              })}
            </div>
          </div>

          {/* Host / Group Reveal Trigger */}
          <div className="pt-4 border-t border-slate-800 flex items-center justify-between">
            <div className="text-xs text-slate-400 font-mono">
              {Object.keys(gameState.theories).length >= gameState.players.length
                ? 'Everyone has locked in their guess! Ready to see the truth.'
                : isHost
                ? 'You can reveal the answer now or wait for everyone.'
                : 'Waiting for the host to reveal the results...'}
            </div>
            {(isHost || Object.keys(gameState.theories).length >= gameState.players.length || gameState.players.length <= 1) && (
              <button
                onClick={onLockAccusations}
                className="px-6 py-2.5 rounded-xl bg-gradient-to-r from-red-700 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-mono font-bold text-xs uppercase tracking-wider transition-all shadow-md cursor-pointer hover:shadow-lg"
              >
                See Who Did It →
              </button>
            )}
          </div>
        </div>

        {/* RIGHT CARD: AGED PARCHMENT NOTE WITH FOUNTAIN PEN (5 cols) */}
        <div className="md:col-span-5 relative flex items-center justify-center p-4">
          <div className="relative w-full max-w-sm bg-[#faeed1] border-2 border-[#d6be96] rounded-2xl p-8 shadow-2xl text-[#2a1d0f] font-serif transform rotate-1 flex flex-col items-center justify-center min-h-[380px]">
            {/* Red wax seal or stamp */}
            <div className="w-8 h-8 rounded-full bg-red-700/90 border border-red-900 absolute top-4 right-4 flex items-center justify-center shadow-md text-white font-bold text-[10px]">
              IB
            </div>

            <div className="text-center space-y-4 my-auto">
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
