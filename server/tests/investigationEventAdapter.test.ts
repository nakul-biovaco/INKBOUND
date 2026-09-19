import { test } from 'node:test';
import assert from 'node:assert/strict';
import { InvestigationEventAdapter } from '../src/story/InvestigationEventAdapter.js';
import { StoryEvent, InvestigationEvent } from '../src/types/index.js';
import { GeneratedStory, GeneratedStoryEvent } from '../src/types/storyCatalog.js';

const mockStoryEvent: StoryEvent = {
  eventId: 'museum_01',
  act: 1,
  sequence: 1,
  eventType: 'DRAW_EVENT',
  drawingObjective: 'Vault Keys',
  visualElements: ['keys', 'keychain', 'brass keys'],
  acceptedConcepts: ['vault keys', 'keys', 'key', 'brass keys'],
  semanticKeywords: ['keys', 'vault', 'lock', 'brass'],
  hint: 'Something made of brass used to unlock doors.',
  difficulty: 'EASY',
  narrativeDescription: 'Heavy brass keys dropped near the air shaft.',
  consequenceReveal: 'The dropped master keys belonged to the chairman.',
};

const mockCatalogEvent: GeneratedStoryEvent = {
  id: 'museum_01',
  event_key: 'ev_1',
  order_index: 1,
  time_label: '01:45 AM',
  description: 'Heavy brass keys are dropped near the air shaft.',
  what_happens: 'Heavy brass keys are dropped near the air shaft.',
  what_to_discover: 'The dropped master keys belonged to the chairman.',
  clue: 'Vault Keys',
  evidence: 'Brass keys with initials D.H.',
  wrong_answers: ['Pocket Knife', 'Flashlight', 'Gold Coin'],
  correct_answer: 'Vault Keys',
  accepted_guesses: ['vault keys', 'keys', 'key', 'brass keys', 'vault key'],
  hint: 'Something made of brass used to unlock doors.',
  next_event_key: 'ev_2',
  is_key_event: true,
  dynamic_wording: {
    descriptions: ['Heavy brass keys are dropped near the air shaft.'],
    hints: ['Something made of brass used to unlock doors.'],
    clues: ['Vault Keys'],
  },
};

const mockGeneratedStory: GeneratedStory = {
  id: 'story_001',
  title: 'The Midnight Museum Heist',
  genre: 'Noir Mystery',
  setting: 'The Kessler Antiquities Museum',
  description: 'The blue diamond vanished.',
  main_mystery: 'Who took the diamond?',
  difficulty: 'NORMAL',
  culprit: 'Dominic Hart',
  motive: 'Gambling debts',
  method: 'Used master keys',
  truth: 'The chairman stole the diamond.',
  characters: [],
  character_secrets: [],
  timeline: [],
  events: [mockCatalogEvent],
  evidence: [],
  clues: [],
  red_herrings: [],
  theories: { wrongTheories: [], correctTheory: 'The chairman did it.' },
  final_investigation_prompt: 'Who stole the diamond?',
  final_reveal: 'The truth is revealed.',
  endings: [],
  distorter_objective: 'Mislead the team.',
  dynamic_wording: { intros: [], reveals: [], hints: [] },
};

test('EventAdapter: adapt produces InvestigationEvent with all required fields', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery',
    'The Kessler Antiquities Museum'
  );

  // All required InvestigationEvent fields are present
  assert.ok(result.drawerPrompt, 'drawerPrompt should be populated');
  assert.ok(result.narrativeContext, 'narrativeContext should be populated');
  assert.ok(result.evidenceReveal, 'evidenceReveal should be populated');
  assert.ok(result.promptType, 'promptType should be populated');
  assert.ok(result.visualCategory, 'visualCategory should be populated');
  assert.equal(result.canonicalAnswer, 'Vault Keys');
  assert.ok(result.acceptedAnswers.length > 0, 'acceptedAnswers should have entries');
  assert.ok(result.storyConsequence, 'storyConsequence should be populated');
});

test('EventAdapter: adapt preserves existing StoryEvent fields', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery'
  );

  assert.equal(result.eventId, 'museum_01');
  assert.equal(result.act, 1);
  assert.equal(result.drawingObjective, 'Vault Keys');
  assert.equal(result.difficulty, 'EASY');
  assert.deepEqual(result.semanticKeywords, ['keys', 'vault', 'lock', 'brass']);
});

test('EventAdapter: adapt detects key events from catalog', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery'
  );

  assert.equal(result.isKeyEvent, true, 'Should detect is_key_event from catalog');
});

test('EventAdapter: adapt uses catalog what_to_discover for evidenceReveal', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery'
  );

  assert.equal(result.evidenceReveal, 'The dropped master keys belonged to the chairman.');
});

test('EventAdapter: drawerPrompt does not contain the canonical answer', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery'
  );

  assert.ok(
    !result.drawerPrompt.toLowerCase().includes('vault keys'),
    `drawerPrompt should not contain "Vault Keys": ${result.drawerPrompt}`
  );
});

test('EventAdapter: adaptAll processes multiple events', () => {
  const events = [mockStoryEvent, { ...mockStoryEvent, eventId: 'museum_02', drawingObjective: 'Wire Cutters' }];
  const results = InvestigationEventAdapter.adaptAll(
    events,
    mockGeneratedStory,
    'The Midnight Museum Heist',
    'Noir Mystery'
  );

  assert.equal(results.length, 2);
  assert.equal(results[0].canonicalAnswer, 'Vault Keys');
  assert.equal(results[1].canonicalAnswer, 'Wire Cutters');
});

test('EventAdapter: adapt works without catalog story (null)', () => {
  const result = InvestigationEventAdapter.adapt(
    mockStoryEvent,
    null,
    'Unknown Story',
    'Mystery'
  );

  assert.ok(result.drawerPrompt, 'Should still generate a drawer prompt');
  assert.ok(result.narrativeContext, 'Should use fallback narrative context');
  assert.equal(result.canonicalAnswer, 'Vault Keys');
});

test('EventAdapter: inferPromptType classifies OBJECT correctly', () => {
  const result = InvestigationEventAdapter.adapt(
    { ...mockStoryEvent, drawingObjective: 'Broken Pocket Watch' },
    null,
    'Test',
    'Mystery'
  );

  assert.equal(result.promptType, 'OBJECT', 'Watch should be classified as OBJECT');
});
