import {
  AuthoritativeGameState,
  EvidenceCard,
  EvidenceConnection,
  PlayerSecretClue,
  TheorySubmission,
} from '../types/game';
import { Player } from '../types/player';
import { Room } from '../types/room';
import { GameStateMachine } from '../game/GameStateMachine';
import { TurnManager } from '../game/TurnManager';
import { CaseManager } from '../game/CaseManager';
import { ScoreManager } from '../game/ScoreManager';
import { RoomChannelManager } from '../realtime/roomChannel';

const GAME_STORAGE_PREFIX = 'inkbound_game_';
const CLUES_STORAGE_PREFIX = 'inkbound_clues_';

export class GameService {
  private static activeChannels: Map<string, RoomChannelManager> = new Map();

  public static getChannel(roomId: string): RoomChannelManager {
    let channel = this.activeChannels.get(roomId);
    if (!channel) {
      channel = new RoomChannelManager(roomId);
      this.activeChannels.set(roomId, channel);
    }
    return channel;
  }

  /**
   * Initializes a brand-new game session for a room.
   */
  public static startGame(room: Room, players: Player[]): AuthoritativeGameState {
    const gameId = `game-${room.id}`;
    const selectedCaseId = room.settings.selectedCaseId || 'midnight_museum_heist';
    const mysteryCase = CaseManager.getCase(selectedCaseId);

    // Pick 1 random player as the DISTORTER if enabled
    let distorterId: string | null = null;
    if (room.settings.distorterEnabled && players.length >= 2) {
      const randomIdx = Math.floor(Math.random() * players.length);
      distorterId = players[randomIdx].id;
    }

    // Distribute private clues securely
    const playerClues = CaseManager.distributeClues(mysteryCase, players, gameId);
    this.savePrivateClues(gameId, playerClues);

    // Assign roles to players
    const gamePlayers: Player[] = players.map((p) => ({
      ...p,
      role: p.id === distorterId ? 'DISTORTER' : 'DETECTIVE',
      score: 0,
    }));

    // Initial timeline slots based on the case
    const initialTimelineSlots: Record<string, string | null> = {};
    mysteryCase.timeline.forEach((item) => {
      initialTimelineSlots[item.time] = null;
    });

    const state: AuthoritativeGameState = {
      id: gameId,
      roomId: room.id,
      caseId: mysteryCase.id,
      status: 'STORY_SELECTION',
      currentTurnPlayerId: null,
      turnIndex: 0,
      turnStartedAt: null,
      turnEndsAt: null,
      turnDuration: room.settings.turnDuration || 40,
      sequenceNumber: 1,
      currentCase: mysteryCase,
      players: gamePlayers,
      evidenceCards: [],
      connections: [],
      timelineSlots: initialTimelineSlots,
      theories: {},
      scores: {},
      distorterId,
    };

    this.saveGameState(state);
    const channel = this.getChannel(room.id);
    channel.broadcast(
      'GAME_STARTED',
      room.hostId,
      { gameId, status: state.status, state },
      state.sequenceNumber
    );

    return state;
  }

