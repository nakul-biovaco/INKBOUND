import React, { useState, useEffect, useRef } from 'react';
import { Player } from './types/player';
import { Room } from './types/room';
import { AuthoritativeGameState } from './types/game';
import { AuthService } from './services/authService';
import { RoomService } from './services/roomService';
import { GameService } from './services/gameService';
import { BackendClient } from './realtime/backendClient';
import { Home } from './pages/Home';
import { Lobby } from './pages/Lobby';
import { Game } from './pages/Game';
import { decodeInviteCode } from './utils/inviteCrypto';

type AppView = 'HOME' | 'LOBBY' | 'GAME';

const ACTIVE_ROOM_ID_KEY = 'inkbound_active_room_id';
const ACTIVE_VIEW_KEY = 'inkbound_active_view';
const CACHED_ROOM_KEY = 'inkbound_cached_room';
const CACHED_PLAYERS_KEY = 'inkbound_cached_players';
const CACHED_GAME_STATE_KEY = 'inkbound_cached_game_state';

const saveCachedSession = (
  room: Room | null,
  playersList: Player[],
  gameStateObj: AuthoritativeGameState | null,
  activeView: AppView
) => {
  try {
    if (typeof sessionStorage === 'undefined' && typeof localStorage === 'undefined') return;

    if (room) {
      const roomStr = JSON.stringify(room);
      sessionStorage.setItem(CACHED_ROOM_KEY, roomStr);
      localStorage.setItem(CACHED_ROOM_KEY, roomStr);
      sessionStorage.setItem(ACTIVE_ROOM_ID_KEY, room.id);
      localStorage.setItem(ACTIVE_ROOM_ID_KEY, room.id);
      RoomService.saveLocalRoom(room, playersList);
    }
    if (playersList && playersList.length > 0) {
      const playersStr = JSON.stringify(playersList);
      sessionStorage.setItem(CACHED_PLAYERS_KEY, playersStr);
      localStorage.setItem(CACHED_PLAYERS_KEY, playersStr);
    }
    if (gameStateObj) {
      const gameStr = JSON.stringify(gameStateObj);
      sessionStorage.setItem(CACHED_GAME_STATE_KEY, gameStr);
      localStorage.setItem(CACHED_GAME_STATE_KEY, gameStr);
      GameService.saveGameState(gameStateObj);
    }
    sessionStorage.setItem(ACTIVE_VIEW_KEY, activeView);
    localStorage.setItem(ACTIVE_VIEW_KEY, activeView);
  } catch {
    // ignore
  }
};

