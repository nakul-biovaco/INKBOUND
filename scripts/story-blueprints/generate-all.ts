import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { buildStory } from './builder.js';
import { GeneratedStory } from './types.js';

import { NOIR_STORIES } from './genre01_noir.js';
import { INVESTIGATION_STORIES } from './genre02_investigation.js';
import { PSYCHOLOGICAL_STORIES } from './genre03_psychological.js';
import { THRILLER_STORIES } from './genre04_thriller.js';
import { HORROR_STORIES } from './genre05_horror.js';
import { SUPERNATURAL_STORIES } from './genre06_supernatural.js';
import { ROMANCE_STORIES } from './genre07_romance.js';
import { SCIFI_STORIES } from './genre08_scifi.js';
import { DARK_STORIES } from './genre09_dark.js';
import { EMOTIONAL_STORIES } from './genre10_emotional.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '../../');

function escapeSql(str: string | null | undefined): string {
  if (str === null || str === undefined) return 'NULL';
  return `'${str.replace(/'/g, "''")}'`;
}

function escapeJson(obj: any): string {
  if (obj === null || obj === undefined) return `'[]'::jsonb`;
  const jsonStr = JSON.stringify(obj);
  return `'${jsonStr.replace(/'/g, "''")}'::jsonb`;
}

