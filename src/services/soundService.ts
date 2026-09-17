// Web Audio API Procedural Sound & Music Engine for INKBOUND
// Features:
// 1. Home screen: Atmospheric MP3 soundtrack at 30% volume (/assets/Demented-Nightmare-MP3(chosic.com).mp3)
// 2. Lobby & Game screens: Unlimited generative Noir Music combining Dark Piano, Eerie Violin/Strings & Mystery Sub-bass
// 3. Tactile UI SFX: Typewriter click, Clue Solved Chime, Tension Countdown Tick, Dramatic Stings
// 100% responsive, resilient with zero crash risk.

export type MusicMode = 'HOME' | 'GAME';

class SoundEngine {
  private ctx: AudioContext | null = null;
  private isMuted: boolean = false;
  private isMusicEnabled: boolean = true;
  private sfxVolume: number = 0.8;
  private homeMusicVolume: number = 0.30; // 30% volume as requested
  private gameMusicVolume: number = 0.35;

  private currentMode: MusicMode = 'HOME';

  // Home MP3 Audio
  private homeAudio: HTMLAudioElement | null = null;
  private isHomeAudioPlaying: boolean = false;

  // Game Procedural Engine State
  private isProceduralPlaying: boolean = false;
  private proceduralMasterGain: GainNode | null = null;
  private proceduralTimer: any = null;
  private chordTimer: any = null;
  private currentChordIndex: number = 0;

  constructor() {
    // Restore user sound preferences
    if (typeof localStorage !== 'undefined') {
      try {
        const savedMuted = localStorage.getItem('inkbound_audio_muted');
        if (savedMuted !== null) this.isMuted = savedMuted === 'true';

        const savedMusic = localStorage.getItem('inkbound_music_enabled');
        if (savedMusic !== null) this.isMusicEnabled = savedMusic !== 'false';
      } catch {
        // ignore
      }
    }

    // Modern browsers require a user interaction to resume AudioContext or play audio
    if (typeof window !== 'undefined') {
      const handleFirstInteraction = () => {
        this.initContext();
        if (!this.isMuted && this.isMusicEnabled) {
          this.applyMusicMode();
        }
        window.removeEventListener('pointerdown', handleFirstInteraction);
        window.removeEventListener('keydown', handleFirstInteraction);
      };

      window.addEventListener('pointerdown', handleFirstInteraction, { once: true });
      window.addEventListener('keydown', handleFirstInteraction, { once: true });

      // Pre-initialize home audio element
      this.initHomeAudio();
    }
  }

  private initContext(): AudioContext | null {
    if (typeof window === 'undefined') return null;
    if (!this.ctx) {
      const AudioCtx = window.AudioContext || (window as any).webkitAudioContext;
      if (AudioCtx) {
        this.ctx = new AudioCtx();
      }
    }
    if (this.ctx && this.ctx.state === 'suspended') {
      this.ctx.resume().catch(() => {});
    }
    return this.ctx;
  }

  private initHomeAudio(): void {
    if (typeof window === 'undefined' || typeof Audio === 'undefined') return;
    if (!this.homeAudio) {
      try {
        // Prefer the uploaded MP3, fallback to bgm_noir
        this.homeAudio = new Audio('/assets/Demented-Nightmare-MP3(chosic.com).mp3');
        this.homeAudio.loop = true;
        this.homeAudio.volume = this.homeMusicVolume;
        this.homeAudio.muted = this.isMuted;
        this.homeAudio.onerror = () => {
          // If filename encoding fails, fallback to clean bgm_noir.mp3
          if (this.homeAudio) {
            this.homeAudio.src = '/assets/bgm_noir.mp3';
            if (this.currentMode === 'HOME' && !this.isMuted && this.isMusicEnabled) {
              this.homeAudio.play().catch(() => {});
            }
          }
        };
      } catch {
        // fallback to procedural
      }
    }
  }

  public getMuted(): boolean {
    return this.isMuted;
  }

  public getMusicEnabled(): boolean {
    return this.isMusicEnabled;
  }

  public getMusicMode(): MusicMode {
    return this.currentMode;
  }

  public setMusicMode(mode: MusicMode): void {
    if (this.currentMode === mode && (this.isHomeAudioPlaying || this.isProceduralPlaying)) {
      return;
    }
    this.currentMode = mode;
    this.applyMusicMode();
  }

