# git-syncflow

Stateless Git workflow for staying in sync across machines.

---

## Requirements

| Platform | Support |
|----------|---------|
| macOS | Works out of the box |
| Linux | Works out of the box |
| Windows (Git Bash or WSL) | Supported |
| Windows (PowerShell / CMD) | Not supported |

---

## Install

```sh
git clone https://github.com/YOUR_USERNAME/git-syncflow.git
cd git-syncflow
chmod +x setup.sh
./setup.sh
```

This symlinks `git/.gitconfig.aliases` to `~/.gitconfig.aliases` and registers it via `git config --global --add include.path`.

On Windows, run this from **Git Bash** or **WSL** — not PowerShell or CMD.

---

## Commands

| Alias | Destructive | Description |
|-------|:-----------:|-------------|
| `git gcheck` | | Show ahead/behind count vs upstream |
| `git gupdate` | | Fetch + pull; fails safely if branch has diverged |
| `git gsync` | Yes | Reset hard to upstream + remove untracked files |
| `git gsyncfull` | Yes | Same as `gsync` + remove ignored files |
| `git ghelp` | | Print command reference |

---

## Example workflow

```sh
# 1. Check where you stand
git gcheck
# → ↑ ahead: 0 | ↓ behind: 3

# 2. Safe update (fails if your branch diverged)
git gupdate

# 3. Hard sync — discard local changes, match upstream exactly
git gsync

# 4. Full hard sync — also wipes build artifacts and ignored files
git gsyncfull
```

---

## Warnings

> **`gsync` and `gsyncfull` are destructive.**
>
> - `gsync` runs `git reset --hard` and `git clean -fd` — all uncommitted changes and untracked files are permanently lost.
> - `gsyncfull` additionally runs `git clean -fdx` — this also deletes files listed in `.gitignore` (e.g. `node_modules`, `.env`, build output).
>
> Only use these when you want your working tree to exactly mirror the remote. There is no undo.

---

## How it works

All aliases are defined in `git/.gitconfig.aliases` as a standard Git `[alias]` block. `setup.sh` symlinks this file to `~/.gitconfig.aliases` and adds it to your global Git config via `include.path`. No shell configuration is modified.
