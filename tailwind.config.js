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
        }
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
      },
      backgroundImage: {
        'radial-vignette': 'radial-gradient(circle at center, transparent 40%, rgba(7, 10, 17, 0.85) 100%)',
        'cork-pattern': 'radial-gradient(#27160c 15%, transparent 16%), radial-gradient(#1c0f08 15%, transparent 16%)',
      },
      animation: {
        'pulse-subtle': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'flicker': 'flicker 4s infinite',
        'stamp': 'stamp 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards',
      },
      keyframes: {
        flicker: {
          '0%, 19.999%, 22%, 62.999%, 64%, 64.999%, 70%, 100%': { opacity: '1' },
          '20%, 21.999%, 63%, 63.999%, 65%, 69.999%': { opacity: '0.6' },
        },
        stamp: {
          '0%': { opacity: '0', transform: 'scale(2.5) rotate(-15deg)' },
          '100%': { opacity: '1', transform: 'scale(1) rotate(-8deg)' },
        }
      }
    },
  },
  plugins: [],
};
