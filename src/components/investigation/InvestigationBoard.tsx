import React, { useState } from 'react';
import {
  ArrowLeft,
  Search,
  ChevronDown,
  LayoutGrid,
  List,
  Maximize2,
  CheckSquare,
  Square,
  FileText,
  Clock,
  Share2,
  HelpCircle,
  Plus,
  Trash2,
  MessageSquare,
  Link2,
  Sparkles,
  Users,
} from 'lucide-react';
import { AuthoritativeGameState, EvidenceCard } from '../../types/game';
import { Player } from '../../types/player';
import { GameHeader } from '../common/GameHeader';
import { RoomChat } from '../common/RoomChat';
import { AvatarBadge } from '../common/AvatarBadge';
import { DEFAULT_EVIDENCE_SKETCHES } from '../../utils/defaultSketches';
import { RoomChannelManager } from '../../realtime/roomChannel';

interface InvestigationBoardProps {
  gameState: AuthoritativeGameState;
  currentUser: Player;
  roomCode?: string;
  channel?: RoomChannelManager;
  onSlotTimelineEvidence: (slotTime: string, evidenceId: string | null) => void;
  onAddConnection: (fromId: string, toId: string, label: string) => void;
  onProceedToTheory: () => void;
  onLeaveRoom?: () => void;
}

type NavTab = 'Evidence' | 'Timeline' | 'Connections' | 'Question' | 'Notes';

const parchmentStyle: React.CSSProperties = {
  background: 'linear-gradient(135deg, #fbf7ee 0%, #f4ede0 50%, #eae0cc 100%)',
  backgroundImage: `radial-gradient(#b89f80 0.75px, transparent 0.75px), linear-gradient(135deg, #fbf7ee 0%, #f3ebdd 60%, #e8ddc9 100%)`,
  backgroundSize: '16px 16px, 100% 100%',
};

