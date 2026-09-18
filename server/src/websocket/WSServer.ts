import { IncomingMessage, Server } from 'http';
import { WebSocket, WebSocketServer } from 'ws';
import {
  ChooseStorySchema,
  CreateRoomSchema,
  DrawStrokeSchema,
  ErrorCode,
  JoinRoomSchema,
  QuickPlaySchema,
  Player,
  ReconnectSchema,
  SelectPromptSchema,
  SubmitGuessSchema,
  SubmitTheorySchema,
  WSClientEvent,
  WSServerEvent,
  GameStatus,
} from '../types/index.js';
import { AuthService, AuthSession } from '../auth/AuthService.js';
import { RoomManager } from '../rooms/RoomManager.js';
import { GameEngine } from '../game/GameEngine.js';
import { StoryLoader } from '../story/StoryLoader.js';
import { Serializer } from './Serializer.js';
import { DrawingManager } from '../drawing/DrawingManager.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('WSServer');

interface ExtendedSocket extends WebSocket {
  isAlive: boolean;
  session?: AuthSession;
  roomId?: string;
  playerId?: string;
}

export class WSServer {
  private wss: WebSocketServer;
  private roomSockets: Map<string, Set<ExtendedSocket>> = new Map();
  private playerSockets: Map<string, ExtendedSocket> = new Map();
  private pendingDisconnects: Map<string, NodeJS.Timeout> = new Map();

  constructor(server: Server) {
    this.wss = new WebSocketServer({ server, path: '/ws' });
    this.setupHeartbeat();
    this.setupEvents();
    logger.info('WebSocket Server initialized on path /ws');
  }

  private setupHeartbeat(): void {
    const interval = setInterval(() => {
      this.wss.clients.forEach((ws) => {
        const extWs = ws as ExtendedSocket;
        if (!extWs.isAlive) {
          logger.info('Terminating inactive socket', { playerId: extWs.playerId });
          return extWs.terminate();
        }
        extWs.isAlive = false;
        extWs.ping();
      });
    }, 30000);

    this.wss.on('close', () => clearInterval(interval));
  }

  private setupEvents(): void {
    this.wss.on('connection', (ws: ExtendedSocket, req: IncomingMessage) => {
      ws.isAlive = true;

      ws.on('pong', () => {
        ws.isAlive = true;
      });

      // Query-string token authentication support: ws://host/ws?token=...
      const url = new URL(req.url || '', `http://${req.headers.host}`);
      const token = url.searchParams.get('token');
      if (token) {
        const session = AuthService.verifySessionToken(token);
        if (session) {
          this.associateSocket(ws, session);
        }
      }

      ws.on('message', async (data: string) => {
        let raw: any = null;
        try {
          raw = JSON.parse(data.toString());
          await this.handleClientMessage(ws, raw);
        } catch (err: any) {
          logger.error('Error handling WS message', err);
          let safeMsg = err?.message || 'Invalid request';
          if (err?.name === 'ZodError' || Array.isArray(err?.issues) || typeof safeMsg === 'string' && safeMsg.startsWith('[')) {
            if (raw && raw.event === WSClientEvent.DRAW_STROKE) {
              return; // Gracefully ignore invalid stroke chunk without throwing scary alerts to user
            }
            safeMsg = 'Invalid action or parameters';
          }
          this.sendToSocket(ws, WSServerEvent.ERROR, {
            code: err?.code || ErrorCode.INVALID_PAYLOAD,
            message: safeMsg,
          });
        }
      });

      ws.on('close', () => {
        this.handleSocketDisconnect(ws);
      });
    });
  }

