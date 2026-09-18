import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { StoryDefinition } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryLoader');

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// In-memory fallback in case filesystem read fails in production/containerized environments
const FALLBACK_MIDNIGHT_MUSEUM: StoryDefinition = {
  id: 'midnight_museum',
  title: 'The Midnight Museum Heist',
  genre: 'Noir Mystery',
  description: 'At 2:15 AM, the siren blared at the Grand Blackwood Museum. The priceless Eye of Osiris diamond disappeared from a sealed bulletproof vault. Four suspects are detained, but who pulled the strings?',
  difficulty: 'NORMAL',
  version: 1,
  author: 'Inkbound Game Studios',
  initialVariables: {
    diamondHidden: false,
    securitySystemCut: false,
    curatorAlibiBroken: false,
    vaultUnlocked: false,
    insideAccompliceIdentified: false,
  },
  events: [
    {
      eventId: 'museum_01',
      act: 1,
      sequence: 1,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Vault Keys',
      visualElements: ['keys', 'keychain', 'brass keys', 'vault door'],
      acceptedConcepts: ['vault keys', 'keys', 'key', 'brass keys', 'security keys', 'master keys'],
      semanticKeywords: ['keys', 'vault', 'lock', 'brass', 'security'],
      hint: 'Category: Crime Scene Clue',
      difficulty: 'EASY',
      narrativeDescription: 'At 01:45 AM, Officer Miller is seen fumbling with heavy brass keys near Vault B.',
      consequenceReveal: 'Officer Miller was seen dropping the master vault keys near the ventilation shaft. Was it an accident, or deliberate?',
      setVariables: { securitySystemCut: true },
      timeLimitSeconds: 80,
      basePoints: 150,
    },
    {
      eventId: 'museum_02',
      act: 1,
      sequence: 2,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Wire Cutters',
      visualElements: ['wire cutters', 'pliers', 'wires', 'spark'],
      acceptedConcepts: ['wire cutters', 'cutters', 'pliers', 'wires', 'wire cutter', 'cutting wires'],
      semanticKeywords: ['wire', 'cutters', 'power', 'pliers', 'tools'],
      hint: 'Category: Burglary Tool',
      difficulty: 'EASY',
      narrativeDescription: 'A hooded figure snips through the backup generator cables in the basement.',
      consequenceReveal: 'The main security cameras were disabled right before the alarm sounded.',
      setVariables: { securitySystemCut: true },
      timeLimitSeconds: 80,
      basePoints: 150,
    },
    {
      eventId: 'museum_03',
      act: 2,
      sequence: 3,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Blue Diamond',
      visualElements: ['diamond', 'gem', 'blue crystal', 'jewel'],
      acceptedConcepts: ['blue diamond', 'diamond', 'gem', 'jewel', 'crystal', 'eye of osiris'],
      semanticKeywords: ['diamond', 'blue', 'gem', 'jewel', 'stone'],
      hint: 'Category: Stolen Artifact',
      difficulty: 'MEDIUM',
      narrativeDescription: 'Dr. Aris Thorne slips the Eye of Osiris into the hollow ferrule of her silk umbrella.',
      consequenceReveal: 'The diamond was never taken out through the main doors—it was slipped inside Dr. Thorne\'s umbrella!',
      requiredVariables: { securitySystemCut: true },
      setVariables: { diamondHidden: true, curatorAlibiBroken: true },
      timeLimitSeconds: 80,
      basePoints: 200,
    },
    {
      eventId: 'museum_04',
      act: 2,
      sequence: 4,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Briefcase',
      visualElements: ['statue', 'briefcase', 'two people', 'handshake'],
      acceptedConcepts: ['briefcase', 'black briefcase', 'suitcase', 'leather case', 'bag'],
      semanticKeywords: ['briefcase', 'bag', 'case', 'money', 'deal'],
      hint: 'Category: Suspect Gear',
      difficulty: 'MEDIUM',
      narrativeDescription: 'Miller exchanges a locked black briefcase with Dr. Thorne behind the Winged Victory statue.',
      consequenceReveal: 'Officer Miller was paid off by Dr. Thorne. The guard and the curator were partners all along!',
      requiredVariables: { diamondHidden: true },
      setVariables: { insideAccompliceIdentified: true, vaultUnlocked: true },
      timeLimitSeconds: 80,
      basePoints: 200,
    },
    {
      eventId: 'museum_05',
      act: 3,
      sequence: 5,
      eventType: 'DRAW_EVENT',
      drawingObjective: 'Getaway Car',
      visualElements: ['red car', 'broken gate', 'headlights', 'tire smoke'],
      acceptedConcepts: ['getaway car', 'sports car', 'red car', 'car', 'convertible', 'vehicle'],
      semanticKeywords: ['car', 'vehicle', 'red', 'wheels', 'speed'],
      hint: 'Category: Escape Route',
      difficulty: 'HARD',
      narrativeDescription: 'A crimson convertible smashes through the wrought iron courtyard gates into the foggy rain.',
      consequenceReveal: 'The getaway driver panicked and fled, but left tire tracks leading toward the city docks.',
      requiredVariables: { insideAccompliceIdentified: true },
      setVariables: {},
      timeLimitSeconds: 80,
      basePoints: 250,
    },
  ],
  distractors: [
    { distractorId: 'dist_01', text: 'Handcuffs', category: 'evidence' },
    { distractorId: 'dist_02', text: 'Broken Glass', category: 'clue' },
    { distractorId: 'dist_03', text: 'Flashlight', category: 'tool' },
    { distractorId: 'dist_04', text: 'Police Badge', category: 'authority' },
    { distractorId: 'dist_05', text: 'Poison Bottle', category: 'evidence' },
    { distractorId: 'dist_06', text: 'Secret Safe', category: 'location' },
  ],
  endings: [
    {
      endingId: 'ending_true_justice',
      title: 'Justice in the Midnight Fog',
      conditionDescription: 'Both the diamond\'s hiding place and the accomplice were exposed.',
      requiredVariables: { diamondHidden: true, insideAccompliceIdentified: true },
      narrativeText: 'Armed with the detective team\'s sketches, Scotland Yard intercepted Dr. Thorne at the harbor. The Eye of Osiris was recovered from her umbrella handle, and Officer Miller was arrested at his post. Complete detective triumph!',
    },
    {
      endingId: 'ending_curator_escaped',
      title: 'The Ghost of Blackwood',
      conditionDescription: 'The theft was confirmed but the accomplice was never connected.',
      requiredVariables: { diamondHidden: true, insideAccompliceIdentified: false },
      narrativeText: 'The diamond was located, but the inside orchestrator melted away into the foggy night without a trace. A partial victory.',
    },
    {
      endingId: 'ending_cold_case',
      title: 'Unsolved Mystery',
      conditionDescription: 'Key clues were missed.',
      requiredVariables: {},
      narrativeText: 'The trail went cold. The Eye of Osiris vanished onto the international black market, leaving the Grand Blackwood Museum shrouded in suspicion.',
    },
  ],
};

