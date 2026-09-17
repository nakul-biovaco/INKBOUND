import WebSocket from 'ws';
import assert from 'assert';

const HTTP_URL = 'http://localhost:3001';
const WS_URL = 'ws://localhost:3001/ws';

async function main() {
  console.log('=== TEST: Multiplayer Live Sync, Presence & Genre Selection ===');

  // 1. Host creates room
  console.log('1. Host creates room...');
  const res1 = await fetch(`${HTTP_URL}/api/rooms`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ displayName: 'Sherlock (Host)', avatar: 'detective-1' }),
  });
  assert.equal(res1.status, 201, 'Host create room HTTP status must be 201');
  const hostData = await res1.json();
  const roomCode = hostData.room.joinCode;
  console.log(`Room created: Code=${roomCode}, Default StoryId/Genre=${hostData.room.settings.storyId}`);
  assert.equal(hostData.room.settings.storyId, 'all', 'Default genre MUST be "all"');

  // Connect Host WebSocket
  const hostWs = new WebSocket(`${WS_URL}?token=${encodeURIComponent(hostData.token)}`);
  const hostEvents = [];
  hostWs.on('message', (raw) => {
    const parsed = JSON.parse(raw.toString());
    hostEvents.push(parsed);
  });

  await new Promise((resolve) => hostWs.on('open', resolve));
  console.log('Host WebSocket connected successfully.');

  // Give 100ms for initial room state
  await new Promise((r) => setTimeout(r, 100));

  // 2. Player 2 joins room
  console.log('2. Player 2 joins room via REST...');
  const res2 = await fetch(`${HTTP_URL}/api/rooms/${roomCode}/join`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ displayName: 'Watson', avatar: 'detective-2' }),
  });
  assert.equal(res2.status, 200, 'Player 2 join HTTP status must be 200');
  const p2Data = await res2.json();
  console.log(`Player 2 joined via REST: ID=${p2Data.player.playerId}`);

  // Connect Player 2 WebSocket with session token
  const p2Ws = new WebSocket(`${WS_URL}?token=${encodeURIComponent(p2Data.token)}`);
  const p2Events = [];
  p2Ws.on('message', (raw) => {
    const parsed = JSON.parse(raw.toString());
    p2Events.push(parsed);
  });

  await new Promise((resolve) => p2Ws.on('open', resolve));
  console.log('Player 2 WebSocket connected successfully.');

  // Wait for real-time presence broadcast
  await new Promise((r) => setTimeout(r, 300));

  // Verify Host received Player 2's join
  const pJoinedHost = hostEvents.find((e) => e.event === 'PLAYER_JOINED');
  console.log('Checking if Host received PLAYER_JOINED event...');
  assert.ok(pJoinedHost, 'Host WebSocket MUST receive PLAYER_JOINED event when Player 2 connects');
  assert.equal(pJoinedHost.payload.player.displayName, 'Watson');
  console.log('✓ Host received PLAYER_JOINED for Watson!');

  // Verify Player 2 received ROOM_STATE containing both players
  const p2RoomState = p2Events.find((e) => e.event === 'ROOM_STATE');
  assert.ok(p2RoomState, 'Player 2 WebSocket MUST receive ROOM_STATE on connect');
  assert.equal(p2RoomState.payload.room.players.length, 2, 'Player 2 ROOM_STATE must have 2 players');
  console.log('✓ Player 2 received ROOM_STATE with 2 players!');

  // 3. Host updates case genre to 'horror'
  console.log('3. Host changes genre to "horror"...');
  hostWs.send(
    JSON.stringify({
      event: 'UPDATE_SETTINGS',
      payload: {
        settings: {
          selectedCaseId: 'horror',
        },
      },
      timestamp: Date.now(),
    })
  );

  await new Promise((r) => setTimeout(r, 200));

  // Verify both players receive updated ROOM_STATE with horror
  const latestHostRoomState = hostEvents.filter((e) => e.event === 'ROOM_STATE').pop();
  assert.equal(latestHostRoomState.payload.room.settings.storyId, 'horror');

  const latestP2RoomState = p2Events.filter((e) => e.event === 'ROOM_STATE').pop();
  assert.equal(latestP2RoomState.payload.room.settings.storyId, 'horror');
  console.log('✓ Both players received updated ROOM_STATE with horror genre!');

  // 4. Start Game
  console.log('4. Host starts game with horror genre...');
  hostWs.send(
    JSON.stringify({
      event: 'START_GAME',
      payload: {
        storyId: 'horror',
      },
      timestamp: Date.now(),
    })
  );

  // Wait for COUNTDOWN and STORY_SELECTION
  await new Promise((r) => setTimeout(r, 1200));

  const chooserEvent = hostEvents.find((e) => e.event === 'STORY_CHOOSER_SELECTED') ||
                       p2Events.find((e) => e.event === 'STORY_CHOOSER_SELECTED');
  assert.ok(chooserEvent, 'Game MUST broadcast STORY_CHOOSER_SELECTED');
  const chooserId = chooserEvent.payload.chooserPlayerId;
  console.log(`✓ Story Chooser selected: ${chooserEvent.payload.chooserName} (${chooserId})`);

  // Verify STORY_OPTIONS was sent to chooser
  const chooserWs = chooserId === hostData.hostPlayer.playerId ? hostWs : p2Ws;
  const chooserEvents = chooserId === hostData.hostPlayer.playerId ? hostEvents : p2Events;
  const otherEvents = chooserId === hostData.hostPlayer.playerId ? p2Events : hostEvents;

  const storyOptionsEvent = chooserEvents.find((e) => e.event === 'STORY_OPTIONS');
  assert.ok(storyOptionsEvent, 'Chooser MUST receive STORY_OPTIONS');
  assert.equal(storyOptionsEvent.payload.options.length, 3, 'Must receive 3 dynamic story options');
  console.log('Story options offered:', storyOptionsEvent.payload.options.map((o) => `[${o.title} - ${o.genre}]`));

  // Verify other player did NOT leak options
  const leakedOptions = otherEvents.find((e) => e.event === 'STORY_OPTIONS');
  assert.equal(leakedOptions, undefined, 'Non-chooser MUST NOT receive secret STORY_OPTIONS');
  console.log('✓ Non-chooser did NOT leak secret story options!');

  // 5. Chooser selects story
  const chosenStory = storyOptionsEvent.payload.options[0];
  console.log(`5. Chooser selects story: "${chosenStory.title}" (${chosenStory.storyId})`);
  chooserWs.send(
    JSON.stringify({
      event: 'CHOOSE_STORY',
      payload: { storyId: chosenStory.storyId },
      timestamp: Date.now(),
    })
  );

  await new Promise((r) => setTimeout(r, 300));

  const hostStorySelected = hostEvents.find((e) => e.event === 'STORY_SELECTED');
  const p2StorySelected = p2Events.find((e) => e.event === 'STORY_SELECTED');
  assert.ok(hostStorySelected, 'Host MUST receive STORY_SELECTED');
  assert.ok(p2StorySelected, 'Player 2 MUST receive STORY_SELECTED');
  assert.equal(hostStorySelected.payload.storyId, chosenStory.storyId);
  assert.equal(p2StorySelected.payload.storyId, chosenStory.storyId);
  console.log(`✓ STORY_SELECTED received by all players: "${hostStorySelected.payload.title}"`);

  hostWs.close();
  p2Ws.close();

  console.log('\n=== ALL MULTIPLAYER LIVE SYNC & GENRE SELECTION TESTS PASSED! ===\n');
  process.exit(0);
}

main().catch((err) => {
  console.error('Test failed:', err);
  process.exit(1);
});
