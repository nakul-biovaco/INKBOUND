import { Room, RoomSettings } from '../types/room';
import { Player } from '../types/player';
import { supabase, isSupabaseConfigured } from '../integrations/supabase/client';
import { GameService } from './gameService';

const ROOMS_LOCAL_STORAGE_PREFIX = 'inkbound_room_';

function generateUUID(): string {
  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID();
  }
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = (Math.random() * 16) | 0;
    const v = c === 'x' ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

export class RoomService {
  /**
   * Generates a clean, readable 6-character room code (avoiding ambiguous chars).
   */
  public static generateRoomCode(): string {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    let result = '';
    for (let i = 0; i < 6; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }

  /**
   * Creates a new case room with the given host player.
   */
  public static async createRoom(
    host: Player,
    settings?: Partial<RoomSettings>
  ): Promise<{ room: Room; players: Player[] }> {
    const code = this.generateRoomCode();
    const roomId = generateUUID();

    const defaultSettings: RoomSettings = {
      turnDuration: 120,
      distorterEnabled: true,
      selectedCaseId: 'midnight_museum_heist',
      allowQuestioning: true,
      ...settings,
    };

    const newRoom: Room = {
      id: roomId,
      code,
      hostId: host.id,
      maxPlayers: 8,
      status: 'WAITING',
      settings: defaultSettings,
      createdAt: new Date().toISOString(),
    };

    const hostPlayer: Player = {
      ...host,
      isHost: true,
      isReady: true,
    };

    // Save locally for instant access
    this.saveLocalRoom(newRoom, [hostPlayer]);

    // Persist to Supabase when connected
    if (isSupabaseConfigured) {
      try {
        await supabase.from('rooms').insert({
          id: newRoom.id,
          code: newRoom.code,
          host_id: host.id,
          max_players: newRoom.maxPlayers,
          status: newRoom.status,
          settings: newRoom.settings,
        });

        await supabase.from('room_players').insert({
          room_id: newRoom.id,
          player_id: host.id,
          nickname: host.nickname,
          avatar: host.avatar,
          is_host: true,
          is_ready: true,
        });
      } catch (err) {
        console.warn('[RoomService] Supabase room creation failed:', err);
      }
    }

    return { room: newRoom, players: [hostPlayer] };
  }

  /**
   * Joins an existing room via 6-character code.
   */
  public static async joinRoom(
    code: string,
    player: Player
  ): Promise<{ room: Room; players: Player[] } | { error: string }> {
    const cleanCode = code.trim().toUpperCase();

    // 1. Check local storage first
    let local = this.findLocalRoomByCode(cleanCode);

    // 2. If not in local storage, check Supabase
    if (!local && isSupabaseConfigured) {
      try {
        const { data: roomData } = await supabase
          .from('rooms')
          .select('*')
          .eq('code', cleanCode)
          .single();

        if (roomData) {
          const room: Room = {
            id: roomData.id,
            code: roomData.code,
            hostId: roomData.host_id,
            maxPlayers: roomData.max_players || 8,
            status: roomData.status || 'WAITING',
            settings: roomData.settings || { turnDuration: 40, distorterEnabled: true },
            createdAt: roomData.created_at,
          };

          const { data: playersData } = await supabase
            .from('room_players')
            .select('*')
            .eq('room_id', room.id);

          const existingPlayers: Player[] = (playersData || []).map((rp) => ({
            id: rp.player_id,
            nickname: rp.nickname,
            avatar: rp.avatar,
            isHost: rp.is_host,
            isReady: rp.is_ready,
            joinedAt: rp.joined_at,
            lastSeenAt: rp.last_seen_at,
            isOnline: true,
            score: 0,
          }));

          local = { room, players: existingPlayers };
          this.saveLocalRoom(room, existingPlayers);
        }
      } catch (err) {
        console.warn('[RoomService] Supabase fetch error:', err);
      }
    }

    if (!local) {
      return { error: `Case file code "${cleanCode}" not found. Verify with your team.` };
    }

    const existingPlayerIdx = local.players.findIndex((p) => p.id === player.id);
    let updatedPlayers = [...local.players];

    if (existingPlayerIdx >= 0) {
      updatedPlayers[existingPlayerIdx] = {
        ...updatedPlayers[existingPlayerIdx],
        nickname: player.nickname,
        avatar: player.avatar,
        isOnline: true,
      };
    } else {
      if (local.players.length >= local.room.maxPlayers) {
        return { error: 'This investigation room is already full (max capacity reached).' };
      }
      updatedPlayers.push({
        ...player,
        isHost: player.id === local.room.hostId,
        isReady: player.id === local.room.hostId,
      });
    }

    this.saveLocalRoom(local.room, updatedPlayers);

    // Sync to Supabase
    if (isSupabaseConfigured) {
      try {
        await supabase.from('room_players').upsert({
          room_id: local.room.id,
          player_id: player.id,
          nickname: player.nickname,
          avatar: player.avatar,
          is_host: player.id === local.room.hostId,
          is_ready: player.id === local.room.hostId,
          last_seen_at: new Date().toISOString(),
        });
      } catch (err) {
        console.warn('[RoomService] Supabase room_players upsert error:', err);
      }
    }

    // Broadcast live to all connected players
    const channel = GameService.getChannel(local.room.id);
    channel.broadcast('PLAYERS_SYNC', player.id, { players: updatedPlayers });

    return { room: local.room, players: updatedPlayers };
  }

  /**
   * Quick Matchmaking: finds an available room with open slots or creates a new public one.
   */
  public static async quickMatchRoom(
    player: Player
  ): Promise<{ room: Room; players: Player[]; isNewRoom: boolean } | { error: string }> {
    if (isSupabaseConfigured) {
      try {
        const { data: roomsData } = await supabase
          .from('rooms')
          .select('*')
          .eq('status', 'WAITING')
          .order('created_at', { ascending: false })
          .limit(10);

        if (roomsData && roomsData.length > 0) {
          for (const rd of roomsData) {
            const { data: rps } = await supabase
              .from('room_players')
              .select('*')
              .eq('room_id', rd.id);
            if (rps && rps.length < (rd.max_players || 8) && rps.length > 0) {
              const joined = await this.joinRoom(rd.code, player);
              if (!('error' in joined)) {
                return { ...joined, isNewRoom: false };
              }
            }
          }
        }
      } catch (err) {
        console.warn('[RoomService] Supabase quick match query error:', err);
      }
    }

    // Fallback: create fresh room
    const created = await this.createRoom(player, { distorterEnabled: false });
    return { ...created, isNewRoom: true };
  }

  /**
   * Toggles ready state for a player and broadcasts live update.
   */
  public static toggleReady(roomId: string, playerId: string): Player[] {
    const local = this.getLocalRoom(roomId);
    if (!local) return [];

    const updated = local.players.map((p) =>
      p.id === playerId ? { ...p, isReady: !p.isReady } : p
    );
    this.saveLocalRoom(local.room, updated);

    // Sync to Supabase
    if (isSupabaseConfigured) {
      const me = updated.find((p) => p.id === playerId);
      if (me) {
        supabase
          .from('room_players')
          .update({ is_ready: me.isReady })
          .match({ room_id: roomId, player_id: playerId })
          .then();
      }
    }

    // Broadcast live
    const channel = GameService.getChannel(roomId);
    channel.broadcast('PLAYERS_SYNC', playerId, { players: updated });

    return updated;
  }

  /**
   * Adds an AI detective bot to simulate multiplayer in solo testing.
   */
  public static addBotDetective(roomId: string): Player[] {
    const local = this.getLocalRoom(roomId);
    if (!local) return [];
    if (local.players.length >= 8) return local.players;

    const botPresets = [
      { name: 'Inspector Bot', avatar: '🕵️' },
      { name: 'Agent Cipher', avatar: '🤖' },
      { name: 'Detective Echo', avatar: '🔍' },
      { name: 'Investigator AI', avatar: '💼' },
    ];

    const available = botPresets.filter((b) => !local.players.some((p) => p.nickname === b.name));
    const bot = available[0] || { name: `Detective_${local.players.length + 1}`, avatar: '🕵️‍♀️' };

    const newBot: Player = {
      id: `bot-${Date.now()}-${Math.random().toString(36).substring(2, 6)}`,
      nickname: bot.name,
      avatar: bot.avatar,
      isHost: false,
      isReady: true,
      joinedAt: new Date().toISOString(),
      lastSeenAt: new Date().toISOString(),
      isOnline: true,
      score: 0,
    };

    const updated = [...local.players, newBot];
    this.saveLocalRoom(local.room, updated);

    const channel = GameService.getChannel(roomId);
    channel.broadcast('PLAYERS_SYNC', newBot.id, { players: updated });

    return updated;
  }

  /**
   * Fetches authoritative players list from Supabase room_players table.
   */
  public static async fetchPlayersFromSupabase(roomId: string): Promise<Player[] | null> {
    if (!isSupabaseConfigured) return null;
    try {
      const { data, error } = await supabase
        .from('room_players')
        .select('*')
        .eq('room_id', roomId)
        .order('joined_at', { ascending: true });

      if (error || !data) return null;

      const players: Player[] = data.map((rp) => ({
        id: rp.player_id,
        nickname: rp.nickname,
        avatar: rp.avatar,
        isHost: rp.is_host,
        isReady: rp.is_ready,
        joinedAt: rp.joined_at,
        lastSeenAt: rp.last_seen_at,
        isOnline: true,
        score: 0,
      }));

      // Cache locally
      const local = this.getLocalRoom(roomId);
      if (local) {
        this.saveLocalRoom(local.room, players);
      }

      return players;
    } catch (err) {
      console.warn('[RoomService] fetchPlayersFromSupabase error:', err);
      return null;
    }
  }

  /**
   * Promotes a player to become the host of the room.
   */
  public static promoteHost(roomId: string, newHostId: string, currentUserId: string): Player[] {
    const local = this.getLocalRoom(roomId);
    if (!local) return [];

    const updatedRoom: Room = { ...local.room, hostId: newHostId };
    const updatedPlayers = local.players.map((p) => ({
      ...p,
      isHost: p.id === newHostId,
    }));

    this.saveLocalRoom(updatedRoom, updatedPlayers);

    if (isSupabaseConfigured) {
      supabase.from('rooms').update({ host_id: newHostId }).eq('id', roomId).then();
      supabase.from('room_players').update({ is_host: false }).eq('room_id', roomId).then();
      supabase.from('room_players').update({ is_host: true }).match({ room_id: roomId, player_id: newHostId }).then();
    }

    const channel = GameService.getChannel(roomId);
    channel.broadcast('PLAYERS_SYNC', currentUserId, { players: updatedPlayers });

    return updatedPlayers;
  }

  /**
   * Removes a player from the room.
   */
  public static removePlayer(roomId: string, playerId: string): Player[] {
    const local = this.getLocalRoom(roomId);
    if (!local) return [];

    const updated = local.players.filter((p) => p.id !== playerId);
    this.saveLocalRoom(local.room, updated);

    if (isSupabaseConfigured) {
      supabase.from('room_players').delete().match({ room_id: roomId, player_id: playerId }).then();
    }

    const channel = GameService.getChannel(roomId);
    channel.broadcast('PLAYERS_SYNC', playerId, { players: updated });

    return updated;
  }

  /**
   * Updates room settings and broadcasts to peers.
   */
  public static updateSettings(roomId: string, settings: RoomSettings, updatedBy: string): void {
    const local = this.getLocalRoom(roomId);
    if (!local) return;

    const updatedRoom: Room = {
      ...local.room,
      settings,
    };

    this.saveLocalRoom(updatedRoom, local.players);

    if (isSupabaseConfigured) {
      supabase
        .from('rooms')
        .update({ settings })
        .eq('id', roomId)
        .then();
    }

    const channel = GameService.getChannel(roomId);
    channel.broadcast('SETTINGS_UPDATED', updatedBy, { settings });
  }

  private static inMemoryRooms: Map<string, { room: Room; players: Player[] }> = new Map();

  public static getLocalRoom(roomId: string): { room: Room; players: Player[] } | null {
    const mem = this.inMemoryRooms.get(roomId);
    if (mem) return mem;

    try {
      if (typeof localStorage !== 'undefined') {
        const data = localStorage.getItem(`${ROOMS_LOCAL_STORAGE_PREFIX}${roomId}`);
        if (data) {
          const parsed = JSON.parse(data);
          this.inMemoryRooms.set(roomId, parsed);
          return parsed;
        }
      }
    } catch {
      // ignore
    }
    return null;
  }

  public static findLocalRoomByCode(code: string): { room: Room; players: Player[] } | null {
    for (const val of this.inMemoryRooms.values()) {
      if (val.room && val.room.code === code) {
        return val;
      }
    }

    try {
      if (typeof localStorage !== 'undefined') {
        for (let i = 0; i < localStorage.length; i++) {
          const key = localStorage.key(i);
          if (key && key.startsWith(ROOMS_LOCAL_STORAGE_PREFIX)) {
            const val = JSON.parse(localStorage.getItem(key) || '{}');
            if (val.room && val.room.code === code) {
              this.inMemoryRooms.set(val.room.id, val);
              return val;
            }
          }
        }
      }
    } catch {
      // ignore
    }
    return null;
  }

  public static saveLocalRoom(room: Room, players: Player[]): void {
    this.inMemoryRooms.set(room.id, { room, players });
    try {
      if (typeof localStorage !== 'undefined') {
        localStorage.setItem(
          `${ROOMS_LOCAL_STORAGE_PREFIX}${room.id}`,
          JSON.stringify({ room, players })
        );
      }
    } catch {
      // ignore
    }
  }
}
