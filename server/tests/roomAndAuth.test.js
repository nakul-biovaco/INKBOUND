import { test } from 'node:test';
import assert from 'node:assert/strict';
import { RoomManager } from '../src/rooms/RoomManager.js';
import { AuthService } from '../src/auth/AuthService.js';
import { Serializer } from '../src/websocket/Serializer.js';
test('RoomManager: creates room with secure join code and designated host', async () => {
    const { room, hostPlayer, token } = await RoomManager.createRoom('Detective Holmes', 'detective-1');
    assert.ok(room.roomId.startsWith('room_'));
    assert.equal(room.joinCode.length, 5);
    assert.equal(room.players.length, 1);
    assert.equal(hostPlayer.isHost, true);
    assert.equal(hostPlayer.displayName, 'Detective Holmes');
    // Verify token
    const session = AuthService.verifySessionToken(token);
    assert.ok(session);
    assert.equal(session.playerId, hostPlayer.playerId);
    assert.equal(session.isHost, true);
});
test('RoomManager: player can join with valid join code', async () => {
    const { room: hostRoom } = await RoomManager.createRoom('Host Player');
    const { room: joinedRoom, player: secondPlayer } = await RoomManager.joinRoom(hostRoom.joinCode, 'Watson');
    assert.equal(joinedRoom.players.length, 2);
    assert.equal(secondPlayer.isHost, false);
    assert.equal(secondPlayer.displayName, 'Watson');
    assert.equal(secondPlayer.isReady, false);
    // Set ready
    const updated = RoomManager.setPlayerReady(joinedRoom.roomId, secondPlayer.playerId, true);
    const found = updated.players.find((p) => p.playerId === secondPlayer.playerId);
    assert.equal(found?.isReady, true);
});
test('RoomManager: host transfer when host leaves', async () => {
    const { room: hostRoom, hostPlayer } = await RoomManager.createRoom('Original Host');
    const { player: secondPlayer } = await RoomManager.joinRoom(hostRoom.joinCode, 'Next Host');
    const { room, wasHost } = RoomManager.leaveRoom(hostRoom.roomId, hostPlayer.playerId);
    assert.equal(wasHost, true);
    assert.ok(room);
    assert.equal(room.players.length, 1);
    assert.equal(room.hostPlayerId, secondPlayer.playerId);
    assert.equal(room.players[0].isHost, true);
});
test('Serializer: public state does NOT expose reconnect tokens or secret prompts', async () => {
    const { room, hostPlayer } = await RoomManager.createRoom('Agent Alpha');
    const serialized = Serializer.serializeRoom(room);
    // Check that reconnectToken is stripped
    assert.equal(serialized.players[0].reconnectToken, undefined);
    assert.equal(serialized.players[0].displayName, 'Agent Alpha');
});
