import crypto from 'crypto';
import {
  StoryBlueprint,
  GeneratedStory,
  GeneratedStoryCharacter,
  GeneratedStoryEvent,
} from './types.js';

/**
 * Deterministic UUID generator from namespace and name
 */
function generateDeterministicUuid(namespace: string, name: string): string {
  const hash = crypto.createHash('sha1').update(`${namespace}:${name}`).digest('hex');
  return [
    hash.substring(0, 8),
    hash.substring(8, 12),
    '5' + hash.substring(13, 16), // version 5
    ((parseInt(hash.substring(16, 18), 16) & 0x3f) | 0x80).toString(16) + hash.substring(18, 20), // variant RFC4122
    hash.substring(20, 32),
  ].join('-');
}

export function buildStory(bp: StoryBlueprint): GeneratedStory {
  // Validate basic counts
  if (!bp.id || !bp.title || !bp.genre) {
    throw new Error(`Blueprint must have id, title, and genre: ${JSON.stringify(bp.id)}`);
  }
  if (bp.characters.length < 4 || bp.characters.length > 6) {
    throw new Error(`Story ${bp.id} has ${bp.characters.length} characters (must be 4-6)`);
  }
  if (bp.events.length < 8 || bp.events.length > 12) {
    throw new Error(`Story ${bp.id} has ${bp.events.length} events (must be 8-12)`);
  }
  if (bp.timeline.length < 4 || bp.timeline.length > 6) {
    throw new Error(`Story ${bp.id} has ${bp.timeline.length} timeline entries (must be 4-6)`);
  }
  if (bp.evidence.length < 4 || bp.evidence.length > 6) {
    throw new Error(`Story ${bp.id} has ${bp.evidence.length} evidence items (must be 4-6)`);
  }
  if (bp.clues.length < 6 || bp.clues.length > 8) {
    throw new Error(`Story ${bp.id} has ${bp.clues.length} clues (must be 6-8)`);
  }

  // Ensure 3-4 intro variations
  const intros = bp.introVariations && bp.introVariations.length >= 3
    ? bp.introVariations
    : [
        bp.hook,
        `Investigation file opened: ${bp.hook} Look closely at every detail.`,
        `Trouble begins here. ${bp.hook} Can your team uncover the truth?`,
        `The scene is set in ${bp.setting}. ${bp.hook}`,
      ];

  // Ensure 3-4 reveal variations
  const reveals = bp.revealVariations && bp.revealVariations.length >= 3
    ? bp.revealVariations
    : [
        bp.finalReveal,
        `The mystery is unraveled! ${bp.finalReveal}`,
        `At last, the truth comes into the light: ${bp.finalReveal}`,
        `Investigation resolved. Here is what happened: ${bp.finalReveal}`,
      ];

  // Ensure 3-4 global hints
  const hints = bp.hintVariations && bp.hintVariations.length >= 3
    ? bp.hintVariations
    : [
        `Pay attention to where ${bp.culprit} was seen.`,
        `Look closely at the timeline and missing items.`,
        `One of the character statements does not match physical evidence.`,
        `Do not trust the obvious suspect too quickly.`,
      ];

  // Map characters
  const characters: GeneratedStoryCharacter[] = bp.characters.map((c) => {
    const charId = generateDeterministicUuid(bp.id, `char_${c.name}`);
    const statements = c.statementVariations && c.statementVariations.length >= 3
      ? c.statementVariations
      : [
          c.whatTheySay,
          `"${c.whatTheySay}"`,
          `I told you already: ${c.whatTheySay}`,
          `Listen to me carefully: ${c.whatTheySay}`,
        ];

    return {
      id: charId,
      name: c.name,
      role_description: c.role,
      personality: c.personality,
      what_they_say: c.whatTheySay,
      what_they_hide: c.whatTheyHide,
      alibi: c.alibi,
      connection: c.connection,
      what_they_know: c.whatTheyKnow,
      what_they_do_not_know: c.whatTheyDoNotKnow,
      avatar: c.avatar || '👤',
      statement_variations: statements,
    };
  });

  const characterSecrets = bp.characters.map((c) => ({
    character: c.name,
    secret: c.whatTheyHide,
  }));

  // Map events
  const events: GeneratedStoryEvent[] = bp.events.map((ev, idx) => {
    const eventId = generateDeterministicUuid(bp.id, `event_${idx + 1}`);
    const nextKey = idx < bp.events.length - 1 ? bp.events[idx + 1].key : null;
    const correctAnswer = ev.correctAnswer || ev.clue;

    const descVariants = ev.descriptionVariations && ev.descriptionVariations.length >= 3
      ? ev.descriptionVariations
      : [
          ev.whatHappens,
          `At ${ev.timeLabel}: ${ev.whatHappens}`,
          `Notice this moment carefully: ${ev.whatHappens}`,
        ];

    const hintVariants = ev.hintVariations && ev.hintVariations.length >= 3
      ? ev.hintVariations
      : [
          ev.hint,
          `Clue hint: Think about ${ev.clue.toLowerCase()}.`,
          `Look for evidence connected to: ${ev.whatToDiscover.toLowerCase()}.`,
        ];

    const clueVariants = ev.clueVariations && ev.clueVariations.length >= 3
      ? ev.clueVariations
      : [
          ev.clue,
          `Item: ${ev.clue}`,
          `Clue Word: ${ev.clue}`,
        ];

    // Ensure accepted guesses contains lowercase clue and trimmed variations
    const acceptedGuessesSet = new Set<string>([
      ev.clue.toLowerCase().trim(),
      correctAnswer.toLowerCase().trim(),
      ...ev.acceptedGuesses.map((g) => g.toLowerCase().trim()),
    ]);

    return {
      id: eventId,
      event_key: ev.key,
      order_index: idx + 1,
      time_label: ev.timeLabel,
      description: ev.whatHappens,
      what_happens: ev.whatHappens,
      what_to_discover: ev.whatToDiscover,
      clue: ev.clue,
      evidence: ev.evidence,
      wrong_answers: ev.wrongAnswers,
      correct_answer: correctAnswer,
      accepted_guesses: Array.from(acceptedGuessesSet),
      hint: ev.hint,
      next_event_key: nextKey,
      is_key_event: idx === 0 || idx === bp.events.length - 1 || idx === Math.floor(bp.events.length / 2),
      dynamic_wording: {
        descriptions: descVariants,
        hints: hintVariants,
        clues: clueVariants,
      },
    };
  });

  const endings = [
    {
      endingId: 'true_ending',
      title: 'The Truth Revealed',
      narrativeText: bp.trueEnding,
    },
    {
      endingId: 'wrong_accusation',
      title: 'An Innocent Accused',
      narrativeText: bp.wrongAccusationEnding,
    },
    {
      endingId: 'distorter_victory',
      title: 'The Deception Succeeded',
      narrativeText: bp.distorterVictoryEnding,
    },
  ];

  return {
    id: bp.id,
    title: bp.title,
    genre: bp.genre,
    setting: bp.setting,
    description: bp.hook,
    main_mystery: bp.mainMystery,
    difficulty: bp.difficulty,
    culprit: bp.culprit,
    motive: bp.motive,
    method: bp.method,
    truth: bp.truth,
    characters,
    character_secrets: characterSecrets,
    timeline: bp.timeline,
    events,
    evidence: bp.evidence,
    clues: bp.clues,
    red_herrings: bp.redHerrings,
    theories: {
      wrongTheories: bp.wrongTheories,
      correctTheory: bp.correctTheory,
    },
    final_investigation_prompt: bp.finalInvestigationPrompt,
    final_reveal: bp.finalReveal,
    endings,
    distorter_objective: bp.distorterObjective,
    dynamic_wording: {
      intros,
      reveals,
      hints,
    },
  };
}
