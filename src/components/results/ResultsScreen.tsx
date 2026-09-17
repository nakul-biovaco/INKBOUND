import React, { useState, useEffect } from 'react';
import confetti from 'canvas-confetti';
import { Award, Eye, Shield, Zap, ArrowLeft } from 'lucide-react';
import { AuthoritativeGameState } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { AvatarBadge } from '../common/AvatarBadge';

interface ResultsScreenProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  roomCode?: string;
  onReturnToLobby: () => void;
  onLeaveRoom?: () => void;
}

type ResultTab = 'Scoreboard' | 'Player Theories' | 'Case Recap';

export const ResultsScreen: React.FC<ResultsScreenProps> = ({
  gameState,
  currentUser,
  roomCode,
  onReturnToLobby,
  onLeaveRoom,
}) => {
  const [activeTab, setActiveTab] = useState<ResultTab>('Scoreboard');

  useEffect(() => {
    try {
      confetti({
        particleCount: 120,
        spread: 90,
        origin: { y: 0.6 },
        colors: ['#dc2626', '#eab308', '#38bdf8', '#ffffff'],
      });
    } catch {
      // ignore
    }
  }, []);

  // Compute live scores for all connected players
  const playerScores = gameState.players
    .map((p) => {
      const sc = gameState.scores[p.id];
      return (
        sc || {
          playerId: p.id,
          nickname: p.nickname,
          avatar: p.avatar,
          score: p.score || 500,
          role: p.role || 'DETECTIVE',
        }
      );
    })
    .sort((a, b) => b.score - a.score);

  // Top players for podium
  const first = playerScores[0] || {
    nickname: currentUser.nickname,
    avatar: currentUser.avatar,
    score: currentUser.score || 850,
    role: 'DETECTIVE',
  };
  const second = playerScores[1];
  const third = playerScores[2];

  const distorterPlayer = gameState.players.find((p) => p.id === gameState.distorterId);

  const tabs: ResultTab[] = ['Scoreboard', 'Player Theories', 'Case Recap'];

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
        currentPhase="RESULTS"
        caseTitle={gameState.currentCase?.title || 'The Midnight Museum Heist'}
        roundText="Final Scores & Winner"
        onLeaveRoom={onLeaveRoom}
      />

      {/* TABS SUB-BAR */}
      <div className="relative z-10 w-full max-w-5xl mx-auto px-4 pt-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 border-b border-slate-800 pb-3">
        <div className="flex items-center gap-4 sm:gap-6 overflow-x-auto">
          {tabs.map((tab) => {
            const isActive = activeTab === tab;
            return (
              <button
                key={tab}
                onClick={() => setActiveTab(tab)}
                className={`text-xs sm:text-sm font-medium transition-colors ${
                  isActive ? 'text-white font-bold border-b-2 border-red-500 pb-1' : 'text-slate-400 hover:text-slate-200'
                }`}
              >
                {tab}
              </button>
            );
          })}
        </div>

        <button
          onClick={onReturnToLobby}
          className="px-4 py-2 rounded-xl bg-slate-900 border border-slate-700 hover:border-slate-500 text-xs font-semibold text-slate-300 hover:text-white transition-all flex items-center gap-1.5 w-full sm:w-auto justify-center"
        >
          <ArrowLeft className="w-3.5 h-3.5" />
          <span>Return to Lobby</span>
        </button>
      </div>

      {/* MAIN RESULTS CONTENT: PODIUM & ACCOLADES */}
      <main className="relative z-10 w-full max-w-5xl mx-auto my-auto px-3 sm:px-4 py-5 sm:py-6 grid grid-cols-1 md:grid-cols-12 gap-4 sm:gap-6 items-start">
        {/* LEFT COLUMN: PODIUM & LEADERBOARD (7 cols) */}
        <div className="md:col-span-7 bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 shadow-2xl space-y-6 backdrop-blur-md">
          {/* PODIUM */}
          <div className="flex items-end justify-center gap-4 pt-4 pb-2">
            {/* 2nd Place */}
            {second && (
              <div className="flex flex-col items-center">
                <AvatarBadge avatar={second.avatar} size="lg" className="mb-2" />
                <div className="text-xs font-bold text-white text-center">{second.nickname}</div>
                <div className="text-[11px] font-mono text-slate-400">{second.score} pts</div>
                <div className="w-20 sm:w-24 h-24 bg-gradient-to-t from-slate-900 to-slate-800 rounded-t-xl border-t-2 border-slate-400 flex items-center justify-center font-bold text-slate-300 font-mono text-lg mt-2 shadow-md">
                  2
                </div>
              </div>
            )}

            {/* 1st Place (Center / Tallest) */}
            <div className="flex flex-col items-center -mt-6">
              <span className="text-2xl animate-bounce mb-1">👑</span>
              <AvatarBadge avatar={first.avatar} size="lg" className="mb-2" />
              <div className="text-xs font-bold text-white text-center">{first.nickname}</div>
              <div className="text-[11px] font-mono text-amber-400 font-bold">{first.score} pts</div>
              <div className="w-24 sm:w-28 h-32 bg-gradient-to-t from-red-950 to-red-700 rounded-t-xl border-t-2 border-amber-400 flex items-center justify-center font-bold text-white font-mono text-xl mt-2 shadow-[0_0_20px_rgba(220,38,38,0.5)]">
                1
              </div>
            </div>

            {/* 3rd Place */}
            {third && (
              <div className="flex flex-col items-center">
                <AvatarBadge avatar={third.avatar} size="lg" className="mb-2" />
                <div className="text-xs font-bold text-white text-center">{third.nickname}</div>
                <div className="text-[11px] font-mono text-slate-400">{third.score} pts</div>
                <div className="w-20 sm:w-24 h-18 bg-gradient-to-t from-slate-900 to-slate-800 rounded-t-xl border-t-2 border-amber-700 flex items-center justify-center font-bold text-slate-400 font-mono text-lg mt-2 shadow-md">
                  3
                </div>
              </div>
            )}
          </div>

          {/* FULL SCOREBOARD TABLE */}
          <div className="border-t border-slate-800 pt-4 space-y-2">
            <div className="text-xs font-mono uppercase tracking-wider text-slate-400 mb-2">
              Final Rankings
            </div>
            {playerScores.map((sc, i) => (
              <div
                key={sc.playerId || i}
                className="flex items-center justify-between p-2.5 rounded-xl bg-slate-900/60 border border-slate-800/80 text-xs"
              >
                <div className="flex items-center gap-3">
                  <span className="w-5 text-center font-mono font-bold text-slate-400">
                    #{i + 1}
                  </span>
                  <AvatarBadge avatar={sc.avatar} size="sm" />
                  <span className="font-semibold text-white">{sc.nickname}</span>
                </div>
                <div className="flex items-center gap-4">
                  <span className="font-mono font-bold text-amber-400">{sc.score} pts</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* RIGHT COLUMN: DETECTIVE BADGES & DISTORTER REVEAL (5 cols) */}
        <div className="md:col-span-5 space-y-4">
          {/* DISTORTER REVEAL CARD */}
          <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-5 shadow-xl backdrop-blur-md space-y-2">
            <div className="flex items-center justify-between">
              <span className="text-[11px] font-mono uppercase text-slate-400">Secret Identity</span>
              <span className="text-[10px] font-mono font-bold text-red-500 uppercase">
                The Impostor
              </span>
            </div>
            <div className="flex items-center gap-3 p-3 bg-red-950/30 border border-red-900/50 rounded-xl">
              <Shield className="w-8 h-8 text-red-500 flex-shrink-0" />
              <div>
                <div className="text-sm font-bold text-white">
                  {distorterPlayer ? `Impostor: ${distorterPlayer.nickname}` : 'No Impostor in this game'}
                </div>
                <p className="text-xs text-slate-300 mt-0.5 leading-snug">
                  {distorterPlayer
                    ? `Tried to trick the team with fake clues (+200 bonus).`
                    : 'Everyone played honestly on the same team.'}
                </p>
              </div>
            </div>
          </div>

          {/* ACCOLADES */}
          <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-5 shadow-xl backdrop-blur-md space-y-3">
            <div className="text-xs font-mono uppercase tracking-wider text-slate-400">
              Game Highlights
            </div>

            <div className="space-y-2">
              <div className="flex items-center gap-3 p-2.5 rounded-xl bg-slate-900/60 border border-slate-800">
                <Award className="w-5 h-5 text-amber-400 flex-shrink-0" />
                <div className="text-xs">
                  <span className="font-bold text-white">Top Detective: </span>
                  <span className="text-slate-300">{first.nickname} had the highest guessing accuracy!</span>
                </div>
              </div>

              {second && (
                <div className="flex items-center gap-3 p-2.5 rounded-xl bg-slate-900/60 border border-slate-800">
                  <Eye className="w-5 h-5 text-sky-400 flex-shrink-0" />
                  <div className="text-xs">
                    <span className="font-bold text-white">Eagle Eye: </span>
                    <span className="text-slate-300">{second.nickname} drew great clues and cracked theories!</span>
                  </div>
                </div>
              )}

              {third && (
                <div className="flex items-center gap-3 p-2.5 rounded-xl bg-slate-900/60 border border-slate-800">
                  <Zap className="w-5 h-5 text-emerald-400 flex-shrink-0" />
                  <div className="text-xs">
                    <span className="font-bold text-white">Sharp Sleuth: </span>
                    <span className="text-slate-300">{third.nickname} helped piece the mystery together!</span>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* RETURN TO LOBBY BUTTON */}
          <button
            onClick={onReturnToLobby}
            className="w-full py-3.5 rounded-2xl bg-gradient-to-r from-[#991b1b] via-[#dc2626] to-[#991b1b] hover:from-[#b91c1c] hover:via-[#ef4444] hover:to-[#b91c1c] text-white font-bold text-sm tracking-wide shadow-[0_4px_20px_rgba(220,38,38,0.45)] transition-all flex items-center justify-center gap-2 cursor-pointer"
          >
            <span>Play Another Round in Lobby</span>
            <span>→</span>
          </button>
        </div>
      </main>

      {/* FOOTER */}
      <footer className="relative z-10 w-full max-w-5xl mx-auto px-6 py-2 text-center text-[11px] text-slate-500 font-mono">
        INKBOUND • Mystery Solved
      </footer>
    </div>
  );
};
