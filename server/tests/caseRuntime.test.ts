import { test } from 'node:test';
import assert from 'node:assert/strict';
import { CaseRuntime } from '../src/story/CaseRuntime.js';
import { StoryDefinition, InvestigationEvent } from '../src/types/index.js';

const mockStoryDef: StoryDefinition = {
  id: 'story_001',
  title: 'The Midnight Museum Heist',
  genre: 'Noir Mystery',
  description: 'The blue diamond vanished from the locked glass case.',
  difficulty: 'NORMAL',
  version: 1,
  author: 'Test',
  initialVariables: { diamondHidden: false },
  events: [
    {
      eventId: 'ev_1',
      act: 1,
      sequence: 1,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Vault Keys',
      visualElements: ['keys', 'brass'],
      acceptedConcepts: ['vault keys', 'keys'],
      semanticKeywords: ['keys', 'vault'],
      hint: 'Something made of brass.',
      difficulty: 'EASY',
      narrativeDescription: 'Heavy brass keys dropped.',
      consequenceReveal: 'The keys belonged to the chairman.',
      isKeyEvent: true,
    },
    {
      eventId: 'ev_2',
      act: 1,
      sequence: 2,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Wire Cutters',
      visualElements: ['cutters', 'wires'],
      acceptedConcepts: ['wire cutters', 'pliers'],
      semanticKeywords: ['wire', 'cutters'],
      hint: 'A tool used to snip wires.',
      difficulty: 'EASY',
      narrativeDescription: 'Insulated cutters near the breaker.',
      consequenceReveal: 'Cables were cut with heavy cutters.',
    },
    {
      eventId: 'ev_3',
      act: 2,
      sequence: 3,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Blue Diamond',
      visualElements: ['diamond', 'gem'],
      acceptedConcepts: ['diamond', 'blue diamond'],
      semanticKeywords: ['diamond', 'gem'],
      hint: 'A precious stone.',
      difficulty: 'MEDIUM',
      narrativeDescription: 'The diamond is slipped away.',
      consequenceReveal: 'The diamond was hidden inside an umbrella.',
      isKeyEvent: true,
    },
  ],
  distractors: [],
  endings: [
    {
      endingId: 'solved',
      title: 'Case Solved',
      conditionDescription: 'All clues found',
      requiredVariables: {},
      narrativeText: 'The detectives cracked the case.',
    },
  ],
};

test('CaseRuntime: initializes with correct event count', () => {
  const runtime = new CaseRuntime(mockStoryDef);
  const progress = runtime.getCaseProgress();

  assert.equal(progress.totalEvents, 3);
  assert.equal(progress.discoveredEvents, 0);
  assert.equal(progress.percentage, 0);
  assert.equal(progress.caseTitle, 'The Midnight Museum Heist');
});

test('CaseRuntime: getCaseIntroPassage returns intro passage', () => {
  const runtime = new CaseRuntime(mockStoryDef);
  const passage = runtime.getCaseIntroPassage();

  assert.ok(passage.text.length > 0, 'Intro text should not be empty');
  assert.equal(passage.type, 'INTRO');
  assert.ok(passage.id.startsWith('intro_'));
});

test('CaseRuntime: getInvestigationEvent enriches a StoryEvent', () => {
  const runtime = new CaseRuntime(mockStoryDef);
  const investigationEvent = runtime.getInvestigationEvent(mockStoryDef.events[0]);

  assert.ok(investigationEvent.drawerPrompt, 'drawerPrompt populated');
  assert.ok(investigationEvent.narrativeContext, 'narrativeContext populated');
  assert.ok(investigationEvent.evidenceReveal, 'evidenceReveal populated');
  assert.equal(investigationEvent.canonicalAnswer, 'Vault Keys');
});

test('CaseRuntime: recordEvidenceDiscovery updates board and log', () => {
  const runtime = new CaseRuntime(mockStoryDef);
  const ie = runtime.getInvestigationEvent(mockStoryDef.events[0]);

  const { evidenceCard, narrativePassage } = runtime.recordEvidenceDiscovery(
    ie, 'player1', 'Alice', 'player2', 'Bob', 1
  );

  assert.equal(evidenceCard.title, 'Vault Keys');
  assert.equal(evidenceCard.discoveredByName, 'Alice');
  assert.equal(evidenceCard.drawnByName, 'Bob');
  assert.equal(narrativePassage.type, 'EVIDENCE');

  const board = runtime.getEvidenceBoard();
  assert.equal(board.length, 1);

  const progress = runtime.getCaseProgress();
  assert.equal(progress.discoveredEvents, 1);
  assert.equal(progress.percentage, 33);
});

