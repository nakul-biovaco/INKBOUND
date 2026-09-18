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
    console.log(`[copy-stories] Copied ${files.length} story json files to ${distDir}`);
  }

  // Copy root STORY markdown directory
  const rootStoryDir = path.resolve(__dirname, '../../STORY');
  const distStoryDir = path.resolve(__dirname, '../dist/STORY');
  const localStoryDir = path.resolve(__dirname, '../STORY');

  if (fs.existsSync(rootStoryDir)) {
    fs.mkdirSync(distStoryDir, { recursive: true });
    fs.mkdirSync(localStoryDir, { recursive: true });
    const storyFiles = fs.readdirSync(rootStoryDir);
    for (const sf of storyFiles) {
      fs.copyFileSync(path.join(rootStoryDir, sf), path.join(distStoryDir, sf));
      fs.copyFileSync(path.join(rootStoryDir, sf), path.join(localStoryDir, sf));
    }
    console.log(`[copy-stories] Copied ${storyFiles.length} markdown story files to dist/STORY and server/STORY`);
  }
} catch (err) {
  console.warn('[copy-stories] Failed to copy stories directory:', err);
}
