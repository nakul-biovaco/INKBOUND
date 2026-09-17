import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const srcDir = path.resolve(__dirname, '../src/story/stories');
const distDir = path.resolve(__dirname, '../dist/story/stories');

try {
  if (fs.existsSync(srcDir)) {
    fs.mkdirSync(distDir, { recursive: true });
    const files = fs.readdirSync(srcDir);
    for (const file of files) {
      fs.copyFileSync(path.join(srcDir, file), path.join(distDir, file));
    }
    console.log(`[copy-stories] Copied ${files.length} story files to ${distDir}`);
  }
} catch (err) {
  console.warn('[copy-stories] Failed to copy stories directory:', err);
}
