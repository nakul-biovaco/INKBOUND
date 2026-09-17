const fs = require('fs');
const path = require('path');

const STORY_DIR = path.resolve(__dirname, '../STORY');

function cleanText(str) {
  if (!str) return '';
  return str.replace(/\r\n/g, '\n').replace(/\*/g, '').trim();
}

function escapeSqlString(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'object') {
    val = JSON.stringify(val);
  }
  // Use dollar quotes or standard single quote escaping
  const escaped = String(val).replace(/'/g, "''");
  return `'${escaped}'`;
}

function parseStoryFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const fileName = path.basename(filePath);
  const stories = [];

  const multiRegex = /(?:^|\n)##\s+(\d{2})\s*—\s*([^\n]+)/g;
  const matches = [];
  let m;
  while ((m = multiRegex.exec(content)) !== null) {
    matches.push({ index: m.index, number: m[1], title: m[2].trim() });
  }

  if (matches.length > 0) {
    for (let i = 0; i < matches.length; i++) {
      const cur = matches[i];
      const next = matches[i + 1];
      const chunk = next ? content.substring(cur.index, next.index) : content.substring(cur.index);
      stories.push(parseChunk(cur.number, cur.title, chunk));
    }
  } else {
    const titleM = content.match(/#\s*(\d{2})\s*—\s*([^\n]+)/);
    const num = titleM ? titleM[1] : fileName.replace(/\D/g, '').substring(0, 2);
    const title = titleM ? titleM[2].trim() : fileName.replace('.md', '');
    stories.push(parseChunk(num, title, content));
  }
  return stories;
}

