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
          roundText="Round 1 Completed • Investigation Phase"
          onLeaveRoom={onLeaveRoom}
        />
      </div>

      {/* MAIN 3-ZONE LAYOUT */}
      <main className="relative z-10 w-full max-w-[1440px] mx-auto px-2 sm:px-6 py-4 flex flex-col lg:flex-row gap-4 items-start">
        {/* ======================================================== */}
        {/* ZONE 1: FAR LEFT VERTICAL TABS & NOTE (1.5 cols)          */}
        {/* ======================================================== */}
        <div className="w-full lg:w-44 flex flex-col gap-4 flex-shrink-0">
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
            className="p-2.5 w-10 h-10 rounded-xl bg-[#0e131f]/90 border border-slate-700/60 text-slate-300 hover:text-white flex items-center justify-center transition-colors shadow-md cursor-pointer hover:border-slate-500"
          >
            <ArrowLeft className="w-4 h-4" />
          </button>

          {/* Vertical Tab Navigation */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-2 shadow-2xl backdrop-blur-md space-y-1">
            <button
              onClick={() => setActiveTab('Evidence')}
              className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-xs font-semibold transition-all cursor-pointer ${
                activeTab === 'Evidence'
                  ? 'bg-red-950/40 text-white border-l-2 border-red-500 shadow-sm'
                  : 'text-slate-400 hover:text-white hover:bg-slate-800/40'
              }`}
            >
              <FileText className="w-3.5 h-3.5 text-red-500" />
              <span>Evidence</span>
            </button>

            <button
              onClick={() => setActiveTab('Timeline')}
              className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-xs font-semibold transition-all cursor-pointer ${
                activeTab === 'Timeline'
                  ? 'bg-red-950/40 text-white border-l-2 border-red-500 shadow-sm'
                  : 'text-slate-400 hover:text-white hover:bg-slate-800/40'
              }`}
            >
              <Clock className="w-3.5 h-3.5 text-slate-400" />
              <span>Timeline</span>
            </button>

            <button
              onClick={() => setActiveTab('Connections')}
              className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-xs font-semibold transition-all cursor-pointer ${
                activeTab === 'Connections'
                  ? 'bg-red-950/40 text-white border-l-2 border-red-500 shadow-sm'
                  : 'text-slate-400 hover:text-white hover:bg-slate-800/40'
              }`}
            >
              <Share2 className="w-3.5 h-3.5 text-slate-400" />
              <span>Connections</span>
            </button>

            <button
              onClick={() => setActiveTab('Question')}
              className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-xs font-semibold transition-all cursor-pointer ${
                activeTab === 'Question'
                  ? 'bg-red-950/40 text-white border-l-2 border-red-500 shadow-sm'
                  : 'text-slate-400 hover:text-white hover:bg-slate-800/40'
              }`}
            >
              <HelpCircle className="w-3.5 h-3.5 text-slate-400" />
              <span>Question</span>
            </button>

            <button
              onClick={() => setActiveTab('Notes')}
              className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-xs font-semibold transition-all cursor-pointer ${
                activeTab === 'Notes'
                  ? 'bg-red-950/40 text-white border-l-2 border-red-500 shadow-sm'
                  : 'text-slate-400 hover:text-white hover:bg-slate-800/40'
              }`}
            >
              <FileText className="w-3.5 h-3.5 text-slate-400" />
              <span>Notes</span>
            </button>
          </div>

          {/* Pinned parchment note at bottom left */}
          <div className="relative hidden lg:block bg-[#f8f1e0] p-4 rounded-xl shadow-xl -rotate-2 border border-[#d8c3a5] text-[#2c1d10] font-handwriting text-sm leading-snug">
            "Same drawings. Different perspectives. What's the truth?"
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
              <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-4 sm:p-5 shadow-2xl backdrop-blur-md space-y-4">
                {/* Evidence Board Header & Filter bar */}
                <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-800/80 pb-3">
                  <div>
                    <h3 className="text-sm sm:text-base font-bold text-white font-serif tracking-wide">
                      Evidence Board
                    </h3>
                    <p className="text-[11px] text-slate-400 font-sans">
                      All drawings from this round. Look closer. Connect the clues.
                    </p>
                  </div>

                  <div className="flex items-center gap-2 relative">
                    {/* Search toggle */}
                    {isSearchOpen ? (
                      <div className="flex items-center gap-1 bg-slate-900 border border-slate-700 rounded-lg px-2 py-1">
                        <input
                          type="text"
                          placeholder="Search clues..."
                          value={searchQuery}
                          onChange={(e) => setSearchQuery(e.target.value)}
                          className="bg-transparent text-xs text-white outline-none w-28 sm:w-36"
                          autoFocus
                        />
                        <button
                          onClick={() => {
                            setIsSearchOpen(false);
                            setSearchQuery('');
                          }}
                          className="text-slate-400 hover:text-white text-xs cursor-pointer"
                        >
                          ✕
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => setIsSearchOpen(true)}
                        title="Search Evidence"
                        className="p-1.5 rounded-lg bg-slate-900 border border-slate-800 text-slate-400 hover:text-white transition-colors cursor-pointer"
                      >
                        <Search className="w-3.5 h-3.5" />
                      </button>
                    )}

                    {/* Filter Dropdown */}
                    <div className="relative">
                      <button
                        onClick={() => setIsFilterDropdownOpen(!isFilterDropdownOpen)}
                        className="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-slate-900 border border-slate-800 text-xs text-slate-300 font-mono hover:border-slate-700 transition-colors cursor-pointer"
                      >
                        <span>{filterCategory === 'All' ? 'All Evidence' : filterCategory}</span>
                        <ChevronDown className="w-3 h-3 text-slate-500" />
                      </button>

                      {isFilterDropdownOpen && (
                        <div className="absolute right-0 top-9 z-50 bg-[#121620] border border-slate-700 rounded-xl p-1.5 shadow-2xl min-w-[120px] space-y-1">
                          {(['All', 'Sketches', 'Timeline'] as const).map((cat) => (
                            <button
                              key={cat}
                              onClick={() => {
                                setFilterCategory(cat);
                                setIsFilterDropdownOpen(false);
                              }}
                              className={`w-full text-left px-2.5 py-1 text-xs rounded-lg cursor-pointer ${
                                filterCategory === cat
                                  ? 'bg-red-950/50 text-red-300 font-bold'
                                  : 'text-slate-300 hover:bg-slate-800'
                              }`}
                            >
                              {cat}
                            </button>
                          ))}
                        </div>
                      )}
                    </div>

                    {/* Grid & List View Toggle */}
                    <div className="flex items-center rounded-lg bg-slate-900 border border-slate-800 p-0.5">
                      <button
                        onClick={() => setViewMode('grid')}
                        className={`p-1 rounded cursor-pointer ${
                          viewMode === 'grid' ? 'bg-red-700 text-white' : 'text-slate-500 hover:text-white'
                        }`}
                      >
                        <LayoutGrid className="w-3.5 h-3.5" />
                      </button>
                      <button
                        onClick={() => setViewMode('list')}
                        className={`p-1 rounded cursor-pointer ${
                          viewMode === 'list' ? 'bg-red-700 text-white' : 'text-slate-500 hover:text-white'
                        }`}
                      >
                        <List className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  </div>
                </div>

                {/* POLAROIDS (GRID VIEW) */}
                {viewMode === 'grid' ? (
                  <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-3 pt-1">
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
                        className="relative bg-[#fcf9f2] p-2 pb-3 rounded-lg shadow-xl hover:shadow-2xl transition-all cursor-pointer transform hover:-translate-y-1 border border-[#e2d5bd] flex flex-col justify-between select-none group"
                      >
                        {/* Red Push Pin on Top */}
                        <div className="w-3.5 h-3.5 rounded-full bg-red-600 absolute -top-1.5 left-1/2 -translate-x-1/2 shadow-md border border-red-900 z-10" />

                        {/* Card Order Tag */}
                        <div className="text-[10px] font-mono text-slate-400 font-bold mb-1">
                          #{card.order}
                        </div>

                        {/* Sketch Drawing Box */}
                        <div className="w-full aspect-[4/3] bg-white rounded border border-slate-200 overflow-hidden relative flex items-center justify-center">
                          <img
                            src={card.preview}
                            alt={`Clue #${card.order}`}
                            className="w-full h-full object-contain"
                          />
                          <div className="absolute top-1 right-1 opacity-0 group-hover:opacity-100 transition-opacity p-1 bg-black/50 rounded text-white">
                            <Maximize2 className="w-3 h-3" />
                          </div>
                        </div>

                        {/* Card Footer: Author + Time */}
                        <div className="mt-2 flex items-center justify-between text-[10px]">
                          <div className="flex items-center gap-1 min-w-0">
                            <AvatarBadge avatar={card.avatar} size="xs" />
                            <span className="font-bold text-slate-800 truncate">By {card.author}</span>
                          </div>
                          <span className="text-slate-500 font-mono text-[9px] flex-shrink-0">
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
                        className="flex items-center justify-between p-3 rounded-xl bg-slate-900/60 border border-slate-800 hover:border-slate-600 transition-all cursor-pointer"
                      >
                        <div className="flex items-center gap-3">
                          <div className="w-14 h-11 rounded-lg bg-white overflow-hidden flex items-center justify-center border border-slate-300 flex-shrink-0">
                            <img src={card.preview} alt="Clue" className="w-full h-full object-contain" />
                          </div>
                          <div>
                            <div className="text-xs font-bold text-white">Clue #{card.order}</div>
                            <div className="text-[11px] text-slate-400">
                              Drawn by {card.author}
                            </div>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 font-mono text-xs">
                          <span className="text-red-400 font-bold">{card.time}</span>
                          <span className="text-slate-500">Inspect →</span>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              {/* BOTTOM HALF: BUILD THE TIMELINE & INVESTIGATION NOTES */}
              <div className="grid grid-cols-1 md:grid-cols-12 gap-4">
                {/* LEFT SPLIT: BUILD THE TIMELINE (7 cols) */}
                <div className="md:col-span-7 bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-4 sm:p-5 shadow-2xl backdrop-blur-md flex flex-col justify-between">
                  <div>
                    <div className="flex items-center justify-between">
                      <div>
                        <h4 className="text-xs sm:text-sm font-bold text-white font-serif">
                          Build the Timeline
                        </h4>
                        <p className="text-[11px] text-slate-400 mt-0.5">
                          Drag or slot evidence into chronological sequence.
                        </p>
                      </div>
                      <button
                        onClick={() => setActiveTab('Timeline')}
                        className="text-xs font-mono text-red-400 hover:text-red-300 font-semibold flex items-center gap-1 cursor-pointer"
                      >
                        <span>Full Studio</span>
                        <span>→</span>
                      </button>
                    </div>

                    {/* Horizontal Timeline Axis */}
                    <div className="relative mt-6 mb-4 px-2">
                      <div className="w-full h-[2px] bg-slate-700 relative">
                        <div className="absolute left-0 top-1/2 -translate-y-1/2 w-2.5 h-2.5 rounded-full bg-slate-600" />
                        <div className="absolute left-1/4 top-1/2 -translate-y-1/2 w-3 h-3 rounded-full bg-red-600 shadow-[0_0_8px_rgba(220,38,38,0.8)]" />
                        <div className="absolute left-2/4 top-1/2 -translate-y-1/2 w-2.5 h-2.5 rounded-full bg-slate-600" />
                        <div className="absolute left-3/4 top-1/2 -translate-y-1/2 w-2.5 h-2.5 rounded-full bg-slate-600" />
                        <div className="absolute right-0 top-1/2 -translate-y-1/2 w-2.5 h-2.5 rounded-full bg-slate-600" />
                      </div>

                      <div className="flex justify-between text-[10px] font-mono text-slate-400 mt-2">
                        <span>11:20 PM</span>
                        <span className="text-red-400 font-bold">11:30 PM</span>
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
                          className="bg-white p-1 rounded-lg border border-slate-300 shadow-md aspect-[4/3] flex items-center justify-center overflow-hidden hover:scale-105 transition-transform cursor-pointer"
                        >
                          <img src={ev.preview} alt="Mini" className="w-full h-full object-contain" />
                        </div>
                      ))}

                      <div
                        onClick={() => setActiveTab('Timeline')}
                        className="border border-dashed border-slate-700 rounded-lg aspect-[4/3] flex items-center justify-center text-slate-500 hover:text-white hover:border-slate-500 cursor-pointer bg-slate-900/30"
                      >
                        <Plus className="w-4 h-4" />
                      </div>
                    </div>
                  </div>
                </div>

                {/* RIGHT SPLIT: INVESTIGATION NOTES PAPER (5 cols) */}
                <div className="md:col-span-5 relative bg-[#f7f0e1] border-2 border-[#d6be96] rounded-2xl p-4 sm:p-5 shadow-2xl text-[#2d1e11] font-sans rotate-1 overflow-hidden select-none flex flex-col justify-between">
                  <div className="absolute top-2 right-4 w-4 h-9 border-2 border-slate-400 rounded-full shadow-sm" />

                  <div>
                    <h4 className="font-serif font-bold text-sm text-[#1f150c]">
                      Investigation Notes
                    </h4>
                    <div className="font-handwriting italic text-sm text-[#6c4e32] mb-3">
                      "Same drawing. Different truths."
                    </div>

                    {/* Interactive Checkboxes */}
                    <div className="space-y-2 text-xs">
                      {[
                        { id: 'q1', text: 'Who is the person?' },
                        { id: 'q2', text: 'What is in the red bag?' },
                        { id: 'q3', text: 'Where is this place?' },
                        { id: 'q4', text: 'What caused the broken vase?' },
                        { id: 'q5', text: 'Do the footprints match?' },
                        { id: 'q6', text: 'Is the car the getaway vehicle?' },
                      ].map((item) => (
                        <div
                          key={item.id}
                          onClick={() => toggleCheck(item.id)}
                          className="flex items-center gap-2 cursor-pointer hover:text-black transition-colors"
                        >
                          {checkedItems[item.id] ? (
                            <CheckSquare className="w-4 h-4 text-red-600 flex-shrink-0" />
                          ) : (
                            <Square className="w-4 h-4 text-slate-400 flex-shrink-0" />
                          )}
                          <span
                            className={checkedItems[item.id] ? 'line-through text-slate-500' : 'text-[#2e2014]'}
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
            <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 shadow-2xl backdrop-blur-md space-y-6">
              <div className="flex items-center justify-between border-b border-slate-800 pb-3">
                <div>
                  <h3 className="text-base font-bold text-white font-serif flex items-center gap-2">
                    <Clock className="w-4 h-4 text-red-500" />
                    <span>Timeline Reconstruction Station</span>
                  </h3>
                  <p className="text-xs text-slate-400">
                    Place each piece of evidence into its chronological occurrence.
                  </p>
                </div>
                <span className="text-xs font-mono text-emerald-400 font-bold bg-emerald-950/40 px-3 py-1 rounded-lg border border-emerald-500/30">
                  Interactive Mode Active
                </span>
              </div>

              {/* 5 Chronological Slots */}
              <div className="grid grid-cols-1 sm:grid-cols-5 gap-3">
                {timelineSlots.map((time, idx) => {
                  const assignedCard = evidenceList[idx];
                  return (
                    <div
                      key={time}
                      className="bg-slate-900/80 border border-slate-700/80 rounded-xl p-3 flex flex-col items-center justify-between min-h-[160px] text-center space-y-2 hover:border-slate-500 transition-colors"
                    >
                      <div className="text-xs font-mono font-bold text-red-400">{time}</div>
                      {assignedCard ? (
                        <div className="w-full aspect-[4/3] bg-white rounded-lg border border-slate-300 overflow-hidden flex items-center justify-center p-1 relative group">
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
                        <div className="w-full aspect-[4/3] border border-dashed border-slate-700 rounded-lg flex items-center justify-center text-slate-500 text-xs">
                          Empty Slot
                        </div>
                      )}
                      <div className="text-[11px] font-bold text-slate-300">
                        {assignedCard ? `By ${assignedCard.author}` : 'Unassigned'}
                      </div>
                      <button
                        onClick={() => {
                          onSlotTimelineEvidence(time, assignedCard?.id || null);
                        }}
                        className="w-full py-1 text-[10px] font-mono bg-slate-800 hover:bg-slate-700 rounded text-slate-300 transition-colors cursor-pointer"
                      >
                        Lock Slot
                      </button>
                    </div>
                  );
                })}
              </div>

              <div className="p-3 bg-red-950/30 border border-red-900/40 rounded-xl text-xs text-red-300 flex items-center justify-between">
                <span>Timeline sequence establishes when the alarms went offline and the getaway vehicle departed.</span>
                <button
                  onClick={() => setActiveTab('Evidence')}
                  className="px-3 py-1 bg-red-700 hover:bg-red-600 text-white rounded-lg font-bold text-xs cursor-pointer"
                >
                  Return to Evidence
                </button>
              </div>
            </div>
          )}

          {/* TAB 3: CONNECTIONS (RED STRING) BOARD */}
          {activeTab === 'Connections' && (
            <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 shadow-2xl backdrop-blur-md space-y-6">
              <div className="flex items-center justify-between border-b border-slate-800 pb-3">
                <div>
                  <h3 className="text-base font-bold text-white font-serif flex items-center gap-2">
                    <Share2 className="w-4 h-4 text-red-500" />
                    <span>Conspiracy & Red-Thread Board</span>
                  </h3>
                  <p className="text-xs text-slate-400">
                    Pin red strings between contradictory or corroborating witness drawings.
                  </p>
                </div>
                <span className="text-xs font-mono text-red-400 font-bold bg-red-950/40 px-3 py-1 rounded-lg border border-red-500/30">
                  {activeConnections.length} Active Strings
                </span>
              </div>

              {/* Pin connection builder */}
              <div className="p-4 bg-slate-900/80 border border-slate-700/80 rounded-xl space-y-3">
                <div className="text-xs font-bold text-white">Create New Clue Connection Thread:</div>
                <div className="grid grid-cols-1 sm:grid-cols-4 gap-3 text-xs">
                  <div>
                    <label className="block text-[10px] font-mono text-slate-400 mb-1">Clue Origin</label>
                    <select
                      value={connCardA}
                      onChange={(e) => setConnCardA(e.target.value)}
                      className="w-full py-1.5 px-2 bg-slate-950 border border-slate-700 rounded-lg text-white"
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
                    <label className="block text-[10px] font-mono text-slate-400 mb-1">Target Clue</label>
                    <select
                      value={connCardB}
                      onChange={(e) => setConnCardB(e.target.value)}
                      className="w-full py-1.5 px-2 bg-slate-950 border border-slate-700 rounded-lg text-white"
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
                    <label className="block text-[10px] font-mono text-slate-400 mb-1">Relation Tag</label>
                    <select
                      value={connLabel}
                      onChange={(e) => setConnLabel(e.target.value)}
                      className="w-full py-1.5 px-2 bg-slate-950 border border-slate-700 rounded-lg text-white"
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
                      className="w-full py-2 bg-gradient-to-r from-red-700 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-bold rounded-lg text-xs transition-all disabled:opacity-40 flex items-center justify-center gap-1 cursor-pointer"
                    >
                      <Link2 className="w-3.5 h-3.5" />
                      <span>Pin Thread</span>
                    </button>
                  </div>
                </div>
              </div>

              {/* Active Connections List */}
              <div className="space-y-2">
                <div className="text-xs font-mono font-bold uppercase text-slate-400">Pinned Red Threads</div>
                {activeConnections.map((conn) => (
                  <div
                    key={conn.id}
                    className="flex items-center justify-between p-3 bg-slate-900/60 border border-slate-800 rounded-xl text-xs"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-2.5 h-2.5 rounded-full bg-red-600 shadow-[0_0_8px_rgba(220,38,38,0.9)]" />
                      <span className="font-bold text-white">{conn.from}</span>
                      <span className="text-red-400 font-mono">━━━ {conn.label} ━━━</span>
                      <span className="font-bold text-white">{conn.to}</span>
                    </div>
                    <button
                      onClick={() => handleRemoveConnection(conn.id)}
                      className="p-1 text-slate-500 hover:text-red-400 transition-colors cursor-pointer"
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
            <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 shadow-2xl backdrop-blur-md space-y-6">
              <div className="flex items-center justify-between border-b border-slate-800 pb-3">
                <div>
                  <h3 className="text-base font-bold text-white font-serif flex items-center gap-2">
                    <HelpCircle className="w-4 h-4 text-red-500" />
                    <span>Suspect Interrogation Docket</span>
                  </h3>
                  <p className="text-xs text-slate-400">
                    Interrogate each individual at the scene to uncover discrepancies in their alibi.
                  </p>
                </div>
                <span className="text-xs font-mono text-amber-400 font-bold bg-amber-950/40 px-3 py-1 rounded-lg border border-amber-500/30">
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
                      className="p-4 bg-slate-900/80 border border-slate-700/80 rounded-xl space-y-3"
                    >
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-xl bg-slate-800 border border-slate-700 flex items-center justify-center text-xl shadow">
                          {char.avatar}
                        </div>
                        <div>
                          <div className="text-sm font-bold text-white font-serif">{char.name}</div>
                          <div className="text-xs text-amber-400 font-mono">{char.role}</div>
                        </div>
                      </div>

                      <div className="text-xs text-slate-300 italic font-serif bg-slate-950/50 p-2.5 rounded-lg border border-slate-800/80">
                        "{char.alibi}"
                      </div>

                      {isInterrogated && (
                        <div className="text-[11px] text-red-300 bg-red-950/40 p-2.5 rounded-lg border border-red-900/50 space-y-1">
                          <div className="font-bold uppercase tracking-wider text-[9px] text-red-400">Interrogation Finding:</div>
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
                        className={`w-full py-2 rounded-lg text-xs font-bold font-mono transition-all flex items-center justify-center gap-1.5 cursor-pointer ${
                          isInterrogated
                            ? 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                            : 'bg-gradient-to-r from-red-700 to-rose-700 text-white hover:from-red-600 hover:to-rose-600 shadow'
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
            <div className="bg-[#0e131f]/95 border border-slate-700/70 rounded-2xl p-6 shadow-2xl backdrop-blur-md space-y-6">
              <div className="flex items-center justify-between border-b border-slate-800 pb-3">
                <div>
                  <h3 className="text-base font-bold text-white font-serif flex items-center gap-2">
                    <FileText className="w-4 h-4 text-red-500" />
                    <span>Detective Field Journal</span>
                  </h3>
                  <p className="text-xs text-slate-400">
                    Record your clues, contradictions, and hypotheses in real time.
                  </p>
                </div>
                {isNoteSaved && (
                  <span className="text-xs font-mono text-emerald-400 font-bold bg-emerald-950/40 px-3 py-1 rounded-lg border border-emerald-500/30 animate-pulse">
                    ✓ Notes Saved to Case File
                  </span>
                )}
              </div>

              <div className="grid grid-cols-1 md:grid-cols-12 gap-5">
                <div className="md:col-span-6 space-y-3">
                  <div className="text-xs font-bold text-white uppercase tracking-wider font-mono">
                    Official Case Inquiries
                  </div>
                  <div className="space-y-2 text-xs bg-slate-900/60 p-3.5 rounded-xl border border-slate-800">
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
                        className="flex items-center gap-2 cursor-pointer hover:text-white transition-colors"
                      >
                        {checkedItems[item.id] ? (
                          <CheckSquare className="w-4 h-4 text-red-500 flex-shrink-0" />
                        ) : (
                          <Square className="w-4 h-4 text-slate-500 flex-shrink-0" />
                        )}
                        <span className={checkedItems[item.id] ? 'line-through text-slate-500' : 'text-slate-300'}>
                          {item.text}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>

                <div className="md:col-span-6 space-y-3">
                  <div className="text-xs font-bold text-white uppercase tracking-wider font-mono">
                    Detective Observations
                  </div>
                  <textarea
                    rows={8}
                    value={notebookText}
                    onChange={(e) => setNotebookText(e.target.value)}
                    className="w-full p-3 bg-slate-950/90 border border-slate-700 rounded-xl text-xs text-slate-200 outline-none focus:border-red-500 font-mono leading-relaxed"
                  />
                  <div className="flex justify-end">
                    <button
                      onClick={handleSaveNotes}
                      className="px-5 py-2 bg-gradient-to-r from-red-700 to-rose-700 hover:from-red-600 hover:to-rose-600 text-white font-bold rounded-xl text-xs uppercase tracking-wider shadow transition-all cursor-pointer"
                    >
                      Save Journal Notes
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* BOTTOM ACTION PROMPT BANNER */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-3.5 sm:p-4 shadow-xl backdrop-blur-md flex flex-wrap items-center justify-between gap-4">
            <div className="flex items-center gap-3">
              <div className="w-9 h-9 rounded-xl bg-slate-900 border border-slate-700 flex items-center justify-center text-slate-300 flex-shrink-0 shadow">
                <Search className="w-4 h-4 text-white" />
              </div>
              <div>
                <div className="text-xs sm:text-sm font-bold text-white">
                  Ready to submit accusations?
                </div>
                <div className="text-[11px] text-slate-400">
                  {isHost
                    ? 'All detectives have reviewed the clues. Proceed to lock final theories.'
                    : 'Collaborate with your team, then advance to formal accusations.'}
                </div>
              </div>
            </div>

            <button
              onClick={onProceedToTheory}
              className="px-6 py-2.5 rounded-full bg-gradient-to-r from-[#991b1b] via-[#dc2626] to-[#991b1b] hover:from-[#b91c1c] hover:via-[#ef4444] hover:to-[#b91c1c] text-white font-bold text-xs shadow-[0_4px_15px_rgba(220,38,38,0.45)] transition-all flex items-center gap-2 transform active:scale-95 cursor-pointer"
            >
              <span>Continue to Questioning & Accusations</span>
              <span>→</span>
            </button>
          </div>
        </div>

        {/* ======================================================== */}
        {/* ZONE 3: RIGHT COLUMN: PLAYERS + DISCUSSION CHAT (3 cols) */}
        {/* ======================================================== */}
        <div className="w-full lg:w-72 flex flex-col gap-4 flex-shrink-0">
          {/* PLAYERS LIST */}
          <div className="bg-[#0e131f]/90 border border-slate-700/60 rounded-2xl p-4 shadow-xl backdrop-blur-md space-y-2">
            <div className="text-xs font-mono font-bold uppercase tracking-wider text-slate-300 border-b border-slate-800 pb-2 flex items-center justify-between">
              <span>| Players</span>
              <span className="text-[10px] text-slate-400">{rosterPlayers.length} Active</span>
            </div>

            <div className="space-y-1.5">
              {rosterPlayers.map((p, idx) => (
                <div
                  key={p.id}
                  className="flex items-center justify-between p-1.5 rounded-xl text-xs hover:bg-slate-900/50 transition-colors"
                >
                  <div className="flex items-center gap-2 min-w-0">
                    <AvatarBadge avatar={p.avatar} size="xs" />
                    <span className="font-semibold text-white truncate">{p.nickname}</span>
                    {idx === 0 && <span className="text-amber-400 text-xs">👑</span>}
                  </div>

                  <span className="flex items-center gap-1 text-[10px] text-emerald-400 font-mono flex-shrink-0">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
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
          <div className="relative hidden lg:block bg-[#f8f1e0] p-4 rounded-xl shadow-xl rotate-2 border border-[#d8c3a5] text-[#2c1d10] font-handwriting text-sm text-center select-none">
            Truth is always in the{' '}
            <span className="relative inline-block font-bold">
              details.
              <svg
                className="absolute -bottom-0.5 left-0 w-full h-1.5 text-red-600"
                viewBox="0 0 100 10"
                preserveAspectRatio="none"
              >
                <path d="M0 6 Q 50 1 100 6" stroke="#dc2626" strokeWidth="2.5" fill="none" />
              </svg>
            </span>
          </div>
        </div>
      </main>

      {/* INSPECT HIGH-RES MODAL */}
      {selectedCard && (
        <div
          onClick={() => setSelectedCard(null)}
          className="fixed inset-0 z-50 bg-black/85 backdrop-blur-sm flex items-center justify-center p-4"
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="bg-[#0e131f] border border-slate-700/80 rounded-2xl max-w-xl w-full p-6 shadow-2xl space-y-4 text-slate-100"
          >
            <div className="flex items-center justify-between border-b border-slate-800 pb-2">
              <h3 className="text-base font-bold text-white font-serif">{selectedCard.title}</h3>
              <button
                onClick={() => setSelectedCard(null)}
                className="text-xs text-slate-400 hover:text-white cursor-pointer"
              >
                ✕ Close
              </button>
            </div>

            <div className="w-full aspect-[4/3] bg-white rounded-xl overflow-hidden flex items-center justify-center p-2 border border-slate-300">
              {selectedCard.drawingPreview && (
                <img
                  src={selectedCard.drawingPreview}
                  alt={selectedCard.title}
                  className="w-full h-full object-contain"
                />
              )}
            </div>

            <div className="text-xs text-slate-400 flex items-center justify-between font-mono">
              <span>Witness Sketch by {selectedCard.sourcePlayerName}</span>
              <span className="text-red-400 font-bold uppercase">Classified Evidence</span>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
