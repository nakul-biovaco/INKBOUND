import React, { useState, useEffect, useRef } from 'react';
import { BookOpen, Clock, Sparkles, CheckCircle } from 'lucide-react';
import { AuthoritativeGameState, TheorySubmission } from '../types/game';
import { Player } from '../types/player';
import { Room } from '../types/room';
import { GameService } from '../services/gameService';
import { BackendClient } from '../realtime/backendClient';
import { GameHeader } from '../components/common/GameHeader';
import { DrawingCanvas } from '../components/canvas/DrawingCanvas';
import { InvestigationBoard } from '../components/investigation/InvestigationBoard';
import { FinalTheoryModal } from '../components/accusation/FinalTheoryModal';
import { CinematicReveal } from '../components/reveal/CinematicReveal';
import { ResultsScreen } from '../components/results/ResultsScreen';
import { ClueDiscoveredCard } from '../components/common/ClueDiscoveredCard';
import { DEFAULT_EVIDENCE_SKETCHES } from '../utils/defaultSketches';
import { SoundService } from '../services/soundService';

interface GameProps {
  room: Room;
  initialState: AuthoritativeGameState;
  currentUser: Player;
  onExitGame: () => void;
  onReturnToLobby?: () => void;
  onGameStateChange?: (state: AuthoritativeGameState) => void;
}

interface GameBanner {
  id: string;
  type: 'solved' | 'story' | 'reveal' | 'turn' | 'status';
  title: string;
  subtitle?: string;
  pointsText?: string;
  badge?: string;
}

const getClueStorageKey = (roomId: string, turnIndex: number) =>
  `inkbound_chosen_clue_${roomId}_turn_${turnIndex}`;

const saveStoredClue = (roomId: string, turnIndex: number, optionIndex: number, objective: string) => {
  try {
    const data = JSON.stringify({ optionIndex, objective, turnIndex, roomId, timestamp: Date.now() });
    if (typeof sessionStorage !== 'undefined') sessionStorage.setItem(getClueStorageKey(roomId, turnIndex), data);
    if (typeof localStorage !== 'undefined') localStorage.setItem(getClueStorageKey(roomId, turnIndex), data);
  } catch (e) {
    console.warn('[Game] Storage save failed', e);
  }
};

const getStoredClue = (roomId: string, turnIndex: number): { optionIndex: number; objective: string; turnIndex: number } | null => {
  try {
    const key = getClueStorageKey(roomId, turnIndex);
    const raw =
      (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(key) : null) ||
      (typeof localStorage !== 'undefined' ? localStorage.getItem(key) : null);
    if (raw) return JSON.parse(raw);
  } catch {
    // ignore
  }
  return null;
};

