import { MysteryCase, PlayerSecretClue } from '../types/game';
import { Player } from '../types/player';
import { ClientInfiniteClueEngine } from './InfiniteClueEngine';
import storiesCatalogJson from './data/stories_catalog.json';

// Build 120 complete cases from JSON catalog
const CATALOG_120_CASES: Record<string, MysteryCase> = {};
for (const s of (storiesCatalogJson as any[])) {
  CATALOG_120_CASES[s.id] = {
    id: s.id,
    title: s.title,
    genre: s.genre,
    setting: s.setting,
    description: s.description,
    characters: (s.characters || []).map((c: any) => ({
      name: c.name,
      role: c.role_description,
      alibi: c.alibi,
      avatar: c.avatar || '👤',
    })),
    truth: s.truth,
    culprit: s.culprit,
    motive: s.motive,
    timeline: (s.timeline || []).map((t: any) => ({
      time: t.time,
      event: t.event,
    })),
    evidence: (s.evidence || []).map((e: any) => ({
      id: e.id,
      title: e.title,
      detail: e.detail,
    })),
    clues: (s.clues || []).map((c: any) => ({
      order: c.order,
      title: c.title,
      text: c.text,
    })),
    misleadingInformation: (s.red_herrings || []).map((h: any) => `${h.lead}: ${h.explanation}`).join('; '),
    distorterObjective: s.distorter_objective,
    difficulty: s.difficulty,
  };
}

