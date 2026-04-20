#!/usr/bin/env bash
set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed or not in PATH." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_SRC="$SCRIPT_DIR/git/.gitconfig.aliases"
ALIASES_DEST="$HOME/.gitconfig.aliases"
INCLUDE_VALUE="~/.gitconfig.aliases"

if [ ! -f "$ALIASES_SRC" ]; then
  echo "Error: $ALIASES_SRC not found." >&2
  exit 1
fi

cp -f "$ALIASES_SRC" "$ALIASES_DEST"

if git config --global --get-all include.path 2>/dev/null | grep -Fxq "$INCLUDE_VALUE"; then
  INCLUDE_REGISTERED="YES"
else
  git config --global --add include.path "$INCLUDE_VALUE"
  INCLUDE_REGISTERED="YES"
fi

echo ""
echo "Git Syncflow installed"
echo "Aliases file: $ALIASES_DEST"
echo "Include registered: $INCLUDE_REGISTERED"
echo "Available commands:"
echo "  gcheck"
echo "  gupdate"
echo "  gsync"
echo "  gsyncfull"
echo "  ghelp"