  private associateSocket(ws: ExtendedSocket, session: AuthSession, skipBroadcast: boolean = false): void {
    ws.session = session;
    ws.roomId = session.roomId;
    ws.playerId = session.playerId;

    // Cancel any pending disconnect grace timer for this player!
    const pendingTimer = this.pendingDisconnects.get(session.playerId);
    if (pendingTimer) {
      clearTimeout(pendingTimer);
      this.pendingDisconnects.delete(session.playerId);
      logger.info('Cancelled pending disconnect timer upon socket reconnection', { playerId: session.playerId });
    }

    this.playerSockets.set(session.playerId, ws);

    let roomSet = this.roomSockets.get(session.roomId);
    if (!roomSet) {
      roomSet = new Set();
      this.roomSockets.set(session.roomId, roomSet);
    }
    roomSet.add(ws);

    logger.info('Socket associated with player', { playerId: session.playerId, roomId: session.roomId });

    if (!skipBroadcast) {
      const room = RoomManager.getRoom(session.roomId);
      if (room) {
        RoomManager.markPlayerConnection(session.roomId, session.playerId, true);
        const player = room.players.find((p) => p.playerId === session.playerId);

        // Send ROOM_STATE to the connecting player
        this.sendToSocket(ws, WSServerEvent.ROOM_STATE, {
          room: Serializer.serializeRoom(room),
          playerId: session.playerId,
        });

        // Broadcast to other players in the room that this player joined / is online
        if (player) {
          this.broadcastToRoom(
            room.roomId,
            WSServerEvent.PLAYER_JOINED,
            {
              player: {
                playerId: player.playerId,
                displayName: player.displayName,
                avatar: player.avatar,
                score: player.score,
                isHost: player.isHost,
                isReady: player.isReady,
              },
            },
            ws
          );
        }

        // Also broadcast full updated ROOM_STATE to everyone else in the room
        this.broadcastToRoom(
          room.roomId,
          WSServerEvent.ROOM_STATE,
          {
            room: Serializer.serializeRoom(room),
          },
          ws
        );

        // If game is in progress, immediately restore live game state to this reconnected socket
        const engine = GameEngine.getEngine(room.roomId);
        if (engine && player) {
          engine.handlePlayerReconnect(player);
          const publicState = Serializer.serializePublicState(engine.getSession(), room);
          DrawingManager.getTurnStrokes(room.roomId, engine.getSession().turnIndex)
            .then((strokes) => {
              this.sendToSocket(ws, WSServerEvent.PLAYER_RECONNECTED, {
                gameState: publicState,
                strokeHistory: strokes,
                isDrawer: engine.getSession().currentDrawerId === player.playerId,
                drawerPrivateState:
                  engine.getSession().currentDrawerId === player.playerId
                    ? Serializer.serializePrivateDrawerState(engine.getSession())
                    : null,
              });
            })
            .catch((err) => {
              logger.warn('Failed to get turn strokes on socket reconnect', { error: err });
            });
        }
      }
    }
  }

