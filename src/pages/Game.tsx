import React, { useState, useEffect, useRef } from 'react';
import { BookOpen, Clock, Sparkles, CheckCircle, X, MessageSquare, Users, Shield } from 'lucide-react';
import { AuthoritativeGameState, TheorySubmission } from '../types/game';
import { Player } from '../types/player';
import { Room } from '../types/room';
import { GameService } from '../services/gameService';
import { CaseManager } from '../game/CaseManager';
import { BackendClient } from '../realtime/backendClient';
import { DrawingCanvas } from '../components/canvas/DrawingCanvas';
import { InvestigationBoard } from '../components/investigation/InvestigationBoard';
import { FinalTheoryModal } from '../components/accusation/FinalTheoryModal';
import { CinematicReveal } from '../components/reveal/CinematicReveal';
import { ResultsScreen } from '../components/results/ResultsScreen';
import { ClueDiscoveredCard } from '../components/common/ClueDiscoveredCard';
import { TurnTransitionOverlay, TurnTransitionData } from '../components/common/TurnTransitionOverlay';
import { DEFAULT_EVIDENCE_SKETCHES } from '../utils/defaultSketches';
import { SoundService } from '../services/soundService';
import { getStoryArtwork } from '../utils/storyArtwork';

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

interface StoredClue {
  optionIndex: number;
  objective: string;
  turnIndex: number;
  drawerPrompt?: string | null;
  hint?: string | null;
  storyContext?: string | null;
  roomId?: string;
  timestamp?: number;
}

const saveStoredClue = (
  roomId: string,
  turnIndex: number,
  optionIndex: number,
  objective: string,
  drawerPrompt?: string | null,
  hint?: string | null,
  storyContext?: string | null
) => {
  try {
    const data = JSON.stringify({
      optionIndex,
      objective,
      drawerPrompt,
      hint,
      storyContext,
      turnIndex,
      roomId,
      timestamp: Date.now(),
    });
    if (typeof sessionStorage !== 'undefined') sessionStorage.setItem(getClueStorageKey(roomId, turnIndex), data);
    if (typeof localStorage !== 'undefined') localStorage.setItem(getClueStorageKey(roomId, turnIndex), data);
  } catch (e) {
    console.warn('[Game] Storage save failed', e);
  }
};

