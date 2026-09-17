import WebSocket from 'ws';
globalThis.WebSocket = WebSocket;
import assert from 'assert';

console.log('--- Testing Refresh Persistence & State Hydration ---');

// Mock browser storage environments
class StorageMock {
  constructor() {
    this.store = new Map();
  }
  getItem(key) {
    return this.store.get(key) || null;
  }
  setItem(key, value) {
    this.store.set(key, String(value));
  }
  removeItem(key) {
    this.store.delete(key);
  }
  clear() {
    this.store.clear();
  }
  get length() {
    return this.store.size;
  }
  key(i) {
    return Array.from(this.store.keys())[i] || null;
  }
}

const mockLocalStorage = new StorageMock();
const mockSessionStorage = new StorageMock();

globalThis.localStorage = mockLocalStorage;
globalThis.sessionStorage = mockSessionStorage;
globalThis.window = {
  location: {
    search: '',
    pathname: '/',
  },
  history: {
    replaceState: (_data, _unused, url) => {
      if (url.startsWith('?')) {
        globalThis.window.location.search = url;
      } else {
        globalThis.window.location.search = '';
      }
    },
  },
};

const { RoomService } = await import('../src/services/roomService.ts');
const { GameService } = await import('../src/services/gameService.ts');

const ACTIVE_ROOM_ID_KEY = 'inkbound_active_room_id';
const ACTIVE_VIEW_KEY = 'inkbound_active_view';

// Helper simulating App.tsx synchronous state initializers on mount / refresh
function simulateAppMount() {
  const urlParams = new URLSearchParams(globalThis.window.location.search);
  const codeFromUrl = urlParams.get('room') || urlParams.get('join');
  let storedRoomId = globalThis.sessionStorage.getItem(ACTIVE_ROOM_ID_KEY);

  let currentRoom = null;
  if (storedRoomId) {
    const local = RoomService.getLocalRoom(storedRoomId);
    if (local?.room) currentRoom = local.room;
  }
  if (!currentRoom && codeFromUrl) {
    const local = RoomService.findLocalRoomByCode(codeFromUrl);
    if (local?.room) currentRoom = local.room;
  }

  let players = [];
  if (storedRoomId) {
    const local = RoomService.getLocalRoom(storedRoomId);
    if (local?.players && local.players.length > 0) players = local.players;
  }
  if (players.length === 0 && codeFromUrl) {
    const local = RoomService.findLocalRoomByCode(codeFromUrl);
    if (local?.players && local.players.length > 0) players = local.players;
  }

  let gameState = null;
  if (!storedRoomId && codeFromUrl) {
    const local = RoomService.findLocalRoomByCode(codeFromUrl);
    if (local?.room) storedRoomId = local.room.id;
  }
  if (storedRoomId) {
    gameState = GameService.getGameState(storedRoomId);
  }

  const storedView = globalThis.sessionStorage.getItem(ACTIVE_VIEW_KEY);
  let view = 'HOME';
  if (storedRoomId) {
    const existingGame = GameService.getGameState(storedRoomId);
    if (existingGame && existingGame.status !== 'LOBBY' && existingGame.status !== 'WAITING') {
      view = 'GAME';
    } else if (storedView === 'LOBBY' || storedView === 'GAME') {
      view = storedView;
    } else {
      view = 'LOBBY';
    }
  }

  return { currentRoom, players, gameState, view };
}

// 1. Initial State (Home Page)
console.log('Test 1: Fresh visitor on Home page');
const initialMount = simulateAppMount();
assert.strictEqual(initialMount.view, 'HOME', 'Should start on HOME view');
assert.strictEqual(initialMount.currentRoom, null);
console.log('✓ Initial visit starts on HOME');

// 2. User creates a room -> enters LOBBY
console.log('\nTest 2: Host creates room and joins LOBBY');
const host = {
  id: 'a0000000-0000-0000-0000-000000000001',
  nickname: 'DetectiveHolmes',
  avatar: '🕵️',
  isHost: true,
  isReady: true,
  score: 0,
};
const { room, players } = await RoomService.createRoom(host);
mockSessionStorage.setItem(ACTIVE_ROOM_ID_KEY, room.id);
mockSessionStorage.setItem(ACTIVE_VIEW_KEY, 'LOBBY');
globalThis.window.history.replaceState(null, '', `?room=${room.code}`);

