import { DrawingTool, Point, Stroke } from '../types/game';

export const NOIR_PALETTE = [
  '#ffffff', // Chalk White
  '#cbd5e1', // Dim Slate
  '#64748b', // Fog Gray
  '#1e293b', // Midnight Black
  '#eab308', // Case File Amber
  '#dc2626', // Crime Scene Crimson
  '#38bdf8', // Evidence Cyan
  '#10b981', // Emerald Green
  '#a855f7', // Mystic Violet
  '#f97316', // Flare Orange
];

export class DrawingService {
  /**
   * Smoothly draws a single stroke onto a 2D canvas rendering context using quadratic Bézier curves.
   */
  public static renderStroke(ctx: CanvasRenderingContext2D, stroke: Stroke): void {
    if (!stroke.points || stroke.points.length === 0) return;

    ctx.save();
    ctx.lineCap = 'round';
    ctx.lineJoin = 'round';

    if (stroke.tool === 'eraser') {
      ctx.globalCompositeOperation = 'destination-out';
      ctx.strokeStyle = 'rgba(0,0,0,1)';
      ctx.lineWidth = stroke.width * 2;
    } else if (stroke.tool === 'marker') {
      ctx.globalCompositeOperation = 'source-over';
      ctx.globalAlpha = 0.5;
      ctx.strokeStyle = stroke.color;
      ctx.lineWidth = stroke.width * 2.5;
    } else {
      ctx.globalCompositeOperation = 'source-over';
      ctx.globalAlpha = 1.0;
      ctx.strokeStyle = stroke.color;
      ctx.lineWidth = stroke.width;
    }

    const pts = stroke.points;

    if (stroke.tool === 'line' && pts.length >= 2) {
      ctx.beginPath();
      ctx.moveTo(pts[0].x, pts[0].y);
      ctx.lineTo(pts[pts.length - 1].x, pts[pts.length - 1].y);
      ctx.stroke();
      ctx.restore();
      return;
    }

    if (stroke.tool === 'rectangle' && pts.length >= 2) {
      ctx.beginPath();
      const start = pts[0];
      const end = pts[pts.length - 1];
      ctx.strokeRect(start.x, start.y, end.x - start.x, end.y - start.y);
      ctx.restore();
      return;
    }

    if (stroke.tool === 'circle' && pts.length >= 2) {
      ctx.beginPath();
      const start = pts[0];
      const end = pts[pts.length - 1];
      const radius = Math.sqrt(Math.pow(end.x - start.x, 2) + Math.pow(end.y - start.y, 2));
      ctx.arc(start.x, start.y, radius, 0, 2 * Math.PI);
      ctx.stroke();
      ctx.restore();
      return;
    }

    // Freehand smooth Bézier curve interpolation
    if (pts.length === 1) {
      ctx.fillStyle = stroke.color;
      ctx.beginPath();
      ctx.arc(pts[0].x, pts[0].y, stroke.width / 2, 0, Math.PI * 2);
      ctx.fill();
    } else {
      ctx.beginPath();
      ctx.moveTo(pts[0].x, pts[0].y);

      for (let i = 1; i < pts.length - 1; i++) {
        const xc = (pts[i].x + pts[i + 1].x) / 2;
        const yc = (pts[i].y + pts[i + 1].y) / 2;
        ctx.quadraticCurveTo(pts[i].x, pts[i].y, xc, yc);
      }

      const last = pts[pts.length - 1];
      ctx.lineTo(last.x, last.y);
      ctx.stroke();
    }

    ctx.restore();
  }

  /**
   * Replays an entire array of strokes onto a clean canvas context.
   */
  public static replayStrokes(
    ctx: CanvasRenderingContext2D,
    width: number,
    height: number,
    strokes: Stroke[]
  ): void {
    ctx.clearRect(0, 0, width, height);
    strokes.forEach((stroke) => {
      this.renderStroke(ctx, stroke);
    });
  }

  /**
   * Creates a new Stroke object.
   */
  public static createStroke(
    drawingId: string,
    playerId: string,
    tool: DrawingTool,
    color: string,
    width: number,
    startPoint: Point
  ): Stroke {
    return {
      id: `strk-${Date.now()}-${Math.random().toString(36).substring(2, 6)}`,
      drawingId,
      playerId,
      tool,
      color,
      width,
      points: [startPoint],
      timestamp: Date.now(),
    };
  }
}
