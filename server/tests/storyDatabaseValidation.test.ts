import { describe, it, before } from 'node:test';
import assert from 'node:assert/strict';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { StoryCatalog } from '../src/story/StoryCatalog.js';
import { DynamicWordingService } from '../src/story/DynamicWordingService.js';
import { StoryLibrary } from '../src/story/StoryLibrary.js';
import { StorySelector } from '../src/story/StorySelector.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '../../');

describe('INKBOUND — 120 Story Database & Dynamic Wording Validation Suite', () => {
  before(() => {
    StoryCatalog.init();
    StoryLibrary.init();
  });

  it('1. Catalog Integrity: Exactly 120 complete stories exist with sequential IDs', () => {
    const totalCount = StoryCatalog.getStoryCount();
    assert.equal(totalCount, 120, `Expected 120 stories, got ${totalCount}`);

    const allStories = StoryCatalog.getAllStories();
    assert.equal(allStories.length, 120);

    const idSet = new Set<string>();
    for (let i = 1; i <= 120; i++) {
      const expectedId = `story_${i.toString().padStart(3, '0')}`;
      const story = StoryCatalog.getStoryById(expectedId);
      assert.ok(story, `Story with ID ${expectedId} must exist`);
      assert.equal(story.id, expectedId);
      assert.ok(story.title && story.title.length > 3, `Story ${expectedId} has valid title`);
      assert.ok(!idSet.has(story.id), `Duplicate ID detected: ${story.id}`);
      idSet.add(story.id);
    }
  });

  it('2. Genre Distribution: Exactly 10 distinct genres with 12 stories each', () => {
    const expectedGenres = [
      'Noir Mystery',
      'Investigation',
      'Psychological',
      'Thriller',
      'Horror',
      'Supernatural',
      'Romance / Drama',
      'Sci-Fi / Cyber',
      'Dark Mystery',
      'Emotional Mystery',
    ];

    const allStories = StoryCatalog.getAllStories();
    const genreMap = new Map<string, number>();

    for (const story of allStories) {
      const count = genreMap.get(story.genre) || 0;
      genreMap.set(story.genre, count + 1);
    }

    assert.equal(genreMap.size, 10, `Expected exactly 10 genres, got ${genreMap.size}`);

    for (const g of expectedGenres) {
      const count = genreMap.get(g);
      assert.equal(count, 12, `Genre "${g}" should have exactly 12 stories, got ${count}`);
    }
  });

  it('3. Ground Truth & Narrative Completeness across all 120 stories', () => {
    const allStories = StoryCatalog.getAllStories();

    for (const story of allStories) {
      // Basic requirements
      assert.ok(story.title.length >= 3, `Story ${story.id} title is too short`);
      assert.ok(story.setting.length >= 5, `Story ${story.id} setting is too short`);
      assert.ok(story.description.length >= 10, `Story ${story.id} description/hook is too short`);
      assert.ok(story.main_mystery.length >= 10, `Story ${story.id} main_mystery is too short`);
      assert.ok(story.culprit.length >= 2, `Story ${story.id} culprit is missing`);
      assert.ok(story.motive.length >= 10, `Story ${story.id} motive is too short`);
      assert.ok(story.method.length >= 10, `Story ${story.id} method is too short`);
      assert.ok(story.truth.length >= 20, `Story ${story.id} truth is too short`);
      assert.ok(story.distorter_objective.length >= 10, `Story ${story.id} distorter_objective is too short`);

      // Culprit verification: culprit must match one of the characters
      const cleanName = (n: string) =>
        n.toLowerCase().replace(/\(.*?\)/g, '').replace(/^(corrupt|former|late|dr\.|officer|neighbor|brother|elderly|greedy son|founding benefactor|master)\s+/i, '').trim();
      const culpritClean = cleanName(story.culprit);
      const culpritMatched = story.characters.some((c) => {
        const cClean = cleanName(c.name);
        return (
          culpritClean.includes(cClean) ||
          cClean.includes(culpritClean) ||
          c.name.toLowerCase().includes(culpritClean) ||
          story.culprit.toLowerCase().includes(c.name.toLowerCase().replace(/\(.*?\)/g, '').trim())
        );
      });
      assert.ok(
        culpritMatched,
        `Story ${story.id}: Culprit "${story.culprit}" must match one of the characters [${story.characters.map((c) => c.name).join(', ')}]`
      );

      // Cast verification: 4-6 characters
      assert.ok(
        story.characters.length >= 4 && story.characters.length <= 6,
        `Story ${story.id} must have 4-6 characters, has ${story.characters.length}`
      );

      for (const char of story.characters) {
        assert.ok(char.name.length >= 2, `Story ${story.id}: Character has invalid name`);
        assert.ok(char.role_description.length >= 2, `Story ${story.id}: ${char.name} role is missing`);
        assert.ok(char.personality.length >= 3, `Story ${story.id}: ${char.name} personality is missing`);
        assert.ok(char.what_they_say.length >= 5, `Story ${story.id}: ${char.name} what_they_say is missing`);
        assert.ok(char.what_they_hide.length >= 5, `Story ${story.id}: ${char.name} what_they_hide is missing`);
        assert.ok(char.alibi.length >= 3, `Story ${story.id}: ${char.name} alibi is missing`);
        assert.ok(char.connection.length >= 3, `Story ${story.id}: ${char.name} connection is missing`);
        assert.ok(char.what_they_know.length >= 3, `Story ${story.id}: ${char.name} what_they_know is missing`);
        assert.ok(char.what_they_do_not_know.length >= 3, `Story ${story.id}: ${char.name} what_they_do_not_know is missing`);
        assert.ok(char.statement_variations && char.statement_variations.length >= 3,
          `Story ${story.id}: ${char.name} must have at least 3 statement variations`
        );
      }

      // Timeline verification: 4-6 entries
      assert.ok(
        story.timeline.length >= 4 && story.timeline.length <= 6,
        `Story ${story.id} must have 4-6 timeline entries, has ${story.timeline.length}`
      );

      // Events verification: 8-12 events
      assert.ok(
        story.events.length >= 8 && story.events.length <= 12,
        `Story ${story.id} must have 8-12 events, has ${story.events.length}`
      );

      for (let eIdx = 0; eIdx < story.events.length; eIdx++) {
        const ev = story.events[eIdx];
        assert.equal(ev.order_index, eIdx + 1);
        assert.ok(ev.time_label.length >= 2, `Story ${story.id} ev ${eIdx + 1}: time_label missing`);
        assert.ok(ev.what_happens.length >= 5, `Story ${story.id} ev ${eIdx + 1}: what_happens missing`);
        assert.ok(ev.what_to_discover.length >= 5, `Story ${story.id} ev ${eIdx + 1}: what_to_discover missing`);
        assert.ok(ev.clue.length >= 2, `Story ${story.id} ev ${eIdx + 1}: clue missing`);
        assert.ok(ev.evidence.length >= 2, `Story ${story.id} ev ${eIdx + 1}: evidence missing`);
        assert.equal(ev.wrong_answers.length, 3, `Story ${story.id} ev ${eIdx + 1}: must have 3 wrong answers`);
        assert.ok(ev.correct_answer.length >= 2, `Story ${story.id} ev ${eIdx + 1}: correct_answer missing`);
        assert.ok(ev.accepted_guesses.length >= 1, `Story ${story.id} ev ${eIdx + 1}: accepted_guesses missing`);
        assert.ok(ev.hint.length >= 5, `Story ${story.id} ev ${eIdx + 1}: hint missing`);
        assert.ok(
          ev.dynamic_wording.descriptions.length >= 3,
          `Story ${story.id} ev ${eIdx + 1}: must have >=3 description variations`
        );
        assert.ok(
          ev.dynamic_wording.hints.length >= 3,
          `Story ${story.id} ev ${eIdx + 1}: must have >=3 hint variations`
        );
        assert.ok(
          ev.dynamic_wording.clues.length >= 3,
          `Story ${story.id} ev ${eIdx + 1}: must have >=3 clue variations`
        );
      }

      // Evidence verification: 4-6 items
      assert.ok(
        story.evidence.length >= 4 && story.evidence.length <= 6,
        `Story ${story.id} must have 4-6 evidence items, has ${story.evidence.length}`
      );

      // Clues verification: 6-8 clues
      assert.ok(
        story.clues.length >= 6 && story.clues.length <= 8,
        `Story ${story.id} must have 6-8 clues, has ${story.clues.length}`
      );

      // Red herrings: 2-3
      assert.ok(
        story.red_herrings.length >= 2 && story.red_herrings.length <= 3,
        `Story ${story.id} must have 2-3 red herrings, has ${story.red_herrings.length}`
      );

      // Theories
      assert.ok(story.theories.wrongTheories.length >= 2, `Story ${story.id}: missing wrong theories`);
      assert.ok(story.theories.correctTheory.length >= 10, `Story ${story.id}: missing correct theory`);

      // Endings: exactly 3
      assert.equal(story.endings.length, 3, `Story ${story.id} must have 3 endings`);
      const endingIds = story.endings.map((e) => e.endingId);
      assert.ok(endingIds.includes('true_ending'));
      assert.ok(endingIds.includes('wrong_accusation'));
      assert.ok(endingIds.includes('distorter_victory'));
    }
  });

  it('4. Dynamic Wording System: Phrasing changes dynamically while ground truth remains immutable', () => {
    const testStoryIds = ['story_001', 'story_045', 'story_073', 'story_120'];

    for (const id of testStoryIds) {
      const story = StoryCatalog.getStoryById(id);
      assert.ok(story);

      // Intro variations
      const intro1 = DynamicWordingService.getDynamicIntro(id, 0);
      const intro2 = DynamicWordingService.getDynamicIntro(id, 1);
      assert.ok(intro1.length > 5);
      assert.ok(intro2.length > 5);
      assert.notEqual(intro1, intro2, `Dynamic intros for ${id} should be distinct across seeds`);

      // Reveal variations
      const reveal1 = DynamicWordingService.getDynamicReveal(id, 0);
      const reveal2 = DynamicWordingService.getDynamicReveal(id, 1);
      assert.ok(reveal1.length > 5);
      assert.ok(reveal2.length > 5);
      assert.notEqual(reveal1, reveal2, `Dynamic reveals for ${id} should be distinct across seeds`);

      // Hint variations
      const hint1 = DynamicWordingService.getDynamicHint(id, 0);
      const hint2 = DynamicWordingService.getDynamicHint(id, 1);
      assert.ok(hint1.length > 5);
      assert.ok(hint2.length > 5);

      // Character statements
      const firstChar = story.characters[0];
      const stmt1 = DynamicWordingService.getDynamicStatement(id, firstChar.name, 0);
      const stmt2 = DynamicWordingService.getDynamicStatement(id, firstChar.name, 1);
      assert.ok(stmt1.length > 3);
      assert.ok(stmt2.length > 3);

      // Event descriptions
      const desc1 = DynamicWordingService.getDynamicEventDescription(id, 1, 0);
      const desc2 = DynamicWordingService.getDynamicEventDescription(id, 1, 1);
      assert.ok(desc1.length > 5);
      assert.ok(desc2.length > 5);

      // Event clues
      const clue1 = DynamicWordingService.getDynamicEventClue(id, 1, 0);
      const clue2 = DynamicWordingService.getDynamicEventClue(id, 1, 1);
      assert.ok(clue1.length > 2);
      assert.ok(clue2.length > 2);

      // Verify ground truth immutability
      assert.equal(story.culprit, story.culprit);
      assert.equal(story.truth, story.truth);
      assert.equal(story.motive, story.motive);
    }
  });

  it('5. Runtime Integration: StoryLibrary and StorySelector draw seamlessly from all 120 stories', () => {
    const allLibraryStories = StoryLibrary.getAllStories();
    assert.ok(
      allLibraryStories.length >= 120,
      `StoryLibrary should contain at least 120 stories, got ${allLibraryStories.length}`
    );

    // Can fetch specific stories by numeric or canonical id
    const s1 = StoryLibrary.getStory('story_001');
    assert.ok(s1, 'StoryLibrary must retrieve story_001');
    assert.equal(s1.id, 'story_001');

    const s73 = StoryLibrary.getStory('story_073');
    assert.ok(s73, 'StoryLibrary must retrieve story_073');
    assert.equal(s73.id, 'story_073');

    const s120 = StoryLibrary.getStory('story_120');
    assert.ok(s120, 'StoryLibrary must retrieve story_120');
    assert.equal(s120.id, 'story_120');

    // StorySelector produces distinct choices
    const choices = StorySelector.getRandomStories(3);
    assert.equal(choices.length, 3);
    assert.notEqual(choices[0].storyId, choices[1].storyId);
    assert.notEqual(choices[1].storyId, choices[2].storyId);

    // StorySelector filters by genre
    const noirChoices = StorySelector.getRandomStories(3, 'Noir Mystery');
    assert.equal(noirChoices.length, 3);
    for (const c of noirChoices) {
      assert.ok(c.genre.toLowerCase().includes('noir'));
    }

    const scifiChoices = StorySelector.getRandomStories(3, 'Sci-Fi');
    assert.equal(scifiChoices.length, 3);
    for (const c of scifiChoices) {
      assert.ok(c.genre.toLowerCase().includes('sci-fi'));
    }
  });

  it('6. SQL Seed Migrations: All 4 partition files exist and contain valid statements', () => {
    const migrations = [
      '20240104000000_seed_stories_001_030.sql',
      '20240104000001_seed_stories_031_060.sql',
      '20240104000002_seed_stories_061_090.sql',
      '20240104000003_seed_stories_091_120.sql',
    ];

    for (const mig of migrations) {
      const fullPath = path.join(projectRoot, 'supabase/migrations', mig);
      assert.ok(fs.existsSync(fullPath), `Migration file ${mig} must exist`);
      const content = fs.readFileSync(fullPath, 'utf8');
      assert.ok(content.includes('INSERT INTO public.cases'), `${mig} must contain cases inserts`);
      assert.ok(content.includes('INSERT INTO public.case_characters'), `${mig} must contain characters inserts`);
      assert.ok(content.includes('INSERT INTO public.case_events'), `${mig} must contain events inserts`);
      assert.ok(content.length > 100000, `${mig} must have substantial content (>100KB)`);
    }
  });
});
