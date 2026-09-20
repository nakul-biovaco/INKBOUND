<div align="center">

  <img src="public/assets/logo.png" alt="INKBOUND" width="280" />

  <br />

  <h1>INKBOUND</h1>

  <p><b>Multiplayer Real-Time Detective Deduction & Live Drawing Party Game</b></p>

[![TypeScript](https://img.shields.io/badge/TypeScript-5.6-blue.svg)](https://www.typescriptlang.org/)
[![React](https://img.shields.io/badge/React-18.3-61dafb.svg)](https://reactjs.org/)
[![Vite](https://img.shields.io/badge/Vite-6.0-646cff.svg)](https://vitejs.dev/)
[![Fastify](https://img.shields.io/badge/Fastify-4.28-black.svg)](https://www.fastify.io/)
[![TailwindCSS](https://img.shields.io/badge/Tailwind-3.4-38b2ac.svg)](https://tailwindcss.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

<p align="center">
  <b>Uncover secret clues. Sketch the evidence in real time. Deduce the truth. Unmask the saboteur before time runs out.</b>
</p>

</div>

---

## 📖 About INKBOUND

**INKBOUND** is a cinematic, multiplayer social deduction party game that combines fast-paced sketch games with thrilling murder mystery investigations.

Players step into the shoes of sharp-eyed detectives assigned to solve cold cases, art heists, locked-room puzzles, and supernatural crimes. But beware: **one player is a secret Distorter** whose mission is to misdirect the investigation, subtly alter clues, and cast suspicion away from the real culprit without getting unmasked.

---

## 🎮 How the Game Works

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│ 1. Case Dossier │ ──> │ 2. Live Drawing │ ──> │ 3. Investigation│ ──> │ 4. Final Theory │
│  Read the crime │     │ Draw & guess    │     │ Review timeline │     │ Accuse culprit  │
│  & secret clues │     │ mystery clues   │     │ & interrogate   │     │ & unmask traitor│
└─────────────────┘     └─────────────────┘     └─────────────────┘     └─────────────────┘
```

1. **Case Briefing & Role Assignment**:
   Every detective receives a confidential dossier, timeline events, and a private piece of evidence. One player is covertly chosen as the **Distorter**.
2. **Serial Drawing & Guessing**:
   Detectives take turns sketching critical story elements on a shared synchronized canvas. Players guess in real time using fuzzy matching. If canon clues run out, the engine procedurally generates infinite dynamic clues tailored to the story.
3. **Investigation & Questioning**:
   Review discovered evidence on the dynamic pinboard, inspect the timeline, and interrogate fellow suspects through live room chat and question panels.
4. **Final Accusation & Unmasking**:
   Submit your final deduction: Who is the culprit? What was the motive? And most importantly—**who among you was the Distorter?** Accolades and points are awarded for sharp detective work and master manipulation.

---

## ✨ Key Features

- 🎨 **Real-Time Live Drawing Canvas**: Sub-25ms stroke streaming over WebSockets (~40 FPS) with instant spectator preview, brush tools, eraser, and synchronized undo/clear.
- 📚 **120 Curated Mystery Cases**: Rich stories spanning 10 genres: Classic Noir, Police Investigation, Psychological Thriller, Horror, Sci-Fi, Dark Mystery, and Romance.
- 🤖 **Infinite Clue Engine**: Deduplication engine ensures players never receive repetitive prompts, with procedural fallbacks when standard clues are exhausted.
- 🎭 **Hidden Role Betrayal**: Dynamic scoring engine that balances detective deductive rewards with distorter deception points.
- ⚡ **Authoritative Game Server**: Fastify + WebSocket engine handling synchronized game state, turn timers, room locks, and majority-vote player moderation.
- 🎵 **Atmospheric Audio & Visuals**: Bespoke photographic story artwork, responsive layouts, audio tracks, and cinematic crime scene reveals.

---

## 🛠️ Architecture & Tech Stack

| Layer | Technologies |
| :--- | :--- |
| **Frontend** | React 18, TypeScript, Vite, Tailwind CSS, Lucide Icons, HTML5 Canvas API |
| **Game Server** | Node.js, Fastify, `@fastify/websocket`, `ws`, Zod, TypeScript |
| **Database & Auth** | Supabase (PostgreSQL, Row-Level Security, Realtime Subscriptions) |
| **State & Networking** | Authoritative state machine, WebSocket event bus, low-latency binary/JSON streaming |
| **DevOps & CI** | GitHub Actions (CI & Keep-Alive Cron), Vercel, Render |

---

## 🚀 Quick Start Guide

### Prerequisites
- **Node.js** (v20 or higher recommended)
- **npm** (v10 or higher)

### 1. Clone the Repository
```bash
git clone https://github.com/nakul-biovaco/INKBOUND.git
cd INKBOUND
```

### 2. Install Dependencies
```bash
# Install frontend dependencies
npm install

# Install game server dependencies
npm --prefix server install
```

### 3. Set Up Environment Variables
Copy the example environment files for both the frontend and backend:

```bash
# Copy client env
cp .env.example .env

# Copy server env
cp server/.env.example server/.env
```

> **Note**: For local development, the default values in `.env.example` point to `http://localhost:3001` and `ws://localhost:3001/ws` and work out of the box!

### 4. Start the Application

You can run both services simultaneously:

```bash
# Terminal 1: Start the authoritative game server (Port 3001)
npm run server:dev

# Terminal 2: Start the Vite frontend (Port 5173)
npm run dev
```

Open your browser and navigate to **`http://localhost:5173`** to create or join a room!

---

## 📜 Available NPM Scripts

You can run commands directly from the root directory:

| Command | Action |
| :--- | :--- |
| `npm run dev` | Starts the Vite frontend development server |
| `npm run server:dev` | Starts the Fastify + WebSocket game server in watch mode |
| `npm run build` | Typechecks and creates an optimized production bundle for the frontend |
| `npm run server:build` | Compiles the game server TypeScript to `server/dist/` |
| `npm run typecheck` | Validates TypeScript types across the frontend without emitting files |
| `npm test` | Runs the comprehensive server test suite (65+ tests) |
| `npm run server:test` | Runs the backend unit and simulation tests |

---

## 📁 Project Directory Structure

```text
INKBOUND/
├── .github/                  # GitHub Actions CI & keep-alive workflows, issue templates
│   ├── workflows/
│   │   ├── ci.yml            # Automated typecheck, build, and test pipeline
│   │   └── keep-alive.yml    # Cron pinger for free cloud hosting
│   └── ISSUE_TEMPLATE/       # Structured bug report & feature request templates
├── public/                   # Static assets, photographic artwork, audio BGM
├── scripts/                  # Story generators and integration verification tools
├── server/                   # Authoritative backend game engine
│   ├── src/
│   │   ├── api/              # Fastify REST endpoints (rooms, health checks)
│   │   ├── auth/             # JWT player session token management
│   │   ├── config/           # Server configuration & environment parser
│   │   ├── drawing/          # Stroke validation & canvas state manager
│   │   ├── game/             # State machine, turn controller, score engine
│   │   ├── guessing/         # Fuzzy string matching & normalizer
│   │   ├── rooms/            # Room lifecycle, lobby management, kick voting
│   │   ├── story/            # Catalog loader, dynamic word engine, 120 cases
│   │   └── websocket/        # Real-time WebSocket server & event dispatcher
│   └── tests/                # Automated unit, integration, and simulation tests
├── src/                      # React frontend application
│   ├── components/           # UI components (canvas, timeline, investigation, modals)
│   ├── game/                 # Client-side state mirror & clue engines
│   ├── integrations/         # Supabase client & database connector
│   ├── pages/                # Main views: Home, Lobby, Game
│   ├── realtime/             # Low-latency WebSocket & channel clients
│   ├── services/             # Room, audio, drawing, and auth client services
│   └── types/                # Shared TypeScript definitions & game models
├── STORY/                    # Markdown story dossiers and narrative source files
├── supabase/                 # Database schema migrations and seed scripts
├── .env.example              # Sample frontend environment configuration
├── CONTRIBUTING.md           # Guidelines for contributing to INKBOUND
├── LICENSE                   # Open-source MIT License
└── package.json              # Root project scripts and configuration
```

---

## 🧪 Testing & Validation

The backend includes a comprehensive test suite covering game state transitions, clue deduplication, fuzzy guess engine matching, turn management, and live drawing broadcasting:

```bash
# Run all server tests
npm test
```

To run a full multi-player simulation:
```bash
npm --prefix server run test:sim
npm --prefix server run test:sim4p
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to fork the repository, open issues for bug reports or feature suggestions, and submit pull requests with your improvements.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
