// Vector sketches matching the exact drawings in reference screenshots 2 & 3:
// 1. East Gate with person walking with red bag
// 2. Red car parked under streetlight with tree
// 3. Silhouette in window
// 4. Broken vase with shards
// 5. Skeleton brass key
// 6. Muddy footprints

function createSvgDataUrl(svgString: string): string {
  return `data:image/svg+xml;utf8,${encodeURIComponent(svgString.trim())}`;
}

export const SKETCH_GATE_RED_BAG = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- East Gate Arch & Fence -->
  <path d="M 60 220 L 60 130 Q 110 90 160 130 L 160 220" fill="none" stroke="#222" stroke-width="3.5" stroke-linecap="round"/>
  <path d="M 75 220 L 75 140 Q 110 110 145 140 L 145 220" fill="none" stroke="#333" stroke-width="2.5"/>
  <line x1="95" y1="125" x2="95" y2="220" stroke="#333" stroke-width="2"/>
  <line x1="110" y1="120" x2="110" y2="220" stroke="#333" stroke-width="2"/>
  <line x1="125" y1="125" x2="125" y2="220" stroke="#333" stroke-width="2"/>
  <path d="M 60 130 L 60 115 L 75 125" fill="#333"/>
  <path d="M 160 130 L 160 115 L 145 125" fill="#333"/>
  
  <!-- Fence Left & Right -->
  <line x1="30" y1="220" x2="60" y2="220" stroke="#222" stroke-width="3"/>
  <line x1="35" y1="150" x2="35" y2="220" stroke="#333" stroke-width="2"/>
  <line x1="48" y1="150" x2="48" y2="220" stroke="#333" stroke-width="2"/>
  
  <line x1="160" y1="220" x2="210" y2="220" stroke="#222" stroke-width="3"/>
  <line x1="175" y1="150" x2="175" y2="220" stroke="#333" stroke-width="2"/>
  <line x1="192" y1="150" x2="192" y2="220" stroke="#333" stroke-width="2"/>
  
  <!-- Person walking carrying Red Bag -->
  <!-- Head -->
  <circle cx="250" cy="135" r="11" fill="#1e1e1e"/>
  <!-- Torso -->
  <line x1="250" y1="146" x2="242" y2="190" stroke="#1e1e1e" stroke-width="5" stroke-linecap="round"/>
  <!-- Walking legs -->
  <line x1="242" y1="190" x2="228" y2="225" stroke="#1e1e1e" stroke-width="4.5" stroke-linecap="round"/>
  <line x1="242" y1="190" x2="254" y2="225" stroke="#1e1e1e" stroke-width="4.5" stroke-linecap="round"/>
  <!-- Arms -->
  <line x1="248" y1="155" x2="260" y2="185" stroke="#1e1e1e" stroke-width="3.5" stroke-linecap="round"/>
  <line x1="248" y1="155" x2="236" y2="180" stroke="#1e1e1e" stroke-width="3.5" stroke-linecap="round"/>
  
  <!-- Red Bag -->
  <path d="M 260 185 Q 262 180 266 185 L 273 210 Q 267 215 258 212 Z" fill="#dc2626" stroke="#b91c1c" stroke-width="2"/>
  <path d="M 262 185 Q 264 178 266 185" fill="none" stroke="#881337" stroke-width="2"/>
  
  <!-- Bush on right -->
  <path d="M 290 220 C 275 200, 290 170, 310 175 C 325 160, 350 170, 350 190 C 365 200, 360 220, 345 220 Z" fill="#2d3748" stroke="#1a202c" stroke-width="2"/>
  
  <!-- Moon / Lamp -->
  <circle cx="310" cy="80" r="16" fill="none" stroke="#4a5568" stroke-width="2.5"/>
  
  <!-- Ground line -->
  <line x1="20" y1="225" x2="380" y2="225" stroke="#718096" stroke-width="1.5" stroke-dasharray="8 4"/>
