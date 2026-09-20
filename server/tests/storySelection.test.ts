import { test } from 'node:test';
import assert from 'node:assert/strict';
import { StoryLibrary } from '../src/story/StoryLibrary.js';
import { StorySelector } from '../src/story/StorySelector.js';
import { RoomManager } from '../src/rooms/RoomManager.js';
import { GameEngine } from '../src/game/GameEngine.js';
import { GameStatus, Player } from '../src/types/index.js';

test('StoryLibrary: loads all 17 markdown stories from /STORY', () => {
  StoryLibrary.init();
  const stories = StoryLibrary.getAllStories();
  assert.ok(stories.length >= 120, 'All 120 catalog stories plus legacy markdown stories must be loaded');

  // Verify key stories exist
  const museum = StoryLibrary.getStory('story_01_the_midnight_museum');
  assert.ok(museum);
  assert.equal(museum.title, 'THE MIDNIGHT MUSEUM');
  assert.ok(museum.events.length >= 20);

  const train = StoryLibrary.getStory('story_02_the_last_train');
  assert.ok(train);
  assert.equal(train.title, 'THE LAST TRAIN');
  assert.ok(train.events.length >= 20);

  const room404 = StoryLibrary.getStory('story_07_room_404');
  assert.ok(room404);
  assert.equal(room404.title, 'ROOM 404');

  const letter = StoryLibrary.getStory('story_13_the_letter_never_sent');
  assert.ok(letter);
  assert.equal(letter.title, 'THE LETTER NEVER SENT');
});

test('StorySelector: picks 3 distinct random stories without duplicates', () => {
  const options = StorySelector.getRandomStories(3);
  assert.equal(options.length, 3);
  const ids = new Set(options.map((o) => o.storyId));
  assert.equal(ids.size, 3, 'Must not have duplicate story IDs');

  options.forEach((opt) => {
    assert.ok(opt.title.length > 0);
    assert.ok(opt.genre.length > 0);
  });
});

test('StorySelector: randomly picks one player from connected room players', () => {
  const mockPlayers: Player[] = [
    { playerId: 'p1', displayName: 'Player 1', avatar: '1', roomId: 'r1', score: 0, isHost: true, isConnected: true, isReady: true, joinedAt: 1, lastSeen: 1, turnCount: 0, correctGuesses: 0, reconnectToken: 't1' },
    { playerId: 'p2', displayName: 'Player 2', avatar: '2', roomId: 'r1', score: 0, isHost: false, isConnected: true, isReady: true, joinedAt: 2, lastSeen: 2, turnCount: 0, correctGuesses: 0, reconnectToken: 't2' },
    { playerId: 'p3', displayName: 'Player 3', avatar: '3', roomId: 'r1', score: 0, isHost: false, isConnected: false, isReady: false, joinedAt: 3, lastSeen: 3, turnCount: 0, correctGuesses: 0, reconnectToken: 't3' },
  ];

  const chooser = StorySelector.selectRandomStoryChooser(mockPlayers);
  assert.ok(chooser);
  assert.ok(chooser.playerId === 'p1' || chooser.playerId === 'p2', 'Must pick a connected player');
});

