export interface StoryArtworkMeta {
  img: string;
  caption: string;
  quote: string;
  badge: string;
}

export const GENRE_ARTWORK_MAP: Record<string, StoryArtworkMeta> = {
  all: {
    img: '/assets/classic_detective.jpg',
    caption: 'Classic Noir Investigation',
    quote: '"Every shadow holds a witness. Every truth is a puzzle."',
    badge: 'CLASSIFIED DETECTIVE DOSSIER',
  },
  horror: {
    img: '/assets/horror_mystery.jpg',
    caption: 'Supernatural Horror File',
    quote: '"Whispers in the fog... An ancient mansion that never sleeps."',
    badge: 'SUPERNATURAL / OCCULT ARCHIVE',
  },
  cyberpunk: {
    img: '/assets/scifi_noir.jpg',
    caption: 'Cyberpunk Noir Incident',
    quote: '"Encrypted ledgers and neon rain. Nothing remains deleted."',
    badge: 'TECH-CRIME / CORPORATE NOIR',
  },
  locked_room: {
    img: '/assets/locked_room.jpg',
    caption: 'Impossible Crime Scene',
    quote: '"A sealed chamber, shattered showcase, and vanished culprit."',
    badge: 'LOCKED ROOM FORENSICS',
  },
  heist: {
    img: '/assets/museum_heist.jpg',
    caption: 'Midnight Museum Heist',
    quote: '"Midnight vault breach. The diamond vanished in sixty seconds."',
    badge: 'GRAND THEFT & HEIST DOSSIER',
  },
  romance: {
    img: '/assets/classic_detective.jpg',
    caption: 'Secrets & Alibis',
    quote: '"Lost letters and midnight trains. An alibi written in grief."',
    badge: 'CONFIDENTIAL SECRETS',
  },
};

export function getStoryArtwork(genre?: string, title?: string, caseId?: string): StoryArtworkMeta {
  if (caseId && GENRE_ARTWORK_MAP[caseId]) {
    return GENRE_ARTWORK_MAP[caseId];
  }

  const text = `${genre || ''} ${title || ''} ${caseId || ''}`.toLowerCase();

  if (text.includes('horror') || text.includes('ghost') || text.includes('haunt') || text.includes('supernatural') || text.includes('blackwood')) {
    return GENRE_ARTWORK_MAP.horror;
  }
  if (text.includes('cyber') || text.includes('scifi') || text.includes('sci-fi') || text.includes('tech') || text.includes('corporate') || text.includes('neon')) {
    return GENRE_ARTWORK_MAP.cyberpunk;
  }
  if (text.includes('locked') || text.includes('chamber') || text.includes('room') || text.includes('manor') || text.includes('study') || text.includes('impossible')) {
    return GENRE_ARTWORK_MAP.locked_room;
  }
  if (text.includes('heist') || text.includes('museum') || text.includes('vault') || text.includes('diamond') || text.includes('robbery')) {
    return GENRE_ARTWORK_MAP.heist;
  }
  if (text.includes('romance') || text.includes('letter') || text.includes('passion')) {
    return GENRE_ARTWORK_MAP.romance;
  }

  return GENRE_ARTWORK_MAP.all;
}
