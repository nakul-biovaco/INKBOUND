import React, { useEffect, useState } from 'react';
import {
  UserPlus,
  LogIn,
  X,
  Loader2,
  ChevronLeft,
  ChevronRight,
  Folder,
  BookOpen,
  Trophy,
  Check,
  Shield,
} from 'lucide-react';
import { Player } from '../types/player';
import { AuthService } from '../services/authService';
import { AvatarBadge, AvatarPicker, AvatarId } from '../components/common/AvatarBadge';
import { decodeInviteCode } from '../utils/inviteCrypto';
import { AudioControl } from '../components/common/AudioControl';
import { SoundService } from '../services/soundService';

interface HomeProps {
  currentUser: Player;
  onUpdateProfile: (updated: Player) => void;
  onCreateRoom: () => void;
  onJoinRoom: (code: string) => void;
  isCreating?: boolean;
  isJoining?: boolean;
}

const AVATAR_LIST: AvatarId[] = [
  'detective',
  'magnifier',
  'casefile',
  'scroll',
  'shield',
  'crown',
  'spark',
  'eye',
];

export const Home: React.FC<HomeProps> = ({
  currentUser,
  onUpdateProfile,
  onCreateRoom,
  onJoinRoom,
  isCreating = false,
  isJoining = false,
}) => {
  const [isCasesModalOpen, setIsCasesModalOpen] = useState(false);
  const [isLeaderboardModalOpen, setIsLeaderboardModalOpen] = useState(false);
  const [isRulesModalOpen, setIsRulesModalOpen] = useState(false);
  const [isAvatarPickerOpen, setIsAvatarPickerOpen] = useState(false);

  // In-card states
  const [roomCodeInput, setRoomCodeInput] = useState('');
  const [nicknameInput, setNicknameInput] = useState(currentUser.nickname);
  const [selectedAvatar, setSelectedAvatar] = useState<AvatarId>(
    (currentUser.avatar as AvatarId) || 'detective'
  );
  const [cardErrorMsg, setCardErrorMsg] = useState('');
  const [badgeSavedFeedback, setBadgeSavedFeedback] = useState(false);

  const extractCode = (input: string): string => {
    return decodeInviteCode(input);
  };

  const handleJoinSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const code = extractCode(roomCodeInput);
    if (!code) {
      SoundService.playAlert();
      setCardErrorMsg('Please enter a valid 5-6 letter room code.');
      return;
    }
    setCardErrorMsg('');
    SoundService.playStamp();
    onJoinRoom(code);
  };

  const handlePasteCode = async () => {
    SoundService.playClick();
    try {
      const text = await navigator.clipboard.readText();
      if (text) {
        const clean = extractCode(text);
        if (clean) {
          setRoomCodeInput(clean);
          setCardErrorMsg('');
        }
      }
    } catch {
      // ignore clipboard permission
    }
  };

  const handleCycleAvatar = (direction: 'prev' | 'next') => {
    SoundService.playBadgeClick();
    const currentIdx = AVATAR_LIST.indexOf(selectedAvatar);
    const nextIdx =
      direction === 'next'
        ? (currentIdx + 1) % AVATAR_LIST.length
        : (currentIdx - 1 + AVATAR_LIST.length) % AVATAR_LIST.length;
    setSelectedAvatar(AVATAR_LIST[nextIdx]);
  };

  const handleSaveBadge = async (e: React.FormEvent) => {
    e.preventDefault();
    SoundService.playBadgeClick();
    const updated = await AuthService.updateDetective(nicknameInput.trim() || 'Detective', selectedAvatar);
    onUpdateProfile(updated);
    setBadgeSavedFeedback(true);
    setTimeout(() => setBadgeSavedFeedback(false), 2200);
  };

  const [leaderboardList, setLeaderboardList] = useState<
    { rank: number; name: string; avatar: string; score: number; rate: string }[]
  >([]);

  useEffect(() => {
    AuthService.getLeaderboard().then(setLeaderboardList);
  }, []);

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* 1. PHOTOREALISTIC NOIR DESK BACKGROUND */}
      <div
        className="absolute top-0 left-0 right-0 h-[720px] md:h-[800px] bg-cover bg-center bg-no-repeat opacity-60 mix-blend-luminosity filter brightness-90 pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="absolute top-0 left-0 right-0 h-[720px] md:h-[800px] bg-gradient-to-b from-black/85 via-[#08090d]/60 to-[#08090d] pointer-events-none" />

      {/* 2. TOP HEADER BAR */}
      <header className="relative z-30 w-full max-w-7xl mx-auto px-4 sm:px-8 py-4 flex items-center justify-between">
        {/* Left: INKBOUND Official Logo */}
        <div className="flex items-center gap-3">
          <img
            src="/assets/logo.png"
            alt="INKBOUND"
            className="h-8 sm:h-9 object-contain filter drop-shadow-[0_2px_12px_rgba(0,0,0,0.9)]"
          />
          <span className="hidden sm:inline-block px-2.5 py-0.5 rounded-full bg-red-950/70 text-red-300 border border-red-700/50 text-[10px] font-mono uppercase tracking-widest font-bold">
            Mystery Party Game
          </span>
        </div>

        {/* Right: Quick Table Buttons & Audio */}
        <div className="flex items-center gap-2 sm:gap-3">
          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsRulesModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3.5 py-1.5 rounded-xl bg-white/[0.05] hover:bg-white/[0.1] text-slate-200 hover:text-white border border-white/15 backdrop-blur-xl text-xs font-medium transition-all shadow-md cursor-pointer"
          >
            <BookOpen className="w-3.5 h-3.5 text-amber-400" />
            <span>How to Play</span>
          </button>

          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsLeaderboardModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3.5 py-1.5 rounded-xl bg-white/[0.05] hover:bg-white/[0.1] text-slate-200 hover:text-white border border-white/15 backdrop-blur-xl text-xs font-medium transition-all shadow-md cursor-pointer"
          >
            <Trophy className="w-3.5 h-3.5 text-yellow-400" />
            <span>Top Scores</span>
          </button>

          <AudioControl />
        </div>
      </header>

      {/* 3. HERO GAME HUB */}
      <main className="relative z-20 flex-1 flex flex-col items-center justify-center px-4 max-w-6xl mx-auto w-full pt-4 pb-12">
        {/* BIG HERO LOGO & CASUAL TAGLINE */}
        <div className="text-center mb-6 sm:mb-8 space-y-2">
          <div className="relative inline-block mb-1">
            <img
              src="/assets/logo.png"
              alt="INKBOUND"
              className="h-20 sm:h-28 md:h-32 object-contain filter drop-shadow-[0_15px_30px_rgba(0,0,0,0.95)] transform hover:scale-[1.01] transition-transform"
            />
          </div>
          <p className="text-xs sm:text-sm text-slate-300 max-w-xl mx-auto font-light leading-relaxed">
            A multiplayer mystery drawing game where everyone gets a secret clue.
            <br className="hidden sm:inline" />
            <span className="text-amber-300 font-medium"> Sketch your clue, spot the liar, and solve the crime together!</span>
          </p>
        </div>

        {/* 4. THE THREE ULTRA-RICH GLASSMORPHIC GAME CARDS */}
        <div className="w-full grid grid-cols-1 md:grid-cols-3 gap-5 sm:gap-6 items-stretch">
          {/* ======================================================== */}
          {/* CARD 1: HOST A GAME (GLASSMORPHIC CASE DOSSIER)          */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-red-600/35 to-rose-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="glass-card-host p-6 flex-1 flex flex-col justify-between relative"
            >
              {/* Top Red Wax Seal Stamp Badge */}
              <div className="flex items-center justify-between mb-4 border-b border-red-500/20 pb-3">
                <span className="text-[10px] font-mono tracking-widest text-red-300 font-bold uppercase flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-red-500 shadow-[0_0_10px_rgba(239,68,68,0.9)]" />
                  CASE DOSSIER #01
                </span>
                <span className="px-2.5 py-0.5 rounded-full text-[9px] font-mono font-bold bg-red-500/20 text-red-200 border border-red-400/30 backdrop-blur-md">
                  HOST
                </span>
              </div>

              {/* Content */}
              <div className="space-y-3 flex-1">
                <div className="w-12 h-12 rounded-2xl bg-red-500/15 border border-red-400/30 backdrop-blur-md flex items-center justify-center text-red-300 shadow-inner group-hover:scale-110 transition-transform">
                  <UserPlus className="w-6 h-6" />
                </div>

                <div>
                  <h3 className="text-lg font-bold text-white font-serif tracking-wide">Host a Game</h3>
                  <p className="text-xs text-slate-300 mt-1 leading-relaxed">
                    Start a private room for your squad. You'll get an invite code and link to share with friends.
                  </p>
                </div>

                <div className="pt-2 flex items-center gap-2 text-[11px] font-mono text-slate-200">
                  <span className="px-2.5 py-1 rounded-lg bg-black/40 border border-white/10 backdrop-blur-md">
                    👥 2 to 8 Players
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-black/40 border border-white/10 backdrop-blur-md">
                    🎨 Mystery Stories
                  </span>
                </div>
              </div>

              {/* 3D Action Button */}
              <div className="pt-6">
                <button
                  onClick={() => {
                    SoundService.playStamp();
                    onCreateRoom();
                  }}
                  disabled={isCreating}
                  className="w-full py-3.5 px-4 rounded-xl game-btn-red text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed"
                >
                  {isCreating ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span>Setting Up Room...</span>
                    </>
                  ) : (
                    <>
                      <UserPlus className="w-4 h-4 text-white" />
                      <span>Start New Game</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>

          {/* ======================================================== */}
          {/* CARD 2: JOIN A GAME (GLASSMORPHIC EVIDENCE PASS)          */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-amber-500/35 to-yellow-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="glass-card-join p-6 flex-1 flex flex-col justify-between relative"
            >
              {/* Top Gold Stamp Badge */}
              <div className="flex items-center justify-between mb-4 border-b border-amber-500/20 pb-3">
                <span className="text-[10px] font-mono tracking-widest text-amber-300 font-bold uppercase flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-amber-400 shadow-[0_0_10px_rgba(251,191,36,0.9)]" />
                  EVIDENCE PASS
                </span>
                <span className="px-2.5 py-0.5 rounded-full text-[9px] font-mono font-bold bg-amber-500/20 text-amber-200 border border-amber-400/30 backdrop-blur-md">
                  JOIN
                </span>
              </div>

              {/* Content & Inline Form */}
              <div className="space-y-3 flex-1">
                <div className="w-12 h-12 rounded-2xl bg-amber-500/15 border border-amber-400/30 backdrop-blur-md flex items-center justify-center text-amber-300 shadow-inner group-hover:scale-110 transition-transform">
                  <LogIn className="w-6 h-6" />
                </div>

                <div>
                  <h3 className="text-lg font-bold text-white font-serif tracking-wide">Join a Game</h3>
                  <p className="text-xs text-slate-300 mt-1 leading-relaxed">
                    Got a room code or link from a friend? Type or paste it here to enter the room.
                  </p>
                </div>

                {/* Direct In-Card Room Code Form with Glass Input */}
                <form onSubmit={handleJoinSubmit} id="join-card-form" className="pt-2 space-y-2">
                  <div className="relative flex items-center">
                    <input
                      type="text"
                      maxLength={100}
                      value={roomCodeInput}
                      onChange={(e) => {
                        const val = e.target.value;
                        if (val.includes('http') || val.includes('join=') || val.includes('room=')) {
                          setRoomCodeInput(extractCode(val));
                        } else {
                          setRoomCodeInput(val.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 10));
                        }
                        setCardErrorMsg('');
                      }}
                      placeholder="ROOM CODE"
                      className="w-full py-2.5 pl-3 pr-16 glass-input rounded-xl text-center text-base font-mono font-bold tracking-widest uppercase text-amber-300 outline-none"
                    />
                    <button
                      type="button"
                      onClick={handlePasteCode}
                      className="absolute right-1.5 px-2.5 py-1 rounded-lg bg-white/10 hover:bg-white/20 text-[10px] font-mono font-bold text-slate-200 hover:text-white transition-colors border border-white/15 backdrop-blur-md cursor-pointer"
                    >
                      PASTE
                    </button>
                  </div>

                  {cardErrorMsg && (
                    <p className="text-[11px] font-mono text-red-400 leading-tight">{cardErrorMsg}</p>
                  )}
                </form>
              </div>

              {/* 3D Action Button */}
              <div className="pt-6">
                <button
                  type="submit"
                  form="join-card-form"
                  disabled={isJoining}
                  className="w-full py-3.5 px-4 rounded-xl game-btn-gold text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed"
                >
                  {isJoining ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span>Entering Game...</span>
                    </>
                  ) : (
                    <>
                      <LogIn className="w-4 h-4 text-white" />
                      <span>Enter Game</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>

          {/* ======================================================== */}
          {/* CARD 3: DETECTIVE BADGE (GLASS POLAROID & IDENTITY)      */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-sky-500/35 to-cyan-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="glass-card-badge p-6 flex-1 flex flex-col justify-between relative"
            >
              {/* Top Badge Stamp */}
              <div className="flex items-center justify-between mb-4 border-b border-sky-500/20 pb-3">
                <span className="text-[10px] font-mono tracking-widest text-sky-300 font-bold uppercase flex items-center gap-1.5">
                  <Shield className="w-3.5 h-3.5 text-sky-400" />
                  DETECTIVE BADGE
                </span>
                <span className="px-2.5 py-0.5 rounded-full text-[9px] font-mono font-bold bg-sky-500/20 text-sky-200 border border-sky-400/30 backdrop-blur-md">
                  PROFILE
                </span>
              </div>

              {/* Interactive Polaroid Badge */}
              <div className="space-y-3 flex-1 flex flex-col items-center text-center">
                {/* Avatar Selector with Left / Right Arrows */}
                <div className="flex items-center gap-3 my-1">
                  <button
                    type="button"
                    onClick={() => handleCycleAvatar('prev')}
                    title="Previous Icon"
                    className="p-1.5 rounded-full bg-white/10 hover:bg-white/20 border border-white/15 text-slate-300 hover:text-white backdrop-blur-md transition-colors cursor-pointer"
                  >
                    <ChevronLeft className="w-4 h-4" />
                  </button>

                  <div
                    onClick={() => {
                      SoundService.playClick();
                      setIsAvatarPickerOpen(true);
                    }}
                    className="cursor-pointer transform hover:scale-105 transition-transform"
                    title="Click to view all icons"
                  >
                    <AvatarBadge avatar={selectedAvatar} size="lg" />
                  </div>

                  <button
                    type="button"
                    onClick={() => handleCycleAvatar('next')}
                    title="Next Icon"
                    className="p-1.5 rounded-full bg-white/10 hover:bg-white/20 border border-white/15 text-slate-300 hover:text-white backdrop-blur-md transition-colors cursor-pointer"
                  >
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </div>

                <button
                  type="button"
                  onClick={() => {
                    SoundService.playClick();
                    setIsAvatarPickerOpen(true);
                  }}
                  className="text-[10px] text-sky-300 hover:text-sky-200 font-mono underline cursor-pointer"
                >
                  Choose from gallery
                </button>

                {/* Inline Detective Name Input with Glass Input */}
                <form onSubmit={handleSaveBadge} id="badge-card-form" className="w-full pt-1 space-y-2">
                  <div className="text-left">
                    <label className="block text-[10px] font-mono text-slate-300 uppercase tracking-wider mb-1">
                      Your Detective Name
                    </label>
                    <input
                      type="text"
                      maxLength={18}
                      value={nicknameInput}
                      onChange={(e) => setNicknameInput(e.target.value)}
                      placeholder="Enter name"
                      className="w-full py-2 px-3 glass-input rounded-xl text-sm font-semibold text-white outline-none"
                    />
                  </div>
                </form>
              </div>

              {/* 3D Action Button */}
              <div className="pt-6">
                <button
                  type="submit"
                  form="badge-card-form"
                  className="w-full py-3.5 px-4 rounded-xl game-btn-dark text-slate-100 hover:text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer"
                >
                  {badgeSavedFeedback ? (
                    <>
                      <Check className="w-4 h-4 text-emerald-400" />
                      <span className="text-emerald-300">Badge Saved!</span>
                    </>
                  ) : (
                    <>
                      <Shield className="w-4 h-4 text-sky-400" />
                      <span>Save My Badge</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* 5. TABLE ITEMS: CASE STORIES, FIELD RULES, HALL OF FAME (GLASSMORPHIC TILES) */}
        <div className="w-full max-w-4xl mx-auto mt-10 pt-8 border-t border-white/10">
          <div className="text-center mb-4">
            <span className="text-[10px] font-mono uppercase tracking-[0.25em] text-slate-400 font-bold">
              INVESTIGATION DESK FILES
            </span>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3.5">
            {/* FILE 1: CASE STORIES */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsCasesModalOpen(true);
              }}
              className="p-3.5 glass-tile cursor-pointer flex items-center gap-3 group"
            >
              <div className="w-9 h-9 rounded-xl bg-red-500/15 border border-red-500/30 flex items-center justify-center text-red-300 group-hover:scale-110 transition-transform shadow-inner">
                <Folder className="w-4 h-4" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-red-300 transition-colors">
                  Mystery Stories
                </div>
                <div className="text-[10px] text-slate-400">3 pre-built crime cases</div>
              </div>
            </div>

            {/* FILE 2: HOW TO PLAY */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsRulesModalOpen(true);
              }}
              className="p-3.5 glass-tile cursor-pointer flex items-center gap-3 group"
            >
              <div className="w-9 h-9 rounded-xl bg-amber-500/15 border border-amber-500/30 flex items-center justify-center text-amber-300 group-hover:scale-110 transition-transform shadow-inner">
                <BookOpen className="w-4 h-4" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-amber-300 transition-colors">
                  How to Play
                </div>
                <div className="text-[10px] text-slate-400">Simple 4-step guide</div>
              </div>
            </div>

            {/* FILE 3: HALL OF FAME */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsLeaderboardModalOpen(true);
              }}
              className="p-3.5 glass-tile cursor-pointer flex items-center gap-3 group"
            >
              <div className="w-9 h-9 rounded-xl bg-yellow-500/15 border border-yellow-500/30 flex items-center justify-center text-yellow-300 group-hover:scale-110 transition-transform shadow-inner">
                <Trophy className="w-4 h-4" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-yellow-300 transition-colors">
                  Top Detectives
                </div>
                <div className="text-[10px] text-slate-400">High scores & rankings</div>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* 6. BOTTOM FOOTER */}
      <footer className="relative z-20 w-full max-w-7xl mx-auto px-6 py-4 flex flex-col sm:flex-row items-center justify-between text-xs text-slate-500 font-mono gap-2 border-t border-slate-900">
        <div className="flex items-center gap-2">
          <span className="font-bold text-slate-400 font-serif">INKBOUND</span>
          <span>• A game of drawings, deductions and secrets</span>
        </div>
        <div className="text-slate-500 text-[11px]">
          Grab your friends and crack the case together.
        </div>
      </footer>

      {/* ======================================================== */}
      {/* MODAL 1: HOW TO PLAY (SIMPLE & HUMAN)                    */}
      {/* ======================================================== */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-xl flex items-center justify-center p-4 animate-fadeIn">
          <div className="glass-card-base bg-[#0b1120]/90 border border-white/20 rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_60px_rgba(0,0,0,0.9)] relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsRulesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-amber-400 uppercase tracking-widest font-bold">
                GAME RULES
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">How to Play INKBOUND</h3>
              <p className="text-xs text-slate-400">Four easy steps to play with your friends:</p>
            </div>

            <div className="space-y-3 pt-2 text-xs">
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-red-900/60 border border-red-500 text-red-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  1
                </span>
                <div>
                  <div className="font-bold text-white">Draw Your Secret Clue</div>
                  <div className="text-slate-400 text-[11px] mt-0.5">
                    When it's your turn, you get a secret clue from the mystery story. Sketch it on the canvas before time runs out!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-amber-900/60 border border-amber-500 text-amber-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  2
                </span>
                <div>
                  <div className="font-bold text-white">Guess What's Being Drawn</div>
                  <div className="text-slate-400 text-[11px] mt-0.5">
                    Other players type guesses into the chat. If you match the clue (even the main words), you get points!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-sky-900/60 border border-sky-500 text-sky-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  3
                </span>
                <div>
                  <div className="font-bold text-white">Watch Out for the Imposter</div>
                  <div className="text-slate-400 text-[11px] mt-0.5">
                    One player gets a fake clue and tries to mislead the investigation without getting caught!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-emerald-900/60 border border-emerald-500 text-emerald-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  4
                </span>
                <div>
                  <div className="font-bold text-white">Crack the Case</div>
                  <div className="text-slate-400 text-[11px] mt-0.5">
                    Vote on who the culprit is and reconstruct the story to win big points!
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* ======================================================== */}
      {/* MODAL 2: CASE STORIES (MYSTERY ARCHIVES)                 */}
      {/* ======================================================== */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-xl flex items-center justify-center p-4 animate-fadeIn">
          <div className="glass-card-base bg-[#0b1120]/90 border border-white/20 rounded-3xl max-w-2xl w-full p-6 sm:p-8 shadow-[0_25px_60px_rgba(0,0,0,0.9)] relative space-y-4 max-h-[85vh] overflow-y-auto">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsCasesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-red-400 uppercase tracking-widest font-bold">
                STORY FILES
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Mystery Cases</h3>
              <p className="text-xs text-slate-300">Cases available to solve when you host a game:</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 pt-2">
              <div className="p-4 glass-tile rounded-2xl space-y-2 border-red-500/30">
                <span className="text-[10px] font-mono text-red-400 uppercase font-bold">Vault Heist</span>
                <h4 className="text-sm font-bold text-white font-serif">The Midnight Museum</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  The Eye of Osiris diamond vanished during an electrical blackout at midnight.
                </p>
                <div className="text-[10px] font-mono text-amber-300">4 Suspects • Normal</div>
              </div>

              <div className="p-4 glass-tile rounded-2xl space-y-2 border-sky-500/30">
                <span className="text-[10px] font-mono text-sky-400 uppercase font-bold">Train Mystery</span>
                <h4 className="text-sm font-bold text-white font-serif">The Grand Express</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  A locked luxury coach between Paris and Vienna with an encrypted missing ledger.
                </p>
                <div className="text-[10px] font-mono text-slate-400">4 Suspects • Normal</div>
              </div>

              <div className="p-4 glass-tile rounded-2xl space-y-2 border-amber-500/30">
                <span className="text-[10px] font-mono text-amber-400 uppercase font-bold">Gothic Manor</span>
                <h4 className="text-sm font-bold text-white font-serif">Blackwood Poisoning</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  Lord Blackwood was found unconscious beside a rare vintage decanter in the dining hall.
                </p>
                <div className="text-[10px] font-mono text-slate-400">4 Suspects • Normal</div>
              </div>
            </div>

            <div className="pt-2 flex justify-end">
              <button
                onClick={() => {
                  SoundService.playStamp();
                  setIsCasesModalOpen(false);
                  onCreateRoom();
                }}
                className="px-6 py-3 game-btn-red text-white font-bold rounded-xl text-xs uppercase tracking-wider cursor-pointer"
              >
                Host a Game Now
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* MODAL 3: TOP DETECTIVES (HALL OF FAME)                  */}
      {/* ======================================================== */}
      {isLeaderboardModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-xl flex items-center justify-center p-4 animate-fadeIn">
          <div className="glass-card-base bg-[#0b1120]/90 border border-white/20 rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_60px_rgba(0,0,0,0.9)] relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsLeaderboardModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-yellow-400 uppercase tracking-widest font-bold">
                RANKINGS
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Top Detectives</h3>
              <p className="text-xs text-slate-300">Best scoring players across all solved cases:</p>
            </div>

            <div className="space-y-2 pt-2">
              {leaderboardList.map((det) => (
                <div
                  key={det.name}
                  className="flex items-center justify-between p-3.5 rounded-xl glass-tile text-xs"
                >
                  <div className="flex items-center gap-3">
                    <span className="font-mono font-bold text-amber-400 text-sm">#{det.rank}</span>
                    <AvatarBadge avatar={det.avatar} size="sm" />
                    <span className="font-bold text-white">{det.name}</span>
                  </div>
                  <div className="flex items-center gap-3 font-mono">
                    <span className="text-slate-300 text-[11px]">{det.rate}</span>
                    <span className="font-bold text-amber-300">{det.score} PTS</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* MODAL 4: FULL AVATAR PICKER GALLERY                      */}
      {/* ======================================================== */}
      {isAvatarPickerOpen && (
        <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-xl flex items-center justify-center p-4 animate-fadeIn">
          <div className="glass-card-base bg-[#0b1120]/90 border border-white/20 rounded-3xl max-w-md w-full p-6 sm:p-8 shadow-[0_25px_60px_rgba(0,0,0,0.9)] relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsAvatarPickerOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Pick Your Icon</h3>
              <p className="text-xs text-slate-300">Choose any detective avatar for your badge:</p>
            </div>

            <div className="py-2">
              <AvatarPicker
                value={selectedAvatar}
                onChange={(avatar) => {
                  SoundService.playBadgeClick();
                  setSelectedAvatar(avatar as AvatarId);
                  setIsAvatarPickerOpen(false);
                }}
              />
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
