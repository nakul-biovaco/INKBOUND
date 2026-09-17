import React, { useState } from 'react';
import { ZoomIn, Tag, MessageSquare, Pin } from 'lucide-react';
import { EvidenceCard } from '../../types/game';
import { AvatarBadge } from '../common/AvatarBadge';

interface EvidenceCardComponentProps {
  card: EvidenceCard;
  isSelected?: boolean;
  onSelect?: () => void;
  onConnectStart?: () => void;
}

export const EvidenceCardComponent: React.FC<EvidenceCardComponentProps> = ({
  card,
  isSelected = false,
  onSelect,
  onConnectStart,
}) => {
  const [isZoomed, setIsZoomed] = useState<boolean>(false);

  return (
    <>
      <div
        onClick={onSelect}
        className={`evidence-card relative rounded-xl p-3 w-64 cursor-pointer transition-all ${
          isSelected
            ? 'ring-2 ring-case-amber shadow-amber-glow border-case-amber'
            : 'hover:border-case-amber/50'
        }`}
      >
        {/* Red Push Pin */}
        <div className="absolute -top-3 left-1/2 -translate-x-1/2 z-10 flex items-center justify-center">
          <div className="w-5 h-5 rounded-full bg-case-crimson shadow-md flex items-center justify-center border-2 border-noir-900">
            <Pin className="w-3 h-3 text-white fill-white transform rotate-45" />
          </div>
        </div>

        {/* Thumbnail Preview (Polaroid Style) */}
        <div className="relative w-full h-36 bg-noir-950 rounded-lg overflow-hidden border border-noir-700/80 mb-2.5 flex items-center justify-center group">
          {card.drawingPreview ? (
            <img
              src={card.drawingPreview}
              alt={card.title}
              className="w-full h-full object-contain p-1"
            />
          ) : (
            <div className="text-xs text-noir-500 font-mono">No drawing preview</div>
          )}

          {/* Hover Zoom Button */}
          <button
            onClick={(e) => {
              e.stopPropagation();
              setIsZoomed(true);
            }}
            className="absolute inset-0 bg-noir-950/70 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2 text-white text-xs font-semibold backdrop-blur-xs"
          >
            <ZoomIn className="w-4 h-4 text-case-cyan" />
            Inspect Evidence
          </button>
        </div>

        {/* Title & Detective Source */}
        <div className="space-y-1">
          <h4 className="text-sm font-bold text-white tracking-wide font-dossier truncate">
            {card.title}
          </h4>
          <div className="flex items-center justify-between text-xs text-noir-400">
            <span className="flex items-center gap-1 font-medium">
              <AvatarBadge avatar={card.sourcePlayerAvatar} size="xs" />
              <span className="truncate max-w-[110px]">{card.sourcePlayerName}</span>
            </span>
            <span className="font-mono text-[10px] text-case-amber">
              {card.timelineSlot || 'Unslotted'}
            </span>
          </div>
        </div>

        {/* Notes & Tags */}
        <div className="mt-2 pt-2 border-t border-noir-800 flex items-center justify-between text-[11px] text-noir-400">
          <div className="flex items-center gap-1 truncate max-w-[130px]">
            <Tag className="w-3 h-3 text-case-cyan flex-shrink-0" />
            <span className="truncate">{card.tags.join(', ')}</span>
          </div>

          {onConnectStart && (
            <button
              onClick={(e) => {
                e.stopPropagation();
                onConnectStart();
              }}
              className="px-2 py-0.5 rounded bg-case-crimson/20 hover:bg-case-crimson/40 text-case-crimson border border-case-crimson/40 text-[10px] font-bold transition-colors"
            >
              + Thread
            </button>
          )}
        </div>
      </div>

      {/* High-Res Inspect Modal */}
      {isZoomed && (
        <div
          onClick={() => setIsZoomed(false)}
          className="fixed inset-0 z-50 bg-noir-950/90 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn"
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="bg-noir-900 border border-case-amber/40 rounded-2xl max-w-2xl w-full p-6 shadow-2xl space-y-4"
          >
            <div className="flex items-center justify-between border-b border-noir-800 pb-3">
              <div>
                <span className="evidence-stamp-classified text-xs">EXHIBIT ANALYSIS</span>
                <h3 className="text-lg font-bold text-white font-dossier mt-1">{card.title}</h3>
                <p className="text-xs text-noir-400">
                  Witness Sketch by {card.sourcePlayerName}
                </p>
              </div>
              <button
                onClick={() => setIsZoomed(false)}
                className="px-3 py-1 bg-noir-800 hover:bg-noir-700 text-white rounded-lg text-sm"
              >
                Close (ESC)
              </button>
            </div>

            <div className="w-full h-80 bg-noir-950 rounded-xl border border-noir-800 flex items-center justify-center p-2">
              {card.drawingPreview && (
                <img
                  src={card.drawingPreview}
                  alt={card.title}
                  className="w-full h-full object-contain"
                />
              )}
            </div>

            <div className="bg-noir-850 p-3 rounded-lg border border-noir-800 text-xs text-noir-300">
              <div className="flex items-center gap-1.5 font-bold text-case-amber mb-1">
                <MessageSquare className="w-3.5 h-3.5" />
                Detective Notes
              </div>
              <p className="font-dossier leading-relaxed">
                "{card.notes || 'No specific field notes recorded for this evidence piece.'}"
              </p>
            </div>
          </div>
        </div>
      )}
    </>
  );
};
