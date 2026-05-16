#!/usr/bin/env bash
set -euo pipefail

HOGWARTS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SPELLS_FILE="${HOGWARTS_ROOT}/spells/hogwarts-spells.sh"
MARKER="# >>> hogwarts-commandline >>>"
MARKER_END="# <<< hogwarts-commandline <<<"

if [[ ! -f "$SPELLS_FILE" ]]; then
  echo "Error: spells not found at $SPELLS_FILE" >&2
  exit 1
fi

detect_rc() {
  local shell_name
  shell_name="$(basename "${SHELL:-bash}")"
  case "$shell_name" in
    zsh)  echo "${ZDOTDIR:-$HOME}/.zshrc" ;;
    bash) echo "${HOME}/.bashrc" ;;
    fish)
      echo "Fish is not supported yet. Use bash or zsh." >&2
      exit 1
      ;;
    *)    echo "${HOME}/.profile" ;;
  esac
}

RC_FILE="$(detect_rc)"

if [[ -f "$RC_FILE" ]] && grep -qF "$MARKER" "$RC_FILE" 2>/dev/null; then
  echo "Hogwarts spells already installed in $RC_FILE"
else
  {
    echo ""
    echo "$MARKER"
    echo "# Enroll at Hogwarts — transform your terminal into a wizard's workshop"
    echo "[[ -f \"$SPELLS_FILE\" ]] && source \"$SPELLS_FILE\""
    echo "$MARKER_END"
  } >> "$RC_FILE"
  echo "Added Hogwarts enrollment to $RC_FILE"
fi

# shellcheck source=/dev/null
if ! source "$SPELLS_FILE"; then
  echo "Error: failed to load spells from $SPELLS_FILE" >&2
  echo "If you use zsh with custom aliases (e.g. accio), update hogwarts-spells.sh and retry." >&2
  exit 1
fi

if ! type lumos >/dev/null 2>&1; then
  echo "Error: spells did not load (lumos not found)." >&2
  exit 1
fi

echo ""
echo "  ✨ Welcome to Hogwarts Commandline!"
echo "  Your shell now speaks in spells. Try: lumos, apparate, legilimens"
echo "  Spellbook: hogwartsspellbook"
echo ""
echo "  Reload: source \"$RC_FILE\""
echo "  Or open a new terminal."
echo ""
