import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { StoryDefinition } from '../types/index.js';
import { MarkdownStoryParser } from './MarkdownStoryParser.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryLibrary');

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class StoryLibrary {
  private static storiesMap: Map<string, StoryDefinition> = new Map();
  private static isInitialized = false;

  private static readonly STORY_DIR = path.resolve('/Users/nakulamundhada23/Desktop/INKBOUND/STORY');

  /**
   * Scans the STORY directory, parses all .md files, and loads them into memory.
   */
  public static init(): void {
    this.storiesMap.clear();

    if (!fs.existsSync(this.STORY_DIR)) {
      logger.warn(`Story directory not found at ${this.STORY_DIR}`);
      return;
    }

    const files = fs.readdirSync(this.STORY_DIR).filter((f) => f.endsWith('.md') && !f.startsWith('00_'));
    logger.info(`Found ${files.length} story markdown files in ${this.STORY_DIR}`);

    for (const file of files) {
      try {
        const filePath = path.join(this.STORY_DIR, file);
        const content = fs.readFileSync(filePath, 'utf-8');
        const parsedStories = MarkdownStoryParser.parseFile(content, file);

        for (const story of parsedStories) {
          this.storiesMap.set(story.id, story);
          logger.info(`Loaded story [${story.id}]: "${story.title}" (${story.events.length} events)`);
        }
      } catch (err) {
        logger.error(`Failed to parse story file ${file}`, err);
      }
    }

    this.isInitialized = true;
    logger.info(`StoryLibrary ready with ${this.storiesMap.size} playable stories loaded!`);
  }

  public static ensureInitialized(): void {
    if (!this.isInitialized || this.storiesMap.size === 0) {
      this.init();
    }
  }

  public static getAllStories(): StoryDefinition[] {
    this.ensureInitialized();
    return Array.from(this.storiesMap.values());
  }

  public static getStory(storyId: string): StoryDefinition | null {
    this.ensureInitialized();

    // Direct match
    if (this.storiesMap.has(storyId)) {
      return this.storiesMap.get(storyId)!;
    }

    // Match by prefix or clean id (e.g. 'midnight_museum' or 'room_404')
    const lowerId = storyId.toLowerCase();
    for (const [id, story] of this.storiesMap.entries()) {
      if (id.toLowerCase().includes(lowerId) || lowerId.includes(id.toLowerCase())) {
        return story;
      }
    }

    // Fallback to first available story
    const first = this.storiesMap.values().next().value;
    return first || null;
  }

  public static getSummaries(): Array<{ id: string; title: string; genre: string; difficulty: string; description: string }> {
    this.ensureInitialized();
    return Array.from(this.storiesMap.values()).map((s) => ({
      id: s.id,
      title: s.title,
      genre: s.genre,
      difficulty: s.difficulty,
      description: s.description,
    }));
  }
}