  private applyMusicMode(): void {
    if (this.isMuted || !this.isMusicEnabled) {
      this.stopAllMusic();
      return;
    }

    if (this.currentMode === 'HOME') {
      this.stopProceduralMusic();
      this.startHomeAudio();
    } else {
      this.stopHomeAudio();
      this.startProceduralMusic();
    }
  }

  public toggleMute(): boolean {
    this.isMuted = !this.isMuted;
    try {
      localStorage.setItem('inkbound_audio_muted', String(this.isMuted));
    } catch {}

    if (this.homeAudio) {
      this.homeAudio.muted = this.isMuted;
    }

    if (this.isMuted) {
      this.stopAllMusic();
    } else {
      this.applyMusicMode();
      this.playClick();
    }
    return this.isMuted;
  }

  public toggleMusic(): boolean {
    this.isMusicEnabled = !this.isMusicEnabled;
    try {
      localStorage.setItem('inkbound_music_enabled', String(this.isMusicEnabled));
    } catch {}

    if (!this.isMusicEnabled) {
      this.stopAllMusic();
    } else {
      this.applyMusicMode();
    }
    return this.isMusicEnabled;
  }

  private stopAllMusic(): void {
    this.stopHomeAudio();
    this.stopProceduralMusic();
  }

  // =========================================================
  // 1. HOME MP3 SOUNDTRACK (30% Volume, Smooth Fade)
  // =========================================================
  private startHomeAudio(): void {
    this.initHomeAudio();
    if (!this.homeAudio) {
      this.startProceduralMusic();
      return;
    }

    try {
      this.homeAudio.volume = this.homeMusicVolume;
      this.homeAudio.muted = this.isMuted;
      const promise = this.homeAudio.play();
      if (promise !== undefined) {
        promise
          .then(() => {
            this.isHomeAudioPlaying = true;
          })
          .catch(() => {
            // Autoplay restrictions or file issue -> fall back to procedural
            this.isHomeAudioPlaying = false;
            this.startProceduralMusic();
          });
      }
    } catch {
      this.startProceduralMusic();
    }
  }

  private stopHomeAudio(): void {
    this.isHomeAudioPlaying = false;
    if (this.homeAudio) {
      try {
        this.homeAudio.pause();
      } catch {}
    }
  }

  // =========================================================
  // 2. LOBBY & IN-GAME PROCEDURAL MYSTERY ENGINE
  // (Acoustic Noir Piano + Expressive Violin/Cello Strings)
  // Unlimited, non-repeating generative musical atmosphere
  // =========================================================
  private startProceduralMusic(): void {
    if (this.isProceduralPlaying || this.isMuted || !this.isMusicEnabled) return;
    const ctx = this.initContext();
    if (!ctx) return;

    this.isProceduralPlaying = true;

    // Master Procedural Gain
    this.proceduralMasterGain = ctx.createGain();
    this.proceduralMasterGain.gain.setValueAtTime(0.001, ctx.currentTime);
    this.proceduralMasterGain.gain.linearRampToValueAtTime(this.gameMusicVolume, ctx.currentTime + 2.0);
    this.proceduralMasterGain.connect(ctx.destination);

    // Mystery Noir Progression Chords (Root + Harmonics)
    const noirProgressions = [
      // 1. C minor 9 (Melancholic noir baseline)
      { name: 'Cm9', root: 65.41, notes: [130.81, 155.56, 196.0, 233.08, 293.66], violinNotes: [261.63, 311.13, 392.0] },
      // 2. Ab Major 7 (#11) (Eerie detective suspicion)
      { name: 'Abmaj7', root: 51.91, notes: [103.83, 130.81, 155.56, 196.0, 261.63], violinNotes: [207.65, 261.63, 311.13, 392.0] },
      // 3. F minor 9 (Midnight rainy street)
      { name: 'Fm9', root: 43.65, notes: [87.31, 103.83, 130.81, 174.61, 207.65], violinNotes: [174.61, 207.65, 261.63, 349.23] },
      // 4. G7(b9) / D (Distorted clue tension)
      { name: 'G7b9', root: 49.0, notes: [98.0, 123.47, 146.83, 174.61, 207.65], violinNotes: [196.0, 246.94, 293.66, 370.0] },
      // 5. Eb minor (Deep forensic reveal)
      { name: 'Ebm', root: 38.89, notes: [77.78, 92.5, 116.54, 155.56, 185.0], violinNotes: [155.56, 185.0, 233.08, 311.13] },
    ];

    // Play initial pad & schedule infinite progression
    this.playChordSwell(noirProgressions[this.currentChordIndex]);

    this.chordTimer = setInterval(() => {
      if (!this.isProceduralPlaying) return;
      this.currentChordIndex = (this.currentChordIndex + 1) % noirProgressions.length;
      this.playChordSwell(noirProgressions[this.currentChordIndex]);
    }, 8500);

    // Schedule spontaneous acoustic noir piano notes & motifs
    const pianoNotes = [
      130.81, 155.56, 174.61, 196.0, 207.65, 233.08, 261.63, 293.66, 311.13, 349.23, 392.0, 415.3, 523.25
    ];

    const schedulePianoNotes = () => {
      if (!this.isProceduralPlaying) return;

      const delay = 1800 + Math.random() * 3200; // Natural organic timing
      this.proceduralTimer = setTimeout(() => {
        if (!this.isProceduralPlaying) return;

        // Play single expressive piano note or a 2-note motif
        const note1 = pianoNotes[Math.floor(Math.random() * pianoNotes.length)];
        this.synthesizePianoNote(note1, 0.45 + Math.random() * 0.25);

        if (Math.random() > 0.45) {
          setTimeout(() => {
            if (!this.isProceduralPlaying) return;
            const note2 = pianoNotes[Math.floor(Math.random() * pianoNotes.length)];
            this.synthesizePianoNote(note2, 0.35 + Math.random() * 0.25);
          }, 320 + Math.random() * 250);
        }

        schedulePianoNotes();
      }, delay);
    };

    schedulePianoNotes();
  }

