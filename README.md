# chatgpt-app-experiment
Keep calm and prompt on.

## 📁 Project Structure

```
.
├── App/
├── Packages/
│   ├── Features/                # End‑user UI layers
│   └── Services/                # Reusable engines & data stores
├── docs/
│   ├── architecture/
│   │   ├── feature-plans/       # Per‑feature specs & RFCs
│   │   └── SensesSensoryStack.md
│   ├── artifacts/               # Meeting minutes, diagrams
│   ├── personas/
│   └── standups/
├── logs/                        # Daily developer journals
├── media/                       # Screenshots & illustrations
├── Scripts/
└── Tooling/
```

*Tip:* Generated project trees live in `project_tree.txt` for quick diff‑checking.

🔤 Lowercase directories (`logs`, `media`) are for passive content and assets.  
🧱 Capitalized directories (`Sources`, `Tooling`) are reserved for executable code and dev infrastructure.

## 📏 Conventions

This section collects conventions as they emerge during the project:

- 🔤 Lowercase folder names (`logs/`, `media/`) are for content or data
- 🧱 Capitalized folder names (`Sources/`, `Tooling/`) are for code or executable artifacts
- 🗓️ Each day’s work is done on a `dayN` branch and merged into `main` when complete
- 📝 Daily log files are stored in `logs/DayN.md` using a consistent template
- 🧪 No scripting or automation until patterns prove themselves (avoid premature optimization)
- ✏️  Every new capability begins with a *Feature‑Plan* markdown spec placed in `docs/architecture/feature-plans/`.
- 📊  Stand‑up summaries live in `docs/standups/DayN_Standup_Summary.md` and link back to sprint‑board tickets.

## ✅ Progress at a Glance

- **Day 0:** Project scaffolding & repo hygiene
- **Day 1:** Persona consolidation and diagram‑first gate
- **Day 2:** Feature‑Plan workflow established, sprint board wired
