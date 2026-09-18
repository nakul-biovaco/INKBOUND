/**
 * Vercel Serverless Function: Keep-Alive Cron Handler
 * Pings the Render backend /health endpoint to ensure it never enters idle sleep.
 */
export default async function handler(req, res) {
  // Allow Vercel environment variable or fallback to configured Render domain
  const backendUrl =
    process.env.VITE_BACKEND_URL ||
    process.env.RENDER_BACKEND_URL ||
    process.env.BACKEND_URL ||
    'https://inkbound.onrender.com';

  const startTime = Date.now();
  const summary = {
    service: 'INKBOUND Keep-Alive Gateway',
    timestamp: new Date().toISOString(),
    vercel: {
      status: 'active',
      region: process.env.VERCEL_REGION || 'edge',
    },
    backend: null,
  };

  try {
    const target = `${backendUrl.replace(/\/$/, '')}/health`;
    const response = await fetch(target, {
      signal: AbortSignal.timeout(15000),
      headers: {
        'User-Agent': 'Inkbound-KeepAlive-Cron/1.0',
      },
    });

    const data = await response.json().catch(() => ({}));
    summary.backend = {
      target,
      status: response.status,
      ok: response.ok,
      latencyMs: Date.now() - startTime,
      serverUptime: data?.uptimeSeconds,
    };
  } catch (err) {
    summary.backend = {
      target: backendUrl,
      error: err.message,
      latencyMs: Date.now() - startTime,
    };
  }

  // Prevent CDN caching so every cron invocation executes fresh
  res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, proxy-revalidate');
  return res.status(200).json(summary);
}
