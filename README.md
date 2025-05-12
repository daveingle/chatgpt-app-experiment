# chatgpt-app-experiment
Keep calm and prompt on.

## 📁 Project Structure

```
.
├── App
│   ├── config/            # Build configuration files (.xcconfig)
│   ├── Resources/         # Xcode asset catalogs (AppIcon, AccentColor)
│   ├── Sources/           # Main app source files (RootView, App entrypoint)
│   ├── SupportingFiles/   # Preview content for Xcode
│   ├── Tests/             # Unit tests
│   └── UITests/           # UI test targets
├── Packages/
│   ├── Package.swift      # SwiftPM entry point
│   └── PrompCraft/        # Local Swift Package
├── PromptCraft.xcodeproj/ # Xcode project definition
├── docs/                  # Longform documentation (optional)
├── logs/                  # Daily logs of progress and prompts
├── media/                 # Screenshots and illustrations
├── Scripts/               # Utility scripts (future use)
└── Tooling/               # Dev tooling (future use)
```

🔤 Lowercase directories (`logs`, `media`) are for passive content and assets.  
🧱 Capitalized directories (`Sources`, `Tooling`) are reserved for executable code and dev infrastructure.

## 📏 Conventions

This section collects conventions as they emerge during the project:

- 🔤 Lowercase folder names (`logs/`, `media/`) are for content or data
- 🧱 Capitalized folder names (`Sources/`, `Tooling/`) are for code or executable artifacts
- 🗓️ Each day’s work is done on a `dayN` branch and merged into `main` when complete
- 📝 Daily log files are stored in `logs/DayN.md` using a consistent template
- 🧪 No scripting or automation until patterns prove themselves (avoid premature optimization)

## ✅ Day 0 Summary

We set the foundation.

- Created the repository and initial project structure
- Named the app `PromptCraft`
- Organized folders for long-term clarity (`App/`, `Packages/`, `logs/`, etc.)
- Set up a `pre-commit` hook to sanitize image metadata
- Added `.DS_Store` to `.gitignore`
- Documented project conventions and started logging

👉 Read the full log here: [logs/Day0.md](logs/Day0.md)
