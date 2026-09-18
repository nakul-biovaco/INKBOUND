import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';
import { CreateRoomSchema, JoinRoomSchema, QuickPlaySchema } from '../types/index.js';
import { RoomManager } from '../rooms/RoomManager.js';
import { StoryLoader } from '../story/StoryLoader.js';
import { Serializer } from '../websocket/Serializer.js';

export async function registerRoutes(app: FastifyInstance): Promise<void> {
  // Health & Monitoring
  app.get('/health', async () => {
    return {
      status: 'ok',
      timestamp: Date.now(),
      service: 'INKBOUND Real-Time Game Server',
      uptimeSeconds: Math.round(process.uptime()),
    };
  });

  // Story Catalog
  app.get('/api/stories', async () => {
    return { stories: StoryLoader.listAvailableStories() };
  });

  app.get('/api/stories/:id', async (req: FastifyRequest<{ Params: { id: string } }>, reply: FastifyReply) => {
    try {
      const story = StoryLoader.loadStory(req.params.id);
      return { story };
    } catch {
      return reply.code(404).send({ error: 'Story not found' });
    }
  });

  // Create Room via REST
  app.post('/api/rooms', async (req: FastifyRequest, reply: FastifyReply) => {
    try {
      const body = CreateRoomSchema.parse(req.body);
      const { room, hostPlayer, token } = await RoomManager.createRoom(
        body.displayName,
        body.avatar,
        body.settings
      );
      return reply.code(201).send({
        room: Serializer.serializeRoom(room),
        hostPlayer,
        token,
      });
    } catch (err: any) {
      return reply.code(400).send({ error: err.message });
    }
  });

  // Check / Join Room by Code
  app.post('/api/rooms/:code/join', async (req: FastifyRequest<{ Params: { code: string } }>, reply: FastifyReply) => {
    try {
      const body = JoinRoomSchema.parse({ ...(req.body as any), joinCode: req.params.code });
      const { room, player, token } = await RoomManager.joinRoom(body.joinCode, body.displayName, body.avatar);
      return reply.send({
        room: Serializer.serializeRoom(room),
        player,
        token,
      });
    } catch (err: any) {
      return reply.code(400).send({ error: err.message });
    }
  });

  // Global Multiplayer Quick Matchmaking
  app.post('/api/rooms/quick-play', async (req: FastifyRequest, reply: FastifyReply) => {
    try {
      const body = QuickPlaySchema.parse(req.body || {});
      const { room, player, token, isNewRoom } = await RoomManager.quickMatch(
        body.displayName,
        body.avatar,
        { genre: body.genre }
      );
      return reply.send({
        room: Serializer.serializeRoom(room),
        player,
        token,
        isNewRoom,
      });
    } catch (err: any) {
      return reply.code(400).send({ error: err.message });
    }
  });

  // Global Active Player and Room Statistics
  app.get('/api/stats/online', async () => {
    return RoomManager.getGlobalStats();
  });

  // Query Room
  app.get('/api/rooms/:id', async (req: FastifyRequest<{ Params: { id: string } }>, reply: FastifyReply) => {
    const room = RoomManager.getRoom(req.params.id);
    if (!room) {
      return reply.code(404).send({ error: 'Room not found' });
    }
    return { room: Serializer.serializeRoom(room) };
  });
}
