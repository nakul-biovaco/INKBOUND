import { StoryBlueprint } from './types.js';

export interface CompactStoryDef {
  num: number;
  title: string;
  genre: string;
  setting: string;
  hook: string;
  mystery: string;
  culprit: string;
  motive: string;
  method: string;
  truth: string;
  distorter: string;
  difficulty?: 'EASY' | 'NORMAL' | 'HARD';
  cast: Array<{
    name: string;
    role: string;
    personality: string;
    say: string;
    hide: string;
    alibi: string;
    conn: string;
    know: string;
    blind: string;
    avatar: string;
  }>;
  timeline: Array<[string, string]>;
  events: Array<{
    time: string;
    happens: string;
    discover: string;
    clue: string;
    evidence: string;
    wrong: [string, string, string];
    guesses: string[];
    hint: string;
  }>;
  evidence: Array<{ id: string; title: string; detail: string }>;
  clues: Array<[string, string] | { title: string; text: string }>;
  herrings: Array<[string, string] | { lead: string; explanation: string }>;
  wrongTheories: [string, string] | string[];
  correctTheory: string;
  prompt: string;
  reveal: string;
  trueEnding: string;
  wrongEnding: string;
  distorterEnding: string;
}

export function expandCompactStory(def: CompactStoryDef): StoryBlueprint {
  const storyId = `story_${def.num.toString().padStart(3, '0')}`;

  const characters = def.cast.map((c) => ({
    name: c.name,
    role: c.role,
    personality: c.personality,
    whatTheySay: c.say,
    whatTheyHide: c.hide,
    alibi: c.alibi,
    connection: c.conn,
    whatTheyKnow: c.know,
    whatTheyDoNotKnow: c.blind,
    avatar: c.avatar,
    statementVariations: [
      c.say,
      `"${c.say}"`,
      `Listen to me: ${c.say}`,
      `I tell you the truth: ${c.say}`,
    ],
  }));

  const timeline = def.timeline.map(([time, event]) => ({ time, event }));

  const events = def.events.map((ev, idx) => ({
    key: `ev_${idx + 1}`,
    timeLabel: ev.time,
    whatHappens: ev.happens,
    whatToDiscover: ev.discover,
    clue: ev.clue,
    evidence: ev.evidence,
    wrongAnswers: [...ev.wrong],
    correctAnswer: ev.clue,
    acceptedGuesses: [
      ev.clue.toLowerCase().trim(),
      ...ev.guesses.map((g) => g.toLowerCase().trim()),
    ],
    hint: ev.hint,
    descriptionVariations: [
      ev.happens,
      `At ${ev.time}: ${ev.happens}`,
      `Notice this clue: ${ev.happens}`,
    ],
    hintVariations: [
      ev.hint,
      `Clue hint: Think about ${ev.clue.toLowerCase()}.`,
      `Search for: ${ev.discover.toLowerCase()}`,
    ],
    clueVariations: [
      ev.clue,
      `Item: ${ev.clue}`,
      `Clue Word: ${ev.clue}`,
    ],
  }));

  const clues = (def.clues as any[]).map((c: any, idx: number) => {
    if (Array.isArray(c)) {
      return {
        order: idx + 1,
        title: c[0],
        text: c[1],
      };
    }
    return {
      order: idx + 1,
      title: c.title,
      text: c.text,
    };
  });

  const redHerrings = (def.herrings as any[]).map((h: any) => {
    if (Array.isArray(h)) {
      return {
        lead: h[0],
        explanation: h[1],
      };
    }
    return {
      lead: h.lead,
      explanation: h.explanation,
    };
  });

  return {
    id: storyId,
    title: def.title,
    genre: def.genre,
    setting: def.setting,
    hook: def.hook,
    mainMystery: def.mystery,
    difficulty: def.difficulty || 'NORMAL',
    culprit: def.culprit,
    motive: def.motive,
    method: def.method,
    truth: def.truth,
    distorterObjective: def.distorter,
    characters,
    timeline,
    events,
    evidence: def.evidence,
    clues,
    redHerrings,
    wrongTheories: [...def.wrongTheories],
    correctTheory: def.correctTheory,
    finalInvestigationPrompt: def.prompt,
    finalReveal: def.reveal,
    trueEnding: def.trueEnding,
    wrongAccusationEnding: def.wrongEnding,
    distorterVictoryEnding: def.distorterEnding,
    introVariations: [
      def.hook,
      `Case file ${storyId}: ${def.hook} Look closely at every clue.`,
      `Trouble begins in ${def.setting}. ${def.hook}`,
      `The mystery starts now. ${def.hook} Can you solve it?`,
    ],
    revealVariations: [
      def.reveal,
      `The mystery is unraveled! ${def.reveal}`,
      `At last, the truth comes out: ${def.reveal}`,
      `Case resolved! Here is what happened: ${def.reveal}`,
    ],
    hintVariations: [
      `Pay attention to where ${def.culprit} was seen.`,
      `Look closely at the timeline and missing items.`,
      `One of the character statements does not match physical evidence.`,
      `Do not trust the obvious suspect too quickly.`,
    ],
  };
}

export function createStoryBlueprint(bp: StoryBlueprint): StoryBlueprint {
  return bp;
}
