import { RealtimeMessage, GameEventType } from '../types/events';
import { PlayerPresence } from '../types/player';
import { Room } from '../types/room';
import { supabase, isSupabaseConfigured } from '../integrations/supabase/client';

export type MessageHandler = (message: RealtimeMessage) => void;
export type PresenceHandler = (presences: PlayerPresence[]) => void;

export class RoomChannelManager {
  private roomId: string;
  private channelName: string;
  private messageHandlers: Set<MessageHandler> = new Set();
  private presenceHandlers: Set<PresenceHandler> = new Set();
  private localBroadcastChannel: BroadcastChannel | null = null;
  private currentPresence: PlayerPresence | null = null;
  private seenEventIds: Set<string> = new Set();
  private supabaseChannel: ReturnType<typeof supabase.channel> | null = null;
  private isSubscribed: boolean = false;

  constructor(roomId: string) {
    this.roomId = roomId;
    this.channelName = `room_${roomId.replace(/[^a-zA-Z0-9_-]/g, '_')}`;
    this.initLocalBroadcast();
    this.initSupabaseChannel();
  }

  private initLocalBroadcast(): void {
    try {
      if (typeof window !== 'undefined' && 'BroadcastChannel' in window) {
        this.localBroadcastChannel = new BroadcastChannel(`inkbound_${this.roomId}`);
        this.localBroadcastChannel.onmessage = (event) => {
          const message = event.data as RealtimeMessage;
          this.handleIncomingMessage(message);
        };
      }
    } catch (err) {
      console.warn('[RoomChannelManager] Local BroadcastChannel unavailable:', err);
    }
  }

  private pendingBroadcasts: RealtimeMessage[] = [];

  private initSupabaseChannel(): void {
    if (!isSupabaseConfigured) return;

    try {
      this.supabaseChannel = supabase.channel(this.channelName, {
        config: {
          broadcast: { self: false },
          presence: { key: this.currentPresence?.playerId || `client_${Date.now()}` },
        },
      });

      this.supabaseChannel
        .on('broadcast', { event: 'game_event' }, (payload) => {
          if (payload && payload.payload) {
            this.handleIncomingMessage(payload.payload as RealtimeMessage);
          }
        })
        .on(
          'postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'room_players',
            filter: `room_id=eq.${this.roomId}`,
          },
          async () => {
            const { RoomService } = await import('../services/roomService');
            const freshPlayers = await RoomService.fetchPlayersFromSupabase(this.roomId);
            if (freshPlayers && freshPlayers.length > 0) {
              this.handleIncomingMessage({
                eventId: `db-player-sync-${Date.now()}-${Math.random().toString(36).substring(2, 6)}`,
                gameId: this.roomId,
                actorId: 'system',
                timestamp: Date.now(),
                sequenceNumber: 0,
                type: 'PLAYERS_SYNC',
                payload: { players: freshPlayers },
              });
            }
          }
        )
        .on(
          'postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'rooms',
            filter: `id=eq.${this.roomId}`,
          },
          async (payload) => {
            if (payload.new && typeof payload.new === 'object') {
              const newRecord = payload.new as { settings?: Room['settings'] };
              if (newRecord.settings) {
                this.handleIncomingMessage({
                  eventId: `db-settings-sync-${Date.now()}`,
                  gameId: this.roomId,
                  actorId: 'system',
                  timestamp: Date.now(),
                  sequenceNumber: 0,
                  type: 'SETTINGS_UPDATED',
                  payload: { settings: newRecord.settings },
                });
              }
            }
          }
        )
        .on('presence', { event: 'sync' }, () => {
          this.syncPresenceState();
        })
        .on('presence', { event: 'join' }, () => {
          this.syncPresenceState();
        })
        .on('presence', { event: 'leave' }, () => {
          this.syncPresenceState();
        });

