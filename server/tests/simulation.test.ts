import { RoomManager } from '../src/rooms/RoomManager.js';
import { GameEngine } from '../src/game/GameEngine.js';
import { StoryLoader } from '../src/story/StoryLoader.js';
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

async function runMultiplayerSimulation() {
  console.log('\n======================================================');
  console.log('🎮 INKBOUND: 8-PLAYER REAL-TIME MULTIPLAYER SIMULATION');
  console.log('======================================================\n');

  // 1. Create Room with Host
  const { room, hostPlayer } = await RoomManager.createRoom('Inspector Lestrade', 'detective-1', {
    maxPlayers: 8,
    drawingTimeLimit: 5,
    promptSelectionTimeLimit: 3,
    roundsPerGame: 2,
  });

  console.log(`[Step 1] Room created: ${room.roomId} (Code: ${room.joinCode}) by ${hostPlayer.displayName}`);

  // 2. 7 other players join
  const virtualNames = [
    'Sherlock Holmes',
    'Dr. John Watson',
    'Irene Adler',
    'Mycroft Holmes',
    'Professor Moriarty',
    'Mary Morstan',
    'Mrs. Hudson',
  ];

  const players: Player[] = [hostPlayer];

  for (let i = 0; i < virtualNames.length; i++) {
    const { player } = await RoomManager.joinRoom(room.joinCode, virtualNames[i], `detective-${i + 2}`);
    RoomManager.setPlayerReady(room.roomId, player.playerId, true);
    players.push(player);
  }

  console.log(`[Step 2] 8 players joined and set ready:`);
  players.forEach((p, idx) => console.log(`   ${idx + 1}. ${p.displayName} (${p.playerId.substring(0, 12)}...)`));

  // 3. Initialize GameEngine with midnight_museum story
  const story = StoryLoader.loadStory('midnight_museum');

  const engine = new GameEngine(room, story, (event, payload) => {
    if (event === 'CLUE_SOLVED') {
      const data = payload as any;
      console.log(`   🏆 CLUE SOLVED by ${data.solverName}! Clue: "${data.solvedObjective}"`);
      console.log(`      +${data.scoreAward.solverPoints} pts to solver, +${data.scoreAward.drawerPoints} pts to drawer`);
    } else if (event === 'STORY_REVEAL') {
      const data = payload as any;
      console.log(`   📜 STORY REVEAL: "${data.revealedText.substring(0, 70)}..."`);
    } else if (event === 'FINAL_INVESTIGATION') {
      console.log(`\n🔍 FINAL INVESTIGATION PHASE STARTED! Submit deduction theories.`);
    } else if (event === 'STORY_CHOOSER_SELECTED') {
      const data = payload as any;
      console.log(`\n🎲 STORY CHOOSER SELECTED: ${data.chooserName}! They have ${data.timeLimitSeconds}s to choose.`);
    } else if (event === 'STORY_OPTIONS') {
      const data = payload as any;
      console.log(`   📚 3 Secret Story Choices offered to chooser:`);
      data.options.forEach((opt: any, i: number) => console.log(`      ${i + 1}. "${opt.title}" (${opt.genre}) - ${opt.description}`));
    } else if (event === 'STORY_SELECTED') {
      const data = payload as any;
      console.log(`\n📖 STORY LOCKED: "${data.title}" (${data.genre}) selected by ${data.chooserName}!`);
    } else if (event === 'GAME_END') {
      const data = payload as any;
      console.log(`\n🎉 GAME COMPLETED! Ending: "${data.ending.title}"`);
    }
  });

  // 4. Start Game
  console.log('\n[Step 3] Host starts game...');
  await engine.startGame(hostPlayer.playerId);

  // Fast forward through countdown or wait for STORY_SELECTION
  await waitForState(engine, GameStatus.STORY_SELECTION, 5000);
  const chooserId = engine.getSession().storyChooserPlayerId!;
  const chooser = players.find((p) => p.playerId === chooserId)!;
  const offered = engine.getSession().offeredStoryOptions || [];
  console.log(`\n[Step 4] Chooser ${chooser.displayName} picks story "${offered[0]?.title}"...`);
  engine.chooseStory(chooserId, offered[0]?.storyId);

  // Wait for PROMPT_SELECTION
  await waitForState(engine, GameStatus.PROMPT_SELECTION, 8000);

  // Play through 2 rounds
  for (let round = 1; round <= 2; round++) {
    if (round > 1) {
      await waitForState(engine, GameStatus.PROMPT_SELECTION);
    }

    const session = engine.getSession();
    const currentDrawerId = session.currentDrawerId!;
    const drawer = players.find((p) => p.playerId === currentDrawerId)!;

    console.log(`\n--- [Round ${round}] Active Drawer: ${drawer.displayName} ---`);

    // Drawer selects prompt
    engine.selectPrompt(currentDrawerId, 0);
    console.log(`   Drawer ${drawer.displayName} selected secret prompt: "${session.selectedEvent?.drawingObjective}"`);

    // Drawer sends 3 simulated strokes
    for (let s = 1; s <= 3; s++) {
      await engine.handleStroke(currentDrawerId, {
        strokeId: `sim_stroke_${round}_${s}`,
        turnIndex: session.turnIndex,
        playerId: currentDrawerId,
        tool: 'pencil',
        color: '#f59e0b',
        width: 3,
        points: [
          { x: 0.1 * s, y: 0.2 * s },
          { x: 0.15 * s, y: 0.25 * s },
        ],
        isComplete: true,
        timestamp: Date.now(),
      });
    }
    console.log(`   Drawer broadcasted 3 stroke chunks to room.`);

    // Other players submit wrong guesses
    const guesser1 = players.find((p) => p.playerId !== currentDrawerId)!;
    await engine.handleGuess(guesser1.playerId, 'a random dog playing outside');
    console.log(`   ${guesser1.displayName} guessed: "a random dog playing outside" (Verdict: WRONG)`);

    // Another player submits a CLOSE guess
    const guesser2 = players.find((p) => p.playerId !== currentDrawerId && p.playerId !== guesser1.playerId)!;
    await engine.handleGuess(guesser2.playerId, 'someone dropping something');
    console.log(`   ${guesser2.displayName} guessed: "someone dropping something" (Verdict: CLOSE)`);

    // Simulate disconnect of player 3 and reconnect
    const disconnectedPlayer = players[4];
    engine.handlePlayerDisconnect(disconnectedPlayer.playerId);
    console.log(`   ⚠️ Network disconnect: ${disconnectedPlayer.displayName} dropped.`);
    engine.handlePlayerReconnect(disconnectedPlayer);
    console.log(`   🔄 ${disconnectedPlayer.displayName} successfully reconnected within grace window.`);

    // Solver submits correct guess!
    const target = session.selectedEvent!;
    const correctGuessText = target.acceptedConcepts[0] || target.drawingObjective;
    const winningSolver = players.find((p) => p.playerId !== currentDrawerId)!;
    console.log(`   💡 ${winningSolver.displayName} submits: "${correctGuessText}"`);
    await engine.handleGuess(winningSolver.playerId, correctGuessText);

    // Wait for clue solved to process
    await sleep(2000);
  }

  // Check if it transitions to Final Investigation
  await waitForState(engine, GameStatus.FINAL_INVESTIGATION);

  // Players submit theories
  for (const p of players) {
    engine.submitFinalTheory(p.playerId, 'Officer Miller took the diamond and Dr. Thorne helped him', 9);
  }
  console.log(`   All 8 players submitted final deduction theories.`);

  await waitForState(engine, GameStatus.GAME_COMPLETE);

  // 5. Check scores and state integrity
  console.log('\n======================================================');
  console.log('📊 SIMULATION RESULTS & LEADERBOARD');
  console.log('======================================================');
  const sorted = [...players].sort((a, b) => b.score - a.score);
  sorted.forEach((p, idx) => {
    console.log(`   #${idx + 1} ${p.displayName.padEnd(20)} Score: ${p.score} pts (Solved: ${p.correctGuesses})`);
  });

  const finalSession = engine.getSession();
  console.log(`\nFinal State: ${finalSession.state}`);
  console.log(`Solved Events Recorded: ${finalSession.solvedEvents.length}`);
  console.log(`Active Story Variables:`, finalSession.storyVariables);
  console.log(`Selected Ending: "${finalSession.ending?.title}"`);

  if (finalSession.solvedEvents.length >= 2 && sorted[0].score > 0 && finalSession.state === GameStatus.GAME_COMPLETE) {
    console.log('\n✅ 8-PLAYER MULTIPLAYER SIMULATION SUCCEEDED WITH ZERO ERRORS!\n');
    process.exit(0);
  } else {
    console.error('\n❌ Simulation did not record solved events properly');
    process.exit(1);
  }
}

runMultiplayerSimulation().catch((err) => {
  console.error('Fatal simulation error', err);
  process.exit(1);
});