test('CaseRuntime: shouldTriggerDiscussion returns true for key events after min threshold', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  // Solve 3 events (the minimum between discussions)
  for (let i = 0; i < 3; i++) {
    const ie = runtime.getInvestigationEvent(mockStoryDef.events[i]);
    runtime.recordEvidenceDiscovery(ie, 'p1', 'Alice', 'p2', 'Bob', i);
  }

  // The 3rd event (ev_3) is a key event and we've solved 3 events
  const ie3 = runtime.getInvestigationEvent(mockStoryDef.events[2]);
  const shouldDiscuss = runtime.shouldTriggerDiscussion(ie3);
  assert.equal(shouldDiscuss, true, 'Should trigger discussion after key event with enough events solved');
});

test('CaseRuntime: shouldTriggerDiscussion returns false when too few events between discussions', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  // Solve 1 event
  const ie = runtime.getInvestigationEvent(mockStoryDef.events[0]);
  runtime.recordEvidenceDiscovery(ie, 'p1', 'Alice', 'p2', 'Bob', 0);

  // Even though it's a key event, we haven't hit the minimum of 3
  const shouldDiscuss = runtime.shouldTriggerDiscussion(ie);
  assert.equal(shouldDiscuss, false, 'Should NOT trigger discussion when below minimum threshold');
});

test('CaseRuntime: markDiscussionTriggered resets the counter', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  // Solve 3 events
  for (let i = 0; i < 3; i++) {
    const ie = runtime.getInvestigationEvent(mockStoryDef.events[i]);
    runtime.recordEvidenceDiscovery(ie, 'p1', 'Alice', 'p2', 'Bob', i);
  }

  runtime.markDiscussionTriggered();

  // After marking, should NOT trigger again immediately (even for key events)
  const ie3 = runtime.getInvestigationEvent(mockStoryDef.events[2]);
  const shouldDiscuss = runtime.shouldTriggerDiscussion(ie3);
  assert.equal(shouldDiscuss, false, 'Should NOT trigger discussion right after one was held');
});

test('CaseRuntime: assembleTruthReveal returns complete truth data', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  // Solve 2 of 3 events
  for (let i = 0; i < 2; i++) {
    const ie = runtime.getInvestigationEvent(mockStoryDef.events[i]);
    runtime.recordEvidenceDiscovery(ie, 'p1', 'Alice', 'p2', 'Bob', i);
  }

  const truth = runtime.assembleTruthReveal();

  assert.ok(truth.fullTruth, 'fullTruth should exist');
  assert.equal(truth.discoveredEvidence.length, 2);
  assert.equal(truth.missedEvents.length, 1, 'Should have 1 missed event');
  assert.equal(truth.missedEvents[0].title, 'Blue Diamond');
});

test('CaseRuntime: getNarrativeLog accumulates passages', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  // Get intro
  runtime.getCaseIntroPassage();

  // Solve one event
  const ie = runtime.getInvestigationEvent(mockStoryDef.events[0]);
  runtime.recordEvidenceDiscovery(ie, 'p1', 'Alice', 'p2', 'Bob', 0);

  const log = runtime.getNarrativeLog();
  assert.ok(log.length >= 2, 'Should have at least intro + evidence passages');

  const types = log.map((p) => p.type);
  assert.ok(types.includes('INTRO'), 'Should include INTRO passage');
  assert.ok(types.includes('EVIDENCE'), 'Should include EVIDENCE passage');
});

test('CaseRuntime: getFinalInvestigationData includes all sections', () => {
  const runtime = new CaseRuntime(mockStoryDef);

  const data = runtime.getFinalInvestigationData();

  assert.ok(data.prompt, 'Should have investigation prompt');
  assert.ok(Array.isArray(data.suspects), 'Should have suspects array');
  assert.ok(Array.isArray(data.evidenceBoard), 'Should have evidence board');
  assert.ok(Array.isArray(data.narrativeLog), 'Should have narrative log');
  assert.ok(data.caseProgress, 'Should have case progress');
});
