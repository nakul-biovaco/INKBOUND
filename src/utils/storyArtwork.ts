export interface StoryArtworkMeta {
  img: string;
  caption: string;
  quote: string;
  badge: string;
}

export const STORY_ARTWORK_POOL: StoryArtworkMeta[] = [
  {
    img: '/assets/stories/story_01_noir_alley.jpg',
    caption: 'Rain-Slicked Noir Alleyway',
    quote: '"Footsteps echoed through the midnight mist, then suddenly stopped."',
    badge: 'COLD CASE ARCHIVE',
  },
  {
    img: '/assets/stories/story_02_asylum.jpg',
    caption: 'Abandoned Psychiatric Ward',
    quote: '"The heavy iron ward was padlocked from outside twenty years ago."',
    badge: 'SUPERNATURAL / OCCULT',
  },
  {
    img: '/assets/stories/story_03_mansion_library.jpg',
    caption: 'The Manor Study & Crime Scene',
    quote: '"The mahogany study door was bolted from within. Not a single pane was cracked."',
    badge: 'LOCKED ROOM FORENSICS',
  },
  {
    img: '/assets/stories/story_04_foggy_train.jpg',
    caption: 'Midnight Steam Express Platform',
    quote: '"Two tickets were stamped at 11:11 PM. Only one passenger ever boarded."',
    badge: 'TRANSIT CRIME DOSSIER',
  },
  {
    img: '/assets/stories/story_05_clock_tower.jpg',
    caption: 'The Ancient Clock Tower Chamber',
    quote: '"The great brass bell struck thirteen times before the mechanism jammed forever."',
    badge: 'HISTORIC INVESTIGATION',
  },
  {
    img: '/assets/stories/story_06_forensic_desk.jpg',
    caption: 'Detective Bureau Evidence Desk',
    quote: '"The latent fingerprint ledger contradicts the coroner\'s official timeline."',
    badge: 'CONFIDENTIAL EVIDENCE',
  },
  {
    img: '/assets/stories/story_07_neon_cyberpunk.jpg',
    caption: 'Neon District Crime Scene',
    quote: '"Corrupted memory logs and encrypted drives. Nothing stays deleted in the lower city."',
    badge: 'TECH-CRIME / CYBER NOIR',
  },
  {
    img: '/assets/stories/story_08_lighthouse.jpg',
    caption: 'The Stormy Coast Lighthouse',
    quote: '"The beacon went dark at 3:13 AM. The keeper\'s logbook was torn from its binding."',
    badge: 'COASTAL MARITIME FILE',
  },
  {
    img: '/assets/stories/story_09_bank_vault.jpg',
    caption: 'Subterranean Vault Breach',
    quote: '"The master vault was breached from underneath without tripping a single alarm."',
    badge: 'GRAND THEFT ARCHIVE',
  },
  {
    img: '/assets/stories/story_10_classic_noir.jpg',
    caption: 'Classic Shadow & Rain Investigation',
    quote: '"Every witness tells a fragment of the truth, wrapped inside a careful lie."',
    badge: 'CLASSIC NOIR DOSSIER',
  },
  {
    img: '/assets/stories/story_11_horror_investigation.jpg',
    caption: 'Blackwood Estate Haunting',
    quote: '"Every mirror was draped in black cloth before the family vanished."',
    badge: 'PARANORMAL FORENSICS',
  },
  {
    img: '/assets/stories/story_12_locked_room.jpg',
    caption: 'Sealed Chamber Deduction',
    quote: '"A shattered showcase, a locked brass latch, and a vanished suspect."',
    badge: 'IMPOSSIBLE CRIME FILE',
  },
  {
    img: '/assets/stories/story_13_scifi_cyber.jpg',
    caption: 'Synthetics Syndicate Raid',
    quote: '"A phantom digital imprint left behind inside the core database of room 404."',
    badge: 'SPECIAL INVESTIGATION UNIT',
  },
  {
    img: '/assets/stories/story_14_museum_heist.jpg',
    caption: 'National Gallery Midnight Heist',
    quote: '"The velvet stanchions were undisturbed. The masterpiece vanished into thin air."',
    badge: 'MASTER HEIST DIVISION',
  },
  {
    img: '/assets/stories/story_15_detective_desk.jpg',
    caption: 'Chief Inspector\'s Final Dossier',
    quote: '"All forensic evidence points toward one inevitable, chilling deduction."',
    badge: 'CHIEF DETECTIVE ARCHIVE',
  },
];

