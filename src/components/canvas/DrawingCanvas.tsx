import React, { useRef, useState, useEffect } from 'react';
import {
  Pencil,
  Eraser,
  RotateCcw,
  RotateCw,
  Trash2,
  Lightbulb,
  Crosshair,
  Users,
  Sparkles,
  PaintBucket,
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
import { SoundService } from '../../services/soundService';

interface DrawingCanvasProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  secretClue?: PlayerSecretClue | null;
  secretDrawObjective?: string | null;
  secretDrawHint?: string | null;
  publicHint?: string | null;
  publicWordLengths?: number[] | null;
  publicFirstLetters?: string[] | null;
  roomCode?: string;
  channel: RoomChannelManager;
  isDrawer?: boolean;
  onSubmitDrawing?: (previewDataUrl: string, strokes: Stroke[]) => void;
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
  secretDrawObjective,
  secretDrawHint,
  publicHint,
  publicWordLengths,
  publicFirstLetters,
  roomCode,
  channel,
  isDrawer: propIsDrawer,
  onLeaveRoom,
}) => {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const canvasContainerRef = useRef<HTMLDivElement | null>(null);
  const isDrawingRef = useRef<boolean>(false);
  const currentStrokeRef = useRef<Stroke | null>(null);

  const [currentTool, setCurrentTool] = useState<DrawingTool>('pencil');
  const [currentColor, setCurrentColor] = useState<string>('#111827');
  const [strokeWidth, setStrokeWidth] = useState<number>(4);
  const [strokes, setStrokes] = useState<Stroke[]>([]);
  const [redoStack, setRedoStack] = useState<Stroke[]>([]);
  const [remainingSeconds, setRemainingSeconds] = useState<number>(0);

  // Live Guesses state
  const [guessInput, setGuessInput] = useState<string>('');
  const [guessFeed, setGuessFeed] = useState<Array<{ playerId: string; playerName: string; text: string; isClose?: boolean; isCorrect?: boolean }>>([]);
  const [guessFeedback, setGuessFeedback] = useState<string | null>(null);

  const backend = BackendClient.getInstance();
  const myBackendId = backend.getPlayerId();
  const currentDrawer = gameState.players.find((p) => p.id === gameState.currentTurnPlayerId);

  // Strict authoritative drawer check: ID match or backend ID match
  const isCurrentDrawer = Boolean(
    propIsDrawer ||
    (gameState.currentTurnPlayerId && currentUser?.id && gameState.currentTurnPlayerId === currentUser.id) ||
    (gameState.currentTurnPlayerId && myBackendId && gameState.currentTurnPlayerId === myBackendId)
  );

  // Reset canvas, strokes, and guess feed whenever turn advances
  useEffect(() => {
    setStrokes([]);
    setRedoStack([]);
    setGuessFeed([]);
    setGuessFeedback(null);
    setGuessInput('');
    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        ctx.fillStyle = '#fbf8f1';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
      }
    }
  }, [gameState.turnIndex, gameState.currentTurnPlayerId]);

  const cleanClueToTwoWords = (txt?: string | null): string => {
    if (!txt) return '';
    let clean = txt
      .replace(/^#*\s*\d+\s*[—–-]\s*/, '')
      .replace(/^A\s+|^An\s+|^The\s+/i, '')
      .replace(/^(finding|discovering|getting into|picking up|refusing)\s+(an?\s+|the\s+)?/i, '')
      .replace(/\s+(while cleaning|out of \w+|near the \w+|in the \w+|on the \w+).*$/i, '')
      .replace(/[.!?:;]+$/, '')
      .trim();
    if (/refusing.*fare/i.test(txt)) return 'Taxi Fare';
    if (/dispatcher.*voice|radio crackles/i.test(txt)) return 'Dispatch Radio';
    if (/fender-bender|car crash/i.test(txt)) return 'Car Crash';

    const words = clean.split(/\s+/).filter(Boolean);
    const chosen = words.length > 2 ? words.slice(-2) : words;
    return chosen.map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()).join(' ');
  };

  const cleanTarget = cleanClueToTwoWords(secretDrawObjective);
  const targetWords = cleanTarget ? cleanTarget.split(' ') : [];

  // Dynamic progressive real-time hints
  const totalSec = gameState.turnDuration || 80;
  const elapsed = Math.max(0, totalSec - remainingSeconds);

  const getDynamicCategory = (): string => {
    const combined = ((secretDrawHint || '') + ' ' + (publicHint || '') + ' ' + cleanTarget).toLowerCase();
    if (combined.includes('photo') || combined.includes('video') || combined.includes('diary') || combined.includes('letter') || combined.includes('note')) {
      return 'Personal Memory & Record';
    }
    if (combined.includes('key') || combined.includes('cutter') || combined.includes('knife') || combined.includes('poison') || combined.includes('gun') || combined.includes('safe') || combined.includes('lock')) {
      return 'Crime Tool & Evidence';
    }
    if (combined.includes('fare') || combined.includes('train') || combined.includes('car') || combined.includes('ticket') || combined.includes('station') || combined.includes('passenger') || combined.includes('taxi')) {
      return 'Transit & Transportation';
    }
    if (combined.includes('diamond') || combined.includes('painting') || combined.includes('coin') || combined.includes('briefcase') || combined.includes('money') || combined.includes('gold')) {
      return 'Valuable Stolen Goods';
    }
    if (publicHint && !/focus on the clue/i.test(publicHint) && !/mystery clue/i.test(publicHint)) {
      return publicHint;
    }
    return 'Crime Scene Evidence';
  };

  const dynamicCategory = getDynamicCategory();

  const effectiveFirstLetters = (publicFirstLetters && publicFirstLetters.length > 0)
    ? publicFirstLetters
    : (targetWords.length > 0 ? targetWords.map((w) => w[0]?.toUpperCase() || '') : []);

  const guesserHintMessage = (() => {
    if (effectiveFirstLetters.length >= 2 && elapsed >= 25) {
      return `🔥 Starts with "${effectiveFirstLetters[0]}" & "${effectiveFirstLetters[1]}" • ${dynamicCategory}`;
    }
    if (effectiveFirstLetters.length >= 1 && elapsed >= 10) {
      return `💡 First word starts with "${effectiveFirstLetters[0]}" • ${dynamicCategory}`;
    }
    return `Category: ${dynamicCategory}`;
  })();

  const renderLetterPattern = () => {
    const lengths = (publicWordLengths && publicWordLengths.length > 0)
      ? publicWordLengths
      : (targetWords.length > 0 ? targetWords.map((w) => w.length) : (effectiveFirstLetters.length >= 2 ? [effectiveFirstLetters[0].length + 4, effectiveFirstLetters[1].length + 5] : [5, 7]));

    return (
      <div className="flex flex-wrap items-center gap-3">
        {lengths.map((len, wIdx) => {
          // Progressive letter reveal for guessers:
          // Word 0 first letter revealed after 10s
          // Word 1 first letter revealed after 25s
          const revealFirstLetter = (wIdx === 0 && elapsed >= 10) || (wIdx === 1 && elapsed >= 25);
          const firstChar = revealFirstLetter && effectiveFirstLetters[wIdx] ? effectiveFirstLetters[wIdx] : null;

          const dashes = Array.from({ length: len }).map((_, cIdx) => {
            const showChar = cIdx === 0 && Boolean(firstChar);
            return (
              <span
                key={cIdx}
                className={`inline-block border-b-2 ${
                  showChar ? 'border-emerald-400 text-emerald-300' : 'border-amber-400/90 text-amber-200'
                } w-3.5 sm:w-4 text-center mx-0.5 font-mono text-base font-bold`}
              >
                {showChar ? firstChar : '\u00A0'}
              </span>
            );
          });

          return (
            <span key={wIdx} className="inline-flex items-end">
              {dashes}
              <span className="text-[10px] text-slate-400 font-mono font-normal ml-1">({len})</span>
            </span>
          );
        })}
      </div>
    );
  };

  // Robust authoritative timer with automatic local countdown fallback so it never freezes
  const turnDuration = gameState.turnDuration || 80;
  const turnStartedAtRef = useRef<number>(Date.now());

  useEffect(() => {
    turnStartedAtRef.current = Date.now();
  }, [gameState.turnIndex, gameState.currentTurnPlayerId]);

  useEffect(() => {
    const updateTimer = () => {
      let rem = 0;
      if (gameState.turnEndsAt) {
        rem = TurnManager.calculateRemainingSeconds(gameState.turnEndsAt);
      }
      if (rem <= 0) {
        const elapsed = Math.floor((Date.now() - turnStartedAtRef.current) / 1000);
        rem = Math.max(0, turnDuration - elapsed);
      }

      setRemainingSeconds(rem);
      if (rem > 0 && rem <= 10) {
        SoundService.playTick(rem <= 5);
      }
    };

    updateTimer();
    const interval = setInterval(updateTimer, 1000);
    return () => clearInterval(interval);
  }, [gameState.turnEndsAt, gameState.turnIndex, turnDuration]);

  // Subscribe to backend authoritative drawing and guess events
  useEffect(() => {
    const unsubStroke = backend.on('DRAW_STROKE', (chunk: any) => {
      if (isCurrentDrawer) return;
      const canvas = canvasRef.current;
      if (!canvas || !chunk?.points || chunk.points.length === 0) return;

      const ctx = canvas.getContext('2d');
      if (!ctx) return;

      const strokeObj: Stroke = {
        id: chunk.strokeId || `chunk-${Date.now()}`,
        drawingId: `draw-${gameState.id}`,
        playerId: gameState.currentTurnPlayerId || '',
        tool: chunk.tool || 'pencil',
        color: chunk.color || '#111827',
        width: chunk.width || 4,
        points: chunk.points,
        timestamp: chunk.timestamp || Date.now(),
      };

      setStrokes((prev) => [...prev, strokeObj]);
      DrawingService.renderStroke(ctx, strokeObj, canvas.width, canvas.height);
    });

    const unsubClear = backend.on('DRAW_CLEAR', () => {
      if (isCurrentDrawer) return;
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
        SoundService.playClick();
        setGuessFeedback(payload.feedbackMessage || 'Almost... You found 1 word! Add 1 more word!');
        setTimeout(() => setGuessFeedback(null), 4500);
      } else if (payload.status === 'RATE_LIMITED') {
        setGuessFeedback('Wait 1-2s between guesses.');
        setTimeout(() => setGuessFeedback(null), 2500);
      } else {
        SoundService.playThud();
        setGuessFeedback('Not quite. Keep investigating!');
        setTimeout(() => setGuessFeedback(null), 2500);
      }
    });

    const unsubClueSolved = backend.on('CLUE_SOLVED', (payload: any) => {
      SoundService.playSuccess();
      setGuessFeed((prev) => [
        ...prev.slice(-15),
        {
          playerId: payload.solverPlayerId,
          playerName: payload.solverName,
          text: `SOLVED: ${payload.solvedObjective}`,
          isCorrect: true,
        },
      ]);
      setGuessFeedback(`🎉 Solved by ${payload.solverName}!`);
      setTimeout(() => setGuessFeedback(null), 5000);
    });

    return () => {
      unsubStroke();
      unsubClear();
      unsubPublicGuess();
      unsubGuessFeedback();
      unsubClueSolved();
    };
  }, [backend, isCurrentDrawer]);

  const strokesRef = useRef<Stroke[]>(strokes);
  useEffect(() => {
    strokesRef.current = strokes;
  }, [strokes]);

  const lastLiveStrokeRef = useRef<{ id: string; renderedCount: number }>({ id: '', renderedCount: 0 });

  // Observer Mode: Realtime sync of strokes & live stream
  useEffect(() => {
    if (isCurrentDrawer) return;

    const unsubscribe = channel.subscribeMessages((msg) => {
      if (msg.type === 'DRAWING_STROKE') {
        const payload = msg.payload as StrokeBroadcastPayload;
        if (payload?.stroke) {
          setStrokes((prev) => [...prev, payload.stroke]);
          lastLiveStrokeRef.current = { id: '', renderedCount: 0 };
          const canvas = canvasRef.current;
          if (canvas) {
            const ctx = canvas.getContext('2d');
            if (ctx) {
              DrawingService.renderStroke(ctx, payload.stroke, canvas.width, canvas.height);
            }
          }
        }
      } else if (msg.type === 'STROKE_LIVE_UPDATE') {
        const payload = msg.payload as { stroke?: Stroke };
        if (payload?.stroke) {
          const live = payload.stroke;
          const canvas = canvasRef.current;
          if (!canvas) return;
          const ctx = canvas.getContext('2d');
          if (!ctx) return;

          const pts = live.points;
          if (pts.length < 2) return;

          if (lastLiveStrokeRef.current.id !== live.id) {
            lastLiveStrokeRef.current = { id: live.id, renderedCount: 1 };
          }

          const startIdx = Math.max(1, lastLiveStrokeRef.current.renderedCount);
          const rect = canvas.getBoundingClientRect();
          const dpr = canvas.width / (rect.width || 1);

          ctx.save();
          ctx.lineCap = 'round';
          ctx.lineJoin = 'round';
          if (live.tool === 'eraser') {
            ctx.strokeStyle = '#fbf8f1';
            ctx.lineWidth = live.width * 2 * dpr;
          } else if (live.tool === 'marker') {
            ctx.globalAlpha = 0.5;
            ctx.strokeStyle = live.color;
            ctx.lineWidth = live.width * 2.5 * dpr;
          } else {
            ctx.strokeStyle = live.color;
            ctx.lineWidth = live.width * dpr;
          }

          ctx.beginPath();
          ctx.moveTo(pts[startIdx - 1].x * canvas.width, pts[startIdx - 1].y * canvas.height);
          for (let i = startIdx; i < pts.length; i++) {
            ctx.lineTo(pts[i].x * canvas.width, pts[i].y * canvas.height);
          }
          ctx.stroke();
          ctx.restore();

          lastLiveStrokeRef.current.renderedCount = pts.length;
        }
      } else if (msg.type === 'DRAWING_UNDO') {
        const payload = msg.payload as { strokes?: Stroke[] };
        if (payload?.strokes) {
          setStrokes(payload.strokes);
          lastLiveStrokeRef.current = { id: '', renderedCount: 0 };
          const canvas = canvasRef.current;
          if (canvas) {
            const ctx = canvas.getContext('2d');
            if (ctx) {
              ctx.fillStyle = '#fbf8f1';
              ctx.fillRect(0, 0, canvas.width, canvas.height);
              DrawingService.replayStrokes(ctx, canvas.width, canvas.height, payload.strokes);
            }
          }
        }
      } else if (msg.type === 'DRAWING_CLEARED') {
        setStrokes([]);
        lastLiveStrokeRef.current = { id: '', renderedCount: 0 };
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

  // Dynamic responsive canvas sizing & high-DPI scaling
  useEffect(() => {
    const container = canvasContainerRef.current;
    const canvas = canvasRef.current;
    if (!container || !canvas) return;

    const resizeCanvas = () => {
      const rect = container.getBoundingClientRect();
      const w = rect.width || container.clientWidth;
      const h = rect.height || container.clientHeight;
      if (w === 0 || h === 0) return;

      const dpr = Math.min(window.devicePixelRatio || 1, 2);
      const targetW = Math.max(1, Math.round(w * dpr));
      const targetH = Math.max(1, Math.round(h * dpr));

      if (canvas.width !== targetW || canvas.height !== targetH) {
        canvas.width = targetW;
        canvas.height = targetH;
        const ctx = canvas.getContext('2d');
        if (ctx) {
          ctx.fillStyle = '#fbf8f1';
          ctx.fillRect(0, 0, targetW, targetH);
          DrawingService.replayStrokes(ctx, targetW, targetH, strokesRef.current);
        }
      }
    };

    resizeCanvas();
    const observer = new ResizeObserver(() => resizeCanvas());
    observer.observe(container);

    return () => observer.disconnect();
  }, []);

  const lastBroadcastRef = useRef<number>(0);

  // Pure normalized coordinate mapping across 100% of visible canvas
  const getCoordinates = (e: React.PointerEvent<HTMLCanvasElement>): Point | null => {
    const canvas = canvasRef.current;
    if (!canvas) return null;

    const rect = canvas.getBoundingClientRect();
    if (rect.width === 0 || rect.height === 0) return null;

    // Normalized [0, 1] relative to the exact visible canvas boundary
    return {
      x: Math.max(0, Math.min(1, (e.clientX - rect.left) / rect.width)),
      y: Math.max(0, Math.min(1, (e.clientY - rect.top) / rect.height)),
    };
  };

  const handlePointerDown = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (!isCurrentDrawer) return;

    try {
      e.currentTarget.setPointerCapture(e.pointerId);
    } catch {
      // ignore
    }

    const normPt = getCoordinates(e);
    if (!normPt) return;

    const canvas = canvasRef.current;
    if (!canvas) return;

    if (currentTool === 'fill') {
      const fillStroke = DrawingService.createStroke(
        `draw-${gameState.id}`,
        currentUser.id,
        'fill',
        currentColor,
        1,
        normPt
      );
      const ctx = canvas.getContext('2d');
      if (ctx) {
        DrawingService.floodFill(ctx, normPt.x * canvas.width, normPt.y * canvas.height, currentColor);
      }
      setStrokes((prev) => [...prev, fillStroke]);
      setRedoStack([]);
      channel.broadcast(
        'DRAWING_STROKE',
        currentUser.id,
        {
          drawingId: fillStroke.drawingId,
          stroke: fillStroke,
        },
        gameState.sequenceNumber
      );
      backend.drawStroke({
        strokeId: fillStroke.id,
        tool: 'fill',
        color: currentColor,
        width: 1,
        points: [normPt],
        isComplete: true,
        timestamp: fillStroke.timestamp,
      });
      return;
    }

    isDrawingRef.current = true;
    const newStroke = DrawingService.createStroke(
      `draw-${gameState.id}`,
      currentUser.id,
      currentTool,
      currentTool === 'eraser' ? '#fbf8f1' : currentColor,
      strokeWidth,
      normPt
    );
    currentStrokeRef.current = newStroke;

    const ctx = canvas.getContext('2d');
    if (ctx) {
      const pxX = normPt.x * canvas.width;
      const pxY = normPt.y * canvas.height;
      const rect = canvas.getBoundingClientRect();
      const dprScale = canvas.width / (rect.width || 1);
      ctx.save();
      ctx.fillStyle = newStroke.color;
      ctx.beginPath();
      ctx.arc(pxX, pxY, Math.max(1.5, (newStroke.width * dprScale) / 2), 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();
    }
  };

  const handlePointerMove = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (!isDrawingRef.current || !currentStrokeRef.current || !isCurrentDrawer) return;

    const normPt = getCoordinates(e);
    if (!normPt) return;

    const stroke = currentStrokeRef.current;
    const pts = stroke.points;
    const prevPt = pts[pts.length - 1];

    const dx = normPt.x - prevPt.x;
    const dy = normPt.y - prevPt.y;
    if (dx * dx + dy * dy < 0.000001) return;

    pts.push(normPt);

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        // Fast incremental O(1) line drawing for instant realtime response
        const rect = canvas.getBoundingClientRect();
        const dprScale = canvas.width / (rect.width || 1);
        ctx.save();
        ctx.lineCap = 'round';
        ctx.lineJoin = 'round';
        if (stroke.tool === 'eraser') {
          ctx.strokeStyle = '#fbf8f1';
          ctx.lineWidth = stroke.width * 2 * dprScale;
        } else if (stroke.tool === 'marker') {
          ctx.globalAlpha = 0.5;
          ctx.strokeStyle = stroke.color;
          ctx.lineWidth = stroke.width * 2.5 * dprScale;
        } else {
          ctx.strokeStyle = stroke.color;
          ctx.lineWidth = stroke.width * dprScale;
        }

        ctx.beginPath();
        ctx.moveTo(prevPt.x * canvas.width, prevPt.y * canvas.height);
        ctx.lineTo(normPt.x * canvas.width, normPt.y * canvas.height);
        ctx.stroke();
        ctx.restore();
      }
    }

    // Stream live stroke to spectators (throttled to 35ms)
    const now = Date.now();
    if (now - lastBroadcastRef.current > 35) {
      lastBroadcastRef.current = now;
      channel.broadcast('STROKE_LIVE_UPDATE', currentUser.id, {
        stroke,
      });
    }
  };

  const handlePointerUp = (e?: React.PointerEvent<HTMLCanvasElement>) => {
    if (e) {
      try {
        e.currentTarget.releasePointerCapture(e.pointerId);
      } catch {
        // ignore
      }
    }

    if (!isDrawingRef.current || !currentStrokeRef.current || !isCurrentDrawer) return;

    isDrawingRef.current = false;
    const completedStroke = currentStrokeRef.current;
    currentStrokeRef.current = null;

    const canvas = canvasRef.current;
    if (canvas) {
      const ctx = canvas.getContext('2d');
      if (ctx) {
        DrawingService.renderStroke(ctx, completedStroke, canvas.width, canvas.height);
      }
    }

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

    backend.drawStroke({
      strokeId: completedStroke.id,
      tool: completedStroke.tool === 'eraser' ? 'eraser' : 'pencil',
      color: completedStroke.color,
      width: completedStroke.width,
      points: completedStroke.points,
      isComplete: true,
      timestamp: completedStroke.timestamp,
    });
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
    SoundService.playClick();
    backend.drawClear();
  };

  const handleGuessSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (isCurrentDrawer || !guessInput.trim()) return;
    SoundService.playClick();
    backend.submitGuess(guessInput.trim());
    setGuessInput('');
  };

  const handleUndo = () => {
    if (!isCurrentDrawer || strokes.length === 0) return;
    SoundService.playClick();
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
        DrawingService.renderStroke(ctx, restored, canvas.width, canvas.height);
      }
    }

    channel.broadcast('DRAWING_STROKE', currentUser.id, {
      drawingId: restored.drawingId,
      stroke: restored,
    });
  };

  const minutes = Math.floor(remainingSeconds / 60);
  const seconds = remainingSeconds % 60;
  const formattedTimer = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

  // Active online players with real-time reactive filtering
  const activePlayers = gameState.players.filter((p) => p.isOnline !== false);
  const rosterPlayers: Player[] =
    activePlayers.length > 0 ? activePlayers : (gameState.players.length > 0 ? gameState.players : [currentUser]);

  const totalTurns = Math.max(rosterPlayers.length, gameState.evidenceCards?.length || 4, gameState.turnIndex + 1);
  const roundDisplay = `Turn ${gameState.turnIndex + 1} of ${totalTurns}`;

  return (
    <div className="relative min-h-screen w-full bg-[#07080d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-30 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/90 via-[#08090d]/80 to-[#08090d]/95 pointer-events-none" />

      {/* 1. UNIFIED IN-GAME TOPBAR */}
      <GameHeader
        currentUser={currentUser}
        roomCode={roomCode || gameState.roomId.substring(0, 6).toUpperCase()}
        playerCount={rosterPlayers.length}
        maxPlayers={8}
        currentPhase={gameState.status}
        caseTitle={gameState.currentCase?.title || 'Active Investigation'}
        roundText={`${roundDisplay} • Drawing Round`}
        onLeaveRoom={onLeaveRoom}
      />

      {/* 2. MAIN 3-COLUMN INVESTIGATION WORKSPACE */}
      <main className="relative z-10 w-full max-w-[1720px] mx-auto px-3 sm:px-5 py-3 grid grid-cols-1 lg:grid-cols-12 gap-3.5 items-start">
        {/* ======================================================== */}
        {/* LEFT COLUMN: ACTIVE DETECTIVES ROSTER & CASE DOSSIER     */}
        {/* ======================================================== */}
        <div className="lg:col-span-3 xl:col-span-3 flex flex-col gap-3">
          {/* DETECTIVES ROSTER (UPDATES IN REAL TIME) */}
          <div className="bg-[#0e1320]/95 border border-slate-700/80 rounded-2xl p-3.5 shadow-xl backdrop-blur-md space-y-2.5">
            <div className="flex items-center justify-between border-b border-slate-800/80 pb-2">
              <div className="flex items-center gap-2">
                <Users className="w-4 h-4 text-sky-400" />
                <span className="text-xs font-mono font-bold uppercase tracking-wider text-slate-200">
                  Detectives ({rosterPlayers.length}/8)
                </span>
              </div>
              <span className="text-[10px] font-mono text-emerald-400 bg-emerald-950/70 border border-emerald-500/40 px-2 py-0.5 rounded-full flex items-center gap-1 font-semibold">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse" /> LIVE
              </span>
            </div>

            {/* Players list */}
            <div className="space-y-1.5">
              {rosterPlayers.map((p) => {
                const isDrawing = p.id === gameState.currentTurnPlayerId;
                const hasSolved = gameState.evidenceCards.some((e) => e.sourcePlayerId === p.id);
                const isMe = p.id === currentUser.id;

                return (
                  <div
                    key={p.id}
                    className={`flex items-center justify-between p-2 rounded-xl border transition-all ${
                      isDrawing
                        ? 'bg-red-950/40 border-red-500/70 shadow-[0_0_12px_rgba(220,38,38,0.25)]'
                        : hasSolved
                        ? 'bg-emerald-950/30 border-emerald-500/60'
                        : 'bg-slate-900/60 border-slate-800'
                    }`}
                  >
                    <div className="flex items-center gap-2 min-w-0">
                      <div className="w-7 h-7 rounded-full bg-slate-800 border border-slate-700 flex items-center justify-center text-xs shrink-0">
                        <AvatarBadge avatar={p.avatar} size="xs" />
                      </div>
                      <div className="flex flex-col min-w-0">
                        <div className="flex items-center gap-1 min-w-0">
                          <span className={`text-xs font-bold truncate ${isMe ? 'text-amber-300' : 'text-white'}`}>
                            {p.nickname} {isMe && '(You)'}
                          </span>
                          {p.isHost && <span className="text-amber-400 text-xs" title="Room Host">👑</span>}
                        </div>
                        <span className="text-[10px] font-mono text-slate-400">
                          {p.score || 0} pts
                        </span>
                      </div>
                    </div>

                    <div className="shrink-0">
                      {isDrawing ? (
                        <span className="px-2 py-0.5 rounded-full text-[9px] font-mono font-bold uppercase bg-red-600 text-white shadow flex items-center gap-1">
                          <Pencil className="w-2.5 h-2.5 animate-bounce" /> Drawing
                        </span>
                      ) : hasSolved ? (
                        <span className="px-2 py-0.5 rounded-full text-[9px] font-mono font-bold uppercase bg-emerald-500/20 border border-emerald-500/60 text-emerald-300">
                          ✓ Solved
                        </span>
                      ) : (
                        <span className="px-2 py-0.5 rounded-full text-[9px] font-mono text-slate-400 bg-slate-950 border border-slate-800">
                          Guessing
                        </span>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          {/* CASE DOSSIER & QUICK RULES (COMPACT NOIR CARD) */}
          <div className="bg-[#0e1320]/90 border border-slate-800 rounded-2xl p-3.5 shadow-lg backdrop-blur-md space-y-2">
            <div className="flex items-center gap-2 text-xs font-mono font-bold uppercase text-amber-400">
              <Sparkles className="w-3.5 h-3.5 text-amber-400" />
              <span>Case File Dossier</span>
            </div>
            <div className="text-sm font-serif font-bold text-white leading-snug">
              {gameState.currentCase?.title || 'The Midnight Museum Heist'}
            </div>
            <div className="text-[11px] text-slate-300 font-sans leading-relaxed pt-1 border-t border-slate-800/80">
              🎯 <strong>Golden Rule:</strong> Guessing any 2 matching words in the secret clue scores points for both you and the sketch artist!
            </div>
          </div>
        </div>

        {/* ======================================================== */}
        {/* CENTER COLUMN: DRAWING CANVAS & CONTROLS (6 cols)         */}
        {/* ======================================================== */}
        <div className="lg:col-span-6 xl:col-span-6 flex flex-col gap-2.5">
          {/* 1. UNIFIED CLUE & ACTIVE TIMER RIBBON */}
          {isCurrentDrawer ? (
            <div className="w-full bg-gradient-to-r from-red-950/90 via-[#191118] to-red-950/90 border-2 border-red-500/70 rounded-2xl p-3 shadow-[0_0_30px_rgba(220,38,38,0.25)] flex items-center justify-between gap-3">
              <div className="min-w-0">
                <div className="flex items-center gap-2 mb-0.5">
                  <span className="px-2 py-0.5 rounded-md bg-red-600 text-white text-[10px] font-mono font-black uppercase tracking-wider">
                    ✏️ YOUR SECRET CLUE
                  </span>
                  <span className="text-[11px] font-mono text-slate-400">
                    {roundDisplay}
                  </span>
                </div>
                <div className="text-xl sm:text-2xl font-black text-amber-300 font-serif tracking-wide uppercase truncate">
                  {cleanTarget || 'Mystery Clue'}
                </div>
                <div className="text-[11px] text-slate-300 font-sans">
                  Draw this clue on the parchment below so other detectives can identify it!
                </div>
              </div>

              {/* Glowing Timer Capsule */}
              <div className="text-right shrink-0 flex flex-col items-end">
                <span className="text-[9px] uppercase tracking-widest font-mono text-slate-400">Time Left</span>
                <div className={`px-3 py-1 rounded-xl border font-mono text-xl sm:text-2xl font-black tabular-nums transition-all ${
                  remainingSeconds <= 10
                    ? 'bg-red-950/90 border-red-500 text-red-400 animate-pulse shadow-[0_0_15px_rgba(239,68,68,0.6)]'
                    : remainingSeconds <= 25
                    ? 'bg-amber-950/70 border-amber-500/70 text-amber-300'
                    : 'bg-slate-900/90 border-slate-700 text-emerald-400'
                }`}>
                  {formattedTimer}
                </div>
              </div>
            </div>
          ) : (
            <div className="w-full bg-gradient-to-r from-amber-950/50 via-[#111624] to-sky-950/60 border-2 border-amber-500/50 rounded-2xl p-3 shadow-xl flex items-center justify-between gap-3">
              <div className="min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span className="px-2 py-0.5 rounded-md bg-amber-500/20 border border-amber-500/60 text-amber-300 text-[10px] font-mono font-black uppercase tracking-wider">
                    🔍 GUESS THE CLUE
                  </span>
                  <span className="text-xs text-slate-300 font-semibold truncate">
                    <strong>{currentDrawer?.nickname || 'Detective'}</strong> is drawing
                  </span>
                </div>

                <div className="flex items-center gap-3 my-1">
                  {renderLetterPattern()}
                </div>

                <div className="text-[11px] font-mono text-amber-200">
                  {guesserHintMessage}
                </div>
              </div>

              {/* Glowing Timer Capsule */}
              <div className="text-right shrink-0 flex flex-col items-end">
                <span className="text-[9px] uppercase tracking-widest font-mono text-slate-400">Time Left</span>
                <div className={`px-3 py-1 rounded-xl border font-mono text-xl sm:text-2xl font-black tabular-nums transition-all ${
                  remainingSeconds <= 10
                    ? 'bg-red-950/90 border-red-500 text-red-400 animate-pulse shadow-[0_0_15px_rgba(239,68,68,0.6)]'
                    : remainingSeconds <= 25
                    ? 'bg-amber-950/70 border-amber-500/70 text-amber-300'
                    : 'bg-slate-900/90 border-slate-700 text-emerald-400'
                }`}>
                  {formattedTimer}
                </div>
              </div>
            </div>
          )}

          {/* 2. DEDICATED DRAWER TOOLBAR */}
          {isCurrentDrawer && (
            <div className="w-full bg-[#0d121e]/95 backdrop-blur-md border border-slate-700/80 rounded-2xl p-2 sm:p-2.5 shadow-xl flex flex-wrap items-center justify-between gap-2">
              {/* Tool switch: Pencil vs Fill vs Eraser */}
              <div className="flex items-center gap-1 bg-slate-900/90 p-1 rounded-xl border border-slate-800">
                <button
                  type="button"
                  onClick={() => {
                    setCurrentTool('pencil');
                    if (currentColor === '#fbf8f1') setCurrentColor('#111827');
                  }}
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-semibold transition-all ${
                    currentTool === 'pencil' ? 'bg-red-600 text-white shadow-[0_0_10px_rgba(220,38,38,0.7)]' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Pencil className="w-3.5 h-3.5" />
                  <span className="text-xs">Draw</span>
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setCurrentTool('fill');
                    if (currentColor === '#fbf8f1') setCurrentColor('#111827');
                  }}
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-semibold transition-all ${
                    currentTool === 'fill' ? 'bg-red-600 text-white shadow-[0_0_10px_rgba(220,38,38,0.7)]' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <PaintBucket className="w-3.5 h-3.5" />
                  <span className="text-xs">Fill</span>
                </button>
                <button
                  type="button"
                  onClick={() => setCurrentTool('eraser')}
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-semibold transition-all ${
                    currentTool === 'eraser' ? 'bg-red-600 text-white shadow' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  <Eraser className="w-3.5 h-3.5" />
                  <span className="text-xs">Eraser</span>
                </button>
              </div>

              {/* Color palette swatches */}
              <div className="flex items-center gap-1.5 bg-slate-900/90 px-2.5 py-1.5 rounded-xl border border-slate-800">
                {PALETTE_COLORS.map((color) => {
                  const isSelected = currentColor.toLowerCase() === color.toLowerCase() && currentTool !== 'eraser';
                  return (
                    <button
                      key={color}
                      type="button"
                      onClick={() => {
                        setCurrentColor(color);
                        if (currentTool === 'eraser') setCurrentTool('pencil');
                      }}
                      style={{ backgroundColor: color }}
                      className={`w-6 h-6 rounded-full border transition-all ${
                        isSelected ? 'scale-125 ring-2 ring-red-500 border-white shadow-lg' : 'border-slate-500 hover:scale-110 opacity-85'
                      }`}
                    />
                  );
                })}
              </div>

              {/* Brush size slider */}
              <div className="flex items-center gap-1.5 bg-slate-900/90 px-2 py-1.5 rounded-xl border border-slate-800">
                <span className="text-[10px] font-mono text-slate-400">Size</span>
                <input
                  type="range"
                  min="2"
                  max="20"
                  value={strokeWidth}
                  onChange={(e) => setStrokeWidth(Number(e.target.value))}
                  className="w-16 sm:w-20 accent-red-600 cursor-pointer h-1.5 bg-slate-700 rounded-lg"
                />
              </div>

              {/* Undo, Redo & Clear */}
              <div className="flex items-center gap-1.5 ml-auto">
                <button
                  type="button"
                  onClick={handleUndo}
                  disabled={strokes.length === 0}
                  title="Undo"
                  className="p-2 rounded-xl bg-slate-900 border border-slate-700 text-slate-300 hover:text-white disabled:opacity-30 transition-colors"
                >
                  <RotateCcw className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  onClick={handleRedo}
                  disabled={redoStack.length === 0}
                  title="Redo"
                  className="p-2 rounded-xl bg-slate-900 border border-slate-700 text-slate-300 hover:text-white disabled:opacity-30 transition-colors"
                >
                  <RotateCw className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  onClick={handleClear}
                  disabled={strokes.length === 0}
                  className="px-2.5 py-1.5 rounded-xl bg-slate-900 hover:bg-red-950/60 border border-slate-700 hover:border-red-600/60 text-slate-300 hover:text-red-300 text-xs font-semibold flex items-center gap-1 transition-all disabled:opacity-30"
                >
                  <Trash2 className="w-3.5 h-3.5" />
                  <span>Clear</span>
                </button>
              </div>
            </div>
          )}

          {/* 3. PARCHMENT DRAWING CANVAS */}
          <div
            className="relative w-full aspect-[4/3] sm:aspect-[16/10] max-h-[64vh] min-h-[290px] sm:min-h-[400px] md:min-h-[480px] lg:min-h-[520px] bg-[#fbf8f1] rounded-2xl shadow-[0_0_0_1px_rgba(239,68,68,0.18),0_20px_50px_rgba(0,0,0,0.45)] border-2 border-slate-600 overflow-hidden flex flex-col"
            style={{ touchAction: 'none' }}
          >
            {/* Header Sub-bar */}
            <div className="flex-shrink-0 h-7 bg-gradient-to-r from-[#121722]/95 via-[#202838]/90 to-[#121722]/95 border-b border-slate-600/80 flex items-center justify-between px-3 select-none">
              <span className="text-[9px] font-mono font-bold tracking-[0.18em] uppercase text-slate-300">Evidence Canvas</span>
              <span className={`text-[9px] font-mono font-bold uppercase ${isCurrentDrawer ? 'text-red-400' : 'text-sky-300'}`}>
                {isCurrentDrawer ? '● Input Enabled' : '◉ Live Spectator Stream'}
              </span>
            </div>

            {/* Drawing Canvas Area */}
            <div
              ref={canvasContainerRef}
              className="flex-1 w-full min-h-0 relative overflow-hidden bg-[#fbf8f1]"
              style={{ touchAction: 'none' }}
            >
              <canvas
                ref={canvasRef}
                style={{
                  touchAction: 'none',
                  display: 'block',
                  width: '100%',
                  height: '100%',
                }}
                onPointerDown={handlePointerDown}
                onPointerMove={handlePointerMove}
                onPointerUp={handlePointerUp}
                onPointerCancel={handlePointerUp}
                onPointerLeave={handlePointerUp}
                className={`w-full h-full block select-none ${
                  isCurrentDrawer
                    ? currentTool === 'fill'
                      ? 'cursor-cell pointer-events-auto'
                      : 'cursor-crosshair pointer-events-auto'
                    : 'cursor-default pointer-events-none'
                }`}
              />
            </div>
          </div>

          {/* 4. GUESSER CONSOLE & LIVE GUESS STREAM */}
          <div className="w-full rounded-2xl border border-sky-500/50 bg-[#0d1322]/95 backdrop-blur-md p-3 shadow-2xl space-y-2">
            {!isCurrentDrawer ? (
              <>
                <div className="flex items-center justify-between gap-2">
                  <div className="flex items-center gap-1.5 text-xs font-mono font-bold uppercase tracking-wider text-sky-300">
                    <Crosshair className="w-3.5 h-3.5 text-sky-400" />
                    <span>Type Your Guess</span>
                  </div>
                  <span className="text-[10px] text-amber-300 font-semibold bg-amber-950/60 border border-amber-500/40 px-2 py-0.5 rounded-full">
                    Any 2 matching words = Right Answer!
                  </span>
                </div>

                <form onSubmit={handleGuessSubmit} className="flex gap-2">
                  <input
                    type="text"
                    value={guessInput}
                    onChange={(e) => setGuessInput(e.target.value)}
                    placeholder="Type 2-3 words (e.g. tunnel map, guard sleeping)..."
                    className="min-w-0 flex-1 px-3.5 py-2.5 bg-slate-950 border border-slate-600 focus:border-sky-400 rounded-xl text-sm text-white placeholder-slate-500 focus:outline-none focus:ring-1 focus:ring-sky-400 font-sans shadow-inner"
                  />
                  <button
                    type="submit"
                    disabled={!guessInput.trim()}
                    className="px-4 sm:px-6 py-2.5 bg-gradient-to-r from-sky-600 to-blue-600 hover:from-sky-500 hover:to-blue-500 disabled:opacity-40 text-white rounded-xl text-xs font-bold uppercase tracking-wider shadow-lg transition-all cursor-pointer"
                  >
                    Guess
                  </button>
                </form>
              </>
            ) : (
              <div className="flex items-center justify-between gap-2 px-3 py-1.5 rounded-xl bg-amber-500/10 border border-amber-500/30 text-amber-300 text-xs font-mono">
                <div className="flex items-center gap-2">
                  <Sparkles className="w-4 h-4 text-amber-400 animate-pulse shrink-0" />
                  <span className="font-bold">You are Sketching! Detective guesses appear live below:</span>
                </div>
              </div>
            )}

            {guessFeedback && (
              <div className="p-2 rounded-xl text-xs font-bold text-amber-200 bg-amber-950/80 border border-amber-500/80 flex items-center justify-between animate-fadeIn">
                <div className="flex items-center gap-2">
                  <Lightbulb className="w-4 h-4 text-amber-400 shrink-0" />
                  <span>{guessFeedback}</span>
                </div>
              </div>
            )}

            {/* Recent Live Guesses Stream */}
            <div className="pt-1 border-t border-slate-800/80">
              <div className="text-[10px] font-mono text-slate-400 mb-1.5 flex items-center justify-between">
                <span>Recent Live Guesses:</span>
                {isCurrentDrawer && <span className="text-[9px] text-amber-400 font-bold uppercase">Drawer Monitoring</span>}
              </div>
              <div className="flex flex-wrap gap-1.5 max-h-16 overflow-y-auto pr-1">
                {guessFeed.length === 0 ? (
                  <span className="text-[11px] text-slate-500 italic">
                    {isCurrentDrawer ? 'Waiting for investigators to type guesses...' : 'No guesses yet. Be the first to guess!'}
                  </span>
                ) : (
                  guessFeed.slice(-6).map((g, idx) => (
                    <span
                      key={idx}
                      className={`px-2 py-1 rounded-lg text-[11px] flex items-center gap-1.5 ${
                        g.isCorrect
                          ? 'bg-emerald-950/90 border border-emerald-500 text-emerald-200 font-bold animate-bounce'
                          : g.isClose
                          ? 'bg-amber-950/80 border border-amber-500/70 text-amber-200 font-medium'
                          : 'bg-slate-900 border border-slate-700 text-slate-300'
                      }`}
                    >
                      <span className="font-bold text-white">{g.playerName}:</span>
                      <span>{g.text}</span>
                      {g.isClose && <span className="text-amber-400 text-[9px] font-bold">★ CLOSE</span>}
                      {g.isCorrect && <span className="text-emerald-400 text-[9px] font-bold">✓ SOLVED</span>}
                    </span>
                  ))
                )}
              </div>
            </div>
          </div>
        </div>

        {/* ======================================================== */}
        {/* RIGHT COLUMN: ROOM CHAT & GAME LOG                       */}
        {/* ======================================================== */}
        <div className="lg:col-span-3 xl:col-span-3 flex flex-col gap-3">
          <div className="w-full">
            <RoomChat
              currentUser={currentUser}
              channel={channel}
              showTabs={true}
              defaultTab="Room Chat"
              className="min-h-[480px]"
            />
          </div>
        </div>
      </main>

      {/* FOOTER */}
      <footer className="relative z-10 w-full max-w-[1720px] mx-auto px-4 sm:px-6 py-2 text-center text-[11px] font-mono text-slate-500">
        INKBOUND • {roundDisplay} • Case: {gameState.currentCase?.title || 'Active Investigation'}
      </footer>
    </div>
  );
};
