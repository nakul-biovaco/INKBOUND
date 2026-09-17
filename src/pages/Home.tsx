import React, { useEffect, useState } from 'react';
import {
  UserPlus,
  LogIn,
  X,
  Loader2,
  ChevronLeft,
  ChevronRight,
  Folder,
  Trophy,
  Check,
  Shield,
  FileText,
  HelpCircle,
  AlertTriangle,
  Search,
  Users,
  Eye,
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
    <div className="relative min-h-screen w-full bg-[#07090e] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* 1. ATMOSPHERIC FULL-SCREEN NOIR DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center bg-no-repeat opacity-50 mix-blend-luminosity filter contrast-125 brightness-75 pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      {/* Overhead Lamp Lighting Cone Effect */}
      <div className="fixed inset-0 bg-gradient-radial from-amber-500/10 via-black/70 to-[#07090e] pointer-events-none" />
      <div className="fixed inset-0 bg-gradient-to-b from-black/80 via-transparent to-[#07090e] pointer-events-none" />

      {/* 2. TOP POLICE CRIME SCENE CAUTION TAPE */}
      <div className="relative z-30 w-full crime-scene-tape text-[10px] sm:text-xs py-1 px-4 text-center tracking-[0.25em] shadow-2xl flex items-center justify-center gap-3">
        <AlertTriangle className="w-3.5 h-3.5 text-black shrink-0" />
        <span>POLICE LINE</span>
        <span className="hidden sm:inline">•</span>
        <span className="hidden sm:inline">EVIDENCE ARCHIVE #8492</span>
        <span>•</span>
        <span>DO NOT CROSS</span>
        <span className="hidden sm:inline">•</span>
        <span className="hidden sm:inline">INVESTIGATION DIVISION</span>
        <AlertTriangle className="w-3.5 h-3.5 text-black shrink-0" />
      </div>

      {/* 3. HEADER NAV BAR */}
      <header className="relative z-30 w-full max-w-7xl mx-auto px-4 sm:px-8 py-3.5 flex items-center justify-end sm:justify-between">
        {/* Left: INKBOUND Official Logo (Hidden on mobile) */}
        <div className="hidden sm:flex items-center gap-3">
          <img
            src="/assets/logo.png"
            alt="INKBOUND"
            className="h-8 sm:h-9 object-contain filter drop-shadow-[0_4px_16px_rgba(220,38,38,0.7)]"
          />
          <div className="flex flex-col">
            <span className="text-[10px] font-mono tracking-widest text-red-400 font-bold uppercase">
              VISUAL DEDUCTION GAME
            </span>
            <span className="text-[9px] font-mono text-slate-400">CASE DIVISION // ACTIVE</span>
          </div>
        </div>

        {/* Right: Quick Table Evidence Buttons & Audio */}
        <div className="flex items-center gap-2 sm:gap-3">
          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsRulesModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900/90 hover:bg-slate-800 text-slate-200 hover:text-white border border-slate-700/80 backdrop-blur-xl text-xs font-mono transition-all shadow-md cursor-pointer"
          >
            <HelpCircle className="w-3.5 h-3.5 text-amber-400" />
            <span>Rules</span>
          </button>

          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsLeaderboardModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900/90 hover:bg-slate-800 text-slate-200 hover:text-white border border-slate-700/80 backdrop-blur-xl text-xs font-mono transition-all shadow-md cursor-pointer"
          >
            <Trophy className="w-3.5 h-3.5 text-yellow-400" />
            <span>Leaderboard</span>
          </button>

          <AudioControl />
        </div>
      </header>

      {/* 4. MAIN INVESTIGATION DESK */}
      <main className="relative z-20 flex-1 flex flex-col items-center justify-center px-3 sm:px-6 max-w-6xl mx-auto w-full pt-2 pb-10">
        {/* BIG NOIR LOGO & DRAMATIC CASE TAGLINE */}
        <div className="text-center mb-6 sm:mb-8 space-y-2">
          <div className="relative inline-block mb-1">
            <img
              src="/assets/logo.png"
              alt="INKBOUND"
              className="h-20 sm:h-28 md:h-32 object-contain filter drop-shadow-[0_20px_40px_rgba(220,38,38,0.5)] transform hover:scale-[1.01] transition-transform"
            />
          </div>

          <div className="flex items-center justify-center gap-3">
            <div className="h-[1px] w-12 sm:w-20 bg-gradient-to-r from-transparent to-red-600/80" />
            <span className="text-[11px] sm:text-xs font-mono uppercase tracking-[0.3em] text-red-400 font-bold">
              CASE ARCHIVE // INKBOUND
            </span>
            <div className="h-[1px] w-12 sm:w-20 bg-gradient-to-l from-transparent to-red-600/80" />
          </div>

          <p className="text-xs sm:text-sm text-slate-300 max-w-xl mx-auto font-light leading-relaxed">
            A drawing & guessing game with a mystery twist.
            <br className="hidden sm:inline" />
            <span className="text-amber-300 font-medium"> Sketch your secret clue, catch who is lying, and crack the case with friends!</span>
          </p>
        </div>

        {/* 5. THE THREE INVESTIGATION PROPS ON THE DESK */}
        <div className="w-full grid grid-cols-1 md:grid-cols-3 gap-6 sm:gap-6 items-stretch">
          {/* ======================================================== */}
          {/* PROP 1: MANILA CASE DOSSIER (HOST NEW CASE)              */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            {/* Ambient Bloom Flare */}
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-red-600/30 to-rose-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />

            {/* Folder Body */}
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="investigation-dossier p-6 flex-1 flex flex-col justify-between"
            >
              {/* Paperclip & Pushpin on folder edge */}
              <div className="pushpin-dot" />
              <div className="paperclip-clip" />

              {/* Stamped Header */}
              <div>
                <div className="flex items-center justify-between mb-4 border-b border-red-950/80 pb-3">
                  <div className="evidence-stamp-classified text-[10px]">
                    CONFIDENTIAL // CASE ROOM
                  </div>
                  <span className="px-2.5 py-0.5 rounded text-[9px] font-mono font-bold bg-red-950/80 text-red-300 border border-red-600/40">
                    HOST
                  </span>
                </div>

                {/* Content */}
                <div className="space-y-2">
                  <h3 className="text-lg font-bold text-white font-serif tracking-wide flex items-center gap-2">
                    <Folder className="w-5 h-5 text-red-400 shrink-0" />
                    <span>Host a Game</span>
                  </h3>
                  <p className="text-xs text-slate-300 leading-relaxed font-sans">
                    Start a private room with friends. Pick a mystery story, set round times, and begin drawing!
                  </p>

                  <div className="pt-3 flex flex-wrap items-center gap-2 text-[10px] font-mono text-slate-300">
                    <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded bg-black/60 border border-red-900/40 text-red-300 font-medium">
                      <Users className="w-3 h-3 text-red-400" />
                      <span>2–8 Players</span>
                    </span>
                    <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded bg-black/60 border border-amber-900/40 text-amber-300 font-medium">
                      <Eye className="w-3 h-3 text-amber-400" />
                      <span>Secret Imposter</span>
                    </span>
                  </div>
                </div>
              </div>

              {/* 3D Wax Seal Button */}
              <div className="pt-6">
                <button
                  onClick={() => {
                    SoundService.playStamp();
                    onCreateRoom();
                  }}
                  disabled={isCreating}
                  className="w-full py-3.5 px-4 rounded-xl game-btn-red text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed shadow-xl"
                >
                  {isCreating ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span>Creating Room...</span>
                    </>
                  ) : (
                    <>
                      <UserPlus className="w-4 h-4 text-white" />
                      <span>Create Room</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>

          {/* ======================================================== */}
          {/* PROP 2: POLICE DISPATCH TICKET (JOIN CASE)               */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            {/* Ambient Bloom Flare */}
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-amber-500/30 to-yellow-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />

            {/* Ticket Body */}
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="evidence-telegram p-6 flex-1 flex flex-col justify-between"
            >
              {/* Paperclip on ticket edge */}
              <div className="paperclip-clip" />

              <div>
                {/* Stamped Header */}
                <div className="flex items-center justify-between mb-4 border-b border-amber-950/80 pb-3">
                  <div className="evidence-stamp-confidential text-[10px]">
                    ROOM INVITE PASS
                  </div>
                  <span className="px-2.5 py-0.5 rounded text-[9px] font-mono font-bold bg-amber-950/80 text-amber-300 border border-amber-600/40">
                    JOIN
                  </span>
                </div>

                {/* Content & Inline Typewriter Input */}
                <div className="space-y-2">
                  <h3 className="text-lg font-bold text-white font-serif tracking-wide flex items-center gap-2">
                    <Search className="w-5 h-5 text-amber-400 shrink-0" />
                    <span>Join with Code</span>
                  </h3>
                  <p className="text-xs text-slate-300 leading-relaxed font-sans">
                    Got a 6-letter room code or link from a friend? Type or paste it below to enter the lobby.
                  </p>

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
                        className="w-full py-2.5 pl-3 pr-16 bg-black/80 border-2 border-amber-600/60 focus:border-amber-400 rounded-xl text-center text-base font-mono font-bold tracking-widest uppercase text-amber-300 outline-none shadow-inner"
                      />
                      <button
                        type="button"
                        onClick={handlePasteCode}
                        className="absolute right-1.5 px-2.5 py-1 rounded-lg bg-amber-950/80 hover:bg-amber-900 text-[10px] font-mono font-bold text-amber-200 border border-amber-500/50 cursor-pointer transition-colors"
                      >
                        PASTE
                      </button>
                    </div>

                    {cardErrorMsg && (
                      <p className="text-[11px] font-mono text-red-400 leading-tight">{cardErrorMsg}</p>
                    )}
                  </form>
                </div>
              </div>

              {/* 3D Gold Action Button */}
              <div className="pt-6">
                <button
                  type="submit"
                  form="join-card-form"
                  disabled={isJoining}
                  className="w-full py-3.5 px-4 rounded-xl game-btn-gold text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed shadow-xl"
                >
                  {isJoining ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span>Entering Room...</span>
                    </>
                  ) : (
                    <>
                      <LogIn className="w-4 h-4 text-white" />
                      <span>Enter Room</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>

          {/* ======================================================== */}
          {/* PROP 3: LEATHER DETECTIVE BADGE WALLET (YOUR ID)         */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            {/* Ambient Bloom Flare */}
            <div className="absolute -inset-1 rounded-[2rem] bg-gradient-to-r from-sky-500/30 to-cyan-600/10 blur-xl opacity-60 group-hover:opacity-100 transition-opacity -z-10 pointer-events-none" />

            {/* Wallet Body */}
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="detective-wallet p-6 flex-1 flex flex-col justify-between"
            >
              <div>
                {/* Badge Header with Metallic Shield */}
                <div className="flex items-center justify-between mb-4 border-b border-sky-950/80 pb-3">
                  <div className="flex items-center gap-2 text-sky-300 font-mono text-[10px] uppercase font-bold tracking-wider">
                    <Shield className="w-4 h-4 text-sky-400" />
                    <span>DETECTIVE BADGE</span>
                  </div>
                  <span className="px-2.5 py-0.5 rounded text-[9px] font-mono font-bold bg-sky-950/80 text-sky-300 border border-sky-600/40">
                    PROFILE
                  </span>
                </div>

                {/* Interactive Polaroid ID Badge Frame */}
                <div className="space-y-3 flex flex-col items-center text-center">
                  <div className="flex items-center gap-3 my-0.5">
                    <button
                      type="button"
                      onClick={() => handleCycleAvatar('prev')}
                      title="Previous Icon"
                      className="p-1.5 rounded-full bg-slate-900 border border-slate-700 text-slate-400 hover:text-white hover:border-slate-500 transition-colors cursor-pointer"
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
                      className="p-1.5 rounded-full bg-slate-900 border border-slate-700 text-slate-400 hover:text-white hover:border-slate-500 transition-colors cursor-pointer"
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
                    className="text-[10px] text-sky-400 hover:text-sky-300 font-mono underline cursor-pointer"
                  >
                    Change Badge Icon
                  </button>

                  {/* Inline Detective Name Input */}
                  <form onSubmit={handleSaveBadge} id="badge-card-form" className="w-full pt-1 space-y-1 text-left">
                    <label className="block text-[10px] font-mono text-slate-400 uppercase tracking-wider">
                      Your Nickname
                    </label>
                    <input
                      type="text"
                      maxLength={18}
                      value={nicknameInput}
                      onChange={(e) => setNicknameInput(e.target.value)}
                      placeholder="e.g. Sherlock"
                      className="w-full py-2 px-3 bg-black/80 border border-sky-600/50 focus:border-sky-400 rounded-xl text-sm font-semibold text-white outline-none"
                    />
                  </form>
                </div>
              </div>

              {/* 3D Dark Button */}
              <div className="pt-6">
                <button
                  type="submit"
                  form="badge-card-form"
                  className="w-full py-3.5 px-4 rounded-xl game-btn-dark text-slate-100 hover:text-white font-bold text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer shadow-xl"
                >
                  {badgeSavedFeedback ? (
                    <>
                      <Check className="w-4 h-4 text-emerald-400" />
                      <span className="text-emerald-300">Badge Saved!</span>
                    </>
                  ) : (
                    <>
                      <Shield className="w-4 h-4 text-sky-400" />
                      <span>Save Badge</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* 6. DESK EVIDENCE BOARD & FILING DRAWERS */}
        <div className="w-full max-w-4xl mx-auto mt-10 pt-6 border-t border-slate-800/80">
          <div className="flex items-center justify-between mb-4">
            <span className="text-[10px] font-mono uppercase tracking-[0.25em] text-slate-400 font-bold flex items-center gap-2">
              <span className="w-2 h-2 rounded-full bg-red-500 animate-pulse" />
              INVESTIGATION DESK FILES
            </span>
            <span className="text-[10px] font-mono text-slate-500 hidden sm:inline">
              CLICK TO INSPECT ARCHIVES
            </span>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            {/* FILE 1: CASE STORIES */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsCasesModalOpen(true);
              }}
              className="p-4 rounded-2xl bg-[#111622]/90 hover:bg-[#161d2d] border border-slate-700/80 hover:border-red-500/70 cursor-pointer transition-all flex items-center gap-3.5 group shadow-lg"
            >
              <div className="w-10 h-10 rounded-xl bg-red-950/60 border border-red-700/50 flex items-center justify-center text-red-400 group-hover:scale-110 transition-transform">
                <Folder className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-red-300 transition-colors font-serif">
                  Case Stories
                </div>
                <div className="text-[10px] text-slate-400 font-mono">3 mystery themes</div>
              </div>
            </div>

            {/* FILE 2: HOW TO PLAY */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsRulesModalOpen(true);
              }}
              className="p-4 rounded-2xl bg-[#111622]/90 hover:bg-[#161d2d] border border-slate-700/80 hover:border-amber-500/70 cursor-pointer transition-all flex items-center gap-3.5 group shadow-lg"
            >
              <div className="w-10 h-10 rounded-xl bg-amber-950/60 border border-amber-700/50 flex items-center justify-center text-amber-400 group-hover:scale-110 transition-transform">
                <FileText className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-amber-300 transition-colors font-serif">
                  How to Play
                </div>
                <div className="text-[10px] text-slate-400 font-mono">Simple 4-step rules</div>
              </div>
            </div>

            {/* FILE 3: TOP DETECTIVES */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsLeaderboardModalOpen(true);
              }}
              className="p-4 rounded-2xl bg-[#111622]/90 hover:bg-[#161d2d] border border-slate-700/80 hover:border-yellow-500/70 cursor-pointer transition-all flex items-center gap-3.5 group shadow-lg"
            >
              <div className="w-10 h-10 rounded-xl bg-yellow-950/60 border border-yellow-700/50 flex items-center justify-center text-yellow-400 group-hover:scale-110 transition-transform">
                <Trophy className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-bold text-white group-hover:text-yellow-300 transition-colors font-serif">
                  Top Detectives
                </div>
                <div className="text-[10px] text-slate-400 font-mono">Best case solvers</div>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* 7. BOTTOM DESK FOOTER */}
      <footer className="relative z-20 w-full max-w-7xl mx-auto px-6 py-3.5 flex flex-col sm:flex-row items-center justify-between text-xs text-slate-500 font-mono gap-2 border-t border-slate-800/80">
        <div className="flex items-center gap-2">
          <span className="font-bold text-slate-400 font-serif">INKBOUND</span>
          <span>• Bureau of Visual Investigation</span>
        </div>
        <div className="text-slate-400 text-[11px] italic">
          "Observe the lines. Connect the clues. Question everyone."
        </div>
      </footer>

      {/* ======================================================== */}
      {/* MODAL 1: HOW TO PLAY FIELD MANUAL                        */}
      {/* ======================================================== */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/80 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#111622] border-2 border-slate-700 rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsRulesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-slate-800 hover:bg-slate-700 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-amber-400 uppercase tracking-widest font-bold">
                FORENSIC MANUAL // RULES
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">How to Play INKBOUND</h3>
              <p className="text-xs text-slate-400">4 essential rules for every detective on the case:</p>
            </div>

            <div className="space-y-3 pt-2 text-xs">
              <div className="p-3.5 bg-slate-900/90 border border-slate-800 rounded-2xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-red-950 border border-red-500 text-red-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  1
                </span>
                <div>
                  <div className="font-bold text-white font-serif">Draw Your Confidential Clue</div>
                  <div className="text-slate-300 text-[11px] mt-0.5">
                    When it's your turn, you receive a secret piece of the crime story. Sketch it on the canvas before the timer runs out!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-slate-900/90 border border-slate-800 rounded-2xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-amber-950 border border-amber-500 text-amber-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  2
                </span>
                <div>
                  <div className="font-bold text-white font-serif">Guess What's Being Sketched</div>
                  <div className="text-slate-300 text-[11px] mt-0.5">
                    Detectives type answers in the chat. Match the clue's key words to earn investigation points!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-slate-900/90 border border-slate-800 rounded-2xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-sky-950 border border-sky-500 text-sky-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  3
                </span>
                <div>
                  <div className="font-bold text-white font-serif">Identify the Secret Imposter</div>
                  <div className="text-slate-300 text-[11px] mt-0.5">
                    One player receives a fake clue and attempts to distort the timeline without getting discovered!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-slate-900/90 border border-slate-800 rounded-2xl flex items-start gap-3">
                <span className="w-6 h-6 rounded-full bg-emerald-950 border border-emerald-500 text-emerald-300 font-mono font-bold flex items-center justify-center flex-shrink-0 text-xs">
                  4
                </span>
                <div>
                  <div className="font-bold text-white font-serif">Deliver the Accusation</div>
                  <div className="text-slate-300 text-[11px] mt-0.5">
                    Put the sketches in timeline order, vote for the culprit, and reveal the truth for victory points!
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* MODAL 2: CASE STORIES (DEEPER CLUES)                     */}
      {/* ======================================================== */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/80 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#111622] border-2 border-slate-700 rounded-3xl max-w-2xl w-full p-6 sm:p-8 shadow-2xl relative space-y-4 max-h-[85vh] overflow-y-auto">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsCasesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-slate-800 hover:bg-slate-700 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-red-400 uppercase tracking-widest font-bold">
                BUREAU FILES // CASES
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Unsolved Crime Cases</h3>
              <p className="text-xs text-slate-400">Cases available to solve when you host a game room:</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 pt-2">
              <div className="p-4 bg-slate-900/90 border border-red-700/60 rounded-2xl space-y-2">
                <span className="text-[10px] font-mono text-red-400 uppercase font-bold">Vault Heist</span>
                <h4 className="text-sm font-bold text-white font-serif">The Midnight Museum</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  The Eye of Osiris diamond was stolen at 11:44 PM during a planned blackout in the museum vault.
                </p>
                <div className="text-[10px] font-mono text-amber-300">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-slate-900/90 border border-sky-700/60 rounded-2xl space-y-2">
                <span className="text-[10px] font-mono text-sky-400 uppercase font-bold">Orient Express</span>
                <h4 className="text-sm font-bold text-white font-serif">The Grand Express</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  A locked luxury coach between Paris and Vienna holding a vanished cryptographic ledger.
                </p>
                <div className="text-[10px] font-mono text-slate-400">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-slate-900/90 border border-amber-700/60 rounded-2xl space-y-2">
                <span className="text-[10px] font-mono text-amber-400 uppercase font-bold">Gothic Manor</span>
                <h4 className="text-sm font-bold text-white font-serif">Blackwood Poisoning</h4>
                <p className="text-[11px] text-slate-300 leading-relaxed">
                  Lord Blackwood was found unconscious beside an uncorked vintage decanter in the great dining hall.
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
      {/* MODAL 3: TOP DETECTIVES HONOR ROLL                      */}
      {/* ======================================================== */}
      {isLeaderboardModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/80 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#111622] border-2 border-slate-700 rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsLeaderboardModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-slate-800 hover:bg-slate-700 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="text-[10px] font-mono text-yellow-400 uppercase tracking-widest font-bold">
                FORENSIC SQUAD // RANKINGS
              </span>
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Detective Honor Roll</h3>
              <p className="text-xs text-slate-400">Top-rated investigators across all solved crime scenes:</p>
            </div>

            <div className="space-y-2 pt-2">
              {leaderboardList.map((det) => (
                <div
                  key={det.name}
                  className="flex items-center justify-between p-3 rounded-2xl bg-slate-900/90 border border-slate-800 text-xs"
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
      {/* MODAL 4: AVATAR PICKER                                   */}
      {/* ======================================================== */}
      {isAvatarPickerOpen && (
        <div className="fixed inset-0 z-50 bg-black/80 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div className="bg-[#111622] border-2 border-slate-700 rounded-3xl max-w-md w-full p-6 sm:p-8 shadow-2xl relative space-y-4">
            <button
              onClick={() => {
                SoundService.playClick();
                setIsAvatarPickerOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-full bg-slate-800 hover:bg-slate-700 text-slate-300 hover:text-white flex items-center justify-center transition-colors cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Select Badge Icon</h3>
              <p className="text-xs text-slate-400">Choose your detective badge insignia:</p>
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