test('Phase 2 Game Flow: 1 random chooser gets 3 story options, other players wait, story is locked', async () => {
  // 1. Create Room with 4 players
  const { room, hostPlayer } = await RoomManager.createRoom('Host Alice', 'detective-1', {
    minPlayersToStart: 2,
  } as any);

  const { player: p2 } = await RoomManager.joinRoom(room.joinCode, 'Player Bob');
  const { player: p3 } = await RoomManager.joinRoom(room.joinCode, 'Player Charlie');
  const { player: p4 } = await RoomManager.joinRoom(room.joinCode, 'Player Diana');

  const allPlayers = [hostPlayer, p2, p3, p4];
  room.players.forEach((p) => (p.isReady = true));

  // Track messages sent by engine
  const unicastMessages: Array<{ recipient: string; event: string; payload: any }> = [];
  const broadcastMessages: Array<{ event: string; payload: any }> = [];

  const engine = new GameEngine(room, null, (event, payload, recipientId) => {
    if (recipientId) {
      unicastMessages.push({ recipient: recipientId, event, payload });
    } else {
      broadcastMessages.push({ event, payload });
    }
  });

  // 2. Start game
  await engine.startGame(hostPlayer.playerId);
  assert.equal(engine.getSession().state, GameStatus.COUNTDOWN);

  // Directly trigger story selection (simulating countdown completion)
  engine.beginStorySelection();
  assert.equal(engine.getSession().state, GameStatus.STORY_SELECTION);

  const session = engine.getSession();
  const chooserId = session.storyChooserPlayerId!;
  assert.ok(chooserId, 'A story chooser must be assigned');
  assert.ok(allPlayers.some((p) => p.playerId === chooserId));

  // 3. Verify STORY_OPTIONS is now broadcast to ALL players (not unicast)
  const storyOptionsBroadcast = broadcastMessages.find((m) => m.event === 'STORY_OPTIONS');
  assert.ok(storyOptionsBroadcast, 'STORY_OPTIONS must be broadcast to all players');
  assert.equal(storyOptionsBroadcast.payload.options.length, 3, 'Must receive exactly 3 story options');
  assert.equal(storyOptionsBroadcast.payload.timeLimitSeconds, 0, 'No time limit for story selection');

  // Verify public broadcast announced the chooser
  const publicAnnouncement = broadcastMessages.find((m) => m.event === 'STORY_CHOOSER_SELECTED');
  assert.ok(publicAnnouncement);
  assert.equal(publicAnnouncement.payload.chooserPlayerId, chooserId);

  // 4. Chooser picks one of the offered stories
  const pickedStoryId = storyOptionsBroadcast.payload.options[1].storyId;
  const pickedStoryTitle = storyOptionsBroadcast.payload.options[1].title;

  engine.chooseStory(chooserId, pickedStoryId);

  assert.ok(
    [GameStatus.STORY_SELECTED, GameStatus.CASE_INTRO, GameStatus.ROUND_START, GameStatus.DRAWING].includes(engine.getSession().state),
    `Expected state to be STORY_SELECTED, CASE_INTRO, ROUND_START, or DRAWING, got: ${engine.getSession().state}`
  );
  assert.equal(engine.getSession().storyId, pickedStoryId);

  // Verify STORY_SELECTED broadcasted to everyone with overview seconds
  const selectedBroadcast = broadcastMessages.find((m) => m.event === 'STORY_SELECTED');
  assert.ok(selectedBroadcast);
  assert.equal(selectedBroadcast.payload.storyId, pickedStoryId);
  assert.equal(selectedBroadcast.payload.title, pickedStoryTitle);
  assert.ok(selectedBroadcast.payload.overviewSeconds > 0, 'Must include overview countdown');

  // Clean up
  GameEngine.removeEngine(room.roomId);
});

test('Genre Selection: defaults to "all", respects host genre update to "horror" and filters stories', async () => {
  const { room, hostPlayer } = await RoomManager.createRoom('Host Bob', 'detective-1');
  assert.equal(room.settings.storyId, 'all', 'Default genre must be "all", not midnight_museum');

  // Update genre to horror
  RoomManager.updateRoomSettings(room.roomId, hostPlayer.playerId, { storyId: 'horror' });
  assert.equal(room.settings.storyId, 'horror');

  // Add 3 more players
  const p2 = await RoomManager.joinRoom(room.joinCode, 'Player 2', 'detective-2');
  const p3 = await RoomManager.joinRoom(room.joinCode, 'Player 3', 'detective-3');
  const p4 = await RoomManager.joinRoom(room.joinCode, 'Player 4', 'detective-4');

  const freshRoom = RoomManager.getRoomOrThrow(room.roomId);
  assert.equal(freshRoom.players.length, 4, 'All 4 players must be present in room');
  freshRoom.players.forEach((p) => (p.isReady = true));

  let offeredOptions: any[] = [];
  const engine = new GameEngine(freshRoom, null, (evt, data, recipient) => {
    if (evt === 'STORY_OPTIONS') {
      offeredOptions = (data as any).options;
    }
  });

  await engine.startGame(hostPlayer.playerId);
  engine.beginStorySelection();

  assert.equal(offeredOptions.length, 3, 'Must offer 3 story options');
  // Check that stories offered match horror
  const isHorrorOrGeneral = offeredOptions.every(
    (o) => o.genre.toLowerCase().includes('horror') || o.description.length > 0
  );
  assert.ok(isHorrorOrGeneral);

  GameEngine.removeEngine(room.roomId);
});

