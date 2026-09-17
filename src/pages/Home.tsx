import React, { useEffect, useState } from 'react';
import {
  UserPlus,
  LogIn,
  Search,
  Pencil,
  X,
  User,
  Menu,
} from 'lucide-react';
import { Player } from '../types/player';
import { AuthService } from '../services/authService';
import { AvatarBadge, AvatarPicker } from '../components/common/AvatarBadge';

interface HomeProps {
  currentUser: Player;
  onUpdateProfile: (updated: Player) => void;
  onCreateRoom: () => void;
  onJoinRoom: (code: string) => void;
  isCreating?: boolean;
}

export const Home: React.FC<HomeProps> = ({
  currentUser,
  onUpdateProfile,
  onCreateRoom,
  onJoinRoom,
}) => {
  const [isJoinModalOpen, setIsJoinModalOpen] = useState(false);
  const [isProfileModalOpen, setIsProfileModalOpen] = useState(false);
  const [isCasesModalOpen, setIsCasesModalOpen] = useState(false);
  const [isLeaderboardModalOpen, setIsLeaderboardModalOpen] = useState(false);
  const [isFeaturesModalOpen, setIsFeaturesModalOpen] = useState(false);
  const [isRulesModalOpen, setIsRulesModalOpen] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [roomCodeInput, setRoomCodeInput] = useState('');
  const [nicknameInput, setNicknameInput] = useState(currentUser.nickname);
  const [selectedAvatar, setSelectedAvatar] = useState(currentUser.avatar);
  const [errorMsg, setErrorMsg] = useState('');
  const [activeNav, setActiveNav] = useState('Home');

  const handleJoinSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!roomCodeInput.trim()) {
      setErrorMsg('Please enter a valid room code.');
      return;
    }
    setErrorMsg('');
    setIsJoinModalOpen(false);
    onJoinRoom(roomCodeInput.trim().toUpperCase());
  };

  const handlePasteCode = async () => {
    try {
      const text = await navigator.clipboard.readText();
      if (text) {
        const clean = text.trim().toUpperCase().replace(/[^A-Z0-9]/g, '').substring(0, 6);
        if (clean) setRoomCodeInput(clean);
      }
    } catch {
      // ignore
    }
  };

  const handleSaveProfile = async (e: React.FormEvent) => {
    e.preventDefault();
    const updated = await AuthService.updateDetective(nicknameInput, selectedAvatar);
    onUpdateProfile(updated);
    setIsProfileModalOpen(false);
  };

  const [leaderboardList, setLeaderboardList] = useState<
    { rank: number; name: string; avatar: string; score: number; rate: string }[]
  >([]);

  useEffect(() => {
    AuthService.getLeaderboard().then(setLeaderboardList);
  }, []);

  const navItems = ['Home', 'How to Play', 'Features', 'Cases', 'Leaderboard'];

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* 1. PHOTOREALISTIC NOIR DESK BACKGROUND */}
      <div
        className="absolute top-0 left-0 right-0 h-[650px] sm:h-[700px] md:h-[750px] bg-cover bg-center bg-no-repeat opacity-65 mix-blend-luminosity filter brightness-95 pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      {/* Vignette Overlay Gradients */}
      <div className="absolute top-0 left-0 right-0 h-[650px] sm:h-[700px] md:h-[750px] bg-gradient-to-b from-black/80 via-transparent to-[#08090d] pointer-events-none" />
      <div className="absolute top-0 left-0 right-0 h-[650px] sm:h-[700px] md:h-[750px] bg-radial-vignette opacity-70 pointer-events-none" />

      {/* 2. TOP FLOATING NAVBAR */}
      <nav className="relative z-30 w-full max-w-7xl mx-auto px-4 sm:px-8 py-4 sm:py-5 flex items-center justify-between">
        {/* Left: INKBOUND Official Logo */}
        <div
          className="flex items-center gap-2 cursor-pointer transition-transform hover:scale-105"
          onClick={() => setActiveNav('Home')}
        >
          <img
            src="/assets/logo.png"
            alt="INKBOUND"
            className="h-7 sm:h-8 md:h-9 object-contain filter drop-shadow-[0_2px_10px_rgba(0,0,0,0.8)]"
          />
        </div>

        {/* Center: Desktop Nav Links with Red Underline */}
        <div className="hidden md:flex items-center gap-8 lg:gap-10 text-xs font-medium tracking-wide text-slate-300">
          {navItems.map((item) => {
            const isActive = activeNav === item;
            return (
              <button
                key={item}
                onClick={() => {
                  setActiveNav(item);
                  if (item === 'How to Play') {
                    setIsRulesModalOpen(true);
                  } else if (item === 'Cases') {
                    setIsCasesModalOpen(true);
                  } else if (item === 'Leaderboard') {
                    setIsLeaderboardModalOpen(true);
                  } else if (item === 'Features') {
                    setIsFeaturesModalOpen(true);
                  }
                }}
                className={`relative py-1 transition-colors hover:text-white ${
                  isActive ? 'text-white font-semibold' : 'text-slate-400'
                }`}
              >
                {item}
                {isActive && (
                  <span className="absolute -bottom-1.5 left-1/2 -translate-x-1/2 w-6 h-[2px] bg-red-600 rounded-full shadow-[0_0_8px_rgba(220,38,38,0.8)]" />
                )}
              </button>
            );
          })}
        </div>

        {/* Right: User Badge & Sign In Button */}
        <div className="flex items-center gap-3">
          {/* Profile Badge Avatar */}
          <button
            onClick={() => setIsProfileModalOpen(true)}
            title="Edit Detective Alias"
            className="p-1.5 rounded-full bg-black/60 hover:bg-slate-850 border border-slate-700/80 text-slate-300 hover:text-white transition-all flex items-center gap-2 text-xs shadow-md backdrop-blur-xs"
          >
            <AvatarBadge avatar={currentUser.avatar} size="sm" />
            <span className="hidden sm:inline font-mono font-medium max-w-[90px] truncate text-slate-200">
              {currentUser.nickname}
            </span>
            <User className="w-3.5 h-3.5 text-slate-400 sm:hidden" />
          </button>


          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
            className="md:hidden p-1.5 rounded-lg bg-black/60 border border-slate-700 text-slate-300"
          >
            <Menu className="w-5 h-5" />
          </button>
        </div>
      </nav>

      {/* Mobile Drawer */}
      {isMobileMenuOpen && (
        <div className="relative z-30 md:hidden bg-[#0c1017]/95 border-b border-slate-800 px-6 py-4 flex flex-col gap-3 text-xs backdrop-blur-md">
          {navItems.map((item) => (
            <button
              key={item}
              onClick={() => {
                setActiveNav(item);
                setIsMobileMenuOpen(false);
                if (item === 'How to Play') {
                  const el = document.getElementById('how-it-works');
                  el?.scrollIntoView({ behavior: 'smooth' });
                }
              }}
              className="text-left text-slate-300 py-1.5 hover:text-red-400"
            >
              {item}
            </button>
          ))}
        </div>
      )}

      {/* 3. HERO CENTER CONTENT */}
      <main className="relative z-20 flex-1 flex flex-col items-center justify-center text-center px-4 max-w-4xl mx-auto pt-8 pb-14 sm:py-16">
        {/* BIG INKBOUND LOGO (Splattered letters + dripping red 'O') */}
        <div className="relative mb-3 flex justify-center w-full">
          <img
            src="/assets/logo.png"
            alt="INKBOUND"
            className="h-20 sm:h-28 md:h-36 lg:h-40 max-w-full object-contain filter drop-shadow-[0_20px_35px_rgba(0,0,0,0.95)] transform hover:scale-[1.01] transition-transform duration-300"
          />
        </div>

        {/* Tagline */}
        <h2 className="text-[11px] sm:text-xs md:text-sm font-sans uppercase tracking-[0.25em] text-slate-200 font-bold mb-2.5">
          EVERY PLAYER KNOWS A PIECE OF THE TRUTH.
        </h2>

        {/* Subtitle */}
        <p className="text-xs sm:text-sm text-slate-400 max-w-lg mx-auto mb-8 font-light leading-relaxed">
          A multiplayer visual investigation game where drawing, deduction and deception collide.
        </p>

        {/* ACTION BUTTONS (Exact shape & icons from reference) */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-4 w-full max-w-sm sm:max-w-md">
          {/* Create a Room Button */}
          <button
            onClick={onCreateRoom}
            className="w-full sm:w-1/2 py-2.5 sm:py-3 px-6 rounded-xl bg-gradient-to-r from-[#991b1b] via-[#b91c1c] to-[#991b1b] hover:from-[#b91c1c] hover:to-[#dc2626] text-white font-medium text-xs sm:text-sm shadow-[0_4px_25px_rgba(185,28,28,0.6)] border border-red-500/40 flex items-center justify-center gap-2 transition-all transform hover:-translate-y-0.5 active:translate-y-0"
          >
            <UserPlus className="w-4 h-4 text-white" />
            <span>Create a Room</span>
          </button>

          {/* Join a Room Button */}
          <button
            onClick={() => setIsJoinModalOpen(true)}
            className="w-full sm:w-1/2 py-2.5 sm:py-3 px-6 rounded-xl bg-black/65 hover:bg-slate-900 border border-slate-700/80 hover:border-slate-500 text-slate-200 hover:text-white font-medium text-xs sm:text-sm shadow-md flex items-center justify-center gap-2 transition-all transform hover:-translate-y-0.5 active:translate-y-0 backdrop-blur-xs"
          >
            <LogIn className="w-4 h-4 text-slate-300" />
            <span>Join a Room</span>
          </button>
        </div>
      </main>

      {/* 4. TORN PAPER EDGE TRANSITION DIVIDER */}
      <div className="relative z-20 w-full overflow-hidden leading-none -mb-[1px]">
        <svg
          viewBox="0 0 1440 48"
          preserveAspectRatio="none"
          className="w-full h-8 sm:h-12 text-[#08090d] fill-current"
        >
          <path d="M0,48 L0,18 Q35,8 70,22 T140,12 T210,24 T280,10 T350,22 T420,11 T490,25 T560,12 T630,23 T700,9 T770,24 T840,11 T910,23 T980,10 T1050,25 T1120,11 T1190,24 T1260,10 T1330,22 T1400,12 L1440,20 L1440,48 Z" />
        </svg>
      </div>

      {/* 5. "HOW IT WORKS" SECTION */}
      <section
        id="how-it-works"
        className="relative z-20 w-full bg-[#08090d] pt-4 pb-12 px-4 sm:px-8 border-b border-slate-900"
      >
        {/* Title Bar with Horizontal Rule */}
        <div className="flex items-center justify-center gap-4 max-w-xs sm:max-w-sm mx-auto mb-10">
          <div className="flex-1 h-[1px] bg-slate-800" />
          <span className="text-[11px] font-mono tracking-[0.25em] text-slate-400 uppercase font-semibold">
            HOW IT WORKS
          </span>
          <div className="flex-1 h-[1px] bg-slate-800" />
        </div>

        {/* 4 Horizontal Steps with Arrows */}
        <div className="max-w-5xl mx-auto flex flex-col md:flex-row items-center justify-between gap-8 md:gap-3 text-center">
          {/* STEP 1: DRAW */}
          <div className="flex flex-col items-center max-w-[200px] group">
            <div className="relative mb-3 flex flex-col items-center">
              {/* Hand-drawn style pencil */}
              <div className="w-12 h-12 rounded-full flex items-center justify-center">
                <Pencil className="w-7 h-7 text-white transform -rotate-45" />
              </div>
              {/* Red brush stroke underline */}
              <div className="w-9 h-1.5 bg-red-600 rounded-full mt-1 shadow-[0_0_10px_rgba(220,38,38,0.9)] -rotate-3" />
            </div>
            <h3 className="text-xs font-mono font-bold tracking-[0.2em] uppercase text-white mb-1.5">
              DRAW
            </h3>
            <p className="text-[11px] text-slate-400 leading-relaxed">
              Get your secret clue and express it through art.
            </p>
          </div>

          {/* Thin Arrow */}
          <span className="text-slate-600 text-lg hidden md:block">→</span>

          {/* STEP 2: INVESTIGATE */}
          <div className="flex flex-col items-center max-w-[200px] group">
            <div className="relative mb-3 flex flex-col items-center">
              <div className="w-12 h-12 rounded-full flex items-center justify-center">
                <Search className="w-7 h-7 text-white" />
              </div>
              <div className="w-9 h-1.5 opacity-0 mt-1" />
            </div>
            <h3 className="text-xs font-mono font-bold tracking-[0.2em] uppercase text-white mb-1.5">
              INVESTIGATE
            </h3>
            <p className="text-[11px] text-slate-400 leading-relaxed">
              Study the evidence, spot the patterns.
            </p>
          </div>

          {/* Thin Arrow */}
          <span className="text-slate-600 text-lg hidden md:block">→</span>

          {/* STEP 3: CONNECT */}
          <div className="flex flex-col items-center max-w-[200px] group">
            <div className="relative mb-3 flex flex-col items-center">
              {/* 3 Red nodes connected by lines */}
              <div className="w-12 h-12 flex items-center justify-center">
                <svg viewBox="0 0 36 36" className="w-8 h-8">
                  <line x1="8" y1="28" x2="18" y2="8" stroke="#ffffff" strokeWidth="2" />
                  <line x1="18" y1="8" x2="28" y2="28" stroke="#ffffff" strokeWidth="2" />
                  <line x1="8" y1="28" x2="28" y2="28" stroke="#ffffff" strokeWidth="2" />
                  <circle cx="18" cy="8" r="4.5" fill="#dc2626" stroke="#ffffff" strokeWidth="1.5" />
                  <circle cx="8" cy="28" r="4.5" fill="#dc2626" stroke="#ffffff" strokeWidth="1.5" />
                  <circle cx="28" cy="28" r="4.5" fill="#dc2626" stroke="#ffffff" strokeWidth="1.5" />
                </svg>
              </div>
              <div className="w-9 h-1.5 opacity-0 mt-1" />
            </div>
            <h3 className="text-xs font-mono font-bold tracking-[0.2em] uppercase text-white mb-1.5">
              CONNECT
            </h3>
            <p className="text-[11px] text-slate-400 leading-relaxed">
              Link clues, build a timeline, ask the right questions.
            </p>
          </div>

          {/* Thin Arrow */}
          <span className="text-slate-600 text-lg hidden md:block">→</span>

          {/* STEP 4: SOLVE */}
          <div className="flex flex-col items-center max-w-[200px] group">
            <div className="relative mb-3 flex flex-col items-center">
              {/* Red & Gold Target Scope */}
              <div className="w-12 h-12 flex items-center justify-center">
                <svg viewBox="0 0 36 36" className="w-8 h-8">
                  <circle cx="18" cy="18" r="14" stroke="#dc2626" strokeWidth="2" fill="none" />
                  <circle cx="18" cy="18" r="9" stroke="#f59e0b" strokeWidth="1.5" fill="none" />
                  <circle cx="18" cy="18" r="3.5" fill="#dc2626" />
                  <line x1="18" y1="1" x2="18" y2="35" stroke="#dc2626" strokeWidth="1.5" />
                  <line x1="1" y1="18" x2="35" y2="18" stroke="#dc2626" strokeWidth="1.5" />
                </svg>
              </div>
              <div className="w-9 h-1.5 opacity-0 mt-1" />
            </div>
            <h3 className="text-xs font-mono font-bold tracking-[0.2em] uppercase text-white mb-1.5">
              SOLVE
            </h3>
            <p className="text-[11px] text-slate-400 leading-relaxed">
              Uncover the truth. But beware... someone might be lying.
            </p>
          </div>
        </div>

        {/* 6. CORNER HANDWRITTEN VIGNETTES (Desktop Only) */}
        {/* Bottom Left Note */}
        <div className="hidden lg:block absolute bottom-6 left-12 pointer-events-none">
          <div className="font-handwriting text-2xl text-slate-400 italic leading-snug">
            Not just a game...<br />
            <span className="text-slate-300">It's a case.</span>
            <div className="w-14 h-0.5 bg-red-700 mt-0.5 -rotate-2" />
          </div>
        </div>

        {/* Bottom Right Parchment Scrap Note */}
        <div className="hidden lg:block absolute bottom-4 right-12 pointer-events-none">
          <div className="bg-[#eadaaf] border border-[#c4ab75] text-[#2c1e10] p-3.5 rounded-lg shadow-2xl rotate-2 font-handwriting text-lg leading-tight max-w-[160px]">
            Same story.<br />
            Different eyes.<br />
            <span className="font-bold text-[#1a1107]">Different truths.</span>
            <div className="flex gap-1 mt-1">
              <span className="w-3 h-0.5 bg-red-700 block -rotate-12" />
              <span className="w-3 h-0.5 bg-red-700 block -rotate-12" />
              <span className="w-3 h-0.5 bg-red-700 block -rotate-12" />
            </div>
          </div>
        </div>
      </section>

      {/* JOIN ROOM MODAL */}
      {isJoinModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-sm w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsJoinModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Enter Investigation Room</h3>
              <p className="text-xs text-slate-400">Enter the 6-letter room code shared by your host.</p>
            </div>

            <form onSubmit={handleJoinSubmit} className="space-y-3">
              <div className="relative flex items-center">
                <input
                  type="text"
                  maxLength={6}
                  value={roomCodeInput}
                  onChange={(e) => setRoomCodeInput(e.target.value.toUpperCase())}
                  placeholder="e.g. X7K9P"
                  className="w-full py-3 pl-4 pr-16 bg-slate-950 border border-slate-700 rounded-xl text-center text-xl font-mono tracking-widest uppercase text-amber-400 focus:border-red-500 outline-none"
                  autoFocus
                />
                <button
                  type="button"
                  onClick={handlePasteCode}
                  className="absolute right-2 px-2.5 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-[10px] font-mono font-bold text-slate-300 hover:text-white transition-colors border border-slate-600"
                >
                  PASTE
                </button>
              </div>
              {errorMsg && <p className="text-xs text-red-400">{errorMsg}</p>}

              <button
                type="submit"
                className="w-full py-3 rounded-xl bg-gradient-to-r from-red-700 to-rose-700 text-white font-bold text-xs uppercase tracking-wider hover:from-red-600 hover:to-rose-600 transition-all shadow-md"
              >
                Join Investigation
              </button>
            </form>
          </div>
        </div>
      )}

      {/* PROFILE CUSTOMIZATION MODAL */}
      {isProfileModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-start sm:items-center justify-center p-3 sm:p-4 overflow-y-auto">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-2xl w-[min(94vw,42rem)] max-h-[calc(100vh-1.5rem)] sm:max-h-[calc(100vh-2rem)] overflow-y-auto p-5 sm:p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsProfileModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-lg font-bold text-white font-serif">Detective Badge</h3>
              <p className="text-xs text-slate-400">Choose your detective alias and profile icon.</p>
            </div>

            <form onSubmit={handleSaveProfile} className="space-y-4">
              <div>
                <label className="block text-xs font-mono text-slate-400 mb-2">Avatar Icon</label>
                <AvatarPicker value={selectedAvatar} onChange={setSelectedAvatar} className="xl:grid-cols-8" />
              </div>

              <div>
                <label className="block text-xs font-mono text-slate-400 mb-1.5">Detective Alias</label>
                <input
                  type="text"
                  maxLength={18}
                  value={nicknameInput}
                  onChange={(e) => setNicknameInput(e.target.value)}
                  className="w-full px-3 py-2 bg-slate-950 border border-slate-700 rounded-xl text-white text-sm outline-none focus:border-red-500"
                  required
                />
              </div>

              <button
                type="submit"
                className="w-full py-2.5 bg-gradient-to-r from-red-700 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-bold rounded-xl text-xs uppercase tracking-wider transition-all shadow-md"
              >
                Save Badge
              </button>
            </form>
          </div>
        </div>
      )}

      {/* CASES ARCHIVE MODAL */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-2xl w-full p-6 shadow-2xl relative space-y-4 max-h-[85vh] overflow-y-auto">
            <button
              onClick={() => setIsCasesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Declassified Case Files</h3>
              <p className="text-xs text-slate-400">Select an investigation to launch in your room.</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 pt-2">
              <div className="p-4 bg-slate-900/90 border border-red-700/60 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-red-400 uppercase font-bold">Featured Case</span>
                <h4 className="text-sm font-bold text-white font-serif">The Midnight Museum Heist</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  The Eye of Osiris blue diamond vanished at 11:44 PM during an electrical blackout.
                </p>
                <div className="text-[10px] font-mono text-amber-400">4 Suspects • Vault Chamber</div>
              </div>

              <div className="p-4 bg-slate-900/60 border border-slate-800 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-sky-400 uppercase font-bold">Orient Mystery</span>
                <h4 className="text-sm font-bold text-white font-serif">The Grand Express Cipher</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  An encrypted ledger was extracted from the locked luxury coach between Paris and Vienna.
                </p>
                <div className="text-[10px] font-mono text-slate-500">4 Suspects • Train Coach</div>
              </div>

              <div className="p-4 bg-slate-900/60 border border-slate-800 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-amber-400 uppercase font-bold">Gothic Manor</span>
                <h4 className="text-sm font-bold text-white font-serif">The Blackwood Poisoning</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  Lord Blackwood was found unconscious beside his vintage 1928 vintage decanter.
                </p>
                <div className="text-[10px] font-mono text-slate-500">4 Suspects • Dining Hall</div>
              </div>
            </div>

            <div className="pt-2 flex justify-end">
              <button
                onClick={() => {
                  setIsCasesModalOpen(false);
                  onCreateRoom();
                }}
                className="px-6 py-2.5 bg-gradient-to-r from-red-700 to-rose-700 text-white font-bold rounded-xl text-xs uppercase tracking-wider hover:from-red-600 hover:to-rose-600 transition-all shadow-md"
              >
                Create Room with This Case
              </button>
            </div>
          </div>
        </div>
      )}

      {/* LEADERBOARD / HALL OF FAME MODAL */}
      {isLeaderboardModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsLeaderboardModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Detective Hall of Fame</h3>
              <p className="text-xs text-slate-400">Top-rated detectives across all resolved crime scenes.</p>
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

      {/* FEATURES MODAL */}
      {isFeaturesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsFeaturesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Core Game Features</h3>
              <p className="text-xs text-slate-400">Everything designed for high-stakes visual deduction.</p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2 text-xs">
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white">🎨 Live Visual Evidence</div>
                <div className="text-slate-400 text-[11px]">Real-time canvas with bezier curve rendering and undo/redo history.</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white">🕰 Timeline Reconstruction</div>
                <div className="text-slate-400 text-[11px]">Drag-and-drop evidence slots along a chronological 11 PM axis.</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white">🎭 The Secret Distorter</div>
                <div className="text-slate-400 text-[11px]">One player receives altered evidence to covertly mislead the investigation.</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white">🔒 Confidential Dossiers</div>
                <div className="text-slate-400 text-[11px]">Clues are strictly hidden between players until final reveal.</div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* HOW TO PLAY / RULES MODAL */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsRulesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">How to Play INKBOUND</h3>
              <p className="text-xs text-slate-400">4 steps to solve the mystery or fool the detectives.</p>
            </div>

            <div className="space-y-3 pt-2 text-xs">
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">01</span>
                <div>
                  <div className="font-bold text-white">Draw Your Clue</div>
                  <div className="text-slate-400 text-[11px]">Every detective receives a private fragment of the truth. Draw what you witnessed before time runs out.</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">02</span>
                <div>
                  <div className="font-bold text-white">Analyze the Evidence Board</div>
                  <div className="text-slate-400 text-[11px]">Inspect all witness sketches. Drag them into chronological order on the timeline axis.</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">03</span>
                <div>
                  <div className="font-bold text-white">Unmask the Distorter</div>
                  <div className="text-slate-400 text-[11px]">One player was given false witness instructions. Spot the contradiction in the drawings.</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">04</span>
                <div>
                  <div className="font-bold text-white">Lock Final Accusations</div>
                  <div className="text-slate-400 text-[11px]">Submit your theory: Who did it? How? What was their motive? Points are awarded upon truth reveal.</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