export class StoryLoader {
  private static cache: Map<string, StoryDefinition> = new Map();

  private static getStoriesDirectories(): string[] {
    return [
      path.join(__dirname, 'stories'),
      path.join(__dirname, '..', 'src', 'story', 'stories'),
      path.join(process.cwd(), 'server', 'dist', 'story', 'stories'),
      path.join(process.cwd(), 'server', 'src', 'story', 'stories'),
      path.join(process.cwd(), 'dist', 'story', 'stories'),
      path.join(process.cwd(), 'src', 'story', 'stories'),
    ];
  }

  private static findStoryFile(storyId: string): string | null {
    const candidateDirs = this.getStoriesDirectories();
    for (const dir of candidateDirs) {
      const p = path.join(dir, `${storyId}.json`);
      if (fs.existsSync(p)) {
        return p;
      }
    }
    return null;
  }

  /**
   * Loads a story by ID from the stories directory, cache, or bundled fallback
   */
  public static loadStory(storyId: string = 'midnight_museum'): StoryDefinition {
    if (this.cache.has(storyId)) {
      return this.cache.get(storyId)!;
    }

    try {
      const storyPath = this.findStoryFile(storyId);
      if (storyPath) {
        const raw = fs.readFileSync(storyPath, 'utf-8');
        const story = JSON.parse(raw) as StoryDefinition;
        this.cache.set(storyId, story);
        logger.info(`Loaded story ${storyId} from ${storyPath} (${story.events.length} events)`);
        return story;
      }
    } catch (err: unknown) {
      logger.warn(`Failed reading story file for ${storyId}, using fallback:`, { error: err instanceof Error ? err.message : String(err) });
    }

    // Safe in-memory fallback
    logger.info(`Using embedded default story for ${storyId}`);
    this.cache.set(FALLBACK_MIDNIGHT_MUSEUM.id, FALLBACK_MIDNIGHT_MUSEUM);
    return FALLBACK_MIDNIGHT_MUSEUM;
  }

  /**
   * Returns list of all available story summaries
   */
  public static listAvailableStories(): Array<{ id: string; title: string; genre: string; difficulty: string }> {
    const candidateDirs = this.getStoriesDirectories();
    const summaries: Array<{ id: string; title: string; genre: string; difficulty: string }> = [];
    const seenIds = new Set<string>();

    for (const dir of candidateDirs) {
      if (fs.existsSync(dir)) {
        try {
          const files = fs.readdirSync(dir).filter((f) => f.endsWith('.json'));
          for (const file of files) {
            try {
              const raw = fs.readFileSync(path.join(dir, file), 'utf-8');
              const story = JSON.parse(raw) as StoryDefinition;
              if (!seenIds.has(story.id)) {
                seenIds.add(story.id);
                summaries.push({
                  id: story.id,
                  title: story.title,
                  genre: story.genre,
                  difficulty: story.difficulty,
                });
              }
            } catch (err) {
              // ignore invalid json
            }
          }
        } catch {
          // ignore dir read error
        }
      }
    }

    if (summaries.length === 0) {
      summaries.push({
        id: FALLBACK_MIDNIGHT_MUSEUM.id,
        title: FALLBACK_MIDNIGHT_MUSEUM.title,
        genre: FALLBACK_MIDNIGHT_MUSEUM.genre,
        difficulty: FALLBACK_MIDNIGHT_MUSEUM.difficulty,
      });
    }

    return summaries;
  }
}
