import React from 'react';
import { Clock, Sparkles } from 'lucide-react';
import { AuthoritativeGameState, EvidenceCard } from '../../types/game';
import { Player } from '../../types/player';

interface TimelineBoardProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  onSlotEvidence: (slotTime: string, evidenceId: string | null) => void;
  selectedEvidenceId: string | null;
}

const TIMELINE_STEPS = [
  { time: '11:30 PM', label: 'Someone enters' },
  { time: '11:40 PM', label: 'Alarm triggers' },
  { time: '11:50 PM', label: 'Car leaves' },
  { time: '12:10 AM', label: 'Police arrives' },
  { time: '12:30 AM', label: 'Evidence logged' },
];

const parchmentStyle: React.CSSProperties = {
  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
  backgroundSize: '16px 16px, 100% 100%',
};

export const TimelineBoard: React.FC<TimelineBoardProps> = ({
  gameState,
  onSlotEvidence,
  selectedEvidenceId,
}) => {
  const evidenceMap = new Map<string, EvidenceCard>();
  gameState.evidenceCards.forEach((c) => evidenceMap.set(c.id, c));

  // Determine unplaced cards
  const placedEvidenceIds = new Set(Object.values(gameState.timelineSlots).filter(Boolean));
  const unplacedCards = gameState.evidenceCards.filter((c) => !placedEvidenceIds.has(c.id));

  return (
    <div
      className="w-full border-2 border-[#8c6d48] rounded-3xl p-5 sm:p-7 shadow-xl space-y-7 select-none text-[#221711] relative overflow-hidden"
      style={parchmentStyle}
    >
      <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute -top-1.5 left-7 w-3.5 h-7 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

      {/* Header */}
      <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
        <div>
          <div className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase tracking-wider mb-1">
            <Clock className="w-2.5 h-2.5 text-red-800" /> OFFICIAL TIME LOG
          </div>
          <h3 className="text-base sm:text-lg font-black text-[#1a110a] font-serif tracking-wide">
            Chronological Incident Timeline
          </h3>
          <p className="text-[11px] text-[#5c4028] font-mono">
            Slot witness sketches into sequence to reconstruct the heist.
          </p>
        </div>
      </div>

      {/* 1. HORIZONTAL TIMELINE BAR */}
      <div>
        <div className="relative flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-4 mb-6 px-1 sm:px-4">
          {/* Horizontal Line connecting time points */}
          <div className="absolute hidden sm:block top-1/2 left-8 right-8 h-[3px] bg-[#8c6d48] -translate-y-1/2 z-0 rounded-full" />

          {TIMELINE_STEPS.map((step) => {
            const slottedId = gameState.timelineSlots[step.time];
            const isSlotted = Boolean(slottedId);

            return (
              <div key={step.time} className="relative z-10 flex flex-col items-center">
                <div
                  className={`w-3.5 h-3.5 rounded-full border-2 transition-all ${
                    isSlotted
                      ? 'bg-red-700 border-red-950 shadow-md scale-110'
                      : 'bg-[#ede0ce] border-[#8c6d48]'
                  }`}
                />
                <span className="text-[11px] font-mono text-[#4a3322] mt-2 font-bold">
                  {step.time}
                </span>
              </div>
            );
          })}
        </div>

        {/* Slotted Cards Grid matching the 5 timestamps */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-5 gap-3.5">
          {TIMELINE_STEPS.map((step) => {
            const slottedId = gameState.timelineSlots[step.time];
            const slottedCard = slottedId ? evidenceMap.get(slottedId) : null;

            return (
              <div
                key={step.time}
                onClick={() => {
                  if (selectedEvidenceId) {
                    onSlotEvidence(step.time, selectedEvidenceId);
                  } else if (slottedId) {
                    onSlotEvidence(step.time, null);
                  }
                }}
                className={`flex flex-col items-center rounded-2xl p-3 border-2 transition-all cursor-pointer shadow-sm ${
                  slottedCard
                    ? 'bg-[#fdfbf6] border-[#8c6d48] hover:border-red-800'
                    : selectedEvidenceId
                    ? 'bg-[#ede0ce]/60 border-dashed border-red-800 hover:bg-red-50'
                    : 'bg-[#f5ecdd]/40 border-dashed border-[#b89e7c]'
                }`}
              >
                {/* Event Label Tag */}
                <div className="px-2 py-1 rounded-lg bg-[#ede0ce] border border-[#bfa98e] text-[10px] font-mono text-[#3e2b1b] font-black uppercase mb-2.5 text-center w-full truncate">
                  {step.label}
                </div>

                {/* Evidence Card Display */}
                {slottedCard ? (
                  <div className="w-full aspect-[4/3] bg-[#fcf8f1] rounded-xl p-1.5 shadow-inner overflow-hidden flex flex-col items-center justify-center border border-[#b89e7c]">
                    {slottedCard.drawingPreview ? (
                      <img
                        src={slottedCard.drawingPreview}
                        alt={slottedCard.title}
                        className="w-full h-full object-contain"
                      />
                    ) : (
                      <span className="text-[10px] text-[#5c4028] font-mono">Sketch</span>
                    )}
                  </div>
                ) : (
                  <div className="w-full aspect-[4/3] rounded-xl flex items-center justify-center text-center text-xs text-[#8c6d48] font-mono">
                    {selectedEvidenceId ? 'Click to assign' : 'Empty slot'}
                  </div>
                )}

                {slottedCard && (
                  <div className="mt-2 text-[10px] font-bold text-[#1a110a] truncate w-full text-center">
                    By {slottedCard.sourcePlayerName}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>

      {/* 2. UNPLACED EVIDENCE SECTION */}
      <div className="pt-5 border-t border-[#bfa98e]/80">
        <h4 className="text-xs font-mono font-bold uppercase tracking-wider text-[#7a5839] mb-3 flex items-center gap-1.5">
          <Sparkles className="w-3.5 h-3.5 text-red-800" />
          <span>Unplaced Evidence Clues ({unplacedCards.length})</span>
        </h4>

        {unplacedCards.length === 0 ? (
          <p className="text-xs text-[#5c4028] font-mono">
            ✓ All discovered drawings have been placed into the timeline!
          </p>
        ) : (
          <div className="flex flex-wrap gap-3 sm:gap-4 items-center">
            {unplacedCards.map((card) => {
              const isSelected = selectedEvidenceId === card.id;

              return (
                <div
                  key={card.id}
                  onClick={() => {
                    const emptySlot = TIMELINE_STEPS.find(
                      (s) => !gameState.timelineSlots[s.time]
                    );
                    if (emptySlot) {
                      onSlotEvidence(emptySlot.time, card.id);
                    }
                  }}
                  className={`w-28 sm:w-32 bg-[#fdfbf6] p-2 rounded-xl border-2 shadow-md cursor-pointer transition-all transform hover:scale-105 ${
                    isSelected ? 'border-red-800 ring-2 ring-red-800' : 'border-[#8c6d48]'
                  }`}
                >
                  <div className="w-full aspect-[4/3] bg-[#fcf8f1] rounded-lg overflow-hidden flex items-center justify-center border border-[#b89e7c] shadow-inner">
                    {card.drawingPreview ? (
                      <img
                        src={card.drawingPreview}
                        alt={card.title}
                        className="w-full h-full object-contain p-0.5"
                      />
                    ) : (
                      <span className="text-[9px] text-[#8c6d48] font-mono">Clue</span>
                    )}
                  </div>
                  <div className="text-[10px] text-[#1a110a] font-serif font-bold text-center mt-1 truncate">
                    {card.sourcePlayerName}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
};
