# Day 0 – It Begins

## 🗓️ Date
May 12, 2025

## 🔥 Summary
I created the GitHub repository that will house the entire project. This marks the official start of the experiment: building an iOS app by prompting ChatGPT each day and following its guidance. The journey begins with nothing but a name and a blank repo.

## 🤖 Prompt(s)
> No prompt today. Just created the GitHub repo and committed a README.

## 💬 ChatGPT Response(s)
None yet. We'll start prompting tomorrow.

## 🛠️ What I Built
- [x] Created the GitHub repository
- [x] Wrote and committed README.md
- [x] Defined the project structure

## 📸 Screenshots: Day 0 Sequence

|🧱 The very beginning. Starting clean with a public repo, a README, and the project name: `chatgpt-app-experiment`. |
|--- |
|![Creating the GitHub repository](../media/day0-create-repo.png) |
|🧰 Starting with the default App template for iOS. No frills—just a clean SwiftUI starting point and Swift as the language.|
|![Xcode app template selection](../media/day0-xcode-template-selection.png)|
|💡 Gave the app its identity: `PromptCraft`. This is where the experiment begins—with a name and a mission to build via prompting.|
|![Naming the project PromptCraft](../media/day0-xcode-project-naming.png)|
|📂 Xcode’s default file groups after project creation. Time to refactor the structure into something maintainable.|
|![Xcode initial folder structure](../media/day0-xcode-project-before.png)|
|📦 Created a Swift Package named `PromptCraft` inside `Packages/` with a clean, conventional layout.|
|![Swift Package layout](../media/day0-package-structure.png)|
|➕ Used the “Add Local…” option in Xcode to wire up the internal package cleanly.|
|![Add local Swift Package](../media/day0-add-local-package.png)|
|🧼 Starting dependency-free. Keeping things local and simple.|
|![No external dependencies yet](../media/day0-empty-package-dependencies.png)|
|✨ Organized the project into clearly separated folders—`App/`, `Packages/`, `logs/`, and more—making room for iteration, logs, and long-term tooling.|
|![Final folder structure after cleanup](../media/day0-xcode-project-after.png)|
|🧱 Don't like my settings defined in xml via the project file.|
|![Xcode build settings overview](../media/day0-xcode-build-settings-before.png)|
|🧼 Confirmed that we haven’t deviated from defaults yet—clean slate.|
|![Empty customized build settings in Xcode](../media/day0-xcode-build-settings-after.png)|
|🧩 Connected `.xcconfig` files across all targets. This keeps configuration declarative and scalable.|
|![Custom xcconfig file structure](../media/day0-xcode-xcconfig-wiring.png)|
|This is a good sign..|
|![Build is green](../media/day0-xcode-build.png)|


## 🚧 Challenges or Oddities
- Ran into `sips` errors when trying to strip image metadata
- Switched to `exiftool` for reliable sanitization in the Git pre-commit hook
- Hook initially failed on blank file names; added safe checks for empty/missing files

## 🧠 Reflection

Day 0 was all about foundations. I wanted a clean, future-friendly structure, and I think we got there. From setting up folders like `App/`, `Packages/`, and `Tooling/` to wiring up pre-commit hooks for image hygiene, it feels like a strong start.

We’re not even writing app code yet—but the infrastructure is in place to support it.

## 🔮 Tomorrow

- Begin Day 1 by prompting ChatGPT to help design the app itself
- Decide on a concept, initial feature set, or interface
- Create the first SwiftUI screen based on the prompt
- Keep logs and screenshots going
