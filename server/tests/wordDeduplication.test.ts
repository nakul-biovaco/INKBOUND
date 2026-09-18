import test from 'node:test';
import assert from 'node:assert/strict';
import { StoryLibrary } from '../src/story/StoryLibrary.js';
import { StoryEngine } from '../src/story/StoryEngine.js';
import { InfiniteClueEngine } from '../src/story/InfiniteClueEngine.js';

test('Word Deduplication: Prompts offered to Player 1 never repeat for Player 2', () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_01_the_midnight_museum')!;
  assert.ok(story, 'Story must exist');

  const engine = new StoryEngine(story);
  const solvedEvents = new Set<string>();
  const retiredEvents = new Set<string>();
  const usedWords = new Set<string>();
  const offeredWords = new Set<string>();

  // Turn 1: Player 1 (e.g. Nakul) receives 3 prompt options
  const turn1 = engine.generateThreePromptChoices(1, solvedEvents, retiredEvents, usedWords, offeredWords);
  assert.equal(turn1.options.length, 3, 'Must offer 3 prompt options');

  const p1Options = turn1.options.map((o) => o.previewText.toLowerCase().trim());
  const chosenWord = p1Options[0];

  // Record Player 1 choices
  usedWords.add(chosenWord);
  retiredEvents.add(turn1.targetEvent.eventId);
  for (const opt of p1Options) {
    offeredWords.add(opt);
  }

  // Turn 2: Player 2 (e.g. Richa) receives 3 prompt options
  const turn2 = engine.generateThreePromptChoices(1, solvedEvents, retiredEvents, usedWords, offeredWords);
  assert.equal(turn2.options.length, 3, 'Must offer 3 prompt options for next player');

  const p2Options = turn2.options.map((o) => o.previewText.toLowerCase().trim());

  // Verify Player 2 NEVER received the chosen word or previous options
  for (const p1Word of p1Options) {
    assert.ok(
      !p2Options.includes(p1Word),
      `Player 2 should NOT receive word "${p1Word}" which was in Player 1 options`
    );
  }
  assert.notEqual(
    turn1.targetEvent.eventId,
    turn2.targetEvent.eventId,
    'Target event must be completely different'
  );
});

test('Word Deduplication: Unsolved/timeout clue is permanently retired and never offered to next player', () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_02_the_last_train')!;
  const engine = new StoryEngine(story);

  const solvedEvents = new Set<string>();
  const retiredEvents = new Set<string>();
  const usedWords = new Set<string>();
  const offeredWords = new Set<string>();

  // Turn 1: Player 1 draws, but nobody guesses it (round times out!)
  const turn1 = engine.generateThreePromptChoices(1, solvedEvents, retiredEvents, usedWords, offeredWords);
  const p1Word = turn1.targetEvent.drawingObjective.toLowerCase().trim();

  // Mark as timed out / unsolved, but retired
  retiredEvents.add(turn1.targetEvent.eventId);
  usedWords.add(p1Word);
  for (const opt of turn1.options) {
    offeredWords.add(opt.previewText.toLowerCase().trim());
  }

  // Turn 2: Player 2 must NOT receive the unsolved event or word
  const turn2 = engine.generateThreePromptChoices(1, solvedEvents, retiredEvents, usedWords, offeredWords);
  const p2Options = turn2.options.map((o) => o.previewText.toLowerCase().trim());

  assert.ok(
    !p2Options.includes(p1Word),
    `Unsolved word "${p1Word}" should NOT be offered to Player 2`
  );
  assert.notEqual(
    turn1.targetEvent.eventId,
    turn2.targetEvent.eventId,
    'Target event for Player 2 must not be the timed-out event from Player 1'
  );
});

test('Infinite Clue Engine: Generates 30 consecutive unique mystery prompts without any duplicates', () => {
  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getStory('story_03_the_vanishing_painting')!;
  const engine = new StoryEngine(story);

  const solvedEvents = new Set<string>();
  const retiredEvents = new Set<string>();
  const usedWords = new Set<string>();
  const offeredWords = new Set<string>();

  const allDrawnWords: string[] = [];

  for (let turn = 0; turn < 30; turn++) {
    const promptChoices = engine.generateThreePromptChoices(
      1 + Math.floor(turn / 10),
      solvedEvents,
      retiredEvents,
      usedWords,
      offeredWords
    );

    assert.ok(promptChoices, `Turn ${turn + 1} must return valid prompt choices`);
    assert.equal(promptChoices.options.length, 3, `Turn ${turn + 1} must have 3 options`);

    const chosen = promptChoices.options[0].previewText.toLowerCase().trim();
    assert.ok(
      !allDrawnWords.includes(chosen),
      `Word "${chosen}" in turn ${turn + 1} was already drawn previously!`
    );

    allDrawnWords.push(chosen);
    usedWords.add(chosen);
    retiredEvents.add(promptChoices.targetEvent.eventId);
    for (const opt of promptChoices.options) {
      offeredWords.add(opt.previewText.toLowerCase().trim());
    }
  }

  assert.equal(allDrawnWords.length, 30, 'Successfully generated 30 unique consecutive mystery clues');
});
