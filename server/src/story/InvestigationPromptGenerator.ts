import { PromptType } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('InvestigationPromptGenerator');

export interface PromptGenerationInput {
  canonicalAnswer: string;
  promptType: PromptType;
  narrativeContext: string;
  storyTitle: string;
  storyGenre: string;
  storySetting: string;
  hint: string;
  eventDescription?: string;
  acceptedAnswers?: string[];
}

/**
 * Generates contextual, narrative-driven drawer prompts that:
 * 1. Give the drawer a scene/narrative reason to draw
 * 2. NEVER reveal the canonical answer or accepted answers in the prompt text
 * 3. Are visual, intriguing, and drawable in 60-120 seconds
 *
 * Example:
 * Canonical Answer: "key"
 * Drawer Prompt: "You search beneath the old wooden table and notice something metallic hidden in the darkness. Draw what you discovered."
 */
export class InvestigationPromptGenerator {
  // ==========================================
  // TEMPLATE BANKS PER PROMPT TYPE
  // ==========================================

  private static readonly OBJECT_TEMPLATES = [
    'You search beneath the furniture and notice something unusual hidden in the darkness. Draw what you discovered.',
    'Near the crime scene, something metallic catches your eye in the shadows. Draw what was found.',
    'Hidden among the clutter at the scene, one critical item stands out. Draw the object you spotted.',
    'The investigators examine the floor carefully and discover a key piece of physical evidence. Draw what you see.',
    'A crucial physical clue was left behind when the suspect fled. Draw what the investigators recovered.',
    'You open the compartment and uncover an unexpected item. Draw what was concealed inside.',
    'Forensics flags an essential piece of physical evidence at the scene. Draw the object you discovered.',
    'Something dropped during the commotion lies partially concealed. Draw what was recovered.',
  ];

  private static readonly LOCATION_TEMPLATES = [
    'The investigation leads detectives to a specific location. Draw the place you discovered.',
    'A crucial location keeps appearing across the evidence. Draw what this place looks like.',
    'The suspect was last seen lingering at a particular spot. Draw where they were.',
    'A witness description points directly to an important venue. Draw the place they mentioned.',
    'The trail of footprints and clues ends at a hidden location. Draw what it looks like.',
  ];

  private static readonly PERSON_TEMPLATES = [
    'A witness describes an individual seen hurrying away near the scene. Draw the person described.',
    'The investigation identifies a key figure connected to the mystery. Draw the person of interest.',
    'Someone was spotted loitering in the restricted corridor. Draw who the witnesses remember seeing.',
    'Security records highlight a mysterious figure in the timeline. Draw who investigators are looking for.',
    'An urgent description comes in from the patrol unit. Draw who investigators are searching for.',
  ];

  private static readonly ACTION_TEMPLATES = [
    'Security footage captures a critical moment in progress. Draw what was happening.',
    'A witness recalls seeing something urgent take place. Draw the action they described.',
    'The timeline reveals a decisive incident. Draw what was happening at that exact moment.',
    'Evidence shows someone in the middle of a crucial maneuver. Draw what occurred.',
    'A sudden disturbance broke out right before the alarm sounded. Draw what happened.',
  ];

  private static readonly MEMORY_TEMPLATES = [
    'The key witness tries to recall what caught their attention. Draw their memory of the event.',
    'Before everything went dark, one vivid detail stood out. Draw what is remembered.',
    'The final clear recollection before the incident occurred. Draw what comes to mind.',
    'Someone recalls a distinctive scene from that night. Draw the memory they described.',
  ];

  private static readonly EVIDENCE_TEMPLATES = [
    'The forensic team marks a crucial piece of evidence at the scene. Draw what was recovered.',
    'Beside the shattered glass, investigators discover something vital. Draw the evidence.',
    'This physical trace could break the entire case wide open. Draw what was discovered.',
    'The crime scene technician bags an essential clue for analysis. Draw what was found.',
    'Investigators isolate a vital piece of evidence dropped near the exit. Draw what was collected.',
  ];

  private static readonly EVENT_TEMPLATES = [
    'Something dramatic occurred at this point in the timeline. Draw what happened.',
    'The sequence of events reveals a sudden incident. Draw what took place.',
    'At this critical juncture, something unexpected unfolded. Draw the event.',
    'The investigation timeline highlights this crucial moment. Draw what happened.',
  ];

