import { test } from 'node:test';
import assert from 'node:assert/strict';
import { InvestigationPromptGenerator } from '../src/story/InvestigationPromptGenerator.js';
import { InvestigationEventAdapter } from '../src/story/InvestigationEventAdapter.js';
import { StoryEngine } from '../src/story/StoryEngine.js';
import { Serializer } from '../src/websocket/Serializer.js';
import { GuessEngine } from '../src/guessing/GuessEngine.js';
import { MarkdownStoryParser } from '../src/story/MarkdownStoryParser.js';
import { StoryDefinition, AuthoritativeGameSession, GameStatus, Room } from '../src/types/index.js';

const sampleStory: StoryDefinition = {
  id: 'case_table_key',
  title: 'The Abandoned Apartment',
  genre: 'Noir Investigation',
  description: 'A silent room where a single clue was hidden away.',
  difficulty: 'NORMAL',
  version: 1,
  author: 'Author',
  initialVariables: {},
  events: [
    {
      eventId: 'scene_1',
      act: 1,
      sequence: 1,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'key',
      visualElements: ['key', 'metallic', 'teeth'],
      acceptedConcepts: ['key', 'keys', 'metal key'],
      semanticKeywords: ['lock', 'door'],
      hint: 'Something metallic found in the shadows.',
      difficulty: 'EASY',
      narrativeDescription: 'You search beneath the old wooden table and discover a key hidden in the darkness.',
      consequenceReveal: 'The key unlocked the secret drawer in the study.',
      isKeyEvent: true,
    },
    {
      eventId: 'scene_2',
      act: 1,
      sequence: 2,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'photograph',
      visualElements: ['photo', 'frame', 'picture'],
      acceptedConcepts: ['photo', 'photograph', 'picture'],
      semanticKeywords: ['camera', 'image'],
      hint: 'A damaged personal memory.',
      difficulty: 'MEDIUM',
      narrativeDescription: 'On the mantelpiece lies a faded photograph torn across the middle.',
      consequenceReveal: 'The face in the photograph revealed the suspect.',
      isKeyEvent: true,
    },
  ],
  endings: [],
};

test('InvestigationPromptGenerator: anti-leak catches exact answer, plurals, stems, and accepted answers', () => {
  // Exact answer leak
  assert.equal(
    InvestigationPromptGenerator.validateAntiLeak('You find a key under the table. Draw it.', 'key'),
    false
  );

  // Plural leak
  assert.equal(
    InvestigationPromptGenerator.validateAntiLeak('You find keys under the table. Draw them.', 'key'),
    false
  );

  // Substring safe (word boundary check: monkey vs key)
  assert.equal(
    InvestigationPromptGenerator.validateAntiLeak('A monkey was seen nearby.', 'key'),
    true
  );

  // Accepted answers leak
  assert.equal(
    InvestigationPromptGenerator.validateAntiLeak(
      'A metal key was found near the floor.',
      'small key',
      '',
      ['key', 'metal key']
    ),
    false
  );

  // Completely clean prompt is safe
  assert.equal(
    InvestigationPromptGenerator.validateAntiLeak(
      'You search beneath the old wooden table and notice something metallic hidden in the darkness. Draw what you discovered.',
      'key',
      '',
      ['key', 'keys']
    ),
    true
  );
});

test('InvestigationPromptGenerator: sanitizes narrative description without leaking answer', () => {
  const prompt = InvestigationPromptGenerator.generate({
    canonicalAnswer: 'key',
    promptType: 'OBJECT',
    narrativeContext: 'You search beneath the old wooden table and discover a key hidden in the darkness.',
    storyTitle: 'The Abandoned Apartment',
    storyGenre: 'Noir Investigation',
    storySetting: 'the abandoned apartment',
    hint: 'Something metallic',
    eventDescription: 'You search beneath the old wooden table and discover a key hidden in the darkness.',
    acceptedAnswers: ['key', 'keys'],
  });

  // Must NOT contain "key" or "keys"
  assert.equal(/\bkeys?\b/i.test(prompt), false, `Prompt should not leak 'key', but got: ${prompt}`);
  // Must be a complete contextual sentence
  assert.ok(prompt.length > 20, 'Prompt must be a full sentence');
  assert.ok(/draw/i.test(prompt), 'Prompt should include drawing guidance');
});

test('InvestigationEventAdapter: generates contextual drawerPrompt for adapted events', () => {
  const adapted = InvestigationEventAdapter.adapt(
    sampleStory.events[0],
    null,
    sampleStory.title,
    sampleStory.genre,
    sampleStory.description
  );

  assert.ok(adapted.drawerPrompt, 'Adapted event must have drawerPrompt');
  assert.equal(/\bkeys?\b/i.test(adapted.drawerPrompt), false);
  assert.equal(adapted.canonicalAnswer, 'key');
  assert.deepEqual(adapted.acceptedAnswers, ['key', 'keys', 'metal key']);
});

