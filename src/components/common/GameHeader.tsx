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

  const navItems = ['Home', 'How to Play', 'Features', 'Cases', 'Leaderboard'];

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
      case 'NEXT_PLAYER':
        return 1;
      case 'ALL_TURNS_COMPLETE':
      case 'INVESTIGATION':
      case 'QUESTIONING':
      case 'TIMELINE_BUILDING':
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
    <header className="w-full relative z-40 bg-[#07080c]/90 border-b border-slate-800/80 backdrop-blur-md select-none">
      {/* 1. TOP GLOBAL NAVIGATION BAR */}
      <div className="max-w-[1440px] mx-auto px-3 sm:px-8 py-2.5 flex items-center justify-between gap-3 border-b border-slate-800/50">
        {/* Left: Official INKBOUND Logo */}
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

        {currentPhase !== 'LOBBY' ? (
          <>
            {/* Center: Nav links */}
            <nav className="hidden md:flex items-center gap-8 text-xs font-medium text-slate-300 flex-1 justify-center">
              {navItems.map((item, idx) => (
                <button
                  key={item}
                  onClick={() => handleNavClick(item)}
                  className={`hover:text-white cursor-pointer transition-colors ${
                    idx === 0 ? 'text-white font-semibold' : 'text-slate-400'
                  }`}
                >
                  {item}
                </button>
              ))}
            </nav>

            {/* Right: Audio Control, Player Profile Badge & Leave Button */}
            <div className="flex items-center gap-2 sm:gap-3 shrink-0">
              <AudioControl />

              {/* User Badge with Dropdown */}
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
                className="flex items-center gap-2 py-1.5 px-2.5 rounded-lg bg-slate-900 border border-slate-700/80 hover:border-slate-500 text-[11px] sm:text-xs text-slate-200 transition-all cursor-pointer max-w-[180px]"
              >
                <AvatarBadge avatar={currentUser.avatar} size="xs" />
                <span className="font-medium text-white max-w-[80px] truncate">
                  {currentUser.nickname}
                </span>
                <ChevronDown className="w-3 h-3 text-slate-400" />
              </button>

              {/* Red Outline Leave Button */}
              {onLeaveRoom && (
                <button
                  onClick={() => {
                    SoundService.playClick();
                    setIsConfirmLeaveOpen(true);
                  }}
                  className="px-3 py-1 rounded-lg border border-red-700/60 bg-red-950/20 hover:bg-red-900/40 text-red-400 hover:text-red-300 text-xs font-semibold transition-all flex items-center gap-1 cursor-pointer"
                >
                  <LogOut className="w-3 h-3" />
                  <span>Leave</span>
                </button>
              )}
            </div>
          </>
        ) : (
          <div className="flex items-center gap-2 sm:gap-3 shrink-0 ml-auto">
            <AudioControl />
            {onLeaveRoom && (
              <button
                onClick={() => {
                  SoundService.playClick();
                  setIsConfirmLeaveOpen(true);
                }}
                className="px-3 py-1 rounded-lg border border-red-700/60 bg-red-950/20 hover:bg-red-900/40 text-red-400 hover:text-red-300 text-xs font-semibold transition-all flex items-center gap-1 cursor-pointer"
              >
                <LogOut className="w-3 h-3" />
                <span>Leave</span>
              </button>
            )}
          </div>
        )}
      </div>

      {/* 2. SUB-HEADER: CASE TITLE, STEPPER & ROOM CODE */}
      {currentPhase !== 'LOBBY' && (
        <div className="max-w-[1440px] mx-auto px-3 sm:px-8 py-2.5 flex flex-col lg:flex-row lg:flex-wrap items-start lg:items-center justify-between gap-3 sm:gap-4">
          {/* Left: Case Title & Round */}
          <div className="w-full lg:w-auto">
            <h2 className="text-sm sm:text-base font-bold text-white font-serif tracking-wide">
              {caseTitle}
            </h2>
            <div className="text-[11px] font-mono text-slate-400">{roundText}</div>
          </div>

          {/* Center: Phase Stepper */}
          <div className="hidden lg:flex items-center gap-4 xl:gap-6 w-full lg:w-auto overflow-x-auto pb-1 lg:pb-0">
            {steps.map((step, idx) => {
              const isActive = activeStep === idx;
              const isPast = activeStep > idx;

              return (
                <div key={step.label} className="flex items-center gap-2">
                  <div className="flex flex-col items-center">
                    <div
                      className={`w-7 h-7 rounded-full flex items-center justify-center transition-all ${
                        isActive
                          ? 'bg-red-600 text-white shadow-[0_0_15px_rgba(220,38,38,0.9)] ring-2 ring-red-500'
                          : isPast
                          ? 'bg-slate-800 text-emerald-400 border border-slate-700'
                          : 'bg-slate-900/80 text-slate-500 border border-slate-800'
                      }`}
                    >
                      {step.icon}
                    </div>
                    <span
                      className={`text-[10px] font-mono uppercase mt-0.5 tracking-wider ${
                        isActive
                          ? 'text-red-400 font-bold'
                          : isPast
                          ? 'text-slate-300'
                          : 'text-slate-500'
                      }`}
                    >
                      {step.label}
                    </span>
                  </div>

                  {idx < steps.length - 1 && (
                    <div
                      className={`w-4 xl:w-6 h-[1px] -mt-3.5 ${
                        isPast ? 'bg-red-700' : 'bg-slate-800'
                      }`}
                    />
                  )}
                </div>
              );
            })}
          </div>

          {/* Right: Room Code & Player Count */}
          <div className="flex items-center gap-3">
            {/* Room Code Card */}
            <div className="flex items-center gap-2 px-3 py-1 rounded-lg bg-slate-900 border border-slate-800 text-xs font-mono">
              <span className="text-slate-400 text-[10px]">Room Code:</span>
              <span className="font-bold text-white tracking-widest">{roomCode}</span>
              <button
                onClick={handleCopy}
                title="Copy Room Code"
                className="text-slate-400 hover:text-white cursor-pointer"
              >
                {copied ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>

            {/* Players count */}
            <div className="flex items-center gap-1.5 px-3 py-1 rounded-lg bg-slate-900 border border-slate-800 text-xs font-mono text-slate-300">
              <Users className="w-3.5 h-3.5 text-slate-400" />
              <span>
                {playerCount}/{maxPlayers} Players
              </span>
            </div>
          </div>
        </div>
      )}

      {/* CONFIRM LEAVE MODAL */}
      {isConfirmLeaveOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-red-900/60 rounded-2xl max-w-sm w-full p-6 shadow-2xl space-y-4 text-center">
            <div className="w-12 h-12 rounded-full bg-red-950/80 border border-red-600 flex items-center justify-center mx-auto text-red-400 text-xl shadow">
              <LogOut className="w-6 h-6" />
            </div>
            <div>
              <h3 className="text-base font-bold text-white font-serif">Leave Room?</h3>
              <p className="text-xs text-slate-400 mt-1">
                You will leave this game and return to Home.
              </p>
            </div>
            <div className="grid grid-cols-2 gap-3 pt-2">
              <button
                onClick={() => setIsConfirmLeaveOpen(false)}
                className="py-2 rounded-xl bg-slate-800 hover:bg-slate-700 text-slate-300 font-bold text-xs transition-colors cursor-pointer"
              >
                Cancel
              </button>
              <button
                onClick={() => {
                  setIsConfirmLeaveOpen(false);
                  if (onLeaveRoom) onLeaveRoom();
                }}
                className="py-2 rounded-xl bg-red-600 hover:bg-red-700 text-white font-bold text-xs shadow-md transition-colors cursor-pointer"
              >
                Leave Room
              </button>
            </div>
          </div>
        </div>
      )}

      {/* HOW TO PLAY MODAL */}
      {isRulesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsRulesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">How to Play INKBOUND</h3>
              <p className="text-xs text-slate-400">4 simple steps to play and solve the mystery.</p>
            </div>

            <div className="space-y-3 pt-2 text-xs">
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">01</span>
                <div>
                  <div className="font-bold text-white">Draw Your Clue</div>
                  <div className="text-slate-400 text-[11px]">Everyone gets a secret clue from the story. Draw it so your friends can guess!</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">02</span>
                <div>
                  <div className="font-bold text-white">Review the Evidence Board</div>
                  <div className="text-slate-400 text-[11px]">Review all drawings together and put the story events in order.</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">03</span>
                <div>
                  <div className="font-bold text-white">Spot the Impostor</div>
                  <div className="text-slate-400 text-[11px]">One player gets fake clues! Spot who is bluffing or drawing something unusual.</div>
                </div>
              </div>

              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl flex items-start gap-3">
                <span className="font-mono text-red-400 font-bold text-sm">04</span>
                <div>
                  <div className="font-bold text-white">Make Your Final Guess</div>
                  <div className="text-slate-400 text-[11px]">Guess who did it, why, and how to score maximum points!</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* CORE FEATURES MODAL */}
      {isFeaturesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsFeaturesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Game Features</h3>
              <p className="text-xs text-slate-400">Everything you need for a fun, thrilling mystery night with friends.</p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2 text-xs">
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white flex items-center gap-1.5">
                  <Pencil className="w-3.5 h-3.5 text-rose-400" />
                  <span>Live Drawing Canvas</span>
                </div>
                <div className="text-slate-400 text-[11px]">Smooth drawing canvas with undo, redo, and instant stroke syncing.</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white flex items-center gap-1.5">
                  <Clock className="w-3.5 h-3.5 text-amber-400" />
                  <span>Case Timeline</span>
                </div>
                <div className="text-slate-400 text-[11px]">Piece together what happened from start to finish.</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white flex items-center gap-1.5">
                  <Eye className="w-3.5 h-3.5 text-purple-400" />
                  <span>Secret Imposter</span>
                </div>
                <div className="text-slate-400 text-[11px]">One player gets a fake clue and tries to blend in without getting caught!</div>
              </div>
              <div className="p-3 bg-slate-900/80 border border-slate-800 rounded-xl space-y-1">
                <div className="font-bold text-white flex items-center gap-1.5">
                  <Smartphone className="w-3.5 h-3.5 text-cyan-400" />
                  <span>Play on Any Device</span>
                </div>
                <div className="text-slate-400 text-[11px]">Play with friends on phone, tablet, or laptop seamlessly.</div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* CASES ARCHIVE MODAL */}
      {isCasesModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-2xl w-full p-6 shadow-2xl relative space-y-4 max-h-[85vh] overflow-y-auto">
            <button
              onClick={() => setIsCasesModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Mystery Stories</h3>
              <p className="text-xs text-slate-400">Browse stories available in the game.</p>
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
                  An encrypted ledger was extracted from the luxury coach between Paris and Vienna.
                </p>
                <div className="text-[10px] font-mono text-slate-500">4 Suspects • Train Coach</div>
              </div>

              <div className="p-4 bg-slate-900/60 border border-slate-800 rounded-xl space-y-2">
                <span className="text-[10px] font-mono text-amber-400 uppercase font-bold">Gothic Manor</span>
                <h4 className="text-sm font-bold text-white font-serif">The Blackwood Poisoning</h4>
                <p className="text-[11px] text-slate-400 leading-relaxed">
                  Lord Blackwood was found unconscious beside his vintage 1928 decanter.
                </p>
                <div className="text-[10px] font-mono text-slate-500">4 Suspects • Dining Hall</div>
              </div>
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
              className="absolute top-4 right-4 text-slate-400 hover:text-white cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Top Players</h3>
              <p className="text-xs text-slate-400">Highest scoring players across all games.</p>
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

      {/* EDIT DETECTIVE PROFILE MODAL */}
      {isProfileModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-start sm:items-center justify-center p-3 sm:p-4 overflow-y-auto">
          <div className="bg-[#121620] border border-slate-700/80 rounded-2xl max-w-2xl w-[min(94vw,42rem)] max-h-[calc(100vh-1.5rem)] sm:max-h-[calc(100vh-2rem)] overflow-y-auto p-5 sm:p-6 shadow-2xl relative space-y-4">
            <button
              onClick={() => setIsProfileModalOpen(false)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>

            <div className="text-left space-y-1">
              <h3 className="text-xl font-bold text-white font-serif tracking-wide">Edit Profile</h3>
              <p className="text-xs text-slate-400">Customize your player name and avatar.</p>
            </div>

            <form onSubmit={handleSaveProfile} className="space-y-4 pt-2">
              <div>
                <label className="block text-xs font-mono text-slate-400 mb-2">Choose Your Avatar</label>
                <AvatarPicker value={selectedAvatar} onChange={setSelectedAvatar} className="sm:grid-cols-4 xl:grid-cols-8" />
              </div>

              <div>
                <label className="block text-xs font-mono text-slate-400 mb-1.5">Player Nickname</label>
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
                className="w-full py-2.5 bg-gradient-to-r from-red-700 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-bold rounded-xl text-xs uppercase tracking-wider transition-all shadow-md cursor-pointer"
              >
                Save Profile
              </button>
            </form>
          </div>
        </div>
      )}
    </header>
  );
};
