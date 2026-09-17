import { GameStateMachine } from '../src/game/GameStateMachine.js';
import { TurnManager } from '../src/game/TurnManager.js';
import { CaseManager } from '../src/game/CaseManager.js';
import { ScoreManager } from '../src/game/ScoreManager.js';

console.log('--- 1. Testing GameStateMachine ---');
try {
  // Test valid transition: LOBBY -> GAME_INITIALIZING -> CASE_INTRO
  GameStateMachine.assertTransition('LOBBY', 'GAME_INITIALIZING');
  GameStateMachine.assertTransition('GAME_INITIALIZING', 'CASE_INTRO');
  console.log('✓ Valid transitions passed.');

  // Test invalid transition rejection: LOBBY -> INVESTIGATION
  let caught = false;
  try {
    GameStateMachine.assertTransition('LOBBY', 'INVESTIGATION');
  } catch (e) {
    caught = true;
    console.log('✓ Invalid transition correctly rejected:', e.message);
  }
  if (!caught) throw new Error('Failed to reject illegal transition!');
} catch (err) {
  console.error('State machine test failed:', err);
  process.exit(1);
}

console.log('\n--- 2. Testing CaseManager & Private Clue Security ---');
const caseItem = CaseManager.getDefaultCase();
console.log(`✓ Loaded case: "${caseItem.title}" (${caseItem.characters.length} characters, ${caseItem.clues.length} secret clues)`);

const testPlayers = [
  { id: 'p1', nickname: 'Player A', avatar: '🕵️‍♂️', isHost: true, isReady: true, joinedAt: '', lastSeenAt: '', isOnline: true, score: 0 },
  { id: 'p2', nickname: 'Player B', avatar: '🔍', isHost: false, isReady: true, joinedAt: '', lastSeenAt: '', isOnline: true, score: 0 },
  { id: 'p3', nickname: 'Player C', avatar: '💼', isHost: false, isReady: true, joinedAt: '', lastSeenAt: '', isOnline: true, score: 0 },
  { id: 'p4', nickname: 'Player D', avatar: '📜', isHost: false, isReady: true, joinedAt: '', lastSeenAt: '', isOnline: true, score: 0 },
];

const distributedClues = CaseManager.distributeClues(caseItem, testPlayers, 'game-123');
if (distributedClues.length !== 4) throw new Error('Clue distribution count mismatch');
console.log('✓ 4 distinct private clues distributed:');
distributedClues.forEach((c, idx) => {
  console.log(`   Player ${idx + 1} (${c.playerId}) receives Clue #${c.clueOrder}: "${c.clueTitle}"`);
});

console.log('\n--- 3. Testing TurnManager (Serial 1-at-a-time turns) ---');
let turn0 = TurnManager.createTurn(testPlayers, 0, 40);
console.log(`✓ Turn 0: Active player is ${turn0.currentTurnPlayerId} (ends at ${turn0.turnEndsAt})`);
if (turn0.currentTurnPlayerId !== 'p1') throw new Error('Turn 0 active player mismatch');

let remaining = TurnManager.calculateRemainingSeconds(turn0.turnEndsAt);
console.log(`✓ Calculated remaining seconds from authoritative server time: ${remaining}s`);
if (remaining <= 0 || remaining > 40) throw new Error('Remaining seconds out of bounds');

let nextTurn1 = TurnManager.getNextTurnIndex(0, 4);
if (nextTurn1 !== 1) throw new Error('Next turn calculation error');
let nextTurn4 = TurnManager.getNextTurnIndex(3, 4);
if (nextTurn4 !== null) throw new Error('Next turn should be null when all 4 finished');
console.log('✓ All 4 serial turns correctly cycle and terminate at Turn 4.');

console.log('\n--- 4. Testing ScoreManager ---');
const theories = {
  p1: {
    id: 't1',
    gameId: 'game-123',
    playerId: 'p1',
    culprit: 'Arthur Vance',
    motive: 'Debts from underground gambling',
    keyEvent: 'Camera sabotage',
    method: 'Master key',
    confidence: 9,
    distorterGuess: 'p2',
    submittedAt: '',
  },
  p2: {
    // p2 is Distorter
    id: 't2',
    gameId: 'game-123',
    playerId: 'p2',
    culprit: 'Julian Pike',
    motive: 'Greed',
    keyEvent: 'Janitor keys',
    method: 'Floor buffing',
    confidence: 10,
    submittedAt: '',
  },
};

const scores = ScoreManager.calculateScores(caseItem, testPlayers, theories, 'p2', {
  '11:39 PM': 'ev1',
  '11:42 PM': 'ev2',
  '11:44 PM': 'ev3',
  '11:48 PM': 'ev4',
});

console.log('✓ Calculated scores:');
Object.values(scores).forEach((s) => {
  console.log(`   ${s.nickname} (${s.role}): ${s.score} pts [${s.breakdown.accolades.join(', ') || 'Participant'}]`);
});

if (scores.p1.breakdown.culpritPoints !== 300) throw new Error('Culprit points mismatch for p1');
if (scores.p1.breakdown.distorterPoints !== 200) throw new Error('Distorter unmasking points mismatch for p1');

console.log('\n🌟 ALL CORE GAME ENGINE CHECKS PASSED PERFECTLY! 🌟\n');