test('StoryEngine: returns PromptOptions with rich contextual investigationTask for all choices', () => {
  const engine = new StoryEngine(sampleStory);
  const { targetEvent, options } = engine.generateThreePromptChoices(1, new Set());

  assert.equal(options.length, 3, 'Must present 3 options');
  for (const opt of options) {
    assert.ok(opt.investigationTask, `Option ${opt.optionIndex} must have investigationTask`);
    assert.ok(opt.investigationTask.length > 15, 'Task must be a descriptive sentence');
    // None of the options should leak the target answer if they are safe prompts
    if (opt.isDistractor) {
      assert.ok(opt.investigationTask.toLowerCase().includes('draw') || opt.investigationTask.length > 20);
    }
  }
});

test('Serializer: strictly preserves information asymmetry between drawer and guessers', () => {
  const mockSession: AuthoritativeGameSession = {
    id: 'session_001',
    roomId: 'room_001',
    storyId: 'case_table_key',
    state: GameStatus.DRAWING,
    currentAct: 1,
    turnIndex: 0,
    currentDrawerId: 'player_drawer',
    roundStartedAt: 1000,
    roundEndsAt: 1080,
    activePromptOptions: [],
    selectedEvent: {
      eventId: 'scene_1',
      act: 1,
      sequence: 1,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'key',
      visualElements: ['key'],
      acceptedConcepts: ['key', 'keys'],
      semanticKeywords: [],
      hint: 'Something metallic',
      difficulty: 'EASY',
      narrativeDescription: 'A key in the darkness.',
      consequenceReveal: 'Unlocked the drawer.',
      isKeyEvent: true,
      drawerPrompt: 'You search beneath the table and discover something metallic hidden in the darkness. Draw what you discovered.',
    },
    scores: { player_drawer: 0, player_guesser: 0 },
    drawingStrokes: [],
    solvedEvents: [],
    storyVariables: {},
    finalTheories: {},
    ending: null,
    retiredEventIds: [],
    usedWordObjectives: [],
    offeredPromptHistory: [],
    lastRoundOutcome: null,
    narrativeLog: [],
    evidenceBoard: [],
    suspects: [],
    caseProgress: null,
    discussionVotes: [],
    discussionOptions: null,
    storyContext: 'In the apartment, investigators are searching the dusty room.',
    investigationObjective: 'Examine the crime scene to deduce what critical evidence the sketch artist discovered.',
  };

  const mockRoom: Room = {
    id: 'room_001',
    code: 'TEST',
    hostPlayerId: 'player_drawer',
    status: 'IN_GAME',
    createdAt: 1000,
    updatedAt: 1000,
    settings: {
      maxPlayers: 8,
      drawingTimeLimit: 80,
      promptSelectionTimeLimit: 15,
      roundsPerGame: 1,
      storyId: 'case_table_key',
    },
    players: [
      {
        playerId: 'player_drawer',
        displayName: 'Holmes',
        avatar: 'avatar1',
        roomId: 'room_001',
        score: 0,
        isHost: true,
        isConnected: true,
        isReady: true,
        joinedAt: 1000,
        lastSeen: 1000,
        turnCount: 0,
        correctGuesses: 0,
        reconnectToken: 'token_drawer',
      },
      {
        playerId: 'player_guesser',
        displayName: 'Watson',
        avatar: 'avatar2',
        roomId: 'room_001',
        score: 0,
        isHost: false,
        isConnected: true,
        isReady: true,
        joinedAt: 1000,
        lastSeen: 1000,
        turnCount: 0,
        correctGuesses: 0,
        reconnectToken: 'token_guesser',
      },
    ],
  };

  // 1. Public state for guessers (Information Balance Rule)
  const publicState = Serializer.serializePublicState(mockSession, mockRoom);
  // Guessers receive WHY: storyContext and investigationObjective
  assert.equal(publicState.storyContext, 'In the apartment, investigators are searching the dusty room.');
  assert.equal(publicState.investigationObjective, 'Examine the crime scene to deduce what critical evidence the sketch artist discovered.');
  // Guessers NEVER receive WHAT: drawerPrompt, canonicalAnswer, drawingObjective
  assert.equal((publicState as any).drawerPrompt, undefined, 'Public state must NEVER include drawerPrompt');
  assert.equal((publicState as any).canonicalAnswer, undefined, 'Public state must NEVER include canonicalAnswer');
  assert.equal((publicState as any).drawingObjective, undefined, 'Public state must NEVER include drawingObjective');

  // 2. Private state for drawer
  const drawerPrivateState = Serializer.serializePrivateDrawerState(mockSession);
  assert.ok(drawerPrivateState.drawerPrompt, 'Drawer must receive drawerPrompt');
  assert.equal(drawerPrivateState.canonicalAnswer, 'key');
  assert.equal(drawerPrivateState.selectedObjective, 'key');
  assert.equal(drawerPrivateState.storyContext, 'In the apartment, investigators are searching the dusty room.');
});

