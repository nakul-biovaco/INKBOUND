import test from 'node:test';
import assert from 'node:assert';
import {
  DrawLiveUpdateSchema,
  DrawUndoSchema,
  WSClientEvent,
  WSServerEvent,
  Room,
} from '../src/types/index.js';
import { RoomManager } from '../src/rooms/RoomManager.js';
import { GameEngine } from '../src/game/GameEngine.js';

test('Realtime Live Drawing: DrawLiveUpdateSchema validates and clamps coordinates', () => {
  const input = {
    strokeId: 'str_123',
    tool: 'pencil',
    color: '#dc2626',
    width: 6,
    points: [
      { x: -0.2, y: 0.5 },
      { x: 0.8, y: 1.4 },
    ],
    isStart: true,
    isComplete: false,
    timestamp: Date.now(),
  };

  const parsed = DrawLiveUpdateSchema.parse(input);
  assert.strictEqual(parsed.strokeId, 'str_123');
  assert.strictEqual(parsed.tool, 'pencil');
  assert.strictEqual(parsed.color, '#dc2626');
  assert.strictEqual(parsed.width, 6);
  assert.strictEqual(parsed.isStart, true);
  assert.strictEqual(parsed.isComplete, false);
  // Clamping check
  assert.strictEqual(parsed.points[0].x, 0);
  assert.strictEqual(parsed.points[0].y, 0.5);
  assert.strictEqual(parsed.points[1].x, 0.8);
  assert.strictEqual(parsed.points[1].y, 1);
});

test('Realtime Live Drawing: DrawUndoSchema validates strokes array', () => {
  const parsed = DrawUndoSchema.parse({
    strokes: [{ id: 's1' }, { id: 's2' }],
  });
  assert.strictEqual(parsed.strokes.length, 2);

  const emptyParsed = DrawUndoSchema.parse({});
  assert.deepStrictEqual(emptyParsed.strokes, []);
});

test('Realtime Live Drawing: GameEngine stroke completion & undo semantics', async () => {
  const { room, hostPlayer } = await RoomManager.createRoom('Drawer');
  const { player: secondPlayer } = await RoomManager.joinRoom(room.joinCode, 'Guesser');
  RoomManager.setPlayerReady(room.roomId, secondPlayer.playerId, true);

  const engine = new GameEngine(room, null, () => {});
  await engine.startGame(hostPlayer.playerId);

  // Advance to drawing state
  (engine as any).stateMachine.currentStatus = 'DRAWING';
  (engine as any).session.currentDrawerId = hostPlayer.playerId;

  assert.strictEqual(engine.isDrawingActive(), true);
  assert.strictEqual(engine.getCurrentDrawerId(), hostPlayer.playerId);

  // 1. In-flight chunk (isComplete: false) should NOT pollute drawingStrokes buffer
  await engine.handleStroke(hostPlayer.playerId, {
    strokeId: 's_live_1',
    tool: 'pencil',
    color: '#000000',
    width: 4,
    points: [{ x: 0.1, y: 0.1 }, { x: 0.2, y: 0.2 }],
    isComplete: false,
    timestamp: Date.now(),
  });

  assert.strictEqual((engine as any).session.drawingStrokes.length, 0);

  // 2. Finalized stroke (isComplete: true) is recorded into session buffer
  await engine.handleStroke(hostPlayer.playerId, {
    strokeId: 's_live_1',
    tool: 'pencil',
    color: '#000000',
    width: 4,
    points: [{ x: 0.1, y: 0.1 }, { x: 0.2, y: 0.2 }, { x: 0.3, y: 0.3 }],
    isComplete: true,
    timestamp: Date.now(),
  });

  assert.strictEqual((engine as any).session.drawingStrokes.length, 1);
  assert.strictEqual((engine as any).session.drawingStrokes[0].strokeId, 's_live_1');

  // 3. Add second stroke
  await engine.handleStroke(hostPlayer.playerId, {
    strokeId: 's_live_2',
    tool: 'pencil',
    color: '#000000',
    width: 4,
    points: [{ x: 0.4, y: 0.4 }, { x: 0.5, y: 0.5 }],
    isComplete: true,
    timestamp: Date.now(),
  });

  assert.strictEqual((engine as any).session.drawingStrokes.length, 2);

  // 4. Undo synchronizes session buffer
  engine.handleUndo(hostPlayer.playerId);
  assert.strictEqual((engine as any).session.drawingStrokes.length, 1);
  assert.strictEqual((engine as any).session.drawingStrokes[0].strokeId, 's_live_1');

  // 5. Explicit strokes array undo
  engine.handleUndo(hostPlayer.playerId, []);
  assert.strictEqual((engine as any).session.drawingStrokes.length, 0);
});
