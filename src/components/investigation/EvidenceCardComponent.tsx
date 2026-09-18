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

const parchmentStyle: React.CSSProperties = {
  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
  backgroundSize: '16px 16px, 100% 100%',
};

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
        className={`relative bg-[#fdfbf6] rounded-2xl p-3 w-64 cursor-pointer transition-all border-2 select-none shadow-md hover:shadow-xl hover:-translate-y-1 ${
          isSelected
            ? 'border-red-800 ring-2 ring-red-800 shadow-lg'
            : 'border-[#8c6d48] hover:border-red-800'
        }`}
      >
        {/* Red Push Pin */}
        <div className="absolute -top-3 left-1/2 -translate-x-1/2 z-10 flex items-center justify-center">
          <div className="w-5 h-5 rounded-full bg-red-700 shadow-md flex items-center justify-center border-2 border-red-950">
            <Pin className="w-3 h-3 text-white fill-white transform rotate-45" />
          </div>
        </div>

        {/* Thumbnail Preview (Vintage Polaroid Style) */}
        <div className="relative w-full h-36 bg-[#fcf8f1] rounded-xl overflow-hidden border border-[#b89e7c] mb-2.5 flex items-center justify-center group shadow-inner">
          {card.drawingPreview ? (
            <img
              src={card.drawingPreview}
              alt={card.title}
              className="w-full h-full object-contain p-1"
            />
          ) : (
            <div className="text-xs text-[#8c6d48] font-mono">No sketch preview</div>
          )}

          {/* Hover Zoom Button */}
          <button
            onClick={(e) => {
              e.stopPropagation();
              setIsZoomed(true);
            }}
            className="absolute inset-0 bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2 text-white text-xs font-mono font-bold"
          >
            <ZoomIn className="w-4 h-4 text-amber-300" />
            Inspect Clue
          </button>
        </div>

        {/* Title & Detective Source */}
        <div className="space-y-1">
          <h4 className="text-sm font-black text-[#1a110a] tracking-wide font-serif truncate">
            {card.title}
          </h4>
          <div className="flex items-center justify-between text-xs text-[#5c4028]">
            <span className="flex items-center gap-1 font-bold text-[#1a110a]">
              <AvatarBadge avatar={card.sourcePlayerAvatar} size="xs" />
              <span className="truncate max-w-[110px]">{card.sourcePlayerName}</span>
            </span>
            <span className="font-mono text-[10px] text-red-800 font-black">
              {card.timelineSlot || 'Unslotted'}
            </span>
          </div>
        </div>

        {/* Notes & Tags */}
        <div className="mt-2 pt-2 border-t border-[#bfa98e]/70 flex items-center justify-between text-[11px] text-[#5c4028]">
          <div className="flex items-center gap-1 truncate max-w-[130px] font-mono">
            <Tag className="w-3 h-3 text-[#8c6d48] flex-shrink-0" />
            <span className="truncate">{card.tags.join(', ') || 'Evidence'}</span>
          </div>

          {onConnectStart && (
            <button
              onClick={(e) => {
                e.stopPropagation();
                onConnectStart();
              }}
              className="px-2 py-0.5 rounded-lg bg-red-800/10 hover:bg-red-800 text-red-800 hover:text-white border border-red-800 text-[10px] font-mono font-bold transition-colors cursor-pointer"
            >
              + Thread
            </button>
          )}
        </div>
      </div>

      {/* High-Res Inspect Modal (Vintage Classified Evidence Envelope) */}
      {isZoomed && (
        <div
          onClick={() => setIsZoomed(false)}
          className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn"
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-2xl w-full p-6 sm:p-7 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden"
            style={parchmentStyle}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
              <div>
                <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase">
                  CLASSIFIED EVIDENCE ANALYSIS
                </span>
                <h3 className="text-lg font-black text-[#1a110a] font-serif mt-1">{card.title}</h3>
                <p className="text-xs text-[#5c4028] font-mono">
                  Witness Sketch Documented by {card.sourcePlayerName}
                </p>
              </div>
              <button
                onClick={() => setIsZoomed(false)}
                className="px-3.5 py-1.5 bg-[#ede0ce] hover:bg-[#ded0bc] border border-[#bfa98e] text-[#1a110a] font-mono font-bold rounded-xl text-xs cursor-pointer shadow-xs"
              >
                ✕ Close
              </button>
            </div>

            <div className="w-full h-80 bg-[#fcf8f1] rounded-2xl border-2 border-[#8c6d48] flex items-center justify-center p-3 shadow-inner">
              {card.drawingPreview && (
                <img
                  src={card.drawingPreview}
                  alt={card.title}
                  className="w-full h-full object-contain"
                />
              )}
            </div>

            <div className="bg-[#f5ecdd] p-3.5 rounded-xl border border-[#b89e7c] text-xs text-[#2a1d13]">
              <div className="flex items-center gap-1.5 font-bold text-red-800 font-mono uppercase mb-1">
                <MessageSquare className="w-3.5 h-3.5" />
                Detective Case Findings
              </div>
              <p className="font-serif italic leading-relaxed">
                "{card.notes || 'Forensic analysis matches witness recollection at the scene.'}"
              </p>
            </div>
          </div>
        </div>
      )}
    </>
  );
};
