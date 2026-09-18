import { PromptOption, StoryEvent } from '../types/index.js';
import { MarkdownStoryParser } from './MarkdownStoryParser.js';

export interface MysteryClueDefinition {
  text: string;
  category: string;
  genre: 'noir' | 'thriller' | 'horror' | 'romance' | 'scifi' | 'adventure' | 'all';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  visualElements: string[];
  acceptedConcepts: string[];
  hint: string;
}

// Master categorized clue database: mystery, detective, thriller, crime, and dramatic story items
export const MASTER_MYSTERY_CLUES: MysteryClueDefinition[] = [
  // ============================================================
  // 1. CRIME SCENE EVIDENCE & FORENSICS (EASY & MEDIUM)
  // ============================================================
  {
    text: 'Bloody Footprint',
    category: 'Forensic Evidence',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['red shoe print', 'floor tiles', 'blood spatter'],
    acceptedConcepts: ['bloody footprint', 'shoe print', 'boot print', 'footprint', 'blood print'],
    hint: 'Evidence left on the crime scene floor.',
  },
  {
    text: 'Broken Pocket Watch',
    category: 'Personal Item',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['cracked glass face', 'roman numerals', 'gold chain', 'stopped hands'],
    acceptedConcepts: ['pocket watch', 'broken watch', 'gold watch', 'broken pocket watch', 'stopwatch'],
    hint: 'A timepiece frozen at the exact time of the incident.',
  },
  {
    text: 'Cyanide Vial',
    category: 'Poison & Chemistry',
    genre: 'noir',
    difficulty: 'MEDIUM',
    visualElements: ['small glass bottle', 'skull label', 'dropper', 'green liquid'],
    acceptedConcepts: ['cyanide', 'poison bottle', 'vial', 'toxic bottle', 'poison vial', 'chemical'],
    hint: 'A tiny bottle containing lethal liquid.',
  },
  {
    text: 'Torn Train Ticket',
    category: 'Travel Evidence',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['ripped paper', 'stamped time', 'barcode or punch hole', 'train logo'],
    acceptedConcepts: ['train ticket', 'torn ticket', 'ticket', 'stub', 'rail ticket'],
    hint: 'Proof that a passenger boarded the midnight express.',
  },
  {
    text: 'Fingerprint on Glass',
    category: 'Forensic Evidence',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['spiral fingerprint ridges', 'magnifying glass', 'wine glass or window'],
    acceptedConcepts: ['fingerprint', 'glass fingerprint', 'thumbprint', 'print on glass'],
    hint: 'A smudge left on a drinking cup or window pane.',
  },
  {
    text: 'Burnt Love Letter',
    category: 'Personal Document',
    genre: 'romance',
    difficulty: 'MEDIUM',
    visualElements: ['singed paper edges', 'cursive writing', 'envelope', 'ashes and flame'],
    acceptedConcepts: ['burnt letter', 'love letter', 'letter', 'envelope', 'burned note', 'secret message'],
    hint: 'A charred note containing forbidden confessions.',
  },
  {
    text: 'Forged Passport',
    category: 'Identity & Transit',
    genre: 'thriller',
    difficulty: 'MEDIUM',
    visualElements: ['passport booklet', 'tampered photo', 'fake visa stamp', 'embossed crest'],
    acceptedConcepts: ['fake passport', 'forged passport', 'passport', 'fake id', 'alias document'],
    hint: 'Travel credentials bearing a false identity.',
  },
  {
    text: 'Brass Vault Key',
    category: 'Security & Access',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['heavy antique key', 'brass metal', 'teeth grooves', 'keychain tag'],
    acceptedConcepts: ['vault key', 'brass key', 'skeleton key', 'master key', 'key'],
    hint: 'An ornate tool that unlocks the subterranean safe.',
  },
  {
    text: 'Shattered Wine Glass',
    category: 'Crime Scene Evidence',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['broken stemware', 'spilled red liquid', 'sharp glass shards'],
    acceptedConcepts: ['broken glass', 'wine glass', 'shattered glass', 'spilled wine', 'champagne flute'],
    hint: 'Drinkware smashed during a sudden banquet confrontation.',
  },
  {
    text: 'Black Leather Gloves',
    category: 'Disguise & Concealment',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['pair of dark gloves', 'stitched fingers', 'dropped near doorway'],
    acceptedConcepts: ['leather gloves', 'gloves', 'black gloves', 'burglar gloves'],
    hint: 'Worn to leave no fingerprints behind.',
  },
  {
    text: 'Smoking Revolver',
    category: 'Weapon & Ballistics',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['gun barrel', 'revolver cylinder', 'wisp of gray smoke', 'trigger'],
    acceptedConcepts: ['revolver', 'gun', 'pistol', 'smoking gun', 'handgun'],
    hint: 'A firearm that was discharged just seconds ago.',
  },
  {
    text: 'Hidden Microfilm',
    category: 'Espionage',
    genre: 'thriller',
    difficulty: 'HARD',
    visualElements: ['tiny transparent film strip', 'miniature frames', 'magnifier'],
    acceptedConcepts: ['microfilm', 'secret film', 'spy film', 'film strip', 'mini film'],
    hint: 'A microscopic strip storing state secrets.',
  },
  {
    text: 'Red Lipstick on Collar',
    category: 'Romantic Suspicion',
    genre: 'romance',
    difficulty: 'MEDIUM',
    visualElements: ['shirt collar', 'red lip stain', 'buttoned suit'],
    acceptedConcepts: ['lipstick on collar', 'lipstick stain', 'collar mark', 'kiss mark'],
    hint: 'Tell-tale crimson mark on an unfaithful lover’s shirt.',
  },
  {
    text: 'Security Camera Wire Cut',
    category: 'Sabotage',
    genre: 'thriller',
    difficulty: 'MEDIUM',
    visualElements: ['dome camera', 'severed cables', 'sparking copper wire'],
    acceptedConcepts: ['camera wire cut', 'cut wire', 'cut cable', 'severed wire', 'disabled camera'],
    hint: 'Intentionally snipped to blind the museum guards.',
  },
  {
    text: 'Diamond in Briefcase',
    category: 'Valuable Property',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['open leather briefcase', 'glowing gemstone', 'foam padding', 'currency stacks'],
    acceptedConcepts: ['diamond in briefcase', 'diamond briefcase', 'briefcase diamond', 'briefcase gem'],
    hint: 'A gleaming jewel concealed inside courier luggage.',
  },
  {
    text: 'Vintage Film Reel',
    category: 'Secret Record',
    genre: 'noir',
    difficulty: 'MEDIUM',
    visualElements: ['circular spool', 'celluloid film strip', 'projector light beam'],
    acceptedConcepts: ['film reel', 'movie reel', 'vintage reel', 'projector reel', 'film roll'],
    hint: 'Old footage capturing the truth behind the disappearance.',
  },
  {
    text: 'Blood on Chandelier',
    category: 'Crime Scene Evidence',
    genre: 'horror',
    difficulty: 'MEDIUM',
    visualElements: ['crystal chandelier', 'dripping crimson drop', 'hanging light'],
    acceptedConcepts: ['blood on chandelier', 'chandelier blood', 'dripping chandelier'],
    hint: 'Evidence found high above the ballroom floor.',
  },
  {
    text: 'Silver Lockpick',
    category: 'Burglary Tool',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['slender metal tension wrench', 'pick tool inserted in keyhole'],
    acceptedConcepts: ['lockpick', 'lock pick', 'tension wrench', 'lockpick tool'],
    hint: 'A burglar’s slender needle for cracking locked doors.',
  },
  {
    text: 'Encrypted Diary',
    category: 'Personal Document',
    genre: 'thriller',
    difficulty: 'MEDIUM',
    visualElements: ['leather-bound journal', 'brass padlock', 'ciphers and symbols'],
    acceptedConcepts: ['secret diary', 'locked diary', 'encrypted diary', 'journal', 'code book'],
    hint: 'A notebook filled with scrambled codes and secrets.',
  },
  {
    text: 'Torn Photograph',
    category: 'Personal Memory',
    genre: 'romance',
    difficulty: 'EASY',
    visualElements: ['photograph ripped in half', 'couple separated by jagged edge'],
    acceptedConcepts: ['torn photo', 'ripped photo', 'torn photograph', 'half photo', 'old picture'],
    hint: 'A picture of two people deliberately severed.',
  },

  // ============================================================
  // 2. SUSPECTS, DISGUISES & CONFRONTATIONS
  // ============================================================
  {
    text: 'Disguised Waiter',
    category: 'Undercover Suspect',
    genre: 'noir',
    difficulty: 'MEDIUM',
    visualElements: ['bowtie and vest', 'silver tray', 'listening ear', 'concealed wire'],
    acceptedConcepts: ['waiter', 'disguised waiter', 'spy waiter', 'fake waiter', 'catering spy'],
    hint: 'An operative posing as dinner staff at the gala.',
  },
  {
    text: 'Masked Intruder',
    category: 'Suspect',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['black balaclava or porcelain mask', 'dark hoodie', 'glowing eyes'],
    acceptedConcepts: ['masked intruder', 'burglar', 'intruder', 'thief', 'masked thief'],
    hint: 'A shadowy figure who slipped past perimeter lasers.',
  },
  {
    text: 'Security Guard Sleeping',
    category: 'Inside Job',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['uniform with badge', 'slumped at desk', 'coffee mug tipped', 'sleeping cap'],
    acceptedConcepts: ['sleeping guard', 'security guard sleeping', 'drugged guard', 'guard sleeping'],
    hint: 'The night watchman knocked out by poisoned coffee.',
  },
  {
    text: 'Whispering in Alleyway',
    category: 'Secret Meeting',
    genre: 'noir',
    difficulty: 'MEDIUM',
    visualElements: ['two trench-coat silhouettes', 'brick alley wall', 'street lamp light'],
    acceptedConcepts: ['whispering', 'alleyway meeting', 'secret conversation', 'hushed talk'],
    hint: 'Two conspirators exchanging whispers under the streetlight.',
  },
  {
    text: 'Shadow Behind Curtain',
    category: 'Suspense',
    genre: 'horror',
    difficulty: 'EASY',
    visualElements: ['tall silhouette', 'draped window curtain', 'creepy outline'],
    acceptedConcepts: ['shadow behind curtain', 'curtain shadow', 'window shadow', 'hidden figure'],
    hint: 'Someone standing motionless on the other side of the drapes.',
  },
  {
    text: 'Briefcase Handshake Exchange',
    category: 'Conspiracy',
    genre: 'thriller',
    difficulty: 'MEDIUM',
    visualElements: ['two hands shaking', 'leather briefcase between them', 'dim lighting'],
    acceptedConcepts: ['briefcase handoff', 'briefcase exchange', 'illegal deal', 'trade', 'handshake'],
    hint: 'A covert transaction sealed with a handshake.',
  },
  {
    text: 'Ticking Grandfather Clock',
    category: 'Time & Setting',
    genre: 'horror',
    difficulty: 'EASY',
    visualElements: ['tall wooden clock', 'swinging brass pendulum', 'clock face at midnight'],
    acceptedConcepts: ['grandfather clock', 'tall clock', 'antique clock', 'clock pendulum'],
    hint: 'A vintage standing clock chiming twelve in the hallway.',
  },
  {
    text: 'Antique Music Box',
    category: 'Haunted Artifact',
    genre: 'horror',
    difficulty: 'MEDIUM',
    visualElements: ['wooden box with winding key', 'spinning ballerina', 'musical notes'],
    acceptedConcepts: ['music box', 'antique music box', 'ballerina box', 'winding box'],
    hint: 'A wind-up box that plays an eerie melody by itself.',
  },
  {
    text: 'Red Sports Getaway Car',
    category: 'Escape Vehicle',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['sleek red convertible', 'spinning wheels', 'smoke trails', 'exhaust flame'],
    acceptedConcepts: ['getaway car', 'sports car', 'red car', 'escape car', 'speeding car'],
    hint: 'The vehicle that sped away from the back alley.',
  },
  {
    text: 'Secret Bookshelf Door',
    category: 'Hidden Passage',
    genre: 'noir',
    difficulty: 'MEDIUM',
    visualElements: ['wooden bookcase swinging outward', 'dark tunnel revealed', 'rows of books'],
    acceptedConcepts: ['secret door', 'bookshelf door', 'hidden passage', 'secret room', 'bookcase'],
    hint: 'A wall of books that swings open into a hidden chamber.',
  },

  // ============================================================
  // 3. SCI-FI & CYBER INVESTIGATION
  // ============================================================
  {
    text: 'Hacked Server Tower',
    category: 'Cyber Crime',
    genre: 'scifi',
    difficulty: 'MEDIUM',
    visualElements: ['server rack blinking', 'flashing red LED', 'code scrolling', 'unplugged cable'],
    acceptedConcepts: ['server tower', 'hacked server', 'server rack', 'data terminal', 'mainframe'],
    hint: 'A computer rack whose security firewalls were breached.',
  },
  {
    text: 'Glowing Hologram Projector',
    category: 'Futuristic Technology',
    genre: 'scifi',
    difficulty: 'EASY',
    visualElements: ['circular floor emitter', 'blue translucent 3D figure', 'light beams'],
    acceptedConcepts: ['hologram', 'hologram projector', 'holographic message', 'blue projector'],
    hint: 'A projected 3D phantom displaying the stolen blueprints.',
  },
  {
    text: 'Encrypted USB Drive',
    category: 'Digital Evidence',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['silver thumb drive', 'brass keychain', 'lock icon on side'],
    acceptedConcepts: ['usb drive', 'flash drive', 'thumb drive', 'memory stick', 'encrypted usb'],
    hint: 'A miniature drive containing leaked company files.',
  },
  {
    text: 'Laser Tripwire Grid',
    category: 'Security Defense',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['crisscrossing red beams', 'mist or smoke revealing lasers', 'vault floor'],
    acceptedConcepts: ['laser grid', 'lasers', 'laser tripwire', 'security lasers', 'red lasers'],
    hint: 'Glowing red beams guarding the museum vault floor.',
  },
  {
    text: 'Night Vision Goggles',
    category: 'Infiltration Gear',
    genre: 'thriller',
    difficulty: 'EASY',
    visualElements: ['two glowing green lenses', 'headband straps', 'dark background'],
    acceptedConcepts: ['night vision goggles', 'night vision', 'green goggles', 'tactical goggles'],
    hint: 'Allows an operative to navigate total blackout conditions.',
  },

  // ============================================================
  // 4. SUPERNATURAL & HORROR MYSTERY
  // ============================================================
  {
    text: 'Cursed Ouija Board',
    category: 'Occult Mystery',
    genre: 'horror',
    difficulty: 'EASY',
    visualElements: ['wooden board with letters', 'heart-shaped planchette', 'creepy candle'],
    acceptedConcepts: ['ouija board', 'spirit board', 'planchette', 'talking board'],
    hint: 'A wooden board used to communicate with the other side.',
  },
  {
    text: 'Mirror With No Reflection',
    category: 'Supernatural Anomaly',
    genre: 'horror',
    difficulty: 'MEDIUM',
    visualElements: ['ornate vintage mirror', 'person standing in front', 'empty glass surface'],
    acceptedConcepts: ['no reflection', 'empty mirror', 'cursed mirror', 'vampire mirror', 'mirror'],
    hint: 'The glass fails to cast the image of the person before it.',
  },
  {
    text: 'Sealed Room 404',
    category: 'Forbidden Chamber',
    genre: 'horror',
    difficulty: 'EASY',
    visualElements: ['hotel door with number 404', 'police caution tape', 'rusty padlock'],
    acceptedConcepts: ['room 404', 'locked door', 'hotel room', 'sealed room', 'door 404'],
    hint: 'The hotel doorway that does not exist on any blueprints.',
  },
  {
    text: 'Glowing Ghostly Footsteps',
    category: 'Paranormal Evidence',
    genre: 'horror',
    difficulty: 'MEDIUM',
    visualElements: ['spectral blue shoe prints', 'stairs leading up', 'ethereal mist'],
    acceptedConcepts: ['ghost footprints', 'glowing footprints', 'spectral footsteps', 'ghost prints'],
    hint: 'Glowing blue tracks leading toward the attic.',
  },
  {
    text: 'Haunted Oil Painting',
    category: 'Art Mystery',
    genre: 'horror',
    difficulty: 'EASY',
    visualElements: ['golden picture frame', 'portrait eyes shifting', 'dark canvas'],
    acceptedConcepts: ['haunted painting', 'oil painting', 'moving painting', 'portrait painting'],
    hint: 'A portrait whose painted eyes follow everyone across the gallery.',
  },

  // ============================================================
  // 5. ROMANCE & DRAMA MYSTERIES
  // ============================================================
  {
    text: 'Engagement Ring in Champagne',
    category: 'Romantic Gesture',
    genre: 'romance',
    difficulty: 'EASY',
    visualElements: ['sparkling diamond ring', 'effervescent champagne glass', 'bubbles'],
    acceptedConcepts: ['ring in champagne', 'diamond ring', 'engagement ring', 'champagne ring'],
    hint: 'A sparkling proposal hidden inside a celebratory toast.',
  },
  {
    text: 'Secret Midnight Rendezvous',
    category: 'Romantic Encounter',
    genre: 'romance',
    difficulty: 'MEDIUM',
    visualElements: ['two lovers embracing', 'moonlit bridge or park bench', 'silhouette'],
    acceptedConcepts: ['rendezvous', 'midnight meeting', 'lovers embrace', 'secret meeting'],
    hint: 'Two forbidden sweethearts meeting under the moonlight.',
  },
  {
    text: 'Locket With Hair Strand',
    category: 'Sentimental Keepsake',
    genre: 'romance',
    difficulty: 'MEDIUM',
    visualElements: ['opened heart locket', 'miniature portrait', 'curled lock of hair'],
    acceptedConcepts: ['heart locket', 'locket with hair', 'locket', 'silver locket', 'keepsake'],
    hint: 'An heirloom holding a lock of hair and a loved one’s portrait.',
  },
  {
    text: 'Single Red Rose and Note',
    category: 'Romantic Message',
    genre: 'romance',
    difficulty: 'EASY',
    visualElements: ['fresh red rose petal', 'envelope with wax seal', 'ribbon'],
    acceptedConcepts: ['red rose', 'rose and note', 'rose on desk', 'single rose', 'flower note'],
    hint: 'Left on the dressing table with a mysterious goodbye message.',
  },

  // ============================================================
  // 6. VALUABLES, ARTIFACTS & ANTIQUITIES
  // ============================================================
  {
    text: 'Golden Egyptian Scarab',
    category: 'Ancient Relic',
    genre: 'adventure',
    difficulty: 'EASY',
    visualElements: ['gold beetle amulet', 'hieroglyphic carvings', 'emerald wings'],
    acceptedConcepts: ['scarab', 'golden scarab', 'egyptian amulet', 'gold beetle', 'scarab beetle'],
    hint: 'An ancient Egyptian talisman stolen from the Pharaoh gallery.',
  },
  {
    text: 'Crown Jewels in Velvet Box',
    category: 'Royal Valuables',
    genre: 'noir',
    difficulty: 'EASY',
    visualElements: ['royal tiara with rubies and sapphires', 'plush red velvet case', 'silk cushion'],
    acceptedConcepts: ['crown jewels', 'royal crown', 'tiara', 'velvet box', 'jeweled crown'],
    hint: 'Regal headwear studded with rubies and diamonds.',
  },
  {
    text: 'Sinking Cargo Crate',
    category: 'Maritime Mystery',
    genre: 'thriller',
    difficulty: 'MEDIUM',
    visualElements: ['wooden shipping crate', 'splashing harbor water', 'ropes snapping'],
    acceptedConcepts: ['cargo crate', 'wooden crate', 'sinking crate', 'shipping container'],
    hint: 'A heavy container dumped into the river to destroy evidence.',
  },
  {
    text: 'Antique Brass Telescope',
    category: 'Observational Tool',
    genre: 'adventure',
    difficulty: 'EASY',
    visualElements: ['three collapsible brass tubes', 'glass lens', 'wooden tripod'],
    acceptedConcepts: ['telescope', 'brass telescope', 'spyglass', 'antique telescope'],
    hint: 'Used by the lookout perched in the high bell tower.',
  },
  {
    text: 'Heavy Iron Anchor',
    category: 'Nautical Evidence',
    genre: 'adventure',
    difficulty: 'EASY',
    visualElements: ['curved iron flukes', 'thick rusty chain', 'wooden dock dockyard'],
    acceptedConcepts: ['anchor', 'iron anchor', 'ship anchor', 'boat anchor'],
    hint: 'Mooring hardware found wet beside the harbor slip.',
  },
];

