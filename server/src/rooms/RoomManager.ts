import { config } from '../config/index.js';
import { ErrorCode, Player, Room, RoomSettings } from '../types/index.js';
import { IdGenerator } from '../utils/idGenerator.js';
import { createLogger } from '../utils/logger.js';
import { AuthService } from '../auth/AuthService.js';
import { stateStore } from '../redis/StateStore.js';

const logger = createLogger('RoomManager');

export class RoomManager {
  private static rooms: Map<string, Room> = new Map();
  private static codeToRoomId: Map<string, string> = new Map();
  private static playerToRoomId: Map<string, string> = new Map();

  /**
   * Creates a new multiplayer room with a unique random join code
   */
  public static async createRoom(
    hostDisplayName: string,
    hostAvatar: string = 'detective-1',
    customSettings?: Partial<RoomSettings>
  ): Promise<{ room: Room; hostPlayer: Player; token: string }> {
    const roomId = IdGenerator.generateRoomId();
    let joinCode = IdGenerator.generateJoinCode();

    // Ensure unique join code
    while (this.codeToRoomId.has(joinCode)) {
      joinCode = IdGenerator.generateJoinCode();
    }

    const hostPlayerId = IdGenerator.generatePlayerId();
    const reconnectToken = IdGenerator.generateReconnectToken();

    const hostPlayer: Player = {
      playerId: hostPlayerId,
      displayName: hostDisplayName.trim(),
      avatar: hostAvatar,
      roomId,
      score: 0,
      isHost: true,
      isConnected: true,
      isReady: true,
      joinedAt: Date.now(),
      lastSeen: Date.now(),
      turnCount: 0,
      correctGuesses: 0,
      reconnectToken,
    };

    const settings: RoomSettings = {
      maxPlayers: customSettings?.maxPlayers || config.gameplay.defaultMaxPlayers,
      drawingTimeLimit: customSettings?.drawingTimeLimit || config.gameplay.defaultDrawingTimeSeconds,
      promptSelectionTimeLimit: customSettings?.promptSelectionTimeLimit || config.gameplay.defaultPromptSelectionSeconds,
      roundsPerGame: customSettings?.roundsPerGame || 6,
      storyId: customSettings?.storyId || 'all',
    };

    const room: Room = {
      roomId,
      joinCode,
      hostPlayerId,
      players: [hostPlayer],
      maxPlayers: settings.maxPlayers,
      status: 'LOBBY',
      createdAt: Date.now(),
      settings,
    };

    this.rooms.set(roomId, room);
    this.codeToRoomId.set(joinCode, roomId);
    this.playerToRoomId.set(hostPlayerId, roomId);

    await stateStore.set(`room:${joinCode}`, roomId, 86400);

    const token = AuthService.createSessionToken({
      playerId: hostPlayerId,
      displayName: hostPlayer.displayName,
      roomId,
      isHost: true,
      reconnectToken,
      issuedAt: Date.now(),
    });

    logger.info('Room created', { roomId, joinCode, hostPlayerId });
    return { room, hostPlayer, token };
  }

  /**
   * Joins an existing room via join code
   */
  public static async joinRoom(
    joinCode: string,
    displayName: string,
    avatar: string = 'detective-2'
  ): Promise<{ room: Room; player: Player; token: string }> {
    const normalizedCode = joinCode.trim().toUpperCase();
    const roomId = this.codeToRoomId.get(normalizedCode);

    if (!roomId) {
      const err = new Error(`Room with code ${normalizedCode} not found`);
      (err as any).code = ErrorCode.ROOM_NOT_FOUND;
      throw err;
    }

    const room = this.rooms.get(roomId);
    if (!room) {
      const err = new Error('Room record missing');
      (err as any).code = ErrorCode.ROOM_NOT_FOUND;
      throw err;
    }

    if (room.status !== 'LOBBY') {
      const err = new Error('Game is already in progress');
      (err as any).code = ErrorCode.GAME_ALREADY_STARTED;
      throw err;
    }

    if (room.players.length >= room.maxPlayers) {
      const err = new Error('Room is full');
      (err as any).code = ErrorCode.ROOM_FULL;
      throw err;
    }

    const playerId = IdGenerator.generatePlayerId();
    const reconnectToken = IdGenerator.generateReconnectToken();

    const player: Player = {
      playerId,
      displayName: displayName.trim(),
      avatar,
      roomId,
      score: 0,
      isHost: false,
      isConnected: true,
      isReady: false,
      joinedAt: Date.now(),
      lastSeen: Date.now(),
      turnCount: 0,
      correctGuesses: 0,
      reconnectToken,
    };

    room.players.push(player);
    this.playerToRoomId.set(playerId, roomId);

    const token = AuthService.createSessionToken({
      playerId,
      displayName: player.displayName,
      roomId,
      isHost: false,
      reconnectToken,
      issuedAt: Date.now(),
    });

    logger.info('Player joined room', { roomId, playerId, displayName });
    return { room, player, token };
  }