// 3. User refreshes browser while in LOBBY
console.log('\nTest 3: Refreshing page while in LOBBY');
const lobbyRefreshMount = simulateAppMount();
assert.strictEqual(lobbyRefreshMount.view, 'LOBBY', 'Must remain in LOBBY on refresh');
assert.strictEqual(lobbyRefreshMount.currentRoom?.id, room.id, 'Room ID must match');
assert.strictEqual(lobbyRefreshMount.players.length, 1, 'Player count preserved');
console.log('✓ Browser refresh in LOBBY stays in LOBBY (no redirect to HOME)');

// 4. Host starts game -> enters CASE_INTRO
console.log('\nTest 4: Game starts and transitions to CASE_INTRO');
const initialGame = GameService.startGame(room, players);
mockSessionStorage.setItem(ACTIVE_VIEW_KEY, 'GAME');

// 5. User refreshes browser while in CASE_INTRO
console.log('\nTest 5: Refreshing page while in CASE_INTRO');
const introRefreshMount = simulateAppMount();
assert.strictEqual(introRefreshMount.view, 'GAME', 'Must remain in GAME view');
assert.strictEqual(introRefreshMount.gameState?.status, 'CASE_INTRO', 'Must be CASE_INTRO phase');
console.log('✓ Browser refresh during CASE_INTRO stays on CASE_INTRO');

// 6. Host advances to PLAYER_DRAWING
console.log('\nTest 6: Advancing to PLAYER_DRAWING');
const turn1 = GameService.startFirstTurn(initialGame);
assert.strictEqual(turn1.status, 'PLAYER_DRAWING');

// 7. User refreshes browser during drawing turn
console.log('\nTest 7: Refreshing page during PLAYER_DRAWING turn');
const drawingRefreshMount = simulateAppMount();
assert.strictEqual(drawingRefreshMount.view, 'GAME', 'Must remain in GAME view');
assert.strictEqual(drawingRefreshMount.gameState?.status, 'PLAYER_DRAWING', 'Must remain in PLAYER_DRAWING');
assert.strictEqual(drawingRefreshMount.gameState?.turnIndex, 0);
console.log('✓ Browser refresh during PLAYER_DRAWING stays on Drawing Canvas');

// 8. Host submits drawing -> INVESTIGATION
console.log('\nTest 8: Submitting drawing -> advancing to INVESTIGATION');
const investigationState = GameService.submitDrawing(turn1, turn1.currentTurnPlayerId, 'data:image/png;base64,sample');
assert.strictEqual(investigationState.status, 'INVESTIGATION');

// 9. User refreshes browser during INVESTIGATION board
console.log('\nTest 9: Refreshing page during INVESTIGATION phase');
const investRefreshMount = simulateAppMount();
assert.strictEqual(investRefreshMount.view, 'GAME');
assert.strictEqual(investRefreshMount.gameState?.status, 'INVESTIGATION');
assert.strictEqual(investRefreshMount.gameState?.evidenceCards.length, 1);
console.log('✓ Browser refresh during INVESTIGATION stays on Investigation Board');

// 10. User leaves room -> returns to HOME
console.log('\nTest 10: Leaving room cleans session and returns to HOME');
mockSessionStorage.removeItem(ACTIVE_ROOM_ID_KEY);
mockSessionStorage.removeItem(ACTIVE_VIEW_KEY);
globalThis.window.history.replaceState(null, '', '/');

const leftMount = simulateAppMount();
assert.strictEqual(leftMount.view, 'HOME');
assert.strictEqual(leftMount.currentRoom, null);
console.log('✓ Explicit leave returns cleanly to HOME');

console.log('\n=========================================');
console.log('ALL REFRESH PERSISTENCE TESTS PASSED! (10/10)');
console.log('=========================================');
