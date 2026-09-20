import { Player, StoryDefinition } from '../types/index.js';
import { StoryLibrary } from './StoryLibrary.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StorySelector');

export interface StoryChoiceOption {
  storyId: string;
  title: string;
  genre: string;
  difficulty: string;
  description: string;
}

export class StorySelector {
  /**
   * Genre alias map: normalizes user-facing genre IDs to the canonical genre
   * strings used in stories_catalog.json.
   */
  private static readonly GENRE_ALIASES: Record<string, string> = {
    noir: 'Noir Mystery',
    investigation: 'Investigation',
    psychological: 'Psychological',
    thriller: 'Thriller',
    horror: 'Horror',
    supernatural: 'Supernatural',
    romance: 'Romance / Drama',
    'romance / drama': 'Romance / Drama',
    scifi: 'Sci-Fi / Cyber',
    'sci-fi': 'Sci-Fi / Cyber',
    'sci-fi / cyber': 'Sci-Fi / Cyber',
    cyber: 'Sci-Fi / Cyber',
    cyberpunk: 'Sci-Fi / Cyber',
    dark: 'Dark Mystery',
    'dark mystery': 'Dark Mystery',
    emotional: 'Emotional Mystery',
    'emotional mystery': 'Emotional Mystery',
    heist: 'Noir Mystery',
    locked_room: 'Investigation',
  };

  /**
   * Randomly selects N distinct stories from the 120 catalog stories,
   * optionally filtered by genre.
   */
  public static getRandomStories(count: number = 3, genre?: string): StoryChoiceOption[] {
    // Draw exclusively from the 120 catalog stories (story_001 - story_120)
    const catalogStories = StoryLibrary.getCatalogStories();
    const allStories = catalogStories.length > 0 ? catalogStories : StoryLibrary.getAllStories();

    if (allStories.length === 0) {
      logger.error('No stories available in StoryLibrary');
      return [];
    }

    let candidateStories = allStories;
    if (genre && genre !== 'all') {
      const lowerGenre = genre.toLowerCase().trim();
      const canonicalGenre = this.GENRE_ALIASES[lowerGenre];

      const filtered = allStories.filter((s) => {
        if (canonicalGenre) {
          return s.genre.toLowerCase() === canonicalGenre.toLowerCase();
        }
        // Fallback: partial match in both directions
        const storyGenre = s.genre.toLowerCase();
        return storyGenre.includes(lowerGenre) || lowerGenre.includes(storyGenre);
      });

      if (filtered.length >= 1) {
        candidateStories = filtered;
        logger.info(`Genre filter '${genre}' matched ${filtered.length} catalog stories`);
      } else {
        logger.warn(`Genre filter '${genre}' matched 0 stories, using all ${allStories.length} catalog stories`);
      }
    }

    // Fisher-Yates shuffle for unbiased randomization
    const shuffled = [...candidateStories];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    const selected = shuffled.slice(0, Math.min(count, shuffled.length));

    // If fewer than count, backfill from other stories to guarantee distinct choices
    if (selected.length < count && allStories.length > selected.length) {
      const selectedIds = new Set(selected.map((s) => s.id));
      const remaining = allStories
        .filter((s) => !selectedIds.has(s.id))
        .sort(() => Math.random() - 0.5);
      for (const rem of remaining) {
        if (selected.length >= count) break;
        selected.push(rem);
      }
    }

    logger.info(`Selected ${selected.length} random stories: [${selected.map((s) => s.id).join(', ')}]`);

    return selected.map((s) => ({
      storyId: s.id,
      title: s.title,
      genre: s.genre,
      difficulty: s.difficulty,
      description: s.description,
    }));
  }


  /**
   * Randomly selects one player from the room to be the story chooser
   */
  public static selectRandomStoryChooser(players: Player[]): Player {
    const connectedPlayers = players.filter((p) => p.isConnected);
    const pool = connectedPlayers.length > 0 ? connectedPlayers : players;
    const randomIndex = Math.floor(Math.random() * pool.length);
    const chosen = pool[randomIndex];
    logger.info(`Random story chooser selected: ${chosen.displayName} (${chosen.playerId})`);
    return chosen;
  }

  /**
   * Validates whether a story choice made by a player is valid
   */
  public static validateStorySelection(
    storyId: string,
    offeredOptions: StoryChoiceOption[]
  ): StoryDefinition | null {
    const isOffered = offeredOptions.some((o) => o.storyId === storyId);
    if (!isOffered) {
      logger.warn(`Story choice ${storyId} was not in offered options`, { offeredOptions });
      return null;
    }

    return StoryLibrary.getStory(storyId);
  }
}
