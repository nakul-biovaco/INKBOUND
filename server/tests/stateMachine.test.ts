import { test } from 'node:test';
import assert from 'node:assert/strict';
import { GameStateMachine } from '../src/game/GameStateMachine.js';
import { GameStatus } from '../src/types/index.js';

test('GameStateMachine: initial state is LOBBY', () => {
  const sm = new GameStateMachine();
  assert.equal(sm.getStatus(), GameStatus.LOBBY);
  assert.equal(sm.isLobby(), true);
});

test('GameStateMachine: permits valid linear game progression', () => {
  const sm = new GameStateMachine();

  assert.equal(sm.transition(GameStatus.COUNTDOWN), GameStatus.COUNTDOWN);
  assert.equal(sm.transition(GameStatus.ROUND_START), GameStatus.ROUND_START);
  assert.equal(sm.transition(GameStatus.PROMPT_SELECTION), GameStatus.PROMPT_SELECTION);
  assert.equal(sm.transition(GameStatus.DRAWING), GameStatus.DRAWING);
  assert.equal(sm.isDrawingActive(), true);

  assert.equal(sm.transition(GameStatus.GUESSING), GameStatus.GUESSING);
  assert.equal(sm.isGuessingActive(), true);

  assert.equal(sm.transition(GameStatus.CLUE_SOLVED), GameStatus.CLUE_SOLVED);
  assert.equal(sm.transition(GameStatus.STORY_REVEAL), GameStatus.STORY_REVEAL);
  assert.equal(sm.transition(GameStatus.NEXT_TURN), GameStatus.NEXT_TURN);
  assert.equal(sm.transition(GameStatus.FINAL_INVESTIGATION), GameStatus.FINAL_INVESTIGATION);
  assert.equal(sm.transition(GameStatus.ENDING), GameStatus.ENDING);
  assert.equal(sm.transition(GameStatus.GAME_COMPLETE), GameStatus.GAME_COMPLETE);
  assert.equal(sm.isGameComplete(), true);
});

test('GameStateMachine: strictly rejects invalid state jumps', () => {
  const sm = new GameStateMachine();
  assert.equal(sm.getStatus(), GameStatus.LOBBY);

  // Jumping directly from LOBBY to DRAWING is illegal
  assert.throws(
    () => {
      sm.transition(GameStatus.DRAWING);
    },
    (err: any) => err.code === 'INVALID_GAME_STATE'
  );

  // Jumping from LOBBY to GAME_COMPLETE is illegal
  assert.throws(
    () => {
      sm.transition(GameStatus.GAME_COMPLETE);
    },
    (err: any) => err.code === 'INVALID_GAME_STATE'
  );
});
