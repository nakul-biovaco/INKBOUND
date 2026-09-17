import React from 'react';
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
    <div className="w-full bg-[#121622]/90 border border-slate-700/80 rounded-2xl p-4 sm:p-6 shadow-2xl space-y-8 select-none">
      {/* 1. HORIZONTAL TIMELINE BAR */}
      <div>
        <div className="relative flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-4 mb-8 px-1 sm:px-4">
          {/* Horizontal Line connecting time points */}
          <div className="absolute hidden sm:block top-1/2 left-8 right-8 h-[2px] bg-slate-700 -translate-y-1/2 z-0" />

          {TIMELINE_STEPS.map((step) => {
            const slottedId = gameState.timelineSlots[step.time];
            const isSlotted = Boolean(slottedId);

            return (
              <div key={step.time} className="relative z-10 flex flex-col items-center">
                <div
                  className={`w-3 h-3 rounded-full border-2 transition-all ${
                    isSlotted
                      ? 'bg-sky-400 border-sky-300 shadow-[0_0_10px_rgba(56,189,248,0.8)]'
                      : 'bg-slate-900 border-slate-500'
                  }`}
                />
                <span className="text-[11px] font-mono text-slate-400 mt-2 font-semibold">
                  {step.time}
                </span>
              </div>
            );
          })}
        </div>

        {/* Slotted Cards Cards Grid matching the 5 timestamps */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-5 gap-4">
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
                className={`flex flex-col items-center rounded-xl p-3 border transition-all cursor-pointer ${
                  slottedCard
                    ? 'bg-slate-900/90 border-slate-600 shadow-md'
                    : selectedEvidenceId
                    ? 'bg-slate-900/40 border-dashed border-sky-500/80 hover:bg-sky-950/20'
                    : 'bg-slate-900/30 border-dashed border-slate-800'
                }`}
              >
                {/* Event Label Tag */}
                <div className="px-2.5 py-1 rounded bg-slate-800 border border-slate-700 text-[11px] font-mono text-slate-300 font-semibold mb-2.5 text-center w-full truncate">
                  {step.label}
                </div>

                {/* Evidence Card Display */}
                {slottedCard ? (
                  <div className="w-full aspect-[4/3] bg-white rounded-lg p-1.5 shadow overflow-hidden flex flex-col items-center justify-center">
                    {slottedCard.drawingPreview ? (
                      <img
                        src={slottedCard.drawingPreview}
                        alt={slottedCard.title}
                        className="w-full h-full object-contain"
                      />
                    ) : (
                      <span className="text-[10px] text-slate-700">Sketch</span>
                    )}
                  </div>
                ) : (
                  <div className="w-full aspect-[4/3] rounded-lg flex items-center justify-center text-center text-xs text-slate-500 font-mono">
                    {selectedEvidenceId ? 'Click to assign' : 'Drag evidence here'}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>

      {/* 2. UNPLACED EVIDENCE SECTION */}
      <div className="pt-6 border-t border-slate-800">
        <h4 className="text-xs font-mono uppercase tracking-wider text-slate-400 mb-3">
          Unplaced Evidence ({unplacedCards.length})
        </h4>

        {unplacedCards.length === 0 ? (
          <p className="text-xs text-slate-500 font-mono">
            All visual evidence has been positioned onto the case timeline!
          </p>
        ) : (
          <div className="flex flex-wrap gap-3 sm:gap-4 items-center">
            {unplacedCards.map((card) => {
              const isSelected = selectedEvidenceId === card.id;

              return (
                <div
                  key={card.id}
                  onClick={() => {
                    // Quick-assign to the first empty slot or toggle selection
                    const emptySlot = TIMELINE_STEPS.find(
                      (s) => !gameState.timelineSlots[s.time]
                    );
                    if (emptySlot) {
                      onSlotEvidence(emptySlot.time, card.id);
                    }
                  }}
                  className={`w-28 sm:w-32 bg-white p-2 rounded-lg shadow-md cursor-pointer transition-all transform hover:scale-105 ${
                    isSelected ? 'ring-2 ring-red-500' : ''
                  }`}
                >
                  <div className="w-full aspect-[4/3] bg-slate-100 rounded overflow-hidden flex items-center justify-center">
                    {card.drawingPreview ? (
                      <img
                        src={card.drawingPreview}
                        alt={card.title}
                        className="w-full h-full object-contain"
                      />
                    ) : (
                      <span className="text-[9px] text-slate-400">Card</span>
                    )}
                  </div>
                  <div className="text-[10px] text-slate-700 font-serif font-bold text-center mt-1 truncate">
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