// Additional rich pool of distractors to guarantee endless, non-repeating distractor choices
export const MASTER_DISTRACTOR_WORDS: string[] = [
  'Handcuffs',
  'Crowbar',
  'Stethoscope',
  'Magnifying Glass',
  'Fake Beard',
  'Trench Coat',
  'Police Siren',
  'Security Badge',
  'Chalk Outline',
  'Flashlight',
  'Rope Ladder',
  'Duct Tape',
  'Briefcase Lock',
  'CCTV Monitor',
  'Cassette Tape',
  'Typewriter Ribbon',
  'Wax Seal Stamp',
  'Poison Dart',
  'Binoculars',
  'Black Umbrella',
  'Vintage Radio',
  'Hotel Room Key',
  'Safe Combination',
  'Cigarette Lighter',
  'Emergency Flare',
  'Wire Tapping Bug',
  'Stained Napkin',
  'Silver Whistle',
  'Gas Mask',
  'Compass Dial',
  'Torn Passport',
  'Secret Diary',
  'Red Lantern',
  'Brass Compass',
  'Leather Wallet',
  'Wooden Pipe',
  'Gold Coin',
  'Silk Scarf',
  'Pocket Knife',
  'Rusty Shovel',
  'Iron Padlock',
  'Empty Syringe',
  'Hourglass',
  'Alarm Clock',
  'Police Whistle',
  'Lockbox Key',
  'Old Newspaper',
  'Candlestick',
  'Silver Flask',
  'Feather Quill',
];

