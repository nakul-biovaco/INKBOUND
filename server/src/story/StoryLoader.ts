import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { StoryDefinition } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryLoader');

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class StoryLoader {
  private static cache: Map<string, StoryDefinition> = new Map();

  /**
   * Loads a story by ID from the stories directory or cache
   */
  public static loadStory(storyId: string = 'midnight_museum'): StoryDefinition {
    if (this.cache.has(storyId)) {
      return this.cache.get(storyId)!;
    }

    const storyPath = path.join(__dirname, 'stories', `${storyId}.json`);
    if (!fs.existsSync(storyPath)) {
      logger.warn(`Story file not found at ${storyPath}, attempting midnight_museum default`);
      const defaultPath = path.join(__dirname, 'stories', 'midnight_museum.json');
      const raw = fs.readFileSync(defaultPath, 'utf-8');
      const story = JSON.parse(raw) as StoryDefinition;
      this.cache.set(story.id, story);
      return story;
    }

    const raw = fs.readFileSync(storyPath, 'utf-8');
    const story = JSON.parse(raw) as StoryDefinition;
    this.cache.set(storyId, story);
    logger.info(`Loaded story ${storyId} (${story.events.length} events)`);
    return story;
  }

  /**
   * Returns list of all available story summaries
   */
  public static listAvailableStories(): Array<{ id: string; title: string; genre: string; difficulty: string }> {
    const storiesDir = path.join(__dirname, 'stories');
    if (!fs.existsSync(storiesDir)) return [];

    const files = fs.readdirSync(storiesDir).filter((f) => f.endsWith('.json'));
    const summaries = [];

    for (const file of files) {
      try {
        const raw = fs.readFileSync(path.join(storiesDir, file), 'utf-8');
        const story = JSON.parse(raw) as StoryDefinition;
        summaries.push({
          id: story.id,
          title: story.title,
          genre: story.genre,
          difficulty: story.difficulty,
        });
      } catch (err) {
        logger.error(`Failed to parse story file ${file}`, err);
      }
    }

    return summaries;
  }
}
