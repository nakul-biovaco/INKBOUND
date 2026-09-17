import { MysteryCase, PlayerSecretClue } from '../types/game';
import { Player } from '../types/player';

export const CASES_CATALOG: Record<string, MysteryCase> = {
  midnight_museum_heist: {
    id: 'midnight_museum_heist',
    title: 'The Midnight Museum Heist',
    genre: 'Noir Museum Heist',
    setting: 'The Metropolitan Antiquities Museum, 3rd Floor Vault Gallery',
    description:
      'At 11:44 PM on a stormy Tuesday, the 140-carat Eye of Osiris blue diamond vanished from its pedestal in the museum vault. The security alarm wire was cleanly cut, the camera feeds were looped, and glass shards were found near the fire exit.',
    characters: [
      {
        name: 'Arthur Vance',
        role: 'Head of Vault Security',
        alibi: 'Claims he was doing exterior perimeter rounds in the torrential rain',
        avatar: '🛡️',
      },
      {
        name: 'Elena Rostova',
        role: 'Master Gemologist',
        alibi: 'Claims she was in the library cataloging acquisition receipts',
        avatar: '🔬',
      },
      {
        name: 'Julian Pike',
        role: 'Night Janitor',
        alibi: 'Claims he was buffing marble floors in the basement boiler room',
        avatar: '🧹',
      },
      {
        name: 'Vivian Drake',
        role: 'Wealthy Diamond Collector',
        alibi: 'Claims she left the museum gala promptly at 10:30 PM',
        avatar: '💎',
      },
    ],
    truth:
      'Head of Vault Security Arthur Vance staged the heist to pay off his massive underground gambling debts. He disabled the corridor camera with his master key at 11:39 PM, unlocked the vault at 11:42 PM, removed the Eye of Osiris diamond at 11:44 PM, smashed a dummy glass case to create a diversion, and escaped in a red getaway car waiting outside at 11:48 PM.',
    culprit: 'Arthur Vance',
    motive: 'Debts from underground gambling',
    timeline: [
      {
        time: '11:39 PM',
        event: 'Vault corridor security camera feed cut using authorized master keycard override.',
      },
      {
        time: '11:42 PM',
        event: 'Uniformed security officer enters the inner vault chamber through the East Door.',
      },
      {
        time: '11:44 PM',
        event: 'Eye of Osiris diamond pedestal weight sensor disabled and diamond pocketed.',
      },
      {
        time: '11:48 PM',
        event: 'A red getaway sedan speeds away from the rear loading dock alleyway.',
      },
    ],
    evidence: [
      {
        id: 'ev1',
        title: 'Guard Uniform Badge',
        detail: 'Security badge #042 found dropped near the vault threshold.',
      },
      {
        id: 'ev2',
        title: 'Shattered Display Glass',
        detail: 'Glass fractured outwards from inside, proving the break-in was an inside job.',
      },
      {
        id: 'ev3',
        title: 'Red Tire Marks',
        detail: 'Fresh red rubber skid marks and wet tread in the museum rear loading dock.',
      },
      {
        id: 'ev4',
        title: 'Gambling IOUs',
        detail: 'Urgent debt collection demands signed by Vance discovered in locker #12.',
      },
    ],
    clues: [
      {
        order: 1,
        title: 'East Corridor Camera Sabotage',
        text: 'At 11:39 PM, you observed a tall figure in a security guard uniform using a brass master keycard to disable the corridor camera.',
      },
      {
        order: 2,
        title: 'Vault Door Disengaged & Glass Crack',
        text: 'At 11:42 PM, through the ventilation shaft, you heard the vault heavy bolts disengage followed by the sharp crack of safety glass.',
      },
      {
        order: 3,
        title: 'The Pedestal Observation',
        text: 'At 11:44 PM, you saw a gloved hand slip the glowing 140-carat blue diamond into an inner jacket pocket beside overdue debt slips.',
      },
      {
        order: 4,
        title: 'The Red Alley Getaway',
        text: 'At 11:48 PM, you spotted a red sedan with its headlights off screeching away from the rear museum loading dock into the rain.',
      },
    ],
    misleadingInformation:
      'Rumors circulated that a cat burglar descended from the skylight, but the glass dust on the skylight was completely undisturbed.',
    distorterObjective:
      'Convince the detectives that the janitor Julian Pike or collector Vivian Drake committed the theft, or scramble the 11:39 - 11:48 timeline.',
    difficulty: 'NORMAL',
  },
  alchemists_poison: {
    id: 'alchemists_poison',
    title: "The Alchemist's Stolen Elixir",
    genre: 'Gothic Mystery',
    setting: 'Blackwood Estate Apothecary & Conservatory',
    description:
      'Lord Blackwood was found paralyzed in his study with an empty vial of the legendary Panacea Elixir. The conservatory windows were ajar and a distinctive scent of crushed belladonna lingered.',
    characters: [
      { name: 'Dr. Alistair Finch', role: 'Personal Physician', alibi: 'Preparing tinctures in the dispensary', avatar: '🩺' },
      { name: 'Lady Eleanor Blackwood', role: 'Heir to Estate', alibi: 'Reading poetry in the salon', avatar: '📿' },
      { name: 'Corvus Graves', role: 'Botanist Assistant', alibi: 'Tending nocturnal orchids in the greenhouse', avatar: '🌿' },
      { name: 'Madame Vivienne', role: 'Estate Medium', alibi: 'Conducting tarot reading in the gallery', avatar: '🔮' },
    ],
    truth:
      'Dr. Alistair Finch substituted the Panacea with belladonna to claim Lord Blackwood’s private medical patent rights before the new will was finalized.',
    culprit: 'Dr. Alistair Finch',
    motive: 'Medical patent theft & inheritance dispute',
    timeline: [
      { time: '9:15 PM', event: 'Dr. Finch observed entering the private poison cabinet.' },
      { time: '9:30 PM', event: 'Lord Blackwood drinks evening tonic delivered on silver tray.' },
      { time: '9:45 PM', event: 'Sudden collapse heard in the study.' },
      { time: '10:00 PM', event: 'Apothecary ledger missing page #42.' },
    ],
    evidence: [
      { id: 'ev1', title: 'Crushed Belladonna Leaves', detail: 'Found beneath the doctor’s leather satchel.' },
      { id: 'ev2', title: 'Torn Patent Will', detail: 'Draft assigning formulas to Blackwood charity was torn.' },
    ],
    clues: [
      { order: 1, title: 'Cabinet Key', text: 'You saw a silver serpent key unlock the upper poison cabinet at 9:15 PM.' },
      { order: 2, title: 'Silver Tray Delivery', text: 'You saw Dr. Finch carry a steaming glass goblet into the master study at 9:30 PM.' },
      { order: 3, title: 'Sudden Thud & Drop', text: 'At 9:45 PM you heard heavy body collapse followed by glass vial rolling on mahogany floor.' },
      { order: 4, title: 'Burned Ledger Scrap', text: 'At 10:00 PM you spotted charred notebook pages smoldering in the study fireplace.' },
    ],
    distorterObjective: 'Frame Corvus Graves (the botanist) or claim Lord Blackwood self-administered the draught.',
    difficulty: 'NORMAL',
  },
};

export class CaseManager {
  public static getAllCases(): MysteryCase[] {
    return Object.values(CASES_CATALOG);
  }

  public static getCase(caseId: string): MysteryCase {
    return CASES_CATALOG[caseId] || CASES_CATALOG.midnight_museum_heist;
  }

  public static getDefaultCase(): MysteryCase {
    return CASES_CATALOG.midnight_museum_heist;
  }

  /**
   * Distributes secret clues securely to each player based on their order.
   * Player 0 gets Clue 1, Player 1 gets Clue 2, etc.
   */
  public static distributeClues(
    mysteryCase: MysteryCase,
    players: Player[],
    gameId: string
  ): PlayerSecretClue[] {
    const clues = mysteryCase.clues;
    return players.map((player, idx) => {
      // Loop through clues if more players than clues
      const clueItem = clues[idx % clues.length];
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