async function run() {
  console.log('====================================================');
  console.log('INKBOUND — 120 STORIES MASTER GENERATION RUNNER');
  console.log('====================================================');

  const allBlueprints = [
    ...NOIR_STORIES,
    ...INVESTIGATION_STORIES,
    ...PSYCHOLOGICAL_STORIES,
    ...THRILLER_STORIES,
    ...HORROR_STORIES,
    ...SUPERNATURAL_STORIES,
    ...ROMANCE_STORIES,
    ...SCIFI_STORIES,
    ...DARK_STORIES,
    ...EMOTIONAL_STORIES,
  ];

  console.log(`Loaded ${allBlueprints.length} blueprints across 10 genres.`);

  if (allBlueprints.length !== 120) {
    throw new Error(`Expected exactly 120 story blueprints, got ${allBlueprints.length}`);
  }

  // Validate consecutive IDs
  const generatedStories: GeneratedStory[] = [];
  const idSet = new Set<string>();

  for (let i = 0; i < allBlueprints.length; i++) {
    const expectedId = `story_${(i + 1).toString().padStart(3, '0')}`;
    const bp = allBlueprints[i];

    if (bp.id !== expectedId) {
      throw new Error(`Blueprint index ${i} has id '${bp.id}', expected '${expectedId}'`);
    }
    if (idSet.has(bp.id)) {
      throw new Error(`Duplicate story id detected: ${bp.id}`);
    }
    idSet.add(bp.id);

    const built = buildStory(bp);
    generatedStories.push(built);
  }

  console.log(`✓ All 120 stories successfully built and validated.`);

  // 1. Output runtime JSON catalog: server/src/story/data/stories_catalog.json
  const dataDir = path.join(projectRoot, 'server/src/story/data');
  if (!fs.existsSync(dataDir)) {
    fs.mkdirSync(dataDir, { recursive: true });
  }

  const jsonCatalogPath = path.join(dataDir, 'stories_catalog.json');
  fs.writeFileSync(jsonCatalogPath, JSON.stringify(generatedStories, null, 2), 'utf8');
  console.log(`✓ Wrote JSON catalog to ${jsonCatalogPath} (${(fs.statSync(jsonCatalogPath).size / 1024).toFixed(1)} KB)`);

  const clientDataDir = path.join(projectRoot, 'src/game/data');
  if (!fs.existsSync(clientDataDir)) {
    fs.mkdirSync(clientDataDir, { recursive: true });
  }
  const clientJsonCatalogPath = path.join(clientDataDir, 'stories_catalog.json');
  fs.writeFileSync(clientJsonCatalogPath, JSON.stringify(generatedStories, null, 2), 'utf8');
  console.log(`✓ Wrote client JSON catalog to ${clientJsonCatalogPath}`);

  // 2. Generate 4 partitioned SQL migrations
  const partitions = [
    { start: 1, end: 30, filename: '20240104000000_seed_stories_001_030.sql' },
    { start: 31, end: 60, filename: '20240104000001_seed_stories_031_060.sql' },
    { start: 61, end: 90, filename: '20240104000002_seed_stories_061_090.sql' },
    { start: 91, end: 120, filename: '20240104000003_seed_stories_091_120.sql' },
  ];

  const migrationsDir = path.join(projectRoot, 'supabase/migrations');
  if (!fs.existsSync(migrationsDir)) {
    fs.mkdirSync(migrationsDir, { recursive: true });
  }

  for (const part of partitions) {
    const partStories = generatedStories.filter((s) => {
      const num = parseInt(s.id.replace('story_', ''), 10);
      return num >= part.start && num <= part.end;
    });

    console.log(`Generating SQL partition: ${part.filename} (Stories ${part.start} to ${part.end}, count: ${partStories.length})...`);

    const sqlLines: string[] = [
      `-- ============================================================================`,
      `-- INKBOUND — SEED STORIES ${part.start.toString().padStart(3, '0')} TO ${part.end.toString().padStart(3, '0')}`,
      `-- Part of the 120 Complete Connected Story Database with Dynamic Wording`,
      `-- ============================================================================`,
      ``,
    ];

    for (const story of partStories) {
      sqlLines.push(`-- ----------------------------------------------------------------------------`);
      sqlLines.push(`-- CASE: ${story.id.toUpperCase()} — ${story.title.toUpperCase()}`);
      sqlLines.push(`-- ----------------------------------------------------------------------------`);

      // 1. Insert/Update into public.cases
      sqlLines.push(`INSERT INTO public.cases (`);
      sqlLines.push(`  id, title, genre, setting, description, characters, truth, culprit, motive,`);
      sqlLines.push(`  timeline, evidence, clues, misleading_info, distorter_objective, difficulty,`);
      sqlLines.push(`  main_mystery, character_secrets, red_herrings, theories, final_reveal, endings, dynamic_wording`);
      sqlLines.push(`) VALUES (`);
      sqlLines.push(`  ${escapeSql(story.id)},`);
      sqlLines.push(`  ${escapeSql(story.title)},`);
      sqlLines.push(`  ${escapeSql(story.genre)},`);
      sqlLines.push(`  ${escapeSql(story.setting)},`);
      sqlLines.push(`  ${escapeSql(story.description)},`);
      sqlLines.push(`  ${escapeJson(story.characters.map((c) => ({ name: c.name, role: c.role_description, alibi: c.alibi, avatar: c.avatar })))},`);
      sqlLines.push(`  ${escapeSql(story.truth)},`);
      sqlLines.push(`  ${escapeSql(story.culprit)},`);
      sqlLines.push(`  ${escapeSql(story.motive)},`);
      sqlLines.push(`  ${escapeJson(story.timeline.map((t) => ({ time: t.time, event: t.event })))},`);
      sqlLines.push(`  ${escapeJson(story.evidence)},`);
      sqlLines.push(`  ${escapeJson(story.clues.map((c, idx) => ({ order: idx + 1, title: c.title, text: c.text })))},`);
      sqlLines.push(`  ${escapeSql(story.red_herrings.map((h) => `${h.lead}: ${h.explanation}`).join('; '))},`);
      sqlLines.push(`  ${escapeSql(story.distorter_objective)},`);
      sqlLines.push(`  ${escapeSql(story.difficulty)},`);
      sqlLines.push(`  ${escapeSql(story.main_mystery)},`);
      sqlLines.push(`  ${escapeJson(story.character_secrets)},`);
      sqlLines.push(`  ${escapeJson(story.red_herrings)},`);
      sqlLines.push(`  ${escapeJson(story.theories)},`);
      sqlLines.push(`  ${escapeSql(story.final_reveal)},`);
      sqlLines.push(`  ${escapeJson(story.endings)},`);
      sqlLines.push(`  ${escapeJson(story.dynamic_wording)}`);
      sqlLines.push(`) ON CONFLICT (id) DO UPDATE SET`);
      sqlLines.push(`  title = EXCLUDED.title,`);
      sqlLines.push(`  genre = EXCLUDED.genre,`);
      sqlLines.push(`  setting = EXCLUDED.setting,`);
      sqlLines.push(`  description = EXCLUDED.description,`);
      sqlLines.push(`  characters = EXCLUDED.characters,`);
      sqlLines.push(`  truth = EXCLUDED.truth,`);
      sqlLines.push(`  culprit = EXCLUDED.culprit,`);
      sqlLines.push(`  motive = EXCLUDED.motive,`);
      sqlLines.push(`  timeline = EXCLUDED.timeline,`);
      sqlLines.push(`  evidence = EXCLUDED.evidence,`);
      sqlLines.push(`  clues = EXCLUDED.clues,`);
      sqlLines.push(`  misleading_info = EXCLUDED.misleading_info,`);
      sqlLines.push(`  distorter_objective = EXCLUDED.distorter_objective,`);
      sqlLines.push(`  difficulty = EXCLUDED.difficulty,`);
      sqlLines.push(`  main_mystery = EXCLUDED.main_mystery,`);
      sqlLines.push(`  character_secrets = EXCLUDED.character_secrets,`);
      sqlLines.push(`  red_herrings = EXCLUDED.red_herrings,`);
      sqlLines.push(`  theories = EXCLUDED.theories,`);
      sqlLines.push(`  final_reveal = EXCLUDED.final_reveal,`);
      sqlLines.push(`  endings = EXCLUDED.endings,`);
      sqlLines.push(`  dynamic_wording = EXCLUDED.dynamic_wording;`);
      sqlLines.push(``);

      // Clean existing characters & events for idempotency
      sqlLines.push(`DELETE FROM public.case_characters WHERE case_id = ${escapeSql(story.id)};`);
      sqlLines.push(`DELETE FROM public.case_events WHERE case_id = ${escapeSql(story.id)};`);
      sqlLines.push(``);

      // 2. Insert characters
      for (const char of story.characters) {
        sqlLines.push(`INSERT INTO public.case_characters (`);
        sqlLines.push(`  id, case_id, name, role_description, personality, what_they_say, what_they_hide,`);
        sqlLines.push(`  alibi, connection, what_they_know, what_they_do_not_know, avatar, statement_variations`);
        sqlLines.push(`) VALUES (`);
        sqlLines.push(`  '${char.id}',`);
        sqlLines.push(`  ${escapeSql(story.id)},`);
        sqlLines.push(`  ${escapeSql(char.name)},`);
        sqlLines.push(`  ${escapeSql(char.role_description)},`);
        sqlLines.push(`  ${escapeSql(char.personality)},`);
        sqlLines.push(`  ${escapeSql(char.what_they_say)},`);
        sqlLines.push(`  ${escapeSql(char.what_they_hide)},`);
        sqlLines.push(`  ${escapeSql(char.alibi)},`);
        sqlLines.push(`  ${escapeSql(char.connection)},`);
        sqlLines.push(`  ${escapeSql(char.what_they_know)},`);
        sqlLines.push(`  ${escapeSql(char.what_they_do_not_know)},`);
        sqlLines.push(`  ${escapeSql(char.avatar)},`);
        sqlLines.push(`  ${escapeJson(char.statement_variations)}`);
        sqlLines.push(`);`);
      }
      sqlLines.push(``);

      // 3. Insert events
      for (const ev of story.events) {
        sqlLines.push(`INSERT INTO public.case_events (`);
        sqlLines.push(`  id, case_id, event_key, order_index, time_label, description, what_happens,`);
        sqlLines.push(`  what_to_discover, clue, evidence, wrong_answers, correct_answer, accepted_guesses,`);
        sqlLines.push(`  hint, next_event_key, is_key_event, dynamic_wording`);
        sqlLines.push(`) VALUES (`);
        sqlLines.push(`  '${ev.id}',`);
        sqlLines.push(`  ${escapeSql(story.id)},`);
        sqlLines.push(`  ${escapeSql(ev.event_key)},`);
        sqlLines.push(`  ${ev.order_index},`);
        sqlLines.push(`  ${escapeSql(ev.time_label)},`);
        sqlLines.push(`  ${escapeSql(ev.description)},`);
        sqlLines.push(`  ${escapeSql(ev.what_happens)},`);
        sqlLines.push(`  ${escapeSql(ev.what_to_discover)},`);
        sqlLines.push(`  ${escapeSql(ev.clue)},`);
        sqlLines.push(`  ${escapeSql(ev.evidence)},`);
        sqlLines.push(`  ${escapeJson(ev.wrong_answers)},`);
        sqlLines.push(`  ${escapeSql(ev.correct_answer)},`);
        sqlLines.push(`  ${escapeJson(ev.accepted_guesses)},`);
        sqlLines.push(`  ${escapeSql(ev.hint)},`);
        sqlLines.push(`  ${escapeSql(ev.next_event_key)},`);
        sqlLines.push(`  ${ev.is_key_event ? 'true' : 'false'},`);
        sqlLines.push(`  ${escapeJson(ev.dynamic_wording)}`);
        sqlLines.push(`);`);
      }
      sqlLines.push(``);
    }

    const migrationPath = path.join(migrationsDir, part.filename);
    fs.writeFileSync(migrationPath, sqlLines.join('\n'), 'utf8');
    console.log(`✓ Wrote ${part.filename} (${(fs.statSync(migrationPath).size / 1024).toFixed(1)} KB)`);
  }

  console.log('====================================================');
  console.log('GENERATION COMPLETE SUMMARY:');
  console.log(`- Total Stories: ${generatedStories.length}`);
  console.log(`- Total Characters: ${generatedStories.reduce((acc, s) => acc + s.characters.length, 0)}`);
  console.log(`- Total Events: ${generatedStories.reduce((acc, s) => acc + s.events.length, 0)}`);
  console.log(`- Total Clues: ${generatedStories.reduce((acc, s) => acc + s.clues.length, 0)}`);
  console.log(`- Total Dynamic Variations: ${generatedStories.reduce((acc, s) => acc + s.dynamic_wording.intros.length + s.dynamic_wording.reveals.length, 0)}`);
  console.log('====================================================');
}

run().catch((err) => {
  console.error('Fatal error during generation:', err);
  process.exit(1);
});