const getStoredClue = (roomId: string, turnIndex: number): StoredClue | null => {
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
  const initialStoryId = (initialState as any)?.storyId || initialState?.caseId || room.settings?.selectedCaseId || 'story_01_the_midnight_museum';
  const initialCase = (initialState.currentCase?.characters && initialState.currentCase.characters.length > 0)
    ? initialState.currentCase
    : CaseManager.getCase(initialStoryId);

  const [gameState, setGameState] = useState<AuthoritativeGameState>(() => ({
    ...initialState,
    caseId: initialCase.id,
    currentCase: initialCase,
  }));
  const channel = GameService.getChannel(room.id);
  const backend = BackendClient.getInstance();

  // Authoritative drawer prompt options & persistent secret clue
  const initialStoredClue = getStoredClue(room.id, initialState.turnIndex);
  const cachedBackendObjective = backend.getSecretDrawObjective();
  const [, setDrawerPromptOptions] = useState<any[]>([]);
  const [secretDrawObjective, setSecretDrawObjective] = useState<string | null>(
    cachedBackendObjective?.canonicalAnswer || cachedBackendObjective?.objective || initialStoredClue?.objective || null
  );
  const [drawerPrompt, setDrawerPrompt] = useState<string | null>(
    cachedBackendObjective?.drawerPrompt || initialStoredClue?.drawerPrompt || null
  );
  const [turnTransitionData, setTurnTransitionData] = useState<TurnTransitionData | null>(null);
  const [secretDrawHint, setSecretDrawHint] = useState<string | null>(
    cachedBackendObjective?.hint || initialStoredClue?.hint || null
  );
  const [publicHint, setPublicHint] = useState<string | null>(null);
  const [publicWordLengths, setPublicWordLengths] = useState<number[] | null>(null);
  const [publicFirstLetters, setPublicFirstLetters] = useState<string[] | null>(null);
  const [storyContext, setStoryContext] = useState<string | null>(
    cachedBackendObjective?.storyContext || initialStoredClue?.storyContext || null
  );
  const [investigationObjective, setInvestigationObjective] = useState<string | null>(null);
  const [clueHint, setClueHint] = useState<string | null>(null);
  const [revealedLetters, setRevealedLetters] = useState<Array<Array<string | null>> | null>(null);

  // Story Selection & Overview phase state (Clean standalone windows)
  const [storySelectionPhase, setStorySelectionPhase] = useState<'none' | 'choosing' | 'overview'>(() => {
    // If the game has already started (active turn running, drawing, or investigation), never show choosing!
    if (
      initialState.turnEndsAt ||
      initialState.status === 'PLAYER_DRAWING' ||
      initialState.status === 'DISCUSSION' ||
      initialState.status === 'INVESTIGATION' ||
      initialState.status === 'FINAL_THEORY' ||
      initialState.status === 'RESULTS'
    ) {
      return 'none';
    }
    if (initialState.status === 'STORY_SELECTION' || (initialState.status as any) === 'COUNTDOWN') {
      return 'choosing';
    }
    return 'none';
  });
  const [storyOptions, setStoryOptions] = useState<any[]>([]);
  const [chooserPlayerId, setChooserPlayerId] = useState<string | null>(null);
  const [chooserName, setChooserName] = useState<string>('');
  const [overviewData, setOverviewData] = useState<any>(null);
  const [overviewCountdown, setOverviewCountdown] = useState<number>(0);
  const overviewTimerRef = useRef<any>(null);

  // Synchronized player arrival tracking for the game window
  const [gameWindowSync, setGameWindowSync] = useState<{
    arrivedCount: number;
    totalCount: number;
    waitingFor: string[];
    allArrived: boolean;
  }>({
    arrivedCount: 0,
    totalCount: initialState.players?.length || 1,
    waitingFor: [],
    allArrived: false,
  });



  // Integrated HUD Game Alert Banner (replaces fragmented floating vibe-coded cards)
  const [gameBanner, setGameBanner] = useState<GameBanner | null>(null);
  const bannerTimerRef = useRef<any>(null);

  // In-game Live Chat Floating Popup Toasts (User request: game chat me koi kuch likhta toh uska popyup aaye)
  interface ChatToast {
    id: string;
    senderName: string;
    senderAvatar: string;
    text: string;
    isGuess?: boolean;
    isClose?: boolean;
    timestamp: string;
  }
  const [chatToasts, setChatToasts] = useState<ChatToast[]>([]);

  const addChatToast = (toast: ChatToast) => {
    SoundService.playPop();
    setChatToasts((prev) => {
      if (prev.some((t) => t.id === toast.id)) return prev;
      return [...prev.slice(-2), toast];
    });
    setTimeout(() => {
      setChatToasts((prev) => prev.filter((t) => t.id !== toast.id));
    }, 2800);
  };

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

  const showGameBanner = (banner: GameBanner, durationMs = 3200) => {
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

  // Active drawer watchdog: If I am the active drawer and secretDrawObjective or drawerPrompt is missing, request it from server
  useEffect(() => {
    if (isDrawer && (!secretDrawObjective || !drawerPrompt)) {
      backend.requestSecretObjective();
    }
  }, [isDrawer, secretDrawObjective, drawerPrompt, gameState.turnIndex]);

  const updateState = (next: AuthoritativeGameState) => {
    setGameState(next);
    if (onGameStateChange) {
      onGameStateChange(next);
    }
  };

  const handleEnterGameRoom = () => {
    if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
    setStorySelectionPhase('none');
    setOverviewData(null);
  };

  // Wire BackendClient real-time authoritative events
  useEffect(() => {
    const unsubChooser = backend.on('STORY_CHOOSER_SELECTED', (payload: any) => {
      setChooserPlayerId(payload.chooserPlayerId);
      setChooserName(payload.chooserName || 'A Detective');
      setStorySelectionPhase('choosing');
      SoundService.playDramaticSting();
    });

    const unsubStoryOptions = backend.on('STORY_OPTIONS', (payload: any) => {
      if (payload.options && Array.isArray(payload.options)) {
        setStoryOptions(payload.options);
        setChooserPlayerId(payload.chooserPlayerId || chooserPlayerId);
        setChooserName(payload.chooserName || chooserName || 'A Detective');
        setStorySelectionPhase('choosing');
      }
    });

    const unsubStorySelected = backend.on('STORY_SELECTED', (payload: any) => {
      SoundService.playDramaticSting();
      const targetStoryId = payload.storyId || payload.title;
      const resolvedCase = CaseManager.getCase(targetStoryId);

      // Show overview phase
      const overviewSecs = payload.overviewSeconds || 10;
      setOverviewData({
        storyId: targetStoryId,
        title: payload.title,
        genre: payload.genre,
        difficulty: payload.difficulty,
        description: payload.description,
        suspects: payload.suspects || resolvedCase?.characters || [],
        caseProgress: payload.caseProgress,
        resolvedCase,
      });
      setOverviewCountdown(overviewSecs);
      setStorySelectionPhase('overview');
      setStoryOptions([]);

      setGameState((prev) => ({
        ...prev,
        caseId: resolvedCase.id,
        currentCase: resolvedCase,
      }));

      // Countdown timer for overview
      if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
      let remaining = overviewSecs;
      overviewTimerRef.current = setInterval(() => {
        remaining--;
        setOverviewCountdown(remaining);
        if (remaining <= 0) {
          clearInterval(overviewTimerRef.current);
          setStorySelectionPhase('none');
          setOverviewData(null);
        }
      }, 1000);
    });

    const unsubTransition = backend.on('TRANSITION_TO_GAME_WINDOW', () => {
      if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
      setStorySelectionPhase('none');
    });

    const unsubSync = backend.on('GAME_WINDOW_PLAYERS_SYNC', (payload: any) => {
      setGameWindowSync({
        arrivedCount: payload.arrivedCount || 0,
        totalCount: payload.totalCount || gameState.players.length,
        waitingFor: payload.waitingFor || [],
        allArrived: Boolean(payload.allArrived),
      });
      if (payload.allArrived) {
        if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
        setStorySelectionPhase('none');
      }
    });

    const unsubTurnStarted = backend.on('TURN_STARTED', (payload: any) => {
      if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
      setStorySelectionPhase('none');
      SoundService.playTurnStart();
      setGameBanner(null);
      if (payload?.category || payload?.hint) {
        setPublicHint(payload.category || payload.hint);
      } else {
        setPublicHint(null);
      }
      if (payload?.wordLengths) {
        setPublicWordLengths(payload.wordLengths);
      } else {
        setPublicWordLengths(null);
      }
      if (payload?.firstLetters) {
        setPublicFirstLetters(payload.firstLetters);
      } else {
        setPublicFirstLetters(null);
      }
      if (payload?.storyContext) {
        setStoryContext(payload.storyContext);
      }
      if (payload?.investigationObjective) {
        setInvestigationObjective(payload.investigationObjective);
      }
      if (payload?.clueHint) {
        setClueHint(payload.clueHint);
      } else if (payload?.hint && payload.hint !== payload.category) {
        setClueHint(payload.hint);
      } else {
        setClueHint(null);
      }
      if (payload?.revealedLetters) {
        setRevealedLetters(payload.revealedLetters);
      } else {
        setRevealedLetters(null);
      }

      const newTurn = payload.turnIndex || 0;
      const stored = getStoredClue(room.id, newTurn);
      if (stored && stored.objective) {
        setSecretDrawObjective(stored.objective);
        if (stored.drawerPrompt) setDrawerPrompt(stored.drawerPrompt);
        if (stored.hint) setSecretDrawHint(stored.hint);
        if (stored.storyContext) setStoryContext(stored.storyContext);
        setDrawerPromptOptions([]);
      } else {
        const cached = backend.getSecretDrawObjective();
        if (cached && (cached.canonicalAnswer || cached.objective)) {
          const targetObj = cached.canonicalAnswer || cached.objective;
          setSecretDrawObjective(targetObj);
          setDrawerPrompt(cached.drawerPrompt || null);
          setSecretDrawHint(cached.hint || null);
          if (cached.storyContext) setStoryContext(cached.storyContext);
        } else {
          setSecretDrawObjective(null);
          setDrawerPrompt(null);
          setSecretDrawHint(null);
        }
        setDrawerPromptOptions([]);
      }

      const targetStory = payload?.storyId ? CaseManager.getCase(payload.storyId) : null;

      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: newTurn,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
        ...(targetStory ? { caseId: targetStory.id, currentCase: targetStory } : {}),
      }));
    });

    const unsubDrawingStarted = backend.on('DRAWING_STARTED', (payload: any) => {
      if (overviewTimerRef.current) clearInterval(overviewTimerRef.current);
      setStorySelectionPhase('none');
      SoundService.playTurnStart();
      if (payload?.category || payload?.hint) {
        setPublicHint(payload.category || payload.hint);
      }
      if (payload?.wordLengths) {
        setPublicWordLengths(payload.wordLengths);
      }
      if (payload?.firstLetters) {
        setPublicFirstLetters(payload.firstLetters);
      }
      if (payload?.storyContext) {
        setStoryContext(payload.storyContext);
      }
      if (payload?.investigationObjective) {
        setInvestigationObjective(payload.investigationObjective);
      }
      if (payload?.clueHint) {
        setClueHint(payload.clueHint);
      } else if (payload?.hint && payload.hint !== payload.category) {
        setClueHint(payload.hint);
      }
      if (payload?.revealedLetters) {
        setRevealedLetters(payload.revealedLetters);
      } else {
        setRevealedLetters(null);
      }

      const newTurn = payload.turnIndex || 0;
      const stored = getStoredClue(room.id, newTurn);
      if (stored && stored.objective) {
        setSecretDrawObjective(stored.objective);
        if (stored.drawerPrompt) setDrawerPrompt(stored.drawerPrompt);
        if (stored.hint) setSecretDrawHint(stored.hint);
        if (stored.storyContext) setStoryContext(stored.storyContext);
        setDrawerPromptOptions([]);
      } else {
        const cached = backend.getSecretDrawObjective();
        if (cached && (cached.canonicalAnswer || cached.objective)) {
          const targetObj = cached.canonicalAnswer || cached.objective;
          setSecretDrawObjective(targetObj);
          setDrawerPrompt(cached.drawerPrompt || null);
          setSecretDrawHint(cached.hint || null);
          if (cached.storyContext) setStoryContext(cached.storyContext);
        }
      }

      const targetStory = payload?.storyId ? CaseManager.getCase(payload.storyId) : null;

      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: newTurn,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
        ...(targetStory ? { caseId: targetStory.id, currentCase: targetStory } : {}),
      }));
    });

    const unsubHintRevealed = backend.on('HINT_LETTER_REVEALED', (payload: any) => {
      if (payload?.revealedLetters) {
        setRevealedLetters(payload.revealedLetters);
      }
    });

    const unsubPromptOptions = backend.on('PROMPT_OPTIONS', (payload: any) => {
      // Sent ONLY to active drawer
      const stored = getStoredClue(room.id, gameState.turnIndex);
      if (stored && stored.objective) {
        // Clue already fixed in storage for this turn! Do not show modal
        setSecretDrawObjective(stored.objective);
        if (stored.drawerPrompt) setDrawerPrompt(stored.drawerPrompt);
        if (stored.hint) setSecretDrawHint(stored.hint);
        if (stored.storyContext) setStoryContext(stored.storyContext);
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
      const targetObj = payload.canonicalAnswer || payload.objective;
      setSecretDrawObjective(targetObj);
      setDrawerPrompt(payload.drawerPrompt || null);
      setSecretDrawHint(payload.hint || null);
      if (payload?.storyContext) {
        setStoryContext(payload.storyContext);
      }
      const turnIdx = payload.turnIndex ?? gameState.turnIndex;
      saveStoredClue(
        room.id,
        turnIdx,
        0,
        targetObj,
        payload.drawerPrompt || null,
        payload.hint || null,
        payload.storyContext || null
      );
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

    const unsubNextTurn = backend.on('NEXT_TURN', (payload: any) => {
      SoundService.playTurnStart();
      setClueCardData((prev) => ({ ...prev, isOpen: false }));

      // Purge cached clue for prior turn so it never leaks
      try {
        if (typeof sessionStorage !== 'undefined') {
          sessionStorage.removeItem(getClueStorageKey(room.id, gameState.turnIndex));
        }
        if (typeof localStorage !== 'undefined') {
          localStorage.removeItem(getClueStorageKey(room.id, gameState.turnIndex));
        }
      } catch { }

      if (payload) {
        setTurnTransitionData({
          completedTurnIndex: payload.completedTurnIndex ?? gameState.turnIndex,
          previousDrawerId: payload.previousDrawerId || gameState.currentTurnPlayerId || '',
          previousDrawerName: payload.previousDrawerName || 'The Artist',
          revealedObjective: payload.revealedObjective || 'Mystery Clue',
          solved: Boolean(payload.solved),
          solverPlayerId: payload.solverPlayerId,
          solverName: payload.solverName,
          scoreAward: payload.scoreAward,
          nextDrawerPlayerId: payload.nextDrawerPlayerId || '',
          nextDrawerName: payload.nextDrawerName || 'Next Detective',
          nextTurnInSeconds: payload.nextTurnInSeconds || 4,
        });
      }
    });

    const unsubDrawingEnded = backend.on('DRAWING_ENDED', (payload: any) => {
      if (payload?.reason === 'TIMEOUT' && payload?.revealedObjective) {
        showGameBanner({
          id: 'timeout-reveal',
          type: 'status',
          badge: "TIME'S UP",
          title: `Nobody solved the clue!`,
          subtitle: `The secret word was: "${payload.revealedObjective}"`,
        }, 4000);
      }
    });

    const unsubPlayerLeft = backend.on('PLAYER_LEFT', (payload: any) => {
      if (!payload?.playerId) return;
      const leftPlayer = gameState.players.find((p) => p.id === payload.playerId);
      const name = leftPlayer?.nickname || 'A detective';
      showGameBanner({
        id: `player-left-${Date.now()}`,
        type: 'status',
        badge: 'DETECTIVE DEPARTED',
        title: `${name} left the room.`,
      }, 3000);
      SoundService.playLeave();
      setGameState((prev) => ({
        ...prev,
        players: prev.players.filter((p) => p.id !== payload.playerId),
      }));
    });

    const unsubPlayerJoined = backend.on('PLAYER_JOINED', (payload: any) => {
      if (!payload?.playerId) return;
      const name = payload.displayName || 'A detective';
      showGameBanner({
        id: `player-joined-${Date.now()}`,
        type: 'status',
        badge: 'NEW DETECTIVE',
        title: `${name} joined the case!`,
      }, 3000);
      SoundService.playJoin();
      setGameState((prev) => {
        if (prev.players.some((p) => p.id === payload.playerId)) {
          return {
            ...prev,
            players: prev.players.map((p) => p.id === payload.playerId ? { ...p, isOnline: true } : p),
          };
        }
        const newPlayer: Player = {
          id: payload.playerId,
          nickname: payload.displayName || 'Detective',
          avatar: payload.avatar || '🕵️‍♂️',
          isHost: Boolean(payload.isHost),
          isReady: true,
          score: payload.score || 0,
          isOnline: true,
          joinedAt: new Date().toISOString(),
          lastSeenAt: new Date().toISOString(),
        };
        return {
          ...prev,
          players: [...prev.players, newPlayer],
        };
      });
    });

    const unsubPlayersUpdated = backend.on('ROOM_PLAYERS_UPDATED', (payload: any) => {
      if (payload?.players && Array.isArray(payload.players)) {
        setGameState((prev) => ({
          ...prev,
          players: payload.players.map((p: any) => ({
            id: p.playerId || p.id,
            nickname: p.displayName || p.nickname || 'Detective',
            avatar: p.avatar || '🕵️‍♂️',
            isHost: Boolean(p.isHost),
            isReady: p.isReady !== false,
            score: p.score || 0,
            isOnline: p.isConnected !== false,
            joinedAt: p.joinedAt || new Date().toISOString(),
            lastSeenAt: new Date().toISOString(),
          })),
        }));
      }
    });

    const unsubPresence = channel.subscribePresence((presences) => {
      if (!presences || presences.length === 0) return;
      const activeIds = new Set(presences.map((p) => p.playerId));
      setGameState((prev) => {
        if (activeIds.size > 0 && prev.players.length > 1) {
          const filtered = prev.players.filter((p) => p.id === currentUser.id || activeIds.has(p.id));
          if (filtered.length !== prev.players.length) {
            return { ...prev, players: filtered };
          }
        }
        return prev;
      });
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
        if (stored.drawerPrompt) setDrawerPrompt(stored.drawerPrompt);
        if (stored.hint) setSecretDrawHint(stored.hint);
        if (stored.storyContext) setStoryContext(stored.storyContext);
        setDrawerPromptOptions([]);
      } else if (payload?.isDrawer && payload?.drawerPrivateState) {
        if (payload.drawerPrivateState.selectedObjective || payload.drawerPrivateState.objective || payload.drawerPrivateState.canonicalAnswer) {
          const obj = payload.drawerPrivateState.canonicalAnswer || payload.drawerPrivateState.selectedObjective || payload.drawerPrivateState.objective;
          setSecretDrawObjective(obj);
          setDrawerPrompt(payload.drawerPrivateState.drawerPrompt || null);
          if (payload.drawerPrivateState.hint) {
            setSecretDrawHint(payload.drawerPrivateState.hint);
          }
          if (payload.drawerPrivateState.storyContext) {
            setStoryContext(payload.drawerPrivateState.storyContext);
          }
          setDrawerPromptOptions([]);
          saveStoredClue(
            room.id,
            targetTurn,
            0,
            obj,
            payload.drawerPrivateState.drawerPrompt || null,
            payload.drawerPrivateState.hint || null,
            payload.drawerPrivateState.storyContext || null
          );
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
      if (payload?.gameState?.storyContext) {
        setStoryContext(payload.gameState.storyContext);
      }
      if (payload?.gameState?.investigationObjective) {
        setInvestigationObjective(payload.gameState.investigationObjective);
      }
      if (payload?.gameState?.clueHint) {
        setClueHint(payload.gameState.clueHint);
      } else if (payload?.gameState?.hint && payload.gameState.hint !== payload.gameState.category) {
        setClueHint(payload.gameState.hint);
      }
      if (payload?.gameState?.revealedLetters) {
        setRevealedLetters(payload.gameState.revealedLetters);
      }

      const reconnectedCase = payload?.gameState?.storyId ? CaseManager.getCase(payload.gameState.storyId) : null;

      if (
        payload?.gameState?.state === 'DRAWING' ||
        payload?.gameState?.state === 'PROMPT_SELECTION' ||
        payload?.gameState?.state === 'ROUND_START' ||
        payload?.gameState?.state === 'GUESSING' ||
        payload?.gameState?.roundEndsAt ||
        (payload?.gameState?.turnIndex !== undefined && payload.gameState.turnIndex >= 0)
      ) {
        if (overviewTimerRef.current) {
          clearInterval(overviewTimerRef.current);
          overviewTimerRef.current = null;
        }
        setStorySelectionPhase('none');
      }

      setGameState((prev) => ({
        ...prev,
        ...(reconnectedCase ? { caseId: reconnectedCase.id, currentCase: reconnectedCase } : {}),
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

    const unsubFinalInvestigation = backend.on('FINAL_INVESTIGATION', (payload: any) => {
      SoundService.playDramaticSting();
      const targetStoryId = payload?.storyId || payload?.storyTitle;
      const targetCase = targetStoryId ? CaseManager.getCase(targetStoryId) : null;
      setGameState((prev) => ({
        ...prev,
        status: 'FINAL_THEORY',
        ...(targetCase ? { caseId: targetCase.id, currentCase: targetCase } : {}),
      }));
    });

    const unsubGameEnd = backend.on('GAME_END', (payload: any) => {
      SoundService.playSuccess();
      const targetStoryId = payload?.storyId || payload?.storyTitle;
      const targetCase = targetStoryId ? CaseManager.getCase(targetStoryId) : null;
      setGameState((prev) => ({
        ...prev,
        status: 'RESULTS',
        ...(targetCase ? { caseId: targetCase.id, currentCase: targetCase } : {}),
      }));
    });

    const unsubChatMessage = backend.on('CHAT_MESSAGE', (payload: any) => {
      if (!payload?.text) return;
      addChatToast({
        id: payload.id || `chat-${Date.now()}-${Math.random().toString(36).substring(2, 5)}`,
        senderName: payload.senderName || 'Detective',
        senderAvatar: payload.senderAvatar || '💬',
        text: payload.text,
        timestamp: payload.timestamp || 'just now',
      });
    });

    const unsubPublicGuess = backend.on('PUBLIC_GUESS', (payload: any) => {
      if (!payload?.guess) return;
      addChatToast({
        id: `guess-${Date.now()}-${Math.random().toString(36).substring(2, 5)}`,
        senderName: payload.playerName || 'Detective',
        senderAvatar: '🔍',
        text: payload.guess,
        isGuess: true,
        isClose: payload.isClose,
        timestamp: 'just now',
      });
    });

    const unsubChannelMessage = channel.subscribeMessages((msg) => {
      if (msg.type === 'CHAT_MESSAGE' && msg.payload) {
        const p = msg.payload as any;
        if (!p?.text) return;
        addChatToast({
          id: p.id || `chat-${Date.now()}-${Math.random().toString(36).substring(2, 5)}`,
          senderName: p.senderName || 'Detective',
          senderAvatar: p.senderAvatar || '💬',
          text: p.text,
          timestamp: p.timestamp || 'just now',
        });
      }
    });

    // === NEW CASE MODEL EVENT HANDLERS ===

    const unsubCaseIntro = backend.on('CASE_INTRO', (payload: any) => {
      SoundService.playDramaticSting();
      setGameState((prev) => ({
        ...prev,
        status: 'CASE_INTRO' as any,
        suspects: payload.suspects || prev.suspects,
        narrativeLog: payload.introText
          ? [{ id: `intro_${Date.now()}`, text: payload.introText, type: 'INTRO' as const, timestamp: Date.now() }]
          : prev.narrativeLog,
        caseProgress: payload.caseProgress || prev.caseProgress,
      }));
      showGameBanner({
        id: 'case-intro',
        type: 'story',
        badge: payload.genre || 'MYSTERY',
        title: payload.title || 'New Case',
        subtitle: payload.mainMystery || payload.description,
      }, (payload.timeLimitSeconds || 12) * 1000);
    });

    const unsubEvidenceDiscovered = backend.on('EVIDENCE_DISCOVERED', (payload: any) => {
      SoundService.playSuccess();
      setClueCardData({
        isOpen: true,
        clueNumber: payload.solvedCount || 1,
        revealedText: payload.evidenceReveal || payload.revealedText || 'Evidence discovered!',
        solvedObjective: payload.evidenceTitle || null,
        solverName: payload.solverName || null,
        drawerName: payload.drawerName || null,
        storyTitle: payload.storyTitle || gameState.currentCase?.title || null,
        durationSeconds: payload.revealSeconds || 7,
      });
      setGameState((prev) => ({
        ...prev,
        caseProgress: payload.caseProgress || prev.caseProgress,
      }));
    });

    const unsubDiscussionStarted = backend.on('DISCUSSION_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setGameState((prev) => ({
        ...prev,
        status: 'DISCUSSION' as any,
        discussionOptions: payload.options || [],
        discussionVotes: [],
        caseProgress: payload.caseProgress || prev.caseProgress,
      }));
      showGameBanner({
        id: 'discussion',
        type: 'story',
        badge: 'TEAM DISCUSSION',
        title: 'The detectives confer...',
        subtitle: 'Vote on what to investigate next',
      }, 4000);
    });

    const unsubDiscussionVote = backend.on('DISCUSSION_VOTE', (payload: any) => {
      setGameState((prev) => ({
        ...prev,
        discussionVotes: [
          ...(prev.discussionVotes || []),
          { playerId: payload.playerId, optionIndex: payload.optionIndex, timestamp: Date.now() },
        ],
      }));
    });

    const unsubDiscussionResult = backend.on('DISCUSSION_RESULT', (payload: any) => {
      showGameBanner({
        id: 'discussion-result',
        type: 'story',
        badge: 'DECISION',
        title: payload.winningText || 'Continue investigating',
      }, 3000);
    });

    const unsubTruthReveal = backend.on('TRUTH_REVEAL', (_payload: any) => {
      SoundService.playDramaticSting();
      setGameState((prev) => ({
        ...prev,
        status: 'TRUTH_REVEAL' as any,
      }));
      // The CinematicReveal component will render truth data from the payload
    });

    const unsubNarrativePassage = backend.on('NARRATIVE_PASSAGE', (payload: any) => {
      if (payload?.passage) {
        setGameState((prev) => ({
          ...prev,
          narrativeLog: [...(prev.narrativeLog || []), payload.passage],
        }));
      }
    });

    const unsubEvidenceCard = backend.on('EVIDENCE_CARD', (payload: any) => {
      if (payload?.evidenceCard) {
        setGameState((prev) => ({
          ...prev,
          caseEvidenceBoard: [...(prev.caseEvidenceBoard || []), payload.evidenceCard],
        }));
      }
    });

    const unsubCaseProgress = backend.on('CASE_PROGRESS', (payload: any) => {
      if (payload?.caseProgress) {
        setGameState((prev) => ({
          ...prev,
          caseProgress: payload.caseProgress,
        }));
      }
    });

    return () => {
      unsubChooser();
      unsubStoryOptions();
      unsubStorySelected();
      unsubTransition();
      unsubSync();
      unsubTurnStarted();
      unsubDrawingStarted();
      unsubHintRevealed();
      unsubPromptOptions();
      unsubSecretDrawObjective();
      unsubClueSolved();
      unsubStoryReveal();
      unsubNextTurn();
      unsubDrawingEnded();
      unsubPlayerLeft();
      unsubPlayerJoined();
      unsubPlayersUpdated();
      unsubPresence();
      unsubPlayerReconnected();
      unsubFinalInvestigation();
      unsubGameEnd();
      unsubChatMessage();
      unsubPublicGuess();
      unsubChannelMessage();
      // Case model cleanup
      unsubCaseIntro();
      unsubEvidenceDiscovered();
      unsubDiscussionStarted();
      unsubDiscussionVote();
      unsubDiscussionResult();
      unsubTruthReveal();
      unsubNarrativePassage();
      unsubEvidenceCard();
      unsubCaseProgress();
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





  return (

    <div className="relative min-h-screen w-full desk-bg text-slate-100 flex flex-col justify-between overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-30 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* INTEGRATED HUD GAME ALERT BANNER (VINTAGE TELEGRAPH DISPATCH) */}
      {gameBanner && (
        <div className="fixed top-14 sm:top-16 right-3 sm:right-6 z-50 max-w-sm w-[calc(100vw-24px)] sm:w-[400px] animate-fadeIn select-none pointer-events-auto">
          <div
            onClick={() => setGameBanner(null)}
            className="cursor-pointer rounded-2xl p-3 sm:p-3.5 shadow-2xl flex items-center justify-between gap-3 border-2 border-[#8c6d48] text-[#221711] overflow-hidden relative transition-all hover:scale-[1.01]"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Corner Decorative Accents */}
            <div className="absolute top-1 left-1 w-2.5 h-2.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1 right-1 w-2.5 h-2.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <div className="flex items-center gap-3 min-w-0">
              <div className="w-9 h-9 sm:w-10 sm:h-10 rounded-xl flex items-center justify-center shrink-0 border-2 border-[#8c6d48] bg-[#ede0ce] text-red-800 shadow-inner">
                {gameBanner.type === 'solved' ? (
                  <CheckCircle className="w-5 h-5 text-emerald-800" />
                ) : gameBanner.type === 'story' ? (
                  <Sparkles className="w-5 h-5 text-amber-800" />
                ) : gameBanner.type === 'reveal' ? (
                  <BookOpen className="w-5 h-5 text-red-800" />
                ) : (
                  <Clock className="w-5 h-5 text-[#7a5839]" />
                )}
              </div>

              <div className="min-w-0 text-left">
                <div className="flex items-center gap-1.5 sm:gap-2 flex-wrap">
                  <span className="px-1.5 py-0.2 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase tracking-wider">
                    ★ {gameBanner.badge}
                  </span>
                  {gameBanner.pointsText && (
                    <span className="text-[10px] font-mono font-bold text-emerald-900 bg-emerald-100 px-1.5 py-0.2 rounded border border-emerald-700/60">
                      {gameBanner.pointsText}
                    </span>
                  )}
                </div>
                <div className="text-xs sm:text-sm font-black text-[#1a110a] truncate font-serif mt-0.5">
                  {gameBanner.title}
                </div>
                {gameBanner.subtitle && (
                  <div className="text-[11px] sm:text-xs text-[#5c4028] truncate font-serif italic">
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
              className="w-6 h-6 rounded-lg bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] text-xs font-mono font-bold transition-colors shrink-0 flex items-center justify-center cursor-pointer shadow-xs"
              title="Dismiss"
            >
              ×
            </button>
          </div>
        </div>
      )}

      {/* IN-GAME LIVE CHAT FLOATING POPUP TOASTS (VINTAGE DISPATCH SLIPS) */}
      {chatToasts.length > 0 && (
        <>
          {/* MOBILE SLIM TOP TICKER */}
          <div className="sm:hidden fixed top-14 left-2 right-2 z-50 pointer-events-none flex justify-center">
            {chatToasts.slice(-1).map((toast) => (
              <div
                key={toast.id}
                className="pointer-events-none max-w-[94vw] px-3.5 py-1.5 rounded-full shadow-lg border-2 border-[#8c6d48] text-xs flex items-center gap-2 animate-fadeIn transition-all text-[#221711] select-none"
                style={{
                  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                }}
              >
                <span className="text-xs shrink-0">{toast.senderAvatar || '🕵️‍♂️'}</span>
                <span className="font-bold text-[#1a110a] shrink-0 truncate max-w-[80px] font-mono">{toast.senderName}:</span>
                <span className="truncate text-[#3e2b1b] font-medium font-serif italic">{toast.text}</span>
                {toast.isClose && <span className="text-[9px] font-black text-amber-900 bg-amber-200 border border-amber-600 px-1 rounded font-mono shrink-0">★ CLOSE</span>}
              </div>
            ))}
          </div>

          {/* DESKTOP FLOATING TOASTS (Bottom-left) */}
          <div className="hidden sm:flex fixed bottom-24 left-6 z-50 pointer-events-none flex-col gap-2 max-w-sm w-[340px]">
            {chatToasts.map((toast) => (
              <div
                key={toast.id}
                className="pointer-events-auto flex items-start gap-2.5 p-3 rounded-2xl shadow-xl border-2 border-[#8c6d48] animate-fadeIn transition-all duration-300 text-[#221711] select-none"
                style={{
                  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                  backgroundSize: '16px 16px, 100% 100%',
                }}
              >
                <div className="w-8 h-8 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-lg shrink-0 shadow-inner">
                  {toast.senderAvatar || '🕵️‍♂️'}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between gap-1 mb-0.5">
                    <div className="flex items-center gap-1.5 min-w-0">
                      <span className="font-bold text-xs truncate text-[#1a110a] font-mono">
                        {toast.senderName}
                      </span>
                      {toast.isGuess ? (
                        <span
                          className={`text-[9px] font-mono px-1.5 py-0.2 rounded font-black uppercase ${
                            toast.isClose ? 'bg-amber-200 text-amber-950 border border-amber-600' : 'bg-red-100 text-red-900 border border-red-700'
                          }`}
                        >
                          {toast.isClose ? '★ CLOSE' : 'GUESS'}
                        </span>
                      ) : (
                        <span className="inline-flex items-center gap-1 text-[9px] font-mono px-1.5 py-0.2 rounded bg-[#ede0ce] text-[#5c4028] font-bold border border-[#bfa98e]">
                          <MessageSquare className="w-2.5 h-2.5" /> Dispatch
                        </span>
                      )}
                    </div>
                    <span className="text-[9px] font-mono text-[#7a5839] shrink-0 font-bold">
                      {toast.timestamp}
                    </span>
                  </div>
                  <p className="text-xs break-words leading-relaxed font-serif text-[#2e1f13] italic">
                    "{toast.text}"
                  </p>
                </div>
                <button
                  onClick={() => setChatToasts((prev) => prev.filter((t) => t.id !== toast.id))}
                  className="text-[#8c6d48] hover:text-[#1a110a] p-0.5 rounded transition-colors shrink-0 cursor-pointer"
                >
                  <X className="w-3.5 h-3.5" />
                </button>
              </div>
            ))}
          </div>
        </>
      )}

      {/* SMOOTH PLAYER-TO-PLAYER TURN HANDOVER OVERLAY */}
      {turnTransitionData && (
        <TurnTransitionOverlay
          transitionData={turnTransitionData}
          currentUser={currentUser}
          players={gameState.players}
          onComplete={() => setTurnTransitionData(null)}
        />
      )}

      {/* 1. STORY SELECTION WINDOW — Standalone full screen (No DrawingCanvas mounted) */}
      {storySelectionPhase === 'choosing' && (
        <div className="fixed inset-0 z-50 desk-bg text-slate-100 flex flex-col items-center justify-center p-4 sm:p-6 select-none overflow-y-auto animate-fadeIn">
          {/* Background ambiance */}
          <div
            className="fixed inset-0 bg-cover bg-center opacity-25 pointer-events-none mix-blend-screen"
            style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
          />
          <div className="fixed inset-0 bg-gradient-to-b from-desk-950/95 via-desk-950/80 to-desk-950/95 pointer-events-none" />

          {storyOptions.length === 0 ? (
            <div
              className="relative z-10 max-w-md w-full text-center space-y-4 p-8 rounded-3xl border-3 border-[#8c6d48] shadow-[0_20px_60px_rgba(0,0,0,0.85),inset_0_0_60px_rgba(139,94,60,0.15)] text-[#221711] select-none"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              <div className="w-16 h-16 mx-auto rounded-2xl bg-[#ede0ce] border-2 border-[#b89e7c] flex items-center justify-center text-red-800 shadow-inner">
                <BookOpen className="w-8 h-8 animate-pulse" />
              </div>
              <div className="space-y-1">
                <span className="px-2.5 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                  CONFIDENTIAL ARCHIVE
                </span>
                <h3 className="text-xl font-serif font-black text-[#1a110a]">
                  Retrieving Case Dossiers...
                </h3>
                <p className="text-xs font-mono text-[#5c422e]">
                  Selecting 3 mystery dossiers from the evidence vault.
                </p>
              </div>
              <div className="flex justify-center gap-1.5 pt-2">
                <span className="w-2.5 h-2.5 rounded-full bg-red-800 animate-bounce [animation-delay:-0.3s]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#8c6d48] animate-bounce [animation-delay:-0.15s]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#3e2b1b] animate-bounce" />
              </div>
            </div>
          ) : (
            <div className="relative z-10 max-w-5xl w-full space-y-6 my-auto py-6">
              {/* Header */}
              <div className="text-center space-y-2">
                <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-[#fbf7ee] border-2 border-[#8c6d48] text-red-900 text-xs font-mono font-bold uppercase tracking-widest shadow-md">
                  <BookOpen className="w-3.5 h-3.5 text-red-800" />
                  CONFIDENTIAL CASE ARCHIVES
                </div>
                <h2 className="text-2xl sm:text-3xl md:text-4xl font-black font-serif text-amber-100 tracking-tight drop-shadow">
                  {chooserPlayerId === currentUser.id
                    ? 'Select Your Case File Dossier'
                    : `${chooserName} is choosing the case dossier...`}
                </h2>
                <p className="text-sm text-stone-300 font-mono max-w-xl mx-auto">
                  {chooserPlayerId === currentUser.id
                    ? 'Review the three classified crime briefs below and select one for your squad.'
                    : 'All detectives are inspecting the crime dossiers. Take your time — no time limit.'}
                </p>
              </div>

              {/* 3 Story Cards as Physical Investigation Dossiers */}
              <div className="grid grid-cols-1 sm:grid-cols-3 gap-5 items-stretch">
                {storyOptions.map((option: any, idx: number) => {
                  const artwork = getStoryArtwork(option.genre, option.title, option.storyId);
                  const isChooser = chooserPlayerId === currentUser.id;
                  return (
                    <div
                      key={option.storyId || idx}
                      onClick={() => {
                        if (isChooser) {
                          SoundService.playStamp();
                          backend.chooseStory(option.storyId);
                        }
                      }}
                      className={`relative text-[#221711] border-3 rounded-2xl p-4 shadow-[0_15px_40px_rgba(0,0,0,0.65),inset_0_0_50px_rgba(139,94,60,0.12)] flex flex-col justify-between transition-all duration-300 overflow-hidden select-none ${
                        isChooser
                          ? 'border-[#8c6d48] hover:border-red-800 cursor-pointer hover:-translate-y-1 hover:shadow-[0_20px_50px_rgba(138,28,28,0.35)] group'
                          : 'border-[#8c6d48]/70 opacity-90'
                      }`}
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

                      {/* Top folder tab indicator */}
                      <div className="flex items-center justify-between mb-3 border-b border-[#bfa98e]/70 pb-2">
                        <span className="text-[10px] font-mono font-bold uppercase tracking-widest text-[#7a5839]">
                          DOSSIER #{idx + 1}
                        </span>
                        <span className="px-2 py-0.5 rounded text-[9px] font-mono font-black uppercase tracking-wider bg-red-800/10 text-red-800 border border-red-800">
                          {option.genre}
                        </span>
                      </div>

                      {/* Polaroid Evidence Artwork */}
                      <div className="relative rounded-xl overflow-hidden bg-stone-900 border-2 border-[#b89e7c] shadow-sm mb-3">
                        <div className="w-full aspect-[16/10] overflow-hidden relative">
                          <img
                            src={artwork.img}
                            alt={option.title}
                            className="w-full h-full object-cover filter contrast-110 brightness-95 group-hover:scale-105 transition-transform duration-300"
                          />
                          <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent" />
                        </div>
                      </div>

                      {/* Case Details */}
                      <div className="space-y-1.5 flex-1">
                        <h3 className="text-base sm:text-lg font-black font-serif text-[#1a110a] leading-tight group-hover:text-red-900 transition-colors">
                          {option.title}
                        </h3>
                        <p className="text-xs text-[#5c422e] font-serif leading-relaxed line-clamp-3">
                          {option.description}
                        </p>
                      </div>

                      {/* Footer: Difficulty + Select Action */}
                      <div className="pt-3 mt-3 border-t border-[#bfa98e]/80 flex items-center justify-between">
                        <span
                          className={`text-[9px] font-mono font-bold uppercase px-2 py-0.5 rounded border ${
                            option.difficulty === 'HARD'
                              ? 'text-red-800 border-red-800 bg-red-800/10'
                              : option.difficulty === 'EASY'
                              ? 'text-emerald-900 border-emerald-800 bg-emerald-800/10'
                              : 'text-amber-900 border-amber-800 bg-amber-800/10'
                          }`}
                        >
                          {option.difficulty || 'NORMAL'}
                        </span>
                        {isChooser ? (
                          <button
                            type="button"
                            className="btn-wax-seal text-xs py-1.5 px-3 uppercase tracking-wider font-bold cursor-pointer"
                          >
                            Select Case →
                          </button>
                        ) : (
                          <span className="text-[10px] font-mono text-[#7a5839] italic">
                            Awaiting lead detective...
                          </span>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      )}

      {/* 2. STORY OVERVIEW WINDOW — Standalone full screen (No DrawingCanvas mounted) */}
      {storySelectionPhase === 'overview' && overviewData && (
        <div className="fixed inset-0 z-50 desk-bg text-slate-100 flex flex-col items-center justify-center p-4 sm:p-6 select-none overflow-y-auto animate-fadeIn">
          {/* Background ambiance */}
          <div
            className="fixed inset-0 bg-cover bg-center opacity-25 pointer-events-none mix-blend-screen"
            style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
          />
          <div className="fixed inset-0 bg-gradient-to-b from-desk-950/95 via-desk-950/85 to-desk-950/95 pointer-events-none" />

          <div className="relative z-10 max-w-3xl w-full space-y-4 my-auto py-6">
            {/* Top Navigation & Countdown Bar */}
            <div className="flex flex-wrap items-center justify-between gap-3">
              <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-[#fbf7ee] border-2 border-red-800 text-red-900 text-xs font-mono font-bold shadow-md">
                <Clock className="w-3.5 h-3.5 text-red-800 animate-pulse" />
                Case Room opening in {overviewCountdown}s
              </div>
              <button
                onClick={handleEnterGameRoom}
                className="btn-wax-seal text-xs py-2 px-5 flex items-center gap-2 font-mono uppercase tracking-wider cursor-pointer"
              >
                <span>Enter Game Room Now</span>
                <span>→</span>
              </button>
            </div>

            {/* Case Briefing Dossier Folder */}
            <div
              className="relative text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] space-y-5 overflow-hidden select-none"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Corner Decorative Accents */}
              <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              {/* Header: Folder tab / Confidential ribbon */}
              <div className="flex items-center justify-between border-b-2 border-[#bfa98e]/80 pb-3">
                <div className="flex items-center gap-2">
                  <span className="px-2.5 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[10px] font-black uppercase tracking-widest">
                    CLASSIFIED CASE BRIEFING
                  </span>
                  <span className="text-[10px] font-mono text-[#7a5839] font-bold">
                    GENRE: {overviewData.genre}
                  </span>
                </div>
                <span
                  className={`px-2 py-0.5 rounded text-[10px] font-mono font-bold uppercase border ${
                    overviewData.difficulty === 'HARD'
                      ? 'text-red-800 border-red-800 bg-red-800/10'
                      : overviewData.difficulty === 'EASY'
                      ? 'text-emerald-900 border-emerald-800 bg-emerald-800/10'
                      : 'text-amber-900 border-amber-800 bg-amber-800/10'
                  }`}
                >
                  {overviewData.difficulty || 'NORMAL'}
                </span>
              </div>

              {/* Case header artwork banner */}
              {(() => {
                const artwork = getStoryArtwork(overviewData.genre, overviewData.title, overviewData.storyId);
                return (
                  <div className="w-full aspect-[21/9] rounded-2xl overflow-hidden relative border-2 border-[#b89e7c] shadow-md bg-stone-900">
                    <img
                      src={artwork.img}
                      alt={overviewData.title}
                      className="w-full h-full object-cover filter contrast-110 brightness-95"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/75 via-transparent to-transparent" />
                    <div className="absolute bottom-3 left-4 right-4">
                      <h2 className="text-xl sm:text-2xl md:text-3xl font-black font-serif text-white tracking-tight drop-shadow-lg">
                        {overviewData.title}
                      </h2>
                    </div>
                  </div>
                );
              })()}

              {/* Case Synopsis */}
              <div className="p-4 rounded-2xl bg-[#fdfbf7] border-2 border-[#b89e7c] shadow-sm">
                <div className="text-[10px] font-mono font-bold text-[#7a5839] uppercase tracking-wider mb-1">
                  OFFICIAL INVESTIGATION SUMMARY
                </div>
                <p className="text-xs sm:text-sm text-[#3e2b1b] font-serif leading-relaxed">
                  {overviewData.description}
                </p>
              </div>

              {/* Suspects preview */}
              {overviewData.suspects && overviewData.suspects.length > 0 && (
                <div className="space-y-2">
                  <div className="flex items-center gap-2 text-xs font-mono font-bold text-[#7a5839] uppercase tracking-wider">
                    <Users className="w-3.5 h-3.5 text-red-800" />
                    Key Suspects Under Surveillance ({overviewData.suspects.length})
                  </div>
                  <div className="grid grid-cols-2 sm:grid-cols-3 gap-2.5">
                    {overviewData.suspects.slice(0, 6).map((s: any, idx: number) => (
                      <div
                        key={s.id || idx}
                        className="flex items-center gap-2.5 px-3 py-2 rounded-xl bg-[#fdfbf7] border-2 border-[#d8c5aa] shadow-xs"
                      >
                        <span className="text-xl">{s.avatar || '🕵️'}</span>
                        <div className="min-w-0">
                          <div className="text-xs font-bold font-serif text-[#1a110a] truncate">
                            {s.name}
                          </div>
                          <div className="text-[10px] text-[#7a5839] font-mono truncate">
                            {s.role_description || s.role || 'Suspect'}
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Objective Dossier Callout */}
              <div className="flex items-center gap-3 px-4 py-3 rounded-2xl bg-[#ede0ce] border-2 border-[#bfa98e] shadow-inner">
                <Shield className="w-5 h-5 text-red-800 shrink-0" />
                <p className="text-xs text-[#443020] font-mono leading-snug">
                  <strong className="font-bold text-[#1a110a]">Detective Objective:</strong> Draw clues, guess evidence, spot fabricated sketches, and identify the culprit before the mystery expires!
                </p>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* 3. GAME WINDOW (Drawing Canvas with Timer, Staging & Arrival Sync) */}
      {storySelectionPhase === 'none' &&
        gameState.status !== 'INVESTIGATION' &&
        gameState.status !== 'FINAL_THEORY' &&
        gameState.status !== 'TRUTH_REVEAL' &&
        gameState.status !== 'RESULTS' && (
        <DrawingCanvas
          gameState={gameState}
          currentUser={currentUser}
          secretClue={secretClue}
          secretDrawObjective={secretDrawObjective}
          drawerPrompt={drawerPrompt}
          secretDrawHint={secretDrawHint}
          publicHint={publicHint || secretDrawHint}
          publicWordLengths={publicWordLengths}
          publicFirstLetters={publicFirstLetters}
          storyContext={storyContext}
          investigationObjective={investigationObjective}
          clueHint={clueHint}
          revealedLetters={revealedLetters}
          roomCode={room.code}
          channel={channel}
          isDrawer={isDrawer}
          gameWindowSync={gameWindowSync}
          onSubmitDrawing={handleSubmitDrawing}
          onLeaveRoom={onExitGame}
        />
      )}


      {/* 3. INVESTIGATION BOARD & TIMELINE */}
      {storySelectionPhase === 'none' && gameState.status === 'INVESTIGATION' && (
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