export class InfiniteClueEngine {
  private static cluePool: MysteryClueDefinition[] = [...MASTER_MYSTERY_CLUES];

  /**
   * Generates a fully formed procedural StoryEvent based on genre and excluded words
   */
  public static generateProceduralEvent(
    act: number,
    sequence: number,
    genre: string = 'noir',
    usedWords: Set<string> = new Set(),
    offeredWords: Set<string> = new Set()
  ): StoryEvent {
    const normGenre = genre.toLowerCase();

    // Normalize words for case-insensitive check
    const normUsed = new Set(Array.from(usedWords).map((w) => w.toLowerCase().trim()));
    const normOffered = new Set(Array.from(offeredWords).map((w) => w.toLowerCase().trim()));

    // Prefer clues matching genre, or any clue if pool exhausted
    let eligible = this.cluePool.filter((c) => {
      const clean = MarkdownStoryParser.cleanToClueWord(c.text).toLowerCase().trim();
      if (normUsed.has(clean)) return false;
      if (normOffered.has(clean)) return false;
      if (normGenre && c.genre !== 'all') {
        if (normGenre.includes('horror') && c.genre === 'horror') return true;
        if (normGenre.includes('romance') && c.genre === 'romance') return true;
        if (normGenre.includes('scifi') && c.genre === 'scifi') return true;
        if (normGenre.includes('noir') && c.genre === 'noir') return true;
        if (normGenre.includes('thriller') && c.genre === 'thriller') return true;
        if (normGenre.includes('adventure') && c.genre === 'adventure') return true;
      }
      return true;
    });

    // Fallback to any clue not yet used
    if (eligible.length === 0) {
      eligible = this.cluePool.filter((c) => {
        const clean = MarkdownStoryParser.cleanToClueWord(c.text).toLowerCase().trim();
        return !normUsed.has(clean);
      });
    }

    // Ultimate fallback if all clues in pool have been used
    if (eligible.length === 0) {
      eligible = [...this.cluePool];
    }

    // Pick random eligible clue
    const picked = eligible[Math.floor(Math.random() * eligible.length)];
    const cleanWord = MarkdownStoryParser.cleanToClueWord(picked.text);

    return {
      eventId: `procedural_evt_${act}_${sequence}_${Date.now() % 100000}_${Math.random().toString(36).substring(2, 5)}`,
      act,
      sequence,
      eventType: 'DRAW_EVENT',
      drawingObjective: cleanWord,
      visualElements: picked.visualElements,
      acceptedConcepts: picked.acceptedConcepts,
      semanticKeywords: [picked.category, ...picked.visualElements],
      hint: picked.hint || `Examine the ${picked.category.toLowerCase()}.`,
      difficulty: picked.difficulty,
      narrativeDescription: `The detectives uncover ${cleanWord.toLowerCase()} tied to the ongoing mystery.`,
      consequenceReveal: `Analysis of the ${cleanWord.toLowerCase()} unlocks a critical breakthrough in the investigation.`,
      timeLimitSeconds: 40,
      basePoints: picked.difficulty === 'HARD' ? 250 : picked.difficulty === 'MEDIUM' ? 180 : 120,
    };
  }

