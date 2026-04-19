#!/usr/bin/env bash
set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed or not in PATH." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_SRC="$SCRIPT_DIR/git/.gitconfig.aliases"
ALIASES_DEST="$HOME/.gitconfig.aliases"

if [ ! -f "$ALIASES_SRC" ]; then
  echo "Error: $ALIASES_SRC not found." >&2
  exit 1
fi

# Symlink (idempotent — replace existing symlink or file)
if [ -L "$ALIASES_DEST" ] && [ "$(readlink "$ALIASES_DEST")" = "$ALIASES_SRC" ]; then
  echo "Symlink already up to date: $ALIASES_DEST"
else
  ln -sf "$ALIASES_SRC" "$ALIASES_DEST"
  echo "Symlinked: $ALIASES_DEST -> $ALIASES_SRC"
fi

# Register with global git config (idempotent, safe with multiple include.path entries)
if git config --global --get-all include.path 2>/dev/null | grep -qF "$HOME/.gitconfig.aliases"; then
  echo "Git include.path already configured."
else
  git config --global --add include.path ~/.gitconfig.aliases
  echo "Git include.path set to ~/.gitconfig.aliases"
fi

echo ""
echo "Done. Run 'git ghelp' to see available commands."
