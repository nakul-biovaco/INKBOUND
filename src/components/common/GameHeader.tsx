import React, { useState } from 'react';
import {
  Users,
  ChevronDown,
  Copy,
  Check,
  Pencil,
  Eye,
  Search,
  Lightbulb,
  Scale,
  Trophy,
  LogOut,
  X,
  Clock,
  Smartphone,
} from 'lucide-react';
import { GameStatus } from '../../types/game';
import { Player } from '../../types/player';
import { AuthService } from '../../services/authService';
import { AvatarBadge, AvatarPicker } from './AvatarBadge';
import { buildInviteUrl } from '../../utils/inviteCrypto';
import { AudioControl } from './AudioControl';
import { SoundService } from '../../services/soundService';

interface GameHeaderProps {
  currentUser: Player;
  roomCode?: string;
  playerCount?: number;
  maxPlayers?: number;
  currentPhase?: GameStatus;
  caseTitle?: string;
  roundText?: string;
  onLeaveRoom?: () => void;
  onOpenProfile?: () => void;
  onUpdateUser?: (updated: Player) => void;
}

const parchmentStyle: React.CSSProperties = {
  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
  backgroundSize: '16px 16px, 100% 100%',
};

export const GameHeader: React.FC<GameHeaderProps> = ({
  currentUser,
  roomCode = '',
  playerCount = 1,
  maxPlayers = 8,
  currentPhase = 'PLAYER_DRAWING',
  caseTitle = 'The Midnight Museum Heist',
  roundText = 'Investigation Round',
  onLeaveRoom,
  onOpenProfile,
  onUpdateUser,
}) => {
  const [copied, setCopied] = useState(false);
  const [isRulesModalOpen, setIsRulesModalOpen] = useState(false);
  const [isFeaturesModalOpen, setIsFeaturesModalOpen] = useState(false);
  const [isAboutModalOpen, setIsAboutModalOpen] = useState(false);
  const [isCasesModalOpen, setIsCasesModalOpen] = useState(false);
  const [isLeaderboardModalOpen, setIsLeaderboardModalOpen] = useState(false);
  const [isProfileModalOpen, setIsProfileModalOpen] = useState(false);
  const [leaderboardList, setLeaderboardList] = useState<
    { rank: number; name: string; avatar: string; score: number; rate: string }[]
  >([]);

  React.useEffect(() => {
    AuthService.getLeaderboard().then(setLeaderboardList);
  }, []);
  const [isConfirmLeaveOpen, setIsConfirmLeaveOpen] = useState(false);

  // Profile modal editing states
  const [nicknameInput, setNicknameInput] = useState(currentUser.nickname);
  const [selectedAvatar, setSelectedAvatar] = useState(currentUser.avatar);

  const handleCopy = () => {
    if (!roomCode) return;
    const url = buildInviteUrl(roomCode);
    navigator.clipboard.writeText(url);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const handleSaveProfile = async (e: React.FormEvent) => {
    e.preventDefault();
    const updated = await AuthService.updateDetective(nicknameInput, selectedAvatar);
    if (onUpdateUser) {
      onUpdateUser(updated);
    }
    setIsProfileModalOpen(false);
  };

  const navItems = ['Home', 'How to Play', 'Features', 'About', 'Cases', 'Leaderboard'];

  const handleNavClick = (item: string) => {
    SoundService.playClick();
    if (item === 'Home') {
      if (onLeaveRoom) {
        setIsConfirmLeaveOpen(true);
      } else {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }
    } else if (item === 'How to Play') {
      setIsRulesModalOpen(true);
    } else if (item === 'Features') {
      setIsFeaturesModalOpen(true);
    } else if (item === 'About') {
      setIsAboutModalOpen(true);
    } else if (item === 'Cases') {
      setIsCasesModalOpen(true);
    } else if (item === 'Leaderboard') {
      setIsLeaderboardModalOpen(true);
    }
  };

  // Map GameStatus to step index:
  // 0: Draw, 1: Reveal, 2: Investigate, 3: Theory, 4: Accuse, 5: Result
  const getStepIndex = (status: GameStatus): number => {
    switch (status) {
      case 'PLAYER_DRAWING':
      case 'TURN_START':
      case 'CLUE_DISTRIBUTION':
        return 0;
      case 'DRAWING_SUBMITTED':
      case 'EVIDENCE_REVEAL':
      case 'EVIDENCE_DISCOVERED':
      case 'NEXT_PLAYER':
        return 1;
      case 'ALL_TURNS_COMPLETE':
      case 'INVESTIGATION':
      case 'QUESTIONING':
      case 'TIMELINE_BUILDING':
      case 'DISCUSSION':
        return 2;
      case 'FINAL_THEORY':
        return 3;
      case 'ACCUSATION_LOCK':
      case 'TRUTH_REVEAL':
        return 4;
      case 'SCORING':
      case 'RESULTS':
      case 'GAME_FINISHED':
        return 5;
      default:
        return 0;
    }
  };

  const activeStep = getStepIndex(currentPhase);

  const steps = [
    { label: 'Draw', icon: <Pencil className="w-3.5 h-3.5" /> },
    { label: 'Reveal', icon: <Eye className="w-3.5 h-3.5" /> },
    { label: 'Investigate', icon: <Search className="w-3.5 h-3.5" /> },
    { label: 'Theory', icon: <Lightbulb className="w-3.5 h-3.5" /> },
    { label: 'Accuse', icon: <Scale className="w-3.5 h-3.5" /> },
    { label: 'Result', icon: <Trophy className="w-3.5 h-3.5" /> },
  ];

  return (
    <>
      <header className="w-full relative z-40 bg-[#07080c]/90 border-b border-slate-800/80 backdrop-blur-md select-none">
        {/* IN-GAME SINGLE STREAMLINED TOPBAR */}
        {currentPhase !== 'LOBBY' ? (
          <>
            <div className="max-w-[1720px] mx-auto px-3 sm:px-6 py-2 flex items-center justify-between gap-3">
              {/* Left: INKBOUND Logo & Case Information */}
              <div className="flex items-center gap-3 min-w-0">
                <div
                  onClick={() => {
                    SoundService.playClick();
                    setIsConfirmLeaveOpen(true);
                  }}
                  className="flex items-center gap-2 cursor-pointer transition-transform hover:scale-105 shrink-0"
                  title="INKBOUND Game"
                >
                  <img
                    src="/assets/logo.png"
                    alt="INKBOUND"
                    className="h-6 sm:h-7 object-contain filter drop-shadow"
                  />
                </div>

                <div className="hidden sm:block h-6 w-px bg-slate-800 shrink-0" />

                <div className="hidden sm:block min-w-0">
                  <div className="flex items-center gap-2">
                    <span className="text-xs sm:text-sm font-bold text-white font-serif tracking-wide truncate max-w-[180px] sm:max-w-[280px] md:max-w-[360px]">
                      {caseTitle}
                    </span>
                    <span className="hidden md:inline-flex items-center px-2 py-0.5 rounded-md bg-red-950/80 border border-red-800/60 text-[9px] font-mono text-red-300 font-bold uppercase tracking-wider">
                      ACTIVE CASE
                    </span>
                  </div>
                  <div className="text-[10px] font-mono text-slate-400 truncate">
                    {roundText}
                  </div>
                </div>
              </div>

              {/* Center: Phase Progression Pills */}
              <div className="hidden lg:flex items-center gap-2 shrink-0">
                {steps.map((step, idx) => {
                  const isActive = activeStep === idx;
                  const isPast = activeStep > idx;

                  return (
                    <div key={step.label} className="flex items-center gap-1.5">
                      <div
                        className={`flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-mono font-bold uppercase transition-all ${
                          isActive
                            ? 'bg-red-800 text-white shadow-md border border-red-600'
                            : isPast
                            ? 'bg-emerald-950/80 text-emerald-300 border border-emerald-600/60'
                            : 'bg-[#151922] text-slate-400 border border-slate-700/60'
                        }`}
                      >
                        <span className="w-3.5 h-3.5 flex items-center justify-center">
                          {step.icon}
                        </span>
                        <span>{step.label}</span>
                      </div>
                      {idx < steps.length - 1 && (
                        <div
                          className={`w-2.5 h-0.5 ${
                            isPast ? 'bg-emerald-600' : 'bg-slate-800'
                          }`}
                        />
                      )}
                    </div>
                  );
                })}
              </div>

              {/* Right: Room Code, Live Player Counter, Audio, Profile, Exit */}
              <div className="flex items-center gap-1.5 sm:gap-2.5 shrink-0">
                {/* Room Code with 1-click copy */}
                <div className="flex items-center gap-1 sm:gap-1.5 px-2 sm:px-2.5 py-1.5 rounded-xl bg-[#141824] border border-[#8c6d48]/50 text-xs font-mono">
                  <span className="text-amber-200/80 text-[10px] hidden sm:inline font-bold">ROOM:</span>
                  <span className="font-bold text-white tracking-wider sm:tracking-widest text-xs">{roomCode}</span>
                  <button
                    onClick={handleCopy}
                    title="Copy Invite Link"
                    className="text-stone-300 hover:text-white transition-colors cursor-pointer ml-0.5"
                  >
                    {copied ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                  </button>
                </div>

                {/* Live Reactive Player Count badge */}
                <div className="flex items-center gap-1 sm:gap-1.5 px-2 sm:px-2.5 py-1.5 rounded-xl bg-[#141824] border border-[#8c6d48]/50 text-xs font-mono text-slate-200">
                  <span className="relative flex h-2 w-2">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
                  </span>
                  <Users className="w-3.5 h-3.5 text-amber-300" />
                  <span className="font-bold tabular-nums">
                    {playerCount}/{maxPlayers}
                  </span>
                </div>

                <AudioControl />

                {/* Detective Profile Badge */}
                <button
                  onClick={() => {
                    SoundService.playClick();
                    if (onOpenProfile) {
                      onOpenProfile();
                    } else {
                      setNicknameInput(currentUser.nickname);
                      setSelectedAvatar(currentUser.avatar);
                      setIsProfileModalOpen(true);
                    }
                  }}
                  title="Edit Detective Identity"
                  className="flex items-center gap-1 sm:gap-1.5 py-1.5 px-2 sm:px-2.5 rounded-xl bg-[#141824] border border-[#8c6d48]/50 hover:border-[#8c6d48] text-xs text-slate-200 transition-all cursor-pointer max-w-[140px]"
                >
                  <AvatarBadge avatar={currentUser.avatar} size="xs" />
                  <span className="font-medium text-white truncate max-w-[70px] hidden sm:inline">
                    {currentUser.nickname}
                  </span>
                  <ChevronDown className="w-3 h-3 text-slate-400 shrink-0 hidden sm:inline" />
                </button>

                {/* Leave Room Button */}
                {onLeaveRoom && (
                  <button
                    onClick={() => {
                      SoundService.playClick();
                      setIsConfirmLeaveOpen(true);
                    }}
                    className="px-2.5 py-1.5 rounded-xl border border-red-700/60 bg-red-950/40 hover:bg-red-900/60 text-red-300 hover:text-white text-xs font-bold transition-all flex items-center gap-1 cursor-pointer shadow-sm"
                  >
                    <LogOut className="w-3.5 h-3.5" />
                    <span className="hidden sm:inline">Exit</span>
                  </button>
                )}
              </div>
            </div>

            {/* DEDICATED MOBILE STORY TITLE & ROUND RIBBON (< sm) */}
            <div className="sm:hidden w-full px-3 py-1.5 bg-[#0f1422] border-t border-slate-800/90 flex items-center justify-between gap-2 select-none">
              <div className="flex items-center gap-1.5 min-w-0 flex-1">
                <span className="px-1.5 py-0.5 rounded bg-red-950/90 border border-red-800/70 text-[9px] font-mono text-red-300 font-bold uppercase tracking-wider shrink-0">
                  CASE FILE
                </span>
                <span className="text-xs font-serif font-bold text-amber-200 truncate" title={caseTitle}>
                  {caseTitle}
                </span>
              </div>
              <span className="text-[10px] font-mono text-slate-400 shrink-0 font-medium">
                {roundText}
              </span>
            </div>
          </>
        ) : (
          /* LOBBY GLOBAL NAVIGATION BAR */
          <div className="max-w-[1440px] mx-auto px-3 sm:px-8 py-2.5 flex items-center justify-between gap-3">
            <div
              onClick={() => handleNavClick('Home')}
              className="flex items-center gap-2 cursor-pointer transition-transform hover:scale-105 shrink-0"
              title="Return to INKBOUND Home"
            >
              <img
                src="/assets/logo.png"
                alt="INKBOUND"
                className="h-6 sm:h-7 object-contain filter drop-shadow"
              />
            </div>

            <nav className="hidden md:flex items-center gap-8 text-xs font-bold text-slate-300 flex-1 justify-center font-mono">
              {navItems.map((item, idx) => (
                <button
                  key={item}
                  onClick={() => handleNavClick(item)}
                  className={`hover:text-amber-200 cursor-pointer transition-colors ${
                    idx === 0 ? 'text-amber-300 font-black' : 'text-slate-400'
                  }`}
                >
                  {item}
                </button>
              ))}
            </nav>

            <div className="flex items-center gap-2 sm:gap-3 shrink-0">
              <AudioControl />
              {onLeaveRoom && (
                <button
                  onClick={() => {
                    SoundService.playClick();
                    setIsConfirmLeaveOpen(true);
                  }}
                  className="px-3 py-1.5 rounded-xl border border-red-700/60 bg-red-950/40 hover:bg-red-900/60 text-red-300 hover:text-white text-xs font-bold font-mono transition-all flex items-center gap-1 cursor-pointer"
                >
                  <LogOut className="w-3.5 h-3.5" />
                  <span>Leave</span>
                </button>
              )}
            </div>
          </div>
        )}
      </header>

      {/* ======================================================== */}
      {/* MODALS RENDERED AS TOP-LEVEL ROOT VIEWPORT OVERLAYS      */}
      {/* No longer trapped inside backdrop-filtered header!       */}
      {/* ======================================================== */}

      {/* CONFIRM LEAVE MODAL */}
      {isConfirmLeaveOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-sm w-full p-6 sm:p-7 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-center text-[#221711] select-none overflow-hidden"
            style={parchmentStyle}
          >
            <div className="w-12 h-12 rounded-2xl bg-red-800 text-white flex items-center justify-center mx-auto shadow-md">
              <LogOut className="w-6 h-6" />
            </div>
            <div>
              <h3 className="text-lg font-black text-[#1a110a] font-serif">Leave Investigation?</h3>
              <p className="text-xs text-[#5c4028] font-mono mt-1 leading-relaxed">
                You will exit this case room and return to Headquarters.
              </p>
            </div>
            <div className="grid grid-cols-2 gap-3 pt-2">
              <button
                onClick={() => setIsConfirmLeaveOpen(false)}
                className="py-2.5 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] font-bold text-xs transition-colors cursor-pointer font-mono"
              >
                Stay
              </button>
              <button
                onClick={() => {
                  setIsConfirmLeaveOpen(false);
                  if (onLeaveRoom) onLeaveRoom();
                }}
                className="py-2.5 rounded-xl bg-red-800 hover:bg-red-700 text-white font-bold text-xs shadow-md transition-colors cursor-pointer font-mono"
              >
                Leave Room
              </button>
            </div>
          </div>
        </div>
      )}

      {/* HOW TO PLAY MODAL (CENTERED PRODUCTION-GRADE DOSSIER) */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={parchmentStyle}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => setIsRulesModalOpen(false)}
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

            <div className="space-y-2.5 pt-2 text-xs">
              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-red-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  1
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Sketch Your Secret Clue</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    When it is your turn, you receive a private clue from the case. Sketch it on the canvas before time runs out!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-amber-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  2
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Guess What Is Being Drawn</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    Type your guesses in the telegraph chat. Guessing correctly scores points for both you and the artist!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-[#7a5839] text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  3
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Spot the Secret Imposter</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    One detective was given a fake clue. Pay close attention to who is drawing something fishy or suspicious!
                  </div>
                </div>
              </div>

              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl flex items-start gap-3 shadow-sm">
                <span className="w-6 h-6 rounded-full bg-emerald-800 text-white font-mono font-black flex items-center justify-center flex-shrink-0 text-xs shadow-sm">
                  4
                </span>
                <div>
                  <div className="font-bold text-[#1a110a] font-serif">Vote, Accuse & Solve the Mystery</div>
                  <div className="text-[#5c4028] text-[11px] mt-0.5 font-mono">
                    Assemble the clues on the timeline, vote out the imposter, and solve the final mystery together.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* CORE FEATURES MODAL */}
      {isFeaturesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={parchmentStyle}
          >
            <button
              onClick={() => setIsFeaturesModalOpen(false)}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                HOW THE GAME WORKS
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">What Makes INKBOUND Fun</h3>
              <p className="text-xs text-[#5c4028] font-mono">Built for fast-paced mystery party game nights with friends.</p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2 text-xs">
              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-1 shadow-sm">
                <div className="font-bold text-[#1a110a] font-serif flex items-center gap-1.5">
                  <Pencil className="w-3.5 h-3.5 text-red-800" />
                  <span>Live Drawing Pad</span>
                </div>
                <div className="text-[#5c4028] text-[11px] font-mono">
                  Real-time drawing with brush sizes, colors, instant strokes, and undo/redo.
                </div>
              </div>
              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-1 shadow-sm">
                <div className="font-bold text-[#1a110a] font-serif flex items-center gap-1.5">
                  <Clock className="w-3.5 h-3.5 text-amber-800" />
                  <span>Case Timeline</span>
                </div>
                <div className="text-[#5c4028] text-[11px] font-mono">
                  Piece together clues hour-by-hour on the interactive evidence ledger.
                </div>
              </div>
              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-1 shadow-sm">
                <div className="font-bold text-[#1a110a] font-serif flex items-center gap-1.5">
                  <Eye className="w-3.5 h-3.5 text-[#7a5839]" />
                  <span>The Secret Imposter</span>
                </div>
                <div className="text-[#5c4028] text-[11px] font-mono">
                  One player gets a fake clue. Spot the liar before they fool everyone!
                </div>
              </div>
              <div className="p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-1 shadow-sm">
                <div className="font-bold text-[#1a110a] font-serif flex items-center gap-1.5">
                  <Smartphone className="w-3.5 h-3.5 text-emerald-800" />
                  <span>Play on Any Device</span>
                </div>
                <div className="text-[#5c4028] text-[11px] font-mono">
                  Responsive dynamic fit across smartphones, tablets, and desktop browsers.
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ABOUT INKBOUND MODAL (PRODUCT DOSSIER) */}
      {isAboutModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={parchmentStyle}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <button
              onClick={() => setIsAboutModalOpen(false)}
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

      {/* CASES ARCHIVE MODAL */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-2xl w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 max-h-[85vh] overflow-y-auto text-[#221711] select-none my-auto"
            style={parchmentStyle}
          >
            <button
              onClick={() => setIsCasesModalOpen(false)}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                BUREAU FILES // ACTIVE CASES
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">Active Case Archives</h3>
              <p className="text-xs text-[#5c4028] font-mono">Select or inspect cases available for investigation:</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5 pt-2">
              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-red-800 uppercase font-black">Vault Heist</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">The Midnight Museum</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "The Eye of Osiris blue diamond vanished at 11:44 PM during an electrical blackout."
                </p>
                <div className="text-[10px] font-mono text-red-800 font-bold">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-[#7a5839] uppercase font-black">Luxury Rail</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">The Grand Express</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "An encrypted ledger was extracted from the luxury coach between Paris and Vienna."
                </p>
                <div className="text-[10px] font-mono text-[#7a5839] font-bold">4 Suspects • Normal</div>
              </div>

              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-2 shadow-sm">
                <span className="text-[10px] font-mono text-amber-800 uppercase font-black">Gothic Manor</span>
                <h4 className="text-sm font-black text-[#1a110a] font-serif">Blackwood Poisoning</h4>
                <p className="text-[11px] text-[#4a3522] leading-relaxed font-serif italic">
                  "Lord Blackwood was found unconscious beside his vintage 1928 decanter."
                </p>
                <div className="text-[10px] font-mono text-amber-800 font-bold">4 Suspects • Normal</div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* LEADERBOARD / HALL OF FAME MODAL */}
      {isLeaderboardModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={parchmentStyle}
          >
            <button
              onClick={() => setIsLeaderboardModalOpen(false)}
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

      {/* EDIT DETECTIVE PROFILE MODAL */}
      {isProfileModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-3 sm:p-4 overflow-y-auto animate-fadeIn">
          <div
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-2xl w-[min(94vw,42rem)] p-6 sm:p-7 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden my-auto"
            style={parchmentStyle}
          >
            <button
              onClick={() => setIsProfileModalOpen(false)}
              className="absolute top-5 right-5 w-8 h-8 rounded-xl bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] flex items-center justify-center transition-colors cursor-pointer shadow-sm"
            >
              <X className="w-4 h-4" />
            </button>

            <div className="text-left space-y-1">
              <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                DETECTIVE CREDENTIALS
              </span>
              <h3 className="text-xl font-black text-[#1a110a] font-serif tracking-wide pt-1">Edit Detective Profile</h3>
              <p className="text-xs text-[#5c4028] font-mono">Customize your official badge name and insignia.</p>
            </div>

            <form onSubmit={handleSaveProfile} className="space-y-4 pt-2">
              <div>
                <label className="block text-xs font-mono font-bold text-[#3e2b1b] mb-2">Choose Badge Insignia</label>
                <AvatarPicker value={selectedAvatar} onChange={setSelectedAvatar} className="sm:grid-cols-4 xl:grid-cols-8" />
              </div>

              <div>
                <label className="block text-xs font-mono font-bold text-[#3e2b1b] mb-1.5">Official Detective Callsign</label>
                <input
                  type="text"
                  maxLength={18}
                  value={nicknameInput}
                  onChange={(e) => setNicknameInput(e.target.value)}
                  className="w-full px-3.5 py-2.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-xl text-[#1a110a] text-sm outline-none font-mono focus:border-red-800 shadow-inner"
                  required
                />
              </div>

              <button
                type="submit"
                className="w-full py-3 bg-red-800 hover:bg-red-700 text-white font-mono font-bold rounded-xl text-xs uppercase tracking-wider transition-all shadow-md cursor-pointer border border-red-950"
              >
                Save Credentials
              </button>
            </form>
          </div>
        </div>
      )}
    </>
  );
};