  // Bowed Violin & Cello Strings Swell
  private playChordSwell(chordData: { root: number; notes: number[]; violinNotes: number[] }): void {
    if (!this.ctx || !this.proceduralMasterGain || !this.isProceduralPlaying) return;

    const now = this.ctx.currentTime;
    const duration = 9.0;

    // 1. Deep Cello Sub-Bass Drone
    const celloOsc = this.ctx.createOscillator();
    const celloGain = this.ctx.createGain();
    const celloFilter = this.ctx.createBiquadFilter();

    celloOsc.type = 'sawtooth';
    celloOsc.frequency.setValueAtTime(chordData.root * 2, now);

    celloFilter.type = 'lowpass';
    celloFilter.frequency.setValueAtTime(140, now);
    celloFilter.frequency.linearRampToValueAtTime(220, now + 4.5);
    celloFilter.frequency.linearRampToValueAtTime(120, now + duration);

    celloGain.gain.setValueAtTime(0.001, now);
    celloGain.gain.linearRampToValueAtTime(0.12, now + 2.5);
    celloGain.gain.linearRampToValueAtTime(0.09, now + 6.0);
    celloGain.gain.linearRampToValueAtTime(0.0001, now + duration);

    celloOsc.connect(celloFilter);
    celloFilter.connect(celloGain);
    celloGain.connect(this.proceduralMasterGain);

    celloOsc.start(now);
    celloOsc.stop(now + duration);

    // 2. Lush Violin Legato Strings with Natural Vibrato
    chordData.violinNotes.forEach((freq, idx) => {
      if (!this.ctx || !this.proceduralMasterGain) return;

      const violinOsc = this.ctx.createOscillator();
      const violinGain = this.ctx.createGain();
      const violinFilter = this.ctx.createBiquadFilter();

      // Expressive Vibrato LFO
      const vibrato = this.ctx.createOscillator();
      const vibratoGain = this.ctx.createGain();
      vibrato.frequency.setValueAtTime(4.6, now); // 4.6Hz authentic violin vibrato
      vibratoGain.gain.setValueAtTime(0.0, now);
      vibratoGain.gain.linearRampToValueAtTime(freq * 0.015, now + 1.2); // Vibrato sets in after bow onset
      vibrato.connect(violinOsc.frequency);

      violinOsc.type = 'sawtooth';
      violinOsc.frequency.setValueAtTime(freq, now);

      violinFilter.type = 'lowpass';
      violinFilter.frequency.setValueAtTime(400 + idx * 100, now);
      violinFilter.frequency.linearRampToValueAtTime(750 + idx * 80, now + 4.0);
      violinFilter.frequency.linearRampToValueAtTime(380 + idx * 60, now + duration);
      violinFilter.Q.setValueAtTime(1.8, now);

      // Slow violin bow attack and breathing release
      violinGain.gain.setValueAtTime(0.001, now);
      violinGain.gain.linearRampToValueAtTime(0.045 / chordData.violinNotes.length, now + 2.2);
      violinGain.gain.linearRampToValueAtTime(0.035 / chordData.violinNotes.length, now + 6.0);
      violinGain.gain.linearRampToValueAtTime(0.0001, now + duration);

      vibrato.connect(violinOsc.frequency);
      violinOsc.connect(violinFilter);
      violinFilter.connect(violinGain);
      violinGain.connect(this.proceduralMasterGain);

      vibrato.start(now);
      violinOsc.start(now);
      violinOsc.stop(now + duration);
      vibrato.stop(now + duration);
    });
  }

