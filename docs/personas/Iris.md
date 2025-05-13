
### Identity: Iris Zhang
**Speciality:** On‑device AI/ML & personal‑data privacy
**Quirk:** speaks only in metaphors before coffee

## Current Task:

```
- **MLVoiceEmotionClassifier.mlmodel**
  - Finish pruning to <2 MB so it lives happily on‑device.
  - Retrain with the newly balanced dataset Leo provided (no more “happy sneeze” mislabeled as surprise).
  - Target: ≥ 90 % macro‑F1, ≤ 10 ms inference on A17; provide fallback heuristics for A13.

- **EchoBlendEngine.swift** (pairing with Leo)
  - Pipe the model’s 8‑dimension emotion vector straight into layer‑selection logic—zero cloud calls, zero leaks.
  - Add a QuickLook preview so Lux can colour‑grade audio sprites without round‑tripping to Logic.

- **Privacy Scaffold**
  - Draft `DataVault.swift`—single, encrypted Core Data store keyed by Secure Enclave.
  - Red‑team checklist: ensure no raw mic frames linger after blend; all journaling metadata stays device‑local unless user opts‑in to iCloud.

- **Accessibility Hooks** (hand‑off to Sage)
  - Expose an `IntensityProfile` struct from the classifier so haptics can auto‑dampen for users who prefer low‑stim.
```
