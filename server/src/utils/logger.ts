export type LogLevel = 'DEBUG' | 'INFO' | 'WARN' | 'ERROR';

export class Logger {
  private context: string;

  constructor(context: string) {
    this.context = context;
  }

  private format(level: LogLevel, message: string, meta?: Record<string, unknown>): string {
    const timestamp = new Date().toISOString();
    const metaStr = meta ? ` | ${JSON.stringify(meta)}` : '';
    return `[${timestamp}] [${level}] [${this.context}] ${message}${metaStr}`;
  }

  public debug(message: string, meta?: Record<string, unknown>): void {
    if (process.env.DEBUG === 'true' || process.env.NODE_ENV !== 'production') {
      console.debug(this.format('DEBUG', message, meta));
    }
  }

  public info(message: string, meta?: Record<string, unknown>): void {
    console.info(this.format('INFO', message, meta));
  }

  public warn(message: string, meta?: Record<string, unknown>): void {
    console.warn(this.format('WARN', message, meta));
  }

  public error(message: string, error?: unknown, meta?: Record<string, unknown>): void {
    const errMeta = error instanceof Error ? { ...meta, error: error.message, stack: error.stack } : { ...meta, error };
    console.error(this.format('ERROR', message, errMeta));
  }
}

export function createLogger(context: string): Logger {
  return new Logger(context);
}
