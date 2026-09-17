import React, { useRef, useState, useEffect } from 'react';
import {
  Pencil,
  Square,
  Circle as CircleIcon,
  Type,
  Eraser,
  RotateCcw,
  RotateCw,
  Trash2,
  Send,
  Lightbulb,
  Crosshair,
  Eye,
  Radio,
  Users,
} from 'lucide-react';
import {
  AuthoritativeGameState,
  DrawingTool,
  PlayerSecretClue,
  Point,
  Stroke,
} from '../../types/game';
import { Player } from '../../types/player';
import { DrawingService } from '../../services/drawingService';
import { TurnManager } from '../../game/TurnManager';
import { RoomChannelManager } from '../../realtime/roomChannel';
import { StrokeBroadcastPayload } from '../../types/events';
import { GameHeader } from '../common/GameHeader';
import { RoomChat } from '../common/RoomChat';
import { AvatarBadge } from '../common/AvatarBadge';

import { BackendClient } from '../../realtime/backendClient';

interface DrawingCanvasProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  secretClue: PlayerSecretClue | null;
  secretDrawObjective?: string | null;
  roomCode?: string;
  channel: RoomChannelManager;
  onSubmitDrawing: (previewDataUrl: string, strokes: Stroke[]) => void;
  onLeaveRoom?: () => void;
}

const PALETTE_COLORS = [
  '#111827', // Pitch Black
  '#ffffff', // Clean White
  '#dc2626', // Crimson Red
  '#2563eb', // Royal Blue
  '#eab308', // Amber Yellow
];

