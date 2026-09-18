import fastify from 'fastify';
import cors from '@fastify/cors';
import { config } from './config/index.js';
import { registerRoutes } from './api/routes.js';
import { WSServer } from './websocket/WSServer.js';
import { createLogger } from './utils/logger.js';
import { StoryLoader } from './story/StoryLoader.js';
import { RoomManager } from './rooms/RoomManager.js';

const logger = createLogger('Server');

async function bootstrap() {
  const app = fastify({
    logger: false, // We use structured custom logger
  });

  // Enable CORS for frontend web client
  await app.register(cors, {
    origin: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  });

  // Register REST endpoints
  await registerRoutes(app);

  // Pre-load default story into cache
  StoryLoader.loadStory('midnight_museum');

  // Start HTTP listener
  await app.listen({ port: config.port, host: config.host });

  // Attach WebSocket server directly to the Fastify raw HTTP server
  new WSServer(app.server);

  logger.info(`INKBOUND Real-Time Game Server running at http://${config.host}:${config.port}`);
  logger.info(`WebSocket Gateway available at ws://${config.host}:${config.port}/ws`);

  // Periodic memory and room garbage collection sweeper (every 5 minutes)
  const sweeperInterval = setInterval(() => {
    try {
      RoomManager.pruneStaleRooms();
      const mem = process.memoryUsage();
      const heapUsedMB = Math.round(mem.heapUsed / 1024 / 1024);
      logger.info(`Watchdog Health: Heap used: ${heapUsedMB} MB`);
    } catch (sweepErr: any) {
      logger.warn('Room pruning cycle encountered minor issue', { error: sweepErr?.message });
    }
  }, 300000);

  // Process safety guards - keep server and active rooms alive
  process.on('uncaughtException', (err) => {
    logger.error('Uncaught Exception safely caught by server watchdog:', {
      message: err?.message,
      stack: err?.stack,
    });
  });

  process.on('unhandledRejection', (reason: any) => {
    logger.error('Unhandled Rejection safely caught by server watchdog:', {
      reason: reason?.message || reason,
    });
  });

  // Graceful shutdown
  const shutdown = async (signal: string) => {
    logger.info(`Received ${signal}, shutting down gracefully...`);
    clearInterval(sweeperInterval);
    await app.close();
    process.exit(0);
  };

  process.on('SIGTERM', () => shutdown('SIGTERM'));
  process.on('SIGINT', () => shutdown('SIGINT'));
}

bootstrap().catch((err) => {
  logger.error('Fatal error starting server', err);
  process.exit(1);
});
