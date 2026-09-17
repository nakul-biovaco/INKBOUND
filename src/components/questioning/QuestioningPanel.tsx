import React, { useState } from 'react';
import { AuthoritativeGameState, QuestionType } from '../../types/game';
import { Player } from '../../types/player';

interface QuestioningPanelProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
}

interface QuestionItem {
  id: string;
  senderName: string;
  targetName: string;
  questionType: QuestionType;
  questionText: string;
  timeAgo: string;
}

export const QuestioningPanel: React.FC<QuestioningPanelProps> = ({
  gameState,
  currentUser,
}) => {
  const [selectedType, setSelectedType] = useState<QuestionType>('WHO');
  const otherPlayers = gameState.players.filter((p) => p.id !== currentUser.id);
  const [targetPlayerId, setTargetPlayerId] = useState<string>(
    otherPlayers[0]?.id || ''
  );
  const [questionInput, setQuestionInput] = useState<string>('');
  const [questionsList, setQuestionsList] = useState<QuestionItem[]>([]);

  const questionTypes: QuestionType[] = ['WHO', 'WHAT', 'WHERE', 'WHEN', 'HOW', 'WHY'];

  const handleSend = (e: React.FormEvent) => {
    e.preventDefault();
    if (!questionInput.trim()) return;

    const target = gameState.players.find((p) => p.id === targetPlayerId);

    const newQ: QuestionItem = {
      id: `q-${Date.now()}`,
      senderName: currentUser.nickname,
      targetName: target?.nickname || 'Detective',
      questionType: selectedType,
      questionText: questionInput.trim(),
      timeAgo: 'Just now',
    };

    setQuestionsList([newQ, ...questionsList]);
    setQuestionInput('');
  };

  return (
    <div className="w-full bg-[#121622]/90 border border-slate-700/80 rounded-2xl p-6 shadow-2xl space-y-6 select-none max-w-2xl mx-auto">
      {/* 1. Header & Type Pills */}
      <div>
        <h3 className="text-sm font-mono uppercase tracking-wider text-slate-400 mb-3">
          Ask a Teammate
        </h3>

        {/* Category Buttons: [Who?] [What?] [Where?] [When?] [How?] [Why?] */}
        <div className="flex flex-wrap items-center gap-2 mb-2">
          {questionTypes.map((qType) => {
            const isSelected = selectedType === qType;
            return (
              <button
                key={qType}
                type="button"
                onClick={() => setSelectedType(qType)}
                className={`px-4 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  isSelected
                    ? 'bg-sky-600 text-white shadow-[0_0_10px_rgba(2,132,199,0.5)]'
                    : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                }`}
              >
                {qType.charAt(0) + qType.slice(1).toLowerCase()}?
              </button>
            );
          })}
        </div>

        <p className="text-xs text-slate-400">
          Ask a player a question (they'll answer with a drawing)
        </p>
      </div>

      {/* 2. Ask Form */}
      <form onSubmit={handleSend} className="space-y-4">
        {/* Target Detective Dropdown */}
        <div className="flex items-center gap-2 text-xs">
          <span className="text-slate-300 font-medium">Ask</span>
          <select
            value={targetPlayerId}
            onChange={(e) => setTargetPlayerId(e.target.value)}
            className="py-1.5 px-3 bg-slate-900 border border-slate-700 rounded-xl text-white outline-none focus:border-sky-500 font-medium"
          >
            {otherPlayers.map((p) => (
              <option key={p.id} value={p.id}>
                {p.nickname}
              </option>
            ))}
          </select>
        </div>

        {/* Question Text Input */}
        <div>
          <input
            type="text"
            value={questionInput}
            onChange={(e) => setQuestionInput(e.target.value)}
            placeholder="Type your question for them..."
            className="w-full py-3 px-4 bg-slate-900 border border-slate-700 rounded-xl text-white placeholder-slate-500 text-sm outline-none focus:border-sky-500"
          />
        </div>

        {/* Send Question Red Button */}
        <button
          type="submit"
          className="w-full py-3 rounded-xl bg-gradient-to-r from-red-700 via-red-600 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-bold text-xs uppercase tracking-wider shadow-[0_3px_15px_rgba(220,38,38,0.4)] transition-all"
        >
          Send Question
        </button>
      </form>

      {/* 3. Recent Questions List */}
      <div className="pt-4 border-t border-slate-800 space-y-3">
        <h4 className="text-xs font-mono uppercase tracking-wider text-slate-400">
          Recent Questions
        </h4>

        <div className="space-y-2.5">
          {questionsList.map((q) => (
            <div
              key={q.id}
              className="flex items-center justify-between p-3 rounded-xl bg-slate-900/60 border border-slate-800 text-xs"
            >
              <div className="flex items-center gap-3">
                <div className="w-7 h-7 rounded-full bg-slate-800 border border-slate-600 flex items-center justify-center font-bold text-slate-300">
                  {q.senderName.charAt(0)}
                </div>
                <div>
                  <span className="font-semibold text-white mr-2">{q.senderName}</span>
                  <span className="text-slate-300">{q.questionText}</span>
                </div>
              </div>

              <span className="text-[10px] font-mono text-slate-500">{q.timeAgo}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
