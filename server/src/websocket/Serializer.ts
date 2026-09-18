import {
  AuthoritativeGameSession,
  GameStatus,
  Player,
  PrivateDrawerState,
  PromptOption,
  PublicGameState,
  Room,
} from '../types/index.js';

export class Serializer {
  /**
   * Serializes game session state for public broadcast to all players in the room.
   * Strips all secret objectives, unselected options, and sensitive player tokens.
   */
  public static serializePublicState(session: AuthoritativeGameSession, room: Room): PublicGameState {
    const scores: Record<string, number> = {};
    const sanitizedPlayers = room.players.map((p) => {
      scores[p.playerId] = p.score;
      const { reconnectToken, ...publicPlayer } = p;
      return publicPlayer;
    });

    const cleanObj = session.selectedEvent
      ? session.selectedEvent.drawingObjective
          .replace(/^[A-C]:\s*/i, '')
          .replace(/\*canon\*|\*B-alt\*|\*C-alt\*/gi, '')
          .replace(/^(finding|discovering|getting into|picking up|refusing)\s+(an?\s+|the\s+)?/i, '')
          .replace(/\s+(while cleaning|out of \w+|near the \w+|in the \w+).*$/i, '')
          .trim()
      : '';
    const words = cleanObj ? cleanObj.split(/\s+/).filter(Boolean).slice(0, 2) : [];
    const wordLengths = words.length > 0 ? words.map((w) => w.length) : null;
    const firstLetters = words.length > 0 ? words.map((w) => w.charAt(0).toUpperCase()) : null;

    let category = 'Crime Scene Evidence';
    const combined = ((session.selectedEvent?.hint || '') + ' ' + cleanObj).toLowerCase();
    if (combined.includes('photo') || combined.includes('video') || combined.includes('diary') || combined.includes('letter') || combined.includes('note')) {
      category = 'Personal Memory & Record';
    } else if (combined.includes('key') || combined.includes('cutter') || combined.includes('knife') || combined.includes('poison') || combined.includes('gun') || combined.includes('safe') || combined.includes('lock')) {
      category = 'Crime Tool & Evidence';
    } else if (combined.includes('fare') || combined.includes('train') || combined.includes('car') || combined.includes('ticket') || combined.includes('station') || combined.includes('passenger')) {
      category = 'Transit & Travel';
    } else if (combined.includes('diamond') || combined.includes('painting') || combined.includes('coin') || combined.includes('briefcase') || combined.includes('money') || combined.includes('gold')) {
      category = 'Valuable Property';
    }

    return {
      id: session.id,
      roomId: session.roomId,
      storyId: session.storyId,
      state: session.state,
      currentAct: session.currentAct,
      turnIndex: session.turnIndex,
      currentDrawerId: session.currentDrawerId,
      roundStartedAt: session.roundStartedAt,
      roundEndsAt: session.roundEndsAt,
      players: sanitizedPlayers,
      scores,
      solvedEvents: session.solvedEvents,
      storyVariables: session.storyVariables,
      drawingStrokeCount: session.drawingStrokes.length,
      hint: session.selectedEvent ? session.selectedEvent.hint : null,
      wordLengths,
      firstLetters,
      category,
    };
  }

  /**
   * Serializes private drawer-only state (never sent to guessers)
   */
  public static serializePrivateDrawerState(session: AuthoritativeGameSession): PrivateDrawerState {
    const isSelecting = session.state === GameStatus.PROMPT_SELECTION;
    return {
      options: isSelecting ? session.activePromptOptions : [],
      selectedObjective: session.selectedEvent ? session.selectedEvent.drawingObjective : null,
      hint: session.selectedEvent ? session.selectedEvent.hint : null,
      visualElements: session.selectedEvent ? session.selectedEvent.visualElements : null,
    };
  }

  /**
   * Serializes room state for lobby view
   */
  public static serializeRoom(room: Room): Omit<Room, 'players'> & { players: Array<Omit<Player, 'reconnectToken'>> } {
    return {
      ...room,
      players: room.players.map(({ reconnectToken, ...publicPlayer }) => publicPlayer),
    };
  }

  public static getPublicGameState(session: AuthoritativeGameSession, room: Room): PublicGameState {
    return this.serializePublicState(session, room);
  }

  public static getDrawerState(session: AuthoritativeGameSession): PrivateDrawerState {
    return this.serializePrivateDrawerState(session);
  }

  public static getPlayerPrivateState(
    session: AuthoritativeGameSession,
    room: Room,
    playerId: string
  ): { isDrawer: boolean; drawerState: PrivateDrawerState | null } {
    const isDrawer = session.currentDrawerId === playerId;
    return {
      isDrawer,
      drawerState: isDrawer ? this.serializePrivateDrawerState(session) : null,
    };
  }
}