  /**
   * Advances the game from CASE_INTRO to the first serial player turn.
   */
  public static startFirstTurn(state: AuthoritativeGameState): AuthoritativeGameState {
    GameStateMachine.assertTransition(state.status, 'CLUE_DISTRIBUTION');
    GameStateMachine.assertTransition('CLUE_DISTRIBUTION', 'TURN_START');
    GameStateMachine.assertTransition('TURN_START', 'PLAYER_DRAWING');

    const turn = TurnManager.createTurn(state.players, 0, state.turnDuration);

    const updatedState: AuthoritativeGameState = {
      ...state,
      status: 'PLAYER_DRAWING',
      currentTurnPlayerId: turn.currentTurnPlayerId,
      turnIndex: turn.turnIndex,
      turnStartedAt: turn.turnStartedAt,
      turnEndsAt: turn.turnEndsAt,
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast(
      'TURN_STARTED',
      turn.currentTurnPlayerId!,
      {
        turnIndex: turn.turnIndex,
        playerId: turn.currentTurnPlayerId,
        turnStartedAt: turn.turnStartedAt,
        turnEndsAt: turn.turnEndsAt,
        durationSeconds: turn.durationSeconds,
        state: updatedState,
      },
      updatedState.sequenceNumber
    );

    return updatedState;
  }

  /**
   * Submits active player's drawing and generates visual evidence card.
   */
  public static submitDrawing(
    state: AuthoritativeGameState,
    playerId: string,
    previewDataUrl: string
  ): AuthoritativeGameState {
    if (state.currentTurnPlayerId !== playerId) {
      throw new Error('[GameService] Only the active drawer can submit evidence.');
    }

    const activePlayer = state.players.find((p) => p.id === playerId);
    const activePlayerName = activePlayer?.nickname || 'Unknown Detective';
    const activePlayerAvatar = activePlayer?.avatar || '🕵️‍♂️';

    // Retrieve the secret clue this player had
    const clues = this.getPrivateClues(state.id);
    const playerClue = clues.find((c) => c.playerId === playerId);

    const newEvidenceCard: EvidenceCard = {
      id: `ev-${Date.now()}-${Math.random().toString(36).substring(2, 6)}`,
      gameId: state.id,
      drawingId: `draw-${Date.now()}`,
      sourcePlayerId: playerId,
      sourcePlayerName: activePlayerName,
      sourcePlayerAvatar: activePlayerAvatar,
      title: playerClue ? `Clue #${playerClue.clueOrder}: ${playerClue.clueTitle}` : `Evidence Piece #${state.evidenceCards.length + 1}`,
      drawingPreview: previewDataUrl,
      notes: `Drawn by ${activePlayerName} during Turn ${state.turnIndex + 1}`,
      tags: ['Visual Witness', 'Field Sketch'],
      position: {
        x: 40 + (state.evidenceCards.length % 3) * 260,
        y: 40 + Math.floor(state.evidenceCards.length / 3) * 280,
      },
      createdAt: new Date().toISOString(),
    };

    const updatedEvidence = [...state.evidenceCards, newEvidenceCard];
    const nextTurnIndex = TurnManager.getNextTurnIndex(state.turnIndex, state.players.length);

    let nextStatus = state.status;
    let nextTurnPlayerId: string | null = null;
    let nextTurnStartedAt: string | null = null;
    let nextTurnEndsAt: string | null = null;
    let newTurnIndex = state.turnIndex;

    if (nextTurnIndex !== null) {
      // More players need to draw!
      nextStatus = 'PLAYER_DRAWING';
      const turn = TurnManager.createTurn(state.players, nextTurnIndex, state.turnDuration);
      nextTurnPlayerId = turn.currentTurnPlayerId;
      nextTurnStartedAt = turn.turnStartedAt;
      nextTurnEndsAt = turn.turnEndsAt;
      newTurnIndex = nextTurnIndex;
    } else {
      // All serial turns are completed! Transition to Investigation Board
      nextStatus = 'INVESTIGATION';
    }

    const updatedState: AuthoritativeGameState = {
      ...state,
      status: nextStatus,
      evidenceCards: updatedEvidence,
      currentTurnPlayerId: nextTurnPlayerId,
      turnIndex: newTurnIndex,
      turnStartedAt: nextTurnStartedAt,
      turnEndsAt: nextTurnEndsAt,
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);

    channel.broadcast(
      'DRAWING_SUBMITTED',
      playerId,
      {
        evidenceCard: newEvidenceCard,
        nextStatus,
        nextTurnPlayerId,
        state: updatedState,
      },
      updatedState.sequenceNumber
    );

    return updatedState;
  }

  /**
   * Places or removes an evidence card on the timeline slot.
   */
  public static updateTimeline(
    state: AuthoritativeGameState,
    slotTime: string,
    evidenceId: string | null,
    placedBy: string
  ): AuthoritativeGameState {
    const updatedSlots = {
      ...state.timelineSlots,
      [slotTime]: evidenceId,
    };

    const updatedState: AuthoritativeGameState = {
      ...state,
      timelineSlots: updatedSlots,
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast(
      'TIMELINE_UPDATED',
      placedBy,
      { slotTime, evidenceId, placedBy, state: updatedState },
      updatedState.sequenceNumber
    );

    return updatedState;
  }

  /**
   * Adds a red-string investigation thread connecting two evidence cards.
   */
  public static addEvidenceConnection(
    state: AuthoritativeGameState,
    fromId: string,
    toId: string,
    label: string,
    createdBy: string
  ): AuthoritativeGameState {
    const newConnection: EvidenceConnection = {
      id: `conn-${Date.now()}`,
      gameId: state.id,
      fromEvidenceId: fromId,
      toEvidenceId: toId,
      label,
    };

    const updatedState: AuthoritativeGameState = {
      ...state,
      connections: [...state.connections, newConnection],
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast(
      'TIMELINE_UPDATED',
      createdBy,
      { newConnection, state: updatedState },
      updatedState.sequenceNumber
    );
    return updatedState;
  }

  /**
   * Submits a private theory dossier from a player.
   */
  public static submitTheory(
    state: AuthoritativeGameState,
    theory: TheorySubmission
  ): AuthoritativeGameState {
    const updatedTheories = {
      ...state.theories,
      [theory.playerId]: theory,
    };

    const updatedState: AuthoritativeGameState = {
      ...state,
      theories: updatedTheories,
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast(
      'THEORY_SUBMITTED',
      theory.playerId,
      { playerId: theory.playerId, state: updatedState },
      updatedState.sequenceNumber
    );

    return updatedState;
  }

  /**
   * Transitions from Investigation to Final Theory phase.
   */
  public static goToFinalTheory(state: AuthoritativeGameState): AuthoritativeGameState {
    const updatedState: AuthoritativeGameState = {
      ...state,
      status: 'FINAL_THEORY',
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast('ACCUSATION_STARTED', state.players[0]?.id || 'system', { state: updatedState }, updatedState.sequenceNumber);
    return updatedState;
  }

  /**
   * Locks all accusations, calculates server-authoritative scores, and initiates cinematic reveal.
   */
  public static lockAccusationsAndReveal(state: AuthoritativeGameState): AuthoritativeGameState {
    if (!state.currentCase) {
      state.currentCase = CaseManager.getCase(state.caseId);
    }

    const calculatedScores = ScoreManager.calculateScores(
      state.currentCase,
      state.players,
      state.theories,
      state.distorterId,
      state.timelineSlots
    );

    const updatedState: AuthoritativeGameState = {
      ...state,
      status: 'TRUTH_REVEAL',
      scores: calculatedScores,
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast(
      'REVEAL_STARTED',
      'system',
      { scores: calculatedScores, state: updatedState },
      updatedState.sequenceNumber
    );

    return updatedState;
  }

  /**
   * Advances from TRUTH_REVEAL to RESULTS screen.
   */
  public static goToResults(state: AuthoritativeGameState): AuthoritativeGameState {
    const updatedState: AuthoritativeGameState = {
      ...state,
      status: 'RESULTS',
      sequenceNumber: state.sequenceNumber + 1,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast('GAME_FINISHED', 'system', { state: updatedState }, updatedState.sequenceNumber);
    return updatedState;
  }

  /**
   * Resets game back to LOBBY for another round.
   */
  public static returnToLobby(state: AuthoritativeGameState): AuthoritativeGameState {
    const updatedPlayers = state.players.map((p) => ({
      ...p,
      isReady: false,
      role: undefined,
    }));

    const updatedState: AuthoritativeGameState = {
      ...state,
      status: 'LOBBY',
      currentTurnPlayerId: null,
      turnIndex: 0,
      turnStartedAt: null,
      turnEndsAt: null,
      evidenceCards: [],
      connections: [],
      theories: {},
      scores: {},
      distorterId: null,
      sequenceNumber: state.sequenceNumber + 1,
      players: updatedPlayers,
    };

    this.saveGameState(updatedState);
    const channel = this.getChannel(state.roomId);
    channel.broadcast('GAME_FINISHED', 'system', { state: updatedState, returnToLobby: true }, updatedState.sequenceNumber);

    return updatedState;
  }

  // --- In-Memory & Local Storage State Helpers ---

  private static inMemoryGames: Map<string, AuthoritativeGameState> = new Map();
  private static inMemoryClues: Map<string, PlayerSecretClue[]> = new Map();

  public static getGameState(roomId: string): AuthoritativeGameState | null {
    const mem = this.inMemoryGames.get(roomId);
    if (mem) return mem;

    try {
      if (typeof localStorage !== 'undefined') {
        const data = localStorage.getItem(`${GAME_STORAGE_PREFIX}${roomId}`);
        if (data) {
          const parsed = JSON.parse(data);
          this.inMemoryGames.set(roomId, parsed);
          return parsed;
        }
      }
    } catch {
      // ignore
    }
    return null;
  }

  public static saveGameState(state: AuthoritativeGameState): void {
    this.inMemoryGames.set(state.roomId, state);
    this.inMemoryGames.set(state.id, state);
    try {
      if (typeof localStorage !== 'undefined') {
        localStorage.setItem(`${GAME_STORAGE_PREFIX}${state.roomId}`, JSON.stringify(state));
      }
    } catch {
      // ignore
    }
  }

  public static savePrivateClues(gameId: string, clues: PlayerSecretClue[]): void {
    this.inMemoryClues.set(gameId, clues);
    try {
      if (typeof localStorage !== 'undefined') {
        localStorage.setItem(`${CLUES_STORAGE_PREFIX}${gameId}`, JSON.stringify(clues));
      }
    } catch {
      // ignore
    }
  }

  public static getPrivateClues(gameId: string): PlayerSecretClue[] {
    const mem = this.inMemoryClues.get(gameId);
    if (mem) return mem;

    try {
      if (typeof localStorage !== 'undefined') {
        const data = localStorage.getItem(`${CLUES_STORAGE_PREFIX}${gameId}`);
        if (data) {
          const parsed = JSON.parse(data);
          this.inMemoryClues.set(gameId, parsed);
          return parsed;
        }
      }
    } catch {
      // ignore
    }
    return [];
  }

  /**
   * SECURITY ENFORCEMENT: Retrieves ONLY the active player's secret clue.
   * Other players' clues are strictly shielded unless status is TRUTH_REVEAL or RESULTS.
   */
  public static getPlayerClue(
    gameId: string,
    playerId: string,
    gameStatus: string
  ): PlayerSecretClue | null {
    let allClues = this.getPrivateClues(gameId);

    // If clues are not in this client's local storage, reconstruct them deterministically from the game
    if (allClues.length === 0) {
      try {
        for (let i = 0; i < localStorage.length; i++) {
          const key = localStorage.key(i);
          if (key && key.startsWith(GAME_STORAGE_PREFIX)) {
            const raw = localStorage.getItem(key);
            if (raw) {
              const state: AuthoritativeGameState = JSON.parse(raw);
              if (state && (state.id === gameId || `game-${state.roomId}` === gameId)) {
                const mysteryCase = state.currentCase || CaseManager.getCase(state.caseId);
                allClues = CaseManager.distributeClues(mysteryCase, state.players, gameId);
                this.savePrivateClues(gameId, allClues);
                break;
              }
            }
          }
        }
      } catch {
        // ignore
      }
    }

    // If game is in reveal or results, all clues can be inspected
    if (gameStatus === 'TRUTH_REVEAL' || gameStatus === 'RESULTS' || gameStatus === 'GAME_FINISHED') {
      return allClues.find((c) => c.playerId === playerId) || null;
    }

    // Otherwise, strictly ONLY allow the matching authenticated player to view their own clue!
    return allClues.find((c) => c.playerId === playerId) || null;
  }
}
