import React, { useState, useEffect } from 'react';
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

type AppView = 'HOME' | 'LOBBY' | 'GAME';

const ACTIVE_ROOM_ID_KEY = 'inkbound_active_room_id';
const ACTIVE_VIEW_KEY = 'inkbound_active_view';

export const App: React.FC = () => {
  const [currentUser, setCurrentUser] = useState<Player>(() => AuthService.getProfile());

  // Restore room synchronously on page refresh or direct URL (?room=CODE)
  const [currentRoom, setCurrentRoom] = useState<Room | null>(() => {
    try {
      if (typeof window !== 'undefined') {
        const urlParams = new URLSearchParams(window.location.search);
        const codeFromUrl = urlParams.get('room') || urlParams.get('join');
        const storedRoomId = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null;

        if (storedRoomId) {
          const local = RoomService.getLocalRoom(storedRoomId);
          if (local?.room) return local.room;
        }

        if (codeFromUrl) {
          const local = RoomService.findLocalRoomByCode(codeFromUrl);
          if (local?.room) return local.room;
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
        const urlParams = new URLSearchParams(window.location.search);
        const codeFromUrl = urlParams.get('room') || urlParams.get('join');
        const storedRoomId = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null;

        if (storedRoomId) {
          const local = RoomService.getLocalRoom(storedRoomId);
          if (local?.players && local.players.length > 0) return local.players;
        }

        if (codeFromUrl) {
          const local = RoomService.findLocalRoomByCode(codeFromUrl);
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
        const urlParams = new URLSearchParams(window.location.search);
        const codeFromUrl = urlParams.get('room') || urlParams.get('join');
        let storedRoomId = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null;

        if (!storedRoomId && codeFromUrl) {
          const local = RoomService.findLocalRoomByCode(codeFromUrl);
          if (local?.room) storedRoomId = local.room.id;
        }

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
        const codeFromUrl = urlParams.get('room') || urlParams.get('join');
        let storedRoomId = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem(ACTIVE_ROOM_ID_KEY) : null;

        if (!storedRoomId && codeFromUrl) {
          const local = RoomService.findLocalRoomByCode(codeFromUrl);
          if (local?.room) storedRoomId = local.room.id;
        }

        const storedView = typeof sessionStorage !== 'undefined' ? (sessionStorage.getItem(ACTIVE_VIEW_KEY) as AppView | null) : null;

        if (storedRoomId) {
          const existingGame = GameService.getGameState(storedRoomId);
          if (existingGame && existingGame.status !== 'LOBBY' && (existingGame.status as string) !== 'WAITING' && (existingGame.status as string) !== 'CASE_INTRO') {
            return 'GAME';
          }
          if (storedView === 'LOBBY') {
            return 'LOBBY';
          }
          if (storedView === 'GAME' && existingGame && existingGame.status !== 'LOBBY') {
            return 'GAME';
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

  // Sync active session and URL with current room & view
  useEffect(() => {
    try {
      if (currentRoom) {
        sessionStorage.setItem(ACTIVE_ROOM_ID_KEY, currentRoom.id);
        sessionStorage.setItem(ACTIVE_VIEW_KEY, view);

        const params = new URLSearchParams(window.location.search);
        if (params.get('room') !== currentRoom.code) {
          window.history.replaceState(null, '', `?room=${currentRoom.code}`);
        }
      } else {
        sessionStorage.removeItem(ACTIVE_ROOM_ID_KEY);
        sessionStorage.removeItem(ACTIVE_VIEW_KEY);
        if (window.location.search) {
          window.history.replaceState(null, '', window.location.pathname);
        }
      }
    } catch {
      // ignore
    }
  }, [currentRoom, view]);

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
          const me = mappedPlayers.find((p) => p.id === currentUser.id || p.id === payload.playerId);
          if (me) setCurrentUser(me);
        }
      }
    });

    const unsubPlayerJoined = backend.on('PLAYER_JOINED', (payload: any) => {
      if (payload?.player) {
        const newP = payload.player;
        setPlayers((prev) => {
          if (prev.some((p) => p.id === newP.playerId)) return prev;
          return [
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
        });
      }
    });

    const unsubPlayerLeft = backend.on('PLAYER_LEFT', (payload: any) => {
      if (payload?.playerId) {
        setPlayers((prev) => prev.filter((p) => p.id !== payload.playerId));
      }
    });

    const unsubGameStarting = backend.on('GAME_STARTING', () => {
      setView('GAME');
    });

    const unsubError = backend.on('ERROR', (payload: any) => {
      if (payload?.message) {
        setErrorMessage(payload.message);
      }
    });

    return () => {
      unsubRoomState();
      unsubPlayerJoined();
      unsubPlayerLeft();
      unsubGameStarting();
      unsubError();
    };
  }, [currentUser.id]);


  // Check URL query parameters for direct invite/reconnect (?join=CODE or ?room=CODE)
  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const code = params.get('room') || params.get('join');
    if (code) {
      if (!currentRoom) {
        handleJoinRoom(code);
      } else {
        // If room is already in state, connect backend socket
        BackendClient.getInstance().connect().catch(() => {});
      }
    }
  }, []);


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
      setView('LOBBY');
    } catch {
      // Fallback to local room service if server unreachable
      try {
        const res = await RoomService.createRoom(currentUser);
        setCurrentRoom(res.room);
        setPlayers(res.players);
        setView('LOBBY');
      } catch {
        setErrorMessage('Failed to create investigation room.');
      }
    }
  };

  const handleJoinRoom = async (code: string) => {
    try {
      const backend = BackendClient.getInstance();
      const res = await backend.joinRoom(code, currentUser.nickname, currentUser.avatar);
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

      if (serverRoom.status === 'IN_GAME') {
        setView('GAME');
      } else {
        setView('LOBBY');
      }
    } catch (err: any) {
      // Fallback
      try {
        const res = await RoomService.joinRoom(code, currentUser);
        if ('error' in res) {
          setErrorMessage(res.error);
          setView('HOME');
          window.history.replaceState(null, '', window.location.pathname);
          return;
        }
        setCurrentRoom(res.room);
        setPlayers(res.players);
        setView('LOBBY');
      } catch {
        setErrorMessage(err?.message || 'Failed to join case room. Please check the code.');
        setView('HOME');
        window.history.replaceState(null, '', window.location.pathname);
      }
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
      sessionStorage.removeItem(ACTIVE_ROOM_ID_KEY);
      sessionStorage.removeItem(ACTIVE_VIEW_KEY);
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
        />
      )}

      {view === 'LOBBY' && !currentRoom && (
        <div className="min-h-screen bg-[#07090e] text-amber-100 flex flex-col items-center justify-center p-6 text-center select-none font-mono">
          <div className="w-16 h-16 rounded-full border-4 border-amber-600/30 border-t-amber-500 animate-spin mb-6" />
          <h2 className="text-xl font-bold font-serif tracking-wider text-amber-300">
            CONNECTING TO INVESTIGATION ROOM...
          </h2>
          <p className="text-sm text-slate-400 mt-2 max-w-sm">
            Syncing detective presence, retrieving case dossier, and securing live evidence channel.
          </p>
          <button
            onClick={() => {
              setView('HOME');
              window.history.replaceState(null, '', window.location.pathname);
            }}
            className="mt-6 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg text-xs tracking-wider transition-colors"
          >
            ← Return to Headquarters
          </button>
        </div>
      )}

      {view === 'LOBBY' && currentRoom && (
        <Lobby
          room={currentRoom}
          players={players}
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

      {view === 'GAME' && !currentRoom && (
        <div className="min-h-screen bg-[#07090e] text-amber-100 flex flex-col items-center justify-center p-6 text-center select-none font-mono">
          <div className="w-16 h-16 rounded-full border-4 border-red-600/30 border-t-red-500 animate-spin mb-6" />
          <h2 className="text-xl font-bold font-serif tracking-wider text-red-400">
            RECONNECTING TO CRIME SCENE...
          </h2>
          <p className="text-sm text-slate-400 mt-2 max-w-sm">
            Synchronizing turn timer, evidence easel, and real-time multiplayer state.
          </p>
          <button
            onClick={() => {
              setView('HOME');
              window.history.replaceState(null, '', window.location.pathname);
            }}
            className="mt-6 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg text-xs tracking-wider transition-colors"
          >
            ← Return to Headquarters
          </button>
        </div>
      )}

      {view === 'GAME' && currentRoom && (
        <Game
          room={currentRoom}
          initialState={
            gameState ||
            GameService.getGameState(currentRoom.id) ||
            GameService.startGame(currentRoom, players.length > 0 ? players : [currentUser])
          }
          currentUser={currentUser}
          onExitGame={handleLeaveRoom}
          onReturnToLobby={handleReturnToLobby}
          onGameStateChange={setGameState}
        />
      )}
    </div>
  );
};

export default App;

