import { test } from 'node:test';
import assert from 'node:assert/strict';
import { GuessEngine } from '../src/guessing/GuessEngine.js';
const mockEvent = {
    eventId: 'museum_01',
    act: 1,
    sequence: 1,
    eventType: 'DRAW_EVENT',
    drawingObjective: 'A guard secretly hides the diamond',
    visualElements: ['guard', 'diamond', 'hiding', 'drawer'],
    acceptedConcepts: [
        'guard hides diamond',
        'hiding diamond',
        'guard stealing diamond',
        'guard stole diamond',
    ],
    semanticKeywords: ['guard', 'diamond', 'hide', 'steal'],
    hint: 'Someone is hiding something valuable.',
    difficulty: 'EASY',
    narrativeDescription: 'Officer hides the gem',
    consequenceReveal: 'The guard stashed the diamond',
};
test('GuessEngine: Exact match classification', () => {
    const result = GuessEngine.evaluate('A guard secretly hides the diamond', mockEvent);
    assert.equal(result.verdict, 'CORRECT');
    assert.equal(result.confidence, 1.0);
});
test('GuessEngine: Accepted concepts match', () => {
    const result1 = GuessEngine.evaluate('guard hides diamond', mockEvent);
    assert.equal(result1.verdict, 'CORRECT');
    const result2 = GuessEngine.evaluate('guard stealing diamond', mockEvent);
    assert.equal(result2.verdict, 'CORRECT');
});
test('GuessEngine: Semantic keyword overlap match', () => {
    const result = GuessEngine.evaluate('the guard took the diamond and is hiding it', mockEvent);
    assert.equal(result.verdict, 'CORRECT');
    assert.ok(result.confidence >= 0.75);
});
test('GuessEngine: Close guess ("Almost...") evaluation', () => {
    const result = GuessEngine.evaluate('guard walking around', mockEvent);
    assert.equal(result.verdict, 'CLOSE');
    assert.ok(result.confidence >= 0.40 && result.confidence < 0.75);
    assert.ok(result.feedbackMessage?.includes('close'));
});
test('GuessEngine: Completely wrong guess evaluation', () => {
    const result = GuessEngine.evaluate('pepperoni pizza with extra cheese', mockEvent);
    assert.equal(result.verdict, 'WRONG');
    assert.ok(result.confidence < 0.40);
});
test('GuessEngine: Duplicate guess suppression within 2 seconds', async () => {
    const playerId = 'test_player_dup_1';
    const first = await GuessEngine.canSubmitGuess(playerId, 'looking at diamond');
    assert.equal(first.allowed, true);
    const second = await GuessEngine.canSubmitGuess(playerId, 'looking at diamond');
    assert.equal(second.allowed, false);
    assert.equal(second.reason, 'DUPLICATE_GUESS');
});