      this.supabaseChannel.subscribe(async (status) => {
        if (status === 'SUBSCRIBED') {
          this.isSubscribed = true;

          // Flush any pending broadcasts that were queued while subscribing
          if (this.pendingBroadcasts.length > 0) {
            const pending = [...this.pendingBroadcasts];
            this.pendingBroadcasts = [];
            for (const msg of pending) {
              try {
                await this.supabaseChannel?.send({
                  type: 'broadcast',
                  event: 'game_event',
                  payload: msg,
                });
              } catch (err) {
                console.warn('[RoomChannelManager] Error flushing pending broadcast:', err);
              }
            }
          }

          if (this.currentPresence) {
            try {
              await this.supabaseChannel?.track(this.currentPresence);
            } catch (err) {
              console.warn('[RoomChannelManager] Track presence error:', err);
            }
          }
        }
      });
    } catch (err) {
      console.warn('[RoomChannelManager] Supabase channel init error:', err);
    }
  }

  private syncPresenceState(): void {
    if (!this.supabaseChannel) return;
    const state = this.supabaseChannel.presenceState();
    const presences: PlayerPresence[] = [];

    Object.values(state).forEach((items: unknown) => {
      if (Array.isArray(items)) {
        items.forEach((item) => {
          if (item && typeof item === 'object' && 'playerId' in item) {
            presences.push(item as PlayerPresence);
          }
        });
      }
    });

    this.notifyPresence(presences);
  }

  private handleIncomingMessage(message: RealtimeMessage): void {
    if (!message || !message.eventId) return;
    if (this.seenEventIds.has(message.eventId)) return; // Deduplication
    this.seenEventIds.add(message.eventId);

    // Limit set size to prevent memory leaks
    if (this.seenEventIds.size > 2000) {
      const iterator = this.seenEventIds.values();
      for (let i = 0; i < 500; i++) {
        this.seenEventIds.delete(iterator.next().value!);
      }
    }

    this.messageHandlers.forEach((handler) => {
      try {
        handler(message);
      } catch (err) {
        console.error('[RoomChannelManager] Error in message handler:', err);
      }
    });
  }

  public subscribeMessages(handler: MessageHandler): () => void {
    this.messageHandlers.add(handler);
    return () => this.messageHandlers.delete(handler);
  }

  public subscribePresence(handler: PresenceHandler): () => void {
    this.presenceHandlers.add(handler);
    return () => this.presenceHandlers.delete(handler);
  }

  private notifyPresence(presences: PlayerPresence[]): void {
    this.presenceHandlers.forEach((handler) => {
      try {
        handler(presences);
      } catch (err) {
        console.error('[RoomChannelManager] Presence handler error:', err);
      }
    });
  }

  /**
   * Broadcasts a game event to all peers in the room.
   */
  public broadcast<T>(
    type: GameEventType,
    actorId: string,
    payload: T,
    sequenceNumber: number = 0
  ): void {
    const message: RealtimeMessage<T> = {
      eventId: `evt-${Date.now()}-${Math.random().toString(36).substring(2, 8)}`,
      gameId: this.roomId,
      actorId,
      timestamp: Date.now(),
      sequenceNumber,
      type,
      payload,
    };

    // Broadcast locally across tabs in same browser
    if (this.localBroadcastChannel) {
      try {
        this.localBroadcastChannel.postMessage(message);
      } catch (err) {
        console.warn('[RoomChannelManager] Local postMessage failed:', err);
      }
    }

    // Broadcast via Supabase Realtime to different browsers / mobile devices
    if (this.supabaseChannel && isSupabaseConfigured) {
      if (this.isSubscribed) {
        this.supabaseChannel.send({
          type: 'broadcast',
          event: 'game_event',
          payload: message,
        }).catch((err) => {
          console.warn('[RoomChannelManager] Supabase broadcast error:', err);
        });
      } else {
        this.pendingBroadcasts.push(message as RealtimeMessage);
      }
    }
  }

  /**
   * Tracks this detective's presence in the room.
   */
  public async trackPresence(presence: PlayerPresence): Promise<void> {
    this.currentPresence = presence;
    if (this.supabaseChannel && isSupabaseConfigured && this.isSubscribed) {
      try {
        await this.supabaseChannel.track(presence);
      } catch (err) {
        console.warn('[RoomChannelManager] Error tracking presence:', err);
      }
    }
  }

  public getCurrentPresence(): PlayerPresence | null {
    return this.currentPresence;
  }

  public destroy(): void {
    this.messageHandlers.clear();
    this.presenceHandlers.clear();
    if (this.localBroadcastChannel) {
      this.localBroadcastChannel.close();
      this.localBroadcastChannel = null;
    }
    if (this.supabaseChannel) {
      supabase.removeChannel(this.supabaseChannel);
      this.supabaseChannel = null;
    }
    this.isSubscribed = false;
  }
}