  private static readonly SCENE_TEMPLATES = [
    'Security cameras recorded a pivotal scene before the feed cut out. Draw what the camera captured.',
    'A witness describes the unusual scene they stumbled upon. Draw what they saw.',
    'The detectives recreate a crucial scene from the night of the incident. Draw what took place.',
    'One particular scene from the incident holds the answer to the case. Draw what was observed.',
  ];

  private static readonly SUSPECT_TEMPLATES = [
    'The investigation narrows down to a prime suspect. Draw the person described.',
    'Witness descriptions point directly to one individual. Draw who they saw.',
    'Someone matching an eyewitness sketch was seen fleeing the scene. Draw the suspect.',
    'The evidence trail leads back to one mysterious individual. Draw who investigators are pursuing.',
  ];

  private static readonly TEMPLATE_MAP: Record<PromptType, string[]> = {
    OBJECT: InvestigationPromptGenerator.OBJECT_TEMPLATES,
    LOCATION: InvestigationPromptGenerator.LOCATION_TEMPLATES,
    PERSON: InvestigationPromptGenerator.PERSON_TEMPLATES,
    ACTION: InvestigationPromptGenerator.ACTION_TEMPLATES,
    MEMORY: InvestigationPromptGenerator.MEMORY_TEMPLATES,
    EVIDENCE: InvestigationPromptGenerator.EVIDENCE_TEMPLATES,
    EVENT: InvestigationPromptGenerator.EVENT_TEMPLATES,
    SCENE: InvestigationPromptGenerator.SCENE_TEMPLATES,
    SUSPECT: InvestigationPromptGenerator.SUSPECT_TEMPLATES,
  };

  // ==========================================
  // SAFE FALLBACK
  // ==========================================
  private static readonly SAFE_FALLBACK =
    'You search the crime scene and discover something unusual hidden in the darkness. Draw what you discovered.';

  // ==========================================
  // PUBLIC API
  // ==========================================

  /**
   * Generates a contextual drawer prompt that NEVER reveals the canonical answer.
   */
  public static generate(input: PromptGenerationInput): string {
    const { canonicalAnswer, promptType } = input;

    // Strategy: try to build a contextual prompt from the event description / narrative context,
    // falling back to templates if the description would leak the answer.
    let prompt = this.buildContextualPrompt(input);

    // Validate anti-leak against canonical answer and accepted answers
    if (!this.validateAntiLeak(prompt, canonicalAnswer, input.hint, input.acceptedAnswers)) {
      logger.warn('Anti-leak failed for contextual prompt, falling back to template', {
        canonicalAnswer,
        promptSnippet: prompt.substring(0, 60),
      });
      prompt = this.pickTemplate(promptType);
    }

    // Final validation pass
    if (!this.validateAntiLeak(prompt, canonicalAnswer, input.hint, input.acceptedAnswers)) {
      logger.warn('Template also leaked, using safe fallback');
      prompt = this.SAFE_FALLBACK;
    }

    return prompt;
  }

  // ==========================================
  // CONTEXTUAL PROMPT BUILDER
  // ==========================================

  private static buildContextualPrompt(input: PromptGenerationInput): string {
    const { narrativeContext, promptType, eventDescription, canonicalAnswer, acceptedAnswers, storySetting } = input;

    // Use the event's narrative context to build a scene-setting prompt
    const baseText = eventDescription || narrativeContext || '';
    const sceneText = this.sanitizeForPrompt(baseText, canonicalAnswer, acceptedAnswers);
    const drawInstruction = this.getDrawInstruction(promptType);

    if (sceneText && sceneText.length > 15) {
      // Check if sceneText already ends with drawing instruction
      if (/draw\s+/i.test(sceneText)) {
        return sceneText;
      }
      return `${sceneText} ${drawInstruction}`;
    }

    // Contextual setting template if setting is available
    if (storySetting && storySetting.trim().length > 3) {
      return `At ${storySetting.trim()}, you examine the area carefully and discover an important clue. ${drawInstruction}`;
    }

    // Fallback to pure template
    return this.pickTemplate(promptType);
  }

