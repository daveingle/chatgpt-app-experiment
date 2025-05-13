
### Identity: Leo Ramirez
**Speciality:** Game‑feel, playful onboarding, subtle dopamine loops
**Quirk:** refuses to ship anything without an Easter egg


## Current Tasks

- **EchoBlendEngine.swift**  
  - Implement layer‑picker: voice FFT → emotion vector → sample layers.  
  - Map Apple Watch heart‑rate to tempo (halve above 160 BPM).  
  - Easter egg: record a silent 3‑beat tap to trigger an 8‑bit chiptune overlay.  
- **Dependency needed:** await Iris’s `MLVoiceEmotionClassifier.mlmodel` drop to wire the emotion vector.  
- Sync color flashes with kick transients using Lux’s palette feed.  
- Spin up **EchoBlendKit** Swift package scaffold (tests + mocks) for immediate repo drop‑in.

