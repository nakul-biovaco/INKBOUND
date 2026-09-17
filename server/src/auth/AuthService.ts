import crypto from 'crypto';
import { config } from '../config/index.js';
import { ErrorCode, Player } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('AuthService');

export interface AuthSession {
  playerId: string;
  displayName: string;
  roomId: string;
  isHost: boolean;
  reconnectToken: string;
  issuedAt: number;
}

export class AuthService {
  /**
   * Signs a payload into a verifiable HMAC token
   */
  public static createSessionToken(session: AuthSession): string {
    const data = Buffer.from(JSON.stringify(session)).toString('base64url');
    const signature = crypto
      .createHmac('sha256', config.jwtSecret)
      .update(data)
      .digest('base64url');
    return `${data}.${signature}`;
  }

  /**
   * Verifies and decodes a session token
   */
  public static verifySessionToken(token: string): AuthSession | null {
    try {
      const parts = token.split('.');
      if (parts.length !== 2) return null;
      const [data, signature] = parts;
      const expectedSignature = crypto
        .createHmac('sha256', config.jwtSecret)
        .update(data)
        .digest('base64url');

      if (!crypto.timingSafeEqual(Buffer.from(signature), Buffer.from(expectedSignature))) {
        logger.warn('Invalid token signature attempt');
        return null;
      }

      const decodedStr = Buffer.from(data, 'base64url').toString('utf8');
      const session = JSON.parse(decodedStr) as AuthSession;
      return session;
    } catch (err) {
      logger.error('Token verification error', err);
      return null;
    }
  }

  /**
   * Validates if a player has permission to perform host actions
   */
  public static assertHost(player: Player): void {
    if (!player.isHost) {
      const error = new Error('Only the room host can perform this action');
      (error as any).code = ErrorCode.NOT_AUTHORIZED;
      throw error;
    }
  }

  /**
   * Validates if a player is the active drawer
   */
  public static assertDrawer(playerId: string, currentDrawerId: string | null): void {
    if (!currentDrawerId || playerId !== currentDrawerId) {
      const error = new Error('You are not the active drawer');
      (error as any).code = ErrorCode.NOT_YOUR_TURN;
      throw error;
    }
  }

  /**
   * Validates if a player is NOT the active drawer (i.e. guessers only)
   */
  public static assertGuesser(playerId: string, currentDrawerId: string | null): void {
    if (currentDrawerId && playerId === currentDrawerId) {
      const error = new Error('Drawer cannot guess their own drawing');
      (error as any).code = ErrorCode.GUESS_NOT_ALLOWED;
      throw error;
    }
  }
}