function parseChunk(num, title, chunk) {
  const genreM = chunk.match(/Genre:\*\*\s*([^\n·\.]+)/i);
  const genre = genreM ? genreM[1].trim() : 'Mystery';

  const diffM = chunk.match(/Difficulty:\*\*\s*([^\n·\.]+)/i);
  let difficulty = 'NORMAL';
  if (diffM) {
    const d = diffM[1].toUpperCase();
    if (d.includes('HARD')) difficulty = 'HARD';
    else if (d.includes('EASY')) difficulty = 'EASY';
    else difficulty = 'NORMAL';
  }

  const hookM = chunk.match(/(?:Hook|One-line hook):\*\*\s*([^\n]+)/i);
  const premiseM = chunk.match(/Premise:\*\*\s*([^\n]+(?:\n[^\n#]+)*)/i);
  const desc = hookM ? hookM[1].trim() : (premiseM ? premiseM[1].trim() : `${title} mystery`);

  // Setting detection
  let setting = 'Classified Location';
  if (num === '01') setting = 'The Kessler Antiquities Museum, 3rd Floor Vault Gallery';
  else if (num === '02') setting = 'The Last Night Express Train, Carriage 4';
  else if (num === '03') setting = 'The Grand Metropolitan Gallery, Wing C';
  else if (num === '04') setting = 'The Cole Family Manor, Sealed Study';
  else if (num === '05') setting = 'Blackwood Police Precinct & Interrogation Cell';
  else if (num === '06') setting = 'Meridian Financial Tower, 42nd Floor';
  else if (num === '07') setting = 'The Highcrest Hotel, Room 404';
  else if (num === '08') setting = 'The Rain-slicked City Outskirts & Highway Route 9';
  else if (num === '09') setting = 'The Hawthorne Summer Cottage & Darkroom';
  else if (num === '10') setting = 'St. Jude University, Old Science Wing, Room 302';
  else if (num === '11') setting = 'Blackwood Hollow Family Estate';
  else if (num === '12') setting = 'Clockwork Tower & Archive Library';
  else if (num === '13') setting = 'The Old Corner Bookstore & Archives';
  else if (num === '14') setting = 'City Central Clock Tower & Transit Hub';
  else if (num === '15') setting = 'Grand Western Railway Station & Platform 7';
  else if (num === '16') setting = 'The Moonlight Ballroom & Grand Theatre';
  else if (num === '17') setting = 'Subway Station Overpass & Platform 2';

  // Cast parsing
  const characters = [];
  const castM = chunk.match(/(?:##\s*CAST|\*\*Cast\*\*)([\s\S]*?)(?:##|---\n|\*\*Events\*\*|\*\*Hidden truth|\*\*CENTRAL CONFLICT)/i);
  if (castM) {
    const castBlock = castM[1];
    const charLines = castBlock.split(/\n(?=(?:-|\*\*)[^\n]+—)/);
    for (const cLine of charLines) {
      const match = cLine.match(/(?:-|\*\*)\s*([^\n—]+?)(?:\s*,\s*(\d+))?\s*—\s*([^\n\*]+)/);
      if (match) {
        const name = match[1].replace(/\*\*/g, '').trim();
        const role = match[3].replace(/\*\*/g, '').trim();
        const alibiM = cLine.match(/(?:Secret|Motivation|Hides|Alibi):\*\s*([^\n]+)/i);
        const alibi = alibiM ? alibiM[1].trim() : `Present during the events of ${title}`;
        let avatar = '👤';
        if (role.toLowerCase().includes('detective') || role.toLowerCase().includes('investigator')) avatar = '🔍';
        else if (role.toLowerCase().includes('guard') || role.toLowerCase().includes('security')) avatar = '🛡️';
        else if (role.toLowerCase().includes('director') || role.toLowerCase().includes('curator')) avatar = '🏛️';
        else if (role.toLowerCase().includes('doctor') || role.toLowerCase().includes('intern')) avatar = '🔬';
        else if (role.toLowerCase().includes('courier') || role.toLowerCase().includes('traveler')) avatar = '🧳';
        else if (role.toLowerCase().includes('dancer') || role.toLowerCase().includes('artist')) avatar = '🎭';
        else if (role.toLowerCase().includes('concierge') || role.toLowerCase().includes('clerk')) avatar = '🛎️';
        characters.push({ name, role, alibi, avatar });
      }
    }
  }

  if (characters.length === 0) {
    characters.push(
      { name: 'Lead Investigator', role: 'Detective', alibi: 'Directing the inquiry', avatar: '🔍' },
      { name: 'Key Witness', role: 'Observer', alibi: 'Present at the scene', avatar: '👤' },
      { name: 'Suspect', role: 'Person of Interest', alibi: 'Claims innocence', avatar: '🕵️' }
    );
  }

  // Truth, Culprit, Motive
  const truthM = chunk.match(/(?:Hidden truth|HIDDEN TRUTH)[^:]*:\*\*\s*([^\n]+(?:\n[^\n#]+)*)/i) ||
                 chunk.match(/(?:Hidden truth|HIDDEN TRUTH)[^:]*:\s*([^\n]+(?:\n[^\n#]+)*)/i);
  const truth = truthM ? truthM[1].replace(/---\s*$/, '').trim() : `The secret truth behind ${title}.`;

  let culprit = characters[characters.length - 1]?.name || 'Unknown Suspect';
  let motive = 'Concealing the truth from the investigators';
  if (num === '01') {
    culprit = 'Dominic Hart';
    motive = 'Extensive gambling debts; swapped the diamond for a replica 6 months prior.';
  } else if (num === '02') {
    culprit = 'Gill';
    motive = 'Terminally ill; seeking restitution for an innocent man imprisoned 15 years ago.';
  } else if (num === '03') {
    culprit = 'Aldous Ferry';
    motive = 'Forcing the museum to publicly acknowledge a decades-old family forgery.';
  } else if (num === '04') {
    culprit = 'Desmond Cole';
    motive = 'Identical twin conspiracy to trigger an inheritance clause.';
  } else if (num === '05') {
    culprit = 'Detective Miller';
    motive = 'Planting evidence to secure a conviction and cover departmental negligence.';
  } else if (num === '06') {
    culprit = 'CFO Warren';
    motive = 'Erasing audit traces of embezzlement before morning trading.';
  } else if (num === '07') {
    culprit = 'The Suppressed Memory of the Space Heater Fire';
    motive = 'Unresolved grief and mistaken guilt over the loss of Teddy.';
  } else if (num === '08') {
    culprit = 'The Crash Memory';
    motive = 'Overcoming coma and accepting the reality of the midnight collision.';
  } else if (num === '09') {
    culprit = 'Forgotten Childhood Trauma';
    motive = 'A deceased sibling erased from family history.';
  } else if (num === '10') {
    culprit = 'Professor Halloway';
    motive = 'Covering up laboratory negligence that caused a student disappearance.';
  } else if (num === '11') {
    culprit = 'The Carbon Monoxide Gas Leak';
    motive = 'Environmental hazard causing collective hallucinatory visions.';
  } else if (num === '12') {
    culprit = 'Future Self Paradox';
    motive = 'Sending warning messages back through time to prevent catastrophe.';
  } else if (num === '13') {
    culprit = 'Grandmother Kavita';
    motive = 'Protective maternal instinct to shield granddaughter from long-distance heartbreak.';
  } else if (num === '14') {
    culprit = 'The Time Loop Synchronicity';
    motive = 'Two souls caught in complementary halves of a shared day.';
  } else if (num === '15') {
    culprit = 'Meenal';
    motive = 'Concealing the missed train telegram due to personal envy.';
  } else if (num === '16') {
    culprit = 'Viktor';
    motive = 'A posthumous farewell dance orchestrating his partner’s closure.';
  } else if (num === '17') {
    culprit = 'Missed Connections';
    motive = 'Hesitation and fear of rejection across the railway platform.';
  }

  // Timeline events
  const timeline = [];
  const eventMatches = chunk.matchAll(/(?:(?:\*\*E|\bE)(\d+)\.|\b(\d+)\.)\s*([^\n\(\*]+)/g);
  let count = 0;
  for (const em of eventMatches) {
    if (count >= 6) break;
    const timeLabel = `Beat 0${count + 1}`;
    const evText = em[3].trim();
    if (evText && !evText.toLowerCase().includes('act ')) {
      timeline.push({ time: timeLabel, event: evText });
      count++;
    }
  }

  if (timeline.length === 0) {
    timeline.push(
      { time: 'Phase 1', event: 'Initial incident discovered' },
      { time: 'Phase 2', event: 'First crucial clue uncovered' },
      { time: 'Phase 3', event: 'The central revelation and resolution' }
    );
  }

  // Evidence
  const evidence = [
    { id: `ev_${num}_1`, title: 'Physical Clue', detail: `Initial physical anomaly found at the scene of ${title}.` },
    { id: `ev_${num}_2`, title: 'Contradictory Statement', detail: 'A testimony that conflicts directly with documented records.' },
    { id: `ev_${num}_3`, title: 'Key Document', detail: 'Paperwork or digital log proving the timeline discrepancies.' },
    { id: `ev_${num}_4`, title: 'The Decisive Proof', detail: `The conclusive piece that exposes the hidden truth of ${title}.` }
  ];

  // Clues
  const clues = timeline.map((t, idx) => ({
    order: idx + 1,
    title: t.time,
    text: t.event
  }));

  const misleading_info = `Early rumors pointed to external intruders, but internal records contradict the surface appearances.`;
  const distorter_objective = `Mislead investigators regarding the timeline sequence and cast suspicion upon innocent witnesses.`;

  const slug = title.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_+|_+$/g, '');
  const id = `story_${num}_${slug}`;

  return {
    id,
    title,
    genre,
    setting,
    description: desc,
    characters,
    truth,
    culprit,
    motive,
    timeline,
    evidence,
    clues,
    misleading_info,
    distorter_objective,
    difficulty
  };
}

function generateSql() {
  const files = fs.readdirSync(STORY_DIR).filter(f => f.endsWith('.md') && !f.startsWith('00_')).sort();
  const allStories = [];

  for (const f of files) {
    const parsed = parseStoryFile(path.join(STORY_DIR, f));
    allStories.push(...parsed);
  }

  let sql = `-- ============================================================================\n`;
  sql += `-- INKBOUND — SEED ALL 17 OFFICIAL CASE FILES (AUTONOMOUS STORY ENGINE)\n`;
  sql += `-- Generated from /STORY markdown files for public.cases table\n`;
  sql += `-- ============================================================================\n\n`;

  for (const s of allStories) {
    sql += `INSERT INTO public.cases (\n`;
    sql += `    id, title, genre, setting, description, characters, truth, culprit, motive,\n`;
    sql += `    timeline, evidence, clues, misleading_info, distorter_objective, difficulty\n`;
    sql += `) VALUES (\n`;
    sql += `    ${escapeSqlString(s.id)},\n`;
    sql += `    ${escapeSqlString(s.title)},\n`;
    sql += `    ${escapeSqlString(s.genre)},\n`;
    sql += `    ${escapeSqlString(s.setting)},\n`;
    sql += `    ${escapeSqlString(s.description)},\n`;
    sql += `    ${escapeSqlString(s.characters)}::jsonb,\n`;
    sql += `    ${escapeSqlString(s.truth)},\n`;
    sql += `    ${escapeSqlString(s.culprit)},\n`;
    sql += `    ${escapeSqlString(s.motive)},\n`;
    sql += `    ${escapeSqlString(s.timeline)}::jsonb,\n`;
    sql += `    ${escapeSqlString(s.evidence)}::jsonb,\n`;
    sql += `    ${escapeSqlString(s.clues)}::jsonb,\n`;
    sql += `    ${escapeSqlString(s.misleading_info)},\n`;
    sql += `    ${escapeSqlString(s.distorter_objective)},\n`;
    sql += `    ${escapeSqlString(s.difficulty)}\n`;
    sql += `) ON CONFLICT (id) DO UPDATE SET\n`;
    sql += `    title = EXCLUDED.title,\n`;
    sql += `    genre = EXCLUDED.genre,\n`;
    sql += `    setting = EXCLUDED.setting,\n`;
    sql += `    description = EXCLUDED.description,\n`;
    sql += `    characters = EXCLUDED.characters,\n`;
    sql += `    truth = EXCLUDED.truth,\n`;
    sql += `    culprit = EXCLUDED.culprit,\n`;
    sql += `    motive = EXCLUDED.motive,\n`;
    sql += `    timeline = EXCLUDED.timeline,\n`;
    sql += `    evidence = EXCLUDED.evidence,\n`;
    sql += `    clues = EXCLUDED.clues,\n`;
    sql += `    misleading_info = EXCLUDED.misleading_info,\n`;
    sql += `    distorter_objective = EXCLUDED.distorter_objective,\n`;
    sql += `    difficulty = EXCLUDED.difficulty;\n\n`;
  }

  // Also include alias for midnight_museum_heist
  sql += `-- Legacy compatibility alias for midnight_museum_heist\n`;
  sql += `INSERT INTO public.cases (\n`;
  sql += `    id, title, genre, setting, description, characters, truth, culprit, motive,\n`;
  sql += `    timeline, evidence, clues, misleading_info, distorter_objective, difficulty\n`;
  sql += `) SELECT 'midnight_museum_heist', title, genre, setting, description, characters, truth, culprit, motive,\n`;
  sql += `         timeline, evidence, clues, misleading_info, distorter_objective, difficulty\n`;
  sql += `  FROM public.cases WHERE id = 'story_01_the_midnight_museum'\n`;
  sql += `  ON CONFLICT (id) DO NOTHING;\n\n`;

  return { sql, count: allStories.length };
}

const res = generateSql();
const outPath = path.resolve(__dirname, '../supabase/migrations/20240102000000_seed_all_17_cases.sql');
fs.writeFileSync(outPath, res.sql, 'utf8');
console.log(`Generated SQL for ${res.count} cases to:`, outPath);
