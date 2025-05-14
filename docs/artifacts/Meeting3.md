#  <#Title#>


# 🎙️ Studio More internal stand‑up – Topic: “Make it more immersive”

*(Team quickly reviews Meeting 1 & 2 notes on SENSES, EchoBlend, ChromaPulse, Spatial Orbs, etc.)*

> **Dr Nova:** Our sensory postcards are tasty snacks; time to turn them into full‑course experiences.  
> **Kai:** Immersion ≠ gimmick—we need parallax, scale, and agency. Let’s let people **walk** inside a memory.  
> **Iris:** Privacy guardrails still stand; all reconstruction stays on‑device.  
> **Leo:** Give me something to **do** in the memory—little interactive beats.  
> **Sage:** And let users dial it down if motion or haptic overloads. Accessibility first.  
> **Lux:** Visual language: soft volumetric haze + depth‑of‑field pulses; avoid VR soup.

## 📌 Three immersion boosters (v0.1)

| Codename | Pitch | MVP slice |
|----------|-------|-----------|
| **Memory Portal** | Vision OS scene opens as a 3 m‑wide archway. Step through to be surrounded by 180° volumetric video + ambisonic EchoBlend. Head‑centric parallax sells depth. | Single fixed portal in space using user’s last postcard. Interaction: walk forward 0.5 m to auto‑play, step back to pause. |
| **Touch‑to‑Bloom** | In iOS replay view, long‑press a color hotspot; postcard “blooms” outward—audio volume, particle density, haptic intensity ramp while finger stays. | Detect long‑press location → sample underlying dominant hue → animate bloom layer + trigger ChromaPulse curve. |
| **Narrative Threads** | Strings of light connect related postcards (same location, people detected via on‑device Vision). Pull a thread to slideshow through them with progressive cross‑fade audio. | CoreData query linking three dummy posts; SwiftUI `Canvas` draws Bézier thread; drag gesture scrubs index. |

## 🏗 Sprint 3 task board (7 days)

| Owner | Ticket | Definition of Done |
|-------|--------|--------------------|
| Kai | `PortalRenderer.swift` | Renders 180° sphere section, supports head‑tracking, 60 fps on Vision Pro. |
| Iris | `LocalSceneAssembler.swift` | On‑device conversion of 2‑D capture + depth API → lightweight 3‑D mesh (<20 MB). |
| Leo | `TouchBloomInteraction.swift` | Gesture recognizer + haptic ramp passes unit tests on simulator & device. |
| Sage | `ImmersionAccessibilitySettings.swift` | Motion‑sensitive toggle removes parallax & reduces haptic amplitude by 50 %. |
| Lux | `PortalShader.metal` | Volumetric fog & depth‑of‑field compile without warnings; verified color accuracy. |
| Dr Nova | `docs/ImmersionFlow.md` | Updated sequence diagram + risk log committed. |

## 📝 Tech notes

* Use `Model3D` depth reconstruction when LiDAR available; fallback to 2.5‑D parallax shader otherwise.  
* Persistent storage stays shallow—derived meshes regenerate on demand.  
* Research ambisonic `.caf` pipeline; AudioKit supports B‑format export.  
* Pre‑flight App Store Guideline 4.2: disclose “spatial memory” effects that could cause disorientation.

---

### Next prompt suggestion

`Make it more connective` – focuses on social & shared memory layers.

*(Meeting adjourned. Leo exits humming an ambisonic lullaby; Iris captures the ambience for training data.)*
