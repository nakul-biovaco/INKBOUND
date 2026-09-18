import { StoryCatalog } from './StoryCatalog.js';
import { GeneratedStory } from '../../../scripts/story-blueprints/types.js';

export class DynamicWordingService {
  /**
   * Deterministically or pseudo-randomly pick an item from an array using a numerical seed.
   */
  private static pickBySeed<T>(items: T[], seed?: number): T {
    if (!items || items.length === 0) {
      throw new Error('Cannot pick from empty array');
    }
    if (items.length === 1) {
      return items[0];
    }
    if (seed === undefined || seed === null) {
      const randomIdx = Math.floor(Math.random() * items.length);
      return items[randomIdx];
    }
    const idx = Math.abs(Math.floor(seed)) % items.length;
    return items[idx];
  }

  /**
   * Returns a dynamic intro variation for the case while ground truth remains identical.
   */
  public static getDynamicIntro(storyId: string, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `Welcome to the investigation. Uncover clues and discover the truth.`;
    }
    const intros = story.dynamic_wording?.intros || [story.description];
    return this.pickBySeed(intros, seed);
  }

  /**
   * Returns a dynamic final reveal variation for the case.
   */
  public static getDynamicReveal(storyId: string, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `The mystery is resolved and the truth has been brought to light.`;
    }
    const reveals = story.dynamic_wording?.reveals || [story.final_reveal];
    return this.pickBySeed(reveals, seed);
  }

  /**
   * Returns a dynamic global investigation hint.
   */
  public static getDynamicHint(storyId: string, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `Look closely at the timeline and examine all suspects.`;
    }
    const hints = story.dynamic_wording?.hints || [];
    if (hints.length === 0) {
      return `Pay attention to inconsistencies in character statements.`;
    }
    return this.pickBySeed(hints, seed);
  }

  /**
   * Returns a dynamic statement variation for a specific character in the story.
   */
  public static getDynamicStatement(storyId: string, characterName: string, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `I have told you everything I know.`;
    }
    const char = story.characters.find(
      (c) => c.name.toLowerCase().trim() === characterName.toLowerCase().trim()
    );
    if (!char) {
      return `I don't know anything about that.`;
    }
    const statements = char.statement_variations || [char.what_they_say];
    return this.pickBySeed(statements, seed);
  }

  /**
   * Returns a dynamic event description variation for a specific event index (1-based or 0-based).
   */
  public static getDynamicEventDescription(storyId: string, eventIndex: number, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `An important event occurred at this moment.`;
    }
    const idx = eventIndex >= 1 ? eventIndex - 1 : eventIndex;
    const ev = story.events[idx] || story.events[0];
    if (!ev) {
      return `Examine this moment closely.`;
    }
    const descriptions = ev.dynamic_wording?.descriptions || [ev.what_happens];
    return this.pickBySeed(descriptions, seed);
  }

  /**
   * Returns a dynamic clue description/variation for an event.
   */
  public static getDynamicEventClue(storyId: string, eventIndex: number, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `Key evidence item.`;
    }
    const idx = eventIndex >= 1 ? eventIndex - 1 : eventIndex;
    const ev = story.events[idx] || story.events[0];
    if (!ev) {
      return `Clue item.`;
    }
    const clues = ev.dynamic_wording?.clues || [ev.clue];
    return this.pickBySeed(clues, seed);
  }

  /**
   * Returns a dynamic hint for a specific event.
   */
  public static getDynamicEventHint(storyId: string, eventIndex: number, seed?: number): string {
    const story = StoryCatalog.getStoryById(storyId);
    if (!story) {
      return `Think carefully about the details of this clue.`;
    }
    const idx = eventIndex >= 1 ? eventIndex - 1 : eventIndex;
    const ev = story.events[idx] || story.events[0];
    if (!ev) {
      return `Review the timeline.`;
    }
    const hints = ev.dynamic_wording?.hints || [ev.hint];
    return this.pickBySeed(hints, seed);
  }
}