const LEGACY_CASES_CATALOG: Record<string, MysteryCase> = {
  // ============================================================
  // STORY 01 — THE MIDNIGHT MUSEUM
  // ============================================================
  story_01_the_midnight_museum: {
    id: 'story_01_the_midnight_museum',
    title: 'The Midnight Museum Heist',
    genre: 'Noir Mystery',
    setting: 'The Kessler Antiquities Museum, 3rd Floor Vault Gallery',
    description:
      'During a blackout gala, the 140-carat Eye of Osiris blue diamond vanished from an unbroken bulletproof display. Master vault keys were dropped and power cables cleanly cut.',
    characters: [
      { name: 'Elena Voss', role: 'Head Curator', alibi: 'Cataloging acquisition receipts in the library', avatar: '🏛️' },
      { name: 'Marcus Reyes', role: 'Head of Security', alibi: 'Doing perimeter rounds in the rain', avatar: '🛡️' },
      { name: 'Isabelle Chen', role: 'Insurance Investigator', alibi: 'Auditing vault access logs in the office', avatar: '🔍' },
      { name: 'Dominic Hart', role: 'Board Chairman', alibi: 'Greeting patrons at the grand reception', avatar: '👤' },
      { name: 'Priya Malhotra', role: 'Restoration Intern', alibi: 'Examining canvas varnishes in the lab', avatar: '🔬' },
    ],
    truth:
      'Board Chairman Dominic Hart engineered the blackout to cover up his private diamond swap. He used master keys to access the vault, slipped the gem into a briefcase, and escaped via a waiting getaway car.',
    culprit: 'Dominic Hart',
    motive: 'Massive debts from underground gambling',
    timeline: [
      { time: '01:45 AM', event: 'Master vault keys dropped near the ventilation shaft.' },
      { time: '02:00 AM', event: 'Power cables cut at the main basement fuse box.' },
      { time: '02:14 AM', event: 'Eye of Osiris blue diamond removed from display pedestal.' },
      { time: '02:18 AM', event: 'A red getaway sedan speeds away from the museum alleyway.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Vault Keys', detail: 'Heavy brass master keys found dropped near the air shaft.' },
      { id: 'ev2', title: 'Wire Cutters', detail: 'Heavy-duty insulated cutters discovered beside the power breaker.' },
      { id: 'ev3', title: 'Gambling IOUs', detail: 'Urgent debt demands signed by Dominic discovered in his locker.' },
      { id: 'ev4', title: 'Tire Tracks', detail: 'Wet red sports car tire tread marks in the rear loading dock.' },
    ],
    clues: [
      { order: 1, title: 'Vault Keys', text: 'Heavy brass keys dropped near the vault door.' },
      { order: 2, title: 'Wire Cutters', text: 'Insulated pliers used to sever the backup power cables.' },
      { order: 3, title: 'Blue Diamond', text: 'The glowing 140-carat gem missing from the central case.' },
      { order: 4, title: 'Briefcase', text: 'A locked leather case exchanged behind the marble statue.' },
      { order: 5, title: 'Getaway Car', text: 'A red sports convertible speeding past the museum gates.' },
      { order: 6, title: 'Broken Glass', text: 'Safety glass fragments shattered across the floor.' },
    ],
    distorterObjective: 'Frame Marcus Reyes the guard or claim an outside cat burglar descended from the roof.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 02 — THE LAST TRAIN
  // ============================================================
  story_02_the_last_train: {
    id: 'story_02_the_last_train',
    title: 'The Last Train',
    genre: 'Mystery / Thriller',
    setting: 'The Midnight Express Rail, Carriage 4',
    description:
      'Four strangers board the final midnight train. When the carriage enters a dark mountain tunnel, a passenger vanishes, leaving behind a locked briefcase and an unsolved past.',
    characters: [
      { name: 'Nora Vance', role: 'Insurance Investigator', alibi: 'Reviewing cold case archives in row 3', avatar: '🔍' },
      { name: 'Sam Okafor', role: 'Train Courier', alibi: 'Guarding paid luggage in the vestibule', avatar: '🧳' },
      { name: 'Priya Dutt', role: 'Vengeful Passenger', alibi: 'Watching the window with an old photograph', avatar: '👤' },
      { name: 'Gill Higgins', role: 'Elderly Traveler', alibi: 'Dozing under an overcoat in row 7', avatar: '👤' },
    ],
    truth:
      'Gill Higgins was the original heist thief from fifteen years ago. Terminally ill, he used the tunnel darkness to secretly pass the stolen money to Sam and stage his own disappearance.',
    culprit: 'Gill Higgins',
    motive: 'Terminally ill; seeking restitution for an innocent man imprisoned 15 years ago',
    timeline: [
      { time: '11:50 PM', event: 'Four passengers board carriage 4 with nervous glances.' },
      { time: '12:05 AM', event: 'Train enters the dark Blackwood tunnel; carriage lights die.' },
      { time: '12:07 AM', event: 'A heavy locked suitcase is shifted to the overhead luggage rack.' },
      { time: '12:10 AM', event: 'Lights return; Gill Higgins has vanished, leaving only his coat.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Train Ticket', detail: 'A one-way ticket stamped with a forged passenger alias.' },
      { id: 'ev2', title: 'Locked Suitcase', detail: 'A heavy leather case containing vintage bank notes.' },
      { id: 'ev3', title: 'Old Photograph', detail: 'A faded photo of four bank associates from 15 years prior.' },
      { id: 'ev4', title: 'Pocket Watch', detail: 'An antique watch stopped at the exact tunnel entry time.' },
    ],
    clues: [
      { order: 1, title: 'Train Ticket', text: 'A single one-way ticket for the midnight express.' },
      { order: 2, title: 'Locked Suitcase', text: 'A brass-latched case stashed in the overhead compartment.' },
      { order: 3, title: 'Tunnel Shadow', text: 'A silhouette shifting seats while carriage lights flickered.' },
      { order: 4, title: 'Empty Seat', text: 'An abandoned window seat with a warm coat left behind.' },
      { order: 5, title: 'Old Photograph', text: 'A creased black-and-white picture of four original suspects.' },
      { order: 6, title: 'Pocket Watch', text: 'A silver timepiece ticking down the final miles.' },
    ],
    distorterObjective: 'Accuse Sam Okafor the courier or claim Gill fell from the train doors.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 03 — THE VANISHING PAINTING
  // ============================================================
  story_03_the_vanishing_painting: {
    id: 'story_03_the_vanishing_painting',
    title: 'The Vanishing Painting',
    genre: 'Art Mystery',
    setting: 'Grand Metropolitan Gallery, Wing C',
    description:
      'A master oil painting vanished from a room ringed with laser sensors without tripping a single alarm. Restorers suspect the painting hanging on the wall was a replica all along.',
    characters: [
      { name: 'Renata Osei', role: 'Gallery Director', alibi: 'Welcoming patrons in the main rotunda', avatar: '🏛️' },
      { name: 'Tomas Vale', role: 'Senior Appraiser', alibi: 'Inspecting insurance papers in the office', avatar: '🔍' },
      { name: 'Iris Kwan', role: 'Art Restorer', alibi: 'Testing canvas pigments in the basement', avatar: '👤' },
      { name: 'Ben Okoro', role: 'Security Chief', alibi: 'Monitoring the surveillance console', avatar: '🛡️' },
      { name: 'Aldous Ferry', role: 'Artist Descendant', alibi: 'Observing the exhibition quietly from the balcony', avatar: '👤' },
    ],
    truth:
      'Artist descendant Aldous Ferry conspired with security chief Ben Okoro to retrieve the painting. The hanging piece was a 50-year-old forgery; Aldous took it to force a public accounting.',
    culprit: 'Aldous Ferry',
    motive: 'Exposing a 50-year museum forgery to restore family honor',
    timeline: [
      { time: '08:30 PM', event: 'Patrons gather to admire the centennial masterpiece.' },
      { time: '09:00 PM', event: 'Scheduled gallery lighting dimming occurs for maintenance.' },
      { time: '09:05 PM', event: 'The heavy ornate gilt frame is found completely empty.' },
      { time: '09:20 PM', event: 'UV light inspection reveals recent synthetic varnish.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Empty Frame', detail: 'The gilded carved wood frame left hanging on museum wire.' },
      { id: 'ev2', title: 'UV Torch', detail: 'A blacklight revealing mismatched fluorescent pigments.' },
      { id: 'ev3', title: 'Restoration Notes', detail: 'Handwritten ledger logs proving the original was swapped.' },
      { id: 'ev4', title: 'Brass Keycard', detail: 'A master security keycard used to bypass the laser beam grid.' },
    ],
    clues: [
      { order: 1, title: 'Empty Frame', text: 'The golden frame hanging bare against dark velvet.' },
      { order: 2, title: 'Motion Sensor', text: 'Laser perimeter sensor showing no signs of breach.' },
      { order: 3, title: 'UV Torch', text: 'Ultraviolet light exposing modern synthetic varnish.' },
      { order: 4, title: 'Fake Canvas', text: 'Pigment analysis revealing twentieth-century titanium white.' },
      { order: 5, title: 'Restoration Notes', text: 'Confidential archives documenting the secret sale.' },
      { order: 6, title: 'Brass Keycard', text: 'An authorized staff card swiped at the maintenance door.' },
    ],
    distorterObjective: 'Blame junior restorer Iris Kwan or argue an international art syndicate stole it.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 04 — THE LOCKED ROOM
  // ============================================================
  story_04_the_locked_room: {
    id: 'story_04_the_locked_room',
    title: 'The Locked Room',
    genre: 'Detective Mystery',
    setting: 'Cole Family Manor, Sealed Study',
    description:
      'Estate master Desmond Cole is found unconscious inside a study locked from the inside with heavy deadbolts. Every window is latched, yet someone clearly entered and left.',
    characters: [
      { name: 'Desmond Cole', role: 'Estate Owner', alibi: 'Locked inside study for evening accounts', avatar: '👤' },
      { name: 'Julian Cole', role: 'Identical Twin', alibi: 'Playing chess in the drawing room', avatar: '👤' },
      { name: 'Marguerite Cole', role: 'Family Matriarch', alibi: 'Taking tea in the conservatory', avatar: '👤' },
      { name: 'Priti Anand', role: 'Former Partner', alibi: 'Walking in the rose garden outside', avatar: '👤' },
      { name: 'Dr. Felix Renard', role: 'Family Physician', alibi: 'Preparing evening medicine in the clinic', avatar: '🔬' },
    ],
    truth:
      'Desmond and Julian Cole exploited their identical twin appearance. Desmond staged a collapse, and Julian unlocked the spare secret mechanism to swap places and trigger an inheritance clause.',
    culprit: 'Desmond Cole',
    motive: 'Identical twin conspiracy to trigger an inheritance clause',
    timeline: [
      { time: '10:00 PM', event: 'Desmond locks himself inside the study in full view of staff.' },
      { time: '11:15 PM', event: 'A sudden cry is heard behind the heavy oak door.' },
      { time: '11:20 PM', event: 'Staff break down the bolted door; Desmond lies unconscious.' },
      { time: '11:35 PM', event: 'Dr. Renard discovers a hidden spare key mechanism in the bookcase.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Bolted Door', detail: 'Heavy iron interior deadbolt with no keyhole on the exterior.' },
      { id: 'ev2', title: 'Poison Vial', detail: 'Mild sedative liquid used to simulate a deep medical coma.' },
      { id: 'ev3', title: 'Inheritance Will', detail: 'Clause assigning immediate control to whoever finds him first.' },
      { id: 'ev4', title: 'Spare Key', detail: 'A duplicate brass key concealed within hollow book spine.' },
    ],
    clues: [
      { order: 1, title: 'Bolted Door', text: 'An oak door locked from the inside with an iron bolt.' },
      { order: 2, title: 'Secret Passage', text: 'A bookcase swivel revealing access to the corridor.' },
      { order: 3, title: 'Poison Vial', text: 'An empty amber medicine bottle dropped near the desk.' },
      { order: 4, title: 'Inheritance Will', text: 'A sealed legal parchment detailing estate transfer terms.' },
      { order: 5, title: 'Torn Letter', text: 'A shredded note planning the exact twin substitution.' },
      { order: 6, title: 'Spare Key', text: 'A small brass key retrieved from a hollow novel.' },
    ],
    distorterObjective: 'Frame former partner Priti Anand or claim Dr. Renard poisoned the master.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 05 — THE WRONG SUSPECT
  // ============================================================
  story_05_the_wrong_suspect: {
    id: 'story_05_the_wrong_suspect',
    title: 'The Wrong Suspect',
    genre: 'Psychological Mystery',
    setting: 'Blackwood Police Precinct & Interrogation Cell',
    description:
      'Every clue points squarely at recently fired analyst Farah. But the evidence is arranged so flawlessly that detective Wren suspects she was deliberately framed by the real embezzler.',
    characters: [
      { name: 'Farah Iqbal', role: 'Framed Analyst', alibi: 'At home with family during the breach', avatar: '👤' },
      { name: 'Victor Damon', role: 'Finance Manager', alibi: 'Attending dinner with corporate directors', avatar: '👤' },
      { name: 'Renee Osei', role: 'Whistleblower', alibi: 'Staying late to double-check accounts', avatar: '👤' },
      { name: 'Detective Wren', role: 'Lead Investigator', alibi: 'Reviewing the initial audit report', avatar: '🔍' },
    ],
    truth:
      'Finance manager Victor Damon embezzled three million dollars and fabricated Farah’s login timestamps and digital signature to ensure she took the full fall.',
    culprit: 'Victor Damon',
    motive: 'Planting fabricated evidence to cover up executive embezzlement',
    timeline: [
      { time: '05:30 PM', event: 'Farah Iqbal is escorted off premises after surprise termination.' },
      { time: '07:15 PM', event: 'Victor Damon accesses financial servers using remote admin credentials.' },
      { time: '08:00 PM', event: 'Funds wired to offshore accounts under Farah’s forged signature.' },
      { time: '09:30 PM', event: 'Detective Wren notices timestamps predating server clock sync.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Forged Signature', detail: 'Digital approval signature generated from Victor’s terminal.' },
      { id: 'ev2', title: 'Security Tape', detail: 'Hallway footage showing Victor lingering near Farah’s desk.' },
      { id: 'ev3', title: 'Torn Coat', detail: 'Fabric thread matching Victor’s overcoat caught on server rack.' },
      { id: 'ev4', title: 'Audit Folder', detail: 'Confidential ledger proving Farah had flagged the deficit.' },
    ],
    clues: [
      { order: 1, title: 'Forged Signature', text: 'A scanned document with duplicated pixel anomalies.' },
      { order: 2, title: 'Security Tape', text: 'CCTV footage showing an executive entering the server vault.' },
      { order: 3, title: 'Torn Coat', text: 'Wool fibers snagged on the server rack latch.' },
      { order: 4, title: 'Remote Login', text: 'A proxy IP log tracing directly to Victor’s apartment.' },
      { order: 5, title: 'Alibi Watch', text: 'A luxury wristwatch showing time offset by forty minutes.' },
      { order: 6, title: 'Audit Folder', text: 'A red folder marked confidential hidden under desk papers.' },
    ],
    distorterObjective: 'Persuade the room that Farah was guilty or accuse Renee the whistleblower.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 06 — THE EMPTY OFFICE
  // ============================================================
  story_06_the_empty_office: {
    id: 'story_06_the_empty_office',
    title: 'The Empty Office',
    genre: 'Corporate Thriller',
    setting: 'Meridian Financial Tower, 42nd Floor',
    description:
      'A senior forensic auditor vanishes into thin air after sending a single encrypted message warning of shadow accounts. Her office is empty, save for a shredder still warm to the touch.',
    characters: [
      { name: 'Leah Park', role: 'Missing Analyst', alibi: 'In hiding to protect forensic evidence', avatar: '👤' },
      { name: 'Grant Whitfield', role: 'Corporate CFO', alibi: 'At an overseas board conference call', avatar: '👤' },
      { name: 'Ilya Novak', role: 'Executive Assistant', alibi: 'Ordering late-night catering for executives', avatar: '👤' },
      { name: 'Dana Cruz', role: 'External Auditor', alibi: 'Reviewing quarterly balance sheets', avatar: '🔍' },
    ],
    truth:
      'CFO Grant Whitfield operated a network of shell companies. When Leah discovered the scheme, Grant attempted to intimidate her, forcing her into hiding with assistant Ilya’s help.',
    culprit: 'Grant Whitfield',
    motive: 'Erasing audit traces of multi-million shell-account embezzlement',
    timeline: [
      { time: '08:45 PM', event: 'Leah finishes compiling proof of illegal offshore transfers.' },
      { time: '09:10 PM', event: 'Grant enters Leah’s office; heated argument heard through glass.' },
      { time: '09:25 PM', event: 'Leah slips out the service elevator carrying an encrypted drive.' },
      { time: '09:40 PM', event: 'Grant shreds the physical ledger and reports Leah missing.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Server Drive', detail: 'Encrypted backup drive holding forensic bank transfer trails.' },
      { id: 'ev2', title: 'Shredded Paper', detail: 'Reconstructed document scraps confirming shell accounts.' },
      { id: 'ev3', title: 'Keycard Log', detail: 'Access log revealing Grant’s badge swiped after hours.' },
      { id: 'ev4', title: 'Briefcase Cash', detail: 'Unmarked hundred-dollar stacks stashed in executive safe.' },
    ],
    clues: [
      { order: 1, title: 'Server Drive', text: 'A silver external hard drive with flashing green activity light.' },
      { order: 2, title: 'Shredded Paper', text: 'Cross-cut paper ribbons spilling out of an office bin.' },
      { order: 3, title: 'Keycard Log', text: 'A timestamped badge reader record showing 42nd-floor access.' },
      { order: 4, title: 'Briefcase Cash', text: 'A leather attache case filled with bundled bank notes.' },
      { order: 5, title: 'Coffee Cup', text: 'A half-empty ceramic mug with fresh lipstick traces.' },
      { order: 6, title: 'Encrypted USB', text: 'A thumb drive hidden taped beneath the conference table.' },
    ],
    distorterObjective: 'Claim Leah fled with company funds or accuse assistant Ilya of theft.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 07 — ROOM 404
  // ============================================================
  story_07_room_404: {
    id: 'story_07_room_404',
    title: 'Room 404',
    genre: 'Supernatural Horror',
    setting: 'The Grand Horizon Hotel, 4th Floor',
    description:
      'Guests report strange scratching sounds from Room 404 — a room that supposedly does not exist on the hotel floor plan. A brass keycard and an old radio playing static were found outside.',
    characters: [
      { name: 'Evelyn Ward', role: 'Hotel Manager', alibi: 'Managing front desk accounts in the lobby', avatar: '🏨' },
      { name: 'Silas Finch', role: 'Night Concierge', alibi: 'Delivering luggage to the 3rd floor', avatar: '👤' },
      { name: 'Clara Vance', role: 'Journalist', alibi: 'Researching urban legends in the bar', avatar: '🔍' },
      { name: 'Thomas Reed', role: 'Former Guest', alibi: 'Demanding answers about his missing sister', avatar: '👤' },
    ],
    truth:
      'Night concierge Silas Finch used a sealed service corridor behind Room 404 to hide evidence of occult ceremonies and trapped guest belongings dating back three decades.',
    culprit: 'Silas Finch',
    motive: 'Covering up the occult disappearance of guests in the phantom room',
    timeline: [
      { time: '11:45 PM', event: 'Static hum emanates from the unnumbered doorway on floor 4.' },
      { time: '12:00 AM', event: 'Silas observed sliding a brass skeleton key into the wallpaper seam.' },
      { time: '12:15 AM', event: 'Cold air and rhythmic clicking heard from within the sealed chamber.' },
      { time: '12:30 AM', event: 'Clara discovers Thomas’s sister’s luggage hidden inside the room.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Room Key', detail: 'Heavy tarnished brass skeleton key stamped with 404.' },
      { id: 'ev2', title: 'Mirror Scratch', detail: 'Chamber mirror scratched with names of vanished guests.' },
      { id: 'ev3', title: 'Old Radio', detail: 'Vintage vacuum-tube radio broadcasting endless Morse code.' },
      { id: 'ev4', title: 'Guest Register', detail: 'Yellowed register book with pages ripped out at 1994.' },
    ],
    clues: [
      { order: 1, title: 'Room Key', text: 'A heavy brass skeleton key stamped with the number 404.' },
      { order: 2, title: 'Flickering Lamp', text: 'A gas lamp flickering violently near the blank wall.' },
      { order: 3, title: 'Old Radio', text: 'A wood-cased radio humming with low-frequency static.' },
      { order: 4, title: 'Mirror Scratch', text: 'Deep scratches spelling desperate names on glass.' },
      { order: 5, title: 'Phone Receiver', text: 'A rotary phone off the hook with faint whispers.' },
      { order: 6, title: 'Guest Register', text: 'A leather guest ledger with missing historical entries.' },
    ],
    distorterObjective: 'Blame manager Evelyn Ward or convince players the room is a shared hallucination.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 08 — THE LAST PASSENGER
  // ============================================================
  story_08_the_last_passenger: {
    id: 'story_08_the_last_passenger',
    title: 'The Last Passenger',
    genre: 'Supernatural Horror',
    setting: 'Abandoned City Metro, Red Line Loop',
    description:
      'A midnight commuter train pulls into an abandoned turn-of-the-century tunnel station not on any current transit map. The operator has locked the doors from the driver cab.',
    characters: [
      { name: 'Maya Chen', role: 'Night Commuter', alibi: 'Listening to headphones in car 2', avatar: '👤' },
      { name: 'Damian Cole', role: 'Subway Operator', alibi: 'Controlling train from forward cab', avatar: '🚇' },
      { name: 'Dr. Aris Vance', role: 'Transit Psychologist', alibi: 'Reading medical reports in car 3', avatar: '🔬' },
      { name: 'The Pale Passenger', role: 'Unidentified Entity', alibi: 'Standing motionless at carriage end', avatar: '👤' },
    ],
    truth:
      'Operator Damian Cole intentionally overrode track switches to deliver the train to an abandoned deep-tunnel platform to perform a cult sacrifice promised to revive his lost daughter.',
    culprit: 'Damian Cole',
    motive: 'Luring late-night passengers into an uncharted ghost station loop',
    timeline: [
      { time: '01:15 AM', event: 'Train skips the scheduled downtown terminal and accelerates.' },
      { time: '01:22 AM', event: 'Track signals shift from green to forbidden red switches.' },
      { time: '01:30 AM', event: 'Carriage brakes screech as train halts at a forgotten brick platform.' },
      { time: '01:35 AM', event: 'Damian emerges from driver cab brandishing emergency flare.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Metro Token', detail: 'An ancient brass token stamped with a dead transit authority.' },
      { id: 'ev2', title: 'Track Map', detail: 'A handwritten tunnel schematic circling the sealed ghost stop.' },
      { id: 'ev3', title: 'Emergency Lever', detail: 'Mechanical brake override lever tied shut with wire.' },
      { id: 'ev4', title: 'Ghost Train', detail: 'Photographic proof of the same train vanishing in 1952.' },
    ],
    clues: [
      { order: 1, title: 'Metro Token', text: 'A brass subway token from a forgotten transit system.' },
      { order: 2, title: 'Ghost Train', text: 'An engine rolling silently through dark tunnel tracks.' },
      { order: 3, title: 'Flickering Bulb', text: 'Ceiling lights blinking in desperate morse rhythm.' },
      { order: 4, title: 'Lost Umbrella', text: 'A dripping black umbrella left standing on the platform.' },
      { order: 5, title: 'Emergency Lever', text: 'The red emergency brake cord pulled taut and jammed.' },
      { order: 6, title: 'Track Map', text: 'A schematic showing a hidden branch line deep underground.' },
    ],
    distorterObjective: 'Blame the mysterious pale passenger or argue Dr. Vance caused mass hysteria.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 09 — THE PHOTOGRAPH
  // ============================================================
  story_09_the_photograph: {
    id: 'story_09_the_photograph',
    title: 'The Photograph',
    genre: 'Psychological Horror',
    setting: 'Old Town Darkroom & Antique Photography Studio',
    description:
      'In a basement chemical darkroom, an antique camera exposes photographs where an extra figure appears standing behind the subject — moving closer with each newly developed print.',
    characters: [
      { name: 'Hannah Morse', role: 'Photographer', alibi: 'Developing silver gelatin prints in darkroom', avatar: '📸' },
      { name: 'Arthur Pendelton', role: 'Studio Owner', alibi: 'Cataloging glass plate negatives', avatar: '👤' },
      { name: 'Eleanor Shaw', role: 'Antique Dealer', alibi: 'Inspecting camera bellows in display room', avatar: '👤' },
      { name: 'Lucian Grey', role: 'Historical Collector', alibi: 'Negotiating purchase of Victorian plates', avatar: '👤' },
    ],
    truth:
      'Arthur Pendelton discovered that exposing plates through an occult silver lens captured the ghost of his deceased partner, but developing each print draws the entity into physical reality.',
    culprit: 'Arthur Pendelton',
    motive: 'Trapping souls inside cursed silver-gelatin photographic plates',
    timeline: [
      { time: '09:00 PM', event: 'Hannah develops a portrait; notices a faint second silhouette.' },
      { time: '09:30 PM', event: 'Second print developed; the shadow figure has stepped forward.' },
      { time: '10:00 PM', event: 'Arthur locks the darkroom door and prepares a third silver bath.' },
      { time: '10:15 PM', event: 'Glass plate shatters as the room temperature drops below zero.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Vintage Camera', detail: 'Large wooden bellows camera fitted with a quartz spirit lens.' },
      { id: 'ev2', title: 'Silver Negative', detail: 'A glass photographic plate showing a figure in the background.' },
      { id: 'ev3', title: 'Darkroom Tray', detail: 'Chemical fixing bath emitting an uncanny sulfurous stench.' },
      { id: 'ev4', title: 'Antique Lens', detail: 'Engraved brass lens casing inscribed with Victorian occult runes.' },
    ],
    clues: [
      { order: 1, title: 'Vintage Camera', text: 'A brass and mahogany view camera on a tall tripod.' },
      { order: 2, title: 'Darkroom Tray', text: 'A red-lit chemical dish with floating black-and-white prints.' },
      { order: 3, title: 'Silver Negative', text: 'A glass slide displaying an eerie shadowy silhouette.' },
      { order: 4, title: 'Shadow Portrait', text: 'A portrait where an extra face appears in the darkness.' },
      { order: 5, title: 'Antique Lens', text: 'A polished glass element reflecting impossible shapes.' },
      { order: 6, title: 'Burning Film', text: 'Celluloid negatives smoldering in the fireplace grate.' },
    ],
    distorterObjective: 'Frame Hannah Morse or argue the camera is simply malfunctioning.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 10 — THE EMPTY CLASSROOM
  // ============================================================
  story_10_the_empty_classroom: {
    id: 'story_10_the_empty_classroom',
    title: 'The Empty Classroom',
    genre: 'College Horror',
    setting: 'St. Jude Hall, 3rd Floor Lecture Room 302',
    description:
      'At 9:15 PM every Tuesday, the old bell rings and the blackboard in Room 302 writes out names in chalk. A graduate student disappeared twenty years ago, and now the names match current staff.',
    characters: [
      { name: 'Professor James Vance', role: 'Department Chair', alibi: 'In faculty lounge reviewing grant proposals', avatar: '🎓' },
      { name: 'Chloe Adams', role: 'Graduate Student', alibi: 'Studying in the basement library stacks', avatar: '👤' },
      { name: 'Leo Sharma', role: 'Campus Caretaker', alibi: 'Locking exterior campus gates', avatar: '🧹' },
      { name: 'Dr. Miriam Cross', role: 'University Archivist', alibi: 'Searching 1990s disciplinary records', avatar: '📚' },
    ],
    truth:
      'Professor James Vance caused the death of a student in a hazing accident twenty years ago. When Chloe found the archive files, Vance returned to stage paranormal warnings to silence her.',
    culprit: 'Professor James Vance',
    motive: 'Suppressing a fatal hazing ritual from twenty years ago',
    timeline: [
      { time: '08:45 PM', event: 'Chloe uncovers hidden 2004 disciplinary files in the basement.' },
      { time: '09:10 PM', event: 'Vance confronts Chloe near room 302 demanding the folders.' },
      { time: '09:15 PM', event: 'The old mechanical school bell chimes three times unprompted.' },
      { time: '09:30 PM', event: 'Chalk dust covers the lecture hall podium with a cryptic cipher.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Chalkboard Message', detail: 'Writing on blackboard in handwriting matching Vance.' },
      { id: 'ev2', title: 'Locked Desk', detail: 'Torn archive documents locked in Vance’s mahogany desk.' },
      { id: 'ev3', title: 'School Bell', detail: 'Bell rope pulled manually using a tied nylon cord.' },
      { id: 'ev4', title: 'Yearbook Scrap', detail: 'Graduation photo with the victim’s face scratched out.' },
    ],
    clues: [
      { order: 1, title: 'Chalkboard Message', text: 'Words scrawled in white chalk across the blackboard.' },
      { order: 2, title: 'Locked Desk', text: 'An oak teacher desk sealed with a heavy brass lock.' },
      { order: 3, title: 'School Bell', text: 'A bronze wall bell ringing with no one in the tower.' },
      { order: 4, title: 'Hallway Footprints', text: 'Dusty shoe impressions leading straight into a solid wall.' },
      { order: 5, title: 'Yearbook Scrap', text: 'A torn page from an old class album showing past members.' },
      { order: 6, title: 'Rusty Padlock', text: 'An iron chain wrapped around the emergency fire exit.' },
    ],
    distorterObjective: 'Accuse caretaker Leo Sharma or claim genuine supernatural ghost activity.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 11 — THE HOUSE THAT REMEMBERS
  // ============================================================
  story_11_the_house_that_remembers: {
    id: 'story_11_the_house_that_remembers',
    title: 'The House That Remembers',
    genre: 'Psychological Horror',
    setting: 'Blackwood Family Manor, Whispering Hall',
    description:
      'Doors open on their own, a music box in the attic plays melodies from 1920, and water in the fountains turns black. An eccentric family gathers for the reading of a disputed estate will.',
    characters: [
      { name: 'Beatrice Sterling', role: 'Estate Matriarch', alibi: 'Confined to bed in the master suite', avatar: '👤' },
      { name: 'Simon Sterling', role: 'Heir Apparent', alibi: 'Reviewing estate accounts in the study', avatar: '👤' },
      { name: 'Agnes Miller', role: 'Elderly Housekeeper', alibi: 'Preparing evening tea in the pantry', avatar: '👤' },
      { name: 'Detective Holt', role: 'Family Attorney', alibi: 'Reading legal clauses in the library', avatar: '📜' },
    ],
    truth:
      'Simon Sterling systematically poisoned the house water supply and rigged atmospheric tricks to drive Beatrice into signing over property deeds before the new will took effect.',
    culprit: 'Simon Sterling',
    motive: 'Poisoning the estate well to force early liquidation of property',
    timeline: [
      { time: '07:30 PM', event: 'Family members arrive as thunderstorms roll over the estate.' },
      { time: '08:15 PM', event: 'Simon slips arsenic powder into the central rooftop water cistern.' },
      { time: '09:00 PM', event: 'A mechanical music box in the attic activates spontaneously.' },
      { time: '09:30 PM', event: 'Beatrice collapses; Simon immediately produces the signed deed.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Music Box', detail: 'Wound clockwork music box playing a slowed lullaby.' },
      { id: 'ev2', title: 'Attic Trunk', detail: 'Hidden arsenic canisters discovered beneath old blankets.' },
      { id: 'ev3', title: 'Porcelain Doll', detail: 'Victorian doll rigged with remote micro-speaker mechanism.' },
      { id: 'ev4', title: 'Grandfather Clock', detail: 'Clock pendulum cavity holding the genuine unaltered will.' },
    ],
    clues: [
      { order: 1, title: 'Music Box', text: 'A carved wooden box playing a haunting nursery tune.' },
      { order: 2, title: 'Attic Trunk', text: 'A heavy iron-strapped chest smelling of bitter almonds.' },
      { order: 3, title: 'Porcelain Doll', text: 'A doll with painted glass eyes watching the parlor.' },
      { order: 4, title: 'Old Diary', text: 'A journal detailing past poisonings in the family lineage.' },
      { order: 5, title: 'Grandfather Clock', text: 'A walnut pendulum clock striking thirteen times.' },
      { order: 6, title: 'Basement Key', text: 'A rusted key unlocking the estate cistern cellar.' },
    ],
    distorterObjective: 'Blame housekeeper Agnes Miller or claim the house itself is alive.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 12 — 3:13
  // ============================================================
  story_12_3_13: {
    id: 'story_12_3_13',
    title: '3:13',
    genre: 'Supernatural Mystery',
    setting: 'St. Jude Clock Tower & Midnight Crossing',
    description:
      'Every night at exactly 3:13 AM, every watch and streetlamp in the district stops for sixty seconds. Anyone on the streets during those sixty seconds experiences a chilling memory loop.',
    characters: [
      { name: 'Adam Locke', role: 'Master Clockmaker', alibi: 'Calibrating tower escapements in the belfry', avatar: '⚙️' },
      { name: 'Sarah Lin', role: 'Night Dispatcher', alibi: 'Logging emergency telephone calls', avatar: '📞' },
      { name: 'Father Matthew', role: 'Cathedral Rector', alibi: 'Saying midnight prayers at the altar', avatar: '🕯️' },
      { name: 'Vincent Vance', role: 'Night Watchman', alibi: 'Patrolling the town square perimeter', avatar: '👤' },
    ],
    truth:
      'Clockmaker Adam Locke modified the tower’s electromagnetic escapement with stolen military relay coils to recreate the exact moment his daughter’s car crossed the tracks ten years ago.',
    culprit: 'Adam Locke',
    motive: 'Rigging the town clock mechanism to loop the final three minutes',
    timeline: [
      { time: '02:50 AM', event: 'Adam climbs to the highest belfry gears carrying a relay coil.' },
      { time: '03:12 AM', event: 'The cathedral clock gears lock; a high-pitched drone fills the square.' },
      { time: '03:13 AM', event: 'Streetlights flicker and die; time loop anomalies manifest.' },
      { time: '03:14 AM', event: 'The circuit breaks; Adam collapses beside the gear train.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Stopped Clock', detail: 'Town square clock hands seized permanently at 3:13.' },
      { id: 'ev2', title: 'Brass Gear', detail: 'Custom electromagnetic gear wheel meshed with the clock drive.' },
      { id: 'ev3', title: 'Torn Calendar', detail: 'Calendar page marked with the anniversary date in red ink.' },
      { id: 'ev4', title: 'Cathedral Bell', detail: 'Chime hammer rigged with high-voltage insulated wiring.' },
    ],
    clues: [
      { order: 1, title: 'Stopped Clock', text: 'Clock tower hands frozen rigidly at thirteen past three.' },
      { order: 2, title: 'Brass Gear', text: 'A gleaming cogwheel etched with forbidden geometric spirals.' },
      { order: 3, title: 'Torn Calendar', text: 'A wall calendar flipped repeatedly to the same date.' },
      { order: 4, title: 'Cathedral Bell', text: 'A massive bronze bell wrapped with copper induction coils.' },
      { order: 5, title: 'Streetlamp Beam', text: 'A cone of lamplight that freezes falling rain droplets.' },
      { order: 6, title: 'Iron Pendulum', text: 'A heavy pendulum swaying horizontally against gravity.' },
    ],
    distorterObjective: 'Frame dispatcher Sarah Lin or accuse Father Matthew of heretical rituals.',
    difficulty: 'HARD',
  },

  // ============================================================
  // STORY 13 — THE LETTER NEVER SENT
  // ============================================================
  story_13_the_letter_never_sent: {
    id: 'story_13_the_letter_never_sent',
    title: 'The Letter Never Sent',
    genre: 'Romance / Mystery',
    setting: 'Villa Rosa Coastal Estate & Private Library',
    description:
      'A sealed letter written in 1948 that could have united two lovers was discovered hidden inside an antique writing desk. But someone broke into the study last night to destroy it.',
    characters: [
      { name: 'Victoria Sterling', role: 'Poet Heiress', alibi: 'Writing poetry on the sea balcony', avatar: '✒️' },
      { name: 'Charles Beaumont', role: 'Foreign Diplomat', alibi: 'Reviewing diplomatic cables in parlor', avatar: '👤' },
      { name: 'Margaret Holloway', role: 'Family Confidante', alibi: 'Arranging flowers in the grand hallway', avatar: '👤' },
      { name: 'Julian Frost', role: 'Village Postmaster', alibi: 'Sorting morning mail at the post office', avatar: '✉️' },
    ],
    truth:
      'Village postmaster Julian Frost was the one who intercepted the letter in 1948 out of unrequited jealousy. Hearing the letter had surfaced, he broke in to burn it before his crime was exposed.',
    culprit: 'Julian Frost',
    motive: 'Hiding an intercepted confession of love to prevent an engagement',
    timeline: [
      { time: '09:00 PM', event: 'Victoria discovers the 1948 sealed love letter in a secret drawer.' },
      { time: '10:15 PM', event: 'Julian learns of the discovery while delivering telegrams.' },
      { time: '11:30 PM', event: 'Study window forced open; smell of burning wax and paper.' },
      { time: '11:45 PM', event: 'Charles interrupts the intruder, who flees dropping a brass key.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Wax Seal', detail: 'Red sealing wax fragments stamped with the postmaster’s crest.' },
      { id: 'ev2', title: 'Vintage Letter', detail: 'Partially burned parchment confessing undying devotion.' },
      { id: 'ev3', title: 'Fountain Pen', detail: 'A vintage gold-nibbed pen found dropped on the balcony.' },
      { id: 'ev4', title: 'Postbox Key', detail: 'The master skeleton key belonging to the village post office.' },
    ],
    clues: [
      { order: 1, title: 'Wax Seal', text: 'A stamped red wax seal bearing a swallow in flight.' },
      { order: 2, title: 'Vintage Letter', text: 'A yellowed handwritten letter smelling of old lavender.' },
      { order: 3, title: 'Pressed Rose', text: 'A dried crimson rose petal tucked into parchment folds.' },
      { order: 4, title: 'Fountain Pen', text: 'A black lacquer fountain pen with fresh blue ink.' },
      { order: 5, title: 'Postbox Key', text: 'A small brass key stamped with the Royal Postal insignia.' },
      { order: 6, title: 'Silver Locket', text: 'An oval locket containing miniature companion portraits.' },
    ],
    distorterObjective: 'Blame diplomat Charles Beaumont or argue Victoria burned her own letter.',
    difficulty: 'EASY',
  },

  // ============================================================
  // STORY 14 — 11:11
  // ============================================================
  story_14_11_11: {
    id: 'story_14_11_11',
    title: '11:11',
    genre: 'Romance / Fantasy',
    setting: 'City Observation Bridge & Riverwalk',
    description:
      'Every night at 11:11 PM, paper cranes appear on the bridge railing beside a silver wishing coin. Tonight the coin was stolen, and two people whose lives depended on the wish are searching for it.',
    characters: [
      { name: 'Aria Song', role: 'Orchestra Violinist', alibi: 'Rehearsing concert pieces in recital hall', avatar: '🎻' },
      { name: 'Kenji Sato', role: 'Origami Artist', alibi: 'Folding paper cranes by the riverside steps', avatar: '👤' },
      { name: 'Mira Patel', role: 'Astronomer', alibi: 'Tracking comet trajectories on bridge deck', avatar: '🔭' },
      { name: 'Ethan Vance', role: 'Bridge Guard', alibi: 'Checking pedestrian turnstiles at bridge head', avatar: '🛡️' },
    ],
    truth:
      'Bridge guard Ethan Vance fell in love with Aria and took the wishing coin to delay her acceptance of an overseas orchestra residency, hoping for one final confession.',
    culprit: 'Ethan Vance',
    motive: 'Stealing the engraved wishing coin to stop their departure abroad',
    timeline: [
      { time: '10:45 PM', event: 'Aria places her lucky wishing coin on the bridge observation pillar.' },
      { time: '11:05 PM', event: 'Kenji lines the stone ledge with hundred origami cranes.' },
      { time: '11:11 PM', event: 'Bridge lights flicker; Ethan pockets the silver wishing coin.' },
      { time: '11:20 PM', event: 'Aria returns and discovers the coin missing right before her flight.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Wishing Coin', detail: 'Silver coin engraved with musical clef and 11:11 date.' },
      { id: 'ev2', title: 'Paper Crane', detail: 'A gold foil origami bird containing a written message.' },
      { id: 'ev3', title: 'Pocket Watch', detail: 'Ethan’s watch found with coin indentations in leather pouch.' },
      { id: 'ev4', title: 'Red Ribbon', detail: 'Silk ribbon tied to bridge railing marking meeting spot.' },
    ],
    clues: [
      { order: 1, title: 'Paper Crane', text: 'A meticulously folded origami crane resting on the rail.' },
      { order: 2, title: 'Wishing Coin', text: 'A gleaming silver coin stamped with astronomical stars.' },
      { order: 3, title: 'Pocket Watch', text: 'A pocket watch stopped precisely at eleven minutes past.' },
      { order: 4, title: 'Starlight Lens', text: 'A small optical glass revealing reflections across water.' },
      { order: 5, title: 'Red Ribbon', text: 'A scarlet silk ribbon fluttering against night river breeze.' },
      { order: 6, title: 'Violin Rosin', text: 'A small amber rosin block dropped near the bench.' },
    ],
    distorterObjective: 'Accuse origami artist Kenji or astronomer Mira of taking the coin.',
    difficulty: 'EASY',
  },

  // ============================================================
  // STORY 15 — TWO TICKETS
  // ============================================================
  story_15_two_tickets: {
    id: 'story_15_two_tickets',
    title: 'Two Tickets',
    genre: 'Romance / Drama',
    setting: 'Central Grand Terminal, Platform 9',
    description:
      'Two train tickets to Vienna were left in an envelope on platform 9. One ticket has been secretly swapped for a local commuter pass to separate a traveling couple before departure.',
    characters: [
      { name: 'Lucas Diaz', role: 'Traveling Musician', alibi: 'Tuning his acoustic guitar on the platform bench', avatar: '🎸' },
      { name: 'Sophie Laurent', role: 'Gallery Curator', alibi: 'Calling her gallery assistant from phone booth', avatar: '👤' },
      { name: 'Marc Dubois', role: 'Station Master', alibi: 'Punching tickets at the turnstile gate', avatar: '🎫' },
      { name: 'Elena Rossi', role: 'Investigative Reporter', alibi: 'Writing traveler profiles in the station cafe', avatar: '📝' },
    ],
    truth:
      'Station master Marc Dubois harbored a secret affection for Sophie and deliberately substituted her international sleeper pass to prevent her from boarding Lucas’s train.',
    culprit: 'Marc Dubois',
    motive: 'Switching destination boarding passes to keep Sophie in the city',
    timeline: [
      { time: '07:15 PM', event: 'Lucas leaves the travel envelope on the wooden bench for Sophie.' },
      { time: '07:30 PM', event: 'Marc picks up the envelope while sweeping platform 9.' },
      { time: '07:40 PM', event: 'Marc swaps the Vienna pass with a suburban local line ticket.' },
      { time: '07:55 PM', event: 'The conductor announces final boarding; Sophie notices the switch.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Concert Ticket', detail: 'Sleeper carriage ticket to Vienna stamped with Marc’s punch.' },
      { id: 'ev2', title: 'Train Pass', detail: 'Local commuter ticket inserted into the envelope.' },
      { id: 'ev3', title: 'Cassette Tape', detail: 'A mixtape Lucas recorded for the overnight journey.' },
      { id: 'ev4', title: 'Rainy Umbrella', detail: 'Marc’s black umbrella dripping wet beside the ticket booth.' },
    ],
    clues: [
      { order: 1, title: 'Concert Ticket', text: 'A decorative envelope stamped with Vienna sleeper passes.' },
      { order: 2, title: 'Train Pass', text: 'A yellow cardboard ticket punched with station master marks.' },
      { order: 3, title: 'Subway Bench', text: 'A polished mahogany bench beneath the departure board.' },
      { order: 4, title: 'Cassette Tape', text: 'A clear cassette tape labeled "Songs for the Journey".' },
      { order: 5, title: 'Rainy Umbrella', text: 'A wet umbrella leaving puddles beside the platform turnstile.' },
      { order: 6, title: 'Coffee Cup', text: 'A steaming cardboard coffee cup with two travel stirrers.' },
    ],
    distorterObjective: 'Blame journalist Elena Rossi or accuse Lucas of cold feet.',
    difficulty: 'EASY',
  },

  // ============================================================
  // STORY 16 — THE LAST DANCE
  // ============================================================
  story_16_the_last_dance: {
    id: 'story_16_the_last_dance',
    title: 'The Last Dance',
    genre: 'Romance / Emotional',
    setting: 'Palais Garnier Opera Ballroom, Paris',
    description:
      'At midnight during the masquerade gala, prima ballerina Genevieve discovers her silk pointe shoes have been sliced backstage just moments before her farewell performance.',
    characters: [
      { name: 'Genevieve Dupont', role: 'Prima Ballerina', alibi: 'Warming up in dressing room 1', avatar: '🩰' },
      { name: 'Henri Laurent', role: 'Master Choreographer', alibi: 'Conducting orchestra rehearsal in pit', avatar: '🎼' },
      { name: 'Victor Moreau', role: 'Theatre Benefactor', alibi: 'Entertaining patrons in grand box 5', avatar: '👤' },
      { name: 'Colette Renard', role: 'Rival Understudy', alibi: 'Stretching in the mirror rehearsal studio', avatar: '👤' },
    ],
    truth:
      'Understudy Colette Renard deliberately severed the satin ribbons to force Henri to call her onto stage for the televised gala finale in place of Genevieve.',
    culprit: 'Colette Renard',
    motive: 'Damaging pointe ballet ribbons to replace Genevieve in the gala finale',
    timeline: [
      { time: '10:30 PM', event: 'Genevieve places her lucky satin shoes in the costume wardrobe.' },
      { time: '11:00 PM', event: 'Colette slips into the dressing room carrying seamstress shears.' },
      { time: '11:15 PM', event: 'The satin ribbons are sliced at the heel seams.' },
      { time: '11:45 PM', event: 'The curtain rises; Genevieve discovers the sabotage.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Silk Ribbon', detail: 'Cut satin ribbons found dropped under Colette’s locker.' },
      { id: 'ev2', title: 'Ballet Slippers', detail: 'Handcrafted pink satin shoes with razor incisions.' },
      { id: 'ev3', title: 'Broken Mirror', detail: 'Compact mirror dropped during the hasty backstage escape.' },
      { id: 'ev4', title: 'Theatre Program', detail: 'Program with Genevieve’s photo defaced in ink.' },
    ],
    clues: [
      { order: 1, title: 'Silk Ribbon', text: 'A shimmering pink satin ribbon severed with sharp shears.' },
      { order: 2, title: 'Ballet Slippers', text: 'A pair of pointe shoes laced with damaged heel stitches.' },
      { order: 3, title: 'Broken Mirror', text: 'A small silver makeup mirror shattered on backstage tiles.' },
      { order: 4, title: 'Violin Case', text: 'A velvet instrument case smelling of fresh rosin and wax.' },
      { order: 5, title: 'Red Rose', text: 'A long-stemmed red rose with an unsigned backstage note.' },
      { order: 6, title: 'Gramophone Needle', text: 'A phonograph arm playing the melancholy Tchaikovsky waltz.' },
    ],
    distorterObjective: 'Accuse benefactor Victor Moreau or choreographer Henri Laurent.',
    difficulty: 'NORMAL',
  },

  // ============================================================
  // STORY 17 — ACROSS THE PLATFORM
  // ============================================================
  story_17_across_the_platform: {
    id: 'story_17_across_the_platform',
    title: 'Across the Platform',
    genre: 'Romance / Slice of Life',
    setting: 'Greenwood Commuter Rail, Morning Crossing',
    description:
      'Every morning, two commuters on opposite platforms exchange silent glances. Today, an architect’s prized portfolio sketchbook went missing right before a life-changing presentation.',
    characters: [
      { name: 'Rohan Mehta', role: 'Graphic Designer', alibi: 'Sketching commuters from platform 1 bench', avatar: '🎨' },
      { name: 'Ananya Roy', role: 'Urban Architect', alibi: 'Waiting on platform 2 with coffee and portfolio', avatar: '📐' },
      { name: 'Kabir Sen', role: 'Cafe Barista', alibi: 'Serving commuter espresso at platform kiosk', avatar: '☕' },
      { name: 'Tara Kapoor', role: 'Daily Commuter', alibi: 'Reading newspaper beneath the station clock', avatar: '📰' },
    ],
    truth:
      'Barista Kabir Sen noticed Rohan’s feelings for Ananya and hid the sketchbook behind the coffee counter, planning to "find" it and introduce the two before the train arrived.',
    culprit: 'Kabir Sen',
    motive: 'Misplacing Rohan\'s hand-drawn architecture sketchbook to orchestrate a meeting',
    timeline: [
      { time: '08:15 AM', event: 'Rohan sets down his sketchbook on the coffee counter.' },
      { time: '08:20 AM', event: 'Kabir slides the book behind the espresso grinder.' },
      { time: '08:25 AM', event: 'Rohan panics; Ananya notices from across the rail tracks.' },
      { time: '08:30 AM', event: 'The morning express pulls in as Kabir reveals the book.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Sketchbook Pad', detail: 'Black moleskine book filled with architectural sketches of Ananya.' },
      { id: 'ev2', title: 'Coffee Mug', detail: 'Ceramic cup with Kabir’s signature foam leaf art.' },
      { id: 'ev3', title: 'Yellow Scarf', detail: 'A knitted scarf Ananya left on the platform bench.' },
      { id: 'ev4', title: 'Station Clock', detail: 'The brass station clock chiming the arrival bell.' },
    ],
    clues: [
      { order: 1, title: 'Coffee Mug', text: 'A steaming porcelain mug with latte art on the counter.' },
      { order: 2, title: 'Sketchbook Pad', text: 'A hardbound sketchbook holding delicate pencil portraits.' },
      { order: 3, title: 'Passing Train', text: 'A commuter train rattling between the twin platforms.' },
      { order: 4, title: 'Yellow Scarf', text: 'A bright wool scarf draped over the wooden handrail.' },
      { order: 5, title: 'Station Clock', text: 'A dual-faced platform clock ticking down to morning rush.' },
      { order: 6, title: 'Umbrella Stand', text: 'A brass stand holding matching patterned rain umbrellas.' },
    ],
    distorterObjective: 'Claim commuter Tara stole the book or accuse Rohan of losing it himself.',
    difficulty: 'EASY',
  },
};

export const CASES_CATALOG: Record<string, MysteryCase> = {
  ...CATALOG_120_CASES,
  ...LEGACY_CASES_CATALOG,
};

export class CaseManager {
  public static getAllCases(): MysteryCase[] {
    return Object.values(CASES_CATALOG);
  }

  public static getCase(caseId?: string): MysteryCase {
    if (!caseId) {
      return CASES_CATALOG['story_001'] || CASES_CATALOG['story_01_the_midnight_museum'];
    }

    const clean = caseId.toLowerCase().trim().replace(/['"“”]/g, '');
    if (CASES_CATALOG[clean]) {
      return CASES_CATALOG[clean];
    }

    // Direct key without prefix or with prefix
    for (const [key, val] of Object.entries(CASES_CATALOG)) {
      if (key === clean || clean.includes(key) || key.includes(clean)) {
        return val;
      }
      const strippedKey = key.replace(/^story_\d+_/i, '').replace(/_/g, ' ');
      const strippedInput = clean.replace(/^story_\d+_/i, '').replace(/_/g, ' ');
      if (strippedKey === strippedInput || strippedKey.includes(strippedInput) || strippedInput.includes(strippedKey)) {
        return val;
      }
      const valTitleClean = val.title.toLowerCase().trim().replace(/['"“”]/g, '');
      if (valTitleClean === clean || valTitleClean.includes(clean) || clean.includes(valTitleClean)) {
        return val;
      }
    }

    // Match by story number (e.g., '001', '073', '7', 'story_007', 'story_7')
    const numMatch = clean.match(/(\d+)/);
    if (numMatch) {
      const numStr3 = numMatch[1].padStart(3, '0');
      if (CASES_CATALOG[`story_${numStr3}`]) {
        return CASES_CATALOG[`story_${numStr3}`];
      }
      const numStr2 = numMatch[1].padStart(2, '0');
      for (const [key, val] of Object.entries(CASES_CATALOG)) {
        if (key.startsWith(`story_${numStr2}_`)) {
          return val;
        }
      }
    }

    return CASES_CATALOG['story_001'] || CASES_CATALOG['story_01_the_midnight_museum'];
  }

  public static getDefaultCase(): MysteryCase {
    return CASES_CATALOG['story_001'] || CASES_CATALOG['story_01_the_midnight_museum'];
  }

  /**
   * Generates 4 dynamic plausible event sequence hypotheses for "What happened?"
   */
  public static getEventOptions(c: MysteryCase): string[] {
    const list: string[] = [];

    // 1. Core canon truth statement
    if (c.truth) {
      const firstSentence = c.truth.split('.')[0].trim();
      if (firstSentence && firstSentence.length > 10) {
        list.push(firstSentence);
      }
    }

    // 2. Add notable timeline beats
    if (c.timeline && c.timeline.length > 0) {
      for (const t of c.timeline) {
        if (list.length < 4 && t.event && !list.includes(t.event)) {
          list.push(t.event);
        }
      }
    }

    // 3. Fallbacks tailored to the cast
    const chars = c.characters || [];
    const char1 = chars[0]?.name || 'Suspect';
    const char2 = chars[1]?.name || 'Accomplice';
    const fallbacks = [
      `${char1} used an inside access key to stage the disappearance during the commotion`,
      `${char2} swapped the critical evidence with a counterfeit replica earlier that evening`,
      `The scene was compromised by an orchestrated blackout before investigators arrived`,
      `A secret passage was utilized to escape surveillance undetected`,
    ];

    for (const fb of fallbacks) {
      if (list.length < 4 && !list.includes(fb)) {
        list.push(fb);
      }
    }

    return list.slice(0, 4);
  }

  /**
   * Generates 4 dynamic crime/action methods for "How did they do it?"
   */
  public static getMethodOptions(c: MysteryCase): string[] {
    const list: string[] = [];

    // Use concrete evidence/clues from this specific case
    if (c.evidence && c.evidence.length > 0) {
      for (const ev of c.evidence) {
        if (list.length < 2 && ev.detail) {
          list.push(`Used ${ev.title.toLowerCase()}: ${ev.detail}`);
        }
      }
    }

    if (c.clues && c.clues.length > 0) {
      for (const cl of c.clues) {
        if (list.length < 3 && cl.title) {
          const phrase = `Utilized ${cl.title.toLowerCase()} to manipulate the scene`;
          if (!list.includes(phrase)) list.push(phrase);
        }
      }
    }

    const fallbacks = [
      'Used an authorized master keycard and staged false diversion clues',
      'Severed the backup electrical cables to bypass security sensors',
      'Concealed the evidence inside personal belongings during departure',
      'Substituted the original article with a replica weeks in advance',
    ];

    for (const fb of fallbacks) {
      if (list.length < 4 && !list.includes(fb)) {
        list.push(fb);
      }
    }

    return list.slice(0, 4);
  }

  /**
   * Generates 4 dynamic motives for "Why did they do it?"
   */
  public static getMotiveOptions(c: MysteryCase): string[] {
    const list: string[] = [];

    // 1. True canon motive
    if (c.motive) {
      list.push(c.motive);
    }

    const genre = (c.genre || '').toLowerCase();
    const genreMotives: Record<string, string[]> = {
      noir: [
        'Massive debts from underground gambling',
        'Selling evidence to a private international collector',
        'Revenge for an unfair termination from the institution',
      ],
      horror: [
        'Compelled by supernatural voices echoing from the sealed room',
        'Attempting to reverse an ancient family curse before midnight',
        'Covering up a fatal ritual accident from decades prior',
      ],
      romance: [
        'Desperation to prevent an impending departure and separate lovers',
        'Intercepting a secret confession of love out of unrequited jealousy',
        'Protecting a beloved partner from public scandal and disgrace',
      ],
      thriller: [
        'Covering up corporate embezzlement ahead of a federal audit',
        'Extortion and corporate blackmail over offshore accounts',
        'Erasing incriminating financial records to protect personal wealth',
      ],
    };

    let targetGenre = 'noir';
    if (genre.includes('horror') || genre.includes('supernatural') || genre.includes('haunt')) {
      targetGenre = 'horror';
    } else if (genre.includes('romance') || genre.includes('love') || genre.includes('drama')) {
      targetGenre = 'romance';
    } else if (genre.includes('corporate') || genre.includes('thriller') || genre.includes('crime')) {
      targetGenre = 'thriller';
    }

    for (const m of genreMotives[targetGenre]) {
      if (list.length < 4 && !list.includes(m)) {
        list.push(m);
      }
    }

    return list.slice(0, 4);
  }

  /**
   * Distributes secret clues securely to each player based on their order.
   */
  public static distributeClues(
    mysteryCase: MysteryCase,
    players: Player[],
    gameId: string
  ): PlayerSecretClue[] {
    const baseClues = mysteryCase.clues && mysteryCase.clues.length > 0
      ? mysteryCase.clues
      : CASES_CATALOG['story_01_the_midnight_museum'].clues;

    const usedTitles = new Set(baseClues.map((c) => c.title.toLowerCase().trim()));
    const neededExtra = Math.max(0, players.length - baseClues.length);
    const extraClues = neededExtra > 0 ? ClientInfiniteClueEngine.getRandomClues(neededExtra, Array.from(usedTitles)) : [];

    const fullClueList = [
      ...baseClues,
      ...extraClues.map((c, i) => ({
        order: baseClues.length + i + 1,
        title: c.text,
        text: `${c.hint} Key details: ${c.visualElements.slice(0, 2).join(', ')}.`,
      })),
    ];

    return players.map((player, idx) => {
      const clueItem = fullClueList[idx % fullClueList.length];
      return {
        id: `clue-${gameId}-${player.id}`,
        gameId,
        playerId: player.id,
        clueTitle: clueItem.title,
        clueText: clueItem.text,
        clueOrder: clueItem.order,
        isRevealed: false,
      };
    });
  }
}
