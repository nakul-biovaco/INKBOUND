import crypto from 'crypto';

export class IdGenerator {
  // Unambiguous characters (avoiding 0, O, 1, I, L)
  private static readonly ROOM_CODE_CHARS = '23456789ABCDEFGHJKMNPQRSTUVWXYZ';

  /**
   * Generates a secure, human-friendly 5-character join code (e.g. 8FJ2K)
   */
  public static generateJoinCode(length: number = 5): string {
    const bytes = crypto.randomBytes(length);
    let code = '';
    for (let i = 0; i < length; i++) {
      const index = bytes[i] % this.ROOM_CODE_CHARS.length;
      code += this.ROOM_CODE_CHARS[index];
    }
    return code;
  }

  public static generateRoomId(): string {
    return `room_${crypto.randomUUID()}`;
  }

  public static generatePlayerId(): string {
    return `player_${crypto.randomUUID()}`;
  }

  public static generateReconnectToken(): string {
    return crypto.randomBytes(32).toString('hex');
  }

  public static generateStrokeId(): string {
    return `strk_${Date.now()}_${crypto.randomBytes(4).toString('hex')}`;
  }

  public static generateSessionId(): string {
    return `sess_${crypto.randomUUID()}`;
  }
}