export const DrawingCanvas: React.FC<DrawingCanvasProps> = ({
  gameState,
  currentUser,
  secretClue,
  secretDrawObjective,
  roomCode,
  channel,
  onSubmitDrawing,
  onLeaveRoom,
}) => {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const isDrawingRef = useRef<boolean>(false);
  const currentStrokeRef = useRef<Stroke | null>(null);

  const [currentTool, setCurrentTool] = useState<DrawingTool>('pencil');
  const [currentColor, setCurrentColor] = useState<string>('#111827');
  const [strokeWidth, setStrokeWidth] = useState<number>(4);
  const [strokes, setStrokes] = useState<Stroke[]>([]);
  const [redoStack, setRedoStack] = useState<Stroke[]>([]);
  const [zoomLevel, setZoomLevel] = useState<number>(100);
  const [remainingSeconds, setRemainingSeconds] = useState<number>(30);
  const [isSubmitting, setIsSubmitting] = useState<boolean>(false);

  // Live Guesses state
  const [guessInput, setGuessInput] = useState<string>('');
  const [guessFeed, setGuessFeed] = useState<Array<{ playerId: string; playerName: string; text: string; isClose?: boolean; isCorrect?: boolean }>>([]);
  const [guessFeedback, setGuessFeedback] = useState<string | null>(null);

  const isCurrentDrawer = gameState.currentTurnPlayerId === currentUser.id;
  const currentDrawer = gameState.players.find((p) => p.id === gameState.currentTurnPlayerId);
  const backend = BackendClient.getInstance();

  // Authoritative server timer calculation
  useEffect(() => {
    const updateTimer = () => {
      const remaining = TurnManager.calculateRemainingSeconds(gameState.turnEndsAt);
      setRemainingSeconds(remaining);

      // The server owns timeout and turn rotation. Clients only display its deadline.
    };

    updateTimer();
    const interval = setInterval(updateTimer, 1000);
    return () => clearInterval(interval);
  }, [gameState.turnEndsAt, isCurrentDrawer, isSubmitting]);

  // Reset canvas and submission lock on turn transition
  useEffect(() => {
    setIsSubmitting(false);
    setStrokes([]);
    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        ctx.fillStyle = '#fbf8f1';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
      }
    }
  }, [gameState.currentTurnPlayerId, gameState.turnIndex]);

  // WebSocket Live Sync: Listen for remote strokes and guess events from BackendClient
  useEffect(() => {
    const unsubStroke = backend.on('DRAW_STROKE', (chunk: any) => {
      if (chunk && !isCurrentDrawer) {
        const canvas = canvasRef.current;
        if (canvas) {
          const ctx = canvas.getContext('2d');
          if (ctx && chunk.points && chunk.points.length > 0) {
            ctx.save();
            ctx.strokeStyle = chunk.color || '#111827';
            ctx.lineWidth = chunk.width || 4;
            ctx.lineCap = 'round';
            ctx.lineJoin = 'round';
            ctx.beginPath();
            chunk.points.forEach((pt: Point, idx: number) => {
              const x = pt.x * canvas.width;
              const y = pt.y * canvas.height;
              if (idx === 0) ctx.moveTo(x, y);
              else ctx.lineTo(x, y);
            });
            ctx.stroke();
            ctx.restore();
          }
        }
      }
    });

    const unsubClear = backend.on('DRAW_CLEAR', () => {
      setStrokes([]);
      const canvas = canvasRef.current;
      if (canvas) {
        const ctx = canvas.getContext('2d');
        if (ctx) {
          ctx.fillStyle = '#fbf8f1';
          ctx.fillRect(0, 0, canvas.width, canvas.height);
        }
      }
    });

    const unsubPublicGuess = backend.on('PUBLIC_GUESS', (payload: any) => {
      setGuessFeed((prev) => [
        ...prev.slice(-15),
        {
          playerId: payload.playerId,
          playerName: payload.playerName,
          text: payload.guess,
          isClose: payload.isClose,
        },
      ]);
    });

    const unsubGuessFeedback = backend.on('GUESS_FEEDBACK', (payload: any) => {
      if (payload.status === 'CLOSE') {
        setGuessFeedback('Almost... You are very close!');
        setTimeout(() => setGuessFeedback(null), 3500);
      }
    });

    const unsubClueSolved = backend.on('CLUE_SOLVED', (payload: any) => {
      setGuessFeed((prev) => [
        ...prev.slice(-15),
        {
          playerId: payload.solverPlayerId,
          playerName: payload.solverName,
          text: `SOLVED: ${payload.solvedObjective}`,
          isCorrect: true,
        },
      ]);
    });

    return () => {
      unsubStroke();
      unsubClear();
      unsubPublicGuess();
      unsubGuessFeedback();
      unsubClueSolved();
    };
  }, [backend, isCurrentDrawer]);

  // Observer Mode: Realtime sync of strokes & live stream
  useEffect(() => {
    if (isCurrentDrawer) return;

    const unsubscribe = channel.subscribeMessages((msg) => {
      if (msg.type === 'DRAWING_STROKE') {
        const payload = msg.payload as StrokeBroadcastPayload;
        if (payload?.stroke) {
          setStrokes((prev) => [...prev, payload.stroke]);
          const canvas = canvasRef.current;
          if (canvas) {
            const ctx = canvas.getContext('2d');
            if (ctx) {
              DrawingService.renderStroke(ctx, payload.stroke);
            }
          }
        }
      } else if (msg.type === 'STROKE_LIVE_UPDATE') {
        const payload = msg.payload as { stroke?: Stroke };
        if (payload?.stroke) {
          const canvas = canvasRef.current;
          if (canvas) {
            const ctx = canvas.getContext('2d');
            if (ctx) {
              DrawingService.renderStroke(ctx, payload.stroke);
            }
          }
        }
      } else if (msg.type === 'DRAWING_UNDO') {
        const payload = msg.payload as { strokes?: Stroke[] };
        const updated = payload?.strokes || [];
        setStrokes(updated);
        const canvas = canvasRef.current;
        if (canvas) {
          const ctx = canvas.getContext('2d');
          if (ctx) {
            ctx.fillStyle = '#fbf8f1';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            DrawingService.replayStrokes(ctx, canvas.width, canvas.height, updated);
          }
        }
      } else if (msg.type === 'DRAWING_CLEARED') {
        setStrokes([]);
        const canvas = canvasRef.current;
        if (canvas) {
          const ctx = canvas.getContext('2d');
          if (ctx) {
            ctx.fillStyle = '#fbf8f1';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
          }
        }
      }
    });

    return () => unsubscribe();
  }, [channel, isCurrentDrawer]);


  // Canvas Initialization (Parchment Paper Canvas)
  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    canvas.width = 1000;
    canvas.height = 620;

    const ctx = canvas.getContext('2d');
    if (ctx) {
      ctx.fillStyle = '#fbf8f1';
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      DrawingService.replayStrokes(ctx, canvas.width, canvas.height, strokes);
    }
  }, []);

  const lastBroadcastRef = useRef<number>(0);

  const getCoordinates = (e: React.MouseEvent | React.TouchEvent): Point | null => {
    const canvas = canvasRef.current;
    if (!canvas) return null;

    const rect = canvas.getBoundingClientRect();
    const clientX = 'touches' in e ? e.touches[0].clientX : e.clientX;
    const clientY = 'touches' in e ? e.touches[0].clientY : e.clientY;

    const scaleX = canvas.width / rect.width;
    const scaleY = canvas.height / rect.height;

    return {
      x: (clientX - rect.left) * scaleX,
      y: (clientY - rect.top) * scaleY,
    };
  };

  const handlePointerDown = (e: React.MouseEvent | React.TouchEvent) => {
    if (!isCurrentDrawer || isSubmitting) return;

    const pt = getCoordinates(e);
    if (!pt) return;

    isDrawingRef.current = true;
    const newStroke = DrawingService.createStroke(
      `draw-${gameState.id}`,
      currentUser.id,
      currentTool,
      currentTool === 'eraser' ? '#fbf8f1' : currentColor,
      strokeWidth,
      pt
    );
    currentStrokeRef.current = newStroke;

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        DrawingService.renderStroke(ctx, newStroke);
      }
    }
  };

  const handlePointerMove = (e: React.MouseEvent | React.TouchEvent) => {
    if (!isDrawingRef.current || !currentStrokeRef.current || !isCurrentDrawer) return;

    const pt = getCoordinates(e);
    if (!pt) return;

    currentStrokeRef.current.points.push(pt);

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        DrawingService.renderStroke(ctx, currentStrokeRef.current);
      }
    }

    // Stream live stroke updates to observers (throttled to 45ms)
    const now = Date.now();
    if (now - lastBroadcastRef.current > 45) {
      lastBroadcastRef.current = now;
      channel.broadcast('STROKE_LIVE_UPDATE', currentUser.id, {
        stroke: currentStrokeRef.current,
      });
    }
  };

  const handlePointerUp = () => {
    if (!isDrawingRef.current || !currentStrokeRef.current || !isCurrentDrawer) return;

    isDrawingRef.current = false;
    const completedStroke = currentStrokeRef.current;
    currentStrokeRef.current = null;

    setStrokes((prev) => [...prev, completedStroke]);

    channel.broadcast(
      'DRAWING_STROKE',
      currentUser.id,
      {
        drawingId: completedStroke.drawingId,
        stroke: completedStroke,
      },
      gameState.sequenceNumber
    );

    // Send authoritative stroke to game engine via WebSocket
    const canvas = canvasRef.current;
    if (canvas) {
      const normalizedPoints = completedStroke.points.map((p) => ({
        x: p.x / canvas.width,
        y: p.y / canvas.height,
      }));
      backend.drawStroke({
        strokeId: completedStroke.id,
        tool: completedStroke.tool === 'eraser' ? 'eraser' : 'pencil',
        color: completedStroke.color,
        width: completedStroke.width,
        points: normalizedPoints,
        isComplete: true,
        timestamp: completedStroke.timestamp,
      });
    }
  };

  const handleClear = () => {
    if (!isCurrentDrawer) return;
    setStrokes([]);

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        ctx.fillStyle = '#fbf8f1';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
      }
    }

    channel.broadcast('DRAWING_CLEARED', currentUser.id, {
      drawingId: `draw-${gameState.id}`,
      playerId: currentUser.id,
    });
    backend.drawClear();
  };

  const handleGuessSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (isCurrentDrawer || !guessInput.trim()) return;
    backend.submitGuess(guessInput.trim());
    setGuessInput('');
  };


  const handleUndo = () => {
    if (!isCurrentDrawer || strokes.length === 0) return;
    const last = strokes[strokes.length - 1];
    const previous = strokes.slice(0, -1);
    setRedoStack((prev) => [...prev, last]);
    setStrokes(previous);

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        ctx.fillStyle = '#fbf8f1';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        DrawingService.replayStrokes(ctx, canvas.width, canvas.height, previous);
      }
    }

    channel.broadcast('DRAWING_UNDO', currentUser.id, {
      strokes: previous,
    });
  };

  const handleRedo = () => {
    if (!isCurrentDrawer || redoStack.length === 0) return;
    const restored = redoStack[redoStack.length - 1];
    const newRedo = redoStack.slice(0, -1);
    setRedoStack(newRedo);
    const updated = [...strokes, restored];
    setStrokes(updated);

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        DrawingService.renderStroke(ctx, restored);
      }
    }

    channel.broadcast('DRAWING_STROKE', currentUser.id, {
      drawingId: restored.drawingId,
      stroke: restored,
    });
  };

  const handleSubmit = () => {
    if (isSubmitting) return;
    setIsSubmitting(true);

    const canvas = canvasRef.current;
    const previewDataUrl = canvas ? canvas.toDataURL('image/png') : '';
    onSubmitDrawing(previewDataUrl, strokes);
  };

  const formattedTimer = `00:${remainingSeconds.toString().padStart(2, '0')}`;

  const clueText =
    secretClue?.clueText ||
    'You saw someone leaving through the east gate with a red bag.';

  // Render real dynamic players roster matching current game
  const rosterPlayers: Player[] =
    gameState.players.length > 0 ? gameState.players : [currentUser];

  return (
    <div className="relative min-h-screen w-full bg-[#07080d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-35 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* TOP HEADER WITH STEPPER & ROOM CODE */}
      <GameHeader
        currentUser={currentUser}
        roomCode={roomCode || gameState.roomId.substring(0, 6).toUpperCase()}
        playerCount={rosterPlayers.length}
        maxPlayers={8}
        currentPhase={gameState.status}
        caseTitle={gameState.currentCase?.title || 'The Midnight Museum Heist'}
        roundText={`Turn ${gameState.turnIndex + 1} of ${rosterPlayers.length} • Drawing Phase`}
        onLeaveRoom={onLeaveRoom}
      />

      {/* GAME HUD */}
      <div className="relative z-20 w-full max-w-[1440px] mx-auto px-3 sm:px-6 pt-3 pb-1">
        <div className="rounded-2xl border border-slate-700/70 bg-[#10131c]/95 shadow-[0_10px_35px_rgba(0,0,0,0.35)] px-3 sm:px-5 py-2.5 flex items-center justify-between gap-3">
          <div className="flex items-center gap-2 min-w-0">
            <div className={`w-9 h-9 rounded-xl grid place-items-center border ${isCurrentDrawer ? 'bg-red-500/15 border-red-500/60 text-red-400' : 'bg-sky-500/10 border-sky-500/40 text-sky-300'}`}>
              {isCurrentDrawer ? <Crosshair className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
            </div>
            <div className="min-w-0">
              <div className="text-[9px] sm:text-[10px] uppercase tracking-[0.18em] font-mono text-slate-500">Live round · Turn {gameState.turnIndex + 1}</div>
              <div className="text-xs sm:text-sm font-bold text-white truncate">{isCurrentDrawer ? 'Your easel is active' : `${currentDrawer?.nickname || 'A detective'} is drawing`}</div>
            </div>
          </div>
          <div className="flex items-center gap-2 sm:gap-3">
            <div className="hidden sm:flex items-center gap-1.5 text-[10px] font-mono text-emerald-300"><Radio className="w-3.5 h-3.5" /> LIVE</div>
            <div className="text-right">
              <div className="text-[9px] uppercase tracking-widest font-mono text-slate-500">Time left</div>
              <div className="text-xl sm:text-2xl font-mono font-black text-red-400 tabular-nums">{formattedTimer}</div>
            </div>
          </div>
        </div>
      </div>

      {/* MAIN GAMEPLAY GRID: 3 COLUMNS */}
      <main className="relative z-10 w-full max-w-[1440px] mx-auto px-3 sm:px-6 py-2 sm:py-4 grid grid-cols-1 lg:grid-cols-12 gap-4 sm:gap-5 items-start">
        {/* ======================================================== */}
        {/* LEFT COLUMN: YOUR CLUE / OBJECTIVE + GUESS FEED (3 cols)  */}
        {/* ======================================================== */}
        <div className="order-2 lg:order-1 lg:col-span-3 flex flex-col gap-4">
          {/* TAPED PARCHMENT CLUE CARD OR SECRET OBJECTIVE */}
          <div className={`relative rounded-2xl p-4 sm:p-5 shadow-xl border select-text overflow-hidden ${isCurrentDrawer ? 'bg-gradient-to-br from-red-950/70 to-[#11141e] border-red-500/45' : 'bg-[#11141e]/95 border-slate-700/70'}`}>
            <div className="absolute right-0 top-0 w-28 h-28 bg-red-500/10 blur-3xl rounded-full" />
            <div className="relative flex items-center gap-1.5 text-[10px] font-mono font-bold uppercase tracking-[0.15em] text-red-300 mb-3">
              <Crosshair className="w-3.5 h-3.5" />
              <span>{isCurrentDrawer ? 'Private mission' : 'Live case feed'}</span>
            </div>

            <div className="relative text-base sm:text-lg font-semibold leading-relaxed text-white mb-4">
              {isCurrentDrawer ? (
                secretDrawObjective || clueText
              ) : (
                <span className="text-slate-300 text-sm font-sans leading-relaxed">
                  Watch the live strokes on the canvas carefully and submit your deduction theory below.
                </span>
              )}
            </div>

            <div className="relative pt-3 border-t border-slate-700/70 text-[11px] font-mono text-slate-400">
              {isCurrentDrawer
                ? 'Think visually. Draw key clues, symbols, or actions to help detectives guess.'
                : 'Any detective who guesses correctly unlocks the next story discovery.'}
            </div>
          </div>

          {/* REAL-TIME GUESS FEED & INPUT (FOR GUESSERS) */}
          {!isCurrentDrawer && (
            <div className="bg-[#0e131f]/95 border border-slate-700/80 rounded-2xl p-4 shadow-xl flex flex-col gap-3 backdrop-blur-md">
              <div className="flex items-center justify-between text-xs font-mono font-bold uppercase tracking-wider text-slate-300 border-b border-slate-800 pb-2">
                <span>Deduction Feed</span>
                {guessFeedback && (
                  <span className="text-amber-400 animate-pulse text-[10px]">{guessFeedback}</span>
                )}
              </div>

              {/* Live Guesses History */}
              <div className="h-36 overflow-y-auto space-y-1.5 text-xs font-mono pr-1">
                {guessFeed.length === 0 ? (
                  <div className="text-slate-500 italic text-[11px] text-center pt-8">
                    No guesses yet. Type your guess below!
                  </div>
                ) : (
                  guessFeed.map((g, idx) => (
                    <div
                      key={idx}
                      className={`p-1.5 rounded-lg text-[11px] flex items-center justify-between ${
                        g.isCorrect
                          ? 'bg-emerald-950/80 border border-emerald-500 text-emerald-200 font-bold'
                          : g.isClose
                          ? 'bg-amber-950/60 border border-amber-600/60 text-amber-200'
                          : 'bg-slate-900/60 text-slate-300'
                      }`}
                    >
                      <span className="font-bold text-white mr-1.5">{g.playerName}:</span>
                      <span className="flex-1 truncate">{g.text}</span>
                      {g.isClose && <span className="text-[9px] text-amber-400 ml-1">Almost!</span>}
                      {g.isCorrect && <span className="text-[9px] text-emerald-400 ml-1">✓ Correct</span>}
                    </div>
                  ))
                )}
              </div>

              {/* Guess Submission Input */}
              <form onSubmit={handleGuessSubmit} className="flex gap-2 pt-1 border-t border-slate-800">
                <input
                  type="text"
                  value={guessInput}
                  onChange={(e) => setGuessInput(e.target.value)}
                  placeholder="Type your guess..."
                  className="flex-1 px-3 py-2 bg-slate-950 border border-slate-700 rounded-xl text-xs text-white placeholder-slate-500 focus:outline-none focus:border-red-500 font-sans"
                />
                <button
                  type="submit"
                  disabled={!guessInput.trim()}
                  className="px-3 py-2 bg-red-600 hover:bg-red-500 disabled:opacity-40 text-white rounded-xl text-xs font-bold uppercase tracking-wider transition-colors"
                >
                  Guess
                </button>
              </form>
            </div>
          )}


          {/* TIPS CARD */}
          <div className="hidden lg:block bg-[#10131c]/90 border border-slate-700/60 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-2.5">
            <div className="flex items-center gap-2 text-xs font-bold text-white">
              <Lightbulb className="w-3.5 h-3.5 text-amber-400" />
              <span>Tips</span>
            </div>

            <ul className="space-y-1.5 text-xs text-slate-300 font-sans">
              <li className="flex items-start gap-2">
                <span className="text-red-500 font-bold">•</span>
                <span>Draw objects, actions or scenes</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-red-500 font-bold">•</span>
                <span>Be clear but not too obvious</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-red-500 font-bold">•</span>
                <span>You can use colors and symbols</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-red-500 font-bold">•</span>
                <span>Others will try to interpret your drawing</span>
              </li>
            </ul>
          </div>

          {/* PINNED POLAROID AT BOTTOM LEFT */}
          <div className="relative hidden md:block bg-[#f8f1e0] p-4 rounded-xl shadow-xl -rotate-2 border border-[#d8c3a5] text-[#2c1d10] font-handwriting text-sm text-center">
            "A clue in every hand. A truth in between."
          </div>
        </div>

        {/* ======================================================== */}
        {/* CENTER COLUMN: DRAWING CANVAS & CONTROLS (6 cols)        */}
        {/* ======================================================== */}
        <div className="order-1 lg:order-2 lg:col-span-6 flex flex-col gap-3">
          {/* WHITE PARCHMENT DRAWING CANVAS */}
          <div className="relative w-full aspect-[4/3] sm:aspect-[16/10] bg-[#fbf8f1] rounded-2xl shadow-[0_0_0_1px_rgba(239,68,68,0.18),0_20px_50px_rgba(0,0,0,0.45)] border-2 border-slate-600 overflow-hidden flex items-center justify-center">
            <div className="absolute inset-x-0 top-0 z-20 h-8 bg-gradient-to-r from-[#121722]/95 via-[#202838]/90 to-[#121722]/95 border-b border-slate-600/80 flex items-center justify-between px-3 pointer-events-none">
              <span className="text-[9px] font-mono font-bold tracking-[0.18em] uppercase text-slate-300">Evidence canvas</span>
              <span className={`text-[9px] font-mono uppercase ${isCurrentDrawer ? 'text-red-300' : 'text-sky-300'}`}>{isCurrentDrawer ? 'Input enabled' : 'Spectator stream'}</span>
            </div>
            {/* HTML5 Canvas */}
            <canvas
              ref={canvasRef}
              style={{
                transform: `scale(${zoomLevel / 100})`,
                transformOrigin: 'center center',
                transition: 'transform 0.15s ease',
                touchAction: 'none',
              }}
              onMouseDown={handlePointerDown}
              onMouseMove={handlePointerMove}
              onMouseUp={handlePointerUp}
              onMouseLeave={handlePointerUp}
              onTouchStart={handlePointerDown}
              onTouchMove={handlePointerMove}
              onTouchEnd={handlePointerUp}
              className={`w-full h-full object-contain ${
                isCurrentDrawer ? 'cursor-crosshair' : 'cursor-default pointer-events-none'
              }`}
            />


            {/* TOP RIGHT "CLEAR" BUTTON */}
            {isCurrentDrawer && (
              <button
                onClick={handleClear}
                className="absolute top-3 right-3 px-3 py-1.5 rounded-lg bg-slate-900/85 hover:bg-slate-900 text-slate-200 border border-slate-700/80 text-xs font-medium flex items-center gap-1.5 shadow-md z-30 transition-all"
              >
                <Trash2 className="w-3.5 h-3.5 text-slate-400" />
                <span>Clear</span>
              </button>
            )}

            {/* VERTICAL TOOLBAR DOCKED ON THE LEFT EDGE */}
            {isCurrentDrawer && (
              <div className="absolute left-2 right-12 top-2 bg-[#0e131f]/95 backdrop-blur-md border border-slate-700/80 rounded-xl p-1 flex flex-row items-center gap-1 shadow-2xl z-30 lg:left-3 lg:top-1/2 lg:right-auto lg:-translate-y-1/2 lg:flex-col lg:rounded-2xl lg:p-1.5 lg:gap-2">
                {/* Pencil */}
                <button
                  onClick={() => {
                    setCurrentTool('pencil');
                    setStrokeWidth(4);
                  }}
                  title="Pencil"
                  className={`p-2 rounded-lg lg:p-2.5 lg:rounded-xl transition-all ${
                    currentTool === 'pencil'
                      ? 'bg-red-600 text-white shadow-[0_0_10px_rgba(220,38,38,0.7)]'
                      : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Pencil className="w-4 h-4" />
                </button>

                {/* Eraser */}
                <button
                  onClick={() => setCurrentTool('eraser')}
                  title="Eraser"
                  className={`p-2 rounded-xl transition-all ${
                    currentTool === 'eraser'
                      ? 'bg-red-600 text-white shadow'
                      : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Eraser className="w-4 h-4" />
                </button>

                {/* Shape tools stay available on larger touch targets. */}
                <button
                  onClick={() => setCurrentTool('rectangle')}
                  title="Rectangle"
                  className={`hidden sm:block p-2 rounded-xl transition-all ${
                    currentTool === 'rectangle'
                      ? 'bg-red-600 text-white shadow'
                      : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Square className="w-4 h-4" />
                </button>

                {/* Circle */}
                <button
                  onClick={() => setCurrentTool('circle')}
                  title="Circle"
                  className={`hidden sm:block p-2 rounded-xl transition-all ${
                    currentTool === 'circle'
                      ? 'bg-red-600 text-white shadow'
                      : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <CircleIcon className="w-4 h-4" />
                </button>

                {/* Text tool */}
                <button
                  onClick={() => setCurrentTool('text')}
                  title="Text"
                  className={`hidden sm:block p-2 rounded-xl transition-all ${
                    currentTool === 'text'
                      ? 'bg-red-600 text-white shadow'
                      : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Type className="w-4 h-4" />
                </button>

                <div className="w-5 h-[1px] bg-slate-700/80 my-0.5 hidden lg:block" />

                {/* Color Swatches */}
                <div className="flex flex-row gap-1.5 lg:flex-col lg:gap-2">
                  {PALETTE_COLORS.map((color) => {
                    const isSelected = currentColor.toLowerCase() === color.toLowerCase();
                    return (
                      <button
                        key={color}
                        onClick={() => {
                          setCurrentColor(color);
                          if (currentTool === 'eraser') setCurrentTool('pencil');
                        }}
                        style={{ backgroundColor: color }}
                          className={`w-5 h-5 sm:w-6 sm:h-6 rounded-full border transition-all ${
                          isSelected
                            ? 'scale-125 ring-2 ring-red-500 border-white shadow-md'
                            : 'border-slate-500 hover:scale-110'
                        }`}
                      />
                    );
                  })}
                </div>
              </div>
            )}
          </div>

          {/* BOTTOM TOOLBAR BELOW CANVAS: UNDO, REDO, BRUSH SIZE, ZOOM */}
          <div className="bg-[#10131c]/95 border border-slate-700/60 rounded-xl px-3 sm:px-4 py-2 flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs text-slate-300">
            {/* Undo & Redo */}
            <div className="flex items-center gap-2 justify-between sm:justify-start w-full sm:w-auto">
              <button
                onClick={handleUndo}
                disabled={strokes.length === 0}
                title="Undo"
                className="p-1 text-slate-400 hover:text-white transition-colors disabled:opacity-30"
              >
                <RotateCcw className="w-4 h-4" />
              </button>
              <button
                onClick={handleRedo}
                disabled={redoStack.length === 0}
                title="Redo"
                className="p-1 text-slate-400 hover:text-white transition-colors disabled:opacity-30"
              >
                <RotateCw className="w-4 h-4" />
              </button>
            </div>

            {/* Brush Size Slider with Red Fill */}
            <div className="flex items-center gap-2.5 w-full sm:w-auto">
              <span className="text-[11px] font-mono text-slate-400 whitespace-nowrap">Brush Size</span>
              <input
                type="range"
                min="2"
                max="20"
                value={strokeWidth}
                onChange={(e) => setStrokeWidth(Number(e.target.value))}
                className="w-28 sm:w-32 accent-red-600 cursor-pointer h-1.5 bg-slate-700 rounded-lg"
              />
            </div>

            {/* Zoom Controls */}
            <div className="flex items-center gap-1.5 font-mono text-[11px] text-slate-400 justify-end sm:justify-start w-full sm:w-auto">
              <button
                onClick={() => setZoomLevel((z) => Math.max(50, z - 10))}
                className="hover:text-white px-1.5 py-0.5 rounded hover:bg-slate-800"
                title="Zoom Out"
              >
                -
              </button>
              <button
                onClick={() => setZoomLevel(100)}
                className="hover:text-white px-1 font-bold"
                title="Reset to 100%"
              >
                {zoomLevel}%
              </button>
              <button
                onClick={() => setZoomLevel((z) => Math.min(200, z + 10))}
                className="hover:text-white px-1.5 py-0.5 rounded hover:bg-slate-800"
                title="Zoom In"
              >
                +
              </button>
            </div>
          </div>

          {/* THIS ROUND'S DRAWINGS CAROUSEL STRIP */}
          <div className="space-y-2">
            <div className="text-xs font-mono font-bold uppercase tracking-wider text-slate-300 flex items-center gap-2">
              <Users className="w-3.5 h-3.5 text-sky-400" /> Round roster
            </div>

            <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-2">
              {Array.from({ length: 6 }).map((_, slotIdx) => {
                const p = rosterPlayers[slotIdx];
                const card = p ? gameState.evidenceCards.find((e) => e.sourcePlayerId === p.id) : null;
                const isCurrentTurn = p && p.id === gameState.currentTurnPlayerId;

                if (!p) {
                  return (
                    <div
                      key={`slot-${slotIdx}`}
                      className="bg-slate-900/40 border border-slate-800/80 rounded-xl p-2 text-center flex flex-col items-center justify-center gap-1 text-slate-600"
                    >
                      <span className="text-xs font-mono">--</span>
                      <div className="text-[10px] text-slate-500">Empty</div>
                    </div>
                  );
                }

                if (card) {
                  return (
                    <div
                      key={p.id}
                      className="bg-slate-900/80 border border-emerald-500/50 rounded-xl p-1.5 text-center flex flex-col items-center justify-between gap-1 shadow-sm overflow-hidden"
                    >
                      <div className="w-full h-8 rounded bg-[#fbf8f1] overflow-hidden flex items-center justify-center">
                        {card.drawingPreview ? (
                          <img src={card.drawingPreview} alt="Clue" className="w-full h-full object-contain" />
                        ) : (
                          <span className="text-xs text-slate-600">🎨</span>
                        )}
                      </div>
                      <div className="text-[10px] font-bold text-slate-200 truncate w-full">{p.nickname}</div>
                      <div className="text-[9px] font-mono text-emerald-400">✓ Submitted</div>
                    </div>
                  );
                }

                if (isCurrentTurn) {
                  return (
                    <div
                      key={p.id}
                      className="bg-red-950/40 border-2 border-red-600 rounded-xl p-2 text-center flex flex-col items-center justify-center gap-1 shadow-[0_0_12px_rgba(220,38,38,0.4)]"
                    >
                      <Pencil className="w-3.5 h-3.5 text-red-400 animate-bounce" />
                      <div className="text-[11px] font-bold text-white leading-tight truncate w-full">
                        {p.id === currentUser.id ? 'Your Turn' : p.nickname}
                      </div>
                      <div className="text-[9px] font-mono text-red-400">Drawing...</div>
                    </div>
                  );
                }

                return (
                  <div
                    key={p.id}
                    className="bg-slate-900/60 border border-slate-800 rounded-xl p-2 text-center flex flex-col items-center justify-center gap-1 text-slate-400"
                  >
                    <AvatarBadge avatar={p.avatar} size="sm" />
                    <div className="text-[10px] text-slate-300 leading-tight truncate w-full">{p.nickname}</div>
                    <div className="text-[9px] font-mono text-slate-500">Pending</div>
                  </div>
                );
              })}
            </div>
          </div>

          {/* BIG PRIMARY "SUBMIT DRAWING" BUTTON */}
          <button
            onClick={handleSubmit}
            disabled={isSubmitting || !isCurrentDrawer}
            className={`w-full py-3.5 rounded-2xl text-white font-bold text-sm tracking-wide shadow-md transition-all flex items-center justify-center gap-2 ${
              isCurrentDrawer
                ? 'bg-gradient-to-r from-[#991b1b] via-[#dc2626] to-[#991b1b] hover:from-[#b91c1c] hover:via-[#ef4444] hover:to-[#b91c1c] shadow-[0_4px_20px_rgba(220,38,38,0.45)] transform hover:-translate-y-0.5 active:translate-y-0 cursor-pointer'
                : 'bg-slate-900 border border-slate-800 text-slate-400 opacity-60 cursor-not-allowed'
            }`}
          >
            <Send className="w-4 h-4" />
            <span>
              {isSubmitting
                ? 'Submitting Clue...'
                : isCurrentDrawer
                ? 'Submit Drawing'
                : `Waiting for ${currentDrawer?.nickname || 'detective'} to sketch...`}
            </span>
          </button>
        </div>

        {/* ======================================================== */}
        {/* RIGHT COLUMN: PLAYERS ROSTER & ROOM CHAT (3 cols)        */}
        {/* ======================================================== */}
        <div className="order-3 lg:order-3 lg:col-span-3 flex flex-col gap-4">
          {/* PLAYERS LIST ROSTER */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-2.5">
            <div className="text-xs font-mono font-bold uppercase tracking-wider text-slate-300 border-b border-slate-800 pb-2">
              | Players ({rosterPlayers.length}/8)
            </div>

            <div className="space-y-2">
              {rosterPlayers.map((p) => {
                const isDrawing = p.id === gameState.currentTurnPlayerId;
                const hasSubmitted = gameState.evidenceCards.some((e) => e.sourcePlayerId === p.id);
                return (
                  <div
                    key={p.id}
                    className={`flex items-center justify-between p-2 rounded-xl border transition-all ${
                      isDrawing
                        ? 'bg-red-950/30 border-red-600/80 shadow-[0_0_10px_rgba(220,38,38,0.2)]'
                        : 'bg-slate-900/40 border-slate-800'
                    }`}
                  >
                    <div className="flex items-center gap-2.5">
                      <div className="w-7 h-7 rounded-full bg-slate-800 border border-slate-700 flex items-center justify-center text-xs">
                        <AvatarBadge avatar={p.avatar} size="sm" />
                      </div>
                      <div className="flex items-center gap-1.5">
                        <span className="text-xs font-semibold text-white">{p.nickname}</span>
                        {p.isHost && <span className="text-amber-400 text-xs">👑</span>}
                      </div>
                    </div>

                    <div
                      className={`text-[10px] font-mono ${
                        isDrawing
                          ? 'text-red-400 font-bold'
                          : hasSubmitted
                          ? 'text-emerald-400 font-semibold'
                          : 'text-slate-400'
                      }`}
                    >
                      {isDrawing ? 'Drawing...' : hasSubmitted ? '✓ Submitted' : 'Waiting...'}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          {/* ROOM CHAT WITH TABS (Room Chat / Game Log) */}
          <div className="w-full">
            <RoomChat
              currentUser={currentUser}
              channel={channel}
              showTabs={true}
              defaultTab="Room Chat"
              className="min-h-[290px]"
            />
          </div>
        </div>
      </main>

      {/* FOOTER */}
      <footer className="relative z-10 w-full max-w-[1440px] mx-auto px-4 sm:px-6 py-2 text-center text-[11px] font-mono text-slate-500">
        INKBOUND • Round 1 Turn {gameState.turnIndex + 1} of {rosterPlayers.length} • Case: {gameState.currentCase?.title || 'Active Investigation'}
      </footer>
    </div>
  );
};
