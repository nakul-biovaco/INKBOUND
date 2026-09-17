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
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900/80 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/70 text-xs font-medium transition-all shadow"
          >
            <BookOpen className="w-3.5 h-3.5 text-amber-400" />
            <span>How to Play</span>
          </button>

          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsLeaderboardModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900/80 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/70 text-xs font-medium transition-all shadow"
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

        {/* 4. THE THREE TACTILE GAME CARDS */}
        <div className="w-full grid grid-cols-1 md:grid-cols-3 gap-5 sm:gap-6 items-stretch">
          {/* ======================================================== */}
          {/* CARD 1: HOST A GAME (CONFIDENTIAL CASE DOSSIER)          */}
          {/* ======================================================== */}
          <div
            onMouseEnter={() => SoundService.playCardFlip()}
            className="game-card p-6 flex flex-col justify-between relative group border-slate-700/80 hover:border-red-500/80"
          >
            {/* Top Red Wax Seal Stamp Badge */}
            <div className="flex items-center justify-between mb-4 border-b border-slate-800/80 pb-3">
              <span className="text-[10px] font-mono tracking-widest text-red-400 font-bold uppercase flex items-center gap-1.5">
                <span className="w-2 h-2 rounded-full bg-red-500 shadow-[0_0_8px_rgba(239,68,68,0.8)]" />
                CASE DOSSIER #01
              </span>
              <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-red-950/60 text-red-300 border border-red-600/30">
                HOST
              </span>
            </div>

            {/* Content */}
            <div className="space-y-3 flex-1">
              <div className="w-12 h-12 rounded-2xl bg-red-950/40 border border-red-600/40 flex items-center justify-center text-red-400 shadow-inner group-hover:scale-110 transition-transform">
                <UserPlus className="w-6 h-6" />
              </div>

              <div>
                <h3 className="text-lg font-bold text-white font-serif">Host a Game</h3>
                <p className="text-xs text-slate-400 mt-1 leading-relaxed">
                  Start a private room for your squad. You'll get an invite code and link to share with friends.
                </p>
              </div>

              <div className="pt-2 flex items-center gap-2 text-[11px] font-mono text-slate-300">
                <span className="px-2 py-1 rounded-lg bg-slate-900 border border-slate-800">
                  👥 2 to 8 Players
                </span>
                <span className="px-2 py-1 rounded-lg bg-slate-900 border border-slate-800">
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

          {/* ======================================================== */}
          {/* CARD 2: JOIN A GAME (EVIDENCE ACCESS TICKET)             */}
          {/* ======================================================== */}
          <div
            onMouseEnter={() => SoundService.playCardFlip()}
            className="game-card p-6 flex flex-col justify-between relative group border-slate-700/80 hover:border-amber-500/80"
          >
            {/* Top Gold Stamp Badge */}
            <div className="flex items-center justify-between mb-4 border-b border-slate-800/80 pb-3">
              <span className="text-[10px] font-mono tracking-widest text-amber-400 font-bold uppercase flex items-center gap-1.5">
                <span className="w-2 h-2 rounded-full bg-amber-400 shadow-[0_0_8px_rgba(251,191,36,0.8)]" />
                EVIDENCE PASS
              </span>
              <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-amber-950/60 text-amber-300 border border-amber-600/30">
                JOIN
              </span>
            </div>

            {/* Content & Inline Form */}
            <div className="space-y-3 flex-1">
              <div className="w-12 h-12 rounded-2xl bg-amber-950/40 border border-amber-600/40 flex items-center justify-center text-amber-400 shadow-inner group-hover:scale-110 transition-transform">
                <LogIn className="w-6 h-6" />
              </div>

              <div>
                <h3 className="text-lg font-bold text-white font-serif">Join a Game</h3>
                <p className="text-xs text-slate-400 mt-1 leading-relaxed">
                  Got a room code or link from a friend? Type or paste it here to enter the room.
                </p>
              </div>

              {/* Direct In-Card Room Code Form */}
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
                    className="w-full py-2.5 pl-3 pr-16 bg-slate-950 border border-slate-700/80 focus:border-amber-400 rounded-xl text-center text-base font-mono font-bold tracking-widest uppercase text-amber-300 outline-none transition-colors"
                  />
                  <button
                    type="button"
                    onClick={handlePasteCode}
                    className="absolute right-1.5 px-2.5 py-1 rounded-lg bg-slate-800 hover:bg-slate-700 text-[10px] font-mono font-bold text-slate-300 hover:text-white transition-colors border border-slate-600"
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

          {/* ======================================================== */}
          {/* CARD 3: DETECTIVE BADGE (POLAROID & IDENTITY)           */}
          {/* ======================================================== */}
          <div
            onMouseEnter={() => SoundService.playCardFlip()}
            className="game-card p-6 flex flex-col justify-between relative group border-slate-700/80 hover:border-sky-500/80"
          >
            {/* Top Badge Stamp */}
            <div className="flex items-center justify-between mb-4 border-b border-slate-800/80 pb-3">
              <span className="text-[10px] font-mono tracking-widest text-sky-400 font-bold uppercase flex items-center gap-1.5">
                <Shield className="w-3.5 h-3.5 text-sky-400" />
                DETECTIVE BADGE
              </span>
              <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-sky-950/60 text-sky-300 border border-sky-600/30">
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
                  className="p-1.5 rounded-full bg-slate-900 border border-slate-700 text-slate-400 hover:text-white hover:border-slate-500 transition-colors"
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
                  className="p-1.5 rounded-full bg-slate-900 border border-slate-700 text-slate-400 hover:text-white hover:border-slate-500 transition-colors"
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
                className="text-[10px] text-sky-400 hover:text-sky-300 font-mono underline"
              >
                Choose from gallery
              </button>

              {/* Inline Detective Name Input */}
              <form onSubmit={handleSaveBadge} id="badge-card-form" className="w-full pt-1 space-y-2">
                <div className="text-left">
                  <label className="block text-[10px] font-mono text-slate-400 uppercase tracking-wider mb-1">
                    Your Detective Name
                  </label>
                  <input
                    type="text"
                    maxLength={18}
                    value={nicknameInput}
                    onChange={(e) => setNicknameInput(e.target.value)}
                    placeholder="Enter name"
                    className="w-full py-2 px-3 bg-slate-950 border border-slate-700/80 focus:border-sky-400 rounded-xl text-sm font-semibold text-white outline-none transition-colors"
                  />
                </div>
              </form>
            </div>

            {/* 3D Action Button */}
            <div className="pt-6">
              <button
                type="submit"
                form="badge-card-form"
                className="w-full py-3.5 px-4 rounded-xl game-btn-dark text-slate-200 hover:text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer"
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

        {/* 5. TABLE ITEMS: CASE STORIES, FIELD RULES, HALL OF FAME */}
        <div className="w-full max-w-4xl mx-auto mt-10 pt-8 border-t border-slate-800/80">
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
              className="p-3.5 rounded-xl bg-slate-900/60 hover:bg-slate-900 border border-slate-800 hover:border-red-700/60 cursor-pointer transition-all flex items-center gap-3 group shadow"
            >
              <div className="w-9 h-9 rounded-lg bg-red-950/40 border border-red-800/40 flex items-center justify-center text-red-400 group-hover:scale-110 transition-transform">
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
              className="p-3.5 rounded-xl bg-slate-900/60 hover:bg-slate-900 border border-slate-800 hover:border-amber-700/60 cursor-pointer transition-all flex items-center gap-3 group shadow"
            >
              <div className="w-9 h-9 rounded-lg bg-amber-950/40 border border-amber-800/40 flex items-center justify-center text-amber-400 group-hover:scale-110 transition-transform">
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
              className="p-3.5 rounded-xl bg-slate-900/60 hover:bg-slate-900 border border-slate-800 hover:border-yellow-700/60 cursor-pointer transition-all flex items-center gap-3 group shadow"
            >
              <div className="w-9 h-9 rounded-lg bg-yellow-950/40 border border-yellow-800/40 flex items-center justify-center text-yellow-400 group-hover:scale-110 transition-transform">
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
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsRulesModalOpen(false);
              }}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
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
      {/* MODAL 2: CASE STORIES (MYSTERY ARCHIVES)                 */}
      {/* ======================================================== */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-2xl w-full p-6 shadow-2xl relative space-y-4 max-h-[85vh] overflow-y-auto">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsCasesModalOpen(false);
              }}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-red-400 uppercase tracking-widest font-bold">
                STORY FILES
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Mystery Cases</h3>
              <p className="text-xs text-slate-400">Cases available to solve when you host a game:</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 pt-2">
              <div className="p-4 bg-slate-900/90 border border-red-700/60 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-red-400 uppercase font-bold">Vault Heist</span>
                <h4 className="text-sm font-bold text-white font-serif">The Midnight Museum</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  The Eye of Osiris diamond vanished during an electrical blackout at midnight.
                </p>
                <div className="text-[10px] font-mono text-amber-400">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-slate-900/60 border border-slate-800 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-sky-400 uppercase font-bold">Train Mystery</span>
                <h4 className="text-sm font-bold text-white font-serif">The Grand Express</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  A locked luxury coach between Paris and Vienna with an encrypted missing ledger.
                </p>
                <div className="text-[10px] font-mono text-slate-400">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-slate-900/60 border border-slate-800 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-amber-400 uppercase font-bold">Gothic Manor</span>
                <h4 className="text-sm font-bold text-white font-serif">Blackwood Poisoning</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
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
                className="px-5 py-2.5 game-btn-red text-white font-bold rounded-xl text-xs uppercase tracking-wider"
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
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsLeaderboardModalOpen(false);
              }}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-yellow-400 uppercase tracking-widest font-bold">
                RANKINGS
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Top Detectives</h3>
              <p className="text-xs text-slate-400">Best scoring players across all solved cases:</p>
            </div>

            <div className="space-y-2 pt-2">
              {leaderboardList.map((det) => (
                <div
                  key={det.name}
                  className="flex items-center justify-between p-3 rounded-xl bg-slate-900/80 border border-slate-800 text-xs"
                >
                  <div className="flex items-center gap-3">
                    <span className="font-mono font-bold text-amber-400 text-sm">#{det.rank}</span>
                    <AvatarBadge avatar={det.avatar} size="sm" />
                    <span className="font-bold text-white">{det.name}</span>
                  </div>
                  <div className="flex items-center gap-3 font-mono">
                    <span className="text-slate-400 text-[11px]">{det.rate}</span>
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
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-md w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsAvatarPickerOpen(false);
              }}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Pick Your Icon</h3>
              <p className="text-xs text-slate-400">Choose any detective avatar for your badge:</p>
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