  private async handleClientMessage(ws: ExtendedSocket, message: { event: string; payload: any }): Promise<void> {
    const { event, payload } = message;

    switch (event) {
      // ==========================================
      // ROOM ACTIONS
      // ==========================================
      case WSClientEvent.CREATE_ROOM: {
        const valid = CreateRoomSchema.parse(payload);
        const { room, hostPlayer, token } = await RoomManager.createRoom(
          valid.displayName,
          valid.avatar,
          valid.settings
        );

        this.associateSocket(
          ws,
          {
            playerId: hostPlayer.playerId,
            displayName: hostPlayer.displayName,
            roomId: room.roomId,
            isHost: true,
            reconnectToken: hostPlayer.reconnectToken,
            issuedAt: Date.now(),
          },
          true
        );

        this.sendToSocket(ws, WSServerEvent.ROOM_STATE, {
          room: Serializer.serializeRoom(room),
          token,
          playerId: hostPlayer.playerId,
        });
        break;
      }

      case WSClientEvent.JOIN_ROOM: {
        const valid = JoinRoomSchema.parse(payload);
        const { room, player, token } = await RoomManager.joinRoom(valid.joinCode, valid.displayName, valid.avatar);

        this.associateSocket(
          ws,
          {
            playerId: player.playerId,
            displayName: player.displayName,
            roomId: room.roomId,
            isHost: false,
            reconnectToken: player.reconnectToken,
            issuedAt: Date.now(),
          },
          true
        );

        // Broadcast to existing room players
        this.broadcastToRoom(room.roomId, WSServerEvent.PLAYER_JOINED, {
          player: {
            playerId: player.playerId,
            displayName: player.displayName,
            avatar: player.avatar,
            score: player.score,
            isHost: player.isHost,
            isReady: player.isReady,
          },
        });

        // Send full room state to joiner
        this.sendToSocket(ws, WSServerEvent.ROOM_STATE, {
          room: Serializer.serializeRoom(room),
          token,
          playerId: player.playerId,
        });

        // If game is in progress, also restore live game state to the player immediately
        const engine = GameEngine.getEngine(room.roomId);
        if (engine) {
          engine.handlePlayerReconnect(player);
          const publicState = Serializer.serializePublicState(engine.getSession(), room);
          const strokes = await DrawingManager.getTurnStrokes(room.roomId, engine.getSession().turnIndex);

          this.sendToSocket(ws, WSServerEvent.PLAYER_RECONNECTED, {
            gameState: publicState,
            strokeHistory: strokes,
            isDrawer: engine.getSession().currentDrawerId === player.playerId,
            drawerPrivateState:
              engine.getSession().currentDrawerId === player.playerId
                ? Serializer.serializePrivateDrawerState(engine.getSession())
                : null,
          });
        }
        break;
      }

      case WSClientEvent.QUICK_PLAY: {
        const valid = QuickPlaySchema.parse(payload || {});
        const { room, player, token, isNewRoom } = await RoomManager.quickMatch(
          valid.displayName,
          valid.avatar,
          { genre: valid.genre }
        );

        this.associateSocket(
          ws,
          {
            playerId: player.playerId,
            displayName: player.displayName,
            roomId: room.roomId,
            isHost: player.isHost,
            reconnectToken: player.reconnectToken,
            issuedAt: Date.now(),
          },
          true
        );

        if (!isNewRoom) {
          // Broadcast to existing room players that a new quick-match detective arrived
          this.broadcastToRoom(room.roomId, WSServerEvent.PLAYER_JOINED, {
            player: {
              playerId: player.playerId,
              displayName: player.displayName,
              avatar: player.avatar,
              score: player.score,
              isHost: player.isHost,
              isReady: player.isReady,
            },
          });
        }

        // Send full room state to joiner
        this.sendToSocket(ws, WSServerEvent.ROOM_STATE, {
          room: Serializer.serializeRoom(room),
          token,
          playerId: player.playerId,
          isNewRoom,
        });

        // If matched into an ongoing game, restore live state immediately
        const engine = GameEngine.getEngine(room.roomId);
        if (engine && !isNewRoom) {
          engine.handlePlayerReconnect(player);
          const publicState = Serializer.serializePublicState(engine.getSession(), room);
          const strokes = await DrawingManager.getTurnStrokes(room.roomId, engine.getSession().turnIndex);

          this.sendToSocket(ws, WSServerEvent.PLAYER_RECONNECTED, {
            gameState: publicState,
            strokeHistory: strokes,
            isDrawer: engine.getSession().currentDrawerId === player.playerId,
            drawerPrivateState:
              engine.getSession().currentDrawerId === player.playerId
                ? Serializer.serializePrivateDrawerState(engine.getSession())
                : null,
          });
        }
        break;
      }

      case WSClientEvent.LEAVE_ROOM: {
        const roomId = ws.roomId || payload?.roomId;
        const playerId = ws.playerId || payload?.playerId;
        if (!roomId || !playerId) break;

        logger.info('Player explicitly requested to leave room', { roomId, playerId });

        // Cancel any pending disconnect timer
        const timer = this.pendingDisconnects.get(playerId);
        if (timer) {
          clearTimeout(timer);
          this.pendingDisconnects.delete(playerId);
        }

        // Clean up socket mapping
        if (this.playerSockets.get(playerId) === ws) {
          this.playerSockets.delete(playerId);
        }
        const roomSet = this.roomSockets.get(roomId);
        if (roomSet) {
          roomSet.delete(ws);
        }

        // Remove from game engine if in progress
        const engine = GameEngine.getEngine(roomId);
        if (engine) {
          engine.handlePlayerDisconnect(playerId);
        }

        // Remove player from room immediately
        const { room } = RoomManager.leaveRoom(roomId, playerId);

        // Broadcast to remaining players
        this.broadcastToRoom(roomId, WSServerEvent.PLAYER_LEFT, { playerId });

        if (room && room.players.length > 0) {
          this.broadcastToRoom(roomId, WSServerEvent.ROOM_STATE, { room: Serializer.serializeRoom(room) });
        } else {
          // No players remain - forcefully terminate room and engine
          RoomManager.deleteRoom(roomId);
          GameEngine.removeEngine(roomId);
          logger.info('Room forcefully terminated because all players left', { roomId });
        }
        break;
      }

      case WSClientEvent.READY: {
        this.assertSocketAuthenticated(ws);
        const isReady = Boolean(payload?.isReady);
        const room = RoomManager.setPlayerReady(ws.roomId!, ws.playerId!, isReady);
        this.broadcastToRoom(ws.roomId!, WSServerEvent.ROOM_STATE, { room: Serializer.serializeRoom(room) });
        break;
      }

      case (WSClientEvent as any).UPDATE_SETTINGS || 'UPDATE_SETTINGS': {
        this.assertSocketAuthenticated(ws);
        const s = payload?.settings || {};
        const room = RoomManager.updateRoomSettings(ws.roomId!, ws.playerId!, {
          storyId: s.selectedCaseId || s.storyId,
          drawingTimeLimit: s.turnDuration || s.drawingTimeLimit,
          roundsPerGame: s.rounds || s.roundsPerGame,
          maxPlayers: s.maxPlayers,
        });
        this.broadcastToRoom(room.roomId, WSServerEvent.ROOM_STATE, { room: Serializer.serializeRoom(room) });
        break;
      }

      case WSClientEvent.START_GAME: {
        this.assertSocketAuthenticated(ws);
        const room = RoomManager.getRoomOrThrow(ws.roomId!);
        const storyId = payload?.storyId || room.settings.storyId || 'all';
        if (storyId && storyId !== 'all') {
          room.settings.storyId = storyId;
        }
        if (payload?.settings) {
          const s = payload.settings;
          RoomManager.updateRoomSettings(ws.roomId!, ws.playerId!, {
            storyId: s.selectedCaseId || s.storyId,
            drawingTimeLimit: s.turnDuration || s.drawingTimeLimit,
            roundsPerGame: s.rounds || s.roundsPerGame,
            maxPlayers: s.maxPlayers,
          });
        }

        let engine = GameEngine.getEngine(room.roomId);
        if (!engine) {
          engine = new GameEngine(room, null, (evt, data, recipientId) => {
            if (recipientId) {
              this.sendToPlayer(recipientId, evt, data);
            } else {
              this.broadcastToRoom(room.roomId, evt, data);
            }
          });
        }

        await engine.startGame(ws.playerId!);
        break;
      }

      // ==========================================
      // STORY SELECTION
      // ==========================================
      case WSClientEvent.CHOOSE_STORY: {
        this.assertSocketAuthenticated(ws);
        const valid = ChooseStorySchema.parse(payload);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        engine.chooseStory(ws.playerId!, valid.storyId);
        break;
      }

      // ==========================================
      // GAMEPLAY ACTIONS
      // ==========================================
      case WSClientEvent.SELECT_PROMPT: {
        this.assertSocketAuthenticated(ws);
        const valid = SelectPromptSchema.parse(payload);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        engine.selectPrompt(ws.playerId!, valid.optionIndex);
        break;
      }

      case WSClientEvent.DRAW_STROKE: {
        this.assertSocketAuthenticated(ws);
        const valid = DrawStrokeSchema.parse(payload);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        await engine.handleStroke(ws.playerId!, valid.chunk as any);
        break;
      }

      case WSClientEvent.DRAW_CLEAR: {
        this.assertSocketAuthenticated(ws);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (engine) await engine.handleClear(ws.playerId!);
        break;
      }

      case WSClientEvent.END_DRAWING: {
        this.assertSocketAuthenticated(ws);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        engine.endDrawing(ws.playerId!);
        break;
      }

      case WSClientEvent.SUBMIT_GUESS: {
        this.assertSocketAuthenticated(ws);
        const valid = SubmitGuessSchema.parse(payload);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        await engine.handleGuess(ws.playerId!, valid.guess);
        break;
      }

      case WSClientEvent.SUBMIT_THEORY: {
        this.assertSocketAuthenticated(ws);
        const valid = SubmitTheorySchema.parse(payload);
        const engine = GameEngine.getEngine(ws.roomId!);
        if (!engine) throw new Error('No active game session');
        engine.submitFinalTheory(ws.playerId!, valid.answer, valid.confidence);
        break;
      }

      case WSClientEvent.CHAT_MESSAGE: {
        this.assertSocketAuthenticated(ws);
        const text = String(payload?.text || '').trim();
        if (!text) break;
        const room = RoomManager.getRoom(ws.roomId!);
        const player = room?.players.find((p) => p.playerId === ws.playerId!);
        if (player) {
          this.broadcastToRoom(ws.roomId!, WSServerEvent.CHAT_MESSAGE, {
            id: payload?.id || `chat-${Date.now()}-${Math.random().toString(36).substring(2, 5)}`,
            senderId: player.playerId,
            senderName: player.displayName,
            senderAvatar: player.avatar,
            timestamp: payload?.timestamp || new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
            text,
          });
        }
        break;
      }

      // ==========================================
      // RECONNECTION & STATE RESTORATION
      // ==========================================
      case WSClientEvent.RECONNECT: {
        const valid = ReconnectSchema.parse(payload);
        const room = RoomManager.getRoom(valid.roomId);
        if (!room) {
          const err = new Error('Room not found for reconnection');
          (err as any).code = ErrorCode.ROOM_NOT_FOUND;
          throw err;
        }

        const player = room.players.find((p) => p.playerId === valid.playerId);
        if (!player || player.reconnectToken !== valid.reconnectToken) {
          const err = new Error('Invalid reconnection credentials');
          (err as any).code = ErrorCode.NOT_AUTHORIZED;
          throw err;
        }

        const pendingTimer = this.pendingDisconnects.get(player.playerId);
        if (pendingTimer) {
          clearTimeout(pendingTimer);
          this.pendingDisconnects.delete(player.playerId);
          logger.info('Cancelled pending disconnect timer upon RECONNECT event', { playerId: player.playerId });
        }
        RoomManager.markPlayerConnection(room.roomId, player.playerId, true);

        // A token-authenticated socket is already associated. Re-associating it would
        // broadcast a duplicate join event to the room on every reconnect.
        if (ws.playerId !== player.playerId || ws.roomId !== room.roomId) {
          this.associateSocket(ws, {
            playerId: player.playerId,
            displayName: player.displayName,
            roomId: room.roomId,
            isHost: player.isHost,
            reconnectToken: player.reconnectToken,
            issuedAt: Date.now(),
          });
        }

        const engine = GameEngine.getEngine(room.roomId);
        if (engine) {
          engine.handlePlayerReconnect(player);
          const session = engine.getSession();
          const publicState = Serializer.serializePublicState(session, room);
          const strokes = await DrawingManager.getTurnStrokes(room.roomId, session.turnIndex);

          // Full state restoration payload
          this.sendToSocket(ws, WSServerEvent.PLAYER_RECONNECTED, {
            gameState: publicState,
            strokeHistory: strokes,
            isDrawer: session.currentDrawerId === player.playerId,
            drawerPrivateState:
              session.currentDrawerId === player.playerId
                ? Serializer.serializePrivateDrawerState(session)
                : null,
          });

          // If reconnected in PROMPT_SELECTION and player is drawer, immediately restore prompt options!
          if (
            session.state === GameStatus.PROMPT_SELECTION &&
            session.currentDrawerId === player.playerId &&
            session.activePromptOptions
          ) {
            this.sendToSocket(ws, WSServerEvent.PROMPT_OPTIONS, {
              options: session.activePromptOptions,
              timeLimitSeconds: 30,
            });
          }

          // If reconnected in STORY_SELECTION and player is chooser, immediately restore story options!
          if (
            session.state === GameStatus.STORY_SELECTION &&
            session.storyChooserPlayerId === player.playerId &&
            session.offeredStoryOptions
          ) {
            this.sendToSocket(ws, WSServerEvent.STORY_OPTIONS, {
              options: session.offeredStoryOptions,
              timeLimitSeconds: 20,
            });
          }
        } else {
          this.sendToSocket(ws, WSServerEvent.ROOM_STATE, { room: Serializer.serializeRoom(room) });
        }
        break;
      }

      case WSClientEvent.PING: {
        this.sendToSocket(ws, WSServerEvent.PONG, { timestamp: Date.now() });
        break;
      }

      default:
        logger.warn(`Unknown WebSocket event: ${event}`);
    }
  }