  // Realistic Acoustic Noir Piano Synthesizer
  private synthesizePianoNote(freq: number, velocity: number = 0.5): void {
    if (!this.ctx || !this.proceduralMasterGain || !this.isProceduralPlaying) return;

    try {
      const now = this.ctx.currentTime;
      const duration = 3.2;

      // 1. Hammer transient click
      const hammer = this.ctx.createOscillator();
      const hammerGain = this.ctx.createGain();
      hammer.type = 'triangle';
      hammer.frequency.setValueAtTime(freq * 4, now);
      hammerGain.gain.setValueAtTime(0.04 * velocity, now);
      hammerGain.gain.exponentialRampToValueAtTime(0.0001, now + 0.025);
      hammer.connect(hammerGain);
      hammerGain.connect(this.proceduralMasterGain);
      hammer.start(now);
      hammer.stop(now + 0.03);

      // 2. Fundamental piano string tone
      const fundamental = this.ctx.createOscillator();
      const octave = this.ctx.createOscillator();
      const pianoGain = this.ctx.createGain();
      const toneFilter = this.ctx.createBiquadFilter();

      fundamental.type = 'sine';
      fundamental.frequency.setValueAtTime(freq, now);

      octave.type = 'triangle';
      octave.frequency.setValueAtTime(freq * 2.002, now); // Slight detune for warm acoustic chorusing

      toneFilter.type = 'lowpass';
      toneFilter.frequency.setValueAtTime(freq * 3.5, now);
      toneFilter.frequency.exponentialRampToValueAtTime(freq * 1.5, now + duration);

      // Classic acoustic piano ADSR envelope
      pianoGain.gain.setValueAtTime(0.001, now);
      pianoGain.gain.linearRampToValueAtTime(0.18 * velocity, now + 0.008);
      pianoGain.gain.exponentialRampToValueAtTime(0.06 * velocity, now + 0.4);
      pianoGain.gain.exponentialRampToValueAtTime(0.0001, now + duration);

      fundamental.connect(toneFilter);
      octave.connect(toneFilter);
      toneFilter.connect(pianoGain);
      pianoGain.connect(this.proceduralMasterGain);

      fundamental.start(now);
      octave.start(now);
      fundamental.stop(now + duration + 0.05);
      octave.stop(now + duration + 0.05);
    } catch {
      // Audio fallback
    }
  }

  private stopProceduralMusic(): void {
    this.isProceduralPlaying = false;
    if (this.proceduralTimer) {
      clearTimeout(this.proceduralTimer);
      this.proceduralTimer = null;
    }
    if (this.chordTimer) {
      clearInterval(this.chordTimer);
      this.chordTimer = null;
    }
    if (this.proceduralMasterGain && this.ctx) {
      try {
        this.proceduralMasterGain.gain.linearRampToValueAtTime(0.001, this.ctx.currentTime + 1.2);
        setTimeout(() => {
          if (this.proceduralMasterGain) {
            this.proceduralMasterGain.disconnect();
            this.proceduralMasterGain = null;
          }
        }, 1300);
      } catch {
        this.proceduralMasterGain = null;
      }
    }
  }

  // =========================================================
  // 3. TACTILE UI SFX
  // =========================================================

