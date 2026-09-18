import React, { useState } from 'react';
import { HelpCircle, Send } from 'lucide-react';
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

const parchmentStyle: React.CSSProperties = {
  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
  backgroundSize: '16px 16px, 100% 100%',
};

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
    <div
      className="w-full border-2 border-[#8c6d48] rounded-3xl p-6 sm:p-7 shadow-xl space-y-6 select-none max-w-2xl mx-auto text-[#221711] relative overflow-hidden"
      style={parchmentStyle}
    >
      <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute -top-1.5 left-7 w-3.5 h-7 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

      {/* 1. Header & Type Pills */}
      <div>
        <div className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase tracking-wider mb-1">
          <HelpCircle className="w-2.5 h-2.5 text-red-800" /> OFFICIAL INTERROGATION FORM
        </div>
        <h3 className="text-base sm:text-lg font-black text-[#1a110a] font-serif tracking-wide">
          Direct Inquiry Slip
        </h3>

        {/* Category Buttons: [Who?] [What?] [Where?] [When?] [How?] [Why?] */}
        <div className="flex flex-wrap items-center gap-2 my-3">
          {questionTypes.map((qType) => {
            const isSelected = selectedType === qType;
            return (
              <button
                key={qType}
                type="button"
                onClick={() => setSelectedType(qType)}
                className={`px-3.5 py-1.5 rounded-xl text-xs font-mono font-black uppercase tracking-wider transition-all cursor-pointer ${
                  isSelected
                    ? 'bg-red-800 text-white shadow-md border border-red-950 scale-105'
                    : 'bg-[#ede0ce] text-[#4e3725] hover:text-[#1a110a] border border-[#bfa98e]'
                }`}
              >
                {qType.charAt(0) + qType.slice(1).toLowerCase()}?
              </button>
            );
          })}
        </div>

        <p className="text-xs text-[#5c4028] font-mono">
          Dispatch an official inquiry to a teammate (they will sketch their answer).
        </p>
      </div>

      {/* 2. Ask Form */}
      <form onSubmit={handleSend} className="space-y-4">
        {/* Target Detective Dropdown */}
        <div className="flex items-center gap-2 text-xs font-mono">
          <span className="text-[#3e2b1b] font-bold">Interrogate:</span>
          <select
            value={targetPlayerId}
            onChange={(e) => setTargetPlayerId(e.target.value)}
            className="py-1.5 px-3 bg-[#ede0ce] border border-[#bfa98e] rounded-xl text-[#1a110a] outline-none font-bold cursor-pointer"
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
            placeholder="Type your official case inquiry..."
            className="w-full py-3 px-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-xl text-[#1a110a] placeholder-[#8c6d48] text-sm outline-none font-serif shadow-inner focus:border-red-800"
          />
        </div>

        {/* Send Question Red Button */}
        <button
          type="submit"
          className="w-full py-3 rounded-xl bg-red-800 hover:bg-red-700 text-white font-mono font-bold text-xs uppercase tracking-wider shadow-md transition-all flex items-center justify-center gap-2 cursor-pointer border border-red-950"
        >
          <Send className="w-3.5 h-3.5" />
          <span>Dispatch Inquiry</span>
        </button>
      </form>

      {/* 3. Recent Questions List */}
      <div className="pt-4 border-t border-[#bfa98e]/80 space-y-3">
        <h4 className="text-xs font-mono font-bold uppercase tracking-wider text-[#7a5839]">
          Dispatched Inquiries Log
        </h4>

        <div className="space-y-2">
          {questionsList.length === 0 ? (
            <div className="text-xs font-mono text-[#8c6d48] italic">No active inquiries dispatched yet.</div>
          ) : (
            questionsList.map((q) => (
              <div
                key={q.id}
                className="flex items-center justify-between p-3 rounded-xl bg-[#fdfbf6] border border-[#b89e7c] text-xs shadow-xs"
              >
                <div className="flex items-center gap-3">
                  <div className="w-7 h-7 rounded-full bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center font-bold text-[#1a110a]">
                    {q.senderName.charAt(0)}
                  </div>
                  <div>
                    <span className="font-bold text-[#1a110a] mr-2">{q.senderName} → {q.targetName}:</span>
                    <span className="text-[#3e2b1b] italic font-serif">"{q.questionText}"</span>
                  </div>
                </div>

                <span className="text-[10px] font-mono text-[#8c6d48] font-bold">{q.timeAgo}</span>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );
};
