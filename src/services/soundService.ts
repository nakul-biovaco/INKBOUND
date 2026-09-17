// Web Audio API Procedural Sound and Music Engine for INKBOUND
// Generates authentic noir detective audio, ambient background music, and tactical UI SFX
// 100% offline-ready with zero external asset dependencies or 404 risks.

class SoundEngine {
  private ctx: AudioContext | null = null;
  private isMuted: boolean = false;
  private isMusicEnabled: boolean = true;
  private sfxVolume: number = 0.8;
  private musicVolume: number = 0.35;

  private bgmGainNode: GainNode | null = null;
  private isBgmPlaying: boolean = false;
  private bgmInterval: any = null;
  private bgmAudio: HTMLAudioElement | null = null;

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

    // Modern browsers require a user interaction to resume the AudioContext
    if (typeof window !== 'undefined') {
      const handleFirstInteraction = () => {
        this.initContext();
        if (!this.isMuted && this.isMusicEnabled && !this.isBgmPlaying) {
          this.startBgm();
        }
        window.removeEventListener('pointerdown', handleFirstInteraction);
        window.removeEventListener('keydown', handleFirstInteraction);
      };

      window.addEventListener('pointerdown', handleFirstInteraction, { once: true });
      window.addEventListener('keydown', handleFirstInteraction, { once: true });
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

  public getMuted(): boolean {
    return this.isMuted;
  }

  public getMusicEnabled(): boolean {
    return this.isMusicEnabled;
  }

  public toggleMute(): boolean {
    this.isMuted = !this.isMuted;
    try {
      localStorage.setItem('inkbound_audio_muted', String(this.isMuted));
    } catch {}

    if (this.bgmAudio) {
      this.bgmAudio.muted = this.isMuted;
    }

    if (this.isMuted) {
      this.stopBgm();
    } else {
      if (this.isMusicEnabled) {
        this.startBgm();
      }
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
      this.stopBgm();
    } else if (!this.isMuted) {
      this.startBgm();
    }
    return this.isMusicEnabled;
  }

  // ==========================================
  // SFX: UI CLICK (Snappy Noir Typewriter / Notch)
  // ==========================================
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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // SFX: CLUE SOLVED / SUCCESS CHIME
  // ==========================================
  public playSuccess(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const notes = [523.25, 659.25, 783.99, 1046.5]; // C5, E5, G5, C6 arpeggio
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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // SFX: WRONG GUESS / MUTED THUD
  // ==========================================
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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // SFX: TURN START / BRASS CHIME
  // ==========================================
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
      osc.frequency.setValueAtTime(440, now); // A4
      osc.frequency.exponentialRampToValueAtTime(880, now + 0.1);

      osc2.type = 'triangle';
      osc2.frequency.setValueAtTime(554.37, now); // C#5

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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // SFX: TIMER TICK-TOCK (Last 10 seconds)
  // ==========================================
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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // SFX: DRAMATIC STING / CULPRIT ACCUSATION
  // ==========================================
  public playDramaticSting(): void {
    if (this.isMuted) return;
    const ctx = this.initContext();
    if (!ctx) return;

    try {
      const now = ctx.currentTime;
      // Low sinister minor triad: D2, F2, A2
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
    } catch {
      // Audio fallback
    }
  }

  // ==========================================
  // BACKGROUND NOIR MUSIC: ATMOSPHERIC AUDIO & PROCEDURAL FALLBACK
  // ==========================================
  public startBgm(): void {
    if (this.isBgmPlaying || this.isMuted || !this.isMusicEnabled) return;

    // First try HTML5 audio with the dedicated noir mystery soundtrack
    if (typeof window !== 'undefined' && typeof Audio !== 'undefined') {
      try {
        if (!this.bgmAudio) {
          this.bgmAudio = new Audio('/assets/bgm_noir.mp3');
          this.bgmAudio.loop = true;
          this.bgmAudio.volume = this.musicVolume;
        }
        this.bgmAudio.muted = this.isMuted;
        const playPromise = this.bgmAudio.play();
        if (playPromise !== undefined) {
          playPromise
            .then(() => {
              this.isBgmPlaying = true;
            })
            .catch(() => {
              // Fallback to Web Audio synthesis if file play is blocked
              this.startProceduralBgm();
            });
          return;
        }
      } catch {
        this.startProceduralBgm();
        return;
      }
    }

    this.startProceduralBgm();
  }

  private startProceduralBgm(): void {
    if (this.isBgmPlaying || this.isMuted || !this.isMusicEnabled) return;
    const ctx = this.initContext();
    if (!ctx) return;

    this.isBgmPlaying = true;

    // Master BGM Gain
    this.bgmGainNode = ctx.createGain();
    this.bgmGainNode.gain.setValueAtTime(0.001, ctx.currentTime);
    this.bgmGainNode.gain.linearRampToValueAtTime(this.musicVolume, ctx.currentTime + 2.5);
    this.bgmGainNode.connect(ctx.destination);

    // Noir mystery chord progressions (Hz frequencies)
    const chords = [
      [130.81, 155.56, 196.0, 233.08, 293.66], // C minor 9 (C3, Eb3, G3, Bb3, D4)
      [174.61, 207.65, 261.63, 311.13, 349.23], // F minor 7 (F3, Ab3, C4, Eb4, F4)
      [103.83, 130.81, 155.56, 196.0, 261.63], // Ab major 7 (Ab2, C3, Eb3, G3, C4)
      [98.0, 146.83, 196.0, 246.94, 293.66],    // G dominant (G2, D3, G3, B3, D4)
    ];

    let chordIndex = 0;

    const playNextChord = () => {
      if (!this.isBgmPlaying || !this.ctx || !this.bgmGainNode) return;

      const chord = chords[chordIndex % chords.length];
      chordIndex++;

      const now = this.ctx.currentTime;
      const duration = 6.5; // slow, breathing noir chords

      chord.forEach((freq, idx) => {
        if (!this.ctx || !this.bgmGainNode) return;

        const osc = this.ctx.createOscillator();
        const chordGain = this.ctx.createGain();
        const filter = this.ctx.createBiquadFilter();

        // Warm, detuned detective synth pad
        osc.type = idx % 2 === 0 ? 'sine' : 'triangle';
        osc.frequency.setValueAtTime(freq * (1 + (idx - 2) * 0.002), now);

        filter.type = 'lowpass';
        filter.frequency.setValueAtTime(450 + idx * 80, now);
        filter.frequency.linearRampToValueAtTime(650 + idx * 60, now + duration * 0.5);
        filter.frequency.linearRampToValueAtTime(400 + idx * 80, now + duration);

        // Smooth swell envelope
        chordGain.gain.setValueAtTime(0.001, now);
        chordGain.gain.linearRampToValueAtTime(0.06 / chord.length, now + 1.8);
        chordGain.gain.linearRampToValueAtTime(0.04 / chord.length, now + duration * 0.7);
        chordGain.gain.linearRampToValueAtTime(0.0001, now + duration);

        osc.connect(filter);
        filter.connect(chordGain);
        chordGain.connect(this.bgmGainNode);

        osc.start(now);
        osc.stop(now + duration + 0.1);
      });
    };

    // Trigger initial chord immediately
    playNextChord();
    // Loop every 6.0 seconds for seamless transition
    this.bgmInterval = setInterval(playNextChord, 6000);
  }

  public stopBgm(): void {
    this.isBgmPlaying = false;
    if (this.bgmAudio) {
      try {
        this.bgmAudio.pause();
      } catch {}
    }
    if (this.bgmInterval) {
      clearInterval(this.bgmInterval);
      this.bgmInterval = null;
    }
    if (this.bgmGainNode && this.ctx) {
      try {
        this.bgmGainNode.gain.linearRampToValueAtTime(0.001, this.ctx.currentTime + 0.8);
        setTimeout(() => {
          if (this.bgmGainNode) {
            this.bgmGainNode.disconnect();
            this.bgmGainNode = null;
          }
        }, 900);
      } catch {
        this.bgmGainNode = null;
      }
    }
  }
}

export const SoundService = new SoundEngine();
