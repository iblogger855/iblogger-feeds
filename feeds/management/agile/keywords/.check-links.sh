#!/usr/bin/env bash
# Verify every relative .md link in the agile keyword tree + hub resolves.
set -uo pipefail
root="feeds/management/agile/keywords"
check() {
  local f="$1" d; d=$(dirname "$f")
  grep -oE '\]\(([^)]+\.md)(#[^)]*)?\)' "$f" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//; s/#.*$//' | while read -r l; do
    case "$l" in http*) continue;; esac
    if [ ! -f "$d/$l" ]; then echo "BROKEN: $f -> $l"; fi
  done
}
while IFS= read -r f; do check "$f"; done < <(find "$root" -name '*.md')
check feeds/management/sdlc/03-agile-model.md
echo "link check done"