export const App: React.FC = () => {
  const [currentUser, setCurrentUser] = useState<Player>(() => AuthService.getProfile());

  const initialInviteParamRef = useRef<string | null>(
    typeof window !== 'undefined'
      ? new URLSearchParams(window.location.search).get('invite') ||
        new URLSearchParams(window.location.search).get('join') ||
        new URLSearchParams(window.location.search).get('room')
      : null
  );

  // Restore room synchronously on page refresh or direct URL (?invite=TOKEN, ?join=CODE, or ?room=CODE)
  const [currentRoom, setCurrentRoom] = useState<Room | null>(() => {
    try {
      if (typeof window !== 'undefined') {
        const urlParams = new URLSearchParams(window.location.search);
        const rawCode = urlParams.get('invite') || urlParams.get('join') || urlParams.get('room');
        const codeFromUrl = rawCode ? decodeInviteCode(rawCode) : null;
        const storedRoomId =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null);
        const storedView =
          (typeof sessionStorage !== 'undefined' ? (sessionStorage.getItem(ACTIVE_VIEW_KEY) as AppView | null) : null) ||
          (typeof localStorage !== 'undefined' ? (localStorage.getItem(ACTIVE_VIEW_KEY) as AppView | null) : null);

        // 1. Check cached room directly
        const cached =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(CACHED_ROOM_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(CACHED_ROOM_KEY) : null);
        if (cached) {
          const parsed = JSON.parse(cached);
          if (parsed && parsed.id) return parsed;
        }

        // 2. Check local room by ID
        if (storedRoomId) {
          const local = RoomService.getLocalRoom(storedRoomId);
          if (local?.room) return local.room;
        }

        // 3. Check local room by code
        if (codeFromUrl) {
          const local = RoomService.findLocalRoomByCode(codeFromUrl);
          if (local?.room) return local.room;
        }

        // 4. If stored view was GAME, synthesize fallback room immediately so user is never blocked
        if (storedView === 'GAME') {
          return {
            id: storedRoomId || `room_${Date.now()}`,
            code: codeFromUrl || 'ROOM',
            hostId: '',
            maxPlayers: 8,
            status: 'IN_GAME',
            settings: {
              turnDuration: 40,
              distorterEnabled: false,
              selectedCaseId: 'all',
              allowQuestioning: true,
            },
            createdAt: new Date().toISOString(),
          };
        }
      }
    } catch {
      // ignore
    }
    return null;
  });

  // Restore players list synchronously on page refresh
  const [players, setPlayers] = useState<Player[]>(() => {
    try {
      if (typeof window !== 'undefined') {
        const cached =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(CACHED_PLAYERS_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(CACHED_PLAYERS_KEY) : null);
        if (cached) {
          const parsed = JSON.parse(cached);
          if (Array.isArray(parsed) && parsed.length > 0) return parsed;
        }

        const storedRoomId =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null);
        if (storedRoomId) {
          const local = RoomService.getLocalRoom(storedRoomId);
          if (local?.players && local.players.length > 0) return local.players;
        }
      }
    } catch {
      // ignore
    }
    return [];
  });

  // Restore game state synchronously on page refresh
  const [gameState, setGameState] = useState<AuthoritativeGameState | null>(() => {
    try {
      if (typeof window !== 'undefined') {
        const cached =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(CACHED_GAME_STATE_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(CACHED_GAME_STATE_KEY) : null);
        if (cached) {
          const parsed = JSON.parse(cached);
          if (parsed && parsed.status) return parsed;
        }

        const storedRoomId =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null);
        if (storedRoomId) {
          const existing = GameService.getGameState(storedRoomId);
          if (existing) return existing;
        }
      }
    } catch {
      // ignore
    }
    return null;
  });

  // Restore exact page/view on refresh (LOBBY, GAME, or HOME)
  const [view, setView] = useState<AppView>(() => {
    try {
      if (typeof window !== 'undefined') {
        const urlParams = new URLSearchParams(window.location.search);
        const rawCode = urlParams.get('invite') || urlParams.get('join') || urlParams.get('room');
        const codeFromUrl = rawCode ? decodeInviteCode(rawCode) : null;
        let storedRoomId =
          (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
          (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null);

        const storedView =
          (typeof sessionStorage !== 'undefined' ? (sessionStorage.getItem(ACTIVE_VIEW_KEY) as AppView | null) : null) ||
          (typeof localStorage !== 'undefined' ? (localStorage.getItem(ACTIVE_VIEW_KEY) as AppView | null) : null);

        // If stored view was GAME, restore GAME view immediately!
        if (storedView === 'GAME') {
          return 'GAME';
        }

        if (storedRoomId) {
          const existingGame = GameService.getGameState(storedRoomId);
          if (existingGame && existingGame.status !== 'LOBBY' && (existingGame.status as string) !== 'WAITING' && (existingGame.status as string) !== 'CASE_INTRO') {
            return 'GAME';
          }
          if (storedView === 'LOBBY') {
            return 'LOBBY';
          }
          return 'LOBBY';
        }

        if (codeFromUrl) {
          return 'LOBBY';
        }
      }
    } catch {
      // ignore
    }
    return 'HOME';
  });

  const [errorMessage, setErrorMessage] = useState<string>('');
  const [isCreatingRoom, setIsCreatingRoom] = useState(false);
  const [isJoiningRoom, setIsJoiningRoom] = useState(false);

  // Sync active session and URL with current room & view
  useEffect(() => {
    try {
      if (currentRoom) {
        saveCachedSession(currentRoom, players, gameState, view);
        const params = new URLSearchParams(window.location.search);
        if (params.get('room') !== currentRoom.code) {
          window.history.replaceState(null, '', `?room=${currentRoom.code}`);
        }
      } else if (view === 'HOME') {
        sessionStorage.removeItem(ACTIVE_ROOM_ID_KEY);
        sessionStorage.removeItem(ACTIVE_VIEW_KEY);
        sessionStorage.removeItem(CACHED_ROOM_KEY);
        sessionStorage.removeItem(CACHED_PLAYERS_KEY);
        sessionStorage.removeItem(CACHED_GAME_STATE_KEY);
        localStorage.removeItem(ACTIVE_ROOM_ID_KEY);
        localStorage.removeItem(ACTIVE_VIEW_KEY);
        localStorage.removeItem(CACHED_ROOM_KEY);
        localStorage.removeItem(CACHED_PLAYERS_KEY);
        localStorage.removeItem(CACHED_GAME_STATE_KEY);
        // Preserve query parameters if user is currently joining via an invite or room link
        const params = new URLSearchParams(window.location.search);
        const hasPendingInvite = params.has('invite') || params.has('join') || params.has('room');
        if (!hasPendingInvite && window.location.search) {
          window.history.replaceState(null, '', window.location.pathname);
        }
      }
    } catch {
      // ignore
    }
  }, [currentRoom, view, players, gameState]);

  // Connect to authoritative WebSocket engine and wire room events
  useEffect(() => {
    const backend = BackendClient.getInstance();

    const unsubRoomState = backend.on('ROOM_STATE', (payload: any) => {
      if (payload?.room) {
        const serverRoom = payload.room;
        const mappedRoom: Room = {
          id: serverRoom.roomId,
          code: serverRoom.joinCode,
          hostId: serverRoom.hostPlayerId,
          maxPlayers: serverRoom.maxPlayers || 8,
          status: serverRoom.status === 'IN_GAME' ? 'IN_GAME' : 'WAITING',
          settings: {
            turnDuration: serverRoom.settings?.drawingTimeLimit || 40,
            distorterEnabled: false,
            selectedCaseId:
              serverRoom.settings?.storyId && serverRoom.settings.storyId !== 'midnight_museum'
                ? serverRoom.settings.storyId
                : 'all',
            allowQuestioning: true,
          },
          createdAt: new Date().toISOString(),
        };
        setCurrentRoom(mappedRoom);

        if (serverRoom.players) {
          const mappedPlayers: Player[] = serverRoom.players.map((p: any) => ({
            id: p.playerId,
            nickname: p.displayName,
            avatar: p.avatar,
            isHost: p.isHost,
            isReady: p.isReady,
            score: p.score || 0,
            isOnline: p.isConnected !== false,
            joinedAt: new Date(p.joinedAt || Date.now()).toISOString(),
            lastSeenAt: new Date().toISOString(),
          }));
          setPlayers(mappedPlayers);
          const myId = backend.getPlayerId() || currentUser.id || payload?.playerId;
          const me = mappedPlayers.find((p) => p.id === myId || (p.id === payload?.playerId) || (p.nickname === currentUser.nickname && !p.isHost));
          if (me) setCurrentUser(me);

          saveCachedSession(mappedRoom, mappedPlayers, gameState, serverRoom.status === 'IN_GAME' ? 'GAME' : view);
        }
      }
    });

    const unsubPlayerJoined = backend.on('PLAYER_JOINED', (payload: any) => {
      if (payload?.player) {
        const newP = payload.player;
        setPlayers((prev) => {
          if (prev.some((p) => p.id === newP.playerId)) return prev;
          const updated = [
            ...prev,
            {
              id: newP.playerId,
              nickname: newP.displayName,
              avatar: newP.avatar,
              isHost: newP.isHost,
              isReady: newP.isReady,
              score: newP.score || 0,
              isOnline: true,
              joinedAt: new Date().toISOString(),
              lastSeenAt: new Date().toISOString(),
            },
          ];
          if (currentRoom) saveCachedSession(currentRoom, updated, gameState, view);
          return updated;
        });
      }
    });

    const unsubPlayerLeft = backend.on('PLAYER_LEFT', (payload: any) => {
      if (payload?.playerId) {
        setPlayers((prev) => {
          const updated = prev.filter((p) => p.id !== payload.playerId);
          if (currentRoom) saveCachedSession(currentRoom, updated, gameState, view);
          return updated;
        });
      }
    });

    const unsubPlayerReconnected = backend.on('PLAYER_RECONNECTED', (payload: any) => {
      if (payload?.gameState) {
        const gs = payload.gameState;
        if (gs.players) {
          const mappedPlayers: Player[] = gs.players.map((p: any) => ({
            id: p.playerId,
            nickname: p.displayName,
            avatar: p.avatar,
            isHost: p.isHost,
            isReady: p.isReady,
            score: p.score || 0,
            isOnline: p.isConnected !== false,
            joinedAt: new Date(p.joinedAt || Date.now()).toISOString(),
            lastSeenAt: new Date().toISOString(),
          }));
          setPlayers(mappedPlayers);
          const myId = backend.getPlayerId() || currentUser.id;
          const me = mappedPlayers.find((p) => p.id === myId);
          if (me) setCurrentUser(me);
          if (currentRoom) saveCachedSession(currentRoom, mappedPlayers, gameState, 'GAME');
        }
        setView('GAME');
      }
    });

    const unsubGameStarting = backend.on('GAME_STARTING', () => {
      setView('GAME');
      if (currentRoom) saveCachedSession(currentRoom, players, gameState, 'GAME');
    });

    const unsubError = backend.on('ERROR', (payload: any) => {
      if (payload?.message) {
        const message = payload.message as string;
        if (/No active game session|Room not found/i.test(message)) {
          // The authoritative service was restarted. A stale browser room must not
          // keep sending actions to a game session that no longer exists.
          backend.clearSession();
          setGameState(null);
          setCurrentRoom(null);
          setPlayers([]);
          setView('HOME');
          setErrorMessage('The game server restarted, so this room is no longer active. Please create a new room and invite the team again.');
          return;
        }
        setErrorMessage(message);
      }
    });

    return () => {
      unsubRoomState();
      unsubPlayerJoined();
      unsubPlayerLeft();
      unsubPlayerReconnected();
      unsubGameStarting();
      unsubError();
    };
  }, [currentUser.id, currentRoom, gameState, view, players]);

  // Connect socket on mount
  useEffect(() => {
    BackendClient.getInstance().connect().catch(() => {});
  }, []);


  // Check URL query parameters for direct invite/reconnect (?invite=TOKEN, ?join=CODE, or ?room=CODE)
  useEffect(() => {
    const raw =
      initialInviteParamRef.current ||
      (typeof window !== 'undefined'
        ? new URLSearchParams(window.location.search).get('invite') ||
          new URLSearchParams(window.location.search).get('join') ||
          new URLSearchParams(window.location.search).get('room')
        : null);
    if (raw) {
      const code = decodeInviteCode(raw);
      if (code) {
        if (!currentRoom) {
          handleJoinRoom(code);
        } else {
          // If room is already in state, connect backend socket
          BackendClient.getInstance().connect().catch(() => {});
        }
      }
    }
  }, []);

  // Safety watchdog: Never get stuck on connecting screen if connection stalls
  useEffect(() => {
    if (view === 'LOBBY' && !currentRoom && !isJoiningRoom) {
      const timer = setTimeout(() => {
        if (!currentRoom) {
          setErrorMessage('Could not connect to investigation room. The invite link may have expired or the room was closed.');
          setView('HOME');
          if (typeof window !== 'undefined' && window.location.search) {
            window.history.replaceState(null, '', window.location.pathname);
          }
        }
      }, 7000);
      return () => clearTimeout(timer);
    }
  }, [view, currentRoom, isJoiningRoom]);


  // Room synchronization & channel listeners
  useEffect(() => {
    if (!currentRoom) return;

    const channel = GameService.getChannel(currentRoom.id);

    // Track current user presence
    channel.trackPresence({
      playerId: currentUser.id,
      nickname: currentUser.nickname,
      avatar: currentUser.avatar,
      isOnline: true,
      activeTurn: false,
      lastActive: Date.now(),
    });

    const unsubscribe = channel.subscribeMessages((msg) => {
      if (msg.type === 'PLAYERS_SYNC') {
        const payload = msg.payload as { players?: Player[] };
        if (payload?.players && Array.isArray(payload.players)) {
          setPlayers(payload.players);
          const me = payload.players.find((p) => p.id === currentUser.id);
          if (me) setCurrentUser(me);
        }
      } else if (msg.type === 'SETTINGS_UPDATED') {
        const payload = msg.payload as { settings?: Room['settings'] };
        if (payload?.settings) {
          setCurrentRoom((prev) => (prev ? { ...prev, settings: payload.settings! } : prev));
        }
      } else if (msg.type === 'GAME_STARTED') {
        const payload = msg.payload as { state?: AuthoritativeGameState };
        const state = payload?.state || GameService.getGameState(currentRoom.id);
        if (state) {
          GameService.saveGameState(state);
          setGameState(state);
          setView('GAME');
        }
      } else if (msg.type === 'GAME_FINISHED') {
        const payload = msg.payload as { returnToLobby?: boolean };
        if (payload?.returnToLobby) {
          setView('LOBBY');
          setGameState(null);
        }
      }
    });

    // Subscribe to presence
    const unsubPresence = channel.subscribePresence((presences) => {
      if (presences.length > 0) {
        setPlayers((prev) =>
          prev.map((p) => ({
            ...p,
            isOnline: presences.some((pr) => pr.playerId === p.id),
          }))
        );
      }
    });

    // Fast cross-tab sync via browser StorageEvent
    const handleStorage = (e: StorageEvent) => {
      if (e.key === `inkbound_room_${currentRoom.id}` && e.newValue) {
        try {
          const parsed = JSON.parse(e.newValue);
          if (parsed?.players && Array.isArray(parsed.players)) {
            setPlayers(parsed.players);
            const me = parsed.players.find((p: Player) => p.id === currentUser.id);
            if (me) setCurrentUser(me);
          }
        } catch {
          // ignore
        }
      } else if (e.key === `inkbound_game_${currentRoom.id}` && e.newValue) {
        try {
          const state = JSON.parse(e.newValue);
          if (state && state.status !== 'LOBBY') {
            setGameState(state);
            setView('GAME');
          }
        } catch {
          // ignore
        }
      }
    };
    window.addEventListener('storage', handleStorage);

    // Active real-time sync (checks local cache + Supabase room_players)
    const interval = setInterval(async () => {
      if (!currentRoom) return;

      // If connected to authoritative server, do not overwrite live server players with stale local cache
      if (BackendClient.getInstance().getPlayerId()) {
        return;
      }

      // 1. Check local storage cache for multi-tab updates
      const local = RoomService.getLocalRoom(currentRoom.id);
      if (local) {
        setPlayers((prev) => {
          const hasLengthDiff = local.players.length !== prev.length;
          const hasPlayerDiff = local.players.some(
            (lp, i) =>
              lp.id !== prev[i]?.id ||
              lp.isReady !== prev[i]?.isReady ||
              lp.isHost !== prev[i]?.isHost ||
              lp.nickname !== prev[i]?.nickname
          );
          if (hasLengthDiff || hasPlayerDiff) {
            const me = local.players.find((p) => p.id === currentUser.id);
            if (me && (me.isHost !== currentUser.isHost || me.isReady !== currentUser.isReady)) {
              setCurrentUser(me);
            }
            return local.players;
          }
          return prev;
        });

        if (local.room.hostId !== currentRoom.hostId) {
          setCurrentRoom((prev) => (prev ? { ...prev, hostId: local.room.hostId } : prev));
        }
      }

      // 2. Fetch authoritative players from Supabase room_players (for cross-device / mobile sync)
      const remote = await RoomService.fetchPlayersFromSupabase(currentRoom.id);
      if (remote && remote.length > 0) {
        setPlayers((prev) => {
          const hasLengthDiff = remote.length !== prev.length;
          const hasPlayerDiff = remote.some(
            (rp, i) =>
              rp.id !== prev[i]?.id ||
              rp.isReady !== prev[i]?.isReady ||
              rp.isHost !== prev[i]?.isHost ||
              rp.nickname !== prev[i]?.nickname
          );
          if (hasLengthDiff || hasPlayerDiff) {
            const me = remote.find((p) => p.id === currentUser.id);
            if (me && (me.isHost !== currentUser.isHost || me.isReady !== currentUser.isReady)) {
              setCurrentUser(me);
            }
            return remote;
          }
          return prev;
        });
      }

      // 3. Check if game was launched remotely by Host
      const freshGame = GameService.getGameState(currentRoom.id);
      if (freshGame && freshGame.status !== 'LOBBY' && (freshGame.status as string) !== 'WAITING') {
        setGameState((prev) => {
          if (!prev || prev.sequenceNumber < freshGame.sequenceNumber || prev.status !== freshGame.status) {
            return freshGame;
          }
          return prev;
        });
        setView((prev) => (prev !== 'GAME' ? 'GAME' : prev));
      }
    }, 1000);

    return () => {
      unsubscribe();
      unsubPresence();
      window.removeEventListener('storage', handleStorage);
      clearInterval(interval);
    };
  }, [currentRoom, currentUser, view]);

  const handleCreateRoom = async () => {
    if (isCreatingRoom) return;
    setIsCreatingRoom(true);
    setErrorMessage('');
    try {
      const backend = BackendClient.getInstance();
      const res = await backend.createRoom(currentUser.nickname, currentUser.avatar);
      const serverRoom = res.room;
      const mappedRoom: Room = {
        id: serverRoom.roomId,
        code: serverRoom.joinCode,
        hostId: res.hostPlayer.playerId,
        maxPlayers: serverRoom.maxPlayers || 8,
        status: 'WAITING',
        settings: {
          turnDuration: 40,
          distorterEnabled: false,
          selectedCaseId: 'all',
          allowQuestioning: true,
        },
        createdAt: new Date().toISOString(),
      };
      setCurrentRoom(mappedRoom);
      const hostP: Player = {
        id: res.hostPlayer.playerId,
        nickname: res.hostPlayer.displayName,
        avatar: res.hostPlayer.avatar,
        isHost: true,
        isReady: false,
        score: 0,
        isOnline: true,
        joinedAt: new Date().toISOString(),
        lastSeenAt: new Date().toISOString(),
      };
      setPlayers([hostP]);
      setCurrentUser(hostP);
      saveCachedSession(mappedRoom, [hostP], null, 'LOBBY');
      setView('LOBBY');
    } catch {
      // Fallback to local room service if server unreachable
      try {
        const res = await RoomService.createRoom(currentUser);
        setCurrentRoom(res.room);
        setPlayers(res.players);
        saveCachedSession(res.room, res.players, null, 'LOBBY');
        setView('LOBBY');
      } catch {
        setErrorMessage('Failed to create investigation room.');
      }
    } finally {
      setIsCreatingRoom(false);
    }
  };

  const handleJoinRoom = async (code: string) => {
    if (isJoiningRoom) return;
    const cleanCode = decodeInviteCode(code);
    if (!cleanCode) {
      setErrorMessage('Invalid room code or invite link.');
      setView('HOME');
      return;
    }
    setIsJoiningRoom(true);
    setErrorMessage('');
    try {
      const backend = BackendClient.getInstance();
      const res = await backend.joinRoom(cleanCode, currentUser.nickname, currentUser.avatar);
      const serverRoom = res.room;
      const mappedRoom: Room = {
        id: serverRoom.roomId,
        code: serverRoom.joinCode,
        hostId: serverRoom.hostPlayerId,
        maxPlayers: serverRoom.maxPlayers || 8,
        status: serverRoom.status === 'IN_GAME' ? 'IN_GAME' : 'WAITING',
        settings: {
          turnDuration: serverRoom.settings?.drawingTimeLimit || 40,
          distorterEnabled: false,
          selectedCaseId:
            serverRoom.settings?.storyId && serverRoom.settings.storyId !== 'midnight_museum'
              ? serverRoom.settings.storyId
              : 'all',
          allowQuestioning: true,
        },
        createdAt: new Date().toISOString(),
      };
      setCurrentRoom(mappedRoom);

      const mappedPlayers: Player[] = serverRoom.players.map((p: any) => ({
        id: p.playerId,
        nickname: p.displayName,
        avatar: p.avatar,
        isHost: p.isHost,
        isReady: p.isReady,
        score: p.score || 0,
        isOnline: p.isConnected !== false,
        joinedAt: new Date(p.joinedAt || Date.now()).toISOString(),
        lastSeenAt: new Date().toISOString(),
      }));
      setPlayers(mappedPlayers);
      const me = mappedPlayers.find((p) => p.id === res.player.playerId);
      if (me) setCurrentUser(me);

      const targetView = serverRoom.status === 'IN_GAME' ? 'GAME' : 'LOBBY';
      saveCachedSession(mappedRoom, mappedPlayers, null, targetView);
      setView(targetView);
    } catch (err: any) {
      // Fallback
      try {
        const res = await RoomService.joinRoom(cleanCode, currentUser);
        if ('error' in res) {
          setErrorMessage(res.error);
          setView('HOME');
          window.history.replaceState(null, '', window.location.pathname);
          return;
        }
        setCurrentRoom(res.room);
        setPlayers(res.players);
        saveCachedSession(res.room, res.players, null, 'LOBBY');
        setView('LOBBY');
      } catch {
        setErrorMessage(err?.message || 'Failed to join case room. Please check the code.');
        setView('HOME');
        window.history.replaceState(null, '', window.location.pathname);
      }
    } finally {
      setIsJoiningRoom(false);
    }
  };

  const handleToggleReady = () => {
    if (!currentRoom) return;
    const nextReady = !currentUser.isReady;
    BackendClient.getInstance().setReady(nextReady);
    setCurrentUser((prev) => ({ ...prev, isReady: nextReady }));
    setPlayers((prev) =>
      prev.map((p) => (p.id === currentUser.id ? { ...p, isReady: nextReady } : p))
    );
  };

  const handleStartGame = () => {
    if (!currentRoom) return;
    const chosenGenre = currentRoom.settings?.selectedCaseId || 'all';
    BackendClient.getInstance().startGame(chosenGenre);
    setView('GAME');
  };


  const handleAddBot = () => {
    if (!currentRoom) return;
    const updated = RoomService.addBotDetective(currentRoom.id);
    setPlayers(updated);
  };

  const handleUpdateSettings = (settings: Room['settings']) => {
    if (!currentRoom) return;
    const updated: Room = { ...currentRoom, settings };
    setCurrentRoom(updated);
    RoomService.updateSettings(currentRoom.id, settings, currentUser.id);
    BackendClient.getInstance().updateSettings(settings);
  };

  const handleKickPlayer = (playerId: string) => {
    if (!currentRoom) return;
    const updated = RoomService.removePlayer(currentRoom.id, playerId);
    setPlayers(updated);
  };

  const handlePromoteHost = (newHostId: string) => {
    if (!currentRoom) return;
    const updated = RoomService.promoteHost(currentRoom.id, newHostId, currentUser.id);
    setPlayers(updated);
    setCurrentRoom((prev) => (prev ? { ...prev, hostId: newHostId } : prev));
  };

  const handleReturnToLobby = () => {
    try {
      sessionStorage.setItem(ACTIVE_VIEW_KEY, 'LOBBY');
    } catch {
      // ignore
    }
    setView('LOBBY');
    setGameState(null);
  };

  const handleLeaveRoom = () => {
    try {
      BackendClient.getInstance().disconnect();
      sessionStorage.removeItem(ACTIVE_ROOM_ID_KEY);
      sessionStorage.removeItem(ACTIVE_VIEW_KEY);
      sessionStorage.removeItem(CACHED_ROOM_KEY);
      sessionStorage.removeItem(CACHED_PLAYERS_KEY);
      sessionStorage.removeItem(CACHED_GAME_STATE_KEY);
      localStorage.removeItem(ACTIVE_ROOM_ID_KEY);
      localStorage.removeItem(ACTIVE_VIEW_KEY);
      localStorage.removeItem(CACHED_ROOM_KEY);
      localStorage.removeItem(CACHED_PLAYERS_KEY);
      localStorage.removeItem(CACHED_GAME_STATE_KEY);
      window.history.replaceState(null, '', window.location.pathname);
    } catch {
      // ignore
    }
    setCurrentRoom(null);
    setPlayers([]);
    setGameState(null);
    setView('HOME');
  };

  return (
    <div className="min-h-screen bg-noir-900 text-noir-100 font-sans">
      {errorMessage && (
        <div className="fixed top-4 right-4 z-50 bg-rose-950/90 border border-case-crimson text-rose-200 px-4 py-2.5 rounded-xl shadow-lg text-xs flex items-center justify-between gap-3">
          <span>{errorMessage}</span>
          <button onClick={() => setErrorMessage('')} className="text-white hover:text-rose-300 font-bold">
            ✕
          </button>
        </div>
      )}

      {view === 'HOME' && (
        <Home
          currentUser={currentUser}
          onUpdateProfile={setCurrentUser}
          onCreateRoom={handleCreateRoom}
          onJoinRoom={handleJoinRoom}
          isCreating={isCreatingRoom}
          isJoining={isJoiningRoom}
        />
      )}

      {view === 'LOBBY' && (
        <Lobby
          room={
            currentRoom || {
              id:
                (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
                (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
                'active_lobby',
              code: 'ROOM',
              hostId: currentUser.id,
              maxPlayers: 8,
              status: 'WAITING',
              settings: {
                turnDuration: 40,
                distorterEnabled: false,
                selectedCaseId: 'all',
                allowQuestioning: true,
              },
              createdAt: new Date().toISOString(),
            }
          }
          players={players.length > 0 ? players : [currentUser]}
          currentUser={currentUser}
          onToggleReady={handleToggleReady}
          onStartGame={handleStartGame}
          onUpdateSettings={handleUpdateSettings}
          onLeaveRoom={handleLeaveRoom}
          onAddBot={handleAddBot}
          onKickPlayer={handleKickPlayer}
          onPromoteHost={handlePromoteHost}
        />
      )}

      {view === 'GAME' && (
        <Game
          room={
            currentRoom || {
              id:
                (typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
                (typeof localStorage !== 'undefined' ? localStorage.getItem(ACTIVE_ROOM_ID_KEY) : null) ||
                'active_game',
              code: 'ROOM',
              hostId: currentUser.id,
              maxPlayers: 8,
              status: 'IN_GAME',
              settings: {
                turnDuration: 40,
                distorterEnabled: false,
                selectedCaseId: 'all',
                allowQuestioning: true,
              },
              createdAt: new Date().toISOString(),
            }
          }
          initialState={
            gameState ||
            (currentRoom ? GameService.getGameState(currentRoom.id) : null) ||
            GameService.startGame(
              currentRoom || {
                id: 'active_game',
                code: 'ROOM',
                hostId: currentUser.id,
                maxPlayers: 8,
                status: 'IN_GAME',
                settings: {
                  turnDuration: 40,
                  distorterEnabled: false,
                  selectedCaseId: 'all',
                  allowQuestioning: true,
                },
                createdAt: new Date().toISOString(),
              },
              players.length > 0 ? players : [currentUser]
            )
          }
          currentUser={currentUser}
          onExitGame={handleLeaveRoom}
          onReturnToLobby={handleReturnToLobby}
          onGameStateChange={(st) => {
            setGameState(st);
            saveCachedSession(currentRoom, players, st, 'GAME');
          }}
        />
      )}
    </div>
  );
};

export default App;