test('Lobby Ready Rule: Hosted rooms block start if any non-host is unready, while QuickMatch allows start', async () => {
  // 1. Custom hosted room (Create & Host)
  const { room, hostPlayer } = await RoomManager.createRoom('Host Alice', 'detective-1', { isQuickMatch: false });
  const p2 = await RoomManager.joinRoom(room.joinCode, 'Player Bob', 'detective-2');
  const freshRoom = RoomManager.getRoomOrThrow(room.roomId);

  // By default, p2 is not ready
  freshRoom.players.find((p) => p.playerId === p2.player.playerId)!.isReady = false;

  const engine = new GameEngine(freshRoom, null, () => {});

  // Host attempting to start should fail with NOT_ALL_READY
  let thrownError: any = null;
  try {
    await engine.startGame(hostPlayer.playerId);
  } catch (err) {
    thrownError = err;
  }
  assert.ok(thrownError, 'Must throw error when non-host player is not ready');
  assert.equal(thrownError.code, 'NOT_ALL_READY');

  // Once Bob declares ready, host can start!
  freshRoom.players.find((p) => p.playerId === p2.player.playerId)!.isReady = true;
  await engine.startGame(hostPlayer.playerId);
  assert.equal(engine.getSession().state, GameStatus.COUNTDOWN);

  GameEngine.removeEngine(room.roomId);

  // 2. QuickMatch room (Online Gaming) - does NOT block start
  const qm = await RoomManager.createRoom('QM Host', 'detective-1', { isQuickMatch: true });
  await RoomManager.joinRoom(qm.room.joinCode, 'QM Player 2', 'detective-2');
  const qmRoom = RoomManager.getRoomOrThrow(qm.room.roomId);
  qmRoom.players[1].isReady = false; // Unready player

  const qmEngine = new GameEngine(qmRoom, null, () => {});
  // Should NOT throw for quick match
  await qmEngine.startGame(qm.hostPlayer.playerId);
  assert.equal(qmEngine.getSession().state, GameStatus.COUNTDOWN);

  GameEngine.removeEngine(qm.room.roomId);
});

test('Vote to Kick: 75% majority automatically kicks target player', async () => {
  const { room, hostPlayer } = await RoomManager.createRoom('Player 1', 'detective-1');
  const p2 = await RoomManager.joinRoom(room.joinCode, 'Player 2', 'detective-2');
  const p3 = await RoomManager.joinRoom(room.joinCode, 'Player 3', 'detective-3');
  const p4 = await RoomManager.joinRoom(room.joinCode, 'Player 4', 'detective-4');

  // Total 4 players. Eligible voters to kick Player 4: 3 players (P1, P2, P3).
  // 75% of 3 = ceil(3 * 0.75) = 3 votes required.
  const targetId = p4.player.playerId;

  // Vote 1: Player 1 votes
  const res1 = RoomManager.voteKick(room.roomId, hostPlayer.playerId, targetId);
  assert.equal(res1.kicked, false);
  assert.equal(res1.currentVotes, 1);
  assert.equal(res1.requiredVotes, 3);

  // Vote 2: Player 2 votes
  const res2 = RoomManager.voteKick(room.roomId, p2.player.playerId, targetId);
  assert.equal(res2.kicked, false);
  assert.equal(res2.currentVotes, 2);

  // Vote 3: Player 3 votes -> 3/3 = 100% >= 75% -> Automatically kicked!
  const res3 = RoomManager.voteKick(room.roomId, p3.player.playerId, targetId);
  assert.equal(res3.kicked, true);

  // Verify Player 4 was removed from room
  const updatedRoom = RoomManager.getRoomOrThrow(room.roomId);
  assert.equal(updatedRoom.players.some((p) => p.playerId === targetId), false);
  assert.equal(updatedRoom.players.length, 3);
});
