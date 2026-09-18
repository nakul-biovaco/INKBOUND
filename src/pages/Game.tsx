import React, { useState, useEffect, useRef } from 'react';
import { BookOpen, Clock, Sparkles, CheckCircle, X, MessageSquare } from 'lucide-react';
import { AuthoritativeGameState, TheorySubmission } from '../types/game';
import { Player } from '../types/player';
import { Room } from '../types/room';
import { GameService } from '../services/gameService';
import { CaseManager } from '../game/CaseManager';
import { BackendClient } from '../realtime/backendClient';
import { GameHeader } from '../components/common/GameHeader';
import { DrawingCanvas } from '../components/canvas/DrawingCanvas';
import { InvestigationBoard } from '../components/investigation/InvestigationBoard';
import { FinalTheoryModal } from '../components/accusation/FinalTheoryModal';
import { CinematicReveal } from '../components/reveal/CinematicReveal';
import { ResultsScreen } from '../components/results/ResultsScreen';
import { ClueDiscoveredCard } from '../components/common/ClueDiscoveredCard';
import { TurnTransitionOverlay, TurnTransitionData } from '../components/common/TurnTransitionOverlay';
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
  const [turnTransitionData, setTurnTransitionData] = useState<TurnTransitionData | null>(null);
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

      const targetStoryId = payload.storyId || payload.title;
      const resolvedCase = CaseManager.getCase(targetStoryId);

      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        caseId: resolvedCase.id,
        currentCase: resolvedCase,
      }));
    });

    const unsubTurnStarted = backend.on('TURN_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setGameBanner(null);
      setIsStorySelection(false);
      setSelectedStoryBriefing(null);
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

      const reconnectedCase = payload?.gameState?.storyId ? CaseManager.getCase(payload.gameState.storyId) : null;

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
    const resolvedCase = CaseManager.getCase(storyId);
    setGameState((prev) => ({
      ...prev,
      caseId: resolvedCase.id,
      currentCase: resolvedCase,
    }));
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
        <div className="fixed top-14 sm:top-16 right-3 sm:right-6 z-50 max-w-sm w-[calc(100vw-24px)] sm:w-[380px] animate-fadeIn select-none pointer-events-auto">
          <div
            onClick={() => setGameBanner(null)}
            className={`cursor-pointer rounded-2xl p-2.5 sm:p-3 shadow-2xl flex items-center justify-between gap-3 border backdrop-blur-md transition-all ${gameBanner.type === 'solved'
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
            <div className="flex items-center gap-2.5 sm:gap-3 min-w-0">
              <div
                className={`w-8 h-8 sm:w-9 sm:h-9 rounded-xl flex items-center justify-center shrink-0 border ${gameBanner.type === 'solved'
                    ? 'bg-emerald-500/20 border-emerald-400 text-emerald-300'
                    : gameBanner.type === 'story'
                      ? 'bg-amber-500/20 border-amber-400 text-amber-300'
                      : gameBanner.type === 'reveal'
                        ? 'bg-purple-500/20 border-purple-400 text-purple-300'
                        : 'bg-sky-500/20 border-sky-400 text-sky-300'
                  }`}
              >
                {gameBanner.type === 'solved' ? (
                  <CheckCircle className="w-4 h-4 sm:w-5 sm:h-5 animate-bounce" />
                ) : gameBanner.type === 'story' ? (
                  <Sparkles className="w-4 h-4 sm:w-5 sm:h-5 animate-pulse" />
                ) : gameBanner.type === 'reveal' ? (
                  <BookOpen className="w-4 h-4 sm:w-5 sm:h-5" />
                ) : (
                  <Clock className="w-4 h-4 sm:w-5 sm:h-5 animate-spin" />
                )}
              </div>

              <div className="min-w-0 text-left">
                <div className="flex items-center gap-1.5 sm:gap-2">
                  <span className="text-[9px] sm:text-[10px] font-mono font-bold uppercase tracking-wider opacity-90">
                    {gameBanner.badge}
                  </span>
                  {gameBanner.pointsText && (
                    <span className="text-[10px] sm:text-[11px] font-mono font-bold text-emerald-300">
                      • {gameBanner.pointsText}
                    </span>
                  )}
                </div>
                <div className="text-xs sm:text-sm font-bold text-white truncate font-serif">
                  {gameBanner.title}
                </div>
                {gameBanner.subtitle && (
                  <div className="text-[11px] sm:text-xs text-slate-300 truncate font-sans">
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
              className="px-2 py-0.5 rounded-lg bg-black/40 hover:bg-black/60 text-white/80 hover:text-white text-xs font-mono font-bold transition-colors shrink-0"
              title="Dismiss"
            >
              ×
            </button>
          </div>
        </div>
      )}

      {/* IN-GAME LIVE CHAT FLOATING POPUP TOASTS */}
      {chatToasts.length > 0 && (
        <>
          {/* MOBILE SLIM TOP TICKER (Non-intrusive, never covers canvas or bottom guess input) */}
          <div className="sm:hidden fixed top-14 left-2 right-2 z-50 pointer-events-none flex justify-center">
            {chatToasts.slice(-1).map((toast) => (
              <div
                key={toast.id}
                className={`pointer-events-none max-w-[94vw] px-3 py-1.5 rounded-full shadow-lg backdrop-blur-md border text-xs flex items-center gap-2 animate-fadeIn transition-all ${toast.isClose
                    ? 'bg-amber-950/95 border-amber-500 text-amber-200 shadow-amber-900/40'
                    : toast.isGuess
                      ? 'bg-[#0e1626]/95 border-sky-500/80 text-sky-200'
                      : 'bg-[#0f172a]/95 border-slate-700 text-slate-200'
                  }`}
              >
                <span className="text-xs shrink-0">{toast.senderAvatar || '🕵️‍♂️'}</span>
                <span className="font-bold text-white shrink-0 truncate max-w-[70px]">{toast.senderName}:</span>
                <span className="truncate text-slate-300 font-medium">{toast.text}</span>
                {toast.isClose && <span className="text-[9px] font-bold text-amber-300 font-mono shrink-0">★ CLOSE</span>}
              </div>
            ))}
          </div>

          {/* DESKTOP FLOATING TOASTS (Bottom-left) */}
          <div className="hidden sm:flex fixed bottom-24 left-6 z-50 pointer-events-none flex-col gap-2 max-w-sm w-[340px]">
            {chatToasts.map((toast) => (
              <div
                key={toast.id}
                className={`pointer-events-auto flex items-start gap-2.5 p-3 rounded-2xl shadow-2xl backdrop-blur-md border animate-fadeIn transition-all duration-300 ${toast.isClose
                    ? 'bg-amber-950/95 border-amber-500/80 text-amber-200 shadow-[0_4px_20px_rgba(245,158,11,0.3)]'
                    : toast.isGuess
                      ? 'bg-[#0e1626]/95 border-sky-500/70 text-sky-200 shadow-[0_4px_20px_rgba(56,189,248,0.25)]'
                      : 'bg-[#0f172a]/95 border-slate-700/80 text-slate-100 shadow-[0_4px_20px_rgba(0,0,0,0.6)]'
                  }`}
              >
                <div className="w-8 h-8 rounded-xl bg-slate-800/90 border border-slate-700/60 flex items-center justify-center text-lg shrink-0">
                  {toast.senderAvatar || '🕵️‍♂️'}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between gap-1 mb-0.5">
                    <div className="flex items-center gap-1.5 min-w-0">
                      <span className="font-bold text-xs truncate text-white">
                        {toast.senderName}
                      </span>
                      {toast.isGuess ? (
                        <span
                          className={`text-[9px] font-mono px-1.5 py-0.5 rounded font-bold uppercase ${toast.isClose ? 'bg-amber-500/20 text-amber-300' : 'bg-sky-500/20 text-sky-300'
                            }`}
                        >
                          {toast.isClose ? 'Almost' : 'Guess'}
                        </span>
                      ) : (
                        <span className="inline-flex items-center gap-1 text-[9px] font-mono px-1.5 py-0.5 rounded bg-slate-800 text-slate-400 font-medium">
                          <MessageSquare className="w-2.5 h-2.5" /> Chat
                        </span>
                      )}
                    </div>
                    <span className="text-[9px] font-mono text-slate-400 shrink-0">
                      {toast.timestamp}
                    </span>
                  </div>
                  <p className="text-xs break-words leading-relaxed font-medium">
                    {toast.text}
                  </p>
                </div>
                <button
                  type="button"
                  onClick={() => setChatToasts((prev) => prev.filter((t) => t.id !== toast.id))}
                  className="text-slate-400 hover:text-white p-0.5 rounded transition-colors shrink-0 cursor-pointer"
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

      {/* SKRIBBL-STYLE CLUE PICKER (Only shown to active drawer if clue hasn't been chosen yet and not during handover transition) */}
      {drawerPromptOptions.length > 0 && isDrawer && !secretDrawObjective && !turnTransitionData && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 select-none animate-fadeIn">
          {/* VINTAGE INVESTIGATION EVIDENCE DOSSIER MODAL */}
          <div
            className="max-w-2xl w-full text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-8 shadow-[0_25px_80px_rgba(0,0,0,0.9),inset_0_0_90px_rgba(139,94,60,0.22)] text-center animate-fadeIn relative overflow-hidden select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Parchment Corner Decorative Accents */}
            <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Vintage Brass Paperclip Illustration */}
            <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded border-2 border-red-800 bg-red-800/10 text-red-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm mb-2">
              <Sparkles className="w-3.5 h-3.5 text-red-800" /> ★ CLASSIFIED EVIDENCE // YOUR TURN TO SKETCH
            </div>

            <h2 className="text-2xl sm:text-3xl font-black font-serif text-[#1a110a] tracking-wide mb-1">
              Choose a Secret Clue
            </h2>
            <p className="text-xs sm:text-sm text-[#5c422e] font-mono mb-6">
              Pick 1 evidence card below to sketch for the room. Detectives will decipher while you draw!
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
                  className="group relative p-4 sm:p-5 rounded-2xl bg-[#fdfbf6] hover:bg-[#fffdf9] border-2 border-[#b89e7c] hover:border-red-800 transition-all text-left shadow-md hover:shadow-2xl hover:-translate-y-1 cursor-pointer flex flex-col justify-between"
                >
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-[10px] font-mono text-[#7a4e2d] font-bold uppercase tracking-wider">
                        CARD #{opt.optionIndex + 1}
                      </span>
                      <span
                        className={`px-2 py-0.5 rounded text-[9px] font-mono font-bold uppercase border-2 ${opt.difficulty?.toLowerCase() === 'easy'
                            ? 'bg-emerald-100 text-emerald-900 border-emerald-700'
                            : opt.difficulty?.toLowerCase() === 'hard'
                              ? 'bg-purple-100 text-purple-900 border-purple-700'
                              : 'bg-amber-100 text-amber-900 border-amber-700'
                          }`}
                      >
                        {opt.difficulty || 'NORMAL'}
                      </span>
                    </div>

                    <div className="text-base sm:text-lg font-black text-[#1a110a] group-hover:text-red-900 font-serif leading-snug">
                      "{cleanCardText(opt.previewText)}"
                    </div>
                  </div>

                  <div className="mt-5 w-full py-2.5 rounded-xl bg-red-800 hover:bg-red-700 group-hover:bg-red-700 text-white text-xs font-bold font-mono uppercase tracking-wider text-center transition-colors shadow">
                    Draw This Clue →
                  </div>
                </button>
              ))}
            </div>

            <div className="mt-5 flex items-center justify-between text-xs font-mono text-[#7a5839] pt-3 border-t border-[#bfa98e]/80">
              <span>Auto-picks first option if not chosen</span>
              <button
                type="button"
                onClick={() => {
                  if (drawerPromptOptions.length > 0) {
                    handleSelectPrompt(drawerPromptOptions[0].optionIndex, drawerPromptOptions[0].previewText);
                  }
                }}
                className="text-red-900 font-bold hover:underline cursor-pointer"
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
                /* GRAND CASE BRIEFING (After Story is Picked) - VINTAGE CASE DOSSIER */
                <div
                  className="w-full text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-10 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] relative overflow-hidden text-center space-y-6 animate-fadeIn select-none"
                  style={{
                    background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                    backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                    backgroundSize: '16px 16px, 100% 100%',
                  }}
                >
                  {/* Parchment Corner Decorative Accents */}
                  <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

                  {/* Vintage Brass Paperclip Illustration */}
                  <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

                  <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded border-2 border-red-800 bg-red-800/10 text-red-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm">
                    <Sparkles className="w-3.5 h-3.5 text-red-800" /> ★ OFFICIAL CASE DOSSIER UNSEALED
                  </div>

                  <h1 className="text-3xl sm:text-5xl font-black text-[#1a110a] font-serif tracking-wide drop-shadow-[0_1px_0_rgba(255,255,255,0.8)]">
                    {selectedStoryBriefing.title}
                  </h1>

                  <div className="flex items-center justify-center gap-4 text-xs font-mono text-[#7a5839]">
                    <span className="px-3 py-1 bg-[#ede1cf] border border-[#b89e7c] rounded-lg text-[#3e2b1b] font-bold uppercase">
                      {selectedStoryBriefing.genre}
                    </span>
                    <span>•</span>
                    <span className="text-[#5c422e] font-bold">CLASSIFIED DOSSIER</span>
                  </div>

                  <div className="max-w-3xl mx-auto p-6 bg-[#fdfbf6] border-2 border-[#b89e7c] rounded-2xl font-serif text-base sm:text-lg text-[#2a1d13] leading-relaxed italic text-left shadow-inner">
                    "{selectedStoryBriefing.description}"
                  </div>

                  <div className="pt-4 flex flex-col sm:flex-row items-center justify-center gap-3 text-xs font-mono text-[#5c422e]">
                    <div className="flex items-center gap-2">
                      <Clock className="w-4 h-4 text-red-800 animate-spin" />
                      <span className="font-bold">Cataloging evidence for Detective drawing round...</span>
                    </div>
                    <button
                      onClick={() => setSelectedStoryBriefing(null)}
                      className="px-5 py-2.5 rounded-xl bg-red-800 hover:bg-red-700 text-white border border-red-900 text-xs font-bold font-mono uppercase tracking-wider transition-colors shadow-md cursor-pointer"
                    >
                      Acknowledge & Proceed (×)
                    </button>
                  </div>
                </div>
              ) : currentUser.id === storyChooserId || (storyChooserId === null && offeredStories.length > 0) ? (
                /* STORY CHOOSER VIEW: 3 VINTAGE CASE ARCHIVES */
                <div
                  className="w-full text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-6 sm:p-10 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] relative overflow-hidden space-y-6 animate-fadeIn select-none"
                  style={{
                    background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                    backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                    backgroundSize: '16px 16px, 100% 100%',
                  }}
                >
                  {/* Parchment Corner Decorative Accents */}
                  <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

                  {/* Vintage Brass Paperclip */}
                  <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

                  <div className="text-center space-y-2">
                    <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded border-2 border-red-800 bg-red-800/10 text-red-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm">
                      <BookOpen className="w-3.5 h-3.5" /> ★ CLASSIFIED ARCHIVES // PICK THE MYSTERY CASE
                    </div>
                    <h1 className="text-2xl sm:text-4xl font-black text-[#1a110a] font-serif tracking-wide drop-shadow-[0_1px_0_rgba(255,255,255,0.8)]">
                      Select an Active Mystery Dossier
                    </h1>
                    <p className="text-xs sm:text-sm text-[#5c422e] font-mono max-w-xl mx-auto">
                      You are the Lead Investigator! Pick any case file below to distribute clues to your detective squad.
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
                          className="group relative p-5 sm:p-6 rounded-2xl bg-[#fdfbf6] hover:bg-[#fffdf9] border-2 border-[#b89e7c] hover:border-red-800 transition-all text-left shadow-md hover:shadow-2xl hover:-translate-y-1 cursor-pointer flex flex-col justify-between"
                        >
                          <div className="space-y-3">
                            <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-2">
                              <span className="text-[10px] font-mono font-bold uppercase tracking-wider px-2 py-0.5 rounded border border-[#b89e7c] bg-[#ede1cf] text-[#443020]">
                                {st.genre}
                              </span>
                              <span className="text-[9px] font-mono font-bold uppercase px-2 py-0.5 rounded border-2 bg-amber-100 text-amber-900 border-amber-700">
                                {st.difficulty || 'NORMAL'}
                              </span>
                            </div>

                            <h3 className="text-lg font-bold text-[#1a110a] font-serif group-hover:text-red-900 transition-colors leading-snug">
                              {st.title}
                            </h3>

                            <p className="text-xs text-[#3e2c1e] line-clamp-5 leading-relaxed font-serif italic">
                              "{st.description}"
                            </p>
                          </div>

                          <button className="mt-6 w-full py-3 bg-red-800 hover:bg-red-700 group-hover:bg-red-700 text-white rounded-xl text-xs font-bold font-mono uppercase tracking-wider shadow transition-colors cursor-pointer">
                            Open This Case File →
                          </button>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <div className="py-16 text-center space-y-4">
                      <div className="w-10 h-10 border-4 border-red-800 border-t-transparent rounded-full animate-spin mx-auto" />
                      <div className="text-sm font-mono text-[#5c422e]">
                        Unsealing case archives...
                      </div>
                    </div>
                  )}
                </div>
              ) : (
                /* WAITING FOR CHOOSER SCREEN - VINTAGE PAPER CASE DISPATCH */
                <div
                  className="w-full max-w-2xl text-[#221711] border-4 border-[#8c6d48] rounded-3xl p-8 sm:p-12 shadow-[0_25px_80px_rgba(0,0,0,0.85),inset_0_0_80px_rgba(139,94,60,0.2)] relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6 select-none"
                  style={{
                    background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                    backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                    backgroundSize: '16px 16px, 100% 100%',
                  }}
                >
                  {/* Parchment Corner Decorative Accents */}
                  <div className="absolute top-2 left-2 w-5 h-5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute top-2 right-2 w-5 h-5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 left-2 w-5 h-5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute bottom-2 right-2 w-5 h-5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

                  {/* Vintage Brass Paperclip */}
                  <div className="absolute -top-2 left-8 w-4 h-8 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/40" />

                  <div className="relative w-16 h-16 mx-auto flex items-center justify-center">
                    <div className="absolute inset-0 rounded-full bg-red-800/20 animate-ping" />
                    <div className="w-14 h-14 rounded-full bg-[#ede1cf] border-2 border-red-800 flex items-center justify-center text-red-800 shadow-md">
                      <BookOpen className="w-6 h-6 animate-pulse" />
                    </div>
                  </div>

                  <div className="space-y-2">
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded border-2 border-red-800 bg-red-800/10 text-red-800 font-mono text-xs font-black uppercase tracking-widest -rotate-1 shadow-sm">
                      ★ CASE ASSIGNMENT IN PROGRESS
                    </span>
                    <h2 className="text-2xl sm:text-3xl font-black font-serif text-[#1a110a] pt-1">
                      {storyChooserName ? `${storyChooserName} is choosing the case dossier...` : 'Selecting lead investigator...'}
                    </h2>
                    <p className="text-xs sm:text-sm text-[#5c422e] font-mono max-w-md mx-auto leading-relaxed">
                      Your fellow detective is reviewing case files in the archives. Prepare your sketchpad!
                    </p>
                  </div>

                  <div className="p-4 rounded-xl bg-[#ede1cf]/80 border-2 border-[#b89e7c] text-xs text-[#443020] font-mono flex items-center justify-center gap-2 shadow-inner">
                    <Clock className="w-4 h-4 text-red-800 animate-spin" />
                    <span className="font-bold">The sketching & deduction phase starts immediately after!</span>
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
