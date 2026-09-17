import { StoryLibrary } from '../src/story/StoryLibrary.js';

StoryLibrary.ensureInitialized();
const stories = StoryLibrary.getAllStories();

console.log('====================================================');
console.log(`TOTAL STORIES LOADED: ${stories.length} / 17`);
console.log('====================================================');

stories.forEach((s, idx) => {
  console.log(`\nStory #${idx + 1}: [${s.id}]`);
  console.log(`  Title: "${s.title}"`);
  console.log(`  Genre: ${s.genre}`);
  console.log(`  Difficulty: ${s.difficulty}`);
  console.log(`  Description: ${s.description.substring(0, 80)}...`);
  console.log(`  Events count: ${s.events.length}`);
  console.log(`  Endings count: ${s.endings.length}`);
  
  if (s.events.length < 15) {
    console.warn(`  ⚠️ WARNING: Event count (${s.events.length}) is lower than 15!`);
  }

  // Print first event and a twist event
  const e1 = s.events[0];
  console.log(`  E1: "${e1?.drawingObjective}"`);
  console.log(`      Choices (${e1?.choices?.length || 0}):`, e1?.choices?.map(c => `[${c.isCanon ? 'CANON' : 'ALT'}] ${c.text}`));
  console.log(`      Hint: "${e1?.hint}"`);
  console.log(`      Accepted: ${e1?.acceptedConcepts.slice(0, 3).join(', ')}`);

  const twist = s.events.find(e => e.sequence === 15) || s.events[s.events.length - 1];
  console.log(`  E${twist?.sequence}: "${twist?.drawingObjective}"`);
  console.log(`      Choices (${twist?.choices?.length || 0}):`, twist?.choices?.map(c => `[${c.isCanon ? 'CANON' : 'ALT'}] ${c.text}`));
});

console.log('\n====================================================');
console.log('TESTING PROMPT GENERATION (3 CHOICES) ON HORROR & ROMANCE:');
console.log('====================================================');
const targetIds = [
  'story_08_the_last_passenger',
  'story_09_the_photograph',
  'story_13_the_letter_never_sent',
  'story_14_11_11',
  'story_15_two_tickets'
];

import { StoryEngine } from '../src/story/StoryEngine.js';

targetIds.forEach(id => {
  const story = StoryLibrary.getStory(id)!;
  const engine = new StoryEngine(story);
  const prompt = engine.generateThreePromptChoices(1, new Set());
  console.log(`\nStory [${story.title}]:`);
  console.log(`  Target Event: "${prompt?.targetEvent.drawingObjective}"`);
  console.log(`  3 Options Given to Drawer:`);
  prompt?.options.forEach((opt, idx) => {
    console.log(`    ${idx + 1}. [${opt.isDistractor ? 'DISTRACTOR' : 'TARGET'}] "${opt.previewText}"`);
  });
});

