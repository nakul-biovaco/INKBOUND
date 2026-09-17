import { StoryLibrary } from '../src/story/StoryLibrary.js';

StoryLibrary.init();
const stories = StoryLibrary.getAllStories();
console.log(`\n==============================================`);
console.log(`STORY LIBRARY LOAD TEST: ${stories.length} STORIES LOADED`);
console.log(`==============================================`);

stories.forEach((s, idx) => {
  console.log(`${(idx + 1).toString().padStart(2, ' ')}. [${s.id}] ${s.title.padEnd(28)} | ${s.genre.padEnd(24)} | Events: ${s.events.length}`);
});