  private handleSocketDisconnect(ws: ExtendedSocket): void {
    if (!ws.roomId || !ws.playerId) return;

    const playerId = ws.playerId;
    const roomId = ws.roomId;

    logger.info('Socket connection closed', { playerId, roomId });

    // Clean up room socket set
    const roomSet = this.roomSockets.get(roomId);
    if (roomSet) {
      roomSet.delete(ws);
      if (roomSet.size === 0) {
        this.roomSockets.delete(roomId);
      }
    }

    // Check if player has already reconnected with a newer socket
    const currentActiveSocket = this.playerSockets.get(playerId);
    if (currentActiveSocket && currentActiveSocket !== ws && currentActiveSocket.readyState === WebSocket.OPEN) {
      logger.info('Superseded socket closed, active socket remains for player', { playerId });
      return;
    }

    // Remove this socket reference if it matches
    if (currentActiveSocket === ws) {
      this.playerSockets.delete(playerId);
    }

    // Clear any existing pending disconnect timer for this player
    const existing = this.pendingDisconnects.get(playerId);
    if (existing) {
      clearTimeout(existing);
      this.pendingDisconnects.delete(playerId);
    }

    // Start 6-second grace period before declaring player left
    const timer = setTimeout(() => {
      this.pendingDisconnects.delete(playerId);
      logger.info('Player disconnect grace period expired, finalizing disconnect', { playerId, roomId });

      const engine = GameEngine.getEngine(roomId);
      if (engine) {
        engine.handlePlayerDisconnect(playerId);
      }
      
      const { room } = RoomManager.leaveRoom(roomId, playerId);
      this.broadcastToRoom(roomId, WSServerEvent.PLAYER_LEFT, { playerId });

      if (room && room.players.length > 0) {
        this.broadcastToRoom(roomId, WSServerEvent.ROOM_STATE, { room: Serializer.serializeRoom(room) });
      } else {
        RoomManager.deleteRoom(roomId);
        GameEngine.removeEngine(roomId);
        logger.info('Room forcefully deleted because all players disconnected', { roomId });
      }
    }, 6000);

    this.pendingDisconnects.set(playerId, timer);
    logger.info('Player disconnect grace timer started (6s)', { playerId, roomId });
  }

