import test from 'node:test';
import assert from 'node:assert/strict';
import { RoomManager } from '../src/rooms/RoomManager.js';
import { GameEngine } from '../src/game/GameEngine.js';
import { TurnManager } from '../src/game/TurnManager.js';
import { GuessEngine } from '../src/guessing/GuessEngine.js';
import { ScoreEngine } from '../src/game/ScoreEngine.js';
import { StoryLibrary } from '../src/story/StoryLibrary.js';
import { Serializer } from '../src/websocket/Serializer.js';
import { DrawingManager } from '../src/drawing/DrawingManager.js';
import { GameStatus, Player } from '../src/types/index.js';

test('Phase 3: TurnManager first drawer randomization and sequential rotation', () => {
  const mockPlayers: Player[] = [
    { playerId: 'p1', displayName: 'Player 1', avatar: 'd1', isHost: true, isReady: true, isConnected: true, score: 0, correctGuesses: 0, turnCount: 0, joinedAt: 100 },
    { playerId: 'p2', displayName: 'Player 2', avatar: 'd2', isHost: false, isReady: true, isConnected: true, score: 0, correctGuesses: 0, turnCount: 0, joinedAt: 200 },
    { playerId: 'p3', displayName: 'Player 3', avatar: 'd3', isHost: false, isReady: true, isConnected: true, score: 0, correctGuesses: 0, turnCount: 0, joinedAt: 300 },
    { playerId: 'p4', displayName: 'Player 4', avatar: 'd4', isHost: false, isReady: true, isConnected: true, score: 0, correctGuesses: 0, turnCount: 0, joinedAt: 400 },
  ];

  const tm = new TurnManager(mockPlayers);
  assert.equal(tm.getTurnOrder().length, 4);

  // Randomize first drawer once
  tm.randomizeFirstDrawer();
  const first = tm.advanceTurn(mockPlayers)!;
  assert.ok(first);
  assert.ok(mockPlayers.some(p => p.playerId === first.drawerId));

  // Following turns rotate sequentially
  const order = tm.getTurnOrder();
  const firstIdx = order.indexOf(first.drawerId);

  const second = tm.advanceTurn(mockPlayers)!;
  assert.equal(second.drawerId, order[(firstIdx + 1) % 4]);

  const third = tm.advanceTurn(mockPlayers)!;
  assert.equal(third.drawerId, order[(firstIdx + 2) % 4]);

  const fourth = tm.advanceTurn(mockPlayers)!;
  assert.equal(fourth.drawerId, order[(firstIdx + 3) % 4]);

  // Wraps around to first drawer
  const fifth = tm.advanceTurn(mockPlayers)!;
  assert.equal(fifth.drawerId, first.drawerId);
});

function advanceToStorySelected(engine: GameEngine) {
  engine.getStateMachine().transition(GameStatus.COUNTDOWN);
  engine.getStateMachine().transition(GameStatus.STORY_SELECTION);
  engine.getStateMachine().transition(GameStatus.STORY_SELECTED);
}

test('Phase 3: Security - Serializer hides secret prompt and private story variables from public', async () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_01_the_midnight_museum')!;

  const { room, hostPlayer } = await RoomManager.createRoom('Host', 'd1');
  const { player: p2 } = await RoomManager.joinRoom(room.joinCode, 'Guesser', 'd2');

  const engine = new GameEngine(room, story);
  advanceToStorySelected(engine);
  engine.beginTurn();

  const session = engine.getSession();
  const publicState = Serializer.getPublicGameState(session, room);
  const drawerState = Serializer.getDrawerState(session);
  const guesserPrivate = Serializer.getPlayerPrivateState(session, room, p2.playerId);

  // Public state must NOT leak prompt options or drawing objective
  assert.equal((publicState as any).selectedObjective, undefined);
  assert.equal((publicState as any).activePromptOptions, undefined);

  // Drawer state has options and objective
  assert.ok(drawerState.options && drawerState.options.length === 3);

  // Guesser private state isDrawer is FALSE and drawerState is null
  assert.equal(guesserPrivate.isDrawer, false);
  assert.equal(guesserPrivate.drawerState, null);

  GameEngine.removeEngine(room.roomId);
});

