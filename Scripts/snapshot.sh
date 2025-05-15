#!/usr/bin/env bash
set -euo pipefail

OUT=logs/workspace.md
MAX_LINES=200      # how many lines to keep for “long” files
TREE_DEPTH=3

echo "📝  Generating $OUT …"

# ----------------------------------------------------------------------
# 1. Folder tree (depth = $TREE_DEPTH)
# ----------------------------------------------------------------------
{
  echo '```text'
  tree -L "$TREE_DEPTH"
  echo '```'
} > "$OUT"

# ----------------------------------------------------------------------
# 2. Iterate over every .swift file we track in Git under key roots
# ----------------------------------------------------------------------
echo -e "\n\n## 📄 Source Excerpts" >> "$OUT"

# Gather every tracked Swift source (no tests / generated)
git ls-files -z -- '**/*.swift' \
  ':!:*Tests*' \
  ':!:*UITests*' \
  ':!:*Generated*' |
while IFS= read -r -d '' FILE; do
  # Skip files not under App/**/Sources or Packages/**/Sources
  if [[ "$FILE" != App/*/Sources/* && "$FILE" != Packages/*/Sources/* ]]; then
    continue
  fi

  BYTES=$(wc -c < "$FILE" | tr -d ' ')
  SHA=$(git hash-object "$FILE")

  echo -e "\n---\n### $FILE  _(size: ${BYTES} B, sha: $SHA)_\n\`\`\`swift" >> "$OUT"

  # If file is small, dump it entirely; otherwise only first $MAX_LINES
  if [[ $(wc -l < "$FILE") -le $MAX_LINES ]]; then
    cat "$FILE" >> "$OUT"
  else
    sed -n "1,${MAX_LINES}p" "$FILE" >> "$OUT"
    echo -e "\n/* … truncated … */" >> "$OUT"
  fi

  echo '```' >> "$OUT"
done

echo "✅  Snapshot written to $OUT"