  private assertSocketAuthenticated(ws: ExtendedSocket): void {
    if (!ws.roomId || !ws.playerId) {
      const err = new Error('Unauthorized socket connection');
      (err as any).code = ErrorCode.NOT_AUTHORIZED;
      throw err;
    }
  }

  public broadcastToRoom(roomId: string, event: string, payload: unknown, omitSocket?: ExtendedSocket): void {
    const roomSet = this.roomSockets.get(roomId);
    if (!roomSet || roomSet.size === 0) return;

    let message: string;
    try {
      message = JSON.stringify({ event, payload, timestamp: Date.now() });
    } catch (err: any) {
      logger.warn('Failed to serialize broadcast payload', { event, error: err?.message });
      return;
    }

    const deadSockets: ExtendedSocket[] = [];
    roomSet.forEach((client) => {
      if (client !== omitSocket) {
        if (client.readyState === WebSocket.OPEN) {
          try {
            client.send(message, (err) => {
              if (err) {
                logger.warn('Error during socket broadcast write', { event, error: err.message });
              }
            });
          } catch (err: any) {
            logger.warn('Synchronous broadcast write failure', { event, error: err?.message });
          }
        } else if (client.readyState === WebSocket.CLOSING || client.readyState === WebSocket.CLOSED) {
          deadSockets.push(client);
        }
      }
    });

    // Clean up closed socket references
    for (const dead of deadSockets) {
      roomSet.delete(dead);
    }
  }

  public sendToPlayer(playerId: string, event: string, payload: unknown): void {
    const socket = this.playerSockets.get(playerId);
    if (socket) {
      if (socket.readyState === WebSocket.OPEN) {
        this.sendToSocket(socket, event, payload);
      } else if (socket.readyState === WebSocket.CLOSED) {
        this.playerSockets.delete(playerId);
      }
    }
  }

  private sendToSocket(ws: WebSocket, event: string, payload: unknown): void {
    if (ws.readyState === WebSocket.OPEN) {
      try {
        const message = JSON.stringify({ event, payload, timestamp: Date.now() });
        ws.send(message, (err) => {
          if (err) {
            logger.warn('Error sending message to socket', { event, error: err.message });
          }
        });
      } catch (err: any) {
        logger.warn('Failed to serialize or send socket message', { event, error: err?.message });
      }
    }
  }
}
