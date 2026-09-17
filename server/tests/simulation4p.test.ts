import { RoomManager } from '../src/rooms/RoomManager.js';
import { GameEngine } from '../src/game/GameEngine.js';
import { StoryLibrary } from '../src/story/StoryLibrary.js';
import { GameStatus, Player } from '../src/types/index.js';

async function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function waitForState(engine: GameEngine, targetState: GameStatus, timeoutMs: number = 15000): Promise<void> {
  const start = Date.now();
  while (engine.getSession().state !== targetState) {
    if (Date.now() - start > timeoutMs) {
      throw new Error(`Timeout waiting for state ${targetState}, current is ${engine.getSession().state}`);
    }
    await sleep(100);
  }
}

export async function run4PlayerSimulation() {
  console.log('\n======================================================');
  console.log('🎮 INKBOUND: 4-PLAYER REAL-TIME MULTIPLAYER SIMULATION');
  console.log('======================================================\n');

  // 1. Create Room with Host
  const { room, hostPlayer } = await RoomManager.createRoom('Arthur Conan Doyle', 'detective-1', {
    maxPlayers: 4,
    drawingTimeLimit: 5,
    promptSelectionTimeLimit: 3,
    roundsPerGame: 2,
  });

  console.log(`[Step 1] Room created: ${room.roomId} (Code: ${room.joinCode}) by ${hostPlayer.displayName}`);

  // 2. 3 other players join (Total 4)
  const names = ['Agatha Christie', 'Edgar Allan Poe', 'G.K. Chesterton'];
  const players: Player[] = [hostPlayer];

  for (let i = 0; i < names.length; i++) {
    const { player } = await RoomManager.joinRoom(room.joinCode, names[i], `detective-${i + 2}`);
    RoomManager.setPlayerReady(room.roomId, player.playerId, true);
    players.push(player);
  }

  console.log(`[Step 2] 4 players ready:`);
  players.forEach((p, idx) => console.log(`   ${idx + 1}. ${p.displayName}`));

  StoryLibrary.ensureInitialized();
  const story = StoryLibrary.getAllStories()[0];

  const engine = new GameEngine(room, story, (event, payload) => {
    if (event === 'STORY_CHOOSER_SELECTED') {
      const data = payload as any;
      console.log(`\n🎲 STORY CHOOSER SELECTED: ${data.chooserName}!`);
    } else if (event === 'STORY_SELECTED') {
      const data = payload as any;
      console.log(`📖 STORY LOCKED: "${data.title}" (${data.genre})!`);
    } else if (event === 'CLUE_SOLVED') {
      const data = payload as any;
      console.log(`   🏆 CLUE SOLVED by ${data.solverName}! Clue: "${data.solvedObjective}"`);
      console.log(`      +${data.scoreAward.solverPoints} pts to solver, +${data.scoreAward.drawerPoints} pts to drawer`);
    } else if (event === 'STORY_REVEAL') {
      const data = payload as any;
      console.log(`   📜 STORY REVEAL: "${data.revealedText.substring(0, 60)}..."`);
    } else if (event === 'FINAL_INVESTIGATION') {
      console.log(`\n🔍 FINAL INVESTIGATION PHASE STARTED!`);
    } else if (event === 'GAME_END') {
      const data = payload as any;
      console.log(`\n🎉 GAME COMPLETED! Ending: "${data.ending.title}"`);
    }
  });

  // 3. Start Game
  console.log('\n[Step 3] Host starts game...');
  await engine.startGame(hostPlayer.playerId);

  // Story Selection phase
  await waitForState(engine, GameStatus.STORY_SELECTION, 5000);
  const chooserId = engine.getSession().storyChooserPlayerId!;
  const offered = engine.getSession().offeredStoryOptions || [];
  console.log(`[Step 4] Chooser picks "${offered[0]?.title}"...`);
  engine.chooseStory(chooserId, offered[0]?.storyId);

  // Play through 2 rounds
  for (let round = 1; round <= 2; round++) {
    await waitForState(engine, GameStatus.PROMPT_SELECTION, 15000);

    const session = engine.getSession();
    const currentDrawerId = session.currentDrawerId!;
    const drawer = players.find((p) => p.playerId === currentDrawerId)!;

    console.log(`\n--- [Round ${round}] Active Drawer: ${drawer.displayName} ---`);
    console.log(`   Drawer received 3 private options.`);

    // Drawer chooses secret prompt
    engine.selectPrompt(currentDrawerId, 0);
    console.log(`   Drawer selected prompt: "${session.selectedEvent?.drawingObjective}"`);

    // Drawer sends 2 strokes
    for (let s = 1; s <= 2; s++) {
      await engine.handleStroke(currentDrawerId, {
        strokeId: `sim4p_${round}_${s}`,
        turnIndex: session.turnIndex,
        playerId: currentDrawerId,
        tool: 'pencil',
        color: '#3b82f6',
        width: 3,
        points: [{ x: 0.2 * s, y: 0.3 * s }, { x: 0.25 * s, y: 0.35 * s }],
        isComplete: true,
        timestamp: Date.now(),
      });
    }
    console.log(`   Canvas strokes broadcast to 3 guessers.`);

    // Guesser 1 wrong guess
    const guesser1 = players.find((p) => p.playerId !== currentDrawerId)!;
    await engine.handleGuess(guesser1.playerId, 'an open window');
    console.log(`   ${guesser1.displayName} guessed: "an open window" (WRONG)`);

    // Solver correct guess
    const target = session.selectedEvent!;
    const winningGuess = target.acceptedConcepts[0] || target.drawingObjective;
    const solver = players.find((p) => p.playerId !== currentDrawerId && p.playerId !== guesser1.playerId)!;
    console.log(`   💡 ${solver.displayName} guessed: "${winningGuess}" (CORRECT)`);
    await engine.handleGuess(solver.playerId, winningGuess);

    await sleep(2000);
  }

  // Final Investigation
  await waitForState(engine, GameStatus.FINAL_INVESTIGATION);
  for (const p of players) {
    engine.submitFinalTheory(p.playerId, 'The mystery has been solved', 10);
  }

  await waitForState(engine, GameStatus.GAME_COMPLETE);

  // Check scores
  console.log('\n======================================================');
  console.log('📊 4-PLAYER SIMULATION RESULTS');
  console.log('======================================================');
  const sorted = [...players].sort((a, b) => b.score - a.score);
  sorted.forEach((p, idx) => {
    console.log(`   #${idx + 1} ${p.displayName.padEnd(25)} Score: ${p.score} pts`);
  });

  const finalSession = engine.getSession();
  console.log(`\nFinal State: ${finalSession.state}`);
  console.log(`Solved Events: ${finalSession.solvedEvents.length}`);

  if (finalSession.solvedEvents.length >= 2 && finalSession.state === GameStatus.GAME_COMPLETE) {
    console.log('\n✅ 4-PLAYER MULTIPLAYER SIMULATION PASSED WITH ZERO ERRORS!\n');
    return true;
  } else {
    throw new Error('Simulation failed to complete all rounds');
  }
}

run4PlayerSimulation().then(() => {
  process.exit(0);
}).catch((err) => {
  console.error('Simulation failed', err);
  process.exit(1);
});
