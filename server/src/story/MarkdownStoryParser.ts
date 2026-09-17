import { PromptOption, StoryDefinition, StoryEnding, StoryEvent } from '../types/index.js';
import { createLogger } from '../utils/logger.js';

const logger = createLogger('MarkdownStoryParser');

export class MarkdownStoryParser {
  /**
   * Parses a markdown file and returns one or more StoryDefinitions.
   * Supports both single-story deep files and multi-story bundle files.
   */
  public static parseFile(fileContent: string, fileName: string): StoryDefinition[] {
    const stories: StoryDefinition[] = [];

    // Check if the file contains multiple stories (e.g. ## 02 — THE LAST TRAIN)
    const multiStoryRegex = /(?:^|\n)##\s+(\d{2})\s*—\s*([^\n]+)/g;
    const matches: Array<{ index: number; number: string; title: string }> = [];

    let match: RegExpExecArray | null;
    while ((match = multiStoryRegex.exec(fileContent)) !== null) {
      matches.push({
        index: match.index,
        number: match[1],
        title: match[2].trim(),
      });
    }

    if (matches.length > 0) {
      // It's a multi-story bundled file (e.g. 02-06_investigation.md)
      for (let i = 0; i < matches.length; i++) {
        const current = matches[i];
        const next = matches[i + 1];
        const sectionContent = next
          ? fileContent.substring(current.index, next.index)
          : fileContent.substring(current.index);

        try {
          const story = this.parseBundledStory(current.number, current.title, sectionContent);
          if (story) stories.push(story);
        } catch (err) {
          logger.error(`Error parsing story ${current.number} (${current.title}) from ${fileName}`, err);
        }
      }
    } else {
      // It's a single-story deep file (e.g. 01_the_midnight_museum.md, 07_room_404.md)
      try {
        const story = this.parseSingleStory(fileContent, fileName);
        if (story) stories.push(story);
      } catch (err) {
        logger.error(`Error parsing single story file ${fileName}`, err);
      }
    }

    return stories;
  }

