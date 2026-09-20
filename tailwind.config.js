/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        noir: {
          950: '#070a11', // Obsidian shadow
          900: '#0b0f19', // Deepest midnight slate
          850: '#101624', // Shadow vignette
          800: '#161f30', // Detective desk navy
          700: '#1e293b', // Muted slate card
          600: '#334155', // Steel border
          500: '#64748b', // Foggy text
          400: '#94a3b8', // Case file notes
          300: '#cbd5e1', // Dim white
          200: '#e2e8f0', // Cold paper
          100: '#f1f5f9', // Clean chalk
        },
        case: {
          amber: '#eab308',   // Case file classification amber
          gold: '#f59e0b',    // Brass badge
          crimson: '#dc2626', // Crime scene / red investigation thread
          blood: '#991b1b',   // Deep crimson
          cyan: '#38bdf8',    // Cyan evidence UV highlight
          emerald: '#10b981', // Solved verdict green
          parchment: '#fef3c7',// Aged dossier paper
          cork: '#451a03',    // Corkboard wood border
        },
        // ── Unified Cream Parchment Palette ──
        cream: {
          50: '#fdfbf7',
          100: '#fbf7ee',
          200: '#f4ede0',
          300: '#eae0cc',
          400: '#d8c5aa',
          500: '#b89e7c',
          600: '#8c6d48',
        },
        // ── Atmospheric Detective Desk Palette ──
        desk: {
          950: '#07080b',
          900: '#0c0d12',
          850: '#12141a',
          800: '#1a1816',
        },
        // ── Charcoal Ink Typography Palette ──
        ink: {
          950: '#100b08',
          900: '#1a110a',
          800: '#2c2016',
          700: '#443425',
          600: '#5c4632',
          500: '#7a5e45',
        },
        // ── Wax Seal & Brass Accent Palette ──
        seal: {
          red: '#8a1c1c',
          'red-hover': '#9e2222',
          'red-border': '#541010',
          brass: '#8c6d48',
          'brass-light': '#a67c52',
          'brass-dark': '#6e533d',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
        mono: ['"JetBrains Mono"', 'Menlo', 'monospace'],
        dossier: ['"Courier Prime"', '"Courier New"', 'Courier', 'monospace'],
        serif: ['"Playfair Display"', 'Georgia', 'serif'],
        handwriting: ['"Caveat"', 'cursive', 'sans-serif'],
      },
      boxShadow: {
        'noir-glow': '0 0 25px -5px rgba(56, 189, 248, 0.15)',
        'amber-glow': '0 0 25px -5px rgba(234, 179, 8, 0.25)',
        'crimson-glow': '0 0 25px -5px rgba(220, 38, 38, 0.3)',
        'dossier': '0 10px 30px -10px rgba(0, 0, 0, 0.7), 0 0 0 1px rgba(255, 255, 255, 0.05)',
        'paper-docket': '0 15px 45px rgba(0,0,0,0.6), inset 0 0 50px rgba(139,94,60,0.15)',
        'paper-docket-hover': '0 20px 55px rgba(0,0,0,0.7), inset 0 0 60px rgba(139,94,60,0.2)',
        'wax-seal': '0 4px 14px rgba(138,28,28,0.5), inset 0 1px 2px rgba(255,255,255,0.15)',
        'stamp-pressed': '0 2px 6px rgba(0,0,0,0.4), inset 0 1px 0 rgba(255,255,255,0.1)',
      },
      backgroundImage: {
        'radial-vignette': 'radial-gradient(circle at center, transparent 40%, rgba(7, 10, 17, 0.85) 100%)',
        'cork-pattern': 'radial-gradient(#27160c 15%, transparent 16%), radial-gradient(#1c0f08 15%, transparent 16%)',
      },
      animation: {
        'pulse-subtle': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'flicker': 'flicker 4s infinite',
        'stamp': 'stamp 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards',
        'fadeIn': 'fadeIn 0.35s ease-out forwards',
      },
      keyframes: {
        flicker: {
          '0%, 19.999%, 22%, 62.999%, 64%, 64.999%, 70%, 100%': { opacity: '1' },
          '20%, 21.999%, 63%, 63.999%, 65%, 69.999%': { opacity: '0.6' },
        },
        stamp: {
          '0%': { opacity: '0', transform: 'scale(2.5) rotate(-15deg)' },
          '100%': { opacity: '1', transform: 'scale(1) rotate(-8deg)' },
        },
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(6px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      }
    },
  },
  plugins: [],
};
