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
  MessageSquare,
  BookOpen,
  Clock,
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
  drawerPrompt?: string | null;
  secretDrawHint?: string | null;
  publicHint?: string | null;
  publicWordLengths?: number[] | null;
  publicFirstLetters?: string[] | null;
  storyContext?: string | null;
  investigationObjective?: string | null;
  clueHint?: string | null;
  revealedLetters?: Array<Array<string | null>> | null;
  roomCode?: string;
  channel: RoomChannelManager;
  isDrawer?: boolean;
  gameWindowSync?: {
    arrivedCount: number;
    totalCount: number;
    waitingFor: string[];
    allArrived: boolean;
  };
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
  drawerPrompt,
  secretDrawHint,
  publicHint,
  publicWordLengths,
  publicFirstLetters,
  storyContext,
  investigationObjective,
  clueHint,
  revealedLetters,
  roomCode,
  channel,
  isDrawer: propIsDrawer,
  gameWindowSync,
  onLeaveRoom,
}) => {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const canvasContainerRef = useRef<HTMLDivElement | null>(null);
  const isDrawingRef = useRef<boolean>(false);
  const currentStrokeRef = useRef<Stroke | null>(null);
  const liveBufferPtsRef = useRef<Point[]>([]);
  const activeSpectatorStrokeRef = useRef<{ strokeId: string; lastPoint: Point } | null>(null);

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

  // Mobile layout active tab state (< lg)
  const [mobileTab, setMobileTab] = useState<'chat' | 'detectives'>('chat');

  const [kickVotes, setKickVotes] = useState<
    Record<string, { currentVotes: number; requiredVotes: number; voterIds: string[] }>
  >({});

  const backend = BackendClient.getInstance();
  const myBackendId = backend.getPlayerId();
  const currentDrawer = gameState.players.find((p) => p.id === gameState.currentTurnPlayerId);

  useEffect(() => {
    const unsubVoteKick = backend.on('VOTE_KICK_UPDATE', (payload: any) => {
      if (payload?.targetPlayerId) {
        setKickVotes((prev) => ({
          ...prev,
          [payload.targetPlayerId]: {
            currentVotes: payload.currentVotes,
            requiredVotes: payload.requiredVotes,
            voterIds: payload.voterIds || [],
          },
        }));
      }
    });

    const unsubPlayerKicked = backend.on('PLAYER_KICKED', (payload: any) => {
      if (payload?.targetPlayerId) {
        setKickVotes((prev) => {
          const next = { ...prev };
          delete next[payload.targetPlayerId];
          return next;
        });
      }
    });

    return () => {
      unsubVoteKick();
      unsubPlayerKicked();
    };
  }, [backend]);

  // Strict authoritative drawer check: ID match or backend ID match
  const isCurrentDrawer = Boolean(
    propIsDrawer ||
    (gameState.currentTurnPlayerId && currentUser?.id && gameState.currentTurnPlayerId === currentUser.id) ||
    (gameState.currentTurnPlayerId && myBackendId && gameState.currentTurnPlayerId === myBackendId)
  );

  // Active drawer watchdog: If I am the active drawer and secretDrawObjective is missing, request it
  useEffect(() => {
    if (isCurrentDrawer && !secretDrawObjective) {
      backend.requestSecretObjective();
    }
  }, [isCurrentDrawer, secretDrawObjective, gameState.turnIndex, backend]);

  // Reset canvas, strokes, and guess feed whenever turn advances
  useEffect(() => {
    setStrokes([]);
    setRedoStack([]);
    setGuessFeed([]);
    setGuessFeedback(null);
    setGuessInput('');
    activeSpectatorStrokeRef.current = null;
    liveBufferPtsRef.current = [];
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

  const cleanTarget =
    cleanClueToTwoWords(secretDrawObjective) || (secretDrawObjective ? secretDrawObjective.trim() : '');
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

  const effectiveClueHint = clueHint || (publicHint && publicHint !== dynamicCategory && !publicHint.toLowerCase().includes('category') ? publicHint : null);

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
    return null;
  })();

  const renderLetterPattern = () => {
    const lengths = (publicWordLengths && publicWordLengths.length > 0)
      ? publicWordLengths
      : (targetWords.length > 0 ? targetWords.map((w) => w.length) : (effectiveFirstLetters.length >= 2 ? [effectiveFirstLetters[0].length + 4, effectiveFirstLetters[1].length + 5] : [5, 7]));

    return (
      <div className="flex flex-wrap items-center gap-3 my-1.5">
        {lengths.map((len, wIdx) => {
          const dashes = Array.from({ length: len }).map((_, cIdx) => {
            // Check if server sent revealed letter for this word and char index
            const serverChar = revealedLetters && revealedLetters[wIdx] ? revealedLetters[wIdx][cIdx] : null;

            // Client-side dynamic reveal fallback (e.g. if targetWords known for drawer or local dev)
            let clientChar: string | null = null;
            if (!serverChar) {
              if (targetWords[wIdx] && targetWords[wIdx][cIdx]) {
                const char = targetWords[wIdx][cIdx].toUpperCase();
                const L = targetWords[wIdx].length;
                if (cIdx === 0 && ((wIdx === 0 && elapsed >= 10) || (wIdx === 1 && elapsed >= 25))) {
                  clientChar = char;
                } else if (L >= 4 && cIdx === Math.floor(L / 2) && elapsed >= totalSec * 0.5) {
                  clientChar = char;
                } else if (L >= 6 && cIdx === L - 1 && elapsed >= totalSec * 0.75) {
                  clientChar = char;
                } else if (L >= 8 && cIdx === 2 && elapsed >= totalSec * 0.85) {
                  clientChar = char;
                }
              } else {
                // If only first letters array known
                if (cIdx === 0 && ((wIdx === 0 && elapsed >= 10) || (wIdx === 1 && elapsed >= 25))) {
                  clientChar = effectiveFirstLetters[wIdx] || null;
                }
              }
            }

            const charToShow = serverChar || clientChar;
            const isRevealed = Boolean(charToShow);

            return (
              <span
                key={cIdx}
                className={`inline-block border-b-2 sm:border-b-[3px] ${
                  isRevealed
                    ? 'border-emerald-700 text-emerald-800 bg-emerald-100/90 font-black rounded-t-sm shadow-xs'
                    : 'border-[#4a3424] text-[#1f150d] font-bold'
                } w-3.5 sm:w-4 text-center mx-0.5 font-mono text-base sm:text-lg transition-all`}
              >
                {isRevealed ? charToShow : '\u00A0'}
              </span>
            );
          });
          return (
            <span key={wIdx} className="inline-flex items-end">
              {dashes}
              <span className="text-[10px] text-[#7a6047] font-mono font-semibold ml-1">({len})</span>
            </span>
          );
        })}
      </div>
    );
  };

  // Authoritative timer: starts ONLY when turnEndsAt is set by server, frozen at turnDuration while staging
  const turnDuration = gameState.turnDuration || 80;
  const turnStartedAtRef = useRef<number>(Date.now());
  const isRoundActive = Boolean(
    gameState.turnEndsAt && TurnManager.calculateRemainingSeconds(gameState.turnEndsAt) > 0
  );

  // Notify backend immediately when detective enters the game window
  useEffect(() => {
    backend.enterGameWindow();
  }, []);

  useEffect(() => {
    turnStartedAtRef.current = Date.now();
  }, [gameState.turnIndex, gameState.currentTurnPlayerId]);

  useEffect(() => {
    const updateTimer = () => {
      let rem = 0;
      if (gameState.turnEndsAt) {
        rem = TurnManager.calculateRemainingSeconds(gameState.turnEndsAt);
      } else {
        // If turn has not officially started by server, hold at full turn duration (no phantom countdown)
        rem = turnDuration;
      }

      setRemainingSeconds(rem);
      if (gameState.turnEndsAt && rem > 0 && rem <= 10) {
        SoundService.playTick(rem <= 5);
      }
    };

    updateTimer();
    const interval = setInterval(updateTimer, 1000);
    return () => clearInterval(interval);
  }, [gameState.turnEndsAt, gameState.turnIndex, turnDuration]);

  // Subscribe to backend authoritative drawing and guess events
  useEffect(() => {
    const unsubLiveUpdate = backend.on('DRAW_LIVE_UPDATE', (payload: any) => {
      if (isCurrentDrawer) return;
      const canvas = canvasRef.current;
      if (!canvas || !payload?.points || payload.points.length === 0) return;

      const ctx = canvas.getContext('2d');
      if (!ctx) return;

      const rect = canvas.getBoundingClientRect();
      const dprScale = canvas.width / (rect.width || 1);

      ctx.save();
      ctx.lineCap = 'round';
      ctx.lineJoin = 'round';

      if (payload.tool === 'eraser') {
        ctx.strokeStyle = '#fbf8f1';
        ctx.fillStyle = '#fbf8f1';
        ctx.lineWidth = (payload.width || 4) * 2 * dprScale;
      } else if (payload.tool === 'marker') {
        ctx.globalAlpha = 0.5;
        ctx.strokeStyle = payload.color || '#111827';
        ctx.fillStyle = payload.color || '#111827';
        ctx.lineWidth = (payload.width || 4) * 2.5 * dprScale;
      } else {
        ctx.strokeStyle = payload.color || '#111827';
        ctx.fillStyle = payload.color || '#111827';
        ctx.lineWidth = (payload.width || 4) * dprScale;
      }

      const pts = payload.points;
      if (payload.isStart && pts.length === 1) {
        const px = pts[0].x * canvas.width;
        const py = pts[0].y * canvas.height;
        ctx.beginPath();
        ctx.arc(px, py, Math.max(1.5, ((payload.width || 4) * dprScale) / 2), 0, Math.PI * 2);
        ctx.fill();
        activeSpectatorStrokeRef.current = { strokeId: payload.strokeId, lastPoint: pts[0] };
      } else if (pts.length > 0) {
        ctx.beginPath();
        const activeTrack = activeSpectatorStrokeRef.current;
        const startPt =
          activeTrack && activeTrack.strokeId === payload.strokeId && activeTrack.lastPoint
            ? activeTrack.lastPoint
            : pts[0];

        ctx.moveTo(startPt.x * canvas.width, startPt.y * canvas.height);
        for (let i = 0; i < pts.length; i++) {
          ctx.lineTo(pts[i].x * canvas.width, pts[i].y * canvas.height);
        }
        ctx.stroke();
        activeSpectatorStrokeRef.current = {
          strokeId: payload.strokeId,
          lastPoint: pts[pts.length - 1],
        };
      }
      ctx.restore();
    });

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
      activeSpectatorStrokeRef.current = null;
      DrawingService.renderStroke(ctx, strokeObj, canvas.width, canvas.height);
    });

    const unsubUndo = backend.on('DRAW_UNDO', (payload: any) => {
      if (isCurrentDrawer) return;
      const updated = payload?.strokes || [];
      setStrokes(updated);
      activeSpectatorStrokeRef.current = null;
      const canvas = canvasRef.current;
      if (canvas) {
        const ctx = canvas.getContext('2d');
        if (ctx) {
          ctx.fillStyle = '#fbf8f1';
          ctx.fillRect(0, 0, canvas.width, canvas.height);
          DrawingService.replayStrokes(ctx, canvas.width, canvas.height, updated);
        }
      }
    });

    const unsubClear = backend.on('DRAW_CLEAR', () => {
      if (isCurrentDrawer) return;
      setStrokes([]);
      activeSpectatorStrokeRef.current = null;
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
      unsubLiveUpdate();
      unsubStroke();
      unsubUndo();
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
    liveBufferPtsRef.current = [normPt];
    lastBroadcastRef.current = Date.now();

    // Stream initial stroke start immediately to spectators over WebSocket (<10ms)
    backend.drawLiveUpdate({
      strokeId: newStroke.id,
      tool: newStroke.tool,
      color: newStroke.color,
      width: newStroke.width,
      points: [normPt],
      isStart: true,
      isComplete: false,
      timestamp: Date.now(),
    });

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
    liveBufferPtsRef.current.push(normPt);

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

    // Stream live stroke to spectators with ultra-low latency (25ms batching, ~40 FPS)
    const now = Date.now();
    if (now - lastBroadcastRef.current >= 25 && liveBufferPtsRef.current.length > 1) {
      lastBroadcastRef.current = now;
      const batch = [...liveBufferPtsRef.current];
      // Keep last point as anchor for the next chunk to ensure connected lines
      liveBufferPtsRef.current = [normPt];

      backend.drawLiveUpdate({
        strokeId: stroke.id,
        tool: stroke.tool,
        color: stroke.color,
        width: stroke.width,
        points: batch,
        isStart: false,
        isComplete: false,
        timestamp: now,
      });

      // Redundant fallback broadcast
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

    // Flush any remaining buffered points
    if (liveBufferPtsRef.current.length > 1) {
      backend.drawLiveUpdate({
        strokeId: completedStroke.id,
        tool: completedStroke.tool,
        color: completedStroke.color,
        width: completedStroke.width,
        points: liveBufferPtsRef.current,
        isStart: false,
        isComplete: true,
        timestamp: Date.now(),
      });
    }
    liveBufferPtsRef.current = [];

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

    backend.drawUndo(previous);
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

    backend.drawStroke({
      strokeId: restored.id,
      tool: restored.tool === 'eraser' ? 'eraser' : 'pencil',
      color: restored.color,
      width: restored.width,
      points: restored.points,
      isComplete: true,
      timestamp: restored.timestamp,
    });

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

  const renderDetectivesRoster = () => (
    <div
      className="relative rounded-2xl border-2 border-[#8c6d48] p-3 sm:p-3.5 shadow-lg overflow-hidden select-none text-[#221711]"
      style={{
        background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
        backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
        backgroundSize: '16px 16px, 100% 100%',
      }}
    >
      <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute -top-1.5 left-5 w-3 h-6 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

      <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-2 mb-2">
        <div className="flex items-center gap-2">
          <Users className="w-4 h-4 text-[#7a4e2d]" />
          <span className="text-xs font-mono font-bold uppercase tracking-wider text-[#1a110a]">
            Detectives ({rosterPlayers.length}/8)
          </span>
        </div>
        <span className="text-[10px] font-mono text-emerald-900 bg-emerald-100 border border-emerald-700/60 px-2 py-0.5 rounded-full flex items-center gap-1 font-bold">
          <span className="w-1.5 h-1.5 rounded-full bg-emerald-600 animate-pulse" /> ON DUTY
        </span>
      </div>

      <div className="space-y-1.5 max-h-[300px] overflow-y-auto pr-0.5">
        {rosterPlayers.map((p) => {
          const isDrawing = p.id === gameState.currentTurnPlayerId;
          const hasSolved = gameState.evidenceCards.some((e) => e.sourcePlayerId === p.id);
          const isMe = p.id === currentUser.id;

          return (
            <div
              key={p.id}
              className={`flex items-center justify-between p-2 rounded-xl border transition-all ${isDrawing
                  ? 'bg-red-100/90 border-red-700/80 shadow-sm'
                  : hasSolved
                    ? 'bg-emerald-100/80 border-emerald-600/70'
                    : 'bg-[#f4ebe0] border-[#cfbea8]'
                }`}
            >
              <div className="flex items-center gap-2 min-w-0">
                <div className="w-7 h-7 rounded-full bg-[#ded0bd] border border-[#a88f72] flex items-center justify-center text-xs shrink-0">
                  <AvatarBadge avatar={p.avatar} size="xs" />
                </div>
                <div className="flex flex-col min-w-0">
                  <div className="flex items-center gap-1 min-w-0">
                    <span className={`text-xs font-bold truncate ${isMe ? 'text-red-900 font-black' : 'text-[#1a110a]'}`}>
                      {p.nickname} {isMe && '(You)'}
                    </span>
                    {p.isHost && <span className="text-amber-700 text-xs" title="Room Host">👑</span>}
                  </div>
                  <span className="text-[10px] font-mono text-[#6e533d] font-semibold">
                    {p.score || 0} pts
                  </span>
                </div>
              </div>

              <div className="shrink-0 flex items-center gap-1.5">
                {!isMe && (() => {
                  const pKick = kickVotes[p.id];
                  const hasVoted = pKick?.voterIds?.includes(currentUser.id);
                  return (
                    <button
                      type="button"
                      onClick={() => {
                        SoundService.playClick();
                        backend.voteKick(p.id);
                      }}
                      className={`px-1.5 py-0.5 rounded text-[8px] font-mono font-bold border transition-all cursor-pointer ${
                        hasVoted
                          ? 'bg-amber-200 text-amber-950 border-amber-600 shadow-xs'
                          : 'bg-[#ded0bd] text-[#543e2d] border-[#bfa98e] hover:bg-red-50 hover:text-red-900'
                      }`}
                      title="Vote to kick (75% majority will automatically dismiss this player)"
                    >
                      ⚖️ {hasVoted ? 'Voted' : 'Vote Kick'}
                      {pKick && pKick.currentVotes > 0 ? ` (${pKick.currentVotes}/${pKick.requiredVotes})` : ''}
                    </button>
                  );
                })()}

                {isDrawing ? (
                  <span className="px-2 py-0.5 rounded-full text-[9px] font-mono font-bold uppercase bg-red-800 text-white shadow flex items-center gap-1">
                    <Pencil className="w-2.5 h-2.5 animate-bounce" /> Sketching
                  </span>
                ) : hasSolved ? (
                  <span className="px-2 py-0.5 rounded-full text-[9px] font-mono font-bold uppercase bg-emerald-200 border border-emerald-700 text-emerald-950">
                    ✓ Solved
                  </span>
                ) : (
                  <span className="px-2 py-0.5 rounded-full text-[9px] font-mono text-[#543e2d] bg-[#ded0bd] border border-[#bfa98e]">
                    Investigating
                  </span>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );

  const renderCaseDossier = () => (
    <div
      className="relative rounded-2xl border-2 border-[#8c6d48] p-3.5 text-[#221711] shadow-lg overflow-hidden select-none"
      style={{
        background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
        backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
        backgroundSize: '16px 16px, 100% 100%',
      }}
    >
      <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute -top-1.5 left-5 w-3 h-6 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

      <div className="flex items-center gap-2 text-xs font-mono font-bold uppercase text-[#7a4e2d] mb-1">
        <Sparkles className="w-3.5 h-3.5 text-amber-700" />
        <span className="tracking-wider">CASE FILE DOSSIER</span>
      </div>
      <div className="text-sm sm:text-base font-serif font-black text-[#1a110a] leading-snug">
        {gameState.currentCase?.title || 'The Midnight Museum Heist'}
      </div>
      <div className="text-[11px] text-[#543e2d] font-mono leading-relaxed pt-2 mt-2 border-t border-[#bfa98e]/70">
        🎯 <strong>Golden Rule:</strong> Guessing any 2 matching words in the secret clue scores points for both you and the sketch artist!
      </div>
    </div>
  );

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

      {/* WAITING FOR ALL DETECTIVES TO ENTER THE ROOM BANNER */}
      {!isRoundActive && (
        <div className="relative z-20 w-full max-w-4xl mx-auto px-4 py-2 animate-fadeIn">
          <div className="bg-slate-900/95 border-2 border-amber-500/60 shadow-[0_10px_35px_rgba(0,0,0,0.85)] backdrop-blur-md rounded-2xl px-5 py-3 flex items-center justify-between gap-4 text-center">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-xl bg-amber-500/20 border border-amber-500/40 flex items-center justify-center shrink-0">
                <Users className="w-5 h-5 text-amber-400 animate-pulse" />
              </div>
              <div className="text-left">
                <div className="text-[10px] font-mono font-bold uppercase tracking-widest text-amber-400 flex items-center gap-2">
                  <span>Staging Case Room</span>
                  <span className="inline-block w-2 h-2 rounded-full bg-amber-400 animate-ping" />
                </div>
                <p className="text-sm font-serif font-bold text-white">
                  Waiting for all detectives to enter... ({gameWindowSync?.arrivedCount || 1}/{gameWindowSync?.totalCount || gameState.players.length} Ready)
                </p>
                {gameWindowSync?.waitingFor && gameWindowSync.waitingFor.length > 0 && (
                  <p className="text-[11px] font-mono text-slate-400">
                    Connecting: {gameWindowSync.waitingFor.join(', ')}
                  </p>
                )}
              </div>
            </div>
            <div className="hidden sm:flex items-center gap-2 px-3 py-1.5 rounded-lg bg-black/60 border border-slate-700 text-xs font-mono text-slate-300">
              <Clock className="w-4 h-4 text-amber-400" />
              <span>Timer starts when all arrive</span>
            </div>
          </div>
        </div>
      )}

      {/* 2. MAIN 3-COLUMN WORKSPACE (MOBILE FIRST) */}
      <main className="relative z-10 w-full max-w-[1720px] mx-auto px-2.5 sm:px-5 py-2 sm:py-3 grid grid-cols-1 lg:grid-cols-12 gap-3 sm:gap-3.5 items-start">
        {/* ======================================================== */}
        {/* DESKTOP LEFT COLUMN: ACTIVE DETECTIVES & DOSSIER (3 cols) */}
        {/* Hidden on mobile, rendered cleanly on desktop            */}
        {/* ======================================================== */}
        <div className="hidden lg:flex lg:col-span-3 xl:col-span-3 flex-col gap-3">
          {renderDetectivesRoster()}
          {renderCaseDossier()}
        </div>

        {/* ======================================================== */}
        {/* CENTER COLUMN: INVESTIGATION PAPER CLUE, CANVAS, CONTROLS */}
        {/* Rendered FIRST on mobile, 6 cols on desktop               */}
        {/* ======================================================== */}
        <div className="col-span-1 lg:col-span-6 xl:col-span-6 flex flex-col gap-2.5">
          {/* 1. MOBILE ULTRA-COMPACT CLUE HEADER (< sm) */}
          <div
            className="sm:hidden relative w-full rounded-2xl border-2 border-[#8c6d48] p-2.5 text-[#221711] shadow-md overflow-hidden select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Top Bar: Act + Category + Clock */}
            <div className="flex items-center justify-between gap-1.5 mb-1.5">
              <div className="flex items-center gap-1.5 flex-wrap min-w-0">
                <span className="px-1.5 py-0.5 rounded text-[9px] font-mono font-black uppercase tracking-wider bg-red-800/10 text-red-800 border border-red-800 shrink-0">
                  {isCurrentDrawer ? '★ SECRET CLUE' : '🔍 CLUE'}
                </span>
                <span className="text-[10px] font-mono text-[#7a6047] font-bold shrink-0">
                  ACT #{gameState.turnIndex + 1}
                </span>
                <span className="text-[9px] font-mono font-bold bg-[#ede0ce] border border-[#bfa98e] px-1.5 py-0.2 rounded truncate max-w-[130px] text-[#443020]">
                  {dynamicCategory}
                </span>
              </div>

              {/* Compact Clock Capsule */}
              <div
                className={`px-2 py-0.5 rounded-lg border font-mono text-sm font-black tabular-nums shrink-0 shadow-xs ${
                  remainingSeconds <= 10
                    ? 'bg-red-900 border-red-700 text-white animate-pulse'
                    : remainingSeconds <= 25
                    ? 'bg-[#3b281c] border-amber-600 text-amber-300'
                    : 'bg-[#221811] border-[#7d5f42] text-amber-200'
                }`}
              >
                ⏱ {formattedTimer}
              </div>
            </div>

            {isCurrentDrawer ? (
              /* Drawer Mobile View */
              <div className="space-y-1">
                <div className="text-xs font-serif font-bold text-[#1a110a] leading-snug break-words">
                  "{drawerPrompt || secretDrawObjective}"
                </div>
                <div className="text-[11px] font-mono text-red-900 font-bold flex items-center gap-1.5">
                  <span>Draw:</span>
                  <span className="underline uppercase tracking-wider font-black">{cleanTarget || 'Unsealing Clue...'}</span>
                </div>
              </div>
            ) : (
              /* Guesser Mobile View: Prominent Skribbl-Style Word Dashes */
              <div className="space-y-1.5">
                <div className="py-0.5 flex justify-center">
                  {renderLetterPattern()}
                </div>

                {/* Sub-bar: Artist & Clue Lead */}
                <div className="flex items-center justify-between gap-1 text-[10px] font-mono text-[#5c4632] flex-wrap">
                  <div>
                    <span>Artist: </span>
                    <strong className="text-[#1a110a] bg-[#ded2be] px-1 rounded">{currentDrawer?.nickname || 'Detective'}</strong>
                  </div>
                  {effectiveClueHint && (
                    <div className="text-amber-950 font-serif italic truncate max-w-[200px]" title={effectiveClueHint}>
                      💡 "{effectiveClueHint}"
                    </div>
                  )}
                </div>

                {/* Collapsible Story Context Accordion */}
                {storyContext && (
                  <details className="text-[10px] font-serif text-[#443020] bg-[#ede1ce]/70 rounded-lg px-2 py-0.5 border border-[#bfa98e]/70">
                    <summary className="font-mono text-[9px] font-bold uppercase tracking-wider text-amber-900 cursor-pointer select-none">
                      📜 Case Story Context (Tap to expand)
                    </summary>
                    <p className="italic mt-1 text-[11px] leading-snug text-[#291a0f]">
                      "{storyContext}"
                    </p>
                  </details>
                )}
              </div>
            )}
          </div>

          {/* 1. DESKTOP FULL VINTAGE INVESTIGATION DOSSIER (>= sm) */}
          <div
            className="hidden sm:block relative w-full rounded-2xl border-2 border-[#8c6d48] p-3 sm:p-4 text-[#221711] shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.18)] overflow-hidden transition-all select-none"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Parchment Corner Decorative Accents */}
            <div className="absolute top-1.5 left-1.5 w-3.5 h-3.5 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-3.5 h-3.5 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 left-1.5 w-3.5 h-3.5 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-1.5 right-1.5 w-3.5 h-3.5 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Vintage Brass Paperclip Graphic */}
            <div className="absolute -top-1.5 left-5 w-3.5 h-7 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/30" />

            <div className="flex items-start justify-between gap-2 sm:gap-3">
              <div className="flex-1 min-w-0 pr-1">
                {/* Tilted Red Rubber Stamp */}
                <div className="flex items-center gap-2 mb-1 flex-wrap">
                  <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-sm border-2 border-red-800 text-red-800 bg-red-800/10 font-mono font-black text-[10px] tracking-widest uppercase -rotate-1 shadow-sm">
                    {isCurrentDrawer ? '★ TOP SECRET EVIDENCE' : '🔍 UNSOLVED CASE EVIDENCE'}
                  </span>
                  <span className="text-[10px] font-mono text-[#7a6047] font-semibold">
                    ACT #{gameState.turnIndex + 1}
                  </span>
                </div>

                {isCurrentDrawer ? (
                  <>
                    {/* Story Scene Context: WHY this investigation is happening */}
                    {storyContext && (
                      <div className="text-[11px] sm:text-xs font-serif text-[#6b4e33] italic mb-1 flex items-center gap-1.5 flex-wrap">
                        <span className="font-mono not-italic text-[9px] font-bold uppercase tracking-wider text-[#8a6845] bg-[#dfd0be] px-1.5 py-0.5 rounded">
                          SCENE
                        </span>
                        <span>"{storyContext}"</span>
                      </div>
                    )}

                    <div className="text-sm xs:text-base sm:text-lg md:text-xl font-serif font-bold text-[#1a110a] tracking-normal leading-snug break-words">
                      "{drawerPrompt || secretDrawObjective || 'You search the scene and discover something unusual. Draw what you discovered.'}"
                    </div>
                    <div className="text-xs text-[#6e4e32] font-mono font-medium mt-1.5 flex items-center gap-2 flex-wrap">
                      <span>Secret Target: <span className="font-bold text-red-900 uppercase underline">{cleanTarget || 'Unsealing Clue...'}</span></span>
                      <span className="text-[#a68261]">•</span>
                      <span>Sketch what was discovered so other detectives can deduce it!</span>
                    </div>
                  </>
                ) : (
                  <>
                    <div className="flex items-center justify-between gap-2 flex-wrap mb-1">
                      <div className="text-xs text-[#5c4632] font-mono font-semibold flex items-center gap-1.5">
                        <span>Sketch Artist:</span>
                        <span className="font-bold text-[#1f150d] bg-[#ded2be] px-1.5 py-0.5 rounded text-[11px]">
                          {currentDrawer?.nickname || 'Detective'}
                        </span>
                        <span className="text-[#8c6d48]">is drawing now</span>
                      </div>
                      <span className="bg-[#e4d7c3] border border-[#bfa98e] px-1.5 py-0.5 rounded text-[10px] font-bold text-[#443020]">
                        {dynamicCategory}
                      </span>
                    </div>

                    {/* Story Scene Context: Case story beat unfolding right now */}
                    <div className="bg-[#ede1ce]/70 border-l-[3px] border-amber-800 px-2.5 py-1.5 rounded-r my-1 text-xs sm:text-sm font-serif text-[#291a0f] leading-snug">
                      <div className="flex items-center gap-1 text-[10px] font-mono font-bold text-amber-900 uppercase tracking-wider mb-0.5">
                        <BookOpen className="w-3 h-3 text-amber-800 inline" />
                        <span>Scene Context</span>
                      </div>
                      <p className="italic">
                        "{storyContext || 'Detectives are investigating the scene to uncover physical evidence connected to the case.'}"
                      </p>
                    </div>

                    {/* Investigative Lead / Clue Hint (Guides deduction vocabulary without leaking answer) */}
                    {effectiveClueHint && (
                      <div className="bg-amber-100/90 border border-amber-700/30 rounded-md px-2.5 py-1 my-1 text-xs font-serif text-[#2e1b0d] flex items-center gap-2 shadow-xs">
                        <Lightbulb className="w-3.5 h-3.5 text-amber-800 shrink-0" />
                        <span className="font-mono text-[10px] font-bold uppercase text-amber-900 shrink-0">Clue Lead:</span>
                        <span className="font-medium">"{effectiveClueHint}"</span>
                      </div>
                    )}

                    {/* Current Investigation Objective (What the room is investigating) */}
                    <div className="text-[11px] font-mono font-semibold text-amber-950 bg-amber-900/10 px-2 py-0.5 rounded border border-amber-800/20 inline-flex items-center gap-1.5 my-0.5 flex-wrap">
                      <span className="text-amber-800 font-bold">🎯 OBJECTIVE:</span>
                      <span>{investigationObjective || 'Watch the sketch artist live and deduce what was discovered.'}</span>
                    </div>

                    {/* Word length dashes & letter reveals */}
                    {renderLetterPattern()}

                    {/* Progressive Reveal Toast (10s / 25s) */}
                    {guesserHintMessage && (
                      <div className="text-[10px] font-mono font-bold text-amber-900 flex items-center gap-1 mt-0.5">
                        <span>{guesserHintMessage}</span>
                      </div>
                    )}
                  </>
                )}
              </div>

              {/* Vintage Watch / Stamp Timer Capsule */}
              <div className="text-right shrink-0 flex flex-col items-end">
                <span className="text-[9px] uppercase tracking-widest font-mono text-[#7a6047] font-bold">
                  Investigation Clock
                </span>
                <div
                  className={`px-2.5 sm:px-3 py-1 rounded-xl border-2 font-mono text-xl sm:text-2xl font-black tabular-nums transition-all shadow-md ${remainingSeconds <= 10
                      ? 'bg-red-900 border-red-700 text-white animate-pulse shadow-[0_0_15px_rgba(220,38,38,0.7)]'
                      : remainingSeconds <= 25
                        ? 'bg-[#3b281c] border-amber-600 text-amber-300'
                        : 'bg-[#221811] border-[#7d5f42] text-amber-200'
                    }`}
                >
                  {formattedTimer}
                </div>
                <span className="text-[9px] font-mono text-[#8a6e53] mt-0.5">
                  {roundDisplay}
                </span>
              </div>
            </div>
          </div>

          {/* 2. DEDICATED DRAWER TOOLBAR (VINTAGE INVESTIGATION PARCHMENT) */}
          {isCurrentDrawer && (
            <div
              className="relative w-full rounded-2xl border-2 border-[#8c6d48] p-2 sm:p-2.5 shadow-md flex flex-wrap items-center justify-between gap-2 select-none"
              style={{
                background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
                backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
                backgroundSize: '16px 16px, 100% 100%',
              }}
            >
              {/* Tool switch: Pencil vs Fill vs Eraser */}
              <div className="flex items-center gap-1 bg-[#ede1cf] p-1 rounded-xl border border-[#bfa98e]">
                <button
                  type="button"
                  onClick={() => {
                    setCurrentTool('pencil');
                    if (currentColor === '#fbf8f1') setCurrentColor('#111827');
                  }}
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-mono font-bold transition-all cursor-pointer ${currentTool === 'pencil' ? 'bg-red-800 text-white shadow' : 'text-[#6e533d] hover:text-[#1a110a]'
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
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-mono font-bold transition-all cursor-pointer ${currentTool === 'fill' ? 'bg-red-800 text-white shadow' : 'text-[#6e533d] hover:text-[#1a110a]'
                    }`}
                >
                  <PaintBucket className="w-3.5 h-3.5" />
                  <span className="text-xs">Fill</span>
                </button>
                <button
                  type="button"
                  onClick={() => setCurrentTool('eraser')}
                  className={`px-2.5 py-1.5 rounded-lg flex items-center gap-1 text-xs font-mono font-bold transition-all cursor-pointer ${currentTool === 'eraser' ? 'bg-red-800 text-white shadow' : 'text-[#6e533d] hover:text-[#1a110a]'
                    }`}
                >
                  <Eraser className="w-3.5 h-3.5" />
                  <span className="text-xs">Eraser</span>
                </button>
              </div>

              {/* Color palette swatches */}
              <div className="flex items-center gap-1.5 bg-[#ede1cf] px-2.5 py-1.5 rounded-xl border border-[#bfa98e]">
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
                      className={`w-6 h-6 rounded-full border transition-all cursor-pointer ${isSelected ? 'scale-125 ring-2 ring-red-800 border-white shadow-lg' : 'border-[#8c6d48] hover:scale-110 opacity-90'
                        }`}
                    />
                  );
                })}
              </div>

              {/* Brush size slider */}
              <div className="flex items-center gap-1.5 bg-[#ede1cf] px-2 py-1.5 rounded-xl border border-[#bfa98e]">
                <span className="text-[10px] font-mono text-[#6e533d] font-bold">Size</span>
                <input
                  type="range"
                  min="2"
                  max="20"
                  value={strokeWidth}
                  onChange={(e) => setStrokeWidth(Number(e.target.value))}
                  className="w-16 sm:w-20 accent-red-800 cursor-pointer h-1.5 bg-[#cbba9e] rounded-lg"
                />
              </div>

              {/* Undo, Redo & Clear */}
              <div className="flex items-center gap-1.5 ml-auto">
                <button
                  type="button"
                  onClick={handleUndo}
                  disabled={strokes.length === 0}
                  title="Undo"
                  className="p-2 rounded-xl bg-[#ede1cf] border border-[#bfa98e] text-[#443020] hover:text-[#1a110a] hover:bg-[#e4d6c1] disabled:opacity-30 transition-colors cursor-pointer"
                >
                  <RotateCcw className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  onClick={handleRedo}
                  disabled={redoStack.length === 0}
                  title="Redo"
                  className="p-2 rounded-xl bg-[#ede1cf] border border-[#bfa98e] text-[#443020] hover:text-[#1a110a] hover:bg-[#e4d6c1] disabled:opacity-30 transition-colors cursor-pointer"
                >
                  <RotateCw className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  onClick={handleClear}
                  disabled={strokes.length === 0}
                  className="px-2.5 py-1.5 rounded-xl bg-[#ede1cf] hover:bg-red-100 border border-[#bfa98e] hover:border-red-800 text-[#443020] hover:text-red-900 text-xs font-mono font-bold flex items-center gap-1 transition-all disabled:opacity-30 cursor-pointer"
                >
                  <Trash2 className="w-3.5 h-3.5" />
                  <span>Clear</span>
                </button>
              </div>
            </div>
          )}

          {/* 3. PARCHMENT DRAWING CANVAS */}
          <div
            className="relative w-full aspect-[4/3] sm:aspect-[16/10] max-h-[38vh] sm:max-h-[54vh] min-h-[200px] sm:min-h-[380px] md:min-h-[440px] lg:min-h-[500px] bg-[#fbf8f1] rounded-2xl shadow-[0_12px_40px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.12)] border-2 border-[#8c6d48] overflow-hidden flex flex-col"
            style={{ touchAction: 'none' }}
          >
            {/* Header Sub-bar */}
            <div className="flex-shrink-0 h-7 bg-gradient-to-r from-[#24170e] via-[#3d2a1b] to-[#24170e] border-b border-[#7a5939] flex items-center justify-between px-3 select-none">
              <span className="text-[9px] font-mono font-bold tracking-[0.18em] uppercase text-[#ede1cf]">Evidence Canvas</span>
              <span className={`text-[9px] font-mono font-bold uppercase ${isCurrentDrawer ? 'text-red-300' : 'text-amber-200'}`}>
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
                className={`w-full h-full block select-none ${isCurrentDrawer
                    ? currentTool === 'fill'
                      ? 'cursor-cell pointer-events-auto'
                      : 'cursor-crosshair pointer-events-auto'
                    : 'cursor-default pointer-events-none'
                  }`}
              />
            </div>
          </div>

          {/* 4. VINTAGE EVIDENCE & TELEGRAPH GUESS CONSOLE */}
          <div
            className="relative w-full rounded-2xl border-2 border-[#8c6d48] p-3 shadow-xl overflow-hidden select-none text-[#221711] space-y-2.5"
            style={{
              background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
              backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
              backgroundSize: '16px 16px, 100% 100%',
            }}
          >
            {/* Parchment Corner Decorative Accents */}
            <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute -top-1.5 left-5 w-3 h-6 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

            {!isCurrentDrawer ? (
              <>
                <div className="flex items-center justify-between gap-2 flex-wrap">
                  <div className="flex items-center gap-1.5 text-xs font-mono font-bold uppercase tracking-wider text-[#1a110a]">
                    <Crosshair className="w-3.5 h-3.5 text-red-800" />
                    <span>Decipher the Evidence</span>
                  </div>
                  <span className="text-[10px] text-[#7a4e2d] font-bold bg-[#ede0ce] border border-[#bfa98e] px-2 py-0.5 rounded-full font-mono">
                    Single-word or short answer
                  </span>
                </div>

                <form onSubmit={handleGuessSubmit} className="flex gap-2">
                  <input
                    type="text"
                    value={guessInput}
                    onChange={(e) => setGuessInput(e.target.value)}
                    placeholder={
                      effectiveClueHint
                        ? "What is it? Type your guess (e.g. key, envelope)..."
                        : "What is it? Type your guess (e.g. key, photo)..."
                    }
                    className="min-w-0 flex-1 px-3 py-2 sm:px-3.5 sm:py-2.5 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl text-base sm:text-sm text-[#1a110a] placeholder-[#8a725b] focus:outline-none focus:ring-1 focus:ring-red-800 font-mono shadow-inner"
                  />
                  <button
                    type="submit"
                    disabled={!guessInput.trim()}
                    className="px-4 sm:px-6 py-2.5 bg-red-800 hover:bg-red-700 disabled:opacity-40 text-white rounded-xl text-xs font-bold uppercase tracking-wider shadow-md transition-all cursor-pointer font-mono"
                  >
                    Submit Guess
                  </button>
                </form>
              </>
            ) : (
              <div className="flex items-center justify-between gap-2 px-3 py-2 rounded-xl bg-amber-100/90 border-2 border-amber-700/60 text-[#3d2714] text-xs font-mono">
                <div className="flex items-center gap-2">
                  <Sparkles className="w-4 h-4 text-amber-800 animate-pulse shrink-0" />
                  <span className="font-bold">You are Sketching! Detective telegraph guesses appear live below:</span>
                </div>
              </div>
            )}

            {guessFeedback && (
              <div className="p-2 rounded-xl text-xs font-bold text-amber-950 bg-amber-100 border border-amber-600 flex items-center justify-between animate-fadeIn font-mono">
                <div className="flex items-center gap-2">
                  <Lightbulb className="w-4 h-4 text-amber-800 shrink-0" />
                  <span>{guessFeedback}</span>
                </div>
              </div>
            )}

            {/* Recent Live Guesses Stream */}
            <div className="pt-2.5 border-t border-[#bfa98e]/80">
              <div className="text-[10px] font-mono text-[#6e533d] mb-2 flex items-center justify-between font-bold">
                <span className="uppercase tracking-wider">Recent Telegraph Guesses:</span>
                {isCurrentDrawer && <span className="text-[9px] text-red-900 font-black uppercase tracking-wider bg-red-100 px-2 py-0.5 rounded border border-red-700">DRAWER MONITORING</span>}
              </div>
              <div className="flex flex-wrap items-center gap-2 min-h-[36px]">
                {guessFeed.length === 0 ? (
                  <span className="text-xs text-[#8a725b] italic font-mono py-1">
                    {isCurrentDrawer ? 'Waiting for investigators to type guesses...' : 'No guesses recorded yet. Be the first to deduce!'}
                  </span>
                ) : (
                  guessFeed.slice(-6).map((g, idx) => (
                    <div
                      key={idx}
                      className={`px-3 py-1.5 rounded-xl text-xs font-mono flex items-center gap-1.5 border shadow-sm transition-all ${
                        g.isCorrect
                          ? 'bg-[#e8f5e9] border-[#2e7d32] text-[#1b5e20] font-black'
                          : g.isClose
                          ? 'bg-[#fff8e1] border-[#f57f17] text-[#e65100] font-bold'
                          : 'bg-[#fdfbf6] border-[#b89e7c] text-[#1a110a]'
                      }`}
                    >
                      <span className="font-bold text-[#1a110a]">{g.playerName}:</span>
                      <span className="font-serif font-bold">{g.text}</span>
                      {g.isClose && <span className="px-1.5 py-0.5 rounded bg-amber-200 border border-amber-600 text-amber-950 text-[9px] font-black uppercase tracking-wider">★ CLOSE</span>}
                      {g.isCorrect && <span className="px-1.5 py-0.5 rounded bg-emerald-200 border border-emerald-800 text-emerald-950 text-[9px] font-black uppercase tracking-wider">✓ SOLVED</span>}
                    </div>
                  ))
                )}
              </div>
            </div>
          </div>

          {/* 5. MOBILE TABS SWITCHER (< lg) */}
          <div className="lg:hidden flex items-center bg-[#ebe0ce] border-2 border-[#8c6d48] rounded-2xl p-1 shadow-md mt-1 select-none">
            <button
              type="button"
              onClick={() => {
                SoundService.playClick();
                setMobileTab('chat');
              }}
              className={`flex-1 py-2 rounded-xl text-xs font-mono font-bold flex items-center justify-center gap-1.5 transition-all cursor-pointer ${mobileTab === 'chat'
                  ? 'bg-red-800 text-white shadow-md'
                  : 'text-[#6e533d] hover:text-[#1a110a]'
                }`}
            >
              <MessageSquare className="w-3.5 h-3.5" />
              <span>Interrogation Chat</span>
            </button>
            <button
              type="button"
              onClick={() => {
                SoundService.playClick();
                setMobileTab('detectives');
              }}
              className={`flex-1 py-2 rounded-xl text-xs font-mono font-bold flex items-center justify-center gap-1.5 transition-all cursor-pointer ${mobileTab === 'detectives'
                  ? 'bg-red-800 text-white shadow-md'
                  : 'text-[#6e533d] hover:text-[#1a110a]'
                }`}
            >
              <Users className="w-3.5 h-3.5" />
              <span>Detectives ({rosterPlayers.length})</span>
            </button>
          </div>

          {/* 6. MOBILE TAB CONTENT (< lg) */}
          <div className="lg:hidden w-full mt-1">
            {mobileTab === 'chat' ? (
              <RoomChat
                currentUser={currentUser}
                channel={channel}
                showTabs={true}
                defaultTab="Room Chat"
                className="min-h-[300px] max-h-[380px]"
              />
            ) : (
              <div className="flex flex-col gap-3">
                {renderDetectivesRoster()}
                {renderCaseDossier()}
              </div>
            )}
          </div>
        </div>

        {/* ======================================================== */}
        {/* DESKTOP RIGHT COLUMN: ROOM CHAT & GAME LOG (3 cols)      */}
        {/* Hidden on mobile, rendered cleanly on desktop            */}
        {/* ======================================================== */}
        <div className="hidden lg:flex lg:col-span-3 xl:col-span-3 flex-col gap-3">
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