  /**
   * Parses single-story detailed files (01, 07, 13)
   */
  private static parseSingleStory(content: string, fileName: string): StoryDefinition | null {
    // Title: # 01 — THE MIDNIGHT MUSEUM
    const titleMatch = content.match(/#\s*(\d{2})\s*—\s*([^\n]+)/);
    const storyNum = titleMatch ? titleMatch[1] : fileName.replace(/\D/g, '').substring(0, 2) || '01';
    const rawTitle = titleMatch ? titleMatch[2].trim() : fileName.replace('.md', '');
    const title = this.cleanTitle(rawTitle);
    const id = `story_${storyNum}_${this.slugify(title)}`;

    const genre = this.extractField(content, /Genre:\*\*\s*([^\n·]+)/i) || 'Mystery';
    const difficulty = this.extractDifficulty(this.extractField(content, /Difficulty:\*\*\s*([^\n·]+)/i));
    const premise = this.extractSection(content, /##\s*PREMISE/i, /##\s*CAST/i) || 'An intriguing investigation.';
    const hook = this.extractField(content, /One-line hook:\*\*\s*([^\n]+)/i) || premise.substring(0, 120);

    // Parse Events
    const events: StoryEvent[] = [];
    const eventBlocks = content.split(/\*\*E(\d+)\.\s*([^\*]+)\*\*/i);

    // Blocks: [preamble, eventNum1, eventTitle1, eventBody1, eventNum2, ...]
    for (let i = 1; i < eventBlocks.length; i += 3) {
      const seq = parseInt(eventBlocks[i], 10);
      const eventTitle = eventBlocks[i + 1].trim();
      const body = eventBlocks[i + 2] || '';

      const narrative = this.extractField(body, /\*Event:\*\s*([^\n]+)/i) || eventTitle;
      const objective = this.extractField(body, /\*Objective:\*\s*([^\n]+)/i) || eventTitle;
      const hint = this.extractField(body, /\*Hint:\*\s*"?([^"\n]+)"?/i) || `Look closely at ${eventTitle.toLowerCase()}.`;

      const visualRaw = this.extractField(body, /\*Visual elements:\*\s*([^\n]+)/i) || '';
      const visualElements = visualRaw
        .split(',')
        .map((s) => s.trim())
        .filter((s) => s.length > 0);

      const acceptedRaw = this.extractField(body, /\*Accepted guesses:\*\s*([^\n]+)/i) || '';
      const acceptedConcepts = acceptedRaw
        .split(',')
        .map((s) => s.trim().toLowerCase())
        .filter((s) => s.length > 0);

      if (acceptedConcepts.length === 0) {
        acceptedConcepts.push(objective.toLowerCase());
      }

      // Extract 3 options (A, B, C)
      const options = this.extractOptionsFromBlock(body);
      const canonOption = options.find((o) => o.isCanon)?.text || objective;

      events.push({
        eventId: `evt_${storyNum}_${seq}`,
        act: Math.min(6, Math.ceil(seq / 4)),
        sequence: seq,
        eventType: 'DRAW_EVENT',
        drawingObjective: canonOption,
        visualElements: visualElements.length > 0 ? visualElements : ['clue', 'scene', 'figure'],
        acceptedConcepts,
        semanticKeywords: this.extractKeywords(canonOption + ' ' + objective),
        hint,
        difficulty: seq > 12 ? 'HARD' : seq > 5 ? 'MEDIUM' : 'EASY',
        narrativeDescription: narrative,
        consequenceReveal: narrative,
        choices: options,
        setVariables: {
          [`clue_${seq}_solved`]: true,
          ...(seq === 8 ? { suspectIdentified: true } : {}),
          ...(seq === 16 ? { truthExposed: true } : {}),
        },
      });
    }

    const endings: StoryEnding[] = [
      {
        endingId: `ending_${storyNum}_truth`,
        title: `The Truth of ${title}`,
        conditionDescription: 'Players uncovered the full truth behind the case.',
        requiredVariables: { truthExposed: true },
        narrativeText: `Through careful observation and brilliant deduction, the mystery of ${title} was solved in full!`,
      },
      {
        endingId: `ending_${storyNum}_unresolved`,
        title: `Unresolved Mystery`,
        conditionDescription: 'Key clues remained in the shadows.',
        requiredVariables: {},
        narrativeText: `The case of ${title} came to a quiet close, leaving several questions unanswered.`,
      },
    ];

    return {
      id,
      title,
      genre,
      description: hook || premise.substring(0, 160),
      difficulty,
      version: 1,
      initialVariables: {
        truthExposed: false,
        suspectIdentified: false,
      },
      events,
      distractors: this.generateDistractors(title, events),
      endings,
    };
  }

  /**
   * Parses bundled stories (02–06, 08–12, 14–17)
   */
  private static parseBundledStory(storyNum: string, rawTitle: string, content: string): StoryDefinition | null {
    const title = this.cleanTitle(rawTitle);
    const id = `story_${storyNum}_${this.slugify(title)}`;

    const genre = this.extractField(content, /Genre:\*\*\s*([^\n·]+)/i) || 'Mystery';
    const difficulty = this.extractDifficulty(this.extractField(content, /Difficulty:\*\*\s*([^\n·]+)/i));
    const hook = this.extractField(content, /Hook:\*\*\s*([^\n]+)/i) || '';
    const premise = this.extractField(content, /Premise:\*\*\s*([^\n]+)/i) || hook;

    // Parse Events: numbered list like:
    // 1. Description *(A: optA *canon* / B: optB / C: optC)* — Hint: "..."
    const events: StoryEvent[] = [];
    const eventLines = content.split('\n').filter((l) => /^\s*\d+\.\s+/.test(l));

    for (let idx = 0; idx < eventLines.length; idx++) {
      const line = eventLines[idx];
      const numMatch = line.match(/^\s*(\d+)\.\s*(.*)/);
      if (!numMatch) continue;

      const seq = parseInt(numMatch[1], 10);
      const rest = numMatch[2].trim();

      // Extract options: *(A: ... / B: ... / C: ...)*
      const optionsMatch = rest.match(/\*\((.*?)\)\*/);
      let canonText = '';
      const choices: Array<{ text: string; isCanon: boolean }> = [];

      if (optionsMatch) {
        const optsRaw = optionsMatch[1];
        const parts = optsRaw.split(/\s*\/\s*/);
        for (const part of parts) {
          const isCanon = part.toLowerCase().includes('*canon*') || part.toLowerCase().includes('(canon)') || part.toLowerCase().includes('canon');
          const cleaned = part
            .replace(/^[A-C]:\s*/i, '')
            .replace(/\*canon\*/gi, '')
            .replace(/\(canon\)/gi, '')
            .replace(/\*B-alt\*/gi, '')
            .replace(/\*C-alt\*/gi, '')
            .replace(/\*B\*/gi, '')
            .replace(/\*C\*/gi, '')
            .trim();
          choices.push({ text: cleaned, isCanon });
          if (isCanon && !canonText) {
            canonText = cleaned;
          }
        }
      }

      // Event narrative (text before the options block)
      const narrative = rest.split(/\*\(/)[0].trim().replace(/\*TWIST.*?\*:\s*/i, '');
      if (!canonText) {
        canonText = narrative;
      }

      // Extract hint if present
      const hintMatch = line.match(/Hint:\s*"([^"]+)"/i);
      const hint = hintMatch ? hintMatch[1] : `Focus on the clue in this moment.`;

      // Accepted guesses derived from canon and narrative keywords
      const accepted = [
        canonText.toLowerCase(),
        ...this.generateAcceptedPhrases(canonText),
      ];

      events.push({
        eventId: `evt_${storyNum}_${seq}`,
        act: Math.min(6, Math.ceil(seq / 4)),
        sequence: seq,
        eventType: seq === 14 || seq === 15 ? 'NARRATIVE_TWIST' : 'DRAW_EVENT',
        drawingObjective: canonText,
        visualElements: this.extractVisualElements(canonText + ' ' + narrative),
        acceptedConcepts: Array.from(new Set(accepted)),
        semanticKeywords: this.extractKeywords(canonText),
        hint,
        difficulty: seq > 12 ? 'HARD' : seq > 5 ? 'MEDIUM' : 'EASY',
        narrativeDescription: narrative,
        consequenceReveal: narrative,
        choices,
        setVariables: {
          [`clue_${seq}_solved`]: true,
          ...(seq >= 15 ? { truthExposed: true } : {}),
        },
      });
    }

    const endings: StoryEnding[] = [
      {
        endingId: `ending_${storyNum}_truth`,
        title: `The Truth of ${title}`,
        conditionDescription: 'The central mystery was unraveled.',
        requiredVariables: { truthExposed: true },
        narrativeText: `The full sequence of events was successfully solved, bringing closure to ${title}.`,
      },
      {
        endingId: `ending_${storyNum}_partial`,
        title: `Partial Discovery`,
        conditionDescription: 'Some clues were missed.',
        requiredVariables: {},
        narrativeText: `The mystery of ${title} ended with partial truth discovered.`,
      },
    ];

    return {
      id,
      title,
      genre,
      description: hook || premise.substring(0, 160),
      difficulty,
      version: 1,
      initialVariables: {
        truthExposed: false,
      },
      events,
      distractors: this.generateDistractors(title, events),
      endings,
    };
  }

  // ==========================================
  // HELPER PARSING UTILITIES
  // ==========================================
  private static extractField(text: string, regex: RegExp): string | null {
    const match = text.match(regex);
    return match ? match[1].trim() : null;
  }

  private static extractSection(text: string, startRegex: RegExp, endRegex: RegExp): string | null {
    const startMatch = text.search(startRegex);
    if (startMatch === -1) return null;
    const sub = text.substring(startMatch);
    const endMatch = sub.search(endRegex);
    if (endMatch === -1) return sub.replace(startRegex, '').trim();
    return sub.substring(0, endMatch).replace(startRegex, '').trim();
  }

  private static extractDifficulty(val: string | null): 'EASY' | 'NORMAL' | 'HARD' {
    if (!val) return 'NORMAL';
    const upper = val.toUpperCase();
    if (upper.includes('EASY')) return 'EASY';
    if (upper.includes('HARD')) return 'HARD';
    return 'NORMAL';
  }

  private static cleanTitle(title: string): string {
    return title.replace(/^#*\s*\d+\s*[—–-]\s*/, '').trim();
  }

  private static slugify(text: string): string {
    return text
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '_')
      .replace(/^_+|_+$/g, '');
  }

  private static extractOptionsFromBlock(body: string): Array<{ text: string; isCanon: boolean }> {
    const options: Array<{ text: string; isCanon: boolean }> = [];
    const lines = body.split('\n');

    for (const line of lines) {
      const match = line.match(/^\s*([A-C])\)\s*(.*)/i);
      if (match) {
        const text = match[2].trim();
        const isCanon = text.toLowerCase().includes('*canon*') || text.toLowerCase().includes('(canon)');
        options.push({
          text: text.replace(/\*canon\*/gi, '').replace(/\(canon\)/gi, '').trim(),
          isCanon,
        });
      }
    }

    return options;
  }

