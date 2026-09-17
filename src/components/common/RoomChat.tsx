import React, { useState, useEffect, useRef } from 'react';
import { MessageSquare, Send, Maximize2, FileText } from 'lucide-react';
import { Player } from '../../types/player';
import { RoomChannelManager } from '../../realtime/roomChannel';
import { AvatarBadge } from './AvatarBadge';

export interface ChatMessage {
  id: string;
  senderId: string;
  senderName: string;
  senderAvatar: string;
  timestamp: string;
  text: string;
  isSystem?: boolean;
}

interface RoomChatProps {
  currentUser: Player;
  channel?: RoomChannelManager;
  defaultTab?: 'Room Chat' | 'Game Log' | 'Discussion';
  showTabs?: boolean;
  className?: string;
  initialMessages?: ChatMessage[];
  onSendMessage?: (text: string) => void;
}

export const RoomChat: React.FC<RoomChatProps> = ({
  currentUser,
  channel,
  defaultTab = 'Room Chat',
  showTabs = false,
  className = '',
  initialMessages,
  onSendMessage,
}) => {
  const [activeTab, setActiveTab] = useState<'chat' | 'log'>(
    defaultTab === 'Game Log' ? 'log' : 'chat'
  );
  const [inputVal, setInputVal] = useState('');
  const [messages, setMessages] = useState<ChatMessage[]>(() => {
    if (initialMessages && initialMessages.length > 0) {
      return initialMessages;
    }
    return [];
  });

  const [gameLogs, setGameLogs] = useState<string[]>([
    'Secure investigation channel established',
    'Evidence transmission ready',
  ]);

  const messagesEndRef = useRef<HTMLDivElement>(null);

  // Auto-scroll to bottom on new messages
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages, gameLogs, activeTab]);

  // Subscribe to realtime channel broadcasts
  useEffect(() => {
    if (!channel) return;

    const unsubscribe = channel.subscribeMessages((msg) => {
      if (msg.type === 'CHAT_MESSAGE' && msg.payload) {
        const payload = msg.payload as ChatMessage;
        setMessages((prev) => {
          if (prev.some((m) => m.id === payload.id)) return prev;
          return [...prev, payload];
        });
      } else if (msg.type === 'GAME_LOG' && msg.payload) {
        const payloadObj = msg.payload as { text?: string };
        setGameLogs((prev) => [...prev, String(payloadObj.text || msg.payload)]);
      }
    });

    return () => unsubscribe();
  }, [channel]);

  const handleSend = (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    const text = inputVal.trim();
    if (!text) return;

    const now = new Date();
    const timeString = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

    const newMsg: ChatMessage = {
      id: `chat-${Date.now()}-${Math.random().toString(36).substring(2, 5)}`,
      senderId: currentUser.id,
      senderName: currentUser.nickname,
      senderAvatar: currentUser.avatar,
      timestamp: timeString,
      text,
    };

    setMessages((prev) => [...prev, newMsg]);
    setInputVal('');

    if (onSendMessage) {
      onSendMessage(text);
    }

    if (channel) {
      channel.broadcast('CHAT_MESSAGE', currentUser.id, newMsg);
    }
  };

  return (
    <div
      className={`bg-[#0d121c]/90 border border-slate-700/60 rounded-2xl shadow-2xl backdrop-blur-md flex flex-col overflow-hidden text-[13px] sm:text-xs text-slate-200 ${className}`}
    >
      {/* 1. CHAT HEADER */}
      <div className="px-4 py-3 border-b border-slate-800/80 flex items-center justify-between gap-3">
        {showTabs ? (
          <div className="flex items-center gap-3 sm:gap-4 overflow-x-auto">
            <button
              onClick={() => setActiveTab('chat')}
              className={`font-semibold transition-colors ${
                activeTab === 'chat' ? 'text-white border-b-2 border-red-500 pb-0.5' : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              {defaultTab === 'Discussion' ? 'Discussion' : 'Room Chat'}
            </button>
            <button
              onClick={() => setActiveTab('log')}
              className={`font-semibold transition-colors ${
                activeTab === 'log' ? 'text-white border-b-2 border-red-500 pb-0.5' : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              Game Log
            </button>
          </div>
        ) : (
          <div className="flex items-center gap-2">
            <MessageSquare className="w-4 h-4 text-slate-400" />
            <span className="font-semibold text-white tracking-wide">Room Chat</span>
          </div>
        )}

        <button className="text-slate-400 hover:text-white transition-colors p-1">
          <Maximize2 className="w-3.5 h-3.5" />
        </button>
      </div>

      {/* 2. MESSAGE STREAM / LOG STREAM */}
      <div className="flex-1 p-3.5 overflow-y-auto space-y-3 max-h-[42vh] sm:max-h-72 select-text overscroll-contain">
        {activeTab === 'chat' ? (
          messages.map((msg) => (
            <div key={msg.id} className="flex items-start gap-2.5 leading-snug">
              {/* Circular Avatar */}
              <AvatarBadge avatar={msg.senderAvatar} size="xs" className="flex-shrink-0 mt-0.5" />

              {/* Message Details */}
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-0.5">
                  <span className="font-bold text-white text-[11px] truncate">
                    {msg.senderName}
                  </span>
                  <span className="text-[10px] text-slate-400 font-mono">
                    {msg.timestamp}
                  </span>
                </div>
                <div className="text-[12px] text-slate-300 break-words font-normal leading-tight">
                  {msg.text}
                </div>
              </div>
            </div>
          ))
        ) : (
          <div className="space-y-2 text-[11px] font-mono text-slate-400">
            {gameLogs.map((log, i) => (
              <div key={i} className="flex items-center gap-1.5 text-slate-400">
                <FileText className="w-3 h-3 text-red-500 flex-shrink-0" />
                <span>{log}</span>
              </div>
            ))}
          </div>
        )}
        <div ref={messagesEndRef} />
      </div>

      {/* 3. INPUT BAR */}
      {activeTab === 'chat' && (
        <form
          onSubmit={handleSend}
          className="p-2.5 border-t border-slate-800/80 flex items-center gap-2 bg-[#090d14]/70 flex-wrap sm:flex-nowrap"
        >
          <input
            type="text"
            value={inputVal}
            onChange={(e) => setInputVal(e.target.value)}
            placeholder="Type a message..."
            className="flex-1 min-w-0 bg-[#121824] border border-slate-700/60 rounded-xl px-3 py-2.5 text-sm sm:text-xs text-white placeholder-slate-500 outline-none focus:border-red-500 transition-all"
          />
          <button
            type="submit"
            disabled={!inputVal.trim()}
            className="p-2.5 rounded-xl bg-slate-800/90 hover:bg-red-700 disabled:opacity-40 disabled:hover:bg-slate-800 text-slate-300 hover:text-white transition-all shadow-sm shrink-0"
          >
            <Send className="w-3.5 h-3.5" />
          </button>
        </form>
      )}
    </div>
  );
};
