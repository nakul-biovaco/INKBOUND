import { StoryDefinition, StoryEnding, StoryEvent } from '../types/index.js';
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
      const rawOptions = this.extractOptionsFromBlock(body);
      const cleanEventTitle = MarkdownStoryParser.cleanToClueWord(eventTitle);
      const canonRaw = rawOptions.find((o) => o.isCanon)?.text || objective;
      const cleanObjective = MarkdownStoryParser.cleanToClueWord(canonRaw);
      const finalObjective = cleanEventTitle && cleanEventTitle.split(' ').length <= 3 ? cleanEventTitle : cleanObjective;

      const options = rawOptions.map((opt) => ({
        ...opt,
        text: MarkdownStoryParser.cleanToClueWord(opt.text),
      }));

      const allAccepted = new Set<string>([
        finalObjective.toLowerCase(),
        cleanEventTitle.toLowerCase(),
        ...acceptedConcepts,
      ]);

      events.push({
        eventId: `evt_${storyNum}_${seq}`,
        act: Math.min(6, Math.ceil(seq / 4)),
        sequence: seq,
        eventType: 'DRAW_EVENT',
        drawingObjective: finalObjective,
        visualElements:
          visualElements.length > 0
            ? visualElements
            : ['clue', 'scene', 'figure'],
        acceptedConcepts: Array.from(allAccepted).filter((s) => s.length > 0),
        semanticKeywords: this.extractKeywords(
          `${finalObjective} ${narrative} ${visualElements.join(' ')}`
        ),
        hint: hint || 'Look closely at the crime evidence.',
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

    // If nothing could be parsed, there's no valid story to return.
    if (events.length === 0) {
      logger.error(`No events found while parsing single story file ${fileName}`);
      return null;
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
  private static parseBundledStory(
    storyNum: string,
    rawTitle: string,
    content: string
  ): StoryDefinition | null {
    const title = this.cleanTitle(rawTitle);
    const id = `story_${storyNum}_${this.slugify(title)}`;

    const genre =
      this.extractField(content, /Genre:\*\*\s*([^\n·]+)/i) || 'Mystery';
    const difficulty = this.extractDifficulty(
      this.extractField(content, /Difficulty:\*\*\s*([^\n·]+)/i)
    );
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
          const isCanon =
            part.toLowerCase().includes('*canon*') ||
            part.toLowerCase().includes('(canon)') ||
            part.toLowerCase().includes('canon');
          const cleaned = part
            .replace(/^[A-C]:\s*/i, '')
            .replace(/\*canon\*/gi, '')
            .replace(/\(canon\)/gi, '')
            .replace(/\*B-alt\*/gi, '')
            .replace(/\*C-alt\*/gi, '')
            .replace(/\*B\*/gi, '')
            .replace(/\*C\*/gi, '')
            .trim();
          const cleanedClue = MarkdownStoryParser.cleanToClueWord(cleaned);
          choices.push({ text: cleanedClue, isCanon });
          if (isCanon && !canonText) {
            canonText = cleanedClue;
          }
        }
      }

      // Event narrative (text before the options block)
      const narrative = rest.split(/\*\(/)[0].trim().replace(/\*TWIST.*?\*:\s*/i, '');
      if (!canonText) {
        canonText = MarkdownStoryParser.cleanToClueWord(narrative);
      }

      // Extract hint if present
      const hintMatch = line.match(/Hint:\s*"([^"]+)"/i);
      const hint = hintMatch ? hintMatch[1] : `Category: Mystery Clue`;

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
        acceptedConcepts: Array.from(new Set(accepted)).filter((s) => s.length > 0),
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

    if (events.length === 0) {
      logger.error(`No events found while parsing bundled story ${storyNum} (${title})`);
      return null;
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
    const clean = phrase.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim();
    const words = clean.split(/\s+/).filter(Boolean);
    const accepted = new Set<string>([clean]);
    for (const w of words) {
      if (w.length >= 3) {
        accepted.add(w);
      }
    }
    // Add common synonyms
    if (clean.includes('photo') || clean.includes('picture')) {
      accepted.add('photo');
      accepted.add('picture');
      accepted.add('photograph');
    }
    if (clean.includes('diary') || clean.includes('journal')) {
      accepted.add('diary');
      accepted.add('journal');
      accepted.add('notebook');
    }
    if (clean.includes('video') || clean.includes('tape')) {
      accepted.add('video');
      accepted.add('tape');
      accepted.add('movie');
    }
    if (clean.includes('fare') || clean.includes('taxi')) {
      accepted.add('fare');
      accepted.add('taxi');
      accepted.add('cab');
    }
    if (clean.includes('radio') || clean.includes('dispatcher')) {
      accepted.add('radio');
      accepted.add('dispatch');
    }
    return Array.from(accepted);
  }

  public static cleanToClueWord(text: string): string {
    if (!text) return 'Mystery Clue';
    let clean = text
      .replace(/^#*\s*\d+\s*[—–-]\s*/, '')
      .replace(/^MAJOR TWIST\s*—\s*/i, '')
      .replace(/\*canon\*|\*B-alt\*|\*C-alt\*|\*B\*|\*C\*|\(canon\)/gi, '')
      .replace(/^[A-C]:\s*/i, '')
      .replace(/[.!?:;]+$/, '')
      .trim();

    // Strip leading action verbs/gerunds and articles
    clean = clean.replace(
      /^(finding|discovering|looking for|searching for|getting into|picking up|refusing|breaking into|stealing|taking|examining|inspecting|opening|hiding|dropping|holding|leaving|meeting|hearing|watching|spotting|noticing)\s+(an?\s+|the\s+)?/i,
      ''
    );

    // Strip trailing context clauses like "while cleaning", "out of a closet", etc.
    clean = clean.replace(/\s+(while cleaning|out of \w+|near the \w+|in the \w+|on the \w+|from the \w+|at the \w+).*$/i, '');

    // Strip leading articles
    clean = clean.replace(/^(a|an|the)\s+/i, '').trim();

    // Handle common phrases into crisp 2 words
    if (/refusing.*fare/i.test(text) || clean.toLowerCase() === 'fare') {
      return 'Taxi Fare';
    }
    if (/dispatcher.*voice|radio crackles/i.test(text)) {
      return 'Dispatch Radio';
    }
    if (/fender-bender|car crash/i.test(text)) {
      return 'Car Crash';
    }

    const words = clean.split(/\s+/).filter(Boolean);
    let resultWords: string[] = [];
    if (words.length <= 2) {
      resultWords = words;
    } else {
      // Pick the most descriptive 2 words
      resultWords = words.slice(-2);
    }

    const formatted = resultWords
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase())
      .join(' ');

    return formatted || 'Mystery Clue';
  }

  private static generateDistractors(title: string, events: StoryEvent[]): Array<{ distractorId: string; text: string; category: string }> {
    const distractors = [
      { distractorId: 'dist_generic_1', text: 'Handcuffs', category: 'evidence' },
      { distractorId: 'dist_generic_2', text: 'Flashlight', category: 'tool' },
      { distractorId: 'dist_generic_3', text: 'Broken Glass', category: 'clue' },
      { distractorId: 'dist_generic_4', text: 'Police Badge', category: 'authority' },
      { distractorId: 'dist_generic_5', text: 'Secret Safe', category: 'location' },
      { distractorId: 'dist_generic_6', text: 'Poison Bottle', category: 'evidence' },
    ];
    return distractors;
  }
}