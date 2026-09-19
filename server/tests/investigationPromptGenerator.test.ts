import { test } from 'node:test';
import assert from 'node:assert/strict';
import { InvestigationPromptGenerator } from '../src/story/InvestigationPromptGenerator.js';

test('PromptGenerator: generates a non-empty prompt', () => {
  const result = InvestigationPromptGenerator.generate({
    canonicalAnswer: 'Vault Keys',
    promptType: 'OBJECT',
    narrativeContext: 'Heavy brass keys are dropped near the air shaft.',
    storyTitle: 'The Midnight Museum Heist',
    storyGenre: 'Noir Mystery',
    storySetting: 'The Kessler Antiquities Museum',
    hint: 'Something made of brass used to unlock doors.',
  });

  assert.ok(result.length > 10, 'Prompt should be substantial');
});

test('PromptGenerator: never contains the canonical answer', () => {
  const answers = [
    'Vault Keys',
    'Wire Cutters',
    'Blue Diamond',
    'Red Sports Car',
    'Torn Love Letter',
    'Forged Passport',
    'Bloody Knife',
    'Security Camera',
  ];

  for (const answer of answers) {
    const result = InvestigationPromptGenerator.generate({
      canonicalAnswer: answer,
      promptType: 'OBJECT',
      narrativeContext: `The investigation reveals a ${answer.toLowerCase()} at the scene.`,
      storyTitle: 'Test Case',
      storyGenre: 'Mystery',
      storySetting: 'The Lab',
      hint: 'A crucial piece of evidence.',
    });

    assert.ok(
      !result.toLowerCase().includes(answer.toLowerCase()),
      `Prompt leaked the answer "${answer}": "${result}"`
    );
  }
});

test('PromptGenerator: anti-leak validation catches exact matches', () => {
  const safe = InvestigationPromptGenerator.validateAntiLeak(
    'Draw the object you discovered.',
    'Vault Keys'
  );
  assert.equal(safe, true, 'Clean prompt should pass validation');

  const leaked = InvestigationPromptGenerator.validateAntiLeak(
    'Draw the Vault Keys you found.',
    'Vault Keys'
  );
  assert.equal(leaked, false, 'Prompt containing answer should fail validation');
});

test('PromptGenerator: anti-leak validation catches word-level leaks', () => {
  const leaked = InvestigationPromptGenerator.validateAntiLeak(
    'The vault had keys left behind in it.',
    'Vault Keys'
  );
  assert.equal(leaked, false, 'All answer words present should fail');

  const partialOk = InvestigationPromptGenerator.validateAntiLeak(
    'The vault was sealed shut.',
    'Vault Keys'
  );
  assert.equal(partialOk, true, 'Only one answer word should pass');
});

test('PromptGenerator: handles all prompt types without crashing', () => {
  const types = ['OBJECT', 'LOCATION', 'PERSON', 'ACTION', 'MEMORY', 'EVIDENCE', 'EVENT', 'SCENE', 'SUSPECT'] as const;

  for (const promptType of types) {
    const result = InvestigationPromptGenerator.generate({
      canonicalAnswer: 'Test Item',
      promptType,
      narrativeContext: 'Something happened at the scene.',
      storyTitle: 'Test Case',
      storyGenre: 'Mystery',
      storySetting: 'A dark room',
      hint: 'A clue hint.',
    });

    assert.ok(result.length > 5, `${promptType} should generate a prompt`);
  }
});

test('PromptGenerator: sanitization removes answer words', () => {
  const result = InvestigationPromptGenerator.generate({
    canonicalAnswer: 'Diamond Ring',
    promptType: 'OBJECT',
    narrativeContext: 'A glittering diamond ring was found under the table.',
    storyTitle: 'Test Case',
    storyGenre: 'Mystery',
    storySetting: 'The Mansion',
    hint: 'Jewelry evidence.',
    eventDescription: 'A glittering diamond ring was found under the table.',
  });

  // The prompt should NOT contain both "diamond" and "ring"
  const hasAll = result.toLowerCase().includes('diamond') && result.toLowerCase().includes('ring');
  assert.ok(!hasAll, `Sanitized prompt should not contain all answer words: "${result}"`);
});
