import React, { useState, useEffect } from 'react';
import { BookOpen, Clock, Sparkles, CheckCircle } from 'lucide-react';
import { AuthoritativeGameState, TheorySubmission } from '../types/game';
import { Player } from '../types/player';
import { Room } from '../types/room';
import { GameService } from '../services/gameService';
import { BackendClient } from '../realtime/backendClient';
import { GameHeader } from '../components/common/GameHeader';
import { DrawingCanvas } from '../components/canvas/DrawingCanvas';
import { InvestigationBoard } from '../components/investigation/InvestigationBoard';
import { FinalTheoryModal } from '../components/accusation/FinalTheoryModal';
import { CinematicReveal } from '../components/reveal/CinematicReveal';
import { ResultsScreen } from '../components/results/ResultsScreen';
import { DEFAULT_EVIDENCE_SKETCHES } from '../utils/defaultSketches';
import { SoundService } from '../services/soundService';

interface GameProps {
  room: Room;
  initialState: AuthoritativeGameState;
  currentUser: Player;
  onExitGame: () => void;
  onReturnToLobby?: () => void;
  onGameStateChange?: (state: AuthoritativeGameState) => void;
}

export const Game: React.FC<GameProps> = ({
  room,
  initialState,
  currentUser,
  onExitGame,
  onReturnToLobby,
  onGameStateChange,
}) => {
  const [gameState, setGameState] = useState<AuthoritativeGameState>(initialState);
  const channel = GameService.getChannel(room.id);
  const backend = BackendClient.getInstance();

  // Authoritative server story selection state
  const [isStorySelection, setIsStorySelection] = useState<boolean>(
    gameState.status === 'STORY_SELECTION' || (gameState.status as string) === 'CASE_INTRO'
  );
  const [storyChooserId, setStoryChooserId] = useState<string | null>(null);
  const [storyChooserName, setStoryChooserName] = useState<string>('');
  const [offeredStories, setOfferedStories] = useState<Array<{ storyId: string; title: string; genre: string; difficulty: string; description: string }>>([]);
  const [selectedStoryBanner, setSelectedStoryBanner] = useState<{ title: string; genre: string; description: string } | null>(null);

  // Authoritative drawer prompt options
  const [drawerPromptOptions, setDrawerPromptOptions] = useState<Array<{ optionIndex: number; previewText: string; difficulty: string }>>([]);
  const [secretDrawObjective, setSecretDrawObjective] = useState<string | null>(null);
  const [secretDrawHint, setSecretDrawHint] = useState<string | null>(null);
  const [publicHint, setPublicHint] = useState<string | null>(null);

  // Authoritative round feedback and transitions
  const [clueSolvedBanner, setClueSolvedBanner] = useState<{ solverName: string; drawerName: string; objective: string; solverPoints: number; drawerPoints: number } | null>(null);
  const [storyRevealData, setStoryRevealData] = useState<{ revealedText: string; solvedCount: number } | null>(null);
  const [nextTurnNotice, setNextTurnNotice] = useState<string | null>(null);
  const [playerStatusNotice, setPlayerStatusNotice] = useState<string | null>(null);


  const updateState = (next: AuthoritativeGameState) => {
    setGameState(next);
    if (onGameStateChange) {
      onGameStateChange(next);
    }
  };

  // Wire BackendClient real-time authoritative events
  useEffect(() => {
    const unsubChooser = backend.on('STORY_CHOOSER_SELECTED', (payload: any) => {
      setIsStorySelection(true);
      setStoryChooserId(payload.chooserPlayerId);
      setStoryChooserName(payload.chooserName);
    });

    const unsubStoryOptions = backend.on('STORY_OPTIONS', (payload: any) => {
      // Sent ONLY to the chooser
      if (payload?.options) {
        setOfferedStories(payload.options);
        setIsStorySelection(true);
      }
    });

    const unsubStorySelected = backend.on('STORY_SELECTED', (payload: any) => {
      SoundService.playDramaticSting();
      setIsStorySelection(false);
      setSelectedStoryBanner(payload);
      setTimeout(() => setSelectedStoryBanner(null), 5000);
      setGameState((prev) => ({
        ...prev,
        status: 'STORY_SELECTION',
        currentCase: {
          id: payload.storyId,
          title: payload.title,
          genre: payload.genre,
          setting: payload.setting || 'Crime Scene',
          description: payload.description,
          characters: payload.characters || [],
          truth: payload.truth || '',
          culprit: payload.culprit || '',
          motive: payload.motive || '',
          timeline: payload.timeline || [],
          evidence: payload.evidence || [],
          clues: payload.clues || [],
          distorterObjective: payload.distorter_objective || 'Mislead investigators regarding the timeline sequence.',
          difficulty: payload.difficulty || 'NORMAL',
        },
      }));
    });

    const unsubTurnStarted = backend.on('TURN_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setClueSolvedBanner(null);
      setStoryRevealData(null);
      setNextTurnNotice(null);
      setIsStorySelection(false);
      setSelectedStoryBanner(null);
      setPlayerStatusNotice(null);
      setPublicHint(null);
      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: payload.turnIndex || 0,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
      }));
    });

    const unsubDrawingStarted = backend.on('DRAWING_STARTED', (payload: any) => {
      SoundService.playTurnStart();
      setClueSolvedBanner(null);
      setStoryRevealData(null);
      setNextTurnNotice(null);
      setSelectedStoryBanner(null);
      setPlayerStatusNotice(null);
      if (payload?.hint) {
        setPublicHint(payload.hint);
      }
      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: payload.turnIndex || 0,
        turnStartedAt: payload.roundStartedAt ? new Date(payload.roundStartedAt).toISOString() : null,
        turnEndsAt: payload.roundEndsAt ? new Date(payload.roundEndsAt).toISOString() : null,
      }));
    });

    const unsubPromptOptions = backend.on('PROMPT_OPTIONS', (payload: any) => {
      // Sent ONLY to active drawer
      if (payload?.options) {
        setDrawerPromptOptions(payload.options);
      }
    });

    const unsubSecretDrawObjective = backend.on('SECRET_DRAW_OBJECTIVE', (payload: any) => {
      // Sent ONLY to active drawer
      setDrawerPromptOptions([]);
      setSecretDrawObjective(payload.objective);
      setSecretDrawHint(payload.hint || null);
    });

    const unsubClueSolved = backend.on('CLUE_SOLVED', (payload: any) => {
      SoundService.playSuccess();
      setClueSolvedBanner({
        solverName: payload.solverName,
        drawerName: payload.drawerName,
        objective: payload.solvedObjective,
        solverPoints: payload.scoreAward?.solverPoints || 150,
        drawerPoints: payload.scoreAward?.drawerPoints || 100,
      });
      setTimeout(() => setClueSolvedBanner(null), 5000);
      if (payload.updatedScores) {
        setGameState((prev) => ({
          ...prev,
          players: prev.players.map((p) => ({
            ...p,
            score: payload.updatedScores[p.id] ?? p.score,
          })),
        }));
      }
    });

    const unsubStoryReveal = backend.on('STORY_REVEAL', (payload: any) => {
      SoundService.playDramaticSting();
      setClueSolvedBanner(null);
      setStoryRevealData({
        revealedText: payload.revealedText,
        solvedCount: payload.solvedCount,
      });
      setTimeout(() => setStoryRevealData(null), 7000);
    });

    const unsubNextTurn = backend.on('NEXT_TURN', (_payload: any) => {
      SoundService.playTurnStart();
      setStoryRevealData(null);
      setClueSolvedBanner(null);
      setSelectedStoryBanner(null);
      setPlayerStatusNotice(null);
      setNextTurnNotice(`Round over! Next player's turn to draw...`);
      setTimeout(() => setNextTurnNotice(null), 3000);
    });

    const unsubPlayerLeft = backend.on('PLAYER_LEFT', (payload: any) => {
      if (!payload?.playerId) return;
      const player = gameState.players.find((p) => p.id === payload.playerId);
      setPlayerStatusNotice(`${player?.nickname || 'A player'} left the game.`);
      setTimeout(() => setPlayerStatusNotice(null), 3500);
      setGameState((prev) => ({
        ...prev,
        players: prev.players.map((p) => p.id === payload.playerId ? { ...p, isOnline: false } : p),
      }));
    });

    const unsubPlayerReconnected = backend.on('PLAYER_RECONNECTED', (payload: any) => {
      setPlayerStatusNotice(`${payload?.displayName || 'A player'} came back!`);
      setTimeout(() => setPlayerStatusNotice(null), 3500);
      setGameState((prev) => ({
        ...prev,
        ...(payload?.gameState
          ? {
              status:
                payload.gameState.state === 'DRAWING' || payload.gameState.state === 'PROMPT_SELECTION'
                  ? 'PLAYER_DRAWING'
                  : payload.gameState.state === 'FINAL_INVESTIGATION'
                  ? 'FINAL_THEORY'
                  : prev.status,
              currentTurnPlayerId: payload.gameState.currentDrawerId,
              turnIndex: payload.gameState.turnIndex,
              turnStartedAt: payload.gameState.roundStartedAt ? new Date(payload.gameState.roundStartedAt).toISOString() : null,
              turnEndsAt: payload.gameState.roundEndsAt ? new Date(payload.gameState.roundEndsAt).toISOString() : null,
            }
          : {}),
        players: payload?.gameState
          ? payload.gameState.players.map((p: any) => ({
              id: p.playerId,
              nickname: p.displayName,
              avatar: p.avatar,
              isHost: p.isHost,
              isReady: p.isReady,
              score: p.score || 0,
              isOnline: p.isConnected !== false,
              joinedAt: new Date(p.joinedAt || Date.now()).toISOString(),
              lastSeenAt: new Date().toISOString(),
            }))
          : prev.players.map((p) => p.id === payload?.playerId ? { ...p, isOnline: true } : p),
      }));
      if (payload?.drawerPrivateState?.selectedObjective) {
        setSecretDrawObjective(payload.drawerPrivateState.selectedObjective);
      }
      if (payload?.drawerPrivateState?.hint) {
        setSecretDrawHint(payload.drawerPrivateState.hint);
      }
      if (payload?.gameState?.hint) {
        setPublicHint(payload.gameState.hint);
      }
      if (payload?.drawerPrivateState?.options) {
        setDrawerPromptOptions(payload.drawerPrivateState.options);
      }
    });

    const unsubFinalInvestigation = backend.on('FINAL_INVESTIGATION', () => {
      SoundService.playDramaticSting();
      setGameState((prev) => ({ ...prev, status: 'FINAL_THEORY' }));
    });

    const unsubGameEnd = backend.on('GAME_END', (_payload: any) => {
      SoundService.playSuccess();
      setGameState((prev) => ({ ...prev, status: 'RESULTS' }));
    });


    return () => {
      unsubChooser();
      unsubStoryOptions();
      unsubStorySelected();
      unsubTurnStarted();
      unsubDrawingStarted();
      unsubPromptOptions();
      unsubSecretDrawObjective();
      unsubClueSolved();
      unsubStoryReveal();
      unsubNextTurn();
      unsubPlayerLeft();
      unsubPlayerReconnected();
      unsubFinalInvestigation();
      unsubGameEnd();
    };
  }, [backend, gameState.players]);


  // Automated Bot Turn execution: if a bot's turn is active, host executes their turn
  const isHost = currentUser.id === room.hostId || currentUser.isHost;
  useEffect(() => {
    if (gameState.status !== 'PLAYER_DRAWING') return;
    if (!isHost) return;

    const currentTurnPlayer = gameState.players.find(
      (p) => p.id === gameState.currentTurnPlayerId
    );
    if (!currentTurnPlayer || !currentTurnPlayer.id.startsWith('bot-')) return;

    const timer = setTimeout(() => {
      const sketchItem =
        DEFAULT_EVIDENCE_SKETCHES[gameState.turnIndex % DEFAULT_EVIDENCE_SKETCHES.length];
      const updated = GameService.submitDrawing(
        gameState,
        currentTurnPlayer.id,
        sketchItem.sketch
      );
      setGameState(updated);
    }, 2500);

    return () => clearTimeout(timer);
  }, [gameState.status, gameState.currentTurnPlayerId, isHost, gameState]);

  // Periodic poll fallback to ensure multi-tab consistency
  useEffect(() => {
    const interval = setInterval(() => {
      const freshState = GameService.getGameState(room.id);
      if (freshState && freshState.sequenceNumber > gameState.sequenceNumber) {
        setGameState(freshState);
      }
    }, 1000);
    return () => clearInterval(interval);
  }, [gameState.sequenceNumber, room.id]);

  // Retrieve current player's secret clue (RLS-guarded logic)
  const secretClue = GameService.getPlayerClue(gameState.id, currentUser.id, gameState.status);

  // --- Actions ---

  const handleSubmitDrawing = (_previewDataUrl: string) => {
    // The backend owns turn progression. Never advance a local-only game state here.
    backend.endDrawing();
  };

  const handleSlotTimelineEvidence = (slotTime: string, evidenceId: string | null) => {
    const updated = GameService.updateTimeline(gameState, slotTime, evidenceId, currentUser.id);
    updateState(updated);
  };

  const handleAddConnection = (fromId: string, toId: string, label: string) => {
    const updated = GameService.addEvidenceConnection(gameState, fromId, toId, label, currentUser.id);
    updateState(updated);
  };

  const handleProceedToTheory = () => {
    const updated = GameService.goToFinalTheory(gameState);
    updateState(updated);
  };

  const handleSubmitTheory = (theory: TheorySubmission) => {
    const updated = GameService.submitTheory(gameState, theory);
    updateState(updated);
  };

  const handleLockAccusations = () => {
    const updated = GameService.lockAccusationsAndReveal(gameState);
    updateState(updated);
  };

  const handleProceedToResults = () => {
    const updated = GameService.goToResults(gameState);
    updateState(updated);
  };

  const handleReturnToLobby = () => {
    const updated = GameService.returnToLobby(gameState);
    updateState(updated);
    if (onReturnToLobby) {
      onReturnToLobby();
    } else {
      onExitGame();
    }
  };

  const handleChooseStory = (storyId: string) => {
    backend.chooseStory(storyId);
    setIsStorySelection(false);
  };

  const handleSelectPrompt = (optionIndex: number) => {
    backend.selectPrompt(optionIndex);
    setDrawerPromptOptions([]);
  };

  return (

    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-30 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* SELECTED STORY BROADCAST BANNER */}
      {selectedStoryBanner && (
        <div
          onClick={() => setSelectedStoryBanner(null)}
          className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-slate-900/95 border border-amber-500 text-white px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md cursor-pointer hover:bg-slate-800 transition-all"
        >
          <Sparkles className="w-5 h-5 text-amber-400 shrink-0" />
          <div className="text-left">
            <div className="text-[10px] font-mono uppercase text-amber-400 tracking-wider">Case Selected</div>
            <div className="text-sm font-bold font-serif">{selectedStoryBanner.title} ({selectedStoryBanner.genre})</div>
          </div>
          <button
            onClick={(e) => {
              e.stopPropagation();
              setSelectedStoryBanner(null);
            }}
            className="text-amber-400 hover:text-white font-bold ml-2 text-base shrink-0 leading-none"
            title="Dismiss"
          >
            ×
          </button>
        </div>
      )}

      {/* CLUE SOLVED SUCCESS BANNER */}
      {clueSolvedBanner && (
        <div
          onClick={() => setClueSolvedBanner(null)}
          className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-emerald-950/95 border border-emerald-500 text-emerald-100 px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md cursor-pointer hover:bg-emerald-900/95 transition-all"
        >
          <CheckCircle className="w-6 h-6 text-emerald-400 shrink-0" />
          <div className="text-left">
            <div className="text-xs font-bold text-white">
              {clueSolvedBanner.solverName} solved the clue: "{clueSolvedBanner.objective}"!
            </div>
            <div className="text-[11px] font-mono text-emerald-300">
              +{clueSolvedBanner.solverPoints} pts to {clueSolvedBanner.solverName} • +{clueSolvedBanner.drawerPoints} pts to {clueSolvedBanner.drawerName} (Drawer)
            </div>
          </div>
          <button
            onClick={(e) => {
              e.stopPropagation();
              setClueSolvedBanner(null);
            }}
            className="text-emerald-400 hover:text-white font-bold text-base ml-2 shrink-0 leading-none"
            title="Dismiss"
          >
            ×
          </button>
        </div>
      )}

      {/* STORY REVEAL OVERLAY */}
      {storyRevealData && (
        <div className="fixed inset-0 z-40 bg-black/80 backdrop-blur-md flex items-center justify-center p-4">
          <div className="max-w-2xl w-full bg-[#0e131f] border border-amber-500/60 rounded-3xl p-6 sm:p-8 shadow-2xl relative overflow-hidden animate-fadeIn text-center space-y-4">
            <button
              onClick={() => setStoryRevealData(null)}
              className="absolute top-4 right-4 text-slate-400 hover:text-white text-lg font-bold w-8 h-8 rounded-full bg-slate-800/80 flex items-center justify-center border border-slate-700 transition-colors"
              title="Close"
            >
              ×
            </button>
            <div className="text-xs font-mono uppercase text-amber-400 tracking-widest font-bold">
              Investigation Discovery #{storyRevealData.solvedCount}
            </div>
            <h2 className="text-xl sm:text-2xl font-serif font-black text-white">
              Story Reveal
            </h2>
            <div className="p-5 bg-slate-950/80 border border-slate-800 rounded-2xl font-serif text-sm sm:text-base text-slate-200 leading-relaxed italic">
              "{storyRevealData.revealedText}"
            </div>
            <div className="flex items-center justify-center gap-4 pt-2">
              <span className="text-xs font-mono text-slate-400">
                Advancing to next investigator...
              </span>
              <button
                onClick={() => setStoryRevealData(null)}
                className="px-3 py-1 bg-amber-500/20 hover:bg-amber-500/30 border border-amber-500/40 text-amber-300 text-xs font-mono rounded-lg transition-colors"
              >
                Dismiss (×)
              </button>
            </div>
          </div>
        </div>
      )}

      {/* NEXT TURN TRANSITION NOTICE */}
      {nextTurnNotice && (
        <div
          onClick={() => setNextTurnNotice(null)}
          className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-slate-900/95 border border-sky-500 text-sky-100 px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md cursor-pointer hover:bg-slate-800 transition-all"
        >
          <Clock className="w-5 h-5 text-sky-400 animate-spin" />
          <span className="text-xs font-mono font-bold uppercase">{nextTurnNotice}</span>
          <button
            onClick={(e) => {
              e.stopPropagation();
              setNextTurnNotice(null);
            }}
            className="text-sky-400 hover:text-white font-bold ml-1 text-sm leading-none"
          >
            ×
          </button>
        </div>
      )}

      {playerStatusNotice && (
        <div
          onClick={() => setPlayerStatusNotice(null)}
          className="fixed top-24 left-1/2 -translate-x-1/2 z-50 bg-slate-900/95 border border-amber-500 text-amber-100 px-5 py-2.5 rounded-full shadow-2xl text-xs font-mono flex items-center gap-3 cursor-pointer hover:bg-slate-800 transition-all backdrop-blur-md"
        >
          <span>{playerStatusNotice}</span>
          <button
            onClick={(e) => {
              e.stopPropagation();
              setPlayerStatusNotice(null);
            }}
            className="text-amber-400 hover:text-white font-bold text-sm leading-none"
            title="Dismiss"
          >
            ×
          </button>
        </div>
      )}

      {/* DRAWER SECRET PROMPT SELECTION OVERLAY */}
      {drawerPromptOptions.length > 0 && gameState.currentTurnPlayerId === currentUser.id && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4">
          <div className="max-w-3xl w-full bg-[#0e131f] border border-red-600/80 rounded-3xl p-6 sm:p-8 shadow-2xl text-center animate-fadeIn relative">
            <button
              onClick={() => {
                if (drawerPromptOptions.length > 0) handleSelectPrompt(0);
                setDrawerPromptOptions([]);
              }}
              className="absolute top-4 right-4 text-xs font-mono text-slate-400 hover:text-white px-3 py-1 rounded-lg bg-slate-800/80 border border-slate-700 transition-colors"
              title="Pick default clue and begin"
            >
              Auto-Pick Clue
            </button>
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-red-500/10 border border-red-500/30 text-red-400 font-mono text-xs uppercase tracking-widest font-bold mb-2">
              <Sparkles className="w-3.5 h-3.5" /> SECRET MISSION
            </div>
            <h2 className="text-xl sm:text-3xl font-black font-serif text-white mb-2">
              Pick Your Secret Clue
            </h2>
            <p className="text-xs sm:text-sm text-slate-400 mb-6 max-w-md mx-auto">
              Only you see these cards! Pick one clue to sketch for the room.
            </p>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-left">
              {drawerPromptOptions.map((opt) => (
                <div
                  key={opt.optionIndex}
                  onMouseEnter={() => SoundService.playCardFlip()}
                  onClick={() => {
                    SoundService.playStamp();
                    handleSelectPrompt(opt.optionIndex);
                  }}
                  className="game-card p-5 cursor-pointer flex flex-col justify-between border-slate-700/80 hover:border-red-500 group"
                >
                  <div className="space-y-3">
                    <div className="flex items-center justify-between border-b border-slate-800 pb-2">
                      <span className="text-[10px] font-mono text-amber-400 font-bold uppercase tracking-wider">
                        CARD #{String.fromCharCode(65 + opt.optionIndex)}
                      </span>
                      <span className="px-2 py-0.5 rounded text-[9px] font-mono font-bold bg-slate-800 text-slate-300 border border-slate-700">
                        {opt.difficulty}
                      </span>
                    </div>

                    <div className="text-sm font-bold text-white group-hover:text-red-300 transition-colors font-serif leading-snug">
                      "{opt.previewText}"
                    </div>
                  </div>

                  <button className="mt-5 w-full py-2.5 rounded-xl game-btn-red text-white text-xs font-bold uppercase tracking-wider">
                    Draw This Clue
                  </button>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* 1. DYNAMIC STORY SELECTION & CASE DOSSIER PHASE */}
      {(gameState.status === 'STORY_SELECTION' || (gameState.status as string) === 'CASE_INTRO' || (gameState.status as string) === 'COUNTDOWN' || isStorySelection || selectedStoryBanner) && gameState.status !== 'PLAYER_DRAWING' && gameState.status !== 'FINAL_THEORY' && gameState.status !== 'RESULTS' && (
        <div className="relative z-10 flex flex-col min-h-screen justify-between">
          <GameHeader
            currentUser={currentUser}
            roomCode={room.code}
            playerCount={gameState.players.length}
            maxPlayers={8}
            currentPhase="STORY_SELECTION"
            caseTitle={selectedStoryBanner ? selectedStoryBanner.title : (gameState.currentCase?.title && gameState.currentCase.title !== 'The Midnight Museum Heist' ? gameState.currentCase.title : 'Mystery Case Selection')}
            roundText="Story Selection"
            onLeaveRoom={onExitGame}
          />

          <main className="flex-1 max-w-5xl mx-auto px-4 py-8 flex items-center justify-center w-full">
            {selectedStoryBanner ? (
              /* GRAND CASE BRIEFING (After Story is Picked) */
              <div className="w-full bg-[#0e131f]/95 border border-amber-500/60 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6">
                <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-amber-500/10 border border-amber-500/30 text-amber-400 font-mono text-xs uppercase tracking-widest font-bold">
                  <Sparkles className="w-4 h-4" /> Mystery Chosen!
                </div>

                <h1 className="text-3xl sm:text-5xl font-black text-white font-serif tracking-wide">
                  {selectedStoryBanner.title}
                </h1>

                <div className="flex items-center justify-center gap-4 text-xs font-mono text-slate-400">
                  <span className="px-3 py-1 bg-slate-800/80 rounded-lg text-amber-300 font-bold uppercase">
                    {selectedStoryBanner.genre}
                  </span>
                  <span>•</span>
                  <span className="text-slate-300">Mystery Case</span>
                </div>

                <div className="max-w-3xl mx-auto p-6 bg-slate-950/80 border border-slate-800 rounded-2xl font-serif text-base sm:text-lg text-slate-200 leading-relaxed italic text-left">
                  "{selectedStoryBanner.description}"
                </div>

                <div className="pt-4 flex flex-col sm:flex-row items-center justify-center gap-3 text-xs font-mono text-slate-400">
                  <div className="flex items-center gap-2">
                    <Clock className="w-4 h-4 text-red-500 animate-spin" />
                    <span>Getting clues ready for the drawing round...</span>
                  </div>
                  <button
                    onClick={() => setSelectedStoryBanner(null)}
                    className="px-4 py-1.5 rounded-lg bg-amber-500/20 hover:bg-amber-500/30 text-amber-300 border border-amber-500/40 text-xs font-bold font-mono transition-colors"
                  >
                    Ready / Dismiss (×)
                  </button>
                </div>
              </div>
            ) : currentUser.id === storyChooserId || (storyChooserId === null && offeredStories.length > 0) ? (
              /* STORY CHOOSER VIEW: 3 DYNAMIC OPTIONS */
              <div className="w-full bg-[#0e131f]/95 border border-slate-700/80 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn space-y-6">
                <div className="text-center space-y-2">
                  <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-red-500/10 border border-red-500/30 text-red-400 font-mono text-xs uppercase tracking-widest font-bold">
                    <BookOpen className="w-4 h-4" /> Your Turn to Pick the Story
                  </div>
                  <h1 className="text-2xl sm:text-4xl font-black text-white font-serif tracking-wide">
                    Pick a Mystery Story
                  </h1>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-xl mx-auto">
                    You get to pick the mystery! Choose any story below for your group to solve.
                  </p>
                </div>

                {offeredStories.length > 0 ? (
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-5 pt-2">
                    {offeredStories.map((st) => (
                      <div
                        key={st.storyId}
                        onMouseEnter={() => SoundService.playCardFlip()}
                        onClick={() => {
                          SoundService.playStamp();
                          handleChooseStory(st.storyId);
                        }}
                        className="game-card p-6 border-slate-700/80 hover:border-red-500 cursor-pointer group flex flex-col justify-between"
                      >
                        <div className="space-y-3">
                          <div className="flex items-center justify-between border-b border-slate-800 pb-2">
                            <span className="text-[10px] font-mono font-bold uppercase tracking-wider px-2 py-0.5 rounded-full bg-amber-500/15 text-amber-400 border border-amber-500/30">
                              {st.genre}
                            </span>
                            <span className="text-[10px] font-mono text-slate-400 uppercase">
                              {st.difficulty}
                            </span>
                          </div>

                          <h3 className="text-lg font-bold text-white font-serif group-hover:text-red-400 transition-colors leading-snug">
                            {st.title}
                          </h3>

                          <p className="text-xs text-slate-300 line-clamp-5 leading-relaxed font-serif">
                            "{st.description}"
                          </p>
                        </div>

                        <button className="mt-6 w-full py-3 game-btn-red text-white rounded-xl text-xs font-bold uppercase tracking-wider">
                          Play This Story →
                        </button>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="py-16 text-center space-y-4">
                    <div className="w-10 h-10 border-4 border-red-500 border-t-transparent rounded-full animate-spin mx-auto" />
                    <div className="text-sm font-mono text-slate-400">
                      Loading stories...
                    </div>
                  </div>
                )}
              </div>
            ) : (
              /* WAITING FOR CHOOSER SCREEN */
              <div className="w-full max-w-2xl bg-[#0e131f]/95 border border-slate-700/80 rounded-3xl p-8 sm:p-12 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6">
                <div className="relative w-16 h-16 mx-auto flex items-center justify-center">
                  <div className="absolute inset-0 rounded-full bg-red-500/20 animate-ping" />
                  <div className="w-14 h-14 rounded-full bg-slate-900 border border-red-500/50 flex items-center justify-center text-red-400">
                    <BookOpen className="w-6 h-6 animate-pulse" />
                  </div>
                </div>

                <div className="space-y-2">
                  <span className="text-xs font-mono uppercase tracking-widest text-red-400 font-bold">
                    PICKING A STORY
                  </span>
                  <h2 className="text-2xl sm:text-3xl font-black font-serif text-white">
                    {storyChooserName ? `${storyChooserName} is choosing the story...` : 'Picking who chooses...'}
                  </h2>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-md mx-auto leading-relaxed">
                    Your teammate is choosing a story to play. Get ready to draw and guess!
                  </p>
                </div>

                <div className="p-4 rounded-xl bg-slate-950/70 border border-slate-800 text-xs text-slate-400 font-mono flex items-center justify-center gap-2">
                  <Clock className="w-4 h-4 text-amber-400" />
                  <span>The drawing round starts right after!</span>
                </div>
              </div>
            )}
          </main>

          <footer className="relative z-10 w-full max-w-4xl mx-auto px-4 py-3 text-center text-xs font-mono text-slate-500">
            INKBOUND • Draw, Guess & Solve
          </footer>
        </div>
      )}

      {/* 2. SERIAL DRAWING PHASE */}
      {gameState.status === 'PLAYER_DRAWING' && (
        <DrawingCanvas
          gameState={gameState}
          currentUser={currentUser}
          secretClue={secretClue}
          secretDrawObjective={secretDrawObjective}
          secretDrawHint={secretDrawHint}
          publicHint={publicHint || secretDrawHint}
          roomCode={room.code}
          channel={channel}
          onSubmitDrawing={handleSubmitDrawing}
          onLeaveRoom={onExitGame}
        />
      )}


      {/* 3. INVESTIGATION BOARD & TIMELINE */}
      {gameState.status === 'INVESTIGATION' && (
        <InvestigationBoard
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          channel={channel}
          onSlotTimelineEvidence={handleSlotTimelineEvidence}
          onAddConnection={handleAddConnection}
          onProceedToTheory={handleProceedToTheory}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 4. FINAL THEORY & ACCUSATION */}
      {gameState.status === 'FINAL_THEORY' && (
        <FinalTheoryModal
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onSubmitTheory={handleSubmitTheory}
          onLockAccusations={handleLockAccusations}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 5. CINEMATIC TRUTH REVEAL */}
      {gameState.status === 'TRUTH_REVEAL' && (
        <CinematicReveal
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onProceedToResults={handleProceedToResults}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 6. FINAL RESULTS & SCOREBOARD */}
      {gameState.status === 'RESULTS' && (
        <ResultsScreen
          gameState={gameState}
          currentUser={currentUser}
          roomCode={room.code}
          onReturnToLobby={handleReturnToLobby}
          onLeaveRoom={onExitGame}
        />
      )}

      {/* 7. FALLBACK RECOVERY SCREEN IF NO PHASE MATCHED */}
      {gameState.status !== 'PLAYER_DRAWING' &&
        gameState.status !== 'INVESTIGATION' &&
        gameState.status !== 'FINAL_THEORY' &&
        gameState.status !== 'TRUTH_REVEAL' &&
        gameState.status !== 'RESULTS' &&
        gameState.status !== 'STORY_SELECTION' &&
        (gameState.status as string) !== 'CASE_INTRO' &&
        (gameState.status as string) !== 'COUNTDOWN' &&
        !isStorySelection &&
        !selectedStoryBanner && (
          <div className="relative z-10 flex flex-col min-h-screen justify-center items-center py-12 px-4 text-center font-mono">
            <div className="w-14 h-14 rounded-full border-4 border-amber-600/40 border-t-amber-400 animate-spin mb-4" />
            <h2 className="text-xl font-serif font-bold text-amber-300">GAME IN PROGRESS</h2>
            <p className="text-xs text-slate-400 mt-2">Connecting and loading game state...</p>
            <button
              onClick={handleReturnToLobby}
              className="mt-6 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg text-xs"
            >
              Return to Lobby
            </button>
          </div>
        )}
    </div>
  );
};
