

# SENSES Sensory Stack

_A cross‑layer map of how a single “moment” travels from capture to multi‑modal playback across Apple platforms._

```mermaid
graph LR
  %% ───── Capture Layer ─────
  subgraph Capture Layer
    A1[Text Entry ✍️]:::cap
    A2[Photo / Video 📷]:::cap
    A3[Audio Snippet 🎙️]:::cap
  end
  %% ───── ML Processing ─────
  subgraph ML Processing
    P1[EmotionClassifier.mlmodel]:::proc
    P2[ColorMoodNet.mlmodel]:::proc
    P3[VoiceSentimentNet.mlmodel]:::proc
  end
  %% ───── Asset Generation ─────
  subgraph Asset Generation
    G1[EchoBlendKit 🎧]:::gen
    G2[HapticPaletteKit 🤲]:::gen
    G3[OrbSceneBuilder 🪩]:::gen
    G4[SmellLaterProfile.json 🧪]:::gen
  end
  %% ───── Cross‑device Rendering ─────
  subgraph Cross‑device Rendering
    R1[iOS Postcard View 📱]:::rend
    R2[watchOS Haptic Player ⌚️]:::rend
    R3[visionOS Spatial Orb 👓]:::rend
    R4[BLE Scent Diffuser 🌸]:::rend
  end

  %% Flow edges
  A1 -- text features --> P1
  A2 -- pixel histogram --> P2
  A3 -- MFCCs --> P3

  P1 --> G1
  P1 --> G2
  P2 --> G2
  P2 --> G3
  P3 --> G1
  P3 --> G2

  G1 --> R1
  G1 --> R2
  G2 --> R1
  G2 --> R2
  G3 --> R3
  G4 --> R4

  %% Styling
  classDef cap  fill:#E0F7FA,stroke:#00796B,color:#004D40;
  classDef proc fill:#FFF3E0,stroke:#F57C00,color:#E65100;
  classDef gen  fill:#E8F5E9,stroke:#388E3C,color:#1B5E20;
  classDef rend fill:#E3F2FD,stroke:#1976D2,color:#0D47A1;
```

---

## Layer Breakdown

| Layer | Purpose | Key Components | Notes |
|-------|---------|----------------|-------|
| **Capture** | Raw user input | Text, Photo/Video, Short Audio | All processed **on‑device**; zero cloud storage. |
| **ML Processing** | Lightweight sentiment + semantic inference | • `EmotionClassifier` (Core ML)  • `ColorMoodNet` (VGG‑lite)  • `VoiceSentimentNet` (TinyConv‑RNN) | Targets < 10 ms inference on iPhone 16; models bundled & update via in‑app ML patches. |
| **Asset Generation** | Translate ML output into multi‑modal assets | • **EchoBlendKit** (audio)  • **HapticPaletteKit** (.ahap)  • **OrbSceneBuilder** (SceneKit / RealityKit)  • **SmellLaterProfile.json** | Modular; Swift packages under `Packages/Services/…`. |
| **Cross‑device Rendering** | Deliver the “living postcard” | iOS (core view), watchOS (wrist haptics), visionOS (spatial orb), **BLE Scent Diffuser** (future) | Renderer picks best asset subset per platform. |

---

### “Smell Later” BLE Extension Hook (v0.1)

| Field | Type | Range | Units | Description |
|-------|------|-------|-------|-------------|
| **Service UUID** | – | 0xA11E | – | Primary Scent Diffuser service |
| **TopNoteIntensity** | UInt8 | 0–100 | % | Relative top‑note strength |
| **MidNoteIntensity** | UInt8 | 0–100 | % | Relative mid‑note strength |
| **BaseNoteIntensity** | UInt8 | 0–100 | % | Relative base‑note strength |
| **MixDuration** | UInt16 | 0–600 | seconds | How long the blend should persist |

**Example payload**

```json
{
  "top": 75,
  "mid": 40,
  "base": 20,
  "duration": 90
}
```

> _Design rationale:_ keeping payload ≤ 20 bytes ensures it fits a single BLE write without fragmentation on common diffusers.

---

### Privacy & Ethics Snapshot (1‑Pager Outline)

1. **On‑device only** data path; no cloud relay by default.  
2. Max retention: **30 days** of raw captures; assets may persist longer (user‑opt‑in).  
3. All ML models are compact & explainable; no large‑scale profiling.  
4. Accessibility sliders give neuro‑divergent users control over sensory intensity.  

_Detailed sidebar to follow in a separate doc._
