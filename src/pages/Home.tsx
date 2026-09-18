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
  Radio,
  Zap,
  Play,
} from 'lucide-react';
import { Player } from '../types/player';
import { AuthService } from '../services/authService';
import { AvatarBadge, AvatarPicker, AvatarId } from '../components/common/AvatarBadge';
import { decodeInviteCode } from '../utils/inviteCrypto';
import { AudioControl } from '../components/common/AudioControl';
import { SoundService } from '../services/soundService';
import { BackendClient } from '../realtime/backendClient';

interface HomeProps {
  currentUser: Player;
  onUpdateProfile: (updated: Player) => void;
  onCreateRoom: () => void;
  onJoinRoom: (code: string) => void;
  onQuickPlay?: (genrePreference?: string) => void;
  isCreating?: boolean;
  isJoining?: boolean;
  isQuickPlaying?: boolean;
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
  onQuickPlay,
  isCreating = false,
  isJoining = false,
  isQuickPlaying = false,
}) => {
  const [isCasesModalOpen, setIsCasesModalOpen] = useState(false);
  const [isLeaderboardModalOpen, setIsLeaderboardModalOpen] = useState(false);
  const [isRulesModalOpen, setIsRulesModalOpen] = useState(false);
  const [isAboutModalOpen, setIsAboutModalOpen] = useState(false);
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

  const [selectedGenre, setSelectedGenre] = useState('all');
  const [onlineStats, setOnlineStats] = useState<{ activeRooms: number; onlineDetectives: number }>({
    activeRooms: 1,
    onlineDetectives: 1,
  });

  useEffect(() => {
    AuthService.getLeaderboard().then(setLeaderboardList);
  }, []);

  useEffect(() => {
    let isMounted = true;
    const updateStats = async () => {
      try {
        const stats = await BackendClient.getInstance().getOnlineStats();
        if (isMounted && stats) {
          setOnlineStats(stats);
        }
      } catch {
        // ignore
      }
    };
    updateStats();
    const interval = setInterval(updateStats, 8000);
    return () => {
      isMounted = false;
      clearInterval(interval);
    };
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

      {/* 2.1 HANGING SKELETON SUSPENDED FROM TOP CAUTION TAPE */}
      <div className="absolute top-[14px] sm:top-[16px] right-3 sm:right-6 md:right-10 lg:right-16 z-20 pointer-events-none select-none">
        <div className="hanging-skeleton-wrap">
          <div
            className="hanging-skeleton-body pointer-events-auto cursor-pointer group"
            onClick={() => SoundService.playBoneRattle()}
            title="Evidence #8492: Hanging Remains (Click to rattle)"
          >
            <img
              src="/assets/skeleton.png"
              alt="Hanging Crime Scene Skeleton"
              className="w-24 sm:w-32 md:w-44 lg:w-52 h-auto object-contain filter drop-shadow-[0_20px_40px_rgba(0,0,0,0.95)] transform group-hover:scale-105 transition-transform"
            />
          </div>
        </div>
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
              MYSTERY PARTY GAME
            </span>
            <span className="text-[9px] font-mono text-slate-400">ONLINE • READY TO PLAY</span>
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

          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsAboutModalOpen(true);
            }}
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900/90 hover:bg-slate-800 text-slate-200 hover:text-white border border-slate-700/80 backdrop-blur-xl text-xs font-mono transition-all shadow-md cursor-pointer"
          >
            <Shield className="w-3.5 h-3.5 text-red-400" />
            <span>About</span>
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

          <p className="text-xs sm:text-sm text-slate-300 max-w-md mx-auto leading-relaxed font-sans">
            Draw secret clues, spot the liar, and solve the mystery together.
          </p>
        </div>

        {/* ======================================================== */}
        {/* QUICK MATCH DISPATCH DOCKET (VINTAGE PHYSICAL PARCHMENT) */}
        {/* ======================================================== */}
        <div className="w-full mb-8 relative select-none">
          <div
            className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-5 sm:p-6 shadow-[0_15px_45px_rgba(0,0,0,0.6),inset_0_0_50px_rgba(139,94,60,0.15)] overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Corner Decorative Accents */}
            <div className="absolute top-1.5 left-1.5 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 left-1.5 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 right-1.5 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Vintage Brass Paperclip Accent */}
            <div className="absolute -top-1.5 left-8 w-3.5 h-7 rounded-full border-2 border-[#8c6d48] -rotate-6 shadow-xs opacity-80 pointer-events-none bg-[#d8c3aa]/40" />

            <div className="relative z-10 flex flex-col md:flex-row items-center justify-between gap-5 sm:gap-6">
              {/* Left Column: Humanized Title & Genre Tabs */}
              <div className="space-y-2.5 text-center md:text-left flex-1 min-w-0">
                <div className="flex flex-wrap items-center justify-center md:justify-start gap-2">
                  <span className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded text-[10px] font-mono font-black tracking-widest uppercase bg-red-800 text-white shadow-xs -rotate-1">
                    ★ QUICK MATCH
                  </span>

                  <span className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded text-[10px] font-mono font-bold bg-[#ede0ce] text-[#543b27] border border-[#b89e7c]">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-600 animate-pulse" />
                    <span>{onlineStats.onlineDetectives} online</span>
                    <span className="text-[#8c6d48]">•</span>
                    <span>{onlineStats.activeRooms} public games</span>
                  </span>
                </div>

                <div className="space-y-1">
                  <h2 className="text-2xl sm:text-3xl font-black text-[#1a110a] font-serif tracking-tight flex items-center justify-center md:justify-start gap-2.5">
                    <Zap className="w-5 h-5 sm:w-6 sm:h-6 text-red-800 shrink-0" />
                    <span>Jump into a Game</span>
                  </h2>
                  <p className="text-xs sm:text-sm text-[#5c422e] font-serif max-w-lg leading-relaxed">
                    No code needed. Join an active game with other detectives right away.
                  </p>
                </div>

                {/* Case Theme Filter as Vintage Tabs */}
                <div className="pt-1 flex flex-wrap items-center justify-center md:justify-start gap-1.5 text-[11px] font-mono">
                  <span className="text-[#7a5839] text-[10px] uppercase tracking-wider font-bold mr-1">Theme:</span>
                  {[
                    { id: 'all', label: 'Any Theme' },
                    { id: 'noir', label: 'Classic Noir' },
                    { id: 'cyberpunk', label: 'Cyberpunk' },
                    { id: 'manor', label: 'Gothic Manor' },
                    { id: 'heist', label: 'Museum Heist' },
                  ].map((genre) => (
                    <button
                      key={genre.id}
                      type="button"
                      onClick={() => {
                        SoundService.playBadgeClick();
                        setSelectedGenre(genre.id);
                      }}
                      className={`px-2.5 py-1 rounded-lg border text-xs font-mono transition-all cursor-pointer ${
                        selectedGenre === genre.id
                          ? 'bg-red-800 text-white border-red-900 font-bold shadow-xs scale-102'
                          : 'bg-[#ede0ce] border-[#b89e7c] text-[#543b27] hover:bg-[#fffdf9] hover:border-[#8c6d48]'
                      }`}
                    >
                      {genre.label}
                    </button>
                  ))}
                </div>
              </div>

              {/* Right Column: Physical Paper Action Button */}
              <div className="flex flex-col items-center shrink-0 w-full sm:w-auto">
                <button
                  type="button"
                  disabled={isQuickPlaying}
                  onClick={() => {
                    SoundService.playStamp();
                    onQuickPlay?.(selectedGenre);
                  }}
                  className="w-full sm:w-64 py-3.5 px-6 rounded-xl bg-red-800 hover:bg-red-700 active:bg-red-900 text-white font-serif font-black text-base sm:text-lg tracking-wider uppercase flex items-center justify-center gap-2.5 cursor-pointer shadow-lg transition-all border border-red-950 disabled:opacity-60 disabled:cursor-not-allowed group/btn"
                >
                  {isQuickPlaying ? (
                    <>
                      <Loader2 className="w-5 h-5 animate-spin text-white" />
                      <span className="font-mono text-sm">Finding Game...</span>
                    </>
                  ) : (
                    <>
                      <Play className="w-5 h-5 text-white fill-white group-hover/btn:scale-110 transition-transform" />
                      <span>Play Now</span>
                    </>
                  )}
                </button>
                <span className="mt-1.5 text-[10px] font-mono text-[#7a5839]">
                  Instant match • 2–8 players
                </span>
              </div>
            </div>
          </div>
        </div>

        {/* 5. THE THREE INVESTIGATION PROPS ON THE DESK */}
        <div className="w-full grid grid-cols-1 md:grid-cols-3 gap-5 sm:gap-6 items-stretch select-none">
          {/* ======================================================== */}
          {/* PROP 1: MANILA CASE DOSSIER (HOST A GAME)                 */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-5 sm:p-6 shadow-[0_15px_45px_rgba(0,0,0,0.6),inset_0_0_50px_rgba(139,94,60,0.15)] flex-1 flex flex-col justify-between overflow-hidden transition-all duration-300 hover:-translate-y-1 hover:shadow-2xl"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Corner Accents */}
              <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              {/* Brass Paperclip */}
              <div className="absolute -top-1.5 left-8 w-3 h-6 rounded-full border-2 border-[#8c6d48] -rotate-6 shadow-xs opacity-80 pointer-events-none bg-[#d8c3aa]/40" />

              <div>
                {/* Header Stamped Label */}
                <div className="flex items-center justify-between mb-3.5 border-b border-[#bfa98e]/70 pb-2.5">
                  <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase tracking-widest -rotate-1 shadow-xs">
                    ★ PRIVATE DOSSIER
                  </span>
                  <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-[#ede0ce] text-[#543b27] border border-[#b89e7c]">
                    HOST
                  </span>
                </div>

                {/* Content */}
                <div className="space-y-2 text-left">
                  <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-tight flex items-center gap-2">
                    <Folder className="w-5 h-5 text-red-800 shrink-0" />
                    <span>Host a Game</span>
                  </h3>
                  <p className="text-xs text-[#5c422e] leading-relaxed font-serif">
                    Start a private room for your squad. Pick a mystery case, set round timer, and invite friends.
                  </p>

                  <div className="pt-2 flex flex-wrap items-center gap-2 text-[10px] font-mono">
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded bg-[#ede0ce] border border-[#b89e7c] text-[#543b27] font-bold">
                      <Users className="w-3 h-3 text-red-800" />
                      <span>2–8 Players</span>
                    </span>
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded bg-[#ede0ce] border border-[#b89e7c] text-[#543b27] font-bold">
                      <Eye className="w-3 h-3 text-amber-700" />
                      <span>Secret Imposter</span>
                    </span>
                  </div>
                </div>
              </div>

              {/* Physical Red Stamp Action Button */}
              <div className="pt-5">
                <button
                  type="button"
                  onClick={() => {
                    SoundService.playStamp();
                    onCreateRoom();
                  }}
                  disabled={isCreating}
                  className="w-full py-3 px-4 rounded-xl bg-red-800 hover:bg-red-700 active:bg-red-900 text-white font-serif font-black text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed shadow-md transition-all border border-red-950"
                >
                  {isCreating ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span className="font-mono">Creating Case...</span>
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
          {/* PROP 2: TELEGRAPH DISPATCH (JOIN WITH CODE)               */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-5 sm:p-6 shadow-[0_15px_45px_rgba(0,0,0,0.6),inset_0_0_50px_rgba(139,94,60,0.15)] flex-1 flex flex-col justify-between overflow-hidden transition-all duration-300 hover:-translate-y-1 hover:shadow-2xl"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Corner Accents */}
              <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              {/* Brass Paperclip */}
              <div className="absolute -top-1.5 left-8 w-3 h-6 rounded-full border-2 border-[#8c6d48] -rotate-6 shadow-xs opacity-80 pointer-events-none bg-[#d8c3aa]/40" />

              <div>
                {/* Header Stamped Label */}
                <div className="flex items-center justify-between mb-3.5 border-b border-[#bfa98e]/70 pb-2.5">
                  <span className="px-2 py-0.5 rounded border border-amber-800 bg-amber-100 text-amber-900 font-mono text-[9px] font-black uppercase tracking-widest -rotate-1 shadow-xs">
                    ★ TELEGRAPH PASS
                  </span>
                  <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-[#ede0ce] text-[#543b27] border border-[#b89e7c]">
                    JOIN
                  </span>
                </div>

                {/* Content */}
                <div className="space-y-2 text-left">
                  <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-tight flex items-center gap-2">
                    <Search className="w-5 h-5 text-[#8c6d48] shrink-0" />
                    <span>Join with Code</span>
                  </h3>
                  <p className="text-xs text-[#5c422e] leading-relaxed font-serif">
                    Got a room code or invite link from a friend? Enter it below to join the case.
                  </p>

                  <form onSubmit={handleJoinSubmit} id="join-card-form" className="pt-1.5 space-y-1.5">
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
                        className="w-full py-2.5 pl-3 pr-16 bg-[#fffdf9] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-center text-sm font-mono font-black tracking-widest uppercase text-[#1a110a] outline-none shadow-inner placeholder:text-[#a89078] placeholder:font-normal"
                      />
                      <button
                        type="button"
                        onClick={handlePasteCode}
                        className="absolute right-1.5 px-2.5 py-1 rounded-lg bg-[#ede0ce] hover:bg-[#ded0bc] text-[10px] font-mono font-bold text-[#443020] border border-[#b89e7c] cursor-pointer transition-colors"
                      >
                        PASTE
                      </button>
                    </div>

                    {cardErrorMsg && (
                      <p className="text-[11px] font-mono text-red-700 leading-tight font-bold">{cardErrorMsg}</p>
                    )}
                  </form>
                </div>
              </div>

              {/* Physical Amber Action Button */}
              <div className="pt-5">
                <button
                  type="submit"
                  form="join-card-form"
                  disabled={isJoining}
                  className="w-full py-3 px-4 rounded-xl bg-[#8c6d48] hover:bg-[#7a5e3d] active:bg-[#684f33] text-white font-serif font-black text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed shadow-md transition-all border border-[#5c422e]"
                >
                  {isJoining ? (
                    <>
                      <Loader2 className="w-4 h-4 text-white animate-spin" />
                      <span className="font-mono">Entering...</span>
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
          {/* PROP 3: DETECTIVE IDENTITY (YOUR BADGE & NAME)            */}
          {/* ======================================================== */}
          <div className="relative group flex flex-col">
            <div
              onMouseEnter={() => SoundService.playCardFlip()}
              className="relative text-[#221711] border-3 border-[#8c6d48] rounded-2xl p-5 sm:p-6 shadow-[0_15px_45px_rgba(0,0,0,0.6),inset_0_0_50px_rgba(139,94,60,0.15)] flex-1 flex flex-col justify-between overflow-hidden transition-all duration-300 hover:-translate-y-1 hover:shadow-2xl"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Corner Accents */}
              <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              {/* Brass Paperclip */}
              <div className="absolute -top-1.5 left-8 w-3 h-6 rounded-full border-2 border-[#8c6d48] -rotate-6 shadow-xs opacity-80 pointer-events-none bg-[#d8c3aa]/40" />

              <div>
                {/* Header Stamped Label */}
                <div className="flex items-center justify-between mb-3.5 border-b border-[#bfa98e]/70 pb-2.5">
                  <span className="px-2 py-0.5 rounded border border-[#5c4028] bg-[#ede0ce] text-[#443020] font-mono text-[9px] font-black uppercase tracking-widest -rotate-1 shadow-xs">
                    ★ IDENTIFICATION
                  </span>
                  <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-[#ede0ce] text-[#543b27] border border-[#b89e7c]">
                    PROFILE
                  </span>
                </div>

                {/* Content */}
                <div className="space-y-2.5 flex flex-col items-center text-center">
                  <div className="flex items-center gap-3 my-0.5">
                    <button
                      type="button"
                      onClick={() => handleCycleAvatar('prev')}
                      title="Previous Icon"
                      className="w-8 h-8 rounded-full bg-[#ede0ce] border border-[#b89e7c] text-[#543b27] hover:bg-[#fffdf9] flex items-center justify-center shadow-xs transition-colors cursor-pointer"
                    >
                      <ChevronLeft className="w-4 h-4" />
                    </button>

                    <div
                      onClick={() => {
                        SoundService.playClick();
                        setIsAvatarPickerOpen(true);
                      }}
                      className="cursor-pointer transform hover:scale-105 transition-transform p-1 rounded-xl bg-[#ede0ce]/60 border border-[#b89e7c] shadow-xs"
                      title="Click to view all icons"
                    >
                      <AvatarBadge avatar={selectedAvatar} size="lg" />
                    </div>

                    <button
                      type="button"
                      onClick={() => handleCycleAvatar('next')}
                      title="Next Icon"
                      className="w-8 h-8 rounded-full bg-[#ede0ce] border border-[#b89e7c] text-[#543b27] hover:bg-[#fffdf9] flex items-center justify-center shadow-xs transition-colors cursor-pointer"
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
                    className="text-[10px] text-[#7a5839] hover:text-[#1a110a] font-mono underline cursor-pointer"
                  >
                    Change Badge Icon
                  </button>

                  {/* Inline Detective Name Input */}
                  <form onSubmit={handleSaveBadge} id="badge-card-form" className="w-full pt-1 space-y-1 text-left">
                    <label className="block text-[10px] font-mono text-[#7a5839] uppercase tracking-wider font-bold">
                      Your Nickname
                    </label>
                    <input
                      type="text"
                      maxLength={18}
                      value={nicknameInput}
                      onChange={(e) => setNicknameInput(e.target.value)}
                      placeholder="e.g. Sherlock"
                      className="w-full py-2 px-3 bg-[#fffdf9] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-sm font-bold font-serif text-[#1a110a] outline-none shadow-inner"
                    />
                  </form>
                </div>
              </div>

              {/* Physical Dark Leather Action Button */}
              <div className="pt-5">
                <button
                  type="submit"
                  form="badge-card-form"
                  className="w-full py-3 px-4 rounded-xl bg-[#3e2b1b] hover:bg-[#2e2014] active:bg-[#1f150d] text-white font-serif font-black text-xs uppercase tracking-wider flex items-center justify-center gap-2 cursor-pointer shadow-md transition-all border border-[#221711]"
                >
                  {badgeSavedFeedback ? (
                    <>
                      <Check className="w-4 h-4 text-emerald-400" />
                      <span>Identity Saved!</span>
                    </>
                  ) : (
                    <>
                      <Shield className="w-4 h-4 text-amber-200" />
                      <span>Save Identity</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* 6. DESK EVIDENCE BOARD & FILING DRAWERS */}
        <div className="w-full max-w-4xl mx-auto mt-10 pt-6 border-t border-[#8c6d48]/40">
          <div className="flex items-center justify-between mb-4">
            <span className="text-[10px] font-mono uppercase tracking-[0.25em] text-amber-200 font-bold flex items-center gap-2">
              <span className="w-2 h-2 rounded-full bg-red-600 animate-pulse" />
              CLASSIFIED INVESTIGATION ARCHIVES
            </span>
            <span className="text-[10px] font-mono text-stone-400 hidden sm:inline">
              CLICK DOSSIER TO INSPECT RECORDS
            </span>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            {/* FILE 1: CASE STORIES */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsCasesModalOpen(true);
              }}
              className="relative p-4 rounded-2xl border-2 border-[#8c6d48] hover:border-red-800 cursor-pointer transition-all flex items-center gap-3.5 group shadow-md hover:shadow-xl hover:-translate-y-1 text-[#221711] select-none overflow-hidden"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              <div className="absolute top-1 left-1 w-2.5 h-2.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1 right-1 w-2.5 h-2.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="w-10 h-10 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-red-800 group-hover:scale-110 transition-transform shadow-inner shrink-0">
                <Folder className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-black text-[#1a110a] group-hover:text-red-900 transition-colors font-serif">
                  Case Stories
                </div>
                <div className="text-[10px] text-[#5c4028] font-mono font-bold">3 mystery themes</div>
              </div>
            </div>

            {/* FILE 2: HOW TO PLAY */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsRulesModalOpen(true);
              }}
              className="relative p-4 rounded-2xl border-2 border-[#8c6d48] hover:border-red-800 cursor-pointer transition-all flex items-center gap-3.5 group shadow-md hover:shadow-xl hover:-translate-y-1 text-[#221711] select-none overflow-hidden"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              <div className="absolute top-1 left-1 w-2.5 h-2.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1 right-1 w-2.5 h-2.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="w-10 h-10 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-[#7a5839] group-hover:scale-110 transition-transform shadow-inner shrink-0">
                <FileText className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-black text-[#1a110a] group-hover:text-red-900 transition-colors font-serif">
                  How to Play
                </div>
                <div className="text-[10px] text-[#5c4028] font-mono font-bold">Simple 4-step rules</div>
              </div>
            </div>

            {/* FILE 3: TOP DETECTIVES */}
            <div
              onClick={() => {
                SoundService.playCardFlip();
                setIsLeaderboardModalOpen(true);
              }}
              className="relative p-4 rounded-2xl border-2 border-[#8c6d48] hover:border-red-800 cursor-pointer transition-all flex items-center gap-3.5 group shadow-md hover:shadow-xl hover:-translate-y-1 text-[#221711] select-none overflow-hidden"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              <div className="absolute top-1 left-1 w-2.5 h-2.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1 right-1 w-2.5 h-2.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="w-10 h-10 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-amber-700 group-hover:scale-110 transition-transform shadow-inner shrink-0">
                <Trophy className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs font-black text-[#1a110a] group-hover:text-red-900 transition-colors font-serif">
                  Top Detectives
                </div>
                <div className="text-[10px] text-[#5c4028] font-mono font-bold">Best case solvers</div>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* 7. BOTTOM DESK FOOTER */}
      <footer className="relative z-20 w-full max-w-6xl mx-auto px-4 sm:px-6 py-4 flex flex-col sm:flex-row items-center justify-between text-xs font-mono gap-3 border-t border-[#8c6d48]/40">
        <div className="flex items-center gap-2 text-slate-300">
          <span className="font-bold text-amber-200 font-serif">INKBOUND</span>
          <span className="text-slate-500">•</span>
          <span className="font-semibold text-slate-200">Game developed by Nakul Mundhada</span>
          <span className="hidden md:inline px-1.5 py-0.5 rounded bg-amber-950/60 text-amber-300 border border-amber-800/60 text-[10px]">
            v1.0
          </span>
        </div>
        <div className="flex items-center gap-4 text-[11px] text-slate-400">
          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsRulesModalOpen(true);
            }}
            className="hover:text-amber-200 transition-colors cursor-pointer"
          >
            Rules
          </button>
          <span>•</span>
          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsAboutModalOpen(true);
            }}
            className="hover:text-amber-200 transition-colors cursor-pointer text-amber-300 font-semibold"
          >
            About Game
          </button>
          <span>•</span>
          <button
            onClick={() => {
              SoundService.playCardFlip();
              setIsLeaderboardModalOpen(true);
            }}
            className="hover:text-amber-200 transition-colors cursor-pointer"
          >
            Leaderboard
          </button>
        </div>
      </footer>

      {/* ======================================================== */}
      {/* MODAL 1: HOW TO PLAY FIELD MANUAL                        */}
      {/* ======================================================== */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => {
                SoundService.playClick();
                setIsRulesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                DETECTIVE HANDBOOK // RULES
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">How to Play INKBOUND</h3>
              <p className="text-xs text-[#5c4028] font-mono">4 simple steps to play and solve mysteries with your friends:</p>
            </div>

            <div className="space-y-3 pt-2 text-xs">
              <div className="p-3.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-red-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  1
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Sketch Your Secret Clue</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    When it is your turn, you receive a secret piece of the crime story. Sketch it on the canvas before time runs out!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-amber-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  2
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Guess What Is Being Drawn</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    Detectives type answers in the live telegraph chat. Match 2 key words to score points for both you and the artist!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-[#7a5839] text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  3
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Spot the Secret Imposter</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    One detective was fed a fabricated clue. Spot contradictions in their sketch before they fool the squad!
                  </div>
                </div>
              </div>

              <div className="p-3.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-emerald-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  4
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Vote, Accuse & Solve the Mystery</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    Assemble the chronological timeline, accuse the culprit, and reveal the truth for maximum case merits!
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ABOUT INKBOUND MODAL */}
      {isAboutModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => {
                SoundService.playClick();
                setIsAboutModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                PRODUCT DOSSIER // ABOUT
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">INKBOUND</h3>
              <p className="text-xs text-[#5c4028] font-mono">Visual Mystery Deduction Party Game</p>
            </div>

            <div className="p-3.5 bg-[#fdfbf6] border-2 border-red-800/60 rounded-2xl space-y-2 shadow-sm">
              <div className="flex items-center gap-2">
                <span className="px-2 py-0.5 rounded bg-red-800 text-white font-mono font-bold text-[10px]">
                  CREATOR
                </span>
                <span className="text-sm font-black font-serif text-[#1a110a]">
                  Game developed by Nakul Mundhada
                </span>
              </div>
              <p className="text-xs text-[#5c4028] font-mono leading-relaxed">
                INKBOUND combines the joy of fast sketching games like Pictionary with deep social deduction and detective storytelling.
              </p>
            </div>

            <div className="grid grid-cols-2 gap-2.5 pt-1 text-xs font-mono">
              <div className="p-2.5 bg-[#ede0ce]/60 border border-[#bfa98e] rounded-xl">
                <div className="text-[10px] text-[#7a5839] font-bold uppercase">VERSION</div>
                <div className="text-xs font-bold text-[#1a110a] mt-0.5">v1.0 Production</div>
              </div>
              <div className="p-2.5 bg-[#ede0ce]/60 border border-[#bfa98e] rounded-xl">
                <div className="text-[10px] text-[#7a5839] font-bold uppercase">MYSTERY CASES</div>
                <div className="text-xs font-bold text-[#1a110a] mt-0.5">120 Complete Stories</div>
              </div>
              <div className="p-2.5 bg-[#ede0ce]/60 border border-[#bfa98e] rounded-xl">
                <div className="text-[10px] text-[#7a5839] font-bold uppercase">SQUAD SIZE</div>
                <div className="text-xs font-bold text-[#1a110a] mt-0.5">2 – 8 Detectives</div>
              </div>
              <div className="p-2.5 bg-[#ede0ce]/60 border border-[#bfa98e] rounded-xl">
                <div className="text-[10px] text-[#7a5839] font-bold uppercase">ENGINE</div>
                <div className="text-xs font-bold text-[#1a110a] mt-0.5">Realtime WebSockets</div>
              </div>
            </div>

            <div className="text-center pt-2 text-[11px] text-[#7a5839] font-mono">
              ★ Craft your case • Catch the imposter • Share the victory ★
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* MODAL 2: CASE STORIES (DEEPER CLUES)                     */}
      {/* ======================================================== */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-2xl w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 max-h-[85vh] overflow-y-auto text-[#221711] select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => {
                SoundService.playClick();
                setIsCasesModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                BUREAU FILES // ACTIVE DOSSIERS
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">Unsolved Crime Cases</h3>
              <p className="text-xs text-[#5c4028] font-mono">Interactive mysteries ready for your squad:</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5 pt-2">
              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-red-800 uppercase font-black">Vault Heist</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">The Midnight Museum</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "The Eye of Osiris diamond vanished during a 4-minute blackout in the central vault."
                </p>
                <div className="text-[10px] font-mono text-red-800 font-bold">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-[#7a5839] uppercase font-black">Luxury Rail</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">The Grand Express</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "A locked luxury coach between Paris and Vienna holding a vanished cryptographic ledger."
                </p>
                <div className="text-[10px] font-mono text-[#7a5839] font-bold">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-amber-800 uppercase font-black">Gothic Manor</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">Blackwood Poisoning</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "Lord Blackwood was found unconscious beside an uncorked vintage decanter in the grand hall."
                </p>
                <div className="text-[10px] font-mono text-amber-800 font-bold">4 Suspects • Normal</div>
              </div>
            </div>

            <div className="pt-3 flex justify-end">
              <button
                onClick={() => {
                  SoundService.playStamp();
                  setIsCasesModalOpen(false);
                  onCreateRoom();
                }}
                className="px-6 py-3 bg-red-800 hover:bg-red-700 text-white font-serif font-black rounded-xl text-xs uppercase tracking-wider cursor-pointer shadow-md border border-red-950"
              >
                Host an Investigation Room →
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ======================================================== */}
      {/* MODAL 3: TOP DETECTIVES HONOR ROLL                      */}
      {/* ======================================================== */}
      {isLeaderboardModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => {
                SoundService.playClick();
                setIsLeaderboardModalOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-amber-800 bg-amber-800/10 text-amber-900 font-mono text-[10px] font-black uppercase tracking-widest">
                FORENSIC MERIT REGISTER // RANKINGS
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">Detective Honor Roll</h3>
              <p className="text-xs text-[#5c4028] font-mono">Top-rated investigators across all solved crime scenes:</p>
            </div>

            <div className="space-y-2 pt-2">
              {leaderboardList.map((det) => (
                <div
                  key={det.name}
                  className="flex items-center justify-between p-3 rounded-2xl bg-[#fdfbf6] border-2 border-[#8c6d48] text-xs shadow-xs"
                >
                  <div className="flex items-center gap-3">
                    <span className="font-mono font-black text-red-800 text-sm">#{det.rank}</span>
                    <AvatarBadge avatar={det.avatar} size="sm" />
                    <span className="font-bold text-[#1a110a]">{det.name}</span>
                  </div>
                  <div className="flex items-center gap-3 font-mono">
                    <span className="text-[#5c4028] text-[11px]">{det.rate}</span>
                    <span className="font-black text-amber-800">{det.score} PTS</span>
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
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-md w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => {
                SoundService.playClick();
                setIsAvatarPickerOpen(false);
              }}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                DETECTIVE CREDENTIALS
              </span>
              <h3 className="text-lg font-black text-[#1a110a] font-serif pt-1">Select Badge Insignia</h3>
              <p className="text-xs text-[#5c4028] font-mono">Choose your official bureau seal icon:</p>
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

      {/* ======================================================== */}
      {/* MODAL 5: QUICK PLAY RADAR SCANNER OVERLAY                */}
      {/* ======================================================== */}
      {isQuickPlaying && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative w-full max-w-md border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] text-center space-y-6 overflow-hidden text-[#221711] select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Concentric pulsing circles with sweeping radar hand */}
            <div className="relative w-36 h-36 mx-auto flex items-center justify-center">
              <div className="absolute inset-0 rounded-full border-2 border-red-800/30 animate-ping" />
              <div className="absolute inset-2 rounded-full border border-red-800/40" />
              <div className="absolute inset-6 rounded-full border border-[#8c6d48]/60" />
              <div className="absolute inset-10 rounded-full border border-amber-800/70" />
              {/* Radar sweep arm */}
              <div className="absolute inset-0 rounded-full overflow-hidden animate-spin [animation-duration:3s]">
                <div className="w-1/2 h-1/2 bg-gradient-to-br from-red-800/40 to-transparent origin-bottom-right" />
              </div>
              <Radio className="w-10 h-10 text-red-800 z-10 animate-pulse" />
            </div>

            <div className="space-y-2">
              <div className="text-[11px] font-mono tracking-widest text-red-800 font-black uppercase">
                LOOKING FOR A GAME
              </div>
              <h3 className="text-xl font-black text-[#1a110a] font-serif">
                Finding an open room for you...
              </h3>
              <p className="text-xs text-[#5c4028] max-w-xs mx-auto leading-relaxed font-mono">
                Matching you with active detectives. You'll jump in as soon as a room is ready.
              </p>
            </div>

            <div className="flex items-center justify-center gap-2 text-xs font-mono text-red-800 font-bold">
              <Loader2 className="w-4 h-4 animate-spin text-red-800" />
              <span>Joining Room...</span>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
