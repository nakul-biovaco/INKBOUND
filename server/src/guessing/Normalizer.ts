export class Normalizer {
  private static readonly STOP_WORDS = new Set(['a', 'an', 'the', 'is', 'are', 'was', 'were', 'in', 'on', 'at', 'to', 'of']);

  /**
   * Cleans text: lowercase, removes punctuation/accents, collapses whitespace
   */
  public static normalize(text: string): string {
    if (!text) return '';
    return text
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '') // remove diacritics
      .replace(/[^a-z0-9\s]/g, ' ') // remove punctuation
      .replace(/\s+/g, ' ')
      .trim();
  }

  /**
   * Tokenizes and removes common stop words
   */
  public static tokenize(text: string): string[] {
    const normalized = this.normalize(text);
    return normalized
      .split(' ')
      .filter((word) => word.length > 0 && !this.STOP_WORDS.has(word));
  }
}
