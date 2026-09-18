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

          {/* BIG ROOM CODE CARD (VINTAGE INVESTIGATION CASE FILE DOCKET) */}
          <div
            className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-4 sm:p-5 shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.15)] overflow-hidden flex flex-col sm:flex-row sm:items-center justify-between gap-3 select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Corner Decorative Accents */}
            <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Vintage Brass Eyelet & Twine Tag Accent */}
            <div className="absolute -top-1 left-7 flex flex-col items-center pointer-events-none">
              <div className="w-4 h-4 rounded-full border-2 border-[#7a5833] bg-[#d9c5ab] shadow-inner flex items-center justify-center">
                <div className="w-1.5 h-1.5 rounded-full bg-[#3a2818]" />
              </div>
            </div>

            <div className="pl-3 sm:pl-4 pt-1">
              <div className="flex items-center gap-2">
                <span className="text-[10px] font-mono font-bold uppercase tracking-widest text-[#6e533d]">
                  CONFIDENTIAL CASE DOCKET NO.
                </span>
                <span className="text-[9px] font-mono px-1.5 py-0.2 rounded bg-[#e8dac6] text-[#543b27] border border-[#b89e7c]">
                  FILE REF
                </span>
              </div>

              <div className="flex items-center gap-3 mt-1">
                <span className="text-3xl sm:text-4xl font-mono font-black tracking-widest text-[#1a110a] drop-shadow-[0_1px_0_rgba(255,255,255,0.8)] border-b-2 border-[#8c6d48]/40 pb-0.5">
                  {room.code}
                </span>
                <button
                  onClick={handleCopy}
                  title="Copy Dossier Room Code"
                  className="p-2 rounded-lg bg-[#ede1cf] hover:bg-[#dfceb7] text-[#3e2b1b] hover:text-[#1a110a] transition-all border-2 border-[#b89e7c] cursor-pointer shadow-sm active:scale-95"
                >
                  {hasCopied ? <Check className="w-4 h-4 text-emerald-800 stroke-[3]" /> : <Copy className="w-4 h-4" />}
                </button>
              </div>

              <div className="flex items-center flex-wrap gap-2 mt-2 text-xs text-[#5c422e] font-mono">
                <span className="text-[11px] text-[#6e533d]">Status:</span>
                <span className="inline-flex items-center gap-1 text-[10px] text-emerald-950 font-mono font-black px-2 py-0.5 rounded bg-emerald-100/90 border-2 border-emerald-800 shadow-xs">
                  <span className="w-1.5 h-1.5 rounded-full bg-emerald-700 animate-pulse" />
                  CASE ROOM OPEN
                </span>
                {room.settings?.isPublic !== false && (
                  <span className="inline-flex items-center gap-1 text-[10px] text-sky-950 font-mono font-bold px-2 py-0.5 rounded bg-sky-100/90 border border-sky-700 shadow-xs">
                    <span className="w-1.5 h-1.5 rounded-full bg-sky-600 animate-ping" />
                    🌐 POLICE WIRE ACTIVE
                  </span>
                )}
              </div>
            </div>

            {/* Right Badge: Physical Evidence Tag with Brass Rivet */}
            <div className="relative text-right flex flex-col items-center bg-[#fdfcf9] border-2 border-[#8c6d48] px-4 py-2.5 rounded-xl shadow-[0_3px_10px_rgba(0,0,0,0.08),inset_0_0_20px_rgba(139,94,60,0.1)] shrink-0 self-start sm:self-center">
              <div className="absolute -top-2 left-1/2 -translate-x-1/2 w-3 h-3 rounded-full border border-[#8c6d48] bg-[#d9c5ab] shadow-xs flex items-center justify-center">
                <div className="w-1 h-1 rounded-full bg-[#4a3421]" />
              </div>
              <div className="flex items-center gap-1.5 text-[#1a110a] font-mono font-black text-sm sm:text-base pt-0.5">
                <Users className="w-4 h-4 text-[#8c6d48]" />
                <span>
                  {displayPlayers.length} / {maxSlots}
                </span>
              </div>
              <div className="text-[9px] uppercase font-mono font-bold tracking-wider text-[#6e533d] mt-0.5">
                DETECTIVES
              </div>
            </div>
          </div>

          {/* PLAYERS LIST ROSTER (VINTAGE INVESTIGATION PHOTO MUGSHOT LEDGER) */}
          <div
            className="relative text-[#221711] border-2 sm:border-3 border-[#8c6d48] rounded-2xl p-3.5 sm:p-4 shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.15)] space-y-2.5 select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Header Docket Bar */}
            <div className="text-[10px] font-mono font-bold uppercase tracking-wider text-[#6e533d] pb-1 border-b border-[#bfa98e]/70 flex items-center justify-between">
              <span className="flex items-center gap-1.5">
                <span className="text-red-900 font-black">★</span>
                <span>ACTIVE DETECTIVE ROSTER • PERSONNEL LOG</span>
              </span>
              <span className="text-red-900 font-mono font-black text-[11px] bg-red-50 border border-red-800/40 px-2 py-0.2 rounded">
                {displayPlayers.length} ON DUTY
              </span>
            </div>

            {/* Individual Polaroid Investigation Photo Cards */}
            <div className="space-y-2">
              {displayPlayers.map((p) => {
                const isPlayerHost = p.id === room.hostId || p.isHost;
                const isCurrent = p.id === currentUser.id;

                return (
                  <div
                    key={p.id}
                    className={`relative flex items-center justify-between px-3.5 py-2.5 rounded-xl border-2 transition-all ${
                      isCurrent
                        ? 'bg-[#fffdf9] border-red-800 shadow-md ring-1 ring-red-800/50'
                        : 'bg-[#fffdf9]/95 border-[#b89e7c] hover:border-[#8c6d48] shadow-sm'
                    }`}
                  >
                    {/* Corner subtle vignette pin */}
                    <div className="absolute top-1 left-2 w-1.5 h-1.5 rounded-full bg-[#8c6d48]/40" />

                    {/* Left: Vintage Photo Portrait Frame + Detective Dossier Name */}
                    <div className="flex items-center gap-3">
                      {/* Photo Print Frame */}
                      <div className="relative p-1 bg-[#fdfcf9] border border-[#cfbeab] rounded shadow-sm">
                        <AvatarBadge avatar={p.avatar} size="sm" className="ring-1 ring-[#8c6d48]/50 contrast-105" />
                        {/* Polaroid Bottom Border Margin */}
                        <div className="h-1 bg-[#fdfcf9]" />
                      </div>

                      <div>
                        <div className="flex items-center gap-2">
                          <span className="text-xs sm:text-sm font-bold font-serif text-[#1a110a] tracking-tight">
                            {p.nickname}
                          </span>
                          {isCurrent && (
                            <span className="text-[9px] font-mono font-bold px-1.5 py-0.2 rounded bg-[#ede1cf] text-[#543b27] border border-[#b89e7c]">
                              YOU
                            </span>
                          )}
                          {isPlayerHost && (
                            <div className="flex items-center gap-1 px-1.5 py-0.2 rounded bg-amber-100 border border-amber-700 text-amber-950 shadow-xs">
                              <span className="text-amber-800 text-[10px]">★</span>
                              <span className="text-[9px] font-mono font-black tracking-wider">
                                CHIEF
                              </span>
                            </div>
                          )}
                        </div>
                        <div className="text-[10px] text-[#7a5e45] font-mono mt-0.5">
                          AGENT REF #{p.id.slice(-4).toUpperCase()}
                        </div>
                      </div>
                    </div>

                    {/* Right: Authentic Stamped Ink Badge + Dossier Options */}
                    <div className="flex items-center gap-2.5">
                      {p.isReady ? (
                        <span className="flex items-center gap-1 px-2.5 py-1 rounded text-[10px] font-black text-emerald-950 bg-emerald-100 border-2 border-emerald-800 font-mono shadow-xs -rotate-1">
                          ✓ READY ON DUTY
                        </span>
                      ) : (
                        <span className="flex items-center gap-1 px-2.5 py-1 rounded text-[10px] font-bold text-[#6e533d] bg-[#ede1cf] border border-[#bfa98e] font-mono shadow-xs">
                          ⏳ PREPARING
                        </span>
                      )}

                      <div className="relative">
                        <button
                          onClick={() => setActivePlayerMenu(activePlayerMenu === p.id ? null : p.id)}
                          className="text-[#7a5e45] hover:text-[#1a110a] transition-colors p-1.5 rounded-lg hover:bg-[#ede1cf] border border-transparent hover:border-[#b89e7c] cursor-pointer"
                          title="Personnel dossier options"
                        >
                          <MoreHorizontal className="w-4 h-4" />
                        </button>

                        {activePlayerMenu === p.id && (
                          <div className="absolute right-0 top-8 z-50 bg-[#fffdf9] border-2 border-[#8c6d48] rounded-xl p-1.5 shadow-2xl min-w-[140px] space-y-1 font-mono">
                            {isHost && p.id !== currentUser.id && onPromoteHost && (
                              <button
                                onClick={() => {
                                  onPromoteHost(p.id);
                                  setActivePlayerMenu(null);
                                }}
                                className="w-full text-left px-2.5 py-1.5 text-xs text-[#1a110a] hover:bg-[#ede1cf] rounded-lg flex items-center gap-1.5 cursor-pointer font-bold"
                              >
                                <span>★</span> Promote to Chief
                              </button>
                            )}
                            {isHost && p.id !== currentUser.id && onKickPlayer && (
                              <button
                                onClick={() => {
                                  onKickPlayer(p.id);
                                  setActivePlayerMenu(null);
                                }}
                                className="w-full text-left px-2.5 py-1.5 text-xs text-red-900 hover:bg-red-100 rounded-lg flex items-center gap-1.5 cursor-pointer font-bold"
                              >
                                <span>✕</span> Dismiss from Case
                              </button>
                            )}
                            <button
                              onClick={() => setActivePlayerMenu(null)}
                              className="w-full text-left px-2.5 py-1 text-[11px] text-[#7a5e45] hover:text-[#1a110a] rounded-lg cursor-pointer"
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

              {/* Waiting for player empty slots (Blank Photo Mounts) */}
              {Array.from({ length: waitingSlotsCount }).map((_, i) => (
                <div
                  key={`wait-${i}`}
                  className="flex items-center justify-between px-3.5 py-2.5 rounded-xl border-2 border-dashed border-[#bfa98e] text-[#7a5e45] text-xs font-mono bg-[#f4ede0]/60"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-sm border-2 border-dashed border-[#8c6d48]/60 bg-[#ede1cf]/50 flex items-center justify-center text-xs text-[#7a5e45] font-bold">
                      +
                    </div>
                    <span className="text-[11px]">VACANT DESK • Awaiting detective...</span>
                  </div>
                  <div className="flex items-center gap-2">
                    {isHost && onAddBot && i === 0 && (
                      <button
                        onClick={onAddBot}
                        className="px-2.5 py-1 rounded-lg border-2 border-red-800 bg-red-100 hover:bg-red-200 text-red-900 text-[10px] font-bold font-mono transition-colors flex items-center gap-1 cursor-pointer shadow-xs active:scale-95"
                      >
                        <span>+ Deploy Bot</span>
                      </button>
                    )}
                    <button
                      onClick={() => setIsInviteModalOpen(true)}
                      className="px-3 py-1 rounded-lg border-2 border-[#b89e7c] bg-[#ede1cf] hover:bg-[#e4d3ba] text-[#3e2b1b] text-[11px] font-mono font-bold transition-colors cursor-pointer shadow-xs active:scale-95"
                    >
                      Enlist
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* ACTION BUTTONS BELOW PLAYER LIST */}
          <div className="space-y-3 pt-1">
            {/* Side-by-Side: Invite Friends & Copy Link */}
            <div className="grid grid-cols-2 gap-3">
              <button
                onClick={() => setIsInviteModalOpen(true)}
                className="py-2.5 px-4 rounded-xl border-2 border-[#b89e7c] hover:border-red-800 bg-[#ede1cf] hover:bg-[#fffdf9] text-[#221711] text-xs font-mono font-bold transition-all flex items-center justify-center gap-2 shadow-sm cursor-pointer active:scale-95"
              >
                <Plus className="w-3.5 h-3.5 text-red-800 stroke-[2.5]" />
                <span>Enlist Detectives</span>
              </button>

              <button
                onClick={handleCopyLink}
                className="py-2.5 px-4 rounded-xl border-2 border-[#b89e7c] hover:border-red-800 bg-[#ede1cf] hover:bg-[#fffdf9] text-[#221711] text-xs font-mono font-bold transition-all flex items-center justify-center gap-2 shadow-sm cursor-pointer active:scale-95"
              >
                <Link className="w-3.5 h-3.5 text-red-800 stroke-[2.5]" />
                <span>{hasCopied ? 'Link Copied!' : 'Copy Dossier Link'}</span>
              </button>
            </div>

            {/* Non-host Ready Toggle (Stamped Ink Slip Button) */}
            {!isHost && (
              <button
                onClick={() => {
                  SoundService.playBadgeClick();
                  onToggleReady();
                }}
                className={`w-full py-3.5 rounded-xl text-xs font-mono font-black uppercase tracking-wider transition-all cursor-pointer shadow-md active:scale-98 ${
                  currentUser.isReady
                    ? 'bg-[#ede1cf] border-2 border-[#8c6d48] text-[#1a110a]'
                    : 'bg-[#8a1c1c] hover:bg-[#9e2222] text-white border-2 border-[#541010]'
                }`}
              >
                {currentUser.isReady ? '✓ You Are Ready (Click to Withdraw)' : '✦ Declare Ready for Duty ✦'}
              </button>
            )}

            {/* BIG PRIMARY "START INVESTIGATION" WAX SEAL BUTTON */}
            {isHost && (
              <div className="space-y-2">
                <button
                  onClick={() => {
                    SoundService.playStamp();
                    onStartGame();
                  }}
                  disabled={displayPlayers.length < 2}
                  className="w-full py-4 px-6 rounded-2xl bg-[#8a1c1c] hover:bg-[#9e2222] disabled:opacity-40 text-white font-mono font-black text-sm uppercase tracking-wider transition-all flex items-center justify-center gap-2 cursor-pointer shadow-lg border-2 border-[#541010] active:scale-98"
                >
                  <Play className="w-4 h-4 fill-white" />
                  <span>COMMENCE INVESTIGATION ({displayPlayers.length}/8 DETECTIVES)</span>
                </button>

                {displayPlayers.length < 2 && onAddBot && (
                  <button
                    onClick={() => {
                      SoundService.playClick();
                      onAddBot();
                    }}
                    className="w-full py-2.5 rounded-xl border-2 border-red-800/80 bg-[#ede1cf] hover:bg-red-100 text-red-900 text-xs font-mono font-bold transition-all flex items-center justify-center gap-1.5 shadow-sm cursor-pointer active:scale-98"
                  >
                    <span>+ Deploy Bureau Bot (Solo Play Supported)</span>
                  </button>
                )}
              </div>
            )}

            <div className="text-center text-[11px] font-mono text-[#5c422e]">
              {displayPlayers.length < 2
                ? 'Need at least 2 detectives to commence (enlist squad or deploy Bureau Bot)'
                : isHost
                ? 'Ready to proceed! Click Commence Investigation when detectives are prepared.'
                : 'Awaiting the Chief Investigator to launch the case docket...'}
            </div>
          </div>
        </div>

        {/* ======================================================== */}
        {/* RIGHT COLUMN: GAME SETTINGS (HOST ONLY) & NOTES          */}
        {/* ======================================================== */}
        <div className="lg:col-span-4 flex flex-col gap-4 order-2 lg:order-3">
          {/* GAME SETTINGS CARD — HOST ONLY (VINTAGE BUREAU INVESTIGATION DIRECTIVES) */}
          {isHost ? (
            <div
              className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-5 shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.15)] space-y-4 select-none"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Corner Decorative Accents */}
              <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              {/* Header with Reset button */}
              <div className="flex items-center justify-between border-b-2 border-[#bfa98e]/70 pb-2.5">
                <div className="flex items-center gap-2">
                  <div className="w-6 h-6 rounded-md bg-red-100 border border-red-800 flex items-center justify-center text-red-900 shadow-xs">
                    <Settings className="w-3.5 h-3.5" />
                  </div>
                  <div>
                    <span className="font-serif font-black text-[#1a110a] text-sm sm:text-base tracking-tight block">
                      Case Directives (Chief Only)
                    </span>
                    <span className="text-[9px] font-mono text-[#7a5e45] uppercase tracking-widest block -mt-0.5">
                      BUREAU PROTOCOL ORDER
                    </span>
                  </div>
                </div>

                <button
                  onClick={() => {
                    setRounds(1);
                    setDrawingTime(120);
                    setSelectedCase('all');
                    onUpdateSettings({
                      turnDuration: 120,
                      distorterEnabled: false,
                      selectedCaseId: 'all',
                      allowQuestioning: true,
                    });
                  }}
                  className="flex items-center gap-1 text-[11px] font-mono text-[#7a5e45] hover:text-[#1a110a] transition-colors cursor-pointer font-bold px-2 py-1 rounded bg-[#ede1cf] border border-[#b89e7c] shadow-xs active:scale-95"
                >
                  <RotateCcw className="w-3 h-3 text-[#8c6d48]" />
                  <span>Reset</span>
                </button>
              </div>

              {/* 1. Case Genre / Mystery Theme */}
              <div>
                <label className="block text-[#5c422e] text-[11px] font-mono font-bold uppercase tracking-wider mb-1.5">
                  Mystery Case Theme
                </label>
                <div
                  onClick={() => isHost && setIsCasePickerOpen(true)}
                  className={`p-3 bg-[#fffdf9] border-2 border-[#b89e7c] rounded-xl flex items-center justify-between transition-all shadow-sm ${
                    isHost ? 'cursor-pointer hover:border-red-800 group active:scale-99' : 'cursor-default opacity-90'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-lg overflow-hidden bg-[#ede1cf] flex-shrink-0 border-2 border-[#b89e7c] flex items-center justify-center text-xl shadow-inner group-hover:border-red-800 transition-colors">
                      {activeGenre.icon}
                    </div>
                    <div>
                      <div className="text-xs sm:text-sm font-serif font-black text-[#1a110a] group-hover:text-red-900 transition-colors">
                        {activeGenre.title}
                      </div>
                      <div className="text-[10px] text-[#7a5e45] font-mono">
                        {isHost ? 'Click to select classified archive category' : 'Category selected by Chief'}
                      </div>
                    </div>
                  </div>
                  {isHost && <ChevronDown className="w-4 h-4 text-[#7a5e45] group-hover:text-[#1a110a]" />}
                </div>
              </div>

              {/* 2. Number of Rounds with Quick Selection & Custom Input */}
              <div>
                <div className="flex items-center justify-between mb-1.5">
                  <label className="text-[#5c422e] text-[11px] font-mono font-bold uppercase tracking-wider">
                    Investigation Acts (Rounds)
                  </label>
                  <span className="text-[11px] font-mono text-red-900 font-black bg-red-50 border border-red-800/40 px-2 py-0.2 rounded">
                    {rounds} {rounds === 1 ? 'Act' : 'Acts'}
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
                      className={`py-2 rounded-xl text-xs font-mono font-black transition-all cursor-pointer shadow-xs active:scale-95 ${
                        rounds === r
                          ? 'bg-[#8a1c1c] text-white shadow-md border-2 border-[#541010]'
                          : 'bg-[#ede1cf] text-[#4a3525] border-2 border-[#b89e7c] hover:border-[#8c6d48] hover:text-[#1a110a]'
                      }`}
                    >
                      {r}
                    </button>
                  ))}
                </div>
                <div className="flex items-center gap-2 bg-[#fffdf9] border-2 border-[#b89e7c] rounded-xl px-3 py-1.5 shadow-inner">
                  <span className="text-[11px] font-mono text-[#7a5e45] font-bold shrink-0">Custom:</span>
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
                    className="w-full bg-transparent text-[#1a110a] font-mono text-xs outline-none font-bold"
                    placeholder="Enter acts (1-25)"
                  />
                  <span className="text-[10px] font-mono text-[#8a725b] shrink-0">(1–25)</span>
                </div>
              </div>

              {/* 3. Drawing Time Dropdown */}
              <div>
                <label className="block text-[#5c422e] text-[11px] font-mono font-bold uppercase tracking-wider mb-1.5">
                  Crime Scene Sketch Timer
                </label>
                <div className="relative">
                  <select
                    value={drawingTime}
                    onChange={(e) => {
                      const val = Number(e.target.value);
                      setDrawingTime(val);
                      onUpdateSettings({ ...room.settings, turnDuration: val });
                    }}
                    className="w-full py-2.5 px-3.5 bg-[#fffdf9] border-2 border-[#b89e7c] rounded-xl text-[#1a110a] text-xs font-mono appearance-none outline-none focus:border-red-800 cursor-pointer shadow-inner font-bold"
                  >
                    <option value={30}>30 seconds (Rapid Deduction)</option>
                    <option value={40}>40 seconds (Fast Sketch)</option>
                    <option value={60}>60 seconds (Standard)</option>
                    <option value={80}>80 seconds (Detailed Inspection)</option>
                    <option value={120}>120 seconds (Default Investigation)</option>
                    <option value={160}>160 seconds (Extended Forensics)</option>
                    <option value={180}>180 seconds (Full Masterpiece)</option>
                  </select>
                  <ChevronDown className="w-4 h-4 text-[#7a5e45] absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
                </div>
              </div>
            </div>
          ) : (
            /* NON-HOST VIEW: Case Intel Briefing */
            <div
              className="relative text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-5 shadow-lg space-y-3 select-none"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              <div className="text-xs font-mono font-bold uppercase tracking-wider text-[#1a110a] border-b border-[#bfa98e]/80 pb-2 flex items-center justify-between">
                <span>Investigation Directives</span>
                <span className="text-red-900 text-[10px] font-mono font-bold border border-red-800 bg-red-100 px-2 py-0.5 rounded">
                  Lead Controlled
                </span>
              </div>
              <p className="text-xs text-[#5c422e] leading-relaxed font-mono">
                The Lead Detective is preparing the case docket. When launched, a mystery dossier will be unsealed for the squad!
              </p>
              <div className="p-3 bg-[#fffdf9] rounded-xl border-2 border-[#b89e7c] flex items-center gap-3 shadow-sm">
                <div className="w-9 h-9 rounded-xl bg-[#ede1cf] border border-[#b89e7c] flex items-center justify-center text-red-800 shrink-0">
                  <Search className="w-5 h-5" />
                </div>
                <div>
                  <div className="text-xs font-bold text-[#1a110a] font-serif">Active Theme: {selectedCase || 'All Mysteries'}</div>
                  <div className="text-[10px] text-[#7a5e45] font-mono">Sketch Time: {drawingTime}s • {rounds} round(s)</div>
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

      {/* INVITE MODAL (VINTAGE INVESTIGATION DISPATCH) */}
      {isInviteModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 select-none animate-fadeIn">
          <div
            className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl max-w-sm w-full p-6 shadow-[0_20px_60px_rgba(0,0,0,0.9)] space-y-4 overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <button
              onClick={() => setIsInviteModalOpen(false)}
              className="absolute top-4 right-4 text-[#7a5e45] hover:text-[#1a110a] font-bold cursor-pointer"
            >
              ✕
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-red-900 border border-red-800 bg-red-100 px-2 py-0.5 rounded font-black uppercase tracking-widest">
                ★ DISPATCH CALL
              </span>
              <h3 className="text-lg font-black font-serif text-[#1a110a] pt-1">
                Summon Fellow Detectives
              </h3>
              <p className="text-xs text-[#5c422e] font-mono">
                Send this room code or telegram link to enlist detectives for this case!
              </p>
            </div>

            <div className="p-4 bg-[#fffdf9] border-2 border-[#b89e7c] rounded-xl text-center space-y-2 shadow-inner">
              <span className="text-[10px] font-mono text-[#7a5e45] uppercase tracking-widest font-bold">
                BUREAU ROOM CODE
              </span>
              <div className="text-3xl font-mono font-black tracking-widest text-[#1a110a]">
                {room.code}
              </div>
              <button
                onClick={handleCopy}
                className="w-full py-2.5 rounded-lg bg-[#ede1cf] hover:bg-[#e2d3be] border border-[#b89e7c] text-xs font-mono font-bold text-[#1a110a] transition-colors cursor-pointer"
              >
                {hasCopied ? '✓ Room Code Copied!' : 'Copy Room Code'}
              </button>
            </div>

            <div className="space-y-2">
              <button
                onClick={handleCopyLink}
                className="w-full py-3 rounded-xl bg-red-800 hover:bg-red-700 text-white text-xs font-mono font-black uppercase tracking-wider transition-all flex items-center justify-center gap-2 cursor-pointer shadow-md"
              >
                <Link className="w-3.5 h-3.5" />
                <span>{hasCopied ? '✓ Invite Link Copied!' : 'Copy Telegram Invite Link'}</span>
              </button>
              <p className="text-[11px] font-mono text-[#6e533d] text-center">
                Anyone with the telegram link will enter this detective bureau instantly.
              </p>
            </div>
          </div>
        </div>
      )}

      {/* CASE GENRE PICKER MODAL (VINTAGE CLASSIFIED ARCHIVES) */}
      {isCasePickerOpen && isHost && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 select-none animate-fadeIn">
          <div
            className="relative text-[#221711] border-4 border-[#8c6d48] rounded-3xl max-w-xl w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9),inset_0_0_80px_rgba(139,94,60,0.18)] space-y-4 overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Corner Decorative Accents */}
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => setIsCasePickerOpen(false)}
              className="absolute top-4 right-4 text-[#7a5e45] hover:text-[#1a110a] font-bold text-base cursor-pointer"
            >
              ✕
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-red-900 border-2 border-red-800 bg-red-100 px-2.5 py-0.5 rounded font-black uppercase tracking-widest">
                ★ CLASSIFIED ARCHIVES
              </span>
              <h3 className="text-xl font-black font-serif text-[#1a110a] pt-1">
                Select Case Genre & Dossier Category
              </h3>
              <p className="text-xs text-[#5c422e] font-mono">
                Mystery stories distributed to detectives will follow this investigation category.
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
                  className={`p-3.5 rounded-xl border-2 cursor-pointer transition-all flex items-start gap-3 shadow-sm ${
                    selectedCase === g.id
                      ? 'bg-[#fffdf9] border-red-800 ring-2 ring-red-800 shadow-md'
                      : 'bg-[#ede1cf] border-[#b89e7c] hover:border-[#8c6d48] hover:bg-[#fffdf9]'
                  }`}
                >
                  <span className="text-2xl">{g.icon}</span>
                  <div>
                    <div className="text-xs font-serif font-black text-[#1a110a]">{g.title}</div>
                    <div className="text-[10px] text-[#5c422e] font-mono mt-0.5 leading-snug">{g.desc}</div>
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