  private static extractKeywords(text: string): string[] {
    const stopWords = new Set(['a', 'an', 'the', 'is', 'at', 'in', 'on', 'to', 'of', 'and', 'with', 'from', 'her', 'his', 'out']);
    return Array.from(
      new Set(
        text
          .toLowerCase()
          .replace(/[^a-z0-9\s]/g, '')
          .split(/\s+/)
          .filter((w) => w.length > 3 && !stopWords.has(w))
      )
    ).slice(0, 6);
  }

  private static extractVisualElements(text: string): string[] {
    const keywords = this.extractKeywords(text);
    return keywords.length > 0 ? keywords : ['clue', 'person', 'object'];
  }

  private static generateAcceptedPhrases(phrase: string): string[] {
    const words = phrase.toLowerCase().replace(/[^a-z0-9\s]/g, '').split(/\s+/);
    if (words.length >= 3) {
      return [
        words.slice(0, 3).join(' '),
        words.slice(-3).join(' '),
      ];
    }
    return [phrase.toLowerCase()];
  }

  private static generateDistractors(title: string, events: StoryEvent[]): Array<{ distractorId: string; text: string; category: string }> {
    const distractors = [
      { distractorId: 'dist_generic_1', text: 'A curious cat slipping past a door', category: 'innocent' },
      { distractorId: 'dist_generic_2', text: 'A phone ringing in an empty corridor', category: 'mood' },
      { distractorId: 'dist_generic_3', text: 'Someone hurriedly checking their watch', category: 'innocent' },
      { distractorId: 'dist_generic_4', text: 'A cup of coffee spilling on paperwork', category: 'innocent' },
      { distractorId: 'dist_generic_5', text: 'A shadow moving behind a frosted glass window', category: 'distraction' },
    ];
    return distractors;
  }
}
