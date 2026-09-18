import React, { useState, useEffect } from 'react';
import {
  Copy,
  Check,
  MoreHorizontal,
  Settings,
  RotateCcw,
  Play,
  Plus,
  Link,
  ChevronDown,
  Users,
  Search,
} from 'lucide-react';
import { Room } from '../types/room';
import { Player } from '../types/player';
import { GameHeader } from '../components/common/GameHeader';
import { RoomChat } from '../components/common/RoomChat';
import { AvatarBadge } from '../components/common/AvatarBadge';
import { GameService } from '../services/gameService';
import { buildInviteUrl } from '../utils/inviteCrypto';
import { SoundService } from '../services/soundService';

interface LobbyProps {
  room: Room;
  players: Player[];
  currentUser: Player;
  onToggleReady: () => void;
  onStartGame: () => void;
  onUpdateSettings: (settings: Room['settings']) => void;
  onLeaveRoom: () => void;
  onAddBot?: () => void;
  onKickPlayer?: (playerId: string) => void;
  onPromoteHost?: (playerId: string) => void;
}

export const GENRE_OPTIONS: Record<string, { id: string; icon: string; title: string; desc: string }> = {
  all: { id: 'all', icon: '🔍', title: 'All Mystery Genres (Random)', desc: 'Mix of horror, romance, heist, and noir' },
  horror: { id: 'horror', icon: '👻', title: 'Supernatural Horror', desc: 'Ghostly sightings, haunted corridors, eerie clues' },
  romance: { id: 'romance', icon: '💌', title: 'Romance & Secrets', desc: 'Lost letters, unrequited love, train station rendezvous' },
  heist: { id: 'heist', icon: '💎', title: 'Museum & Vault Heist', desc: 'Master thieves, security overrides, diamond heists' },
  locked_room: { id: 'locked_room', icon: '🗝️', title: 'Locked Room Mystery', desc: 'Impossible crime scenes, sealed chambers, vanishing culprits' },
  cyberpunk: { id: 'cyberpunk', icon: '💾', title: 'Corporate Noir & Cyber', desc: 'Empty offices, wiped hard drives, encrypted ledgers' },
};