export const GENRE_ARTWORK_MAP: Record<string, StoryArtworkMeta> = {
  all: STORY_ARTWORK_POOL[9], // classic noir
  horror: STORY_ARTWORK_POOL[1], // asylum
  cyberpunk: STORY_ARTWORK_POOL[6], // neon
  locked_room: STORY_ARTWORK_POOL[2], // library
  heist: STORY_ARTWORK_POOL[8], // bank vault
  romance: STORY_ARTWORK_POOL[3], // foggy train
};

function stringToHash(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = (hash << 5) - hash + str.charCodeAt(i);
    hash |= 0;
  }
  return Math.abs(hash);
}

export function getStoryArtwork(genre?: string, title?: string, caseId?: string): StoryArtworkMeta {
  const seed = `${title || ''} ${caseId || ''}`.trim();

  // If a specific caseId matches default genre map exactly
  if (caseId && GENRE_ARTWORK_MAP[caseId]) {
    return GENRE_ARTWORK_MAP[caseId];
  }

  // If title/caseId is provided, deterministically assign one of the 15 photographic artworks
  // so all players in the multiplayer room see the EXACT same image in real time
  if (seed.length > 0) {
    const text = `${genre || ''} ${title || ''} ${caseId || ''}`.toLowerCase();

    // Specific thematic keyword alignments for rich storytelling
    if (text.includes('train') || text.includes('passenger') || text.includes('platform') || text.includes('ticket')) {
      return STORY_ARTWORK_POOL[3]; // foggy train
    }
    if (text.includes('clock') || text.includes('time') || text.includes('3:13') || text.includes('11:11')) {
      return STORY_ARTWORK_POOL[4]; // clock tower
    }
    if (text.includes('asylum') || text.includes('hospital') || text.includes('corridor') || text.includes('patient')) {
      return STORY_ARTWORK_POOL[1]; // asylum
    }
    if (text.includes('lighthouse') || text.includes('coast') || text.includes('ship') || text.includes('water')) {
      return STORY_ARTWORK_POOL[7]; // lighthouse
    }
    if (text.includes('vault') || text.includes('bank') || text.includes('heist') || text.includes('gold')) {
      return STORY_ARTWORK_POOL[8]; // bank vault
    }
    if (text.includes('museum') || text.includes('painting') || text.includes('canvas') || text.includes('art')) {
      return STORY_ARTWORK_POOL[13]; // museum heist
    }
    if (text.includes('cyber') || text.includes('neon') || text.includes('room 404') || text.includes('terminal')) {
      return STORY_ARTWORK_POOL[6]; // neon cyberpunk
    }
    if (text.includes('blackwood') || text.includes('haunt') || text.includes('house that remembers')) {
      return STORY_ARTWORK_POOL[10]; // horror blackwood
    }
    if (text.includes('study') || text.includes('locked') || text.includes('manor') || text.includes('library')) {
      return STORY_ARTWORK_POOL[2]; // mansion library
    }
    if (text.includes('alley') || text.includes('shadow') || text.includes('suspect') || text.includes('midnight')) {
      return STORY_ARTWORK_POOL[0]; // noir alley
    }
    if (text.includes('desk') || text.includes('office') || text.includes('evidence') || text.includes('ledger')) {
      return STORY_ARTWORK_POOL[5]; // forensic desk
    }

    // Hash fallback across all 15 diverse images
    const index = stringToHash(seed) % STORY_ARTWORK_POOL.length;
    return STORY_ARTWORK_POOL[index];
  }

  // Genre fallback
  if (genre && GENRE_ARTWORK_MAP[genre.toLowerCase()]) {
    return GENRE_ARTWORK_MAP[genre.toLowerCase()];
  }

  return STORY_ARTWORK_POOL[stringToHash(genre || 'all') % STORY_ARTWORK_POOL.length];
}