  /**
   * Updates player readiness in lobby
   */
  public static setPlayerReady(roomId: string, playerId: string, isReady: boolean): Room {
    const room = this.getRoomOrThrow(roomId);
    const player = room.players.find((p) => p.playerId === playerId);
    if (!player) {
      const err = new Error('Player not found in room');
      (err as any).code = ErrorCode.PLAYER_NOT_FOUND;
      throw err;
    }

    player.isReady = isReady;
    player.lastSeen = Date.now();
    return room;
  }

  /**
   * Updates room settings (host only)
   */
  public static updateRoomSettings(roomId: string, hostPlayerId: string, customSettings: Partial<RoomSettings>): Room {
    const room = this.getRoomOrThrow(roomId);
    if (room.hostPlayerId !== hostPlayerId) {
      const err = new Error('Only the host can update room settings');
      (err as any).code = ErrorCode.NOT_AUTHORIZED;
      throw err;
    }

    if (customSettings.storyId !== undefined) {
      room.settings.storyId = customSettings.storyId;
    }
    if (customSettings.drawingTimeLimit !== undefined) {
      room.settings.drawingTimeLimit = customSettings.drawingTimeLimit;
    }
    if (customSettings.promptSelectionTimeLimit !== undefined) {
      room.settings.promptSelectionTimeLimit = customSettings.promptSelectionTimeLimit;
    }
    if (customSettings.roundsPerGame !== undefined) {
      room.settings.roundsPerGame = customSettings.roundsPerGame;
    }
    if (customSettings.maxPlayers !== undefined) {
      room.settings.maxPlayers = customSettings.maxPlayers;
      room.maxPlayers = customSettings.maxPlayers;
    }

    return room;
  }

  /**
   * Removes a player from the room (voluntary leave or disconnect expiration)
   */
  public static leaveRoom(roomId: string, playerId: string): { room: Room | null; wasHost: boolean } {
    const room = this.rooms.get(roomId);
    if (!room) return { room: null, wasHost: false };

    const playerIndex = room.players.findIndex((p) => p.playerId === playerId);
    if (playerIndex === -1) return { room, wasHost: false };

    const [removedPlayer] = room.players.splice(playerIndex, 1);
    this.playerToRoomId.delete(playerId);
    const wasHost = removedPlayer.isHost;

    if (room.players.length === 0) {
      // Room empty, tear down
      this.rooms.delete(roomId);
      this.codeToRoomId.delete(room.joinCode);
      logger.info('Empty room removed', { roomId });
      return { room: null, wasHost };
    }

    if (wasHost && room.players.length > 0) {
      // Transfer host to next senior player
      room.players[0].isHost = true;
      room.hostPlayerId = room.players[0].playerId;
      logger.info('Host transferred', { roomId, newHostId: room.hostPlayerId });
    }

    return { room, wasHost };
  }

  /**
   * Host kicks a player from room
   */
  public static kickPlayer(roomId: string, hostPlayerId: string, targetPlayerId: string): Room {
    const room = this.getRoomOrThrow(roomId);
    if (room.hostPlayerId !== hostPlayerId) {
      const err = new Error('Only the host can kick players');
      (err as any).code = ErrorCode.NOT_AUTHORIZED;
      throw err;
    }

    if (hostPlayerId === targetPlayerId) {
      const err = new Error('Host cannot kick themselves');
      (err as any).code = ErrorCode.NOT_AUTHORIZED;
      throw err;
    }

    this.leaveRoom(roomId, targetPlayerId);
    return room;
  }

  public static getRoom(roomId: string): Room | null {
    return this.rooms.get(roomId) || null;
  }

  public static getRoomByCode(joinCode: string): Room | null {
    const roomId = this.codeToRoomId.get(joinCode.trim().toUpperCase());
    return roomId ? this.rooms.get(roomId) || null : null;
  }

  public static getPlayer(roomId: string, playerId: string): Player | null {
    const room = this.rooms.get(roomId);
    if (!room) return null;
    return room.players.find((p) => p.playerId === playerId) || null;
  }

  public static getRoomOrThrow(roomId: string): Room {
    const room = this.rooms.get(roomId);
    if (!room) {
      const err = new Error(`Room ${roomId} not found`);
      (err as any).code = ErrorCode.ROOM_NOT_FOUND;
      throw err;
    }
    return room;
  }

  public static markPlayerConnection(roomId: string, playerId: string, isConnected: boolean): void {
    const room = this.rooms.get(roomId);
    if (!room) return;
    const player = room.players.find((p) => p.playerId === playerId);
    if (player) {
      player.isConnected = isConnected;
      player.lastSeen = Date.now();
    }
  }

  public static updateRoomStatus(roomId: string, status: Room['status']): void {
    const room = this.rooms.get(roomId);
    if (room) {
      room.status = status;
    }
  }
}