  /**
   * Removes answer words, plurals, and variations from a narrative description.
   * Ensures public context shown to guessers never leaks the secret answer.
   */
  public static sanitizeForPrompt(text: string, answer: string, acceptedAnswers?: string[]): string {
    if (!text) return '';

    let sanitized = text;
    const allWords = new Set<string>();

    const collectTerms = (str: string) => {
      if (!str) return;
      // Add full term if 3+ chars
      const trimmed = str.trim().toLowerCase();
      if (trimmed.length >= 3) allWords.add(trimmed);
      // Add individual tokens
      for (const token of trimmed.split(/\s+/)) {
        if (token.length >= 3) {
          allWords.add(token);
          // Add basic singular/plural variants
          if (token.endsWith('s') && token.length > 3) {
            allWords.add(token.slice(0, -1));
          } else {
            allWords.add(`${token}s`);
          }
        }
      }
    };

    collectTerms(answer);
    if (acceptedAnswers) {
      for (const ans of acceptedAnswers) {
        collectTerms(ans);
      }
    }

    // Sort by length descending so longer phrases match first
    const sortedTerms = Array.from(allWords).sort((a, b) => b.length - a.length);

    for (const term of sortedTerms) {
      const regex = new RegExp(`\\b${this.escapeRegex(term)}\\b`, 'gi');
      sanitized = sanitized.replace(regex, 'something');
    }

    // Clean up repetitive artifacts like "something something" or "a something"
    sanitized = sanitized
      .replace(/\ba\s+something\b/gi, 'something')
      .replace(/\ban\s+something\b/gi, 'something')
      .replace(/\bsomething\s+something\b/gi, 'something unusual')
      .trim();

    return sanitized;
  }

  private static getDrawInstruction(promptType: PromptType): string {
    switch (promptType) {
      case 'OBJECT': return 'Draw what you discovered.';
      case 'LOCATION': return 'Draw the place investigators found.';
      case 'PERSON': return 'Draw the person described.';
      case 'ACTION': return 'Draw what was happening.';
      case 'MEMORY': return 'Draw what the witness remembers.';
      case 'EVIDENCE': return 'Draw the evidence that was found.';
      case 'EVENT': return 'Draw what took place.';
      case 'SCENE': return 'Draw what the scene looked like.';
      case 'SUSPECT': return 'Draw the person investigators are looking for.';
      default: return 'Draw what you discovered.';
    }
  }

  private static pickTemplate(promptType: PromptType): string {
    const templates = this.TEMPLATE_MAP[promptType] || this.OBJECT_TEMPLATES;
    return templates[Math.floor(Math.random() * templates.length)];
  }

  // ==========================================
  // ANTI-LEAK VALIDATION
  // ==========================================

  /**
   * Validates that a prompt does NOT contain the answer, plurals, or accepted answers.
   * Returns true if the prompt is SAFE (no leaks detected).
   */
  public static validateAntiLeak(
    prompt: string,
    canonicalAnswer: string,
    hint?: string,
    acceptedAnswers?: string[]
  ): boolean {
    if (!prompt || !canonicalAnswer) return false;
    const promptLower = prompt.toLowerCase();

    // Collect forbidden terms (canonical answer + accepted answers)
    const forbidden = new Set<string>();
    const addForbidden = (term: string) => {
      const t = term.trim().toLowerCase();
      if (!t || t.length < 2) return;
      forbidden.add(t);
      // Add tokens
      const tokens = t.split(/\s+/).filter((w) => w.length >= 3);
      for (const tok of tokens) {
        forbidden.add(tok);
        if (tok.endsWith('s') && tok.length > 3) {
          forbidden.add(tok.slice(0, -1));
        } else {
          forbidden.add(`${tok}s`);
        }
      }
    };

    addForbidden(canonicalAnswer);
    if (acceptedAnswers) {
      for (const ans of acceptedAnswers) {
        addForbidden(ans);
      }
    }

    // Check with word boundaries to avoid false positives (e.g. "monkey" for "key")
    for (const term of forbidden) {
      const regex = new RegExp(`\\b${this.escapeRegex(term)}\\b`, 'i');
      if (regex.test(promptLower)) {
        return false;
      }
    }

    return true;
  }

  // ==========================================
  // UTILITY
  // ==========================================

  private static escapeRegex(str: string): string {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }
}
