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
    <div
      className="text-[#221711] border-2 border-[#8c6d48] rounded-2xl p-2.5 sm:p-3 shadow-[0_10px_30px_rgba(0,0,0,0.5),inset_0_0_40px_rgba(139,94,60,0.15)] flex flex-col gap-2.5 lg:flex-row lg:items-center lg:justify-between select-none"
      style={{
        background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
      }}
    >
      {/* Tool Selection */}
      <div className="flex items-center gap-1 bg-[#ede1cf]/80 p-1 rounded-xl border border-[#b89e7c] overflow-x-auto max-w-full">
        {tools.map((t) => {
          const isActive = currentTool === t.id;
          return (
            <button
              key={t.id}
              onClick={() => onSelectTool(t.id)}
              title={t.label}
              className={`p-2 rounded-lg transition-all flex items-center gap-1.5 text-xs font-mono font-bold shrink-0 cursor-pointer ${
                isActive
                  ? 'bg-[#8a1c1c] text-white shadow-sm border border-[#541010] scale-105'
                  : 'text-[#5c422e] hover:text-[#1a110a] hover:bg-[#dfceb7]'
              }`}
            >
              {t.icon}
              <span className="hidden sm:inline">{t.label}</span>
            </button>
          );
        })}
      </div>

      {/* Color Swatches */}
      <div className="flex items-center gap-1.5 bg-[#ede1cf]/80 p-1.5 rounded-xl border border-[#b89e7c] overflow-x-auto max-w-full">
        {NOIR_PALETTE.map((color) => {
          const isSelected = currentColor.toLowerCase() === color.toLowerCase();
          return (
            <button
              key={color}
              onClick={() => onSelectColor(color)}
              className={`w-6 h-6 rounded-full transition-all border cursor-pointer ${
                isSelected
                  ? 'scale-125 ring-2 ring-red-800 ring-offset-2 ring-offset-[#fbf7ee] border-[#1a110a] shadow-sm'
                  : 'border-[#8c6d48]/40 hover:scale-110 opacity-85 hover:opacity-100'
              }`}
              style={{ backgroundColor: color }}
              title={color}
            />
          );
        })}
      </div>

      {/* Stroke Width Slider */}
      <div className="flex items-center gap-2 bg-[#ede1cf]/80 px-3 py-1.5 rounded-xl border border-[#b89e7c] w-full lg:w-auto">
        <span className="text-xs text-[#5c422e] font-mono font-bold">Size</span>
        <input
          type="range"
          min="1"
          max="24"
          value={strokeWidth}
          onChange={(e) => onChangeStrokeWidth(Number(e.target.value))}
          className="w-20 accent-red-800 cursor-pointer h-1.5 bg-[#b89e7c] rounded-lg"
        />
        <div
          className="w-4 h-4 rounded-full flex items-center justify-center border border-[#8c6d48]/50 shadow-xs"
          style={{ backgroundColor: currentColor }}
        >
          <div
            className="rounded-full bg-white"
            style={{ width: `${Math.min(12, strokeWidth)}px`, height: `${Math.min(12, strokeWidth)}px` }}
          />
        </div>
      </div>

      {/* Actions: Undo / Redo / Clear */}
      <div className="flex items-center gap-2 w-full lg:w-auto justify-between lg:justify-start flex-wrap sm:flex-nowrap">
        <button
          onClick={onUndo}
          disabled={!canUndo}
          title="Undo Stroke"
          className="p-2 rounded-xl bg-[#ede1cf] border border-[#b89e7c] text-[#4a3525] hover:text-[#1a110a] disabled:opacity-30 disabled:cursor-not-allowed hover:bg-[#dfceb7] transition-colors cursor-pointer shadow-xs"
        >
          <RotateCcw className="w-4 h-4" />
        </button>
        <button
          onClick={onRedo}
          disabled={!canRedo}
          title="Redo Stroke"
          className="p-2 rounded-xl bg-[#ede1cf] border border-[#b89e7c] text-[#4a3525] hover:text-[#1a110a] disabled:opacity-30 disabled:cursor-not-allowed hover:bg-[#dfceb7] transition-colors cursor-pointer shadow-xs"
        >
          <RotateCw className="w-4 h-4" />
        </button>
        <button
          onClick={onClear}
          title="Clear Entire Canvas"
          className="p-2 rounded-xl bg-red-100/80 border border-red-800 text-red-900 hover:bg-red-200 transition-colors cursor-pointer shadow-xs"
        >
          <Trash2 className="w-4 h-4" />
        </button>
      </div>
    </div>
  );
};
