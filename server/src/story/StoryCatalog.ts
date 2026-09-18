import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { StoryDefinition, StoryEvent, StoryEnding } from '../types/index.js';
import { GeneratedStory } from '../types/storyCatalog.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryCatalog');

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class StoryCatalog {
  private static storiesMap: Map<string, GeneratedStory> = new Map();
  private static isInitialized = false;

  private static getCatalogFilePath(): string | null {
    const candidates = [
      path.resolve(__dirname, 'data', 'stories_catalog.json'),
      path.resolve(process.cwd(), 'server', 'src', 'story', 'data', 'stories_catalog.json'),
      path.resolve(process.cwd(), 'src', 'story', 'data', 'stories_catalog.json'),
      path.resolve(process.cwd(), 'data', 'stories_catalog.json'),
      path.resolve(__dirname, '..', '..', 'src', 'story', 'data', 'stories_catalog.json'),
      path.resolve(__dirname, '..', '..', 'dist', 'src', 'story', 'data', 'stories_catalog.json'),
    ];

    return candidates.find((p) => fs.existsSync(p)) || null;
  }

  public static init(): void {
    this.storiesMap.clear();

    const catalogPath = this.getCatalogFilePath();
    if (!catalogPath) {
      logger.warn('stories_catalog.json not found in candidate paths');
      return;
    }

    try {
      const raw = fs.readFileSync(catalogPath, 'utf8');
      const stories: GeneratedStory[] = JSON.parse(raw);

      for (const story of stories) {
        this.storiesMap.set(story.id, story);
      }

      this.isInitialized = true;
      logger.info(`Loaded ${this.storiesMap.size} stories into StoryCatalog from ${catalogPath}`);
    } catch (err) {
      logger.error('Failed to parse stories_catalog.json', err);
    }
  }

  public static ensureInitialized(): void {
    if (!this.isInitialized || this.storiesMap.size === 0) {
      this.init();
    }
  }

  public static getStoryCount(): number {
    this.ensureInitialized();
    return this.storiesMap.size;
  }

  public static getAllStories(): GeneratedStory[] {
    this.ensureInitialized();
    return Array.from(this.storiesMap.values());
  }

  public static getStoryById(id: string): GeneratedStory | null {
    this.ensureInitialized();
    if (this.storiesMap.has(id)) {
      return this.storiesMap.get(id)!;
    }

    // Try normalization (e.g. 'story_1' -> 'story_001')
    const match = id.match(/story_?(\d+)/i);
    if (match) {
      const normalizedId = `story_${match[1].padStart(3, '0')}`;
      if (this.storiesMap.has(normalizedId)) {
        return this.storiesMap.get(normalizedId)!;
      }
    }

    // Fuzzy matching by title
    const lower = id.toLowerCase();
    for (const [key, story] of this.storiesMap.entries()) {
      if (
        key.toLowerCase().includes(lower) ||
        story.title.toLowerCase().includes(lower) ||
        lower.includes(story.title.toLowerCase())
      ) {
        return story;
      }
    }

    return null;
  }

  public static getStoriesByGenre(genre: string): GeneratedStory[] {
    this.ensureInitialized();
    const lower = genre.toLowerCase();
    return this.getAllStories().filter(
      (s) => s.genre.toLowerCase().includes(lower) || lower.includes(s.genre.toLowerCase())
    );
  }

  /**
   * Converts a GeneratedStory (from the 120-story catalog) into a StoryDefinition
   * compatible with the GameEngine, StoryLibrary, and gameplay state machine.
   */
  public static toStoryDefinition(story: GeneratedStory): StoryDefinition {
    // Generate events
    const events: StoryEvent[] = story.events.map((ev, idx) => {
      const act = idx < 3 ? 1 : idx < 6 ? 2 : 3;
      const difficulty: 'EASY' | 'MEDIUM' | 'HARD' =
        ev.order_index <= 3 ? 'EASY' : ev.order_index <= 6 ? 'MEDIUM' : 'HARD';

      return {
        eventId: ev.id,
        act,
        sequence: ev.order_index,
        eventType: 'DRAW_EVENT',
        drawingObjective: ev.clue,
        visualElements: [ev.clue, ev.evidence],
        acceptedConcepts: ev.accepted_guesses,
        semanticKeywords: ev.accepted_guesses,
        hint: ev.hint,
        difficulty,
        narrativeDescription: ev.what_happens,
        consequenceReveal: ev.what_to_discover,
        basePoints: 100,
        timeLimitSeconds: 60,
        choices: [
          { text: ev.clue, isCanon: true },
          ...ev.wrong_answers.map((w) => ({ text: w, isCanon: false })),
        ],
        setVariables: {
          [`clue_${ev.order_index}_solved`]: true,
          discoveredClues: idx + 1,
        },
      };
    });

    // Extract all distractors from wrong answers across all events
    const distractorSet = new Set<string>();
    const distractors: Array<{ distractorId: string; text: string; category: string }> = [];

    for (const ev of story.events) {
      for (const wrong of ev.wrong_answers) {
        const clean = wrong.trim();
        if (clean && !distractorSet.has(clean.toLowerCase())) {
          distractorSet.add(clean.toLowerCase());
          distractors.push({
            distractorId: `dist_${distractors.length + 1}`,
            text: clean,
            category: story.genre,
          });
        }
      }
    }

    // Convert endings
    const endings: StoryEnding[] = story.endings.map((end) => ({
      endingId: end.endingId,
      title: end.title,
      conditionDescription: end.title,
      requiredVariables: {},
      narrativeText: end.narrativeText,
    }));

    return {
      id: story.id,
      title: story.title,
      genre: story.genre,
      description: story.description,
      difficulty: story.difficulty,
      version: 1,
      author: 'Inkbound Story Engine',
      initialVariables: {
        discoveredClues: 0,
        investigationComplete: false,
      },
      events,
      distractors,
      endings,
    };
  }
}
