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
      wordLengths: session.selectedEvent
        ? session.selectedEvent.drawingObjective
            .replace(/^[A-C]:\s*/i, '')
            .replace(/\*canon\*|\*B-alt\*|\*C-alt\*/gi, '')
            .trim()
            .split(/\s+/)
            .filter(Boolean)
            .slice(0, 2)
            .map((w) => w.length)
        : null,
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
