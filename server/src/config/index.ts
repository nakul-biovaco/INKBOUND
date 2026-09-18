import dotenv from 'dotenv';
import path from 'path';

// Load .env from root or current directory
dotenv.config();

export const config = {
  env: process.env.NODE_ENV || 'development',
  port: parseInt(process.env.PORT || '3001', 10),
  host: process.env.HOST || '0.0.0.0',
  jwtSecret: process.env.JWT_SECRET || 'inkbound_super_secret_game_jwt_key_2026',
  redisUrl: process.env.REDIS_URL || '',
  corsOrigin: process.env.CORS_ORIGIN || '*',
  gameplay: {
    minPlayersToStart: 1, // 1 for instant solo play & testing, standard multiplayer supported
    defaultMaxPlayers: 8,
    defaultDrawingTimeSeconds: 120,
    defaultPromptSelectionSeconds: 15,
    defaultStoryRevealSeconds: 3.5,
    reconnectGracePeriodSeconds: 45,
    drawerDisconnectGracePeriodSeconds: 30,
    guessRateLimitPerSecond: 2,
    strokeBatchIntervalMs: 30,
  },
};
