import React, { useState, useEffect } from 'react';
import confetti from 'canvas-confetti';
import { Award, Eye, Shield, Zap, ArrowLeft } from 'lucide-react';
import { AuthoritativeGameState } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { AvatarBadge } from '../common/AvatarBadge';
import { SoundService } from '../../services/soundService';

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
    SoundService.playSuccess();
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

      {/* TABS SUB-BAR (VINTAGE TELEGRAPH LEDGER) */}
      <div className="relative z-10 w-full max-w-5xl mx-auto px-4 pt-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 border-b border-[#bfa98e]/80 pb-3">
        <div className="flex items-center gap-3 sm:gap-6 overflow-x-auto">
          {tabs.map((tab) => {
            const isActive = activeTab === tab;
            return (
              <button
                key={tab}
                onClick={() => setActiveTab(tab)}
                className={`text-xs sm:text-sm font-mono tracking-wider transition-colors cursor-pointer uppercase ${isActive
                    ? 'text-[#1a110a] font-black border-b-2 border-red-800 pb-1'
                    : 'text-[#7a5e45] hover:text-[#1a110a] font-bold'
                  }`}
              >
                {tab}
              </button>
            );
          })}
        </div>

        <button
          onClick={onReturnToLobby}
          className="px-4 py-2 rounded-xl bg-[#ede1cf] border-2 border-[#b89e7c] hover:border-red-800 text-xs font-mono font-bold text-[#3e2b1b] hover:text-red-900 transition-all flex items-center gap-1.5 w-full sm:w-auto justify-center cursor-pointer shadow-sm"
        >
          <ArrowLeft className="w-3.5 h-3.5 text-red-800" />
          <span>Return to Headquarters</span>
        </button>
      </div>

      {/* MAIN RESULTS CONTENT: PODIUM & ACCOLADES */}
      <main className="relative z-10 w-full max-w-5xl mx-auto my-auto px-3 sm:px-4 py-5 sm:py-6 grid grid-cols-1 md:grid-cols-12 gap-4 sm:gap-6 items-start">
        {/* LEFT COLUMN: PODIUM & LEADERBOARD (7 cols) - VINTAGE CASE BULLETIN */}
        <div
          className="md:col-span-7 relative text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] space-y-6 overflow-hidden select-none"
          style={{
            background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
            backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
            backgroundSize: '16px 16px, 100% 100%',
          }}
        >
          {/* Corner Decorative Accents */}
          <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
          <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

          {/* Vintage Brass Paperclip */}
          <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

          <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
            <div>
              <h2 className="text-xl sm:text-2xl font-black font-serif text-[#1a110a] tracking-wide">
                Case Closed: Final Standings
              </h2>
              <p className="text-[11px] font-mono text-[#5c422e] mt-0.5">
                Top Detective Honors & Investigation Accolades
              </p>
            </div>
            <span className="text-[10px] font-mono text-red-800 border-2 border-red-800 bg-red-800/10 font-black uppercase tracking-widest px-2.5 py-0.5 rounded -rotate-2 shadow-sm">
              ★ OFFICIAL RECORD
            </span>
          </div>

          {/* PODIUM */}
          <div className="flex items-end justify-center gap-3 sm:gap-4 pt-4 pb-2">
            {/* 2nd Place */}
            {second && (
              <div className="flex flex-col items-center">
                <AvatarBadge avatar={second.avatar} size="lg" className="mb-2 ring-2 ring-[#8c6d48]" />
                <div className="text-xs font-serif font-bold text-[#1a110a] text-center">{second.nickname}</div>
                <div className="text-[11px] font-mono text-[#7a5e45] font-bold">{second.score} pts</div>
                <div className="w-20 sm:w-24 h-24 bg-[#ede1cf] rounded-t-xl border-2 border-[#b89e7c] flex items-center justify-center font-bold text-[#443020] font-mono text-lg mt-2 shadow-md">
                  2
                </div>
              </div>
            )}

            {/* 1st Place (Center / Tallest) */}
            <div className="flex flex-col items-center -mt-6">
              <span className="text-2xl animate-bounce mb-1">👑</span>
              <AvatarBadge avatar={first.avatar} size="lg" className="mb-2 ring-2 ring-amber-600" />
              <div className="text-xs font-serif font-black text-[#1a110a] text-center">{first.nickname}</div>
              <div className="text-[11px] font-mono text-red-900 font-black">{first.score} pts</div>
              <div className="w-24 sm:w-28 h-32 bg-[#e4d3ba] rounded-t-xl border-2 border-amber-700 flex items-center justify-center font-bold text-red-950 font-mono text-xl mt-2 shadow-md">
                1
              </div>
            </div>

            {/* 3rd Place */}
            {third && (
              <div className="flex flex-col items-center">
                <AvatarBadge avatar={third.avatar} size="lg" className="mb-2 ring-2 ring-[#8c6d48]" />
                <div className="text-xs font-serif font-bold text-[#1a110a] text-center">{third.nickname}</div>
                <div className="text-[11px] font-mono text-[#7a5e45] font-bold">{third.score} pts</div>
                <div className="w-20 sm:w-24 h-18 bg-[#ede1cf] rounded-t-xl border-2 border-[#b89e7c] flex items-center justify-center font-bold text-[#6e533d] font-mono text-lg mt-2 shadow-md">
                  3
                </div>
              </div>
            )}
          </div>

          {/* FULL SCOREBOARD TABLE */}
          <div className="border-t border-[#bfa98e]/80 pt-4 space-y-2">
            <div className="text-xs font-mono uppercase tracking-wider text-[#6e533d] font-bold mb-2">
              BUREAU MERIT RANKINGS
            </div>
            {playerScores.map((sc, i) => (
              <div
                key={sc.playerId || i}
                className="flex items-center justify-between p-2.5 rounded-xl bg-[#fffdf9] border-2 border-[#b89e7c] text-xs shadow-sm"
              >
                <div className="flex items-center gap-3">
                  <span className="w-5 text-center font-mono font-bold text-[#7a5e45]">
                    #{i + 1}
                  </span>
                  <AvatarBadge avatar={sc.avatar} size="sm" />
                  <span className="font-bold text-[#1a110a] font-serif">{sc.nickname}</span>
                </div>
                <div className="flex items-center gap-4">
                  <span className="font-mono font-black text-red-900">{sc.score} pts</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* RIGHT COLUMN: DETECTIVE BADGES & DISTORTER REVEAL (5 cols) */}
        <div className="md:col-span-5 space-y-4">
          {/* DISTORTER REVEAL CARD */}
          <div
            className="relative text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-5 shadow-lg space-y-2 overflow-hidden select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="flex items-center justify-between">
              <span className="text-[11px] font-mono uppercase text-[#7a5e45] font-bold">Unmasked Identity</span>
              <span className="text-[10px] font-mono font-black text-red-900 border border-red-800 bg-red-100 px-2 py-0.5 rounded uppercase">
                The Impostor
              </span>
            </div>
            <div className="flex items-center gap-3 p-3 bg-[#fffdf9] border-2 border-red-800/60 rounded-xl shadow-sm">
              <Shield className="w-8 h-8 text-red-800 flex-shrink-0" />
              <div>
                <div className="text-sm font-black text-[#1a110a] font-serif">
                  {distorterPlayer ? `Impostor: ${distorterPlayer.nickname}` : 'No Impostor in this game'}
                </div>
                <p className="text-xs text-[#5c422e] mt-0.5 leading-snug font-mono">
                  {distorterPlayer
                    ? `Planted deceptive clues (+200 bonus).`
                    : 'All detectives worked faithfully on the same investigation.'}
                </p>
              </div>
            </div>
          </div>

          {/* ACCOLADES */}
          <div
            className="relative text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-5 shadow-lg space-y-3 overflow-hidden select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="text-xs font-mono uppercase tracking-wider text-[#6e533d] font-bold">
              COMMENDATIONS & HONORS
            </div>

            <div className="space-y-2">
              <div className="flex items-center gap-3 p-2.5 rounded-xl bg-[#fffdf9] border border-[#b89e7c] shadow-sm">
                <Award className="w-5 h-5 text-amber-700 flex-shrink-0" />
                <div className="text-xs">
                  <span className="font-bold text-[#1a110a] font-serif">Top Detective: </span>
                  <span className="text-[#5c422e] font-mono">{first.nickname} scored highest deduction accuracy!</span>
                </div>
              </div>

              {second && (
                <div className="flex items-center gap-3 p-2.5 rounded-xl bg-[#fffdf9] border border-[#b89e7c] shadow-sm">
                  <Eye className="w-5 h-5 text-sky-800 flex-shrink-0" />
                  <div className="text-xs">
                    <span className="font-bold text-[#1a110a] font-serif">Eagle Eye: </span>
                    <span className="text-[#5c422e] font-mono">{second.nickname} rendered brilliant clues & cracked theories!</span>
                  </div>
                </div>
              )}

              {third && (
                <div className="flex items-center gap-3 p-2.5 rounded-xl bg-[#fffdf9] border border-[#b89e7c] shadow-sm">
                  <Zap className="w-5 h-5 text-emerald-800 flex-shrink-0" />
                  <div className="text-xs">
                    <span className="font-bold text-[#1a110a] font-serif">Sharp Sleuth: </span>
                    <span className="text-[#5c422e] font-mono">{third.nickname} assembled crucial puzzle connections!</span>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* RETURN TO LOBBY BUTTON */}
          <button
            onClick={onReturnToLobby}
            className="w-full py-3.5 rounded-2xl bg-red-800 hover:bg-red-700 text-white font-mono font-bold text-sm tracking-wide shadow-md transition-all flex items-center justify-center gap-2 cursor-pointer uppercase"
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
