import React from 'react';
import {
  Pen,
  Paintbrush,
  Highlighter,
  Eraser,
  Slash,
  Square,
  Circle as CircleIcon,
  RotateCcw,
  RotateCw,
  Trash2,
} from 'lucide-react';
import { DrawingTool } from '../../types/game';
import { NOIR_PALETTE } from '../../services/drawingService';

interface DrawingToolsProps {
  currentTool: DrawingTool;
  onSelectTool: (tool: DrawingTool) => void;
  currentColor: string;
  onSelectColor: (color: string) => void;
  strokeWidth: number;
  onChangeStrokeWidth: (width: number) => void;
  canUndo: boolean;
  canRedo: boolean;
  onUndo: () => void;
  onRedo: () => void;
  onClear: () => void;
  onSubmit?: () => void;
  isSubmitting?: boolean;
}

export const DrawingTools: React.FC<DrawingToolsProps> = ({
  currentTool,
  onSelectTool,
  currentColor,
  onSelectColor,
  strokeWidth,
  onChangeStrokeWidth,
  canUndo,
  canRedo,
  onUndo,
  onRedo,
  onClear,
}) => {
  const tools: { id: DrawingTool; label: string; icon: React.ReactNode }[] = [
    { id: 'pencil', label: 'Pencil', icon: <Pen className="w-4 h-4" /> },
    { id: 'brush', label: 'Brush', icon: <Paintbrush className="w-4 h-4" /> },
    { id: 'marker', label: 'Marker', icon: <Highlighter className="w-4 h-4" /> },
    { id: 'eraser', label: 'Eraser', icon: <Eraser className="w-4 h-4" /> },
    { id: 'line', label: 'Line', icon: <Slash className="w-4 h-4" /> },
    { id: 'rectangle', label: 'Box', icon: <Square className="w-4 h-4" /> },
    { id: 'circle', label: 'Circle', icon: <CircleIcon className="w-4 h-4" /> },
  ];

  return (
    <div className="bg-noir-850/95 border border-noir-700/80 rounded-xl p-3 shadow-dossier backdrop-blur-md flex flex-col gap-3 lg:flex-row lg:items-center lg:justify-between">
      {/* Tool Selection */}
      <div className="flex items-center gap-1 bg-noir-900/80 p-1 rounded-lg border border-noir-800 overflow-x-auto max-w-full">
        {tools.map((t) => {
          const isActive = currentTool === t.id;
          return (
            <button
              key={t.id}
              onClick={() => onSelectTool(t.id)}
              title={t.label}
              className={`p-2.5 rounded-md transition-all flex items-center gap-1.5 text-xs font-medium shrink-0 ${
                isActive
                  ? 'bg-case-amber text-noir-950 shadow-amber-glow font-semibold scale-105'
                  : 'text-noir-300 hover:text-white hover:bg-noir-700/50'
              }`}
            >
              {t.icon}
              <span className="hidden sm:inline">{t.label}</span>
            </button>
          );
        })}
      </div>

      {/* Color Swatches */}
      <div className="flex items-center gap-1.5 bg-noir-900/80 p-1.5 rounded-lg border border-noir-800 overflow-x-auto max-w-full">
        {NOIR_PALETTE.map((color) => {
          const isSelected = currentColor.toLowerCase() === color.toLowerCase();
          return (
            <button
              key={color}
              onClick={() => onSelectColor(color)}
              className={`w-6 h-6 rounded-full transition-all border ${
                isSelected
                  ? 'scale-125 ring-2 ring-case-amber ring-offset-2 ring-offset-noir-900 border-white'
                  : 'border-white/20 hover:scale-110 opacity-80 hover:opacity-100'
              }`}
              style={{ backgroundColor: color }}
              title={color}
            />
          );
        })}
      </div>

      {/* Stroke Width Slider */}
      <div className="flex items-center gap-2 bg-noir-900/80 px-3 py-1.5 rounded-lg border border-noir-800 w-full lg:w-auto">
        <span className="text-xs text-noir-400 font-mono">Size</span>
        <input
          type="range"
          min="1"
          max="24"
          value={strokeWidth}
          onChange={(e) => onChangeStrokeWidth(Number(e.target.value))}
          className="w-20 accent-case-amber cursor-pointer h-1.5 bg-noir-700 rounded-lg"
        />
        <div
          className="w-4 h-4 rounded-full flex items-center justify-center"
          style={{ backgroundColor: currentColor }}
        >
          <div
            className="rounded-full bg-white"
            style={{ width: `${Math.min(12, strokeWidth)}px`, height: `${Math.min(12, strokeWidth)}px` }}
          />
        </div>
      </div>

      {/* Actions: Undo / Redo / Clear / Submit */}
      <div className="flex items-center gap-2 w-full lg:w-auto justify-between lg:justify-start flex-wrap sm:flex-nowrap">
        <button
          onClick={onUndo}
          disabled={!canUndo}
          title="Undo"
          className="p-2 rounded-lg bg-noir-900/80 border border-noir-800 text-noir-300 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed hover:bg-noir-800 transition-colors"
        >
          <RotateCcw className="w-4 h-4" />
        </button>
        <button
          onClick={onRedo}
          disabled={!canRedo}
          title="Redo"
          className="p-2 rounded-lg bg-noir-900/80 border border-noir-800 text-noir-300 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed hover:bg-noir-800 transition-colors"
        >
          <RotateCw className="w-4 h-4" />
        </button>
        <button
          onClick={onClear}
          title="Clear Board"
          className="p-2 rounded-lg bg-noir-900/80 border border-noir-800 text-noir-400 hover:text-rose-400 hover:bg-rose-950/20 transition-colors"
        >
          <Trash2 className="w-4 h-4" />
        </button>
      </div>
    </div>
  );
};
