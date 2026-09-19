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
import { getStoryArtwork } from '../utils/storyArtwork';
import { BackendClient } from '../realtime/backendClient';

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
  const currentArtwork = getStoryArtwork(activeGenre.title, '', selectedCase);
  const isHost = currentUser.id === room.hostId || currentUser.isHost;

  const [kickVotes, setKickVotes] = useState<
    Record<string, { currentVotes: number; requiredVotes: number; voterIds: string[] }>
  >({});

  const backend = BackendClient.getInstance();

  useEffect(() => {
    const unsubVoteKick = backend.on('VOTE_KICK_UPDATE', (payload: any) => {
      if (payload?.targetPlayerId) {
        setKickVotes((prev) => ({
          ...prev,
          [payload.targetPlayerId]: {
            currentVotes: payload.currentVotes,
            requiredVotes: payload.requiredVotes,
            voterIds: payload.voterIds || [],
          },
        }));
      }
    });

    const unsubPlayerKicked = backend.on('PLAYER_KICKED', (payload: any) => {
      if (payload?.targetPlayerId) {
        setKickVotes((prev) => {
          const next = { ...prev };
          delete next[payload.targetPlayerId];
          return next;
        });
      }
    });

    return () => {
      unsubVoteKick();
      unsubPlayerKicked();
    };
  }, [backend]);

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

  // Ready state rules for starting game: In hosted/create rooms, ALL non-host players MUST be ready!
  const isQuickMatch = Boolean(room.settings?.isQuickMatch || room.isQuickMatch);
  const nonHostPlayers = displayPlayers.filter((p) => p.id !== room.hostId && !p.isHost);
  const unreadyPlayers = nonHostPlayers.filter((p) => !p.isReady);
  const allNonHostReady = isQuickMatch || unreadyPlayers.length === 0;
  const canStart = displayPlayers.length >= 2 && allNonHostReady;

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
        <div className="lg:col-span-3 flex flex-col gap-4 order-3 lg:order-1 items-center lg:items-stretch">
          {/* Polaroid Crime Photo & Pinned Notes */}
          <div className="relative flex flex-col items-center lg:items-start mb-1">
            {/* Handwritten Note Top */}
            <div className="font-handwriting text-amber-200/90 text-xs sm:text-sm -rotate-2 mb-2 px-2 drop-shadow text-center lg:text-left max-w-xs">
              {currentArtwork.quote}
            </div>

            {/* Vintage Polaroid Photo */}
            <div className="relative w-52 sm:w-56 bg-[#fcfbfa] p-2.5 pb-6 rounded-md shadow-2xl rotate-1 hover:rotate-0 transition-all duration-300 border border-stone-300/70">
              {/* Red Pin */}
              <div className="w-4 h-4 rounded-full bg-red-700 absolute -top-2 left-1/2 -translate-x-1/2 shadow-md border-2 border-red-950 z-10" />
              <div className="w-full aspect-[4/3] bg-stone-900 overflow-hidden rounded-xs relative">
                <img
                  key={currentArtwork.img}
                  src={currentArtwork.img}
                  alt={currentArtwork.caption}
                  className="w-full h-full object-cover filter contrast-115 sepia-[0.2] transition-opacity duration-500 animate-fadeIn"
                />
                <div className="absolute top-1.5 right-1.5 px-2 py-0.5 rounded bg-black/75 backdrop-blur-xs text-[9px] font-mono text-amber-200 font-bold uppercase tracking-wider border border-amber-400/30">
                  {activeGenre.title.split(' ')[0]}
                </div>
              </div>
              <div className="mt-2 font-handwriting text-[13px] text-stone-800 text-center italic font-bold tracking-wide">
                {currentArtwork.caption}
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
            className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-3.5 sm:p-5 shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.15)] overflow-hidden flex flex-col gap-3 select-none"
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

            {/* Top Row: Docket Header + Code on Left, Detective Counter Tag on Right */}
            <div className="flex items-start justify-between gap-2.5 pl-2 sm:pl-3 pt-0.5">
              <div className="min-w-0">
                <div className="flex items-center gap-1.5 sm:gap-2">
                  <span className="text-[9px] sm:text-[10px] font-mono font-bold uppercase tracking-widest text-[#6e533d] truncate">
                    CASE DOCKET NO.
                  </span>
                  <span className="text-[8px] sm:text-[9px] font-mono px-1.5 py-0.2 rounded bg-[#e8dac6] text-[#543b27] border border-[#b89e7c] shrink-0">
                    FILE REF
                  </span>
                </div>

                <div className="flex items-center gap-2 sm:gap-3 mt-1">
                  <span className="text-2xl sm:text-4xl font-mono font-black tracking-widest text-[#1a110a] drop-shadow-[0_1px_0_rgba(255,255,255,0.8)] border-b-2 border-[#8c6d48]/40 pb-0.5">
                    {room.code}
                  </span>
                  <button
                    onClick={handleCopy}
                    title="Copy Dossier Room Code"
                    className="p-1.5 sm:p-2 rounded-lg bg-[#ede1cf] hover:bg-[#dfceb7] text-[#3e2b1b] hover:text-[#1a110a] transition-all border-2 border-[#b89e7c] cursor-pointer shadow-sm active:scale-95 shrink-0"
                  >
                    {hasCopied ? <Check className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-emerald-800 stroke-[3]" /> : <Copy className="w-3.5 h-3.5 sm:w-4 sm:h-4" />}
                  </button>
                </div>
              </div>

              {/* Detective Counter Badge */}
              <div className="relative text-center flex flex-col items-center bg-[#fdfcf9] border-2 border-[#8c6d48] px-3 sm:px-4 py-1.5 sm:py-2.5 rounded-xl shadow-[0_3px_10px_rgba(0,0,0,0.08),inset_0_0_20px_rgba(139,94,60,0.1)] shrink-0">
                <div className="absolute -top-1.5 left-1/2 -translate-x-1/2 w-2.5 h-2.5 rounded-full border border-[#8c6d48] bg-[#d9c5ab] shadow-xs flex items-center justify-center">
                  <div className="w-1 h-1 rounded-full bg-[#4a3421]" />
                </div>
                <div className="flex items-center gap-1 text-[#1a110a] font-mono font-black text-xs sm:text-base pt-0.5">
                  <Users className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-[#8c6d48]" />
                  <span>
                    {displayPlayers.length} / {maxSlots}
                  </span>
                </div>
                <div className="text-[8px] sm:text-[9px] uppercase font-mono font-bold tracking-wider text-[#6e533d]">
                  DETECTIVES
                </div>
              </div>
            </div>

            {/* Bottom Row: Status Line */}
            <div className="flex items-center flex-wrap gap-1.5 sm:gap-2 pl-2 sm:pl-3 text-xs text-[#5c422e] font-mono border-t border-[#bfa98e]/50 pt-2">
              <span className="text-[10px] sm:text-[11px] text-[#6e533d] font-bold">Status:</span>
              <span className="inline-flex items-center gap-1 text-[9px] sm:text-[10px] text-emerald-950 font-mono font-black px-2 py-0.5 rounded bg-emerald-100/90 border border-emerald-800 shadow-xs whitespace-nowrap">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-700 animate-pulse" />
                CASE ROOM OPEN
              </span>
              {room.settings?.isPublic !== false && (
                <span className="inline-flex items-center gap-1 text-[9px] sm:text-[10px] text-sky-950 font-mono font-bold px-2 py-0.5 rounded bg-sky-100/90 border border-sky-700 shadow-xs whitespace-nowrap">
                  <span className="w-1.5 h-1.5 rounded-full bg-sky-600 animate-ping" />
                  🌐 POLICE WIRE ACTIVE
                </span>
              )}
            </div>
          </div>

          {/* PLAYERS LIST ROSTER (VINTAGE INVESTIGATION PHOTO MUGSHOT LEDGER) */}
          <div
            className="relative text-[#221711] border-2 sm:border-3 border-[#8c6d48] rounded-2xl p-3 sm:p-4 shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.15)] space-y-2 select-none"
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
                <span>ACTIVE DETECTIVE ROSTER</span>
              </span>
              <span className="text-red-900 font-mono font-black text-[10px] sm:text-[11px] bg-red-50 border border-red-800/40 px-2 py-0.2 rounded">
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
                    className={`relative flex flex-col sm:flex-row sm:items-center justify-between gap-2 sm:gap-3 p-2.5 sm:px-3.5 sm:py-2.5 rounded-xl border-2 transition-all ${
                      isCurrent
                        ? 'bg-[#fffdf9] border-red-800 shadow-md ring-1 ring-red-800/50'
                        : 'bg-[#fffdf9]/95 border-[#b89e7c] hover:border-[#8c6d48] shadow-sm'
                    }`}
                  >
                    {/* Top / Left: Avatar + Nickname + Badges */}
                    <div className="flex items-center gap-2.5 min-w-0 flex-1">
                      {/* Photo Print Frame */}
                      <div className="relative p-1 bg-[#fdfcf9] border border-[#cfbeab] rounded shadow-xs shrink-0">
                        <AvatarBadge avatar={p.avatar} size="sm" className="ring-1 ring-[#8c6d48]/50 contrast-105" />
                      </div>

                      <div className="min-w-0 flex-1">
                        <div className="flex items-center gap-1.5 flex-wrap">
                          <span className="text-xs sm:text-sm font-bold font-serif text-[#1a110a] tracking-tight truncate max-w-[120px] sm:max-w-none">
                            {p.nickname}
                          </span>
                          {isCurrent && (
                            <span className="text-[9px] font-mono font-bold px-1.5 py-0.2 rounded bg-[#ede0ce] text-[#543b27] border border-[#b89e7c] shrink-0">
                              YOU
                            </span>
                          )}
                          {isPlayerHost && (
                            <div className="flex items-center gap-1 px-1.5 py-0.2 rounded bg-amber-100 border border-amber-700 text-amber-950 shadow-xs shrink-0">
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

                    {/* Bottom on Mobile / Right on Desktop: Status Badge + Vote Kick + Options Menu */}
                    <div className="flex items-center justify-between sm:justify-end gap-1.5 sm:gap-2 shrink-0 border-t sm:border-t-0 border-[#bfa98e]/40 pt-1.5 sm:pt-0 flex-wrap">
                      {p.isReady ? (
                        <span className="flex items-center gap-1 px-2 py-0.5 sm:px-2.5 sm:py-1 rounded text-[9px] sm:text-[10px] font-black text-emerald-950 bg-emerald-100 border-2 border-emerald-800 font-mono shadow-xs whitespace-nowrap -rotate-1">
                          ✓ READY
                        </span>
                      ) : (
                        <span className="flex items-center gap-1 px-2 py-0.5 sm:px-2.5 sm:py-1 rounded text-[9px] sm:text-[10px] font-bold text-[#6e533d] bg-[#ede1cf] border border-[#bfa98e] font-mono shadow-xs whitespace-nowrap">
                          ⏳ PREPARING
                        </span>
                      )}

                      {/* Vote to Kick button (75% majority kicks player) */}
                      {!isCurrent && (() => {
                        const playerKickInfo = kickVotes[p.id];
                        const hasVoted = playerKickInfo?.voterIds?.includes(currentUser.id);
                        return (
                          <button
                            type="button"
                            onClick={() => {
                              SoundService.playClick();
                              backend.voteKick(p.id);
                            }}
                            className={`px-2 py-0.5 sm:py-1 rounded-lg text-[9px] sm:text-[10px] font-mono font-bold flex items-center gap-1 border transition-all cursor-pointer ${
                              hasVoted
                                ? 'bg-amber-200 text-amber-950 border-amber-600 shadow-xs'
                                : 'bg-[#ede1cf] hover:bg-red-50 text-[#543b27] hover:text-red-900 border-[#b89e7c] hover:border-red-800'
                            }`}
                            title="Vote to kick (75% majority will automatically dismiss this player)"
                          >
                            <span>⚖️</span>
                            <span>
                              {hasVoted ? 'Voted Kick' : 'Vote Kick'}
                              {playerKickInfo && playerKickInfo.currentVotes > 0 ? ` (${playerKickInfo.currentVotes}/${playerKickInfo.requiredVotes})` : ''}
                            </span>
                          </button>
                        );
                      })()}

                      <div className="relative">
                        <button
                          onClick={() => setActivePlayerMenu(activePlayerMenu === p.id ? null : p.id)}
                          className="text-[#7a5e45] hover:text-[#1a110a] transition-colors p-1 rounded-lg hover:bg-[#ede1cf] border border-transparent hover:border-[#b89e7c] cursor-pointer"
                          title="Personnel dossier options"
                        >
                          <MoreHorizontal className="w-3.5 h-3.5 sm:w-4 sm:h-4" />
                        </button>

                        {activePlayerMenu === p.id && (
                          <div className="absolute right-0 top-8 z-50 bg-[#fffdf9] border-2 border-[#8c6d48] rounded-xl p-1.5 shadow-2xl min-w-[150px] space-y-1 font-mono">
                            {!isCurrent && (
                              <button
                                onClick={() => {
                                  backend.voteKick(p.id);
                                  setActivePlayerMenu(null);
                                }}
                                className="w-full text-left px-2.5 py-1.5 text-xs text-red-900 hover:bg-red-100 rounded-lg flex items-center gap-1.5 cursor-pointer font-bold"
                              >
                                <span>⚖️</span> Vote to Kick ({kickVotes[p.id]?.currentVotes || 0}/{kickVotes[p.id]?.requiredVotes || Math.max(1, Math.ceil((displayPlayers.length - 1) * 0.75))})
                              </button>
                            )}
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
                                <span>✕</span> Dismiss Directly
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
                  className="flex items-center justify-between gap-2 px-3 py-2 rounded-xl border-2 border-dashed border-[#bfa98e] text-[#7a5e45] text-xs font-mono bg-[#f4ede0]/60 min-w-0"
                >
                  <div className="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
                    <div className="w-7 h-7 sm:w-8 sm:h-8 rounded-sm border-2 border-dashed border-[#8c6d48]/60 bg-[#ede1cf]/50 flex items-center justify-center text-xs text-[#7a5e45] font-bold shrink-0">
                      +
                    </div>
                    <span className="text-[10px] sm:text-[11px] truncate">
                      <span className="font-bold">VACANT DESK</span>
                      <span className="hidden sm:inline"> • Awaiting detective...</span>
                    </span>
                  </div>
                  <div className="flex items-center gap-1.5 sm:gap-2 shrink-0">
                    {isHost && onAddBot && i === 0 && (
                      <button
                        onClick={onAddBot}
                        className="px-2 py-1 rounded-lg border-2 border-red-800 bg-red-100 hover:bg-red-200 text-red-900 text-[10px] font-bold font-mono transition-colors flex items-center gap-1 cursor-pointer shadow-xs whitespace-nowrap active:scale-95"
                      >
                        + Bot
                      </button>
                    )}
                    <button
                      onClick={() => setIsInviteModalOpen(true)}
                      className="px-2.5 sm:px-3 py-1 rounded-lg border-2 border-[#b89e7c] bg-[#ede1cf] hover:bg-[#e4d3ba] text-[#3e2b1b] text-[10px] sm:text-[11px] font-mono font-bold transition-colors cursor-pointer shadow-xs whitespace-nowrap active:scale-95"
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
                  disabled={!canStart}
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
              {displayPlayers.length < 2 ? (
                'Need at least 2 detectives to commence (enlist squad or deploy Bureau Bot)'
              ) : !allNonHostReady ? (
                <span className="inline-flex items-center gap-1 text-red-800 font-bold bg-red-100/90 border border-red-700/60 px-2.5 py-1 rounded-lg">
                  ⚠️ Waiting for all squad detectives to be ready ({unreadyPlayers.map((p) => p.nickname).join(', ')} not ready)
                </span>
              ) : isHost ? (
                <span className="text-emerald-900 font-bold bg-emerald-100/90 border border-emerald-700/60 px-2.5 py-1 rounded-lg">
                  ✓ All detectives are on duty & ready! Click Commence Investigation.
                </span>
              ) : (
                'Awaiting the Chief Investigator to launch the case docket...'
              )}
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
                      Case Settings (Host Only)
                    </span>
                    <span className="text-[9px] font-mono text-[#7a5e45] uppercase tracking-widest block -mt-0.5">
                      ROUND RULES & TIMER
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
                <span>Room Settings</span>
                <span className="text-red-900 text-[10px] font-mono font-bold border border-red-800 bg-red-100 px-2 py-0.5 rounded">
                  Host Controlled
                </span>
              </div>
              <p className="text-xs text-[#5c422e] leading-relaxed font-mono">
                The room host is setting up the case. When started, everyone will receive secret clues to draw!
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
              {Object.values(GENRE_OPTIONS).map((g) => {
                const artwork = getStoryArtwork(g.title, '', g.id);
                return (
                  <div
                    key={g.id}
                    onClick={() => {
                      SoundService.playStamp();
                      setSelectedCase(g.id);
                      onUpdateSettings({ ...room.settings, selectedCaseId: g.id });
                      setIsCasePickerOpen(false);
                    }}
                    className={`p-3 rounded-xl border-2 cursor-pointer transition-all flex items-center gap-3 shadow-sm ${
                      selectedCase === g.id
                        ? 'bg-[#fffdf9] border-red-800 ring-2 ring-red-800/80 shadow-md scale-[1.01]'
                        : 'bg-[#ede1cf] border-[#b89e7c] hover:border-[#8c6d48] hover:bg-[#fffdf9]'
                    }`}
                  >
                    <div className="w-12 h-12 rounded-lg overflow-hidden shrink-0 border border-[#b89e7c] shadow-xs">
                      <img
                        src={artwork.img}
                        alt={g.title}
                        className="w-full h-full object-cover filter contrast-110"
                      />
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="text-xs font-serif font-black text-[#1a110a] truncate">{g.title}</div>
                      <div className="text-[10px] text-[#5c422e] font-mono mt-0.5 line-clamp-2 leading-tight">{g.desc}</div>
                    </div>
                  </div>
                );
              })}
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