  /**
   * Generates 2 distinct, non-repeating distractor words
   */
  public static getTwoFreshDistractors(
    targetWord: string,
    usedWords: Set<string> = new Set(),
    offeredWords: Set<string> = new Set()
  ): [string, string] {
    const targetNorm = targetWord.toLowerCase().trim();
    const normUsed = new Set(Array.from(usedWords).map((w) => w.toLowerCase().trim()));
    const normOffered = new Set(Array.from(offeredWords).map((w) => w.toLowerCase().trim()));

    // Pool from distractor list and clues
    const allDistractorCandidates = [
      ...MASTER_DISTRACTOR_WORDS,
      ...MASTER_MYSTERY_CLUES.map((c) => MarkdownStoryParser.cleanToClueWord(c.text)),
    ];

    // Filter out target, used words, and already offered words
    const fresh = allDistractorCandidates.filter((w) => {
      const norm = w.toLowerCase().trim();
      return norm !== targetNorm && !normUsed.has(norm) && !normOffered.has(norm);
    });

    // Shuffle
    for (let i = fresh.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [fresh[i], fresh[j]] = [fresh[j], fresh[i]];
    }

    const d1 = fresh[0] || 'Antique Compass';
    const d2 = fresh[1] || 'Velvet Ledger';
    return [d1, d2];
  }
}