test('Phase 3: Drawer cannot guess their own drawing', async () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_01_the_midnight_museum')!;

  const { room, hostPlayer } = await RoomManager.createRoom('Host', 'd1');
  const { player: guesser } = await RoomManager.joinRoom(room.joinCode, 'Guesser', 'd2');

  const engine = new GameEngine(room, story);
  advanceToStorySelected(engine);
  engine.beginTurn();
  const currentDrawerId = engine.getSession().currentDrawerId!;
  engine.selectPrompt(currentDrawerId, 0);

  // Drawer attempting to guess should be rejected with ErrorCode
  await assert.rejects(
    async () => {
      await engine.handleGuess(currentDrawerId, 'some guess');
    },
    (err: any) => err.code === 'DRAWER_CANNOT_GUESS' || err.message.includes('cannot guess')
  );

  GameEngine.removeEngine(room.roomId);
});

test('Phase 3: Guess Evaluation - Exact, Close, and Wrong verdicts', () => {
  const targetEvent = {
    eventId: 'test_evt_1',
    act: 1,
    sequence: 1,
    eventType: 'DRAW_EVENT' as const,
    drawingObjective: 'The mysterious letter on the desk',
    visualElements: ['letter', 'desk', 'paper'],
    acceptedConcepts: ['letter on desk', 'mysterious letter', 'envelope on table'],
    semanticKeywords: ['letter', 'desk', 'paper', 'envelope'],
    hint: 'Look at the paper on the furniture.',
    difficulty: 'EASY' as const,
    narrativeDescription: 'A letter is placed on the desk.',
    consequenceReveal: 'The letter reveals the meeting location.',
  };

  const exactRes = GuessEngine.evaluate('mysterious letter', targetEvent);
  assert.equal(exactRes.verdict, 'CORRECT');

  const closeRes = GuessEngine.evaluate('letter on the floor', targetEvent);
  assert.equal(closeRes.verdict, 'CLOSE');

  const wrongRes = GuessEngine.evaluate('a flying airplane', targetEvent);
  assert.equal(wrongRes.verdict, 'WRONG');
});

test('Phase 3: Guess Spam Protection - Rate limiting and duplicate suppression', async () => {
  const playerId = 'spam_tester_' + Date.now();
  const targetEvent = {
    eventId: 'e1',
    act: 1,
    sequence: 1,
    eventType: 'DRAW_EVENT' as const,
    drawingObjective: 'golden key',
    visualElements: ['key', 'gold'],
    acceptedConcepts: ['golden key'],
    semanticKeywords: ['golden', 'key'],
    hint: 'A shiny object',
    difficulty: 'EASY' as const,
    narrativeDescription: 'A key',
    consequenceReveal: 'Unlocked',
  };

  // 1st guess allowed
  const res1 = await GuessEngine.canSubmitGuess(playerId, 'wooden door');
  assert.equal(res1.allowed, true);

  // Duplicate guess immediately within 2s rejected
  const resDuplicate = await GuessEngine.canSubmitGuess(playerId, 'wooden door');
  assert.equal(resDuplicate.allowed, false);
  assert.equal(resDuplicate.reason, 'DUPLICATE_GUESS');

  // Submit rapidly to hit rate limit (max 2 per second)
  await GuessEngine.canSubmitGuess(playerId, 'iron box');
  const resSpam = await GuessEngine.canSubmitGuess(playerId, 'silver spoon');
  assert.equal(resSpam.allowed, false);
  assert.equal(resSpam.reason, 'RATE_LIMITED');
});

