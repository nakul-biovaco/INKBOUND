import React from 'react';
import { Search } from 'lucide-react';

export interface CaseProgressView {
  totalEvents: number;
  discoveredEvents: number;
  percentage: number;
  caseTitle: string;
  caseSetting?: string;
  caseGenre?: string;
}

interface CaseProgressBarProps {
  progress: CaseProgressView | null;
}

export const CaseProgressBar: React.FC<CaseProgressBarProps> = ({ progress }) => {
  if (!progress) return null;

  const pct = Math.max(0, Math.min(100, progress.percentage || 0));

  return (
    <div className="fixed top-14 sm:top-16 left-1/2 -translate-x-1/2 z-40 w-[min(92vw,420px)] pointer-events-none">
      <div
        className="rounded-xl border-2 border-[#8c6d48] px-3 py-1.5 shadow-xl text-[#221711]"
        style={{
          background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
        }}
      >
        <div className="flex items-center justify-between gap-2 text-[10px] font-mono font-black uppercase tracking-wider">
          <span className="flex items-center gap-1 truncate">
            <Search className="w-3 h-3 text-red-800" />
            {progress.caseTitle || 'Active Case'}
          </span>
          <span className="text-red-800 tabular-nums shrink-0">
            {progress.discoveredEvents}/{progress.totalEvents || 0} • {pct}%
          </span>
        </div>
        <div className="mt-1 h-1.5 rounded-full bg-[#ede1cf] border border-[#b89e7c] overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-red-800 to-amber-700 transition-all duration-500"
            style={{ width: `${pct}%` }}
          />
        </div>
      </div>
    </div>
  );
};
