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
   * Randomly selects N distinct stories from the StoryLibrary, optionally filtered by genre.
   */
  public static getRandomStories(count: number = 3, genre?: string): StoryChoiceOption[] {
    const allStories = StoryLibrary.getAllStories();
    if (allStories.length === 0) {
      logger.error('No stories available in StoryLibrary');
      return [];
    }

    let candidateStories = allStories;
    if (genre && genre !== 'all') {
      const lowerGenre = genre.toLowerCase();
      const filtered = allStories.filter(
        (s) =>
          s.genre.toLowerCase().includes(lowerGenre) ||
          lowerGenre.includes(s.genre.toLowerCase())
      );
      if (filtered.length >= 1) {
        candidateStories = filtered;
      }
    }

    const shuffled = [...candidateStories].sort(() => Math.random() - 0.5);
    const selected = shuffled.slice(0, Math.min(count, shuffled.length));

    // If fewer than count, backfill from other stories in allStories to guarantee 3 distinct choices
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
