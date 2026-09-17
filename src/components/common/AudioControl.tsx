import React, { useState } from 'react';
import { Volume2, VolumeX, Music, Bell } from 'lucide-react';
import { SoundService } from '../../services/soundService';

interface AudioControlProps {
  className?: string;
  showMenu?: boolean;
}

export const AudioControl: React.FC<AudioControlProps> = ({ className = '', showMenu = true }) => {
  const [isMuted, setIsMuted] = useState<boolean>(() => SoundService.getMuted());
  const [isMusicEnabled, setIsMusicEnabled] = useState<boolean>(() => SoundService.getMusicEnabled());
  const [isOpen, setIsOpen] = useState<boolean>(false);

  const handleToggleMute = (e: React.MouseEvent) => {
    e.stopPropagation();
    const next = SoundService.toggleMute();
    setIsMuted(next);
  };

  const handleToggleMusic = (e: React.MouseEvent) => {
    e.stopPropagation();
    const next = SoundService.toggleMusic();
    setIsMusicEnabled(next);
    SoundService.playClick();
  };

  return (
    <div className={`relative inline-flex items-center ${className}`}>
      <button
        onClick={handleToggleMute}
        onContextMenu={(e) => {
          e.preventDefault();
          if (showMenu) setIsOpen(!isOpen);
        }}
        title={isMuted ? 'Unmute Audio (Right-click for options)' : 'Mute Audio (Right-click for options)'}
        className={`p-1.5 sm:p-2 rounded-lg transition-all flex items-center gap-1.5 cursor-pointer ${
          isMuted
            ? 'bg-slate-900/80 border border-slate-700/60 text-slate-500 hover:text-slate-300 hover:border-slate-500'
            : 'bg-amber-950/40 border border-amber-500/40 text-amber-300 hover:border-amber-400 hover:bg-amber-900/50 shadow-[0_0_10px_rgba(245,158,11,0.15)]'
        }`}
      >
        {isMuted ? (
          <VolumeX className="w-4 h-4" />
        ) : (
          <div className="flex items-center gap-1">
            <Volume2 className="w-4 h-4 text-amber-400" />
            <span className="hidden xl:inline-flex items-end gap-[2px] h-3 ml-0.5">
              <span className="w-[2px] bg-amber-400 rounded-full h-1.5 animate-pulse" />
              <span className="w-[2px] bg-amber-400 rounded-full h-3 animate-pulse delay-75" />
              <span className="w-[2px] bg-amber-400 rounded-full h-2 animate-pulse delay-150" />
            </span>
          </div>
        )}
      </button>

      {/* Mini Options Popup on long-click / right-click or toggle button */}
      {isOpen && (
        <>
          <div className="fixed inset-0 z-40" onClick={() => setIsOpen(false)} />
          <div className="absolute right-0 top-full mt-2 w-48 bg-[#0c0f17] border border-slate-700 rounded-xl shadow-2xl p-3 z-50 text-xs font-sans">
            <div className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider mb-2 font-mono">
              Audio Settings
            </div>

            <button
              onClick={handleToggleMute}
              className="w-full flex items-center justify-between py-1.5 px-2 rounded-lg hover:bg-slate-800 text-slate-200 transition-colors"
            >
              <span className="flex items-center gap-2">
                <Bell className="w-3.5 h-3.5 text-amber-400" />
                Master Sound
              </span>
              <span className={isMuted ? 'text-red-400 font-bold' : 'text-emerald-400 font-bold'}>
                {isMuted ? 'OFF' : 'ON'}
              </span>
            </button>

            <button
              onClick={handleToggleMusic}
              className="w-full flex items-center justify-between py-1.5 px-2 rounded-lg hover:bg-slate-800 text-slate-200 transition-colors mt-1"
            >
              <span className="flex items-center gap-2">
                <Music className="w-3.5 h-3.5 text-amber-400" />
                Noir Music
              </span>
              <span className={!isMusicEnabled ? 'text-slate-500 font-bold' : 'text-emerald-400 font-bold'}>
                {isMusicEnabled && !isMuted ? 'ON' : 'OFF'}
              </span>
            </button>
          </div>
        </>
      )}
    </div>
  );
};
