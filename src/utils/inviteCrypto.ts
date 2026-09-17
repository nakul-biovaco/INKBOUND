/**
 * INKBOUND Invite Encryption & Link Utility
 * Encrypts room codes into URL-safe encrypted tokens (e.g. INK-7a8b9c...)
 * and securely decodes them back to room codes.
 */

const SECRET_SALT = 'INKBOUND_CLASSIFIED_DOSSIER_KEY_2026';

/**
 * Encrypts a room code into an obfuscated URL-safe token.
 */
export function encodeInviteCode(roomCode: string): string {
  const cleanCode = roomCode.trim().toUpperCase();
  if (!cleanCode) return '';

  const timestamp = Date.now().toString(36);
  const payload = `${cleanCode}:${timestamp}`;

  // Reversible XOR cipher with dynamic key derived from SECRET_SALT
  let hex = '';
  for (let i = 0; i < payload.length; i++) {
    const charCode = payload.charCodeAt(i);
    const keyChar = SECRET_SALT.charCodeAt(i % SECRET_SALT.length);
    const cipherByte = charCode ^ keyChar;
    hex += cipherByte.toString(16).padStart(2, '0');
  }

  return `INK-${hex}`;
}

/**
 * Decodes an invite token or direct room code back to the original room code.
 */
export function decodeInviteCode(input: string): string {
  if (!input) return '';
  let token = input.trim();

  // 1. If full URL was passed, extract query parameter
  if (token.includes('?') || token.includes('/')) {
    try {
      const url = new URL(token, typeof window !== 'undefined' ? window.location.origin : 'http://localhost');
      const param = url.searchParams.get('invite') || url.searchParams.get('join') || url.searchParams.get('room');
      if (param) token = param;
    } catch {
      const match = token.match(/[?&](?:invite|join|room)=([^&#]+)/);
      if (match && match[1]) token = decodeURIComponent(match[1]);
    }
  }

  // Clean parameter syntax if still prefixed
  token = token.replace(/^[?&](?:invite|join|room)=/, '');

  // 2. Check if it's an encrypted token (INK-...)
  if (token.startsWith('INK-')) {
    const hex = token.substring(4);
    let decrypted = '';
    try {
      for (let i = 0; i < hex.length; i += 2) {
        const hexByte = parseInt(hex.substring(i, i + 2), 16);
        const keyChar = SECRET_SALT.charCodeAt((i / 2) % SECRET_SALT.length);
        const charCode = hexByte ^ keyChar;
        decrypted += String.fromCharCode(charCode);
      }
      const [code] = decrypted.split(':');
      if (code && code.length >= 3 && code.length <= 12) {
        return code.toUpperCase();
      }
    } catch {
      // Fallback
    }
  }

  // 3. Fallback: Base64 / Base64URL detection
  try {
    if (/^[A-Za-z0-9_-]{10,}$/.test(token)) {
      const b64 = token.replace(/-/g, '+').replace(/_/g, '/');
      const raw = atob(b64);
      if (raw.includes(':')) {
        const [code] = raw.split(':');
        if (code && code.length >= 3 && code.length <= 12) return code.toUpperCase();
      }
    }
  } catch {
    // Ignore
  }

  // 4. Direct plain room code fallback (e.g. 94EHC or clean alphanumeric)
  const directClean = token.replace(/[^A-Za-z0-9]/g, '').toUpperCase();
  return directClean.slice(0, 10);
}

/**
 * Builds a complete invite URL with encrypted token.
 */
export function buildInviteUrl(roomCode: string, origin?: string): string {
  const base = origin || (typeof window !== 'undefined' ? window.location.origin : '');
  const token = encodeInviteCode(roomCode);
  return `${base}/?invite=${encodeURIComponent(token)}`;
}
