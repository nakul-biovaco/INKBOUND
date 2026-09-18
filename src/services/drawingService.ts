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

    const pts = stroke.points;

    if (stroke.tool === 'fill' && pts.length >= 1) {
      DrawingService.floodFill(ctx, pts[0].x, pts[0].y, stroke.color);
      ctx.restore();
      return;
    }

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

  /**
   * Fast BFS canvas flood-fill for the paint bucket tool.
   */
  public static floodFill(
    ctx: CanvasRenderingContext2D,
    startX: number,
    startY: number,
    fillColorHex: string
  ): void {
    const canvas = ctx.canvas;
    const width = canvas.width;
    const height = canvas.height;
    const px = Math.floor(startX);
    const py = Math.floor(startY);
    if (px < 0 || px >= width || py < 0 || py >= height) return;

    let imgData: ImageData;
    try {
      imgData = ctx.getImageData(0, 0, width, height);
    } catch {
      return;
    }
    const data = imgData.data;

    // Resolve fillColorHex to RGBA
    const temp = document.createElement('canvas');
    temp.width = 1;
    temp.height = 1;
    const tCtx = temp.getContext('2d');
    if (!tCtx) return;
    tCtx.fillStyle = fillColorHex;
    tCtx.fillRect(0, 0, 1, 1);
    const fillRgba = tCtx.getImageData(0, 0, 1, 1).data;
    const [fillR, fillG, fillB, fillA] = fillRgba;

    const startPos = (py * width + px) * 4;
    const startR = data[startPos];
    const startG = data[startPos + 1];
    const startB = data[startPos + 2];
    const startA = data[startPos + 3];

    if (
      Math.abs(startR - fillR) < 5 &&
      Math.abs(startG - fillG) < 5 &&
      Math.abs(startB - fillB) < 5 &&
      Math.abs(startA - fillA) < 5
    ) {
      return;
    }

    const matchColor = (pos: number) => {
      return (
        Math.abs(data[pos] - startR) < 32 &&
        Math.abs(data[pos + 1] - startG) < 32 &&
        Math.abs(data[pos + 2] - startB) < 32 &&
        Math.abs(data[pos + 3] - startA) < 32
      );
    };

    const queue: number[] = [px, py];
    const visited = new Uint8Array(width * height);

    while (queue.length > 0) {
      const cy = queue.pop()!;
      const cx = queue.pop()!;
      const pixelIndex = cy * width + cx;
      if (visited[pixelIndex]) continue;
      visited[pixelIndex] = 1;

      const pos = pixelIndex * 4;
      if (!matchColor(pos)) continue;

      data[pos] = fillR;
      data[pos + 1] = fillG;
      data[pos + 2] = fillB;
      data[pos + 3] = fillA;

      if (cx > 0 && !visited[pixelIndex - 1]) queue.push(cx - 1, cy);
      if (cx < width - 1 && !visited[pixelIndex + 1]) queue.push(cx + 1, cy);
      if (cy > 0 && !visited[pixelIndex - width]) queue.push(cx, cy - 1);
      if (cy < height - 1 && !visited[pixelIndex + width]) queue.push(cx, cy + 1);
    }

    ctx.putImageData(imgData, 0, 0);
  }
}
