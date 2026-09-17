/**
 * INKBOUND Real-Time Authoritative Backend Client
 * Connects the frontend to the Node.js Fastify + WebSocket Game Engine
 */

export interface BackendConfig {
  httpUrl: string;
  wsUrl: string;
}

const env =
  typeof import.meta !== 'undefined' && (import.meta as any).env
    ? (import.meta as any).env
    : typeof process !== 'undefined'
    ? (process.env as Record<string, string | undefined>)
    : {};

const isLocalHost = (hostname: string): boolean => {
  return (
    hostname === 'localhost' ||
    hostname === '127.0.0.1' ||
    hostname.startsWith('192.168.') ||
    hostname.startsWith('10.') ||
    hostname.endsWith('.local')
  );
};

const getBaseHttpUrl = (): string => {
  if (env.VITE_BACKEND_URL) return env.VITE_BACKEND_URL;
  if (typeof window !== 'undefined') {
    const hostname = window.location.hostname;
    if (isLocalHost(hostname)) {
      return `${window.location.protocol}//${hostname}:3001`;
    }
    return window.location.origin;
  }
  return 'http://localhost:3001';
};

const getBaseWsUrl = (): string => {
  if (env.VITE_WS_URL) return env.VITE_WS_URL;
  if (typeof window !== 'undefined') {
    const hostname = window.location.hostname;
    const proto = window.location.protocol === 'https:' ? 'wss:' : 'ws:';
    if (isLocalHost(hostname)) {
      return `${proto}//${hostname}:3001/ws`;
    }
    return `${proto}//${window.location.host}/ws`;
  }
  return 'ws://localhost:3001/ws';
};

const DEFAULT_CONFIG: BackendConfig = {
  httpUrl: getBaseHttpUrl(),
  wsUrl: getBaseWsUrl(),
};

export type BackendEventHandler = (payload: any) => void;

export class BackendClient {
  private static instance: BackendClient | null = null;
  private ws: WebSocket | null = null;
  private token: string | null = null;
  private playerId: string | null = null;
  private roomId: string | null = null;
  private reconnectToken: string | null = null;
  private eventHandlers: Map<string, Set<BackendEventHandler>> = new Map();
  private reconnectAttempts = 0;
  private isConnecting = false;
  private pingInterval: any = null;

  public static getInstance(): BackendClient {
    if (!this.instance) {
      this.instance = new BackendClient();
    }
    return this.instance;
  }

  public get connecting(): boolean {
    return this.isConnecting;
  }

  public getPlayerId(): string | null {
    return this.playerId;
  }

  public getRoomId(): string | null {
    return this.roomId;
  }

  public setTokens(token: string, playerId: string, roomId: string, reconnectToken?: string): void {
    const tokenChanged = this.token !== token;
    this.token = token;
    this.playerId = playerId;
    this.roomId = roomId;
    if (reconnectToken) this.reconnectToken = reconnectToken;

    // If socket is already open but token changed to a new session, close old socket so connect() binds new session
    if (tokenChanged && this.ws) {
      this.disconnect();
    }
  }

  public disconnect(): void {
    this.stopHeartbeat();
    if (this.ws) {
      try {
        this.ws.onclose = null;
        this.ws.onerror = null;
        this.ws.close();
      } catch {
        // ignore
      }
      this.ws = null;
    }
    this.isConnecting = false;
  }

  /**
   * Connects to authoritative WebSocket server
   */
  public async connect(forceReconnect: boolean = false): Promise<void> {
    if (!forceReconnect && this.ws && (this.ws.readyState === WebSocket.OPEN || this.ws.readyState === WebSocket.CONNECTING)) {
      return;
    }

    if (this.ws) {
      this.disconnect();
    }

    this.isConnecting = true;
    const wsUrl = this.token
      ? `${DEFAULT_CONFIG.wsUrl}?token=${encodeURIComponent(this.token)}`
      : DEFAULT_CONFIG.wsUrl;

    return new Promise((resolve) => {
      const timer = setTimeout(() => {
        this.isConnecting = false;
        resolve();
      }, 2500);

      try {
        this.ws = new WebSocket(wsUrl);

        this.ws.onopen = () => {
          clearTimeout(timer);
          this.isConnecting = false;
          this.reconnectAttempts = 0;
          this.startHeartbeat();
          this.emitLocal('CONNECTED', {});

          // If reconnect token present, send reconnect handshake
          if (this.reconnectToken && this.roomId && this.playerId) {
            this.send('RECONNECT', {
              roomId: this.roomId,
              playerId: this.playerId,
              reconnectToken: this.reconnectToken,
            });
          }

          resolve();
        };

        this.ws.onmessage = (event) => {
          try {
            const data = JSON.parse(event.data);
            if (data.event) {
              this.emitLocal(data.event, data.payload);
            }
          } catch (err) {
            console.error('[BackendClient] Message parse error', err);
          }
        };

        this.ws.onclose = () => {
          clearTimeout(timer);
          this.isConnecting = false;
          this.stopHeartbeat();
          this.emitLocal('DISCONNECTED', {});
          this.scheduleReconnect();
        };

        this.ws.onerror = (err) => {
          clearTimeout(timer);
          this.isConnecting = false;
          console.warn('[BackendClient] WebSocket error', err);
          resolve();
        };
      } catch (err) {
        clearTimeout(timer);
        this.isConnecting = false;
        resolve();
      }
    });
  }

