#!/usr/bin/env bash
set -euo pipefail

ALIASES_DEST="$HOME/.gitconfig.aliases"
INCLUDE_VALUE="~/.gitconfig.aliases"

if command -v git >/dev/null 2>&1; then
  if git config --global --get-all include.path 2>/dev/null | grep -Fxq "$INCLUDE_VALUE"; then
    git config --global --unset-all --fixed-value include.path "$INCLUDE_VALUE" >/dev/null 2>&1 || true
  else
    echo "No Git Syncflow config found"
  fi
fi

rm -f "$ALIASES_DEST"

echo "Git Syncflow uninstalled"
