


# Day 2 – Studio More Stand‑up Summary

**Topic:** “Make it more immersive”

## Key Decisions
- Extend **SENSES** from flat postcards into spatial, interactive experiences.
- Approved three *immersion boosters* for the next sprint:
  1. **Memory Portal** – Walk‑through 180° volumetric scene on Vision OS.
  2. **Touch‑to‑Bloom** – Long‑press interaction that ramps visuals, audio, and haptics.
  3. **Narrative Threads** – Connect related memories with interactive light strings.
- Maintain on‑device processing & privacy safeguards.
- Introduce *Immersion Accessibility Settings* to throttle motion and haptic intensity.

## Sprint 3 Board Owners
| Owner | Ticket | Definition of Done |
|-------|--------|--------------------|
| Kai   | `PortalRenderer.swift` | Renders 180° sphere section, head‑tracked, 60 fps on Vision Pro |
| Iris  | `LocalSceneAssembler.swift` | Converts capture + depth to 3‑D mesh < 20 MB, on‑device |
| Leo   | `TouchBloomInteraction.swift` | Gesture recognizer + haptic ramp, unit‑tested |
| Sage  | `ImmersionAccessibilitySettings.swift` | Motion‑safe toggle, haptics –50 % amplitude |
| Lux   | `PortalShader.metal` | Volumetric fog & DOF shader compiles clean |
| Dr Nova | `docs/ImmersionFlow.md` | Updated sequence diagram & risk log committed |

## Tech Notes
- Use `Model3D` depth reconstruction where LiDAR is available; fallback to parallax shader.
- Ambisonic `.caf` pipeline under investigation; AudioKit supports B‑format export.
- App Store Guideline 4.2 considerations for disorientation warnings.

## Next Prompt
“Make it more connective”
