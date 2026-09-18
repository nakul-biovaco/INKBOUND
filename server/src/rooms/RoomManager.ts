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
      isPublic: customSettings?.isPublic !== false,
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
      isPublic: settings.isPublic,
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
    const cleanCode = joinCode.trim();
    const normalizedCode = cleanCode.toUpperCase();
    let roomId = this.codeToRoomId.get(normalizedCode);

    if (!roomId) {
      if (this.rooms.has(cleanCode)) {
        roomId = cleanCode;
      } else {
        for (const r of this.rooms.values()) {
          if (r.joinCode.toUpperCase() === normalizedCode || r.roomId === cleanCode) {
            roomId = r.roomId;
            break;
          }
        }
      }
    }

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

    const cleanDisplayName = displayName.trim();

    // 1. Check if player with this display name is already in the room (re-entering / rejoining)
    const existingPlayer = room.players.find(
      (p) => p.displayName.trim().toLowerCase() === cleanDisplayName.toLowerCase()
    );

    if (existingPlayer) {
      existingPlayer.isConnected = true;
      existingPlayer.lastSeen = Date.now();
      if (avatar) existingPlayer.avatar = avatar;
      this.playerToRoomId.set(existingPlayer.playerId, roomId);

      const token = AuthService.createSessionToken({
        playerId: existingPlayer.playerId,
        displayName: existingPlayer.displayName,
        roomId,
        isHost: existingPlayer.isHost,
        reconnectToken: existingPlayer.reconnectToken,
        issuedAt: Date.now(),
      });

      logger.info('Player re-entered room', { roomId, playerId: existingPlayer.playerId, displayName: cleanDisplayName });
      return { room, player: existingPlayer, token };
    }

    // 2. For completely new players, check room capacity
    if (room.players.length >= room.maxPlayers) {
      const err = new Error('Room is full');
      (err as any).code = ErrorCode.ROOM_FULL;
      throw err;
    }

    const playerId = IdGenerator.generatePlayerId();
    const reconnectToken = IdGenerator.generateReconnectToken();

    const player: Player = {
      playerId,
      displayName: cleanDisplayName,
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
   * Finds an available public room for quick matchmaking, or automatically creates a new one.
   * Aggregates players into the fullest open lobby first so games fill up quickly!
   */
  public static async quickMatch(
    displayName: string,
    avatar: string = 'detective-1',
    options?: { genre?: string }
  ): Promise<{ room: Room; player: Player; token: string; isNewRoom: boolean }> {
    const cleanName = displayName.trim() || 'Detective';

    // 1. Find all eligible open public rooms in LOBBY state
    const eligibleLobbies = Array.from(this.rooms.values()).filter((r) => {
      if (r.isPublic === false) return false;
      if (r.status !== 'LOBBY') return false;
      const activeCount = r.players.filter((p) => p.isConnected).length;
      if (activeCount >= r.maxPlayers || activeCount === 0) return false;
      if (options?.genre && options.genre !== 'all' && r.settings.storyId !== 'all') {
        if (!r.settings.storyId.toLowerCase().includes(options.genre.toLowerCase())) {
          return false;
        }
      }
      return true;
    });

    // 2. Sort by player count descending -> fill the room closest to capacity first!
    eligibleLobbies.sort((a, b) => {
      const aCount = a.players.filter((p) => p.isConnected).length;
      const bCount = b.players.filter((p) => p.isConnected).length;
      return bCount - aCount;
    });

    if (eligibleLobbies.length > 0) {
      const targetRoom = eligibleLobbies[0];
      logger.info('QuickMatch matched into existing public room', {
        joinCode: targetRoom.joinCode,
        currentPlayers: targetRoom.players.length,
        candidateName: cleanName,
      });
      const joined = await this.joinRoom(targetRoom.joinCode, cleanName, avatar);
      return { ...joined, isNewRoom: false };
    }

    // 3. If no open lobbies, check for ongoing games that still have open slots (< maxPlayers)
    const eligibleOngoing = Array.from(this.rooms.values()).filter((r) => {
      if (r.isPublic === false) return false;
      if (r.status !== 'IN_GAME') return false;
      const activeCount = r.players.filter((p) => p.isConnected).length;
      return activeCount < r.maxPlayers && activeCount > 0;
    });

    if (eligibleOngoing.length > 0) {
      eligibleOngoing.sort((a, b) => {
        const aCount = a.players.filter((p) => p.isConnected).length;
        const bCount = b.players.filter((p) => p.isConnected).length;
        return bCount - aCount;
      });
      const targetRoom = eligibleOngoing[0];
      logger.info('QuickMatch matched into ongoing game with open slots', {
        joinCode: targetRoom.joinCode,
        currentPlayers: targetRoom.players.length,
        candidateName: cleanName,
      });
      const joined = await this.joinRoom(targetRoom.joinCode, cleanName, avatar);
      return { ...joined, isNewRoom: false };
    }

    // 4. No room available -> create a new public room and host it!
    logger.info('QuickMatch creating new public matchmaking bureau', { candidateName: cleanName });
    const created = await this.createRoom(cleanName, avatar, {
      maxPlayers: 8,
      drawingTimeLimit: 40,
      roundsPerGame: 3,
      storyId: options?.genre || 'all',
      isPublic: true,
    });

    return {
      room: created.room,
      player: created.hostPlayer,
      token: created.token,
      isNewRoom: true,
    };
  }

  /**
   * Returns live stats of online players and active rooms for HUD display
   */
  public static getGlobalStats(): { activeRooms: number; onlineDetectives: number } {
    let activeRooms = 0;
    let onlineDetectives = 0;
    for (const r of this.rooms.values()) {
      if (r.status !== 'COMPLETED' && r.status !== 'ABANDONED') {
        activeRooms++;
        onlineDetectives += r.players.filter((p) => p.isConnected).length;
      }
    }
    return {
      activeRooms: Math.max(1, activeRooms),
      onlineDetectives: Math.max(onlineDetectives, 1),
    };
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
      // Don't delete immediately! Give a 5-minute grace period so refreshing/reconnecting players can re-enter
      setTimeout(() => {
        const checkRoom = this.rooms.get(roomId);
        if (checkRoom && checkRoom.players.length === 0) {
          this.rooms.delete(roomId);
          this.codeToRoomId.delete(checkRoom.joinCode);
          logger.info('Empty room removed after grace period', { roomId });
        }
      }, 5 * 60 * 1000).unref();
      return { room, wasHost };
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
    if (!roomId) return null;
    const clean = roomId.trim();
    if (this.rooms.has(clean)) {
      return this.rooms.get(clean) || null;
    }
    return this.getRoomByCode(clean);
  }

  public static getRoomByCode(joinCode: string): Room | null {
    if (!joinCode) return null;
    const clean = joinCode.trim();
    const normalized = clean.toUpperCase();
    const roomId = this.codeToRoomId.get(normalized);
    if (roomId && this.rooms.has(roomId)) {
      return this.rooms.get(roomId) || null;
    }
    for (const r of this.rooms.values()) {
      if (r.joinCode.toUpperCase() === normalized || r.roomId === clean) {
        return r;
      }
    }
    return null;
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
