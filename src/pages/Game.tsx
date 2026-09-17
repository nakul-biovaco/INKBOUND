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

  // Authoritative round feedback and transitions
  const [clueSolvedBanner, setClueSolvedBanner] = useState<{ solverName: string; drawerName: string; objective: string; solverPoints: number; drawerPoints: number } | null>(null);
  const [storyRevealData, setStoryRevealData] = useState<{ revealedText: string; solvedCount: number } | null>(null);
  const [nextTurnNotice, setNextTurnNotice] = useState<string | null>(null);


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
      setIsStorySelection(false);
      setSelectedStoryBanner(payload);
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
      setClueSolvedBanner(null);
      setStoryRevealData(null);
      setNextTurnNotice(null);
      setIsStorySelection(false);
      setSelectedStoryBanner(null);
      setGameState((prev) => ({
        ...prev,
        status: 'PLAYER_DRAWING',
        currentTurnPlayerId: payload.drawerPlayerId,
        turnIndex: payload.turnIndex || 0,
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
    });

    const unsubClueSolved = backend.on('CLUE_SOLVED', (payload: any) => {
      setClueSolvedBanner({
        solverName: payload.solverName,
        drawerName: payload.drawerName,
        objective: payload.solvedObjective,
        solverPoints: payload.scoreAward?.solverPoints || 150,
        drawerPoints: payload.scoreAward?.drawerPoints || 100,
      });
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
      setClueSolvedBanner(null);
      setStoryRevealData({
        revealedText: payload.revealedText,
        solvedCount: payload.solvedCount,
      });
    });

    const unsubNextTurn = backend.on('NEXT_TURN', (_payload: any) => {
      setStoryRevealData(null);
      setNextTurnNotice(`Turn Complete! Next investigator takes the easel...`);
      setTimeout(() => setNextTurnNotice(null), 3000);
    });

    const unsubFinalInvestigation = backend.on('FINAL_INVESTIGATION', () => {
      setGameState((prev) => ({ ...prev, status: 'FINAL_THEORY' }));
    });

    const unsubGameEnd = backend.on('GAME_END', (_payload: any) => {
      setGameState((prev) => ({ ...prev, status: 'RESULTS' }));
    });


    return () => {
      unsubChooser();
      unsubStoryOptions();
      unsubStorySelected();
      unsubTurnStarted();
      unsubPromptOptions();
      unsubSecretDrawObjective();
      unsubClueSolved();
      unsubStoryReveal();
      unsubNextTurn();
      unsubFinalInvestigation();
      unsubGameEnd();
    };
  }, [backend]);


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

  const handleSubmitDrawing = (previewDataUrl: string) => {
    const updated = GameService.submitDrawing(gameState, currentUser.id, previewDataUrl);
    updateState(updated);
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
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-slate-900/95 border border-amber-500 text-white px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md">
          <Sparkles className="w-5 h-5 text-amber-400" />
          <div className="text-left">
            <div className="text-[10px] font-mono uppercase text-amber-400 tracking-wider">Case Selected</div>
            <div className="text-sm font-bold font-serif">{selectedStoryBanner.title} ({selectedStoryBanner.genre})</div>
          </div>
        </div>
      )}

      {/* CLUE SOLVED SUCCESS BANNER */}
      {clueSolvedBanner && (
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-emerald-950/95 border border-emerald-500 text-emerald-100 px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md">
          <CheckCircle className="w-6 h-6 text-emerald-400" />
          <div className="text-left">
            <div className="text-xs font-bold text-white">
              {clueSolvedBanner.solverName} solved the clue: "{clueSolvedBanner.objective}"!
            </div>
            <div className="text-[11px] font-mono text-emerald-300">
              +{clueSolvedBanner.solverPoints} pts to {clueSolvedBanner.solverName} • +{clueSolvedBanner.drawerPoints} pts to {clueSolvedBanner.drawerName} (Drawer)
            </div>
          </div>
        </div>
      )}

      {/* STORY REVEAL OVERLAY */}
      {storyRevealData && (
        <div className="fixed inset-0 z-40 bg-black/80 backdrop-blur-md flex items-center justify-center p-4">
          <div className="max-w-2xl w-full bg-[#0e131f] border border-amber-500/60 rounded-3xl p-6 sm:p-8 shadow-2xl relative overflow-hidden animate-fadeIn text-center space-y-4">
            <div className="text-xs font-mono uppercase text-amber-400 tracking-widest font-bold">
              Investigation Discovery #{storyRevealData.solvedCount}
            </div>
            <h2 className="text-xl sm:text-2xl font-serif font-black text-white">
              Story Reveal
            </h2>
            <div className="p-5 bg-slate-950/80 border border-slate-800 rounded-2xl font-serif text-sm sm:text-base text-slate-200 leading-relaxed italic">
              "{storyRevealData.revealedText}"
            </div>
            <div className="text-xs font-mono text-slate-400">
              Advancing to next investigator in 8 seconds...
            </div>
          </div>
        </div>
      )}

      {/* NEXT TURN TRANSITION NOTICE */}
      {nextTurnNotice && (
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-40 bg-slate-900/95 border border-sky-500 text-sky-100 px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 animate-fadeIn backdrop-blur-md">
          <Clock className="w-5 h-5 text-sky-400 animate-spin" />
          <span className="text-xs font-mono font-bold uppercase">{nextTurnNotice}</span>
        </div>
      )}

      {/* DRAWER SECRET PROMPT SELECTION OVERLAY */}
      {drawerPromptOptions.length > 0 && gameState.currentTurnPlayerId === currentUser.id && (
        <div className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4">
          <div className="max-w-2xl w-full bg-[#0e131f] border border-red-600/80 rounded-3xl p-6 sm:p-8 shadow-2xl text-center animate-fadeIn">
            <div className="text-xs font-mono uppercase text-red-400 font-bold tracking-widest mb-1">
              Secret Drawer Mission
            </div>
            <h2 className="text-xl sm:text-2xl font-black font-serif text-white mb-2">
              Select What You Will Draw
            </h2>
            <p className="text-xs text-slate-400 mb-6">
              Only you see these options. Choose one secret event to sketch for the other detectives.
            </p>

            <div className="space-y-3 text-left">
              {drawerPromptOptions.map((opt) => (
                <div
                  key={opt.optionIndex}
                  onClick={() => handleSelectPrompt(opt.optionIndex)}
                  className="p-4 rounded-2xl bg-slate-900/90 hover:bg-slate-800 border border-slate-700 hover:border-red-500 cursor-pointer transition-all flex items-center justify-between group"
                >
                  <div>
                    <span className="text-[10px] font-mono text-amber-400 font-bold uppercase">
                      Option {String.fromCharCode(65 + opt.optionIndex)} • {opt.difficulty}
                    </span>
                    <div className="text-sm font-bold text-white group-hover:text-red-400 transition-colors font-serif mt-0.5">
                      "{opt.previewText}"
                    </div>
                  </div>
                  <button className="px-4 py-2 bg-red-600/80 group-hover:bg-red-600 text-white rounded-xl text-xs font-bold uppercase">
                    Choose
                  </button>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* 1. DYNAMIC STORY SELECTION & CASE DOSSIER PHASE */}
      {(gameState.status === 'STORY_SELECTION' || (gameState.status as string) === 'CASE_INTRO' || (gameState.status as string) === 'COUNTDOWN' || isStorySelection || selectedStoryBanner) && gameState.status !== 'PLAYER_DRAWING' && (
        <div className="relative z-10 flex flex-col min-h-screen justify-between">
          <GameHeader
            currentUser={currentUser}
            roomCode={room.code}
            playerCount={gameState.players.length}
            maxPlayers={8}
            currentPhase="STORY_SELECTION"
            caseTitle={selectedStoryBanner ? selectedStoryBanner.title : (gameState.currentCase?.title && gameState.currentCase.title !== 'The Midnight Museum Heist' ? gameState.currentCase.title : 'Mystery Case Selection')}
            roundText="Case Dossier"
            onLeaveRoom={onExitGame}
          />

          <main className="flex-1 max-w-5xl mx-auto px-4 py-8 flex items-center justify-center w-full">
            {selectedStoryBanner ? (
              /* GRAND CASE BRIEFING (After Story is Picked) */
              <div className="w-full bg-[#0e131f]/95 border border-amber-500/60 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn text-center space-y-6">
                <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-amber-500/10 border border-amber-500/30 text-amber-400 font-mono text-xs uppercase tracking-widest font-bold">
                  <Sparkles className="w-4 h-4" /> Official Mystery Selected
                </div>

                <h1 className="text-3xl sm:text-5xl font-black text-white font-serif tracking-wide">
                  {selectedStoryBanner.title}
                </h1>

                <div className="flex items-center justify-center gap-4 text-xs font-mono text-slate-400">
                  <span className="px-3 py-1 bg-slate-800/80 rounded-lg text-amber-300 font-bold uppercase">
                    {selectedStoryBanner.genre}
                  </span>
                  <span>•</span>
                  <span className="text-slate-300">Classified Crime File</span>
                </div>

                <div className="max-w-3xl mx-auto p-6 bg-slate-950/80 border border-slate-800 rounded-2xl font-serif text-base sm:text-lg text-slate-200 leading-relaxed italic text-left">
                  "{selectedStoryBanner.description}"
                </div>

                <div className="pt-4 flex items-center justify-center gap-3 text-xs font-mono text-slate-400">
                  <Clock className="w-4 h-4 text-red-500 animate-spin" />
                  <span>Preparing investigator easels & secret prompts...</span>
                </div>
              </div>
            ) : currentUser.id === storyChooserId || (storyChooserId === null && offeredStories.length > 0) ? (
              /* STORY CHOOSER VIEW: 3 DYNAMIC OPTIONS */
              <div className="w-full bg-[#0e131f]/95 border border-slate-700/80 rounded-3xl p-6 sm:p-10 shadow-2xl relative overflow-hidden backdrop-blur-md animate-fadeIn space-y-6">
                <div className="text-center space-y-2">
                  <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-red-500/10 border border-red-500/30 text-red-400 font-mono text-xs uppercase tracking-widest font-bold">
                    <BookOpen className="w-4 h-4" /> Lead Investigator Selection
                  </div>
                  <h1 className="text-2xl sm:text-4xl font-black text-white font-serif tracking-wide">
                    Choose The Mystery Case
                  </h1>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-xl mx-auto">
                    You have been selected to establish the incident file. Choose which randomized mystery scenario your team will uncover.
                  </p>
                </div>

                {offeredStories.length > 0 ? (
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-5 pt-2">
                    {offeredStories.map((st) => (
                      <div
                        key={st.storyId}
                        onClick={() => handleChooseStory(st.storyId)}
                        className="p-6 rounded-2xl bg-gradient-to-b from-slate-900/95 to-slate-950/95 hover:from-slate-800 hover:to-slate-900 border border-slate-700/80 hover:border-red-500 transition-all cursor-pointer transform hover:-translate-y-1.5 shadow-xl hover:shadow-[0_8px_30px_rgba(239,68,68,0.25)] group flex flex-col justify-between"
                      >
                        <div className="space-y-3">
                          <div className="flex items-center justify-between">
                            <span className="text-[10px] font-mono font-bold uppercase tracking-wider px-2.5 py-0.5 rounded-full bg-amber-500/15 text-amber-400 border border-amber-500/30">
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

                        <button className="mt-6 w-full py-2.5 bg-gradient-to-r from-red-600 to-red-700 hover:from-red-500 hover:to-red-600 text-white rounded-xl text-xs font-bold uppercase tracking-wider shadow-md group-hover:shadow-[0_0_15px_rgba(239,68,68,0.5)] transition-all">
                          Investigate This Case
                        </button>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="py-16 text-center space-y-4">
                    <div className="w-10 h-10 border-4 border-red-500 border-t-transparent rounded-full animate-spin mx-auto" />
                    <div className="text-sm font-mono text-slate-400">
                      Decrypting classified case files from archive...
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
                    CASE ASSIGNMENT IN PROGRESS
                  </span>
                  <h2 className="text-2xl sm:text-3xl font-black font-serif text-white">
                    {storyChooserName ? `${storyChooserName} is choosing the story...` : 'Selecting lead investigator...'}
                  </h2>
                  <p className="text-xs sm:text-sm text-slate-400 max-w-md mx-auto leading-relaxed">
                    Three classified mystery scenarios have been presented to the lead investigator. Stand by while the incident dossier is selected.
                  </p>
                </div>

                <div className="p-4 rounded-xl bg-slate-950/70 border border-slate-800 text-xs text-slate-400 font-mono flex items-center justify-center gap-2">
                  <Clock className="w-4 h-4 text-amber-400" />
                  <span>Drawing turns and clue distribution will begin immediately after.</span>
                </div>
              </div>
            )}
          </main>

          <footer className="relative z-10 w-full max-w-4xl mx-auto px-4 py-3 text-center text-xs font-mono text-slate-500">
            INKBOUND • Real-Time Multiplayer Investigation
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
            <h2 className="text-xl font-serif font-bold text-amber-300">INVESTIGATION IN PROGRESS</h2>
            <p className="text-xs text-slate-400 mt-2">Synchronizing case dossier and easel canvas...</p>
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
