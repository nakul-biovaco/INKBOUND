import { StoryDefinition } from '../types/index.js';
import { StoryLoader } from './StoryLoader.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('StoryValidator');

export interface ValidationReport {
  isValid: boolean;
  errors: string[];
  warnings: string[];
  stats: {
    eventCount: number;
    distractorCount: number;
    endingCount: number;
    variableCount: number;
  };
}

export class StoryValidator {
  public static validate(story: StoryDefinition): ValidationReport {
    const errors: string[] = [];
    const warnings: string[] = [];

    // 1. Basic Metadata
    if (!story.id || typeof story.id !== 'string') errors.push('Story ID is missing or invalid');
    if (!story.title) errors.push('Story title is missing');
    if (!story.events || !Array.isArray(story.events) || story.events.length === 0) {
      errors.push('Story must contain at least one event');
    }

    // 2. Variable Consistency Tracking
    const declaredVariables = new Set<string>(Object.keys(story.initialVariables || {}));

    // 3. Events Validation
    const eventIds = new Set<string>();
    for (const evt of story.events || []) {
      if (!evt.eventId) {
        errors.push('An event is missing eventId');
        continue;
      }
      if (eventIds.has(evt.eventId)) {
        errors.push(`Duplicate eventId found: ${evt.eventId}`);
      }
      eventIds.add(evt.eventId);

      if (!evt.drawingObjective || evt.drawingObjective.trim().length === 0) {
        errors.push(`Event ${evt.eventId} is missing drawingObjective`);
      }

      if (!evt.acceptedConcepts || evt.acceptedConcepts.length === 0) {
        errors.push(`Event ${evt.eventId} has no acceptedConcepts`);
      }

      if (!evt.semanticKeywords || evt.semanticKeywords.length === 0) {
        warnings.push(`Event ${evt.eventId} has no semanticKeywords`);
      }

      if (evt.setVariables) {
        for (const varName of Object.keys(evt.setVariables)) {
          declaredVariables.add(varName);
        }
      }

      if (evt.requiredVariables) {
        for (const varName of Object.keys(evt.requiredVariables)) {
          if (!declaredVariables.has(varName)) {
            warnings.push(
              `Event ${evt.eventId} requires variable '${varName}' before any known event sets it`
            );
          }
        }
      }
    }

    // 4. Distractors Validation
    if (!story.distractors || story.distractors.length < 2) {
      errors.push('Story must have at least 2 distractors for 3-prompt generation');
    }

    // 5. Endings Validation
    if (!story.endings || story.endings.length === 0) {
      errors.push('Story must have at least one ending definition');
    }

    return {
      isValid: errors.length === 0,
      errors,
      warnings,
      stats: {
        eventCount: story.events?.length || 0,
        distractorCount: story.distractors?.length || 0,
        endingCount: story.endings?.length || 0,
        variableCount: declaredVariables.size,
      },
    };
  }

  /**
   * CLI entry point to validate all stories
   */
  public static runAll(): void {
    logger.info('Validating story catalog...');
    const story = StoryLoader.loadStory('midnight_museum');
    const report = this.validate(story);

    console.log(`\n========================================`);
    console.log(`Story Validation Report: ${story.title} (${story.id})`);
    console.log(`Valid: ${report.isValid ? 'YES' : 'NO'}`);
    console.log(`Events: ${report.stats.eventCount}`);
    console.log(`Distractors: ${report.stats.distractorCount}`);
    console.log(`Endings: ${report.stats.endingCount}`);
    console.log(`Variables: ${report.stats.variableCount}`);

    if (report.warnings.length > 0) {
      console.log(`\nWarnings:`);
      report.warnings.forEach((w) => console.log(` - ${w}`));
    }

    if (report.errors.length > 0) {
      console.log(`\nErrors:`);
      report.errors.forEach((e) => console.error(` ❌ ${e}`));
      process.exit(1);
    } else {
      console.log(`\n✅ All story validation checks PASSED!`);
      console.log(`========================================\n`);
    }
  }
}

// Auto-run if executed directly
if (process.argv[1]?.includes('StoryValidator')) {
  StoryValidator.runAll();
}