</svg>
`);

export const SKETCH_RED_CAR = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- Street Lamp -->
  <path d="M 90 220 L 90 90 L 98 80 L 105 85 L 100 220" fill="#2d3748"/>
  <path d="M 85 85 L 105 85 L 100 70 L 90 70 Z" fill="#1a202c"/>
  <ellipse cx="95" cy="86" rx="10" ry="3" fill="#fef08a"/>
  
  <!-- Tree behind -->
  <path d="M 115 150 C 100 130, 110 90, 140 100 C 160 85, 185 95, 190 115 C 205 125, 200 150, 175 160 Z" fill="#374151" stroke="#1f2937" stroke-width="2"/>
  
  <!-- Red Car -->
  <path d="M 90 190 L 115 165 L 175 165 L 195 190 L 220 190 C 225 190 228 198 220 205 L 80 205 C 75 205 75 195 82 190 Z" fill="#dc2626" stroke="#991b1b" stroke-width="2.5"/>
  
  <!-- Car Windows -->
  <path d="M 118 168 L 140 168 L 140 185 L 105 185 Z" fill="#e0f2fe" stroke="#333" stroke-width="1.5"/>
  <path d="M 145 168 L 172 168 L 188 185 L 145 185 Z" fill="#e0f2fe" stroke="#333" stroke-width="1.5"/>
  
  <!-- Wheels -->
  <circle cx="115" cy="205" r="14" fill="#1f2937" stroke="#0f172a" stroke-width="3"/>
  <circle cx="115" cy="205" r="6" fill="#e2e8f0"/>
  
  <circle cx="190" cy="205" r="14" fill="#1f2937" stroke="#0f172a" stroke-width="3"/>
  <circle cx="190" cy="205" r="6" fill="#e2e8f0"/>
  
  <!-- Headlight beam -->
  <path d="M 78 195 L 40 185 L 40 215 L 78 200 Z" fill="#fef08a" opacity="0.4"/>
  
  <!-- Road ground -->
  <line x1="30" y1="219" x2="370" y2="219" stroke="#4a5568" stroke-width="2"/>
  <!-- Sun/Moon in sky -->
  <circle cx="280" cy="70" r="12" fill="none" stroke="#718096" stroke-width="2"/>
</svg>
`);

export const SKETCH_WINDOW_SILHOUETTE = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- Window Frame -->
  <rect x="90" y="50" width="220" height="190" fill="#e2e8f0" stroke="#2d3748" stroke-width="4"/>
  <!-- Window Panes Cross -->
  <line x1="200" y1="50" x2="200" y2="240" stroke="#2d3748" stroke-width="4"/>
  <line x1="90" y1="130" x2="310" y2="130" stroke="#2d3748" stroke-width="4"/>
  
  <!-- Silhouette Inside -->
  <!-- Head -->
  <circle cx="200" cy="115" r="24" fill="#0f172a"/>
  <!-- Shoulders / Torso -->
  <path d="M 145 240 C 145 170, 165 150, 200 150 C 235 150, 255 170, 255 240 Z" fill="#0f172a"/>
  
  <!-- Window blind / sill lines -->
  <line x1="80" y1="240" x2="320" y2="240" stroke="#1f2937" stroke-width="6"/>
  <line x1="85" y1="248" x2="315" y2="248" stroke="#475569" stroke-width="3"/>
</svg>
`);

export const SKETCH_BROKEN_VASE = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- Broken ceramic shards & main base -->
  <!-- Main broken lower vase -->
  <path d="M 160 120 L 175 150 L 170 170 L 180 220 L 230 220 L 240 180 L 225 155 L 250 115 Q 210 135 160 120 Z" fill="#e2e8f0" stroke="#1e293b" stroke-width="3"/>
  <!-- Jagged fracture crack lines -->
  <path d="M 195 125 L 205 160 L 190 190 L 210 220" fill="none" stroke="#b91c1c" stroke-width="2"/>
  
  <!-- Shards flying & scattered on floor -->
  <polygon points="135,110 155,95 145,130" fill="#cbd5e1" stroke="#1e293b" stroke-width="2"/>
  <polygon points="255,90 280,105 260,120" fill="#cbd5e1" stroke="#1e293b" stroke-width="2"/>
  <polygon points="120,210 145,200 135,225" fill="#cbd5e1" stroke="#1e293b" stroke-width="2"/>
  <polygon points="260,205 285,215 270,230" fill="#cbd5e1" stroke="#1e293b" stroke-width="2"/>
  
  <!-- Impact spark lines -->
  <line x1="205" y1="80" x2="205" y2="100" stroke="#64748b" stroke-width="2" stroke-linecap="round"/>
  <line x1="175" y1="85" x2="185" y2="100" stroke="#64748b" stroke-width="2" stroke-linecap="round"/>
  <line x1="235" y1="85" x2="225" y2="100" stroke="#64748b" stroke-width="2" stroke-linecap="round"/>
  
  <!-- Floor line -->
  <line x1="50" y1="230" x2="350" y2="230" stroke="#64748b" stroke-width="2"/>
</svg>
`);

