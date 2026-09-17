import React from 'react';
import {
  Briefcase,
  Crown,
  Eye,
  LucideIcon,
  Search,
  ScrollText,
  Shield,
  Sparkles,
  UserRound,
} from 'lucide-react';

export type AvatarId =
  | 'detective'
  | 'magnifier'
  | 'casefile'
  | 'scroll'
  | 'shield'
  | 'crown'
  | 'spark'
  | 'eye';

type AvatarTone = {
  label: string;
  icon: LucideIcon;
  gradient: string;
  ring: string;
  glow: string;
};

const AVATAR_STYLES: Record<AvatarId, AvatarTone> = {
  detective: {
    label: 'Detective',
    icon: UserRound,
    gradient: 'from-slate-700 via-slate-800 to-slate-950',
    ring: 'ring-slate-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(148,163,184,0.25),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  magnifier: {
    label: 'Magnifier',
    icon: Search,
    gradient: 'from-cyan-700 via-sky-700 to-slate-950',
    ring: 'ring-cyan-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(34,211,238,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  casefile: {
    label: 'Case File',
    icon: Briefcase,
    gradient: 'from-amber-700 via-orange-700 to-slate-950',
    ring: 'ring-amber-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(251,191,36,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  scroll: {
    label: 'Archive',
    icon: ScrollText,
    gradient: 'from-rose-700 via-red-700 to-slate-950',
    ring: 'ring-rose-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(251,113,133,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  shield: {
    label: 'Shield',
    icon: Shield,
    gradient: 'from-emerald-700 via-teal-700 to-slate-950',
    ring: 'ring-emerald-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(52,211,153,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  crown: {
    label: 'Crown',
    icon: Crown,
    gradient: 'from-violet-700 via-fuchsia-700 to-slate-950',
    ring: 'ring-violet-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(196,181,253,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  spark: {
    label: 'Spark',
    icon: Sparkles,
    gradient: 'from-fuchsia-700 via-pink-700 to-slate-950',
    ring: 'ring-fuchsia-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(244,114,182,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
  eye: {
    label: 'Eye',
    icon: Eye,
    gradient: 'from-indigo-700 via-blue-700 to-slate-950',
    ring: 'ring-indigo-400/30',
    glow: 'shadow-[0_0_0_1px_rgba(129,140,248,0.22),0_10px_24px_rgba(2,6,23,0.35)]',
  },
};

const LEGACY_AVATAR_MAP: Record<string, AvatarId> = {
  '🕵️‍♂️': 'detective',
  '🕵️‍♀️': 'detective',
  '🔍': 'magnifier',
  '💼': 'casefile',
  '📜': 'scroll',
  '🛡️': 'shield',
  '🎩': 'crown',
  '✨': 'spark',
  '👁️': 'eye',
};

export const AVATAR_OPTIONS: AvatarId[] = [
  'detective',
  'magnifier',
  'casefile',
  'scroll',
  'shield',
  'crown',
  'spark',
  'eye',
];

export const normalizeAvatarId = (avatar: string | undefined | null): AvatarId => {
  if (!avatar) return 'detective';
  if (avatar in AVATAR_STYLES) return avatar as AvatarId;
  return LEGACY_AVATAR_MAP[avatar] || 'detective';
};

interface AvatarBadgeProps {
  avatar: string;
  className?: string;
  size?: 'xs' | 'sm' | 'md' | 'lg';
  showLabel?: boolean;
}

export const AvatarBadge: React.FC<AvatarBadgeProps> = ({
  avatar,
  className = '',
  size = 'md',
  showLabel = false,
}) => {
  const avatarId = normalizeAvatarId(avatar);
  const config = AVATAR_STYLES[avatarId];
  const Icon = config.icon;

  const sizeClasses = {
    xs: 'w-6 h-6',
    sm: 'w-8 h-8',
    md: 'w-10 h-10',
    lg: 'w-12 h-12',
  }[size];

  const iconSize = {
    xs: 'w-3 h-3',
    sm: 'w-4 h-4',
    md: 'w-5 h-5',
    lg: 'w-6 h-6',
  }[size];

  return (
    <span
      className={`inline-flex items-center justify-center rounded-full bg-gradient-to-br ${config.gradient} ${config.glow} ring-1 ${config.ring} ${sizeClasses} ${className}`}
      title={showLabel ? config.label : undefined}
      aria-label={config.label}
    >
      <Icon className={`${iconSize} text-white drop-shadow-sm`} />
    </span>
  );
};

interface AvatarPickerProps {
  value: string;
  onChange: (avatar: string) => void;
  className?: string;
}

export const AvatarPicker: React.FC<AvatarPickerProps> = ({ value, onChange, className = '' }) => {
  return (
    <div className={`grid grid-cols-2 gap-2 sm:grid-cols-4 lg:grid-cols-4 xl:grid-cols-8 ${className}`}>
      {AVATAR_OPTIONS.map((avatar) => (
        <button
          key={avatar}
          type="button"
          onClick={() => onChange(avatar)}
          className={`group flex min-h-[96px] flex-col items-center gap-2 rounded-2xl border p-3 sm:p-3.5 transition-all cursor-pointer ${
            normalizeAvatarId(value) === avatar
              ? 'border-red-500 bg-red-950/50 shadow-lg scale-[1.03]'
              : 'border-slate-800 bg-slate-900/70 hover:border-slate-600'
          }`}
        >
          <AvatarBadge avatar={avatar} size="lg" className="shrink-0" />
          <span className="text-center text-[10px] sm:text-[11px] font-mono uppercase leading-tight tracking-wide text-slate-400 group-hover:text-slate-200">
            {AVATAR_STYLES[avatar].label}
          </span>
        </button>
      ))}
    </div>
  );
};