test('Phase 3: Race Condition - Simultaneous correct guesses awards exactly one winner', async () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_01_the_midnight_museum')!;

  const { room } = await RoomManager.createRoom('Host', 'd1');
  const { player: pA } = await RoomManager.joinRoom(room.joinCode, 'Alice', 'd2');
  const { player: pB } = await RoomManager.joinRoom(room.joinCode, 'Bob', 'd3');

  let clueSolvedCount = 0;
  let winnerPlayerId: string | null = null;

  const engine = new GameEngine(room, story, (event, payload) => {
    if (event === 'CLUE_SOLVED') {
      clueSolvedCount++;
      winnerPlayerId = (payload as any).solverPlayerId;
    }
  });

  advanceToStorySelected(engine);
  engine.beginTurn();
  const drawerId = engine.getSession().currentDrawerId!;
  engine.selectPrompt(drawerId, 0);

  const target = engine.getSession().selectedEvent!;
  const correctText = target.drawingObjective;

  // Alice and Bob submit correct guess simultaneously
  await Promise.all([
    engine.handleGuess(pA.playerId, correctText),
    engine.handleGuess(pB.playerId, correctText),
  ]);

  // Exactly ONE clue solved event must fire
  assert.equal(clueSolvedCount, 1);
  assert.ok(winnerPlayerId === pA.playerId || winnerPlayerId === pB.playerId);

  // State must be in CLUE_SOLVED or STORY_REVEAL
  assert.equal(engine.getSession().state, GameStatus.CLUE_SOLVED);

  GameEngine.removeEngine(room.roomId);
});

test('Phase 3: Score calculation rewards both solver and drawer based on speed', () => {
  const event = {
    eventId: 'e1',
    act: 1,
    sequence: 1,
    eventType: 'DRAW_EVENT' as const,
    drawingObjective: 'secret safe',
    visualElements: ['safe'],
    acceptedConcepts: ['safe'],
    semanticKeywords: ['safe'],
    hint: 'heavy box',
    difficulty: 'HARD' as const,
    narrativeDescription: 'Safe',
    consequenceReveal: 'Open',
    basePoints: 150,
  };

  // Solved very fast (50s remaining of 60s)
  const fastScore = ScoreEngine.calculateRoundScore(event, 60, 50, 'p_solver', 'p_drawer');
  // Solved slow (5s remaining of 60s)
  const slowScore = ScoreEngine.calculateRoundScore(event, 60, 5, 'p_solver', 'p_drawer');

  assert.ok(fastScore.solverPoints > slowScore.solverPoints, 'Faster solver gets higher score');
  assert.ok(fastScore.drawerPoints > slowScore.drawerPoints, 'Faster solve awards drawer more points');
  assert.ok(fastScore.speedBonus > slowScore.speedBonus);
});

test('Phase 3: Drawing synchronization and replay buffer on reconnect', async () => {
  const roomId = 'room_drawing_test_' + Date.now();
  const turnIndex = 0;

  await DrawingManager.clearTurnStrokes(roomId, turnIndex);

  const stroke1 = {
    strokeId: 'str_1',
    turnIndex,
    playerId: 'drawer_1',
    tool: 'pencil' as const,
    color: '#ffffff',
    width: 2,
    points: [{ x: 0.1, y: 0.2 }, { x: 0.2, y: 0.3 }],
    isComplete: true,
    timestamp: Date.now(),
  };

  const stroke2 = {
    strokeId: 'str_2',
    turnIndex,
    playerId: 'drawer_1',
    tool: 'pencil' as const,
    color: '#ffffff',
    width: 2,
    points: [{ x: 0.4, y: 0.5 }, { x: 0.6, y: 0.7 }],
    isComplete: true,
    timestamp: Date.now(),
  };

  await DrawingManager.recordStroke(roomId, turnIndex, stroke1);
  await DrawingManager.recordStroke(roomId, turnIndex, stroke2);

  // Reconnecting player retrieves all strokes for this turn
  const recorded = await DrawingManager.getTurnStrokes(roomId, turnIndex);
  assert.equal(recorded.length, 2);
  assert.equal(recorded[0].strokeId, 'str_1');
  assert.equal(recorded[1].strokeId, 'str_2');
});