export const SKETCH_KEY = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- Skeleton Key angled -->
  <g transform="rotate(-35 200 150)">
    <!-- Ornate Bow -->
    <circle cx="120" cy="150" r="26" fill="none" stroke="#27272a" stroke-width="5"/>
    <circle cx="120" cy="150" r="14" fill="none" stroke="#27272a" stroke-width="3"/>
    
    <!-- Shaft -->
    <line x1="146" y1="150" x2="270" y2="150" stroke="#27272a" stroke-width="7" stroke-linecap="round"/>
    
    <!-- Collar -->
    <rect x="155" y="142" width="8" height="16" fill="#27272a" rx="2"/>
    
    <!-- Bit / Teeth -->
    <path d="M 245 150 L 245 180 L 265 180 L 265 150" fill="#27272a"/>
    <rect x="250" y="160" width="6" height="8" fill="#fbf8f1"/>
    <line x1="260" y1="170" x2="265" y2="170" stroke="#fbf8f1" stroke-width="2"/>
  </g>
</svg>
`);

export const SKETCH_FOOTPRINTS = createSvgDataUrl(`
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="400" height="300">
  <rect width="100%" height="100%" fill="#fbf8f1"/>
  <!-- Left boot print -->
  <g transform="translate(130, 80) rotate(15)">
    <!-- Sole -->
    <ellipse cx="30" cy="40" rx="20" ry="32" fill="#18181b"/>
    <!-- Heel -->
    <ellipse cx="30" cy="95" rx="16" ry="18" fill="#18181b"/>
    <!-- Tread grooves -->
    <line x1="18" y1="30" x2="42" y2="30" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="16" y1="42" x2="44" y2="42" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="18" y1="54" x2="42" y2="54" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="20" y1="95" x2="40" y2="95" stroke="#fbf8f1" stroke-width="2"/>
  </g>
  
  <!-- Right boot print ahead -->
  <g transform="translate(220, 50) rotate(18)">
    <!-- Sole -->
    <ellipse cx="30" cy="40" rx="20" ry="32" fill="#18181b"/>
    <!-- Heel -->
    <ellipse cx="30" cy="95" rx="16" ry="18" fill="#18181b"/>
    <!-- Tread grooves -->
    <line x1="18" y1="30" x2="42" y2="30" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="16" y1="42" x2="44" y2="42" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="18" y1="54" x2="42" y2="54" stroke="#fbf8f1" stroke-width="2"/>
    <line x1="20" y1="95" x2="40" y2="95" stroke="#fbf8f1" stroke-width="2"/>
  </g>
  
  <!-- Mud splatter specks -->
  <circle cx="110" cy="180" r="3" fill="#3f3f46"/>
  <circle cx="280" cy="160" r="2.5" fill="#3f3f46"/>
  <circle cx="260" cy="210" r="3.5" fill="#3f3f46"/>
</svg>
`);

export const DEFAULT_EVIDENCE_SKETCHES = [
  {
    id: 'ev-1',
    author: 'East Gate CCTV',
    time: '11:32 PM',
    title: 'East Gate Exit with Red Bag',
    sketch: SKETCH_GATE_RED_BAG,
  },
  {
    id: 'ev-2',
    author: 'Street Surveillance',
    time: '11:34 PM',
    title: 'Red Getaway Car',
    sketch: SKETCH_RED_CAR,
  },
  {
    id: 'ev-3',
    author: 'Courtyard Camera',
    time: '11:36 PM',
    title: 'Silhouette in 3rd Floor Window',
    sketch: SKETCH_WINDOW_SILHOUETTE,
  },
  {
    id: 'ev-4',
    author: 'Forensics Team',
    time: '11:38 PM',
    title: 'Shattered Antiquity Glass Vase',
    sketch: SKETCH_BROKEN_VASE,
  },
  {
    id: 'ev-5',
    author: 'Access Log Terminal',
    time: '11:40 PM',
    title: 'Master Keycard Override',
    sketch: SKETCH_KEY,
  },
  {
    id: 'ev-6',
    author: 'Perimeter Sweep',
    time: '11:42 PM',
    title: 'Muddy Tread Footprints',
    sketch: SKETCH_FOOTPRINTS,
  },
];