export const Game: React.FC<GameProps> = ({
  room,
  initialState,
  currentUser,
  onExitGame,
  onReturnToLobby,
  onGameStateChange,
}) => {
  const [gameState, setGameState] = useState<AuthoritativeGameState>(initialState);
  const channel = GameService.getChannel(room.id);
  const backend = BackendClient.getInstance();

  // Authoritative server story selection state
  const [isStorySelection, setIsStorySelection] = useState<boolean>(
    gameState.status === 'STORY_SELECTION' || (gameState.status as string) === 'CASE_INTRO'
  );
  const [storyChooserId, setStoryChooserId] = useState<string | null>(null);
  const [storyChooserName, setStoryChooserName] = useState<string>('');
  const [offeredStories, setOfferedStories] = useState<Array<{ storyId: string; title: string; genre: string; difficulty: string; description: string }>>([]);
  const [selectedStoryBriefing, setSelectedStoryBriefing] = useState<{ title: string; genre: string; description: string } | null>(null);

  // Authoritative drawer prompt options & persistent secret clue
  const initialStoredClue = getStoredClue(room.id, initialState.turnIndex);
  const [drawerPromptOptions, setDrawerPromptOptions] = useState<Array<{ optionIndex: number; previewText: string; difficulty: string }>>([]);
  const [secretDrawObjective, setSecretDrawObjective] = useState<string | null>(
    initialStoredClue?.objective || null
  );
  const [secretDrawHint, setSecretDrawHint] = useState<string | null>(null);
  const [publicHint, setPublicHint] = useState<string | null>(null);
  const [publicWordLengths, setPublicWordLengths] = useState<number[] | null>(null);
  const [publicFirstLetters, setPublicFirstLetters] = useState<string[] | null>(null);

  const cleanCardText = (txt: string): string => {
    if (!txt) return 'Clue';
    let clean = txt
      .replace(/^#*\s*\d+\s*[—–-]\s*/, '')
      .replace(/^(finding|discovering|getting into|picking up|refusing)\s+(an?\s+|the\s+)?/i, '')
      .replace(/\s+(while cleaning|out of \w+|near the \w+|in the \w+).*$/i, '')
      .replace(/^A\s+|^An\s+|^The\s+/i, '')
      .replace(/[.!?:;]+$/, '')
      .trim();
    if (/refusing.*fare/i.test(txt)) return 'Taxi Fare';
    if (/dispatcher.*voice|radio crackles/i.test(txt)) return 'Dispatch Radio';
    if (/fender-bender|car crash/i.test(txt)) return 'Car Crash';
    const words = clean.split(/\s+/).filter(Boolean);
    const picked = words.length > 2 ? words.slice(-2) : words;
    return picked.map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()).join(' ');
  };

  // Integrated HUD Game Alert Banner (replaces fragmented floating vibe-coded cards)
  const [gameBanner, setGameBanner] = useState<GameBanner | null>(null);
  const bannerTimerRef = useRef<any>(null);

  // Big Parchment Clue Discovered Card modal (15s reading grace period with cross close button)
  const [clueCardData, setClueCardData] = useState<{
    isOpen: boolean;
    clueNumber: number;
    revealedText: string;
    solvedObjective?: string | null;
    solverName?: string | null;
    drawerName?: string | null;
    storyTitle?: string | null;
    durationSeconds?: number;
  }>({
    isOpen: false,
    clueNumber: 1,
    revealedText: '',
  });

  const showGameBanner = (banner: GameBanner, durationMs = 4500) => {
    if (bannerTimerRef.current) clearTimeout(bannerTimerRef.current);
    setGameBanner(banner);
    bannerTimerRef.current = setTimeout(() => {
      setGameBanner(null);
    }, durationMs);
  };

  // Multi-factor drawer check: ID match, backend client ID match, or nickname match with active drawer
  const myBackendId = backend.getPlayerId();
  const currentDrawer = gameState.players.find((p) => p.id === gameState.currentTurnPlayerId);
  const isDrawer = Boolean(
    (gameState.currentTurnPlayerId && currentUser?.id && gameState.currentTurnPlayerId === currentUser.id) ||
    (gameState.currentTurnPlayerId && myBackendId && gameState.currentTurnPlayerId === myBackendId) ||
    (currentDrawer && currentUser && currentDrawer.nickname.trim().toLowerCase() === currentUser.nickname.trim().toLowerCase())
  );

  const updateState = (next: AuthoritativeGameState) => {
    setGameState(next);
    if (onGameStateChange) {
      onGameStateChange(next);
    }
  };

  // Wire BackendClient real-time authoritative events
  useEffect(() => {
    const unsubChooser = backend.on('STORY_CHOOSER_SELECTED', (payload: any) => {
      setIsStorySelection(true);
      setStoryChooserId(payload.chooserPlayerId);
      setStoryChooserName(payload.chooserName);
    });

    const unsubStoryOptions = backend.on('STORY_OPTIONS', (payload: any) => {
      // Sent ONLY to the chooser
      if (payload?.options) {
        setOfferedStories(payload.options);
        setIsStorySelection(true);
      }
    });

    const unsubStorySelected = backend.on('STORY_SELECTED', (payload: any) => {
      SoundService.playDramaticSting();
      setIsStorySelection(false);
      setSelectedStoryBriefing(null);
      showGameBanner({
        id: 'story-selected',
        type: 'story',
        badge: 'CASE FILE ASSIGNED',
        title: `"${payload.title}"`,
        subtitle: payload.genre || 'Mystery Investigation',
      }, 5000);
      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentCase: {
          id: payload.storyId,
          title: payload.title,
          genre: payload.genre,
          setting: payload.setting || 'Crime Scene',
          description: payload.description,
          characters: payload.characters || [],
          truth: payload.truth || '',
          culprit: payload.culprit || '',
          motive: payload.motive || '',
          timeline: payload.timeline || [],
          evidence: payload.evidence || [],
          clues: payload.clues || [],
          distorterObjective: payload.distorter_objective || 'Mislead investigators regarding the timeline sequence.',
          difficulty: payload.difficulty || 'NORMAL',
        },
      }));
    });

    const unsubTurnStarted = backend.on('TURN_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setGameBanner(null);
      setIsStorySelection(false);
      setSelectedStoryBriefing(null);
      setPublicHint(null);
      setPublicWordLengths(null);
      setPublicFirstLetters(null);

      const newTurn = payload.turnIndex || 0;
      const stored = getStoredClue(room.id, newTurn);
      if (stored && stored.objective) {
        setSecretDrawObjective(stored.objective);
        setDrawerPromptOptions([]);
      } else {
        setSecretDrawObjective(null);
        setSecretDrawHint(null);
        setDrawerPromptOptions([]);
      }

      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: newTurn,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
      }));
    });

    const unsubDrawingStarted = backend.on('DRAWING_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setIsStorySelection(false);
      if (payload?.category || payload?.hint) {
        setPublicHint(payload.category || payload.hint);
      }
      if (payload?.wordLengths) {
        setPublicWordLengths(payload.wordLengths);
      }
      if (payload?.firstLetters) {
        setPublicFirstLetters(payload.firstLetters);
      }

      const newTurn = payload.turnIndex || 0;
      const stored = getStoredClue(room.id, newTurn);
      if (stored && stored.objective) {
        setSecretDrawObjective(stored.objective);
        setDrawerPromptOptions([]);
      }

      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: newTurn,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
      }));
    });

    const unsubPromptOptions = backend.on('PROMPT_OPTIONS', (payload: any) => {
      // Sent ONLY to active drawer
      const stored = getStoredClue(room.id, gameState.turnIndex);
      if (stored && stored.objective) {
        // Clue already fixed in storage for this turn! Do not show modal
        setSecretDrawObjective(stored.objective);
        setDrawerPromptOptions([]);
        backend.selectPrompt(stored.optionIndex);
        return;
      }
      if (payload?.options) {
        setDrawerPromptOptions(payload.options);
      }
    });

    const unsubSecretDrawObjective = backend.on('SECRET_DRAW_OBJECTIVE', (payload: any) => {
      // Sent ONLY to active drawer
      setDrawerPromptOptions([]);
      setSecretDrawObjective(payload.objective);
      setSecretDrawHint(payload.hint || null);
      saveStoredClue(room.id, gameState.turnIndex, 0, payload.objective);
    });

    const unsubClueSolved = backend.on('CLUE_SOLVED', (payload: any) => {
      SoundService.playSuccess();
      showGameBanner({
        id: 'clue-solved',
        type: 'solved',
        badge: 'CLUE SOLVED',
        title: `${payload.solverName} solved the clue!`,
        subtitle: `"${payload.solvedObjective}"`,
        pointsText: `+${payload.scoreAward?.solverPoints || 150} pts (${payload.solverName}) • +${payload.scoreAward?.drawerPoints || 100} pts (${payload.drawerName})`,
      }, 5500);

      if (payload.updatedScores) {
        setGameState((prev) => ({
          ...prev,
          players: prev.players.map((p) => ({
            ...p,
            score: payload.updatedScores[p.id] ?? p.score,
          })),
        }));
      }
    });

    const unsubStoryReveal = backend.on('STORY_REVEAL', (payload: any) => {
      SoundService.playDramaticSting();
      // Show big vintage parchment clue discovery card with 15s grace period and cross button
      setClueCardData({
        isOpen: true,
        clueNumber: payload.solvedCount || 1,
        revealedText: payload.revealedText || 'A critical piece of evidence has been uncovered in this mystery.',
        solvedObjective: payload.solvedObjective || null,
        solverName: payload.solverName || null,
        drawerName: payload.drawerName || null,
        storyTitle: payload.storyTitle || gameState.currentCase?.title || null,
        durationSeconds: payload.revealSeconds || 15,
      });
    });

    const unsubNextTurn = backend.on('NEXT_TURN', (_payload: any) => {
      SoundService.playTurnStart();
      setClueCardData((prev) => ({ ...prev, isOpen: false }));
      showGameBanner({
        id: 'next-turn',
        type: 'turn',
        badge: 'ROUND COMPLETE',
        title: "Next detective's turn to draw!",
        subtitle: 'Preparing secret clues for the next turn...',
      }, 3500);
    });

    const unsubPlayerLeft = backend.on('PLAYER_LEFT', (payload: any) => {
      if (!payload?.playerId) return;
      const player = gameState.players.find((p) => p.id === payload.playerId);
      showGameBanner({
        id: 'player-left',
        type: 'status',
        badge: 'STATUS UPDATE',
        title: `${player?.nickname || 'A detective'} left the room.`,
      }, 3000);
      setGameState((prev) => ({
        ...prev,
        players: prev.players.map((p) => p.id === payload.playerId ? { ...p, isOnline: false } : p),
      }));
    });

    const unsubPlayerReconnected = backend.on('PLAYER_RECONNECTED', (payload: any) => {
      showGameBanner({
        id: 'player-back',
        type: 'status',
        badge: 'STATUS UPDATE',
        title: `${payload?.displayName || 'A detective'} came back!`,
      }, 3000);

      const targetTurn = payload?.gameState?.turnIndex ?? gameState.turnIndex;
      const stored = getStoredClue(room.id, targetTurn);

      if (stored && stored.objective) {
        // Clue in storage takes precedence - DO NOT prompt user again!
        setSecretDrawObjective(stored.objective);
        setDrawerPromptOptions([]);
      } else if (payload?.isDrawer && payload?.drawerPrivateState) {
        if (payload.drawerPrivateState.selectedObjective || payload.drawerPrivateState.objective) {
          const obj = payload.drawerPrivateState.selectedObjective || payload.drawerPrivateState.objective;
          setSecretDrawObjective(obj);
          setDrawerPromptOptions([]);
          saveStoredClue(room.id, targetTurn, 0, obj);
        } else if (payload.drawerPrivateState.options && payload.drawerPrivateState.options.length > 0) {
          setDrawerPromptOptions(payload.drawerPrivateState.options);
        }
        if (payload.drawerPrivateState.hint) {
          setSecretDrawHint(payload.drawerPrivateState.hint);
        }
      }

      if (payload?.gameState?.wordLengths) {
        setPublicWordLengths(payload.gameState.wordLengths);
      }
      if (payload?.gameState?.firstLetters) {
        setPublicFirstLetters(payload.gameState.firstLetters);
      }
      if (payload?.gameState?.category || payload?.gameState?.hint) {
        setPublicHint(payload.gameState.category || payload.gameState.hint);
      }

      setGameState((prev) => ({
        ...prev,
        ...(payload?.gameState
          ? {
              status:
                payload.gameState.state === 'DRAWING' ||
                payload.gameState.state === 'PROMPT_SELECTION' ||
                payload.gameState.state === 'ROUND_START' ||
                payload.gameState.state === 'GUESSING' ||
                payload.gameState.state === 'CLUE_SOLVED' ||
                payload.gameState.state === 'STORY_REVEAL' ||
                payload.gameState.state === 'NEXT_TURN' ||
                (payload.gameState.turnIndex !== undefined && payload.gameState.turnIndex >= 0)
                  ? 'PLAYER_DRAWING'
                  : payload.gameState.state === 'FINAL_INVESTIGATION'
                  ? 'FINAL_THEORY'
                  : prev.status,
              currentTurnPlayerId: payload.gameState.currentDrawerId,
              turnIndex: payload.gameState.turnIndex,
              turnStartedAt: payload.gameState.roundStartedAt ? new Date(payload.gameState.roundStartedAt).toISOString() : null,
              turnEndsAt: payload.gameState.roundEndsAt ? new Date(payload.gameState.roundEndsAt).toISOString() : null,
            }
          : {}),
        players: payload?.gameState
          ? payload.gameState.players.map((p: any) => ({
              id: p.playerId,
              nickname: p.displayName,
              avatar: p.avatar,
              isHost: p.isHost,
              isReady: p.isReady,
              score: p.score || 0,
              isOnline: p.isConnected !== false,
              joinedAt: new Date(p.joinedAt || Date.now()).toISOString(),
              lastSeenAt: new Date().toISOString(),
            }))
          : prev.players.map((p) => p.id === payload?.playerId ? { ...p, isOnline: true } : p),
      }));

      if (payload?.gameState?.hint) {
        setPublicHint(payload.gameState.hint);
      }
    });

    const unsubFinalInvestigation = backend.on('FINAL_INVESTIGATION', () => {
      SoundService.playDramaticSting();
      setGameState((prev) => ({ ...prev, status: 'FINAL_THEORY' }));
    });

    const unsubGameEnd = backend.on('GAME_END', (_payload: any) => {
      SoundService.playSuccess();
      setGameState((prev) => ({ ...prev, status: 'RESULTS' }));
    });

    return () => {
      unsubChooser();
      unsubStoryOptions();
      unsubStorySelected();
      unsubTurnStarted();
      unsubDrawingStarted();
      unsubPromptOptions();
      unsubSecretDrawObjective();
      unsubClueSolved();
      unsubStoryReveal();
      unsubNextTurn();
      unsubPlayerLeft();
      unsubPlayerReconnected();
      unsubFinalInvestigation();
      unsubGameEnd();
      if (bannerTimerRef.current) clearTimeout(bannerTimerRef.current);
    };
  }, [backend, gameState.players, gameState.turnIndex, room.id]);


  // Automated Bot Turn execution: if a bot's turn is active, host executes their turn
  const isHost = currentUser.id === room.hostId || currentUser.isHost;
  useEffect(() => {
    if (gameState.status !== 'PLAYER_DRAWING') return;
    if (!isHost) return;

    const currentTurnPlayer = gameState.players.find(
      (p) => p.id === gameState.currentTurnPlayerId
    );
    if (!currentTurnPlayer || !currentTurnPlayer.id.startsWith('bot-')) return;

    const timer = setTimeout(() => {
      const sketchItem =
        DEFAULT_EVIDENCE_SKETCHES[gameState.turnIndex % DEFAULT_EVIDENCE_SKETCHES.length];
      const updated = GameService.submitDrawing(
        gameState,
        currentTurnPlayer.id,
        sketchItem.sketch
      );
      setGameState(updated);
    }, 2500);

    return () => clearTimeout(timer);
  }, [gameState.status, gameState.currentTurnPlayerId, isHost, gameState]);

  // Periodic poll fallback to ensure multi-tab consistency
  useEffect(() => {
    const interval = setInterval(() => {
      const freshState = GameService.getGameState(room.id);
      if (freshState && freshState.sequenceNumber > gameState.sequenceNumber) {
        setGameState(freshState);
      }
    }, 1000);
    return () => clearInterval(interval);
  }, [gameState.sequenceNumber, room.id]);

  // Retrieve current player's secret clue (RLS-guarded logic)
  const secretClue = GameService.getPlayerClue(gameState.id, currentUser.id, gameState.status);

  // --- Actions ---

  const handleSubmitDrawing = (_previewDataUrl: string) => {
    // The backend owns turn progression. Never advance a local-only game state here.
    backend.endDrawing();
  };

  const handleSlotTimelineEvidence = (slotTime: string, evidenceId: string | null) => {
    const updated = GameService.updateTimeline(gameState, slotTime, evidenceId, currentUser.id);
    updateState(updated);
  };

  const handleAddConnection = (fromId: string, toId: string, label: string) => {
    const updated = GameService.addEvidenceConnection(gameState, fromId, toId, label, currentUser.id);
    updateState(updated);
  };

  const handleProceedToTheory = () => {
    const updated = GameService.goToFinalTheory(gameState);
    updateState(updated);
  };

  const handleSubmitTheory = (theory: TheorySubmission) => {
    const updated = GameService.submitTheory(gameState, theory);
    updateState(updated);
  };

  const handleLockAccusations = () => {
    const updated = GameService.lockAccusationsAndReveal(gameState);
    updateState(updated);
  };

  const handleProceedToResults = () => {
    const updated = GameService.goToResults(gameState);
    updateState(updated);
  };

  const handleReturnToLobby = () => {
    const updated = GameService.returnToLobby(gameState);
    updateState(updated);
    if (onReturnToLobby) {
      onReturnToLobby();
    } else {
      onExitGame();
    }
  };

  const handleChooseStory = (storyId: string) => {
    backend.chooseStory(storyId);
    setIsStorySelection(false);
  };

  const handleSelectPrompt = (optionIndex: number, chosenText?: string) => {
    const opt = drawerPromptOptions.find((o) => o.optionIndex === optionIndex);
    const text = chosenText || opt?.previewText || 'Secret Clue';
    saveStoredClue(room.id, gameState.turnIndex, optionIndex, text);
    backend.selectPrompt(optionIndex);
    setSecretDrawObjective(text);
    setDrawerPromptOptions([]);
  };

  return (

    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-30 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* INTEGRATED HUD GAME ALERT BANNER (Non-intrusive top-right toast) */}
      {gameBanner && (
        <div className="fixed top-4 right-4 z-50 max-w-md w-[92vw] sm:w-[400px] animate-fadeIn select-none pointer-events-auto">
          <div
            onClick={() => setGameBanner(null)}
            className={`cursor-pointer rounded-2xl p-3 shadow-2xl flex items-center justify-between gap-3 border backdrop-blur-md transition-all ${
              gameBanner.type === 'solved'
                ? 'bg-emerald-950/95 border-emerald-500 text-emerald-100 shadow-[0_0_30px_rgba(16,185,129,0.35)] hover:bg-emerald-900/95'
                : gameBanner.type === 'story'
                ? 'bg-amber-950/95 border-amber-500 text-amber-100 shadow-[0_0_30px_rgba(245,158,11,0.3)] hover:bg-amber-900/95'
                : gameBanner.type === 'reveal'
                ? 'bg-purple-950/95 border-purple-500 text-purple-100 shadow-[0_0_30px_rgba(168,85,247,0.3)] hover:bg-purple-900/95'
                : gameBanner.type === 'turn'
                ? 'bg-sky-950/95 border-sky-500 text-sky-100 shadow-[0_0_30px_rgba(14,165,233,0.3)] hover:bg-sky-900/95'
                : 'bg-slate-900/95 border-slate-600 text-slate-200 hover:bg-slate-800/95'
            }`}
          >
            <div className="flex items-center gap-3 min-w-0">
              <div
                className={`w-9 h-9 rounded-xl flex items-center justify-center shrink-0 border ${
                  gameBanner.type === 'solved'
                    ? 'bg-emerald-500/20 border-emerald-400 text-emerald-300'
                    : gameBanner.type === 'story'
                    ? 'bg-amber-500/20 border-amber-400 text-amber-300'
                    : gameBanner.type === 'reveal'
                    ? 'bg-purple-500/20 border-purple-400 text-purple-300'
                    : 'bg-sky-500/20 border-sky-400 text-sky-300'
                }`}
              >
                {gameBanner.type === 'solved' ? (
                  <CheckCircle className="w-5 h-5 animate-bounce" />
                ) : gameBanner.type === 'story' ? (
                  <Sparkles className="w-5 h-5 animate-pulse" />
                ) : gameBanner.type === 'reveal' ? (
                  <BookOpen className="w-5 h-5" />
                ) : (
                  <Clock className="w-5 h-5 animate-spin" />
                )}
              </div>

              <div className="min-w-0 text-left">
                <div className="flex items-center gap-2">
                  <span className="text-[10px] font-mono font-bold uppercase tracking-wider opacity-90">
                    {gameBanner.badge}
                  </span>
                  {gameBanner.pointsText && (
                    <span className="text-[11px] font-mono font-bold text-emerald-300 hidden sm:inline">
                      • {gameBanner.pointsText}
                    </span>
                  )}
                </div>
                <div className="text-sm font-bold text-white truncate font-serif">
                  {gameBanner.title}
                </div>
                {gameBanner.subtitle && (
                  <div className="text-xs text-slate-300 truncate font-sans">
                    {gameBanner.subtitle}
                  </div>
                )}
              </div>
            </div>

            <button
              type="button"
              onClick={(e) => {
                e.stopPropagation();
                setGameBanner(null);
              }}
              className="px-2.5 py-1 rounded-lg bg-black/40 hover:bg-black/60 text-white/80 hover:text-white text-xs font-mono font-bold transition-colors shrink-0"
              title="Dismiss"
            >
              ×
            </button>
          </div>
        </div>
      )}

      {/* SKRIBBL-STYLE CLUE PICKER (Only shown to active drawer if clue hasn't been chosen yet) */}
      {drawerPromptOptions.length > 0 && isDrawer && !secretDrawObjective && (
        <div className="fixed inset-0 z-50 bg-black/80 backdrop-blur-sm flex items-center justify-center p-4 select-none">
          <div className="max-w-2xl w-full bg-[#0e1320] border-2 border-red-500/80 rounded-3xl p-6 sm:p-8 shadow-[0_0_50px_rgba(220,38,38,0.35)] text-center animate-fadeIn relative">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-red-500/15 border border-red-500/40 text-red-300 font-mono text-xs uppercase tracking-widest font-bold mb-2">
              <Sparkles className="w-3.5 h-3.5 text-red-400" /> YOUR TURN TO DRAW
            </div>

            <h2 className="text-2xl sm:text-3xl font-black font-serif text-white tracking-wide mb-1">
              Choose a Secret Clue
            </h2>
            <p className="text-xs sm:text-sm text-slate-400 mb-6">
              Pick 1 clue below to sketch for the room. Others will guess while you draw!
            </p>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 text-left">
              {drawerPromptOptions.map((opt) => (
                <button
                  key={opt.optionIndex}
                  type="button"
                  onMouseEnter={() => SoundService.playCardFlip()}
                  onClick={() => {
                    SoundService.playStamp();
                    handleSelectPrompt(opt.optionIndex, cleanCardText(opt.previewText));
                  }}
                  className="group relative p-5 rounded-2xl bg-[#161c2e] hover:bg-[#1e2740] border-2 border-slate-700 hover:border-red-500 transition-all text-left shadow-lg hover:shadow-red-500/25 hover:-translate-y-1 cursor-pointer flex flex-col justify-between"
                >
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-[10px] font-mono text-amber-400 font-bold uppercase tracking-wider">
                        Card #{opt.optionIndex + 1}
                      </span>
                      <span
                        className={`px-2 py-0.5 rounded text-[9px] font-mono font-bold uppercase border ${
                          opt.difficulty?.toLowerCase() === 'easy'
                            ? 'bg-emerald-950/80 text-emerald-300 border-emerald-500/60'
                            : opt.difficulty?.toLowerCase() === 'hard'
                            ? 'bg-purple-950/80 text-purple-300 border-purple-500/60'
                            : 'bg-amber-950/80 text-amber-300 border-amber-500/60'
                        }`}
                      >
                        {opt.difficulty || 'NORMAL'}
                      </span>
                    </div>

                    <div className="text-sm sm:text-base font-bold text-white group-hover:text-red-300 font-serif leading-snug">
                      "{cleanCardText(opt.previewText)}"
                    </div>
                  </div>

                  <div className="mt-5 w-full py-2.5 rounded-xl bg-red-600 group-hover:bg-red-500 text-white text-xs font-bold font-mono uppercase tracking-wider text-center transition-colors shadow">
                    Draw This Clue →
                  </div>
                </button>
              ))}
            </div>

            <div className="mt-5 flex items-center justify-between text-xs font-mono text-slate-500 pt-3 border-t border-slate-800">
              <span>Auto-picks first option if not chosen</span>
              <button
                type="button"
                onClick={() => {
                  if (drawerPromptOptions.length > 0) {
                    handleSelectPrompt(drawerPromptOptions[0].optionIndex, drawerPromptOptions[0].previewText);
                  }
                }}
                className="text-slate-400 hover:text-white underline cursor-pointer"
              >
                Auto-Pick & Start
              </button>
            </div>
          </div>
        </div>
      )}

      {/* 1. DYNAMIC STORY SELECTION & CASE DOSSIER PHASE */}
      {(isStorySelection || (gameState.status === 'STORY_SELECTION' && !gameState.currentTurnPlayerId && gameState.turnIndex < 0)) &&
        gameState.status !== 'PLAYER_DRAWING' &&
        gameState.status !== 'FINAL_THEORY' &&
        gameState.status !== 'RESULTS' && (
        <div className="relative z-10 flex flex-col min-h-screen justify-between">
          <GameHeader
            currentUser={currentUser}
            roomCode={room.code}
            playerCount={gameState.players.length}
            maxPlayers={8}
            currentPhase="STORY_SELECTION"
            caseTitle={selectedStoryBriefing ? selectedStoryBriefing.title : (gameState.currentCase?.title && gameState.currentCase.title !== 'The Midnight Museum Heist' ? gameState.currentCase.title : 'Mystery Case Selection')}
            roundText="Story Selection"
            onLeaveRoom={onExitGame}
          />

          <main className="flex-1 max-w-5xl mx-auto px-4 py-8 flex items-center justify-center w-full">
            {selectedStoryBriefing ? (
              /* GRAND CASE BRIEFING (After Story is Picked) */
              <div className="w-full bg-[#0e131f]/95 border border-amber-500/60 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6">
                <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-amber-500/10 border border-amber-500/30 text-amber-400 font-mono text-xs uppercase tracking-widest font-bold">
                  <Sparkles className="w-4 h-4" /> Mystery Chosen!
                </div>

                <h1 className="text-3xl sm:text-5xl font-black text-white font-serif tracking-wide">
                  {selectedStoryBriefing.title}
                </h1>

                <div className="flex items-center justify-center gap-4 text-xs font-mono text-slate-400">
                  <span className="px-3 py-1 bg-slate-800/80 rounded-lg text-amber-300 font-bold uppercase">
                    {selectedStoryBriefing.genre}
                  </span>
                  <span>•</span>
                  <span className="text-slate-300">Mystery Case</span>
                </div>

                <div className="max-w-3xl mx-auto p-6 bg-slate-950/80 border border-slate-800 rounded-2xl font-serif text-base sm:text-lg text-slate-200 leading-relaxed italic text-left">
                  "{selectedStoryBriefing.description}"
                </div>

                <div className="pt-4 flex flex-col sm:flex-row items-center justify-center gap-3 text-xs font-mono text-slate-400">
                  <div className="flex items-center gap-2">
                    <Clock className="w-4 h-4 text-red-500 animate-spin" />
                    <span>Getting clues ready for the drawing round...</span>
                  </div>
                  <button
                    onClick={() => setSelectedStoryBriefing(null)}
                    className="px-4 py-1.5 rounded-lg bg-amber-500/20 hover:bg-amber-500/30 text-amber-300 border border-amber-500/40 text-xs font-bold font-mono transition-colors"
                  >
                    Ready / Dismiss (×)
                  </button>
                </div>
              </div>
            ) : currentUser.id === storyChooserId || (storyChooserId === null && offeredStories.length > 0) ? (
              /* STORY CHOOSER VIEW: 3 DYNAMIC OPTIONS */
              <div className="w-full bg-[#0e131f]/95 border border-slate-700/80 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn space-y-6">
                <div className="text-center space-y-2">
                  <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-red-500/10 border border-red-500/30 text-red-400 font-mono text-xs uppercase tracking-widest font-bold">
                    <BookOpen className="w-4 h-4" /> Your Turn to Pick the Story
                  </div>
                  <h1 className="text-2xl sm:text-4xl font-black text-white font-serif tracking-wide">
                    Pick a Mystery Story
                  </h1>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-xl mx-auto">
                    You get to pick the mystery! Choose any story below for your group to solve.
                  </p>
                </div>

                {offeredStories.length > 0 ? (
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-5 pt-2">
                    {offeredStories.map((st) => (
                      <div
                        key={st.storyId}
                        onMouseEnter={() => SoundService.playCardFlip()}
                        onClick={() => {
                          SoundService.playStamp();
                          handleChooseStory(st.storyId);
                        }}
                        className="game-card p-6 border-slate-700/80 hover:border-red-500 cursor-pointer group flex flex-col justify-between"
                      >
                        <div className="space-y-3">
                          <div className="flex items-center justify-between border-b border-slate-800 pb-2">
                            <span className="text-[10px] font-mono font-bold uppercase tracking-wider px-2 py-0.5 rounded-full bg-amber-500/15 text-amber-400 border border-amber-500/30">
                              {st.genre}
                            </span>
                            <span className="text-[10px] font-mono text-slate-400 uppercase">
                              {st.difficulty}
                            </span>
                          </div>

                          <h3 className="text-lg font-bold text-white font-serif group-hover:text-red-400 transition-colors leading-snug">
                            {st.title}
                          </h3>

                          <p className="text-xs text-slate-300 line-clamp-5 leading-relaxed font-serif">
                            "{st.description}"
                          </p>
                        </div>

                        <button className="mt-6 w-full py-3 game-btn-red text-white rounded-xl text-xs font-bold uppercase tracking-wider">
                          Play This Story →
                        </button>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="py-16 text-center space-y-4">
                    <div className="w-10 h-10 border-4 border-red-500 border-t-transparent rounded-full animate-spin mx-auto" />
                    <div className="text-sm font-mono text-slate-400">
                      Loading stories...
                    </div>
                  </div>
                )}
              </div>
            ) : (
              /* WAITING FOR CHOOSER SCREEN */
              <div className="w-full max-w-2xl bg-[#0e131f]/95 border border-slate-700/80 rounded-3xl p-8 sm:p-12 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6">
                <div className="relative w-16 h-16 mx-auto flex items-center justify-center">
                  <div className="absolute inset-0 rounded-full bg-red-500/20 animate-ping" />
                  <div className="w-14 h-14 rounded-full bg-slate-900 border border-red-500/50 flex items-center justify-center text-red-400">
                    <BookOpen className="w-6 h-6 animate-pulse" />
                  </div>
                </div>

                <div className="space-y-2">
                  <span className="text-xs font-mono uppercase tracking-widest text-red-400 font-bold">
                    PICKING A STORY
                  </span>
                  <h2 className="text-2xl sm:text-3xl font-black font-serif text-white">
                    {storyChooserName ? `${storyChooserName} is choosing the story...` : 'Picking who chooses...'}
                  </h2>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-md mx-auto leading-relaxed">
                    Your teammate is choosing a story to play. Get ready to draw and guess!
                  </p>
                </div>

                <div className="p-4 rounded-xl bg-slate-950/70 border border-slate-800 text-xs text-slate-400 font-mono flex items-center justify-center gap-2">
                  <Clock className="w-4 h-4 text-amber-400" />
                  <span>The drawing round starts right after!</span>
                </div>
              </div>
            )}
          </main>

          <footer className="relative z-10 w-full max-w-4xl mx-auto px-4 py-3 text-center text-xs font-mono text-slate-500">
            INKBOUND • Draw, Guess & Solve
          </footer>
        </div>
      )}

      {/* 2. SERIAL DRAWING PHASE */}
      {gameState.status === 'PLAYER_DRAWING' && (
        <DrawingCanvas
          gameState={gameState}
          currentUser={currentUser}
          secretClue={secretClue}
          secretDrawObjective={secretDrawObjective}
          secretDrawHint={secretDrawHint}
          publicHint={publicHint || secretDrawHint}
          publicWordLengths={publicWordLengths}
          publicFirstLetters={publicFirstLetters}
          roomCode={room.code}
          channel={channel}
          isDrawer={isDrawer}
          onSubmitDrawing={handleSubmitDrawing}
          onLeaveRoom={onExitGame}
        />
      )}


      {/* 3. INVESTIGATION BOARD & TIMELINE */}
      {gameState.status === 'INVESTIGATION' && (
        <InvestigationBoard
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          channel={channel}
          onSlotTimelineEvidence={handleSlotTimelineEvidence}
          onAddConnection={handleAddConnection}
          onProceedToTheory={handleProceedToTheory}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 4. FINAL THEORY & ACCUSATION */}
      {gameState.status === 'FINAL_THEORY' && (
        <FinalTheoryModal
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onSubmitTheory={handleSubmitTheory}
          onLockAccusations={handleLockAccusations}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 5. CINEMATIC TRUTH REVEAL */}
      {gameState.status === 'TRUTH_REVEAL' && (
        <CinematicReveal
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onProceedToResults={handleProceedToResults}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 6. FINAL RESULTS & SCOREBOARD */}
      {gameState.status === 'RESULTS' && (
        <ResultsScreen
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onReturnToLobby={handleReturnToLobby}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 7. FALLBACK RECOVERY SCREEN IF NO PHASE MATCHED */}
      {gameState.status !== 'PLAYER_DRAWING' &&
        gameState.status !== 'INVESTIGATION' &&
        gameState.status !== 'FINAL_THEORY' &&
        gameState.status !== 'TRUTH_REVEAL' &&
        gameState.status !== 'RESULTS' &&
        gameState.status !== 'STORY_SELECTION' &&
        (gameState.status as string) !== 'CASE_INTRO' &&
        (gameState.status as string) !== 'COUNTDOWN' &&
        !isStorySelection &&
        !selectedStoryBriefing && (
          <div className="relative z-10 flex flex-col min-h-screen justify-center items-center py-12 px-4 text-center font-mono">
            <div className="w-14 h-14 rounded-full border-4 border-amber-600/40 border-t-amber-400 animate-spin mb-4" />
            <h2 className="text-xl font-serif font-bold text-amber-300">GAME IN PROGRESS</h2>
            <p className="text-xs text-slate-400 mt-2">Connecting and loading game state...</p>
            <button
              onClick={handleReturnToLobby}
              className="mt-6 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg text-xs"
            >
              Return to Lobby
            </button>
          </div>
        )}

      {/* VINTAGE PARCHMENT CLUE DISCOVERED CARD MODAL (15S READING GRACE PERIOD WITH CLOSE CROSS) */}
      <ClueDiscoveredCard
        isOpen={clueCardData.isOpen}
        onClose={() => setClueCardData((prev) => ({ ...prev, isOpen: false }))}
        clueNumber={clueCardData.clueNumber}
        revealedText={clueCardData.revealedText}
        solvedObjective={clueCardData.solvedObjective}
        solverName={clueCardData.solverName}
        drawerName={clueCardData.drawerName}
        storyTitle={clueCardData.storyTitle}
        durationSeconds={clueCardData.durationSeconds || 15}
      />
    </div>
  );
};
