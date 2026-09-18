export interface StoryBlueprint {
  id: string; // e.g. "story_001"
  title: string;
  genre: string;
  setting: string;
  hook: string;
  mainMystery: string;
  difficulty: 'EASY' | 'NORMAL' | 'HARD';
  culprit: string;
  motive: string;
  method: string;
  truth: string;
  distorterObjective: string;
  characters: Array<{
    name: string;
    role: string;
    personality: string;
    whatTheySay: string;
    whatTheyHide: string;
    alibi: string;
    connection: string;
    whatTheyKnow: string;
    whatTheyDoNotKnow: string;
    avatar: string;
    statementVariations?: string[];
  }>;
  timeline: Array<{
    time: string;
    event: string;
  }>;
  events: Array<{
    key: string;
    timeLabel: string;
    whatHappens: string;
    whatToDiscover: string;
    clue: string;
    evidence: string;
    wrongAnswers: string[];
    correctAnswer?: string;
    acceptedGuesses: string[];
    hint: string;
    descriptionVariations?: string[];
    hintVariations?: string[];
    clueVariations?: string[];
  }>;
  evidence: Array<{
    id: string;
    title: string;
    detail: string;
  }>;
  clues: Array<{
    order: number;
    title: string;
    text: string;
  }>;
  redHerrings: Array<{
    lead: string;
    explanation: string;
  }>;
  wrongTheories: string[];
  correctTheory: string;
  finalInvestigationPrompt: string;
  finalReveal: string;
  trueEnding: string;
  wrongAccusationEnding: string;
  distorterVictoryEnding: string;
  introVariations?: string[];
  revealVariations?: string[];
  hintVariations?: string[];
}

export interface GeneratedStoryEvent {
  id: string; // UUID
  event_key: string;
  order_index: number;
  time_label: string;
  description: string;
  what_happens: string;
  what_to_discover: string;
  clue: string;
  evidence: string;
  wrong_answers: string[];
  correct_answer: string;
  accepted_guesses: string[];
  hint: string;
  next_event_key: string | null;
  is_key_event: boolean;
  dynamic_wording: {
    descriptions: string[];
    hints: string[];
    clues: string[];
  };
}

export interface GeneratedStoryCharacter {
  id: string; // UUID
  name: string;
  role_description: string;
  personality: string;
  what_they_say: string;
  what_they_hide: string;
  alibi: string;
  connection: string;
  what_they_know: string;
  what_they_do_not_know: string;
  avatar: string;
  statement_variations: string[];
}

export interface GeneratedStory {
  id: string; // "story_001" to "story_120"
  title: string;
  genre: string;
  setting: string;
  description: string;
  main_mystery: string;
  difficulty: 'EASY' | 'NORMAL' | 'HARD';
  culprit: string;
  motive: string;
  method: string;
  truth: string;
  characters: GeneratedStoryCharacter[];
  character_secrets: Array<{ character: string; secret: string }>;
  timeline: Array<{ time: string; event: string }>;
  events: GeneratedStoryEvent[];
  evidence: Array<{ id: string; title: string; detail: string }>;
  clues: Array<{ order: number; title: string; text: string }>;
  red_herrings: Array<{ lead: string; explanation: string }>;
  theories: {
    wrongTheories: string[];
    correctTheory: string;
  };
  final_investigation_prompt: string;
  final_reveal: string;
  endings: Array<{
    endingId: string;
    title: string;
    narrativeText: string;
  }>;
  distorter_objective: string;
  dynamic_wording: {
    intros: string[];
    reveals: string[];
    hints: string[];
  };
}
