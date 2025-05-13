# Day 1 – Assembling the Studio & Picking a Direction

## 🗓️ Date  
May 13, 2025

## 🔥 Summary  
Today marked the true beginning of the project. Instead of guiding the app based on the PromptCraft scaffold, I gave ChatGPT complete creative freedom to define a direction. The goal was to spark bold, unconstrained ideas from a fictional expert team. The result was an inspired concept for a sensory journaling app called **SENSES**, driven by on-device ML and multi-modal emotional expression. The core prompt loop for the rest of the project has been established: **“Make it more sensory.”**

## 🤖 Prompt(s)
> You are building an app. Ignore the 'PromptCraft' context of the project. It is only the skeleton for you to start with.  
>
> Pick your own direction, utility, functionality, design, and value.  
>
> Take on the role of a panel of experts trying to build an Apple Design Award-winning application.  
>
> Please begin by discussing with yourself a few directions. Value unique concepts and out-of-the-box thinking.  
>
> Decide who is on your team, what your names are, and your specialties.  
>
> I will be asking the same prompt repeatedly to move forwards. It is up to you to decide on that prompt.  
>
> It should be of the form: Make it more &lt;term&gt;

## 💬 ChatGPT Response(s)

- Introduced a fictional expert panel called **Studio More** featuring six domain specialists (from speculative UX to haptics and branding).
- Brainstormed five moonshot app ideas.
- Voted and selected the concept **Synesthetic Journal**, now called **SENSES**.
- Core idea: transform a small daily input (text, photo, audio, or video) into a *living postcard* using emotional ML → visual, auditory, and haptic representation.
- Anchored future iteration around the prompt: **“Make it more sensory.”**

## 🛠️ What I Built
- [x] Created `Day1.md` log to capture kickoff and design intent.
- [x] Captured output and committed it alongside the scaffold from Day 0.
- [x] Initial models and modules under construction (see SprintBoard.md)
- [x] DataVault.swift completed
- [ ] VoiceEmotionClassifier.mlmodel in progress
- [ ] ChromaPreviewView.swift scaffolded
- [ ] BLE schema (SmellLater) committed but untested

## 📸 Screenshot(s)

![Synesthetic Journal Brainstorm](../media/day1-senses-brainstorm.jpg)


## 🧩 Sprint Board Snapshot (EOD)

| Owner   | Ticket                        | DoD                                   |
|---------|-------------------------------|-------------------------------------|
| Iris    | MLVoiceEmotionClassifier.mlmodel | 90 %+ accuracy, < 10 ms inference   |
| Iris    | DataVault.swift                 | Encrypted Core Data vault compiles (DONE) |
| Sage    | HapticPalette.swift            | Generates .ahap file felt on devices|
| Lux     | ChromaPreviewView.swift        | Live preview matches haptics        |
| Kai     | OrbScene.swift                 | Vision OS orb loads test postcard   |
| Dr Nova | Doc update (DONE)              | Merged in main                      |
| Dr Nova | SmellLater BLE schema          | BLE UUID + 4‑field payload committed|
| Dr Nova | Privacy & Ethics sidebar       | docs/PrivacyEthics.md drafted & PR open |