test('Information Balance Rule: InvestigationEventAdapter sanitizes storyContext and generates objective', () => {
  const adapted = InvestigationEventAdapter.adapt(
    sampleStory.events[0],
    null,
    sampleStory.title,
    sampleStory.genre
  );

  // 1. Drawer gets full contextual task
  assert.ok(adapted.drawerPrompt.length > 20);
  assert.ok(!adapted.drawerPrompt.toLowerCase().includes('key'), 'Drawer prompt must not leak the answer word');

  // 2. Guesser narrativeContext is sanitized so answer is NEVER revealed
  assert.ok(!adapted.narrativeContext.toLowerCase().includes('key'), 'Public narrativeContext must not leak secret answer');

  // 3. Guesser investigationObjective explains WHAT detectives are doing without leaking concept
  assert.ok(adapted.investigationObjective.length > 15);
  assert.ok(!adapted.investigationObjective.toLowerCase().includes('key'), 'investigationObjective must not leak secret answer');
});

test('GuessEngine: validates one-word / short concept guesses against canonicalAnswer and acceptedAnswers', () => {
  const event = sampleStory.events[0];

  // Guesser types "key" -> EXACT / CORRECT
  const resultExact = GuessEngine.evaluate('key', event);
  assert.equal(resultExact.verdict, 'CORRECT');

  // Guesser types "keys" (plural in acceptedConcepts) -> CORRECT
  const resultPlural = GuessEngine.evaluate('keys', event);
  assert.equal(resultPlural.verdict, 'CORRECT');

  // Guesser types "metal key" (in acceptedConcepts) -> CORRECT
  const resultPhrase = GuessEngine.evaluate('metal key', event);
  assert.equal(resultPhrase.verdict, 'CORRECT');

  // Guesser types "hammer" -> WRONG
  const resultWrong = GuessEngine.evaluate('hammer', event);
  assert.equal(resultWrong.verdict, 'WRONG');
});

test('Information Balance Rule: Guesser receives story context & clue lead for wording without leaking answer', () => {
  const event = sampleStory.events[0];
  const cleanWord = MarkdownStoryParser.cleanToClueWord(event.drawingObjective);

  // 1. Sanitize clue lead
  const rawHint = "Something made of brass used to unlock doors.";
  const sanitizedHint = InvestigationPromptGenerator.sanitizeForPrompt(rawHint, cleanWord, event.acceptedConcepts);

  assert.ok(!sanitizedHint.toLowerCase().includes('key'), 'Clue hint must not leak secret answer');
  assert.ok(sanitizedHint.includes('brass'), 'Clue hint retains thematic wording context');

  // 2. Serializer outputs clueHint and storyContext
  const session: any = {
    ...sampleStory,
    selectedEvent: event,
    storyContext: 'In the apartment, investigators are searching the dusty room.',
    investigationObjective: 'Examine the crime scene to deduce what critical evidence was found.',
    clueHint: sanitizedHint,
    state: 'DRAWING',
    players: [],
    drawingStrokes: [],
    solvedEvents: [],
    storyVariables: {},
  };
  const publicState = Serializer.serializePublicState(session, { players: [] } as any);
  assert.equal(publicState.clueHint, sanitizedHint);
  assert.equal(publicState.storyContext, 'In the apartment, investigators are searching the dusty room.');
  assert.ok(publicState.investigationObjective!.length > 10);
});

test('Dynamic Hint Reveal: distributes letters across word length like skribbl.io without revealing whole word', () => {
  // Test word like "BEDROOM" (length 7)
  const word = 'BEDROOM';
  const L = word.length;
  const maxReveals = Math.min(L - 1, Math.max(1, Math.floor(L / 2)));
  const chosenIndices: number[] = [0];

  if (maxReveals >= 2 && L >= 4) {
    const mid = Math.floor(L / 2);
    if (!chosenIndices.includes(mid)) chosenIndices.push(mid);
  }
  if (maxReveals >= 3 && L >= 6) {
    const later = L - 1;
    if (!chosenIndices.includes(later)) chosenIndices.push(later);
  }

  // Expect indices [0, 3, 6] -> B _ _ R _ _ M
  assert.deepEqual(chosenIndices, [0, 3, 6]);
  assert.ok(chosenIndices.length <= Math.ceil(L / 2), 'Must never reveal more than half the word');

  // Verify pattern output
  const masked = new Array(L).fill(null);
  chosenIndices.forEach((idx) => {
    masked[idx] = word[idx];
  });
  const displayPattern = masked.map((c) => c || '_').join(' ');
  assert.equal(displayPattern, 'B _ _ R _ _ M');
});


