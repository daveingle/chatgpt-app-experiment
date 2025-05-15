#!/usr/bin/env bash
set -euo pipefail

# Use first arg as baseline tag if provided
BASE=${1:-}

# Try to find latest tag if none supplied
if [[ -z "$BASE" ]]; then
  if git describe --tags --abbrev=0 >/dev/null 2>&1; then
    BASE=$(git describe --tags --abbrev=0)
  else
    BASE=HEAD~1        # fallback to previous commit
  fi
fi

OUT="logs/changes/$(date +%Y-%m-%d)_diff.md"

mkdir -p logs/changes

{
  echo "# Diff since $BASE  ($(date))"
  echo
  echo '```text'
  git diff --stat "$BASE"..HEAD
  echo '```'
  echo
  echo '```diff'
  git diff "$BASE"..HEAD -- '*.swift' '*.md'
  echo '```'
} > "$OUT"

echo "📄 Diff written to $OUT"
