import { test } from 'node:test';
import assert from 'node:assert/strict';
import { RoomManager } from '../src/rooms/RoomManager.js';

test('RoomManager.quickMatch: First player creates public room, second player aggregates into same room', async () => {
  // Player 1 quick matches
  const res1 = await RoomManager.quickMatch('Sherlock', 'detective', { genre: 'all' });
  assert.ok(res1.room);
  assert.equal(res1.isNewRoom, true);
  assert.equal(res1.room.settings.isPublic, true);
  assert.equal(res1.player.displayName, 'Sherlock');
  assert.equal(res1.room.players.length, 1);

  // Player 2 quick matches - MUST join the same room to prevent fragmented games!
  const res2 = await RoomManager.quickMatch('Watson', 'magnifier', { genre: 'all' });
  assert.equal(res2.isNewRoom, false);
  assert.equal(res2.room.roomId, res1.room.roomId);
  assert.equal(res2.room.players.length, 2);
  assert.equal(res2.player.displayName, 'Watson');

  // Player 3 quick matches - joins same room
  const res3 = await RoomManager.quickMatch('Lestrade', 'badge', { genre: 'all' });
  assert.equal(res3.isNewRoom, false);
  assert.equal(res3.room.roomId, res1.room.roomId);
  assert.equal(res3.room.players.length, 3);
});

test('RoomManager.quickMatch: Private rooms are excluded from quick match queue', async () => {
  // Create a private room
  const privateRoom = await RoomManager.createRoom('PrivateHost', 'avatar-1', {
    isPublic: false,
  });
  assert.equal(privateRoom.room.settings.isPublic, false);

  // Create a public room with 1 player
  const publicRoom = await RoomManager.quickMatch('PublicHost', 'avatar-2');

  // Quick match player should join the public room, NOT the private room
  const quickJoiner = await RoomManager.quickMatch('RandomPlayer', 'avatar-3');
  assert.equal(quickJoiner.room.roomId, publicRoom.room.roomId);
  assert.notEqual(quickJoiner.room.roomId, privateRoom.room.roomId);
});

test('RoomManager.getGlobalStats: returns active rooms and connected detectives count', async () => {
  const stats = RoomManager.getGlobalStats();
  assert.ok(typeof stats.activeRooms === 'number');
  assert.ok(typeof stats.onlineDetectives === 'number');
  assert.ok(stats.activeRooms >= 1);
  assert.ok(stats.onlineDetectives >= 1);
});