export const InvestigationBoard: React.FC<InvestigationBoardProps> = ({
  gameState,
  currentUser,
  roomCode,
  channel,
  onSlotTimelineEvidence,
  onAddConnection,
  onProceedToTheory,
  onLeaveRoom,
}) => {
  const [activeTab, setActiveTab] = useState<NavTab>('Evidence');
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [selectedCard, setSelectedCard] = useState<EvidenceCard | null>(null);

  // Filter & Search states
  const [searchQuery, setSearchQuery] = useState('');
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [filterCategory, setFilterCategory] = useState<'All' | 'Sketches' | 'Timeline'>('All');
  const [isFilterDropdownOpen, setIsFilterDropdownOpen] = useState(false);

  // Investigation Notes checklist states
  const [checkedItems, setCheckedItems] = useState<Record<string, boolean>>({
    q1: false,
    q2: false,
    q3: false,
    q4: false,
    q5: false,
    q6: false,
  });

  // Custom user notebook text
  const [notebookText, setNotebookText] = useState(
    'Initial findings: Guard was off duty at 11:39 PM. Glass shards found inside display frame, implying an inside job.'
  );
  const [isNoteSaved, setIsNoteSaved] = useState(false);

  // Connections (Red string) builder state
  const [connCardA, setConnCardA] = useState<string>('');
  const [connCardB, setConnCardB] = useState<string>('');
  const [connLabel, setConnLabel] = useState<string>('Suspect Linked');
  const [activeConnections, setActiveConnections] = useState<
    { id: string; from: string; to: string; label: string }[]
  >([]);

  // Interrogations state
  const [interrogatedSuspects, setInterrogatedSuspects] = useState<Record<string, boolean>>({});

  const toggleCheck = (id: string) => {
    setCheckedItems((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  const handleSaveNotes = () => {
    setIsNoteSaved(true);
    setTimeout(() => setIsNoteSaved(false), 2500);
  };

  // Compile evidence cards: display player cards or scene evidence without dummy names
  const evidenceList: {
    id: string;
    order: number;
    author: string;
    avatar: string;
    time: string;
    preview: string;
  }[] = gameState.evidenceCards.length > 0
    ? gameState.evidenceCards.map((card, idx) => ({
        id: card.id,
        order: idx + 1,
        author: card.sourcePlayerName,
        avatar: card.sourcePlayerAvatar,
        time: card.timelineSlot || '11:40 PM',
        preview: card.drawingPreview || '',
      }))
    : DEFAULT_EVIDENCE_SKETCHES.map((item, idx) => ({
        id: item.id,
        order: idx + 1,
        author: item.author,
        avatar: '🔍',
        time: item.time,
        preview: item.sketch,
      }));

  // Filtered evidence based on search & category
  const filteredEvidence = evidenceList.filter((card) => {
    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase();
      const match =
        card.author.toLowerCase().includes(q) ||
        card.time.toLowerCase().includes(q) ||
        `clue #${card.order}`.includes(q);
      if (!match) return false;
    }
    if (filterCategory === 'Timeline') {
      return card.time.includes('11:');
    }
    return true;
  });

  const rosterPlayers: Player[] =
    gameState.players.length > 0 ? gameState.players : [currentUser];

  const isHost = currentUser.id === gameState.roomId || currentUser.isHost || currentUser.id === gameState.players[0]?.id;

  const handleCreateConnection = () => {
    if (!connCardA || !connCardB || connCardA === connCardB) return;
    const fromClue = evidenceList.find((e) => e.id === connCardA);
    const toClue = evidenceList.find((e) => e.id === connCardB);
    if (!fromClue || !toClue) return;

    const newConn = {
      id: `conn-${Date.now()}`,
      from: `Clue #${fromClue.order} (${fromClue.author})`,
      to: `Clue #${toClue.order} (${toClue.author})`,
      label: connLabel,
    };

    setActiveConnections((prev) => [newConn, ...prev]);
    onAddConnection(connCardA, connCardB, connLabel);
    setConnCardA('');
    setConnCardB('');
  };

  const handleRemoveConnection = (id: string) => {
    setActiveConnections((prev) => prev.filter((c) => c.id !== id));
  };

  const timelineSlots = ['11:20 PM', '11:30 PM', '11:40 PM', '11:50 PM', '12:00 AM'];

  const discussionMessages: {
    id: string;
    senderId: string;
    senderName: string;
    senderAvatar: string;
    timestamp: string;
    text: string;
  }[] = [];

  return (
    <div className="relative min-h-screen w-full bg-[#08090d] text-slate-100 flex flex-col justify-between select-none overflow-x-hidden">
      {/* ATMOSPHERIC DETECTIVE DESK BACKGROUND */}
      <div
        className="fixed inset-0 bg-cover bg-center opacity-35 mix-blend-screen pointer-events-none"
        style={{ backgroundImage: `url('/assets/detective_hero_exact.jpg')` }}
      />
      <div className="fixed inset-0 bg-gradient-to-b from-[#08090d]/85 via-[#08090d]/70 to-[#08090d]/95 pointer-events-none" />

      {/* TOP HEADER WITH STEPPER */}
      <div className="relative z-30">
        <GameHeader
          currentUser={currentUser}
          roomCode={roomCode || gameState.roomId.substring(0, 6).toUpperCase()}
          playerCount={rosterPlayers.length}
          maxPlayers={8}
          currentPhase="INVESTIGATION"
          caseTitle={gameState.currentCase?.title || 'The Midnight Museum Heist'}
          roundText="Investigation Board • Physical Docket"
          onLeaveRoom={onLeaveRoom}
        />
      </div>

      {/* MAIN 3-ZONE LAYOUT */}
      <main className="relative z-10 w-full max-w-[1440px] mx-auto px-2 sm:px-6 py-4 flex flex-col lg:flex-row gap-4 items-start">
        {/* ======================================================== */}
        {/* ZONE 1: VERTICAL ON DESKTOP, HORIZONTAL TABS ON MOBILE     */}
        {/* ======================================================== */}
        <div className="w-full lg:w-44 flex flex-row lg:flex-col gap-2 sm:gap-4 flex-shrink-0 items-center lg:items-stretch overflow-x-auto pb-1 lg:pb-0">
          {/* Back button above tabs */}
          <button
            onClick={() => {
              if (activeTab !== 'Evidence') {
                setActiveTab('Evidence');
              } else if (onLeaveRoom) {
                onLeaveRoom();
              }
            }}
            title={activeTab === 'Evidence' ? 'Exit to Headquarters' : 'Return to Evidence Board'}
            className="p-2 sm:p-2.5 w-9 h-9 sm:w-10 sm:h-10 rounded-xl bg-[#fbf7ee] border-2 border-[#8c6d48] text-[#3e2a1b] hover:text-red-800 flex items-center justify-center transition-colors shadow-md cursor-pointer hover:border-red-800 shrink-0"
          >
            <ArrowLeft className="w-4 h-4" />
          </button>

          {/* Tab Navigation (Horizontal bar on mobile, vertical docket on desktop) */}
          <div
            className="relative border-2 border-[#8c6d48] rounded-2xl p-1.5 sm:p-2.5 shadow-xl flex flex-row lg:flex-col gap-1 sm:gap-1.5 text-[#221711] overflow-x-auto flex-1 lg:flex-none"
            style={parchmentStyle}
          >
            <div className="hidden lg:block px-2 py-1 text-[10px] font-mono font-bold uppercase tracking-wider text-[#7a5839] border-b border-[#bfa98e]/70 mb-1">
              FILE DOCKETS
            </div>

            <button
              onClick={() => setActiveTab('Evidence')}
              className={`flex items-center gap-1.5 sm:gap-2.5 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded-xl text-xs font-bold transition-all cursor-pointer whitespace-nowrap shrink-0 lg:w-full ${
                activeTab === 'Evidence'
                  ? 'bg-red-800 text-white shadow-md border border-red-900'
                  : 'text-[#4e3725] hover:text-[#1a110a] hover:bg-[#ede0ce]'
              }`}
            >
              <FileText className={`w-3.5 h-3.5 ${activeTab === 'Evidence' ? 'text-amber-200' : 'text-[#7a5839]'}`} />
              <span>Evidence</span>
            </button>

            <button
              onClick={() => setActiveTab('Timeline')}
              className={`flex items-center gap-1.5 sm:gap-2.5 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded-xl text-xs font-bold transition-all cursor-pointer whitespace-nowrap shrink-0 lg:w-full ${
                activeTab === 'Timeline'
                  ? 'bg-red-800 text-white shadow-md border border-red-900'
                  : 'text-[#4e3725] hover:text-[#1a110a] hover:bg-[#ede0ce]'
              }`}
            >
              <Clock className={`w-3.5 h-3.5 ${activeTab === 'Timeline' ? 'text-amber-200' : 'text-[#7a5839]'}`} />
              <span>Timeline</span>
            </button>

            <button
              onClick={() => setActiveTab('Connections')}
              className={`flex items-center gap-1.5 sm:gap-2.5 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded-xl text-xs font-bold transition-all cursor-pointer whitespace-nowrap shrink-0 lg:w-full ${
                activeTab === 'Connections'
                  ? 'bg-red-800 text-white shadow-md border border-red-900'
                  : 'text-[#4e3725] hover:text-[#1a110a] hover:bg-[#ede0ce]'
              }`}
            >
              <Share2 className={`w-3.5 h-3.5 ${activeTab === 'Connections' ? 'text-amber-200' : 'text-[#7a5839]'}`} />
              <span>Connections</span>
            </button>

            <button
              onClick={() => setActiveTab('Question')}
              className={`flex items-center gap-1.5 sm:gap-2.5 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded-xl text-xs font-bold transition-all cursor-pointer whitespace-nowrap shrink-0 lg:w-full ${
                activeTab === 'Question'
                  ? 'bg-red-800 text-white shadow-md border border-red-900'
                  : 'text-[#4e3725] hover:text-[#1a110a] hover:bg-[#ede0ce]'
              }`}
            >
              <HelpCircle className={`w-3.5 h-3.5 ${activeTab === 'Question' ? 'text-amber-200' : 'text-[#7a5839]'}`} />
              <span>Question</span>
            </button>

            <button
              onClick={() => setActiveTab('Notes')}
              className={`flex items-center gap-1.5 sm:gap-2.5 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded-xl text-xs font-bold transition-all cursor-pointer whitespace-nowrap shrink-0 lg:w-full ${
                activeTab === 'Notes'
                  ? 'bg-red-800 text-white shadow-md border border-red-900'
                  : 'text-[#4e3725] hover:text-[#1a110a] hover:bg-[#ede0ce]'
              }`}
            >
              <FileText className={`w-3.5 h-3.5 ${activeTab === 'Notes' ? 'text-amber-200' : 'text-[#7a5839]'}`} />
              <span>Notes</span>
            </button>
          </div>

          {/* Pinned parchment note at bottom left */}
          <div className="relative hidden lg:block bg-[#fdfbf6] p-4 rounded-xl shadow-xl -rotate-2 border-2 border-[#8c6d48] text-[#2c1d10] font-serif italic text-xs leading-relaxed">
            <div className="w-3.5 h-3.5 rounded-full bg-red-700 absolute -top-1.5 left-1/2 -translate-x-1/2 shadow border border-red-950" />
            "Same drawings. Different perspectives. What is the real truth?"
          </div>
        </div>

        {/* ======================================================== */}
        {/* ZONE 2: CENTER MAIN INVESTIGATION WORKSPACE (8 cols)     */}
        {/* ======================================================== */}
        <div className="flex-1 min-w-0 flex flex-col gap-4">
          {/* TAB 1: EVIDENCE VIEW (DEFAULT) */}
          {activeTab === 'Evidence' && (
            <>
              {/* TOP HALF: EVIDENCE BOARD POLAROIDS */}
              <div
                className="relative border-2 border-[#8c6d48] rounded-3xl p-4 sm:p-5 shadow-xl text-[#221711] overflow-hidden space-y-4 select-none"
                style={parchmentStyle}
              >
                {/* Decorative Paper Elements */}
                <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
                <div className="absolute -top-1.5 left-7 w-3.5 h-7 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

                {/* Evidence Board Header & Filter bar */}
                <div className="flex flex-wrap items-center justify-between gap-3 border-b border-[#bfa98e]/80 pb-3">
                  <div>
                    <div className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase tracking-wider mb-1">
                      <Sparkles className="w-2.5 h-2.5 text-red-800" /> FORENSIC EVIDENCE BOARD
                    </div>
                    <h3 className="text-base sm:text-lg font-black text-[#1a110a] font-serif tracking-wide">
                      Witness Sketches & Scene Artifacts
                    </h3>
                    <p className="text-[11px] text-[#5c4028] font-mono">
                      All drawings from this case round. Look closer. Connect the clues.
                    </p>
                  </div>

                  <div className="flex items-center gap-2 relative">
                    {/* Search toggle */}
                    {isSearchOpen ? (
                      <div className="flex items-center gap-1 bg-[#fdfbf6] border border-[#8c6d48] rounded-xl px-2.5 py-1 shadow-inner">
                        <input
                          type="text"
                          placeholder="Search clues..."
                          value={searchQuery}
                          onChange={(e) => setSearchQuery(e.target.value)}
                          className="bg-transparent text-xs text-[#1a110a] placeholder-[#8c6d48] outline-none w-28 sm:w-36 font-mono"
                          autoFocus
                        />
                        <button
                          onClick={() => {
                            setIsSearchOpen(false);
                            setSearchQuery('');
                          }}
                          className="text-[#8c6d48] hover:text-[#1a110a] text-xs cursor-pointer"
                        >
                          ✕
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => setIsSearchOpen(true)}
                        title="Search Evidence"
                        className="p-2 rounded-xl bg-[#ede0ce] border border-[#bfa98e] text-[#4e3725] hover:text-[#1a110a] transition-colors cursor-pointer shadow-sm"
                      >
                        <Search className="w-3.5 h-3.5" />
                      </button>
                    )}

                    {/* Filter Dropdown */}
                    <div className="relative">
                      <button
                        onClick={() => setIsFilterDropdownOpen(!isFilterDropdownOpen)}
                        className="flex items-center gap-2 px-3 py-1.5 rounded-xl bg-[#ede0ce] border border-[#bfa98e] text-xs text-[#3e2b1b] font-mono font-bold hover:border-[#8c6d48] transition-colors cursor-pointer shadow-sm"
                      >
                        <span>{filterCategory === 'All' ? 'All Evidence' : filterCategory}</span>
                        <ChevronDown className="w-3 h-3 text-[#7a5839]" />
                      </button>

                      {isFilterDropdownOpen && (
                        <div
                          className="absolute right-0 top-10 z-50 border-2 border-[#8c6d48] rounded-xl p-1.5 shadow-2xl min-w-[130px] space-y-1"
                          style={parchmentStyle}
                        >
                          {(['All', 'Sketches', 'Timeline'] as const).map((cat) => (
                            <button
                              key={cat}
                              onClick={() => {
                                setFilterCategory(cat);
                                setIsFilterDropdownOpen(false);
                              }}
                              className={`w-full text-left px-2.5 py-1 text-xs font-mono font-bold rounded-lg cursor-pointer ${
                                filterCategory === cat
                                  ? 'bg-red-800 text-white'
                                  : 'text-[#3e2b1b] hover:bg-[#ede0ce]'
                              }`}
                            >
                              {cat}
                            </button>
                          ))}
                        </div>
                      )}
                    </div>

                    {/* Grid & List View Toggle */}
                    <div className="flex items-center rounded-xl bg-[#ede0ce] border border-[#bfa98e] p-0.5 shadow-inner">
                      <button
                        onClick={() => setViewMode('grid')}
                        className={`p-1.5 rounded-lg cursor-pointer transition-all ${
                          viewMode === 'grid' ? 'bg-red-800 text-white shadow-sm' : 'text-[#7a5839] hover:text-[#1a110a]'
                        }`}
                      >
                        <LayoutGrid className="w-3.5 h-3.5" />
                      </button>
                      <button
                        onClick={() => setViewMode('list')}
                        className={`p-1.5 rounded-lg cursor-pointer transition-all ${
                          viewMode === 'list' ? 'bg-red-800 text-white shadow-sm' : 'text-[#7a5839] hover:text-[#1a110a]'
                        }`}
                      >
                        <List className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  </div>
                </div>

                {/* POLAROIDS (GRID VIEW) */}
                {viewMode === 'grid' ? (
                  <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-3.5 pt-1">
                    {filteredEvidence.map((card) => (
                      <div
                        key={card.id}
                        onClick={() =>
                          setSelectedCard({
                            id: card.id,
                            gameId: gameState.id,
                            drawingId: card.id,
                            sourcePlayerId: card.author,
                            sourcePlayerName: card.author,
                            sourcePlayerAvatar: card.avatar,
                            title: `Clue #${card.order}`,
                            drawingPreview: card.preview,
                            notes: '',
                            tags: [],
                            position: { x: 0, y: 0 },
                            createdAt: '',
                          })
                        }
                        className="relative bg-[#fdfbf6] p-2 pb-3 rounded-xl shadow-md hover:shadow-2xl transition-all cursor-pointer transform hover:-translate-y-1 border-2 border-[#8c6d48] flex flex-col justify-between select-none group"
                      >
                        {/* Red Push Pin on Top */}
                        <div className="w-3.5 h-3.5 rounded-full bg-red-700 absolute -top-2 left-1/2 -translate-x-1/2 shadow-md border border-red-950 z-10" />

                        {/* Card Order Tag */}
                        <div className="text-[10px] font-mono text-[#8c6d48] font-black uppercase tracking-wider mb-1">
                          CLUE #{card.order}
                        </div>

                        {/* Sketch Drawing Box */}
                        <div className="w-full aspect-[4/3] bg-[#fcf8f1] rounded-lg border border-[#b89e7c] overflow-hidden relative flex items-center justify-center shadow-inner">
                          <img
                            src={card.preview}
                            alt={`Clue #${card.order}`}
                            className="w-full h-full object-contain p-1"
                          />
                          <div className="absolute top-1 right-1 opacity-0 group-hover:opacity-100 transition-opacity p-1 bg-black/60 rounded text-white shadow">
                            <Maximize2 className="w-3 h-3" />
                          </div>
                        </div>

                        {/* Card Footer: Author + Time */}
                        <div className="mt-2.5 flex items-center justify-between text-[10px]">
                          <div className="flex items-center gap-1 min-w-0">
                            <AvatarBadge avatar={card.avatar} size="xs" />
                            <span className="font-bold text-[#1a110a] truncate">{card.author}</span>
                          </div>
                          <span className="text-[#8c6d48] font-mono text-[9px] font-bold flex-shrink-0">
                            {card.time}
                          </span>
                        </div>
                      </div>
                    ))}
                  </div>
                ) : (
                  /* LIST VIEW */
                  <div className="space-y-2 pt-1">
                    {filteredEvidence.map((card) => (
                      <div
                        key={card.id}
                        onClick={() =>
                          setSelectedCard({
                            id: card.id,
                            gameId: gameState.id,
                            drawingId: card.id,
                            sourcePlayerId: card.author,
                            sourcePlayerName: card.author,
                            sourcePlayerAvatar: card.avatar,
                            title: `Clue #${card.order}`,
                            drawingPreview: card.preview,
                            notes: '',
                            tags: [],
                            position: { x: 0, y: 0 },
                            createdAt: '',
                          })
                        }
                        className="flex items-center justify-between p-3 rounded-xl bg-[#fdfbf6] border-2 border-[#8c6d48] hover:border-red-800 transition-all cursor-pointer shadow-sm"
                      >
                        <div className="flex items-center gap-3">
                          <div className="w-14 h-11 rounded-lg bg-[#fcf8f1] overflow-hidden flex items-center justify-center border border-[#b89e7c] flex-shrink-0 shadow-inner">
                            <img src={card.preview} alt="Clue" className="w-full h-full object-contain p-0.5" />
                          </div>
                          <div>
                            <div className="text-xs font-black text-[#1a110a] font-serif">Clue #{card.order}</div>
                            <div className="text-[11px] text-[#5c4028] font-mono">
                              Documented by {card.author}
                            </div>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 font-mono text-xs">
                          <span className="text-red-800 font-bold">{card.time}</span>
                          <span className="text-[#8c6d48] font-bold">Inspect →</span>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              {/* BOTTOM HALF: BUILD THE TIMELINE & INVESTIGATION NOTES */}
              <div className="grid grid-cols-1 md:grid-cols-12 gap-4">
                {/* LEFT SPLIT: BUILD THE TIMELINE (7 cols) */}
                <div
                  className="md:col-span-7 border-2 border-[#8c6d48] rounded-3xl p-4 sm:p-5 shadow-xl text-[#221711] overflow-hidden flex flex-col justify-between select-none relative"
                  style={parchmentStyle}
                >
                  <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
                  <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

                  <div>
                    <div className="flex items-center justify-between border-b border-[#bfa98e]/70 pb-2">
                      <div>
                        <h4 className="text-xs sm:text-sm font-black text-[#1a110a] font-serif">
                          Chronological Sequence Ledger
                        </h4>
                        <p className="text-[11px] text-[#5c4028] font-mono mt-0.5">
                          Order evidence along the heist timeline.
                        </p>
                      </div>
                      <button
                        onClick={() => setActiveTab('Timeline')}
                        className="text-xs font-mono text-red-800 hover:text-red-700 font-bold flex items-center gap-1 cursor-pointer"
                      >
                        <span>Full Studio</span>
                        <span>→</span>
                      </button>
                    </div>

                    {/* Horizontal Timeline Axis */}
                    <div className="relative mt-5 mb-3 px-2">
                      <div className="w-full h-[3px] bg-[#8c6d48] relative rounded-full">
                        <div className="absolute left-0 top-1/2 -translate-y-1/2 w-3 h-3 rounded-full bg-[#3e2a1b]" />
                        <div className="absolute left-1/4 top-1/2 -translate-y-1/2 w-3.5 h-3.5 rounded-full bg-red-700 shadow border border-red-950" />
                        <div className="absolute left-2/4 top-1/2 -translate-y-1/2 w-3 h-3 rounded-full bg-[#3e2a1b]" />
                        <div className="absolute left-3/4 top-1/2 -translate-y-1/2 w-3 h-3 rounded-full bg-[#3e2a1b]" />
                        <div className="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 rounded-full bg-[#3e2a1b]" />
                      </div>

                      <div className="flex justify-between text-[10px] font-mono text-[#5c4028] font-bold mt-2">
                        <span>11:20 PM</span>
                        <span className="text-red-800">11:30 PM</span>
                        <span>11:40 PM</span>
                        <span>11:50 PM</span>
                        <span>12:00 AM</span>
                      </div>
                    </div>

                    {/* Miniature Timeline Slots */}
                    <div className="grid grid-cols-6 gap-2 mt-4">
                      {evidenceList.slice(0, 5).map((ev) => (
                        <div
                          key={`slot-${ev.id}`}
                          onClick={() => setActiveTab('Timeline')}
                          className="bg-[#fdfbf6] p-1 rounded-xl border-2 border-[#8c6d48] shadow-sm aspect-[4/3] flex items-center justify-center overflow-hidden hover:scale-105 transition-transform cursor-pointer"
                        >
                          <img src={ev.preview} alt="Mini" className="w-full h-full object-contain" />
                        </div>
                      ))}

                      <div
                        onClick={() => setActiveTab('Timeline')}
                        className="border-2 border-dashed border-[#8c6d48] rounded-xl aspect-[4/3] flex items-center justify-center text-[#8c6d48] hover:text-[#1a110a] hover:border-[#1a110a] cursor-pointer bg-[#ede0ce]/50 transition-colors"
                      >
                        <Plus className="w-4 h-4" />
                      </div>
                    </div>
                  </div>
                </div>

                {/* RIGHT SPLIT: INVESTIGATION NOTES PAPER (5 cols) */}
                <div
                  className="md:col-span-5 relative border-2 border-[#8c6d48] rounded-3xl p-4 sm:p-5 shadow-xl text-[#2d1e11] font-sans rotate-1 overflow-hidden select-none flex flex-col justify-between"
                  style={parchmentStyle}
                >
                  <div className="absolute top-2 right-4 w-4 h-9 border-2 border-[#a67c52] rounded-full shadow-sm bg-[#d1b89d]/30" />

                  <div>
                    <h4 className="font-serif font-black text-sm text-[#1f150c]">
                      Investigation Checklist
                    </h4>
                    <div className="font-serif italic text-xs text-[#6c4e32] mb-3">
                      "Cross-examine each inconsistency."
                    </div>

                    {/* Interactive Checkboxes */}
                    <div className="space-y-2 text-xs">
                      {[
                        { id: 'q1', text: 'Who is the person in the drawing?' },
                        { id: 'q2', text: 'What is hidden in the red bag?' },
                        { id: 'q3', text: 'Where did the suspect flee to?' },
                        { id: 'q4', text: 'What caused the broken glass shards?' },
                        { id: 'q5', text: 'Do the footprints match security boots?' },
                        { id: 'q6', text: 'Is the black sedan the getaway vehicle?' },
                      ].map((item) => (
                        <div
                          key={item.id}
                          onClick={() => toggleCheck(item.id)}
                          className="flex items-center gap-2 cursor-pointer hover:text-black transition-colors"
                        >
                          {checkedItems[item.id] ? (
                            <CheckSquare className="w-4 h-4 text-red-800 flex-shrink-0" />
                          ) : (
                            <Square className="w-4 h-4 text-[#8c6d48] flex-shrink-0" />
                          )}
                          <span
                            className={checkedItems[item.id] ? 'line-through text-[#8c6d48]' : 'text-[#2e2014] font-medium'}
                          >
                            {item.text}
                          </span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </>
          )}

          {/* TAB 2: DEDICATED TIMELINE WORKBENCH */}
          {activeTab === 'Timeline' && (
            <div
              className="relative border-2 border-[#8c6d48] rounded-3xl p-6 shadow-xl text-[#221711] space-y-6 select-none overflow-hidden"
              style={parchmentStyle}
            >
              <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
                <div>
                  <h3 className="text-base font-black text-[#1a110a] font-serif flex items-center gap-2">
                    <Clock className="w-4 h-4 text-red-800" />
                    <span>Timeline Reconstruction Station</span>
                  </h3>
                  <p className="text-xs text-[#5c4028] font-mono">
                    Place each piece of evidence into its chronological occurrence.
                  </p>
                </div>
                <span className="text-xs font-mono text-emerald-950 font-bold bg-emerald-100 px-3 py-1 rounded-xl border border-emerald-700/60 shadow-sm">
                  Interactive Mode Active
                </span>
              </div>

              {/* 5 Chronological Slots */}
              <div className="grid grid-cols-1 sm:grid-cols-5 gap-3.5">
                {timelineSlots.map((time, idx) => {
                  const assignedCard = evidenceList[idx];
                  return (
                    <div
                      key={time}
                      className="bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl p-3 flex flex-col items-center justify-between min-h-[170px] text-center space-y-2 shadow-sm hover:border-red-800 transition-colors"
                    >
                      <div className="text-xs font-mono font-black text-red-800">{time}</div>
                      {assignedCard ? (
                        <div className="w-full aspect-[4/3] bg-[#fcf8f1] rounded-xl border border-[#b89e7c] overflow-hidden flex items-center justify-center p-1 relative group shadow-inner">
                          <img
                            src={assignedCard.preview}
                            alt={assignedCard.author}
                            className="w-full h-full object-contain"
                          />
                          <div className="absolute inset-0 bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-1 text-[10px] text-white">
                            <span>#{assignedCard.order}</span>
                          </div>
                        </div>
                      ) : (
                        <div className="w-full aspect-[4/3] border-2 border-dashed border-[#b89e7c] rounded-xl flex items-center justify-center text-[#8c6d48] text-xs font-mono">
                          Empty Slot
                        </div>
                      )}
                      <div className="text-[11px] font-bold text-[#1a110a]">
                        {assignedCard ? `By ${assignedCard.author}` : 'Unassigned'}
                      </div>
                      <button
                        onClick={() => {
                          onSlotTimelineEvidence(time, assignedCard?.id || null);
                        }}
                        className="w-full py-1.5 text-[10px] font-mono font-bold bg-[#ede0ce] hover:bg-red-800 hover:text-white rounded-lg text-[#3e2b1b] transition-colors cursor-pointer border border-[#bfa98e]"
                      >
                        Lock Slot
                      </button>
                    </div>
                  );
                })}
              </div>

              <div className="p-3.5 bg-red-800/10 border-2 border-red-800/40 rounded-2xl text-xs text-red-950 font-serif flex items-center justify-between">
                <span>Timeline sequence establishes when the alarms failed and the getaway vehicle departed.</span>
                <button
                  onClick={() => setActiveTab('Evidence')}
                  className="px-4 py-1.5 bg-red-800 hover:bg-red-700 text-white rounded-xl font-bold font-mono text-xs cursor-pointer shadow"
                >
                  Return to Evidence
                </button>
              </div>
            </div>
          )}

          {/* TAB 3: CONNECTIONS (RED STRING) BOARD */}
          {activeTab === 'Connections' && (
            <div
              className="relative border-2 border-[#8c6d48] rounded-3xl p-6 shadow-xl text-[#221711] space-y-6 select-none overflow-hidden"
              style={parchmentStyle}
            >
              <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
                <div>
                  <h3 className="text-base font-black text-[#1a110a] font-serif flex items-center gap-2">
                    <Share2 className="w-4 h-4 text-red-800" />
                    <span>Conspiracy & Red-String Board</span>
                  </h3>
                  <p className="text-xs text-[#5c4028] font-mono">
                    Pin red threads between contradictory or corroborating witness drawings.
                  </p>
                </div>
                <span className="text-xs font-mono text-red-900 font-bold bg-red-100 px-3 py-1 rounded-xl border border-red-800/50 shadow-sm">
                  {activeConnections.length} Active Strings
                </span>
              </div>

              {/* Pin connection builder */}
              <div className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-3 shadow-inner">
                <div className="text-xs font-bold font-serif text-[#1a110a]">Create New Clue Connection Thread:</div>
                <div className="grid grid-cols-1 sm:grid-cols-4 gap-3 text-xs">
                  <div>
                    <label className="block text-[10px] font-mono text-[#5c4028] font-bold mb-1">Clue Origin</label>
                    <select
                      value={connCardA}
                      onChange={(e) => setConnCardA(e.target.value)}
                      className="w-full py-1.5 px-2 bg-[#ede0ce] border border-[#bfa98e] rounded-xl text-[#1a110a] font-mono font-bold"
                    >
                      <option value="">Select origin clue...</option>
                      {evidenceList.map((e) => (
                        <option key={e.id} value={e.id}>
                          Clue #{e.order} ({e.author})
                        </option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <label className="block text-[10px] font-mono text-[#5c4028] font-bold mb-1">Target Clue</label>
                    <select
                      value={connCardB}
                      onChange={(e) => setConnCardB(e.target.value)}
                      className="w-full py-1.5 px-2 bg-[#ede0ce] border border-[#bfa98e] rounded-xl text-[#1a110a] font-mono font-bold"
                    >
                      <option value="">Select target clue...</option>
                      {evidenceList.map((e) => (
                        <option key={e.id} value={e.id}>
                          Clue #{e.order} ({e.author})
                        </option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <label className="block text-[10px] font-mono text-[#5c4028] font-bold mb-1">Relation Tag</label>
                    <select
                      value={connLabel}
                      onChange={(e) => setConnLabel(e.target.value)}
                      className="w-full py-1.5 px-2 bg-[#ede0ce] border border-[#bfa98e] rounded-xl text-[#1a110a] font-mono font-bold"
                    >
                      <option value="Suspect Linked">Suspect Linked</option>
                      <option value="Alibi Conflict">Alibi Conflict</option>
                      <option value="Murder Weapon">Murder Weapon</option>
                      <option value="Direct Evidence">Direct Evidence</option>
                      <option value="Stolen Loot">Stolen Loot</option>
                    </select>
                  </div>

                  <div className="flex items-end">
                    <button
                      onClick={handleCreateConnection}
                      disabled={!connCardA || !connCardB || connCardA === connCardB}
                      className="w-full py-2 bg-red-800 hover:bg-red-700 text-white font-bold rounded-xl text-xs transition-all disabled:opacity-40 flex items-center justify-center gap-1 cursor-pointer shadow"
                    >
                      <Link2 className="w-3.5 h-3.5" />
                      <span>Pin Thread</span>
                    </button>
                  </div>
                </div>
              </div>

              {/* Active Connections List */}
              <div className="space-y-2">
                <div className="text-xs font-mono font-bold uppercase text-[#7a5839]">Pinned Red Threads</div>
                {activeConnections.map((conn) => (
                  <div
                    key={conn.id}
                    className="flex items-center justify-between p-3 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl text-xs shadow-sm"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-3 h-3 rounded-full bg-red-700 shadow border border-red-950" />
                      <span className="font-bold text-[#1a110a]">{conn.from}</span>
                      <span className="text-red-800 font-mono font-bold">━━━━ {conn.label} ━━━━</span>
                      <span className="font-bold text-[#1a110a]">{conn.to}</span>
                    </div>
                    <button
                      onClick={() => handleRemoveConnection(conn.id)}
                      className="p-1 text-[#8c6d48] hover:text-red-800 transition-colors cursor-pointer"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                    </button>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* TAB 4: QUESTION / SUSPECT INTERROGATION */}
          {activeTab === 'Question' && (
            <div
              className="relative border-2 border-[#8c6d48] rounded-3xl p-6 shadow-xl text-[#221711] space-y-6 select-none overflow-hidden"
              style={parchmentStyle}
            >
              <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
                <div>
                  <h3 className="text-base font-black text-[#1a110a] font-serif flex items-center gap-2">
                    <HelpCircle className="w-4 h-4 text-red-800" />
                    <span>Suspect Interrogation Docket</span>
                  </h3>
                  <p className="text-xs text-[#5c4028] font-mono">
                    Interrogate each individual at the scene to uncover discrepancies in their alibi.
                  </p>
                </div>
                <span className="text-xs font-mono text-amber-950 font-bold bg-amber-100 px-3 py-1 rounded-xl border border-amber-700/60 shadow-sm">
                  4 Suspects Held
                </span>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {(gameState.currentCase?.characters || [
                  { name: 'Arthur Vance', role: 'Head Security Guard', avatar: '🛡️', alibi: 'Claims he was patrolling the north wing entrance when power failed.' },
                  { name: 'Evelyn Reed', role: 'Chief Antiquities Curator', avatar: '👩‍🏫', alibi: 'Stated she was cataloging ancient scrolls in the basement library.' },
                  { name: 'Dr. Silas Thorne', role: 'Visiting Restorer', avatar: '🧪', alibi: 'Claims he was in the chemical workshop applying varnish to pottery.' },
                  { name: 'Lady Vivienne Sterling', role: 'VIP Benefactor', avatar: '💎', alibi: 'Insists she was enjoying champagne in the ballroom foyer during the blackout.' },
                ]).map((char) => {
                  const isInterrogated = interrogatedSuspects[char.name];
                  return (
                    <div
                      key={char.name}
                      className="p-4 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl space-y-3 shadow-sm"
                    >
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-xl shadow-inner">
                          {char.avatar}
                        </div>
                        <div>
                          <div className="text-sm font-black text-[#1a110a] font-serif">{char.name}</div>
                          <div className="text-xs text-[#7a5839] font-mono font-bold">{char.role}</div>
                        </div>
                      </div>

                      <div className="text-xs text-[#3e2a1b] italic font-serif bg-[#f5ecdd] p-2.5 rounded-xl border border-[#b89e7c]">
                        "{char.alibi}"
                      </div>

                      {isInterrogated && (
                        <div className="text-[11px] text-red-950 bg-red-100 p-2.5 rounded-xl border-2 border-red-800/40 space-y-1">
                          <div className="font-bold uppercase tracking-wider text-[9px] text-red-800 font-mono">
                            Interrogation Finding:
                          </div>
                          <div>Witness drawings show footprints leading from {char.name.split(' ')[0]}'s station to the east gate.</div>
                        </div>
                      )}

                      <button
                        onClick={() => {
                          setInterrogatedSuspects((prev) => ({
                            ...prev,
                            [char.name]: !prev[char.name],
                          }));
                        }}
                        className={`w-full py-2.5 rounded-xl text-xs font-bold font-mono uppercase tracking-wider transition-all flex items-center justify-center gap-1.5 cursor-pointer shadow ${
                          isInterrogated
                            ? 'bg-[#ede0ce] text-[#3e2a1b] hover:bg-[#ded0bc] border border-[#bfa98e]'
                            : 'bg-red-800 text-white hover:bg-red-700'
                        }`}
                      >
                        <MessageSquare className="w-3.5 h-3.5" />
                        <span>{isInterrogated ? 'Close Interrogation' : 'Interrogate Suspect'}</span>
                      </button>
                    </div>
                  );
                })}
              </div>
            </div>
          )}

          {/* TAB 5: NOTES JOURNAL */}
          {activeTab === 'Notes' && (
            <div
              className="relative border-2 border-[#8c6d48] rounded-3xl p-6 shadow-xl text-[#221711] space-y-6 select-none overflow-hidden"
              style={parchmentStyle}
            >
              <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
              <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

              <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-3">
                <div>
                  <h3 className="text-base font-black text-[#1a110a] font-serif flex items-center gap-2">
                    <FileText className="w-4 h-4 text-red-800" />
                    <span>Detective Field Journal</span>
                  </h3>
                  <p className="text-xs text-[#5c4028] font-mono">
                    Record your clues, contradictions, and hypotheses in real time.
                  </p>
                </div>
                {isNoteSaved && (
                  <span className="text-xs font-mono text-emerald-950 font-bold bg-emerald-100 px-3 py-1 rounded-xl border border-emerald-700/60 shadow-sm animate-pulse">
                    ✓ Notes Saved to Case File
                  </span>
                )}
              </div>

              <div className="grid grid-cols-1 md:grid-cols-12 gap-5">
                <div className="md:col-span-6 space-y-3">
                  <div className="text-xs font-black text-[#1a110a] uppercase tracking-wider font-mono">
                    Official Case Inquiries
                  </div>
                  <div className="space-y-2 text-xs bg-[#fdfbf6] p-4 rounded-2xl border-2 border-[#8c6d48] shadow-inner">
                    {[
                      { id: 'q1', text: 'Who disabled the camera power override?' },
                      { id: 'q2', text: 'What is hidden inside the red bag?' },
                      { id: 'q3', text: 'Where did the getaway sedan flee to?' },
                      { id: 'q4', text: 'Did the janitor leave fake footprints?' },
                      { id: 'q5', text: 'Which witness is covertly distorting facts?' },
                      { id: 'q6', text: 'Is the blue diamond still inside the estate?' },
                    ].map((item) => (
                      <div
                        key={item.id}
                        onClick={() => toggleCheck(item.id)}
                        className="flex items-center gap-2 cursor-pointer hover:text-black transition-colors"
                      >
                        {checkedItems[item.id] ? (
                          <CheckSquare className="w-4 h-4 text-red-800 flex-shrink-0" />
                        ) : (
                          <Square className="w-4 h-4 text-[#8c6d48] flex-shrink-0" />
                        )}
                        <span className={checkedItems[item.id] ? 'line-through text-[#8c6d48]' : 'text-[#2e2014] font-medium'}>
                          {item.text}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>

                <div className="md:col-span-6 space-y-3">
                  <div className="text-xs font-black text-[#1a110a] uppercase tracking-wider font-mono">
                    Detective Observations
                  </div>
                  <textarea
                    rows={8}
                    value={notebookText}
                    onChange={(e) => setNotebookText(e.target.value)}
                    className="w-full p-3.5 bg-[#fdfbf6] border-2 border-[#8c6d48] rounded-2xl text-xs text-[#1a110a] outline-none focus:border-red-800 font-mono leading-relaxed shadow-inner"
                  />
                  <div className="flex justify-end">
                    <button
                      onClick={handleSaveNotes}
                      className="px-5 py-2.5 bg-red-800 hover:bg-red-700 text-white font-bold rounded-xl text-xs uppercase tracking-wider shadow transition-all cursor-pointer font-mono"
                    >
                      Save Journal Notes
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* BOTTOM ACTION PROMPT BANNER (VINTAGE DISPATCH SLIP) */}
          <div
            className="relative border-2 border-[#8c6d48] rounded-3xl p-4 sm:p-5 shadow-xl text-[#221711] flex flex-wrap items-center justify-between gap-4 overflow-hidden select-none"
            style={parchmentStyle}
          >
            <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-xl bg-[#ede0ce] border border-[#bfa98e] flex items-center justify-center text-red-800 flex-shrink-0 shadow-inner">
                <Search className="w-5 h-5" />
              </div>
              <div>
                <div className="text-xs sm:text-sm font-black text-[#1a110a] font-serif">
                  Ready to lock in your final deduction?
                </div>
                <div className="text-[11px] text-[#5c4028] font-mono">
                  {isHost
                    ? 'Everyone has inspected the drawings. Time to submit official charges!'
                    : 'Review the evidence board with your squad and prepare your theory.'}
                </div>
              </div>
            </div>

            <button
              onClick={onProceedToTheory}
              className="px-7 py-3 rounded-2xl bg-red-800 hover:bg-red-700 text-white font-serif font-black text-xs sm:text-sm uppercase tracking-wider shadow-lg hover:shadow-xl transition-all flex items-center gap-2 transform active:scale-95 cursor-pointer border border-red-950"
            >
              <span>SUBMIT CHARGES & GUESSES →</span>
            </button>
          </div>
        </div>

        {/* ======================================================== */}
        {/* ZONE 3: RIGHT COLUMN: PLAYERS + DISCUSSION CHAT (3 cols) */}
        {/* ======================================================== */}
        <div className="w-full lg:w-72 flex flex-col gap-4 flex-shrink-0">
          {/* PLAYERS LIST (VINTAGE DETECTIVE ROSTER) */}
          <div
            className="relative border-2 border-[#8c6d48] rounded-3xl p-4 shadow-xl text-[#221711] space-y-2 overflow-hidden select-none"
            style={parchmentStyle}
          >
            <div className="absolute top-1.5 left-1.5 w-3 h-3 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-1.5 right-1.5 w-3 h-3 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute -top-1.5 left-5 w-3 h-6 rounded-full border-2 border-[#a67c52] -rotate-6 shadow-sm opacity-90 pointer-events-none bg-[#d1b89d]/30" />

            <div className="text-xs font-mono font-bold uppercase tracking-wider text-[#1a110a] border-b border-[#bfa98e]/80 pb-2 flex items-center justify-between">
              <span className="flex items-center gap-1.5">
                <Users className="w-3.5 h-3.5 text-[#7a5839]" />
                <span>Squad Roster</span>
              </span>
              <span className="text-[10px] font-mono text-[#7a5839]">{rosterPlayers.length} Active</span>
            </div>

            <div className="space-y-1.5">
              {rosterPlayers.map((p, idx) => (
                <div
                  key={p.id}
                  className="flex items-center justify-between p-2 rounded-xl text-xs bg-[#fdfbf6] border border-[#b89e7c] shadow-xs"
                >
                  <div className="flex items-center gap-2 min-w-0">
                    <AvatarBadge avatar={p.avatar} size="xs" />
                    <span className="font-bold text-[#1a110a] truncate">{p.nickname}</span>
                    {idx === 0 && <span className="text-amber-700 text-xs">👑</span>}
                  </div>

                  <span className="flex items-center gap-1 text-[10px] text-emerald-950 font-mono font-bold flex-shrink-0 bg-emerald-100 px-2 py-0.5 rounded-full border border-emerald-700/60">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-600" />
                    Ready
                  </span>
                </div>
              ))}
            </div>
          </div>

          {/* DISCUSSION / GAME LOG CHAT */}
          <div className="w-full">
            <RoomChat
              currentUser={currentUser}
              channel={channel}
              showTabs={true}
              defaultTab="Discussion"
              initialMessages={discussionMessages}
              className="min-h-[290px]"
            />
          </div>

          {/* PINNED NOTE AT BOTTOM RIGHT */}
          <div className="relative hidden lg:block bg-[#fdfbf6] p-4 rounded-xl shadow-xl rotate-2 border-2 border-[#8c6d48] text-[#2c1d10] font-serif italic text-xs text-center select-none">
            <div className="w-3.5 h-3.5 rounded-full bg-red-700 absolute -top-1.5 left-1/2 -translate-x-1/2 shadow border border-red-950" />
            "The truth is always preserved in the{' '}
            <span className="relative inline-block font-black text-red-900 not-italic">
              details.
            </span>"
          </div>
        </div>
      </main>

      {/* INSPECT HIGH-RES MODAL (AUTHENTIC CLASSIFIED EVIDENCE SLEEVE) */}
      {selectedCard && (
        <div
          onClick={() => setSelectedCard(null)}
          className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4 animate-fadeIn"
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="relative border-4 border-[#8c6d48] rounded-3xl max-w-xl w-full p-6 sm:p-7 shadow-[0_25px_80px_rgba(0,0,0,0.9)] space-y-4 text-[#221711] select-none overflow-hidden"
            style={parchmentStyle}
          >
            <div className="absolute top-2 left-2 w-4 h-4 border-t-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute top-2 right-2 w-4 h-4 border-t-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 left-2 w-4 h-4 border-b-2 border-l-2 border-[#8c6d48]/70 pointer-events-none" />
            <div className="absolute bottom-2 right-2 w-4 h-4 border-b-2 border-r-2 border-[#8c6d48]/70 pointer-events-none" />

            {/* Red Push Pin */}
            <div className="w-4 h-4 rounded-full bg-red-700 absolute -top-2 left-1/2 -translate-x-1/2 shadow border border-red-950" />

            <div className="flex items-center justify-between border-b border-[#bfa98e]/80 pb-2">
              <div className="flex items-center gap-2">
                <span className="px-2 py-0.5 rounded border border-red-800 bg-red-800/10 text-red-800 font-mono text-[9px] font-black uppercase">
                  CLASSIFIED EVIDENCE
                </span>
                <h3 className="text-base font-black text-[#1a110a] font-serif">{selectedCard.title}</h3>
              </div>
              <button
                onClick={() => setSelectedCard(null)}
                className="text-xs font-mono font-bold text-[#8c6d48] hover:text-[#1a110a] cursor-pointer"
              >
                ✕ Close
              </button>
            </div>

            <div className="w-full aspect-[4/3] bg-[#fcf8f1] rounded-2xl overflow-hidden flex items-center justify-center p-3 border-2 border-[#8c6d48] shadow-inner">
              {selectedCard.drawingPreview && (
                <img
                  src={selectedCard.drawingPreview}
                  alt={selectedCard.title}
                  className="w-full h-full object-contain"
                />
              )}
            </div>

            <div className="text-xs text-[#5c4028] flex items-center justify-between font-mono font-bold">
              <span>Witness Sketch by {selectedCard.sourcePlayerName}</span>
              <span className="text-red-800 font-black uppercase">★ CONFIDENTIAL</span>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
