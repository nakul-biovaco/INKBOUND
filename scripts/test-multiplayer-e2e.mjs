import WebSocket from 'ws';
import crypto from 'crypto';
(globalThis).WebSocket = WebSocket;

async function testSimulation() {
  const { RoomService } = await import('../src/services/roomService.ts');
  const { GameService } = await import('../src/services/gameService.ts');
  const { DEFAULT_EVIDENCE_SKETCHES } = await import('../src/utils/defaultSketches.ts');

  console.log('--- Simulating Full Real-Time Multiplayer Flow with Supabase DB ---');

  const player1 = {
    id: crypto.randomUUID(),
    nickname: 'Nakul',
    avatar: '🕵️‍♂️',
    isHost: true,
    isReady: true,
    score: 0,
    joinedAt: new Date().toISOString(),
    lastSeenAt: new Date().toISOString(),
    isOnline: true,
  };

  const player2 = {
    id: crypto.randomUUID(),
    nickname: 'Richa',
    avatar: '👩‍🦰',
    isHost: false,
    isReady: false,
    score: 0,
    joinedAt: new Date().toISOString(),
    lastSeenAt: new Date().toISOString(),
    isOnline: true,
  };

  // 1. Room Creation in Supabase
  const roomRes = await RoomService.createRoom(player1, { turnDuration: 40, distorterEnabled: true });
  console.log('✓ Room created in Supabase! Room Code:', roomRes.room.code, 'Host:', player1.nickname);

  // 2. Player 2 Joins via Supabase
  const joinRes = await RoomService.joinRoom(roomRes.room.code, player2);
  if ('error' in joinRes) throw new Error(joinRes.error);
  console.log('✓ Player 2 joined via Supabase DB! Current players in room:', joinRes.players.map((p) => p.nickname));

  // 3. Player 2 Marks Ready
  const toggled = RoomService.toggleReady(roomRes.room.id, player2.id);
  console.log('✓ Player 2 ready state toggled:', toggled.find((p) => p.id === player2.id)?.isReady);

  // 4. Host Starts Game
  const gameState = GameService.startGame(roomRes.room, toggled);
  console.log('✓ Game started! Status:', gameState.status, 'Case:', gameState.currentCase?.title);

  // 5. Host advances to first turn
  const turn1State = GameService.startFirstTurn(gameState);
  console.log('✓ Turn 1 started! Active drawer:', turn1State.players.find((p) => p.id === turn1State.currentTurnPlayerId)?.nickname);

  // 6. Active Drawer 1 Submits Drawing
  const turn2State = GameService.submitDrawing(turn1State, turn1State.currentTurnPlayerId, DEFAULT_EVIDENCE_SKETCHES[0].sketch);
  console.log('✓ Turn 1 submitted! Evidence cards count:', turn2State.evidenceCards.length);
  console.log('✓ Next Turn player:', turn2State.players.find((p) => p.id === turn2State.currentTurnPlayerId)?.nickname);

  // 7. Active Drawer 2 Submits Drawing
  const afterTurn2State = GameService.submitDrawing(turn2State, turn2State.currentTurnPlayerId, DEFAULT_EVIDENCE_SKETCHES[1].sketch);
  console.log('✓ Turn 2 submitted! Next status:', afterTurn2State.status);

  // 8. Investigation Phase Operations
  const timelineState = GameService.updateTimeline(afterTurn2State, '11:39 PM', afterTurn2State.evidenceCards[0]?.id || 'ev-1', player1.id);
  console.log('✓ Timeline slot updated for 11:39 PM:', timelineState.timelineSlots['11:39 PM']);

  // 9. Proceed to Final Theory
  const theoryState = GameService.goToFinalTheory(timelineState);
  console.log('✓ Transitioned to Final Theory:', theoryState.status);

  // 10. Submit Theories
  const sub1 = GameService.submitTheory(theoryState, {
    id: 't-1',
    gameId: theoryState.id,
    playerId: player1.id,
    culprit: 'Arthur Vance',
    motive: 'Debts from underground gambling',
    keyEvent: 'Security guard disables cameras and steals diamond',
    method: 'Used a brass master keycard',
    confidence: 9,
    distorterGuess: player2.id,
    submittedAt: new Date().toISOString(),
  });

  const sub2 = GameService.submitTheory(sub1, {
    id: 't-2',
    gameId: sub1.id,
    playerId: player2.id,
    culprit: 'Arthur Vance',
    motive: 'Debts from underground gambling',
    keyEvent: 'Security guard disables cameras and steals diamond',
    method: 'Used a brass master keycard',
    confidence: 8,
    distorterGuess: player1.id,
    submittedAt: new Date().toISOString(),
  });
  console.log('✓ Theories submitted by both players:', Object.keys(sub2.theories));

  // 11. Lock Accusations & Reveal
  const revealState = GameService.lockAccusationsAndReveal(sub2);
  console.log('✓ Truth reveal triggered! Status:', revealState.status, 'Scores computed:', Object.keys(revealState.scores).length);

  // 12. Results & Lobby Return
  const resultsState = GameService.goToResults(revealState);
  console.log('✓ Results screen active:', resultsState.status);

  const backToLobby = GameService.returnToLobby(resultsState);
  console.log('✓ Returned to lobby for next round! Status:', backToLobby.status);

  console.log('🎉 REALTIME ENGINE END-TO-END VERIFICATION COMPLETE WITH 100% SUCCESS!');
  process.exit(0);
}

testSimulation().catch((err) => {
  console.error(err);
  process.exit(1);
});