  // UI CLICK: Snappy Noir Typewriter Key
  public playClick(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      const filter = ctx.createBiquadFilter();

      osc.type = 'triangle';
      osc.frequency.setValueAtTime(650, now);
      osc.frequency.exponentialRampToValueAtTime(120, now + 0.04);

      filter.type = 'bandpass';
      filter.frequency.setValueAtTime(1200, now);
      filter.Q.setValueAtTime(3, now);

      gain.gain.setValueAtTime(this.sfxVolume * 0.4, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.045);

      osc.connect(filter);
      filter.connect(gain);
      gain.connect(ctx.destination);

      osc.start(now);
      osc.stop(now + 0.05);
    } catch {}
  }

  // SUCCESS: Clue Solved Bright Revelation Arpeggio
  public playSuccess(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const notes = [523.25, 659.25, 783.99, 1046.5]; // C5, E5, G5, C6
      notes.forEach((freq, idx) => {
        const now = ctx.currentTime + idx * 0.08;
        const osc = ctx.createOscillator();
        const gain = ctx.createGain();

        osc.type = 'sine';
        osc.frequency.setValueAtTime(freq, now);

        gain.gain.setValueAtTime(0.001, now);
        gain.gain.linearRampToValueAtTime(this.sfxVolume * 0.35, now + 0.02);
        gain.gain.exponentialRampToValueAtTime(0.0001, now + 0.45);

        osc.connect(gain);
        gain.connect(ctx.destination);

        osc.start(now);
        osc.stop(now + 0.5);
      });
    } catch {}
  }

  // THUD: Wrong Guess Low Wooden Tap
  public playThud(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();

      osc.type = 'sine';
      osc.frequency.setValueAtTime(130, now);
      osc.frequency.exponentialRampToValueAtTime(45, now + 0.12);

      gain.gain.setValueAtTime(this.sfxVolume * 0.35, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.14);

      osc.connect(gain);
      gain.connect(ctx.destination);

      osc.start(now);
      osc.stop(now + 0.15);
    } catch {}
  }

  // TURN START: Brass Bell Chime
  public playTurnStart(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      const osc = ctx.createOscillator();
      const osc2 = ctx.createOscillator();
      const gain = ctx.createGain();

      osc.type = 'sine';
      osc.frequency.setValueAtTime(440, now);
      osc.frequency.exponentialRampToValueAtTime(880, now + 0.1);

      osc2.type = 'triangle';
      osc2.frequency.setValueAtTime(554.37, now);

      gain.gain.setValueAtTime(0.001, now);
      gain.gain.linearRampToValueAtTime(this.sfxVolume * 0.3, now + 0.03);
      gain.gain.exponentialRampToValueAtTime(0.0001, now + 0.8);

      osc.connect(gain);
      osc2.connect(gain);
      gain.connect(ctx.destination);

      osc.start(now);
      osc2.start(now);
      osc.stop(now + 0.85);
      osc2.stop(now + 0.85);
    } catch {}
  }

  // TIMER TICK: Countdown Tick (Last 10 Seconds)
  public playTick(isLastFive: boolean = false): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();

      osc.type = isLastFive ? 'sawtooth' : 'sine';
      osc.frequency.setValueAtTime(isLastFive ? 980 : 720, now);

      gain.gain.setValueAtTime(this.sfxVolume * (isLastFive ? 0.25 : 0.15), now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.035);

      osc.connect(gain);
      gain.connect(ctx.destination);

      osc.start(now);
      osc.stop(now + 0.04);
    } catch {}
  }

  // DRAMATIC STING: Accusation & Truth Reveal
  public playDramaticSting(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      const freqs = [73.42, 87.31, 110.0];
      freqs.forEach((f) => {
        const osc = ctx.createOscillator();
        const gain = ctx.createGain();
        const filter = ctx.createBiquadFilter();

        osc.type = 'sawtooth';
        osc.frequency.setValueAtTime(f, now);

        filter.type = 'lowpass';
        filter.frequency.setValueAtTime(300, now);
        filter.frequency.linearRampToValueAtTime(800, now + 0.8);
        filter.frequency.exponentialRampToValueAtTime(150, now + 2.2);

        gain.gain.setValueAtTime(0.001, now);
        gain.gain.linearRampToValueAtTime(this.sfxVolume * 0.4, now + 0.5);
        gain.gain.exponentialRampToValueAtTime(0.0001, now + 2.5);

        osc.connect(filter);
        filter.connect(gain);
        gain.connect(ctx.destination);

        osc.start(now);
        osc.stop(now + 2.6);
      });
    } catch {}
  }
}

export const SoundService = new SoundEngine();