export const Lobby: React.FC<LobbyProps> = ({
  room,
  players,
  currentUser,
  onToggleReady,
  onStartGame,
  onUpdateSettings,
  onLeaveRoom,
  onAddBot,
  onKickPlayer,
  onPromoteHost,
}) => {
  const [hasCopied, setHasCopied] = useState(false);
  const [isInviteModalOpen, setIsInviteModalOpen] = useState(false);
  const [isCasePickerOpen, setIsCasePickerOpen] = useState(false);
  const [activePlayerMenu, setActivePlayerMenu] = useState<string | null>(null);

  const [rounds, setRounds] = useState<number>(room.settings?.rounds || 1);
  const [drawingTime, setDrawingTime] = useState<number>(room.settings?.turnDuration || 120);
  const initialCaseId = room.settings?.selectedCaseId && room.settings.selectedCaseId !== 'midnight_museum'
    ? room.settings.selectedCaseId
    : 'all';
  const [selectedCase, setSelectedCase] = useState<string>(initialCaseId);

  useEffect(() => {
    if (room.settings?.selectedCaseId) {
      const cleanId = room.settings.selectedCaseId === 'midnight_museum' ? 'all' : room.settings.selectedCaseId;
      setSelectedCase(cleanId);
    }
  }, [room.settings?.selectedCaseId]);

  useEffect(() => {
    if (room.settings?.turnDuration) {
      setDrawingTime(room.settings.turnDuration);
    }
  }, [room.settings?.turnDuration]);

  useEffect(() => {
    if (room.settings?.rounds) {
      setRounds(room.settings.rounds);
    }
  }, [room.settings?.rounds]);

  const activeGenre = GENRE_OPTIONS[selectedCase] || GENRE_OPTIONS.all;
  const isHost = currentUser.id === room.hostId || currentUser.isHost;


  const handleCopy = () => {
    SoundService.playClick();
    navigator.clipboard.writeText(room.code);
    setHasCopied(true);
    setTimeout(() => setHasCopied(false), 2000);
  };

  const handleCopyLink = () => {
    SoundService.playClick();
    const url = buildInviteUrl(room.code);
    navigator.clipboard.writeText(url);
    setHasCopied(true);
    setTimeout(() => setHasCopied(false), 2000);
  };

  // Dynamic real connected players list
  const displayPlayers: Player[] = players.length > 0 ? players : [currentUser];

  const maxSlots = 8;
  const waitingSlotsCount = Math.max(0, maxSlots - displayPlayers.length);

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-40 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/80 via-[#08090d]/60 to-[#08090d]/95 pointer-events-none" />

      {/* TOP UNIVERSAL HEADER */}
      <GameHeader
        currentUser={currentUser}
        roomCode={room.code}
        playerCount={displayPlayers.length}
        maxPlayers={maxSlots}
        currentPhase="LOBBY"
        onLeaveRoom={onLeaveRoom}
      />

      {/* MAIN 3-COLUMN LOBBY CONTENT */}
      <main className="relative z-10 w-full max-w-[1440px] mx-auto px-3 sm:px-6 lg:px-8 py-4 sm:py-6 grid grid-cols-1 lg:grid-cols-12 gap-4 sm:gap-6 items-start">
        {/* ======================================================== */}
        {/* LEFT COLUMN: PINNED POLAROIDS & ROOM CHAT (3 cols)        */}
        {/* ======================================================== */}
        <div className="lg:col-span-3 flex flex-col gap-4 order-3 lg:order-1">
          {/* Polaroid Crime Photo & Pinned Notes */}
          <div className="relative hidden md:block">
            {/* Handwritten Note Top */}
            <div className="font-handwriting text-amber-200/85 text-sm -rotate-3 mb-2 px-2 drop-shadow">
              "Different eyes. Different clues. One truth."
            </div>

            {/* Vintage Polaroid Photo */}
            <div className="relative w-48 bg-white p-2 pb-5 rounded shadow-2xl rotate-2 border border-slate-300/40">
              {/* Red Pin */}
              <div className="w-3.5 h-3.5 rounded-full bg-red-600 absolute -top-1.5 left-1/2 -translate-x-1/2 shadow-md border border-red-900" />
              <div className="w-full aspect-[4/3] bg-slate-900 overflow-hidden rounded-xs">
                <img
                  src="/assets/museum_heist.jpg"
                  alt="Crime Scene"
                  className="w-full h-full object-cover filter contrast-125 sepia-[0.3]"
                />
              </div>
              <div className="mt-1.5 font-handwriting text-[13px] text-slate-800 text-center italic font-bold">
                The truth is a puzzle.
              </div>
            </div>
          </div>

          {/* ROOM CHAT COMPONENT (CONNECTED TO REALTIME CHANNEL) */}
          <div className="w-full order-1 lg:order-none">
            <RoomChat
              currentUser={currentUser}
              channel={GameService.getChannel(room.id)}
              className="min-h-[240px] sm:min-h-[300px]"
            />
          </div>
        </div>

        {/* ======================================================== */}
        {/* CENTER COLUMN: LOBBY HEADER, ROOM CODE & ROSTER (5 cols) */}
        {/* ======================================================== */}
        <div className="lg:col-span-5 flex flex-col gap-4 order-1 lg:order-2">
          {/* LOBBY Header with thin rule */}
          <div className="flex items-center gap-3 justify-center mb-1">
            <div className="h-[1px] flex-1 bg-gradient-to-r from-transparent to-slate-700/80" />
            <span className="text-xs font-mono font-bold uppercase tracking-[0.25em] text-slate-300">
              L O B B Y
            </span>
            <div className="h-[1px] flex-1 bg-gradient-to-l from-transparent to-slate-700/80" />
          </div>

          {/* BIG ROOM CODE CARD */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-4 sm:p-5 shadow-2xl backdrop-blur-md relative overflow-hidden flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div className="pl-3">
              <div className="text-[11px] font-mono uppercase tracking-wider text-slate-400">
                Room Code
              </div>
              <div className="flex items-center gap-3 mt-1">
                <span className="text-3xl sm:text-4xl font-mono font-bold tracking-wider text-white">
                  {room.code}
                </span>
                <button
                  onClick={handleCopy}
                  title="Copy Room Code"
                  className="p-1.5 rounded-lg bg-slate-800/80 hover:bg-slate-700 text-slate-300 hover:text-white transition-all border border-slate-700/60"
                >
                  {hasCopied ? <Check className="w-4 h-4 text-emerald-400" /> : <Copy className="w-4 h-4" />}
                </button>
              </div>
              <div className="flex items-center flex-wrap gap-2 mt-1.5 text-xs text-slate-400">
                <span>Share this code with your friends</span>
                <span className="flex items-center gap-1 text-[11px] text-emerald-400 font-mono font-semibold">
                  <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse" />
                  Room Open
                </span>
                {room.settings?.isPublic !== false && (
                  <span className="inline-flex items-center gap-1 text-[10px] text-sky-300 font-mono font-semibold px-2 py-0.5 rounded bg-sky-950/70 border border-sky-500/40">
                    <span className="w-1.5 h-1.5 rounded-full bg-sky-400 animate-ping" />
                    🌐 Global Matchmaking Active
                  </span>
                )}
              </div>
            </div>

            {/* Right Badge: 6/8 Players */}
            <div className="text-right flex flex-col items-center bg-slate-900/80 border border-slate-800 px-3.5 py-2 rounded-xl">
              <div className="flex items-center gap-1.5 text-white font-mono font-bold text-sm">
                <Users className="w-4 h-4 text-slate-400" />
                <span>
                  {displayPlayers.length} / {maxSlots}
                </span>
              </div>
              <div className="text-[10px] uppercase font-mono text-slate-400 mt-0.5">Players</div>
            </div>
          </div>

          {/* PLAYERS LIST ROSTER */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-3 sm:p-4 shadow-2xl backdrop-blur-md space-y-2">
            {displayPlayers.map((p) => {
              const isPlayerHost = p.id === room.hostId || p.isHost;
              const isCurrent = p.id === currentUser.id;

              return (
                <div
                  key={p.id}
                  className={`flex items-center justify-between px-3.5 py-2.5 rounded-xl border transition-all ${
                    isCurrent
                      ? 'bg-slate-800/50 border-slate-600/70'
                      : 'bg-slate-900/40 border-slate-800/80 hover:border-slate-700'
                  }`}
                >
                  {/* Left: Avatar + Name + Host tag */}
                  <div className="flex items-center gap-3">
                    <AvatarBadge avatar={p.avatar} size="sm" />
                    <div className="flex items-center gap-2">
                      <span className="text-xs sm:text-sm font-semibold text-white">
                        {p.nickname}
                      </span>
                      {isPlayerHost && (
                        <div className="flex items-center gap-1">
                          <span className="text-amber-400 text-xs">👑</span>
                          <span className="px-1.5 py-0.5 rounded text-[9px] font-mono font-bold bg-amber-950/60 text-amber-300 border border-amber-500/40">
                            Host
                          </span>
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Right: Ready status + Options menu */}
                  <div className="flex items-center gap-3">
                    {p.isReady ? (
                      <span className="flex items-center gap-1.5 text-xs font-semibold text-emerald-400 font-mono">
                        <span className="w-2 h-2 rounded-full bg-emerald-500 shadow-[0_0_6px_rgba(16,185,129,0.8)]" />
                        Ready
                      </span>
                    ) : (
                      <span className="flex items-center gap-1.5 text-xs font-semibold text-slate-400 font-mono">
                        <span className="w-2 h-2 rounded-full bg-slate-500" />
                        Not Ready
                      </span>
                    )}

                    <div className="relative">
                      <button
                        onClick={() => setActivePlayerMenu(activePlayerMenu === p.id ? null : p.id)}
                        className="text-slate-500 hover:text-slate-300 transition-colors p-1 rounded hover:bg-slate-800"
                        title="Player options"
                      >
                        <MoreHorizontal className="w-4 h-4" />
                      </button>

                      {activePlayerMenu === p.id && (
                        <div className="absolute right-0 top-8 z-50 bg-[#121620] border border-slate-700 rounded-xl p-1.5 shadow-2xl min-w-[130px] space-y-1">
                          {isHost && p.id !== currentUser.id && onPromoteHost && (
                            <button
                              onClick={() => {
                                onPromoteHost(p.id);
                                setActivePlayerMenu(null);
                              }}
                              className="w-full text-left px-2.5 py-1.5 text-xs text-amber-300 hover:bg-slate-800 rounded-lg flex items-center gap-1.5"
                            >
                              <span>👑</span> Make Host
                            </button>
                          )}
                          {isHost && p.id !== currentUser.id && onKickPlayer && (
                            <button
                              onClick={() => {
                                onKickPlayer(p.id);
                                setActivePlayerMenu(null);
                              }}
                              className="w-full text-left px-2.5 py-1.5 text-xs text-red-400 hover:bg-slate-800 rounded-lg flex items-center gap-1.5"
                            >
                              <span>✕</span> Kick
                            </button>
                          )}
                          <button
                            onClick={() => setActivePlayerMenu(null)}
                            className="w-full text-left px-2.5 py-1 text-[11px] text-slate-500 hover:text-slate-300 rounded-lg"
                          >
                            Close
                          </button>
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              );
            })}

            {/* Waiting for player empty slots */}
            {Array.from({ length: waitingSlotsCount }).map((_, i) => (
              <div
                key={`wait-${i}`}
                className="flex items-center justify-between px-3.5 py-2.5 rounded-xl border border-dashed border-slate-800/90 text-slate-500 text-xs font-mono bg-slate-950/20"
              >
                <div className="flex items-center gap-3">
                  <div className="w-7 h-7 rounded-full border border-dashed border-slate-700 flex items-center justify-center text-[10px] text-slate-500">
                    +
                  </div>
                  <span>Waiting for player...</span>
                </div>
                <div className="flex items-center gap-2">
                  {isHost && onAddBot && i === 0 && (
                    <button
                      onClick={onAddBot}
                      className="px-2.5 py-1 rounded-lg border border-red-800/60 bg-red-950/30 hover:bg-red-900/50 text-red-400 hover:text-white text-[10px] font-semibold transition-colors flex items-center gap-1"
                    >
                      <span>+ Add Bot</span>
                    </button>
                  )}
                  <button
                    onClick={() => setIsInviteModalOpen(true)}
                    className="px-3 py-1 rounded-lg border border-slate-800 hover:border-slate-600 text-slate-400 hover:text-white text-[11px] font-medium transition-colors"
                  >
                    Invite
                  </button>
                </div>
              </div>
            ))}
          </div>

          {/* ACTION BUTTONS BELOW PLAYER LIST */}
          <div className="space-y-3 pt-1">
            {/* Side-by-Side: Invite Friends & Copy Link */}
            <div className="grid grid-cols-2 gap-3">
              <button
                onClick={() => setIsInviteModalOpen(true)}
                className="py-2.5 px-4 rounded-xl border border-slate-700/80 hover:border-slate-500 bg-[#0e131f]/80 text-slate-200 hover:text-white text-xs font-semibold transition-all flex items-center justify-center gap-2 shadow-md"
              >
                <Plus className="w-3.5 h-3.5 text-slate-400" />
                <span>Invite Friends</span>
              </button>

              <button
                onClick={handleCopyLink}
                className="py-2.5 px-4 rounded-xl border border-slate-700/80 hover:border-slate-500 bg-[#0e131f]/80 text-slate-200 hover:text-white text-xs font-semibold transition-all flex items-center justify-center gap-2 shadow-md"
              >
                <Link className="w-3.5 h-3.5 text-slate-400" />
                <span>{hasCopied ? 'Link Copied!' : 'Copy Invite Link'}</span>
              </button>
            </div>

            {/* Non-host Ready Toggle */}
            {!isHost && (
              <button
                onClick={() => {
                  SoundService.playBadgeClick();
                  onToggleReady();
                }}
                className={`w-full py-3.5 rounded-xl text-xs font-bold font-mono uppercase tracking-wider transition-all cursor-pointer ${
                  currentUser.isReady
                    ? 'game-btn-dark text-slate-300'
                    : 'game-btn-gold text-white'
                }`}
              >
                {currentUser.isReady ? '✓ You Are Ready (Click to Cancel)' : 'Mark Yourself Ready'}
              </button>
            )}

            {/* BIG PRIMARY "START GAME" BUTTON */}
            {isHost && (
              <div className="space-y-2">
                <button
                  onClick={() => {
                    SoundService.playStamp();
                    onStartGame();
                  }}
                  disabled={displayPlayers.length < 2}
                  className="w-full py-4 px-6 rounded-2xl game-btn-red text-white font-bold text-sm tracking-wide transition-all disabled:opacity-40 disabled:cursor-not-allowed flex items-center justify-center gap-2 cursor-pointer"
                >
                  <Play className="w-4 h-4 fill-white" />
                  <span>Start Game ({displayPlayers.length}/8 Players)</span>
                </button>

                {displayPlayers.length < 2 && onAddBot && (
                  <button
                    onClick={() => {
                      SoundService.playClick();
                      onAddBot();
                    }}
                    className="w-full py-2.5 rounded-xl border border-red-700/60 bg-red-950/40 hover:bg-red-900/60 text-red-300 hover:text-white text-xs font-bold transition-all flex items-center justify-center gap-1.5 shadow cursor-pointer"
                  >
                    <span>+ Add Bot Player</span>
                  </button>
                )}
              </div>
            )}

            <div className="text-center text-[11px] font-mono text-slate-400">
              {displayPlayers.length < 2
                ? 'Need at least 2 players to start (invite friends or click Add Bot)'
                : isHost
                ? 'Ready to go! Click Start Game when everyone is ready.'
                : 'Waiting for the host to start the game...'}
            </div>
          </div>
        </div>

        {/* ======================================================== */}
        {/* RIGHT COLUMN: GAME SETTINGS (HOST ONLY) & NOTES          */}
        {/* ======================================================== */}
        <div className="lg:col-span-4 flex flex-col gap-4 order-2 lg:order-3">
          {/* GAME SETTINGS CARD — HOST ONLY */}
          {isHost ? (
            <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-5 shadow-2xl backdrop-blur-md space-y-4">
              {/* Header with Reset button */}
              <div className="flex items-center justify-between border-b border-slate-800/80 pb-3">
                <div className="flex items-center gap-2">
                  <Settings className="w-4 h-4 text-slate-300" />
                  <span className="font-bold text-white text-sm">Game Settings (Host)</span>
                </div>

                <button
                  onClick={() => {
                    setRounds(1);
                    setDrawingTime(40);
                    setSelectedCase('all');
                    onUpdateSettings({
                      turnDuration: 40,
                      distorterEnabled: false,
                      selectedCaseId: 'all',
                      allowQuestioning: true,
                    });
                  }}
                  className="flex items-center gap-1 text-[11px] text-slate-400 hover:text-white transition-colors"
                >
                  <RotateCcw className="w-3 h-3" />
                  <span>Reset</span>
                </button>

              </div>

              {/* 1. Case Genre / Mystery Theme */}
              <div>
                <label className="block text-slate-400 text-xs font-mono mb-1.5">Mystery Theme</label>
                <div
                  onClick={() => isHost && setIsCasePickerOpen(true)}
                  className={`p-2.5 bg-slate-900/90 border border-slate-700/80 rounded-xl flex items-center justify-between transition-all ${
                    isHost ? 'cursor-pointer hover:border-slate-500 group' : 'cursor-default opacity-90'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-lg overflow-hidden bg-slate-800 flex-shrink-0 border border-slate-700 flex items-center justify-center text-xl">
                      {activeGenre.icon}
                    </div>
                    <div>
                      <div className="text-xs font-bold text-white group-hover:text-red-400 transition-colors">
                        {activeGenre.title}
                      </div>
                      <div className="text-[10px] text-slate-400">
                        {isHost ? 'Click to pick a theme' : 'Theme selected by host'}
                      </div>
                    </div>
                  </div>
                  {isHost && <ChevronDown className="w-4 h-4 text-slate-400 group-hover:text-white" />}
                </div>
              </div>

              {/* 2. Number of Rounds with Quick Selection & Custom Input */}
              <div>
                <div className="flex items-center justify-between mb-1.5">
                  <label className="text-slate-400 text-xs font-mono">
                    Number of Rounds
                  </label>
                  <span className="text-[11px] font-mono text-red-400 font-bold">
                    {rounds} {rounds === 1 ? 'Round' : 'Rounds'}
                  </span>
                </div>
                <div className="grid grid-cols-5 gap-1.5 mb-2">
                  {[1, 2, 3, 5, 8].map((r) => (
                    <button
                      key={r}
                      onClick={() => {
                        setRounds(r);
                        onUpdateSettings({ ...room.settings, rounds: r });
                      }}
                      className={`py-2 rounded-xl text-xs font-mono font-bold transition-all ${
                        rounds === r
                          ? 'bg-red-700 text-white shadow-[0_0_12px_rgba(220,38,38,0.5)] border border-red-500'
                          : 'bg-slate-900 text-slate-400 border border-slate-800 hover:border-slate-700 hover:text-white'
                      }`}
                    >
                      {r}
                    </button>
                  ))}
                </div>
                <div className="flex items-center gap-2 bg-slate-900/90 border border-slate-800 rounded-xl px-3 py-1.5">
                  <span className="text-[11px] font-mono text-slate-400 shrink-0">Custom:</span>
                  <input
                    type="number"
                    min="1"
                    max="25"
                    value={rounds}
                    onChange={(e) => {
                      const val = Math.max(1, Math.min(25, Number(e.target.value) || 1));
                      setRounds(val);
                      onUpdateSettings({ ...room.settings, rounds: val });
                    }}
                    className="w-full bg-transparent text-white font-mono text-xs outline-none"
                    placeholder="Enter rounds (1-25)"
                  />
                  <span className="text-[10px] font-mono text-slate-500 shrink-0">(1–25)</span>
                </div>
              </div>

              {/* 3. Drawing Time Dropdown */}
              <div>
                <label className="block text-slate-400 text-xs font-mono mb-1.5">Drawing Time</label>
                <div className="relative">
                  <select
                    value={drawingTime}
                    onChange={(e) => {
                      const val = Number(e.target.value);
                      setDrawingTime(val);
                      onUpdateSettings({ ...room.settings, turnDuration: val });
                    }}
                    className="w-full py-2.5 px-3.5 bg-slate-900/90 border border-slate-700/80 rounded-xl text-white text-xs font-mono appearance-none outline-none focus:border-red-500 cursor-pointer"
                  >
                    <option value={30}>30 seconds</option>
                    <option value={40}>40 seconds</option>
                    <option value={60}>60 seconds</option>
                    <option value={80}>80 seconds</option>
                    <option value={120}>120 seconds (Default)</option>
                    <option value={160}>160 seconds</option>
                    <option value={180}>180 seconds</option>
                  </select>
                  <ChevronDown className="w-4 h-4 text-slate-400 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
                </div>
              </div>
            </div>
          ) : (
            /* NON-HOST VIEW: Case Intel Briefing */
            <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-5 shadow-2xl backdrop-blur-md space-y-3">
              <div className="text-xs font-mono font-bold uppercase tracking-wider text-slate-300 border-b border-slate-800 pb-2 flex items-center justify-between">
                <span>Story & Rules</span>
                <span className="text-emerald-400 text-[10px]">Host Controlled</span>
              </div>
              <p className="text-xs text-slate-400 leading-relaxed">
                The host is setting up the game. When the game starts, a random player will choose which mystery story to play!
              </p>
              <div className="p-3 bg-slate-950/70 rounded-xl border border-slate-800 flex items-center gap-3">
                <div className="w-9 h-9 rounded-xl bg-amber-950/70 border border-amber-600/50 flex items-center justify-center text-amber-400 shrink-0">
                  <Search className="w-5 h-5" />
                </div>
                <div>
                  <div className="text-xs font-bold text-white">Active Theme: {selectedCase || 'All Mysteries'}</div>
                  <div className="text-[10px] text-slate-400">Draw Time: {drawingTime}s • {rounds} round(s)</div>
                </div>
              </div>
            </div>
          )}

          {/* VINTAGE PARCHMENT NOTE WITH RED UNDERLINE */}
          <div className="relative bg-[#f5ebd7] border-2 border-[#d6be96] rounded-xl p-5 shadow-2xl text-[#2a1e12] font-handwriting rotate-1 overflow-hidden select-none">
            <p className="text-lg leading-snug">
              "Same room.
              <br />
              Different perspectives.
              <br />
              <span className="relative inline-block font-bold">
                Different truths.
                {/* Red ink underline */}
                <svg
                  className="absolute -bottom-1 left-0 w-full h-2 text-red-600 overflow-visible"
                  viewBox="0 0 100 10"
                  preserveAspectRatio="none"
                >
                  <path
                    d="M0 6 Q 50 1 100 7"
                    stroke="#dc2626"
                    strokeWidth="2.5"
                    fill="none"
                    strokeLinecap="round"
                  />
                </svg>
              </span>
              "
            </p>
            <div className="mt-3 text-xs text-[#6e5138] italic">
              "Trust no single account until evidence verifies it."
            </div>
          </div>
        </div>
      </main>

      {/* INVITE MODAL */}
      {isInviteModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-sm w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsInviteModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              ✕
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-amber-400 uppercase tracking-widest font-bold">
                INVITE FRIENDS
              </span>
              <h3 className="text-lg font-bold text-white font-serif">Share Room Code or Link</h3>
              <p className="text-xs text-slate-400">Send this to your friends so they can join your lobby!</p>
            </div>

            <div className="p-4 bg-slate-950 border border-slate-800 rounded-xl text-center space-y-2">
              <span className="text-[10px] font-mono text-slate-400 uppercase tracking-widest">Room Code</span>
              <div className="text-3xl font-mono font-bold tracking-widest text-amber-400">
                {room.code}
              </div>
              <button
                onClick={handleCopy}
                className="w-full py-2.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-xs font-mono font-bold text-white transition-colors cursor-pointer"
              >
                {hasCopied ? '✓ Code Copied!' : 'Copy Code'}
              </button>
            </div>

            <div className="space-y-2">
              <button
                onClick={handleCopyLink}
                className="w-full py-3 rounded-xl game-btn-red text-white text-xs font-bold uppercase tracking-wider transition-all flex items-center justify-center gap-2 cursor-pointer"
              >
                <Link className="w-3.5 h-3.5" />
                <span>{hasCopied ? '✓ Game Link Copied!' : 'Copy Game Link'}</span>
              </button>
              <p className="text-[11px] font-mono text-slate-400 text-center">
                Anyone clicking the link will jump straight into this lobby.
              </p>
            </div>
          </div>
        </div>
      )}

      {/* CASE GENRE PICKER MODAL (HOST ONLY) */}
      {isCasePickerOpen && isHost && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-xl w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsCasePickerOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              ✕
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Select Case Genre & Theme</h3>
              <p className="text-xs text-slate-400">
                Stories offered to the random story chooser will be tailored to this genre.
              </p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2">
              {Object.values(GENRE_OPTIONS).map((g) => (
                <div
                  key={g.id}
                  onClick={() => {
                    setSelectedCase(g.id);
                    onUpdateSettings({ ...room.settings, selectedCaseId: g.id });
                    setIsCasePickerOpen(false);
                  }}
                  className={`p-3.5 rounded-xl border cursor-pointer transition-all flex items-start gap-3 ${
                    selectedCase === g.id
                      ? 'bg-red-950/40 border-red-500 shadow-md ring-1 ring-red-500'
                      : 'bg-slate-900 border-slate-800 hover:border-slate-700'
                  }`}
                >
                  <span className="text-2xl">{g.icon}</span>
                  <div>
                    <div className="text-xs font-bold text-white font-serif">{g.title}</div>
                    <div className="text-[10px] text-slate-400 mt-0.5">{g.desc}</div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* BOTTOM DESK CORNER ELEMENTS */}
      <footer className="relative z-10 w-full max-w-[1440px] mx-auto px-6 py-4 flex items-center justify-between text-xs text-slate-500 font-mono">
        <div className="flex items-center gap-2">
          <span className="font-bold text-slate-400 tracking-wider font-serif">INKBOUND</span>
          <span>• Mystery Investigation</span>
        </div>
        <div className="font-handwriting text-sm text-amber-200/40">
          Trust. Observe. Connect. Solve.
        </div>
      </footer>
    </div>
  );
};
