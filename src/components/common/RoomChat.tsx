import React, { useState, useEffect, useRef } from 'react';
import { MessageSquare, Send, Maximize2, FileText } from 'lucide-react';
import { Player } from '../../types/player';
import { RoomChannelManager } from '../../realtime/roomChannel';
import { BackendClient } from '../../realtime/backendClient';
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

  const messagesContainerRef = useRef<HTMLDivElement>(null);

  // Auto-scroll to bottom of chat box only (never scroll the whole page)
  useEffect(() => {
    if (messagesContainerRef.current) {
      messagesContainerRef.current.scrollTop = messagesContainerRef.current.scrollHeight;
    }
  }, [messages, gameLogs, activeTab]);

  // Subscribe to realtime channel broadcasts & backend socket events
  useEffect(() => {
    const unsubBackend = BackendClient.getInstance().on('CHAT_MESSAGE', (payload: any) => {
      if (payload) {
        setMessages((prev) => {
          if (prev.some((m) => m.id === payload.id)) return prev;
          return [...prev, payload as ChatMessage];
        });
      }
    });

    if (!channel) {
      return () => unsubBackend();
    }

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

    return () => {
      unsubBackend();
      unsubscribe();
    };
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

    try {
      BackendClient.getInstance().sendChatMessage(text);
    } catch {
      // ignore
    }
  };

  return (
    <div
      className={`relative border-2 border-[#8c6d48] rounded-2xl shadow-[0_12px_35px_rgba(0,0,0,0.5),inset_0_0_50px_rgba(139,94,60,0.18)] flex flex-col overflow-hidden text-[13px] sm:text-xs text-[#221711] select-none ${className}`}
      style={{
        background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
        backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
        backgroundSize: '16px 16px, 100% 100%',
      }}
    >
      {/* Corner Decorative Accents */}
      <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute bottom-1.5 left-1.5 w-3 h-3 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
      <div className="absolute bottom-1.5 right-1.5 w-3 h-3 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

      {/* Vintage Brass Paperclip */}
      <div className="absolute -top-1.5 left-6 w-3.5 h-7 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none flex items-center justify-center bg-[#d1b89d]/30" />

      {/* 1. CHAT HEADER */}
      <div className="px-4 py-2.5 border-b border-[#bfa98e]/80 flex items-center justify-between gap-3 bg-[#ede1cf]/50">
        {showTabs ? (
          <div className="flex items-center gap-3 sm:gap-4 overflow-x-auto">
            <button
              onClick={() => setActiveTab('chat')}
              className={`font-mono font-bold tracking-wider text-xs transition-colors cursor-pointer ${
                activeTab === 'chat'
                  ? 'text-[#1a110a] border-b-2 border-red-800 pb-0.5'
                  : 'text-[#7a5e45] hover:text-[#1a110a]'
              }`}
            >
              {defaultTab === 'Discussion' ? 'INTERROGATION DISCUSSION' : 'ROOM CHAT'}
            </button>
            <button
              onClick={() => setActiveTab('log')}
              className={`font-mono font-bold tracking-wider text-xs transition-colors cursor-pointer ${
                activeTab === 'log'
                  ? 'text-[#1a110a] border-b-2 border-red-800 pb-0.5'
                  : 'text-[#7a5e45] hover:text-[#1a110a]'
              }`}
            >
              INVESTIGATION LOG
            </button>
          </div>
        ) : (
          <div className="flex items-center gap-2">
            <MessageSquare className="w-3.5 h-3.5 text-red-800" />
            <span className="font-mono font-bold text-xs uppercase tracking-wider text-[#1a110a]">
              Telegraph Dispatch
            </span>
          </div>
        )}

        <button className="text-[#7a5e45] hover:text-[#1a110a] transition-colors p-1 cursor-pointer" title="Expand Ledger">
          <Maximize2 className="w-3.5 h-3.5" />
        </button>
      </div>

      {/* 2. MESSAGE STREAM / LOG STREAM */}
      <div
        ref={messagesContainerRef}
        className="flex-1 p-3.5 overflow-y-auto space-y-3 max-h-[42vh] sm:max-h-72 select-text overscroll-contain"
      >
        {activeTab === 'chat' ? (
          messages.length === 0 ? (
            <div className="text-center py-8 text-[#8c745c] font-mono text-xs italic">
              Dispatch log is quiet. Send an interrogation dispatch below...
            </div>
          ) : (
            messages.map((msg) => (
              <div key={msg.id} className="flex items-start gap-2.5 leading-snug">
                {/* Circular Avatar */}
                <AvatarBadge avatar={msg.senderAvatar} size="xs" className="flex-shrink-0 mt-0.5 ring-1 ring-[#8c6d48]" />

                {/* Message Details */}
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 mb-0.5">
                    <span className="font-bold text-[#1a110a] text-[11px] font-mono truncate">
                      {msg.senderName}
                    </span>
                    <span className="text-[10px] text-[#785b42] font-mono">
                      {msg.timestamp}
                    </span>
                  </div>
                  <div className="text-[12px] text-[#2b1e15] font-sans font-medium break-words leading-tight bg-[#fffdf9]/70 border border-[#cbb8a2]/70 rounded-lg px-2.5 py-1.5 shadow-sm inline-block max-w-full">
                    {msg.text}
                  </div>
                </div>
              </div>
            ))
          )
        ) : (
          <div className="space-y-2 text-[11px] font-mono text-[#443020]">
            {gameLogs.map((log, i) => (
              <div key={i} className="flex items-center gap-1.5 text-[#443020] bg-[#fffdf9]/60 px-2 py-1 rounded border border-[#d1c1ad]">
                <FileText className="w-3 h-3 text-red-800 flex-shrink-0" />
                <span>{log}</span>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* 3. INPUT BAR */}
      {activeTab === 'chat' && (
        <form
          onSubmit={handleSend}
          className="p-2.5 border-t border-[#bfa98e]/80 flex items-center gap-2 bg-[#ede1cf]/60 flex-wrap sm:flex-nowrap"
        >
          <input
            type="text"
            value={inputVal}
            onChange={(e) => setInputVal(e.target.value)}
            placeholder="Type a telegraph dispatch..."
            className="flex-1 min-w-0 bg-[#fdfbf6] border-2 border-[#b89e7c] focus:border-red-800 rounded-xl px-3 py-2 text-sm sm:text-xs text-[#1a110a] placeholder-[#8a725b] outline-none font-mono shadow-inner transition-all"
          />
          <button
            type="submit"
            disabled={!inputVal.trim()}
            className="p-2.5 rounded-xl bg-red-800 hover:bg-red-700 disabled:opacity-40 disabled:hover:bg-red-800 text-white transition-all shadow-md shrink-0 cursor-pointer"
          >
            <Send className="w-3.5 h-3.5" />
          </button>
        </form>
      )}
    </div>
  );
};
