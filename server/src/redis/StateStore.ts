import { createLogger } from '../utils/logger.js';
import { StrokeChunk } from '../types/index.js';

const logger = createLogger('StateStore');

export interface IStateStore {
  get<T>(key: string): Promise<T | null>;
  set<T>(key: string, value: T, ttlSeconds?: number): Promise<void>;
  del(key: string): Promise<void>;
  acquireLock(lockKey: string, ttlMs: number): Promise<string | null>;
  releaseLock(lockKey: string, token: string): Promise<boolean>;
  checkRateLimit(key: string, maxLimit: number, windowSeconds: number): Promise<boolean>;
  appendStroke(roomId: string, turnIndex: number, stroke: StrokeChunk): Promise<void>;
  getStrokes(roomId: string, turnIndex: number): Promise<StrokeChunk[]>;
  clearStrokes(roomId: string, turnIndex: number): Promise<void>;
}

/**
 * High-performance in-memory state store with TTL and distributed lock semantics.
 * Used for ultra-low latency game operations and zero-dependency local/container runs.
 */
class MemoryStateStore implements IStateStore {
  private store: Map<string, { value: any; expiresAt?: number }> = new Map();
  private locks: Map<string, { token: string; expiresAt: number }> = new Map();
  private rateLimits: Map<string, { count: number; expiresAt: number }> = new Map();
  private strokeBuffers: Map<string, StrokeChunk[]> = new Map();

  constructor() {
    logger.info('MemoryStateStore initialized');
    // Periodic garbage collection for expired entries
    setInterval(() => this.cleanup(), 60000).unref();
  }

  private cleanup(): void {
    const now = Date.now();
    for (const [key, item] of this.store.entries()) {
      if (item.expiresAt && item.expiresAt <= now) {
        this.store.delete(key);
      }
    }
    for (const [key, item] of this.locks.entries()) {
      if (item.expiresAt <= now) {
        this.locks.delete(key);
      }
    }
    for (const [key, item] of this.rateLimits.entries()) {
      if (item.expiresAt <= now) {
        this.rateLimits.delete(key);
      }
    }
  }

  public async get<T>(key: string): Promise<T | null> {
    const item = this.store.get(key);
    if (!item) return null;
    if (item.expiresAt && item.expiresAt <= Date.now()) {
      this.store.delete(key);
      return null;
    }
    return item.value as T;
  }

  public async set<T>(key: string, value: T, ttlSeconds?: number): Promise<void> {
    const expiresAt = ttlSeconds ? Date.now() + ttlSeconds * 1000 : undefined;
    this.store.set(key, { value, expiresAt });
  }

  public async del(key: string): Promise<void> {
    this.store.delete(key);
  }

  public async acquireLock(lockKey: string, ttlMs: number): Promise<string | null> {
    const now = Date.now();
    const existing = this.locks.get(lockKey);
    if (existing && existing.expiresAt > now) {
      return null; // Lock is already held
    }

    const token = Math.random().toString(36).substring(2) + Date.now().toString(36);
    this.locks.set(lockKey, { token, expiresAt: now + ttlMs });
    return token;
  }

  public async releaseLock(lockKey: string, token: string): Promise<boolean> {
    const existing = this.locks.get(lockKey);
    if (!existing) return false;
    if (existing.token === token) {
      this.locks.delete(lockKey);
      return true;
    }
    return false;
  }

  public async checkRateLimit(key: string, maxLimit: number, windowSeconds: number): Promise<boolean> {
    const now = Date.now();
    const existing = this.rateLimits.get(key);

    if (!existing || existing.expiresAt <= now) {
      this.rateLimits.set(key, { count: 1, expiresAt: now + windowSeconds * 1000 });
      return true;
    }

    if (existing.count >= maxLimit) {
      return false; // Rate limit exceeded
    }

    existing.count++;
    return true;
  }

  public async appendStroke(roomId: string, turnIndex: number, stroke: StrokeChunk): Promise<void> {
    const key = `${roomId}:${turnIndex}`;
    let buffer = this.strokeBuffers.get(key);
    if (!buffer) {
      buffer = [];
      this.strokeBuffers.set(key, buffer);
    }
    buffer.push(stroke);
  }

  public async getStrokes(roomId: string, turnIndex: number): Promise<StrokeChunk[]> {
    const key = `${roomId}:${turnIndex}`;
    return this.strokeBuffers.get(key) || [];
  }

  public async clearStrokes(roomId: string, turnIndex: number): Promise<void> {
    const key = `${roomId}:${turnIndex}`;
    this.strokeBuffers.delete(key);
  }
}

export const stateStore: IStateStore = new MemoryStateStore();
