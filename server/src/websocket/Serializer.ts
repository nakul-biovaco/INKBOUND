import {
  AuthoritativeGameSession,
  GameStatus,
  Player,
  PrivateDrawerState,
  PromptOption,
  PublicGameState,
  Room,
} from '../types/index.js';
import { MarkdownStoryParser } from '../story/MarkdownStoryParser.js';

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
      ? MarkdownStoryParser.cleanToClueWord(session.selectedEvent.drawingObjective)
      : '';

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
    } else if (session.selectedEvent?.hint) {
      category = session.selectedEvent.hint;
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
      drawingStrokeCount: session.drawingStrokes ? session.drawingStrokes.length : 0,
      hint: session.clueHint || (session.selectedEvent ? session.selectedEvent.hint : null),
      clueHint: session.clueHint || (session.selectedEvent ? session.selectedEvent.hint : null),
      category,
      wordLengths: cleanObj ? cleanObj.split(/\s+/).filter(Boolean).map((w) => w.length) : null,
      firstLetters: cleanObj ? cleanObj.split(/\s+/).filter(Boolean).map((w) => w[0]?.toUpperCase() || '') : null,
      // Case model fields
      narrativeLog: session.narrativeLog || [],
      evidenceBoard: session.evidenceBoard || [],
      suspects: session.suspects || [],
      caseProgress: session.caseProgress || null,
      discussionOptions: session.discussionOptions || null,
      discussionVotes: session.discussionVotes || [],
      storyContext: session.storyContext || null,
      investigationObjective: session.investigationObjective || null,
      revealedLetters: session.revealedLetters || null,
    };
  }

  /**
   * Serializes private drawer-only state (never sent to guessers)
   */
  public static serializePrivateDrawerState(session: AuthoritativeGameSession): PrivateDrawerState {
    const isSelecting = session.state === GameStatus.PROMPT_SELECTION;
    const cleanObjective = session.selectedEvent ? session.selectedEvent.drawingObjective : null;
    return {
      options: isSelecting ? session.activePromptOptions : [],
      selectedObjective: cleanObjective,
      objective: cleanObjective,
      hint: session.selectedEvent ? session.selectedEvent.hint : null,
      visualElements: session.selectedEvent ? session.selectedEvent.visualElements : null,
      // Case model: narrative drawer prompt + canonical answer
      drawerPrompt: session.selectedEvent?.drawerPrompt || null,
      canonicalAnswer: cleanObjective,
      storyContext: session.storyContext || null,
    };
  }

  /**
   * Serializes room state for lobby view
   */
  public static serializeRoom(room: Room): any {
    const rawSettings = (room.settings as any) || {};
    const settings = {
      ...rawSettings,
      drawingTimeLimit: rawSettings.drawingTimeLimit || rawSettings.turnDuration || 120,
      turnDuration: rawSettings.drawingTimeLimit || rawSettings.turnDuration || 120,
      roundsPerGame: rawSettings.roundsPerGame || rawSettings.rounds || 1,
      rounds: rawSettings.roundsPerGame || rawSettings.rounds || 1,
      storyId: rawSettings.storyId || rawSettings.selectedCaseId || 'all',
      selectedCaseId: rawSettings.storyId || rawSettings.selectedCaseId || 'all',
      isQuickMatch: Boolean(rawSettings.isQuickMatch || room.isQuickMatch),
    };

    return {
      ...room,
      settings,
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
