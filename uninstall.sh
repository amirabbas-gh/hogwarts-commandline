#!/usr/bin/env bash
set -euo pipefail

MARKER="# >>> hogwarts-commandline >>>"
MARKER_END="# <<< hogwarts-commandline <<<"

remove_block() {
  local file="$1"
  [[ -f "$file" ]] || return 0
  if grep -qF "$MARKER" "$file" 2>/dev/null; then
    awk -v start="$MARKER" -v end="$MARKER_END" '
      $0 == start { skip=1; next }
      $0 == end   { skip=0; next }
      !skip { print }
    ' "$file" > "${file}.hogwarts.bak" && mv "${file}.hogwarts.bak" "$file"
    echo "Removed Hogwarts block from $file"
  fi
}

for rc in "${ZDOTDIR:-$HOME}/.zshrc" "${HOME}/.bashrc" "${HOME}/.profile"; do
  remove_block "$rc"
done

echo "Uninstalled. Open a new terminal or run: unalias -a (careful — clears all aliases)."