  private scheduleReconnect(): void {
    if (this.reconnectAttempts > 10) return;
    const delay = Math.min(1000 * Math.pow(1.5, this.reconnectAttempts), 10000);
    this.reconnectAttempts++;
    setTimeout(() => {
      if (this.token) {
        this.connect().catch(() => {});
      }
    }, delay);
  }

  private startHeartbeat(): void {
    this.stopHeartbeat();
    this.pingInterval = setInterval(() => {
      if (this.ws?.readyState === WebSocket.OPEN) {
        this.send('PING', { timestamp: Date.now() });
      }
    }, 20000);
  }

  private stopHeartbeat(): void {
    if (this.pingInterval) {
      clearInterval(this.pingInterval);
      this.pingInterval = null;
    }
  }

  public on(event: string, handler: BackendEventHandler): () => void {
    let set = this.eventHandlers.get(event);
    if (!set) {
      set = new Set();
      this.eventHandlers.set(event, set);
    }
    set.add(handler);
    return () => set?.delete(handler);
  }

  private emitLocal(event: string, payload: any): void {
    const handlers = this.eventHandlers.get(event);
    if (handlers) {
      handlers.forEach((h) => {
        try {
          h(payload);
        } catch (err) {
          console.error(`[BackendClient] Error in handler for ${event}`, err);
        }
      });
    }
  }

  public send(event: string, payload: any): void {
    if (this.ws?.readyState === WebSocket.OPEN) {
      this.ws.send(JSON.stringify({ event, payload, timestamp: Date.now() }));
    } else {
      console.warn('[BackendClient] WebSocket not open; message dropped', event);
    }
  }

  private async fetchWithTimeout(url: string, options: RequestInit = {}, timeoutMs = 2500): Promise<Response> {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), timeoutMs);
    try {
      const res = await fetch(url, { ...options, signal: controller.signal });
      clearTimeout(timer);
      return res;
    } catch (err: any) {
      clearTimeout(timer);
      throw err;
    }
  }

  // ==========================================
  // AUTHORITATIVE ACTIONS
  // ==========================================
  public async createRoom(displayName: string, avatar: string = 'detective-1', settings?: any): Promise<{ room: any; hostPlayer: any; token: string }> {
    const res = await this.fetchWithTimeout(`${DEFAULT_CONFIG.httpUrl}/api/rooms`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ displayName, avatar, settings }),
    });
    if (!res.ok) {
      const errData = await res.json().catch(() => ({}));
      throw new Error(errData.error || 'Failed to create room');
    }
    const data = await res.json();
    this.setTokens(data.token, data.hostPlayer.playerId, data.room.roomId, data.hostPlayer.reconnectToken);
    await this.connect();
    return data;
  }

  public async joinRoom(joinCode: string, displayName: string, avatar: string = 'detective-1'): Promise<{ room: any; player: any; token: string }> {
    const res = await this.fetchWithTimeout(`${DEFAULT_CONFIG.httpUrl}/api/rooms/${encodeURIComponent(joinCode)}/join`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ displayName, avatar }),
    });
    if (!res.ok) {
      const errData = await res.json().catch(() => ({}));
      throw new Error(errData.error || 'Failed to join room');
    }
    const data = await res.json();
    this.setTokens(data.token, data.player.playerId, data.room.roomId, data.player.reconnectToken);
    await this.connect();
    return data;
  }

  public selectPrompt(optionIndex: number): void {
    this.send('SELECT_PROMPT', { optionIndex });
  }

  public drawStroke(chunk: any): void {
    this.send('DRAW_STROKE', { chunk });
  }

  public drawClear(): void {
    this.send('DRAW_CLEAR', {});
  }

  public submitGuess(guess: string): void {
    this.send('SUBMIT_GUESS', { guess });
  }

  public submitTheory(answer: string, confidence: number = 8): void {
    this.send('SUBMIT_THEORY', { answer, confidence });
  }

  public startGame(storyId?: string): void {
    this.send('START_GAME', { storyId });
  }

  public chooseStory(storyId: string): void {
    this.send('CHOOSE_STORY', { storyId });
  }

  public setReady(isReady: boolean): void {
    this.send('READY', { isReady });
  }

  public updateSettings(settings: any): void {
    this.send('UPDATE_SETTINGS', { settings });
  }
}

