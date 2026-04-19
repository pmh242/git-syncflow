# git-syncflow

Stateless Git workflow for staying in sync across machines.

---

## Requirements

| Platform | Installer | Support |
|----------|-----------|---------|
| macOS | `setup.sh` | Works out of the box |
| Linux | `setup.sh` | Works out of the box |
| Windows — PowerShell | `setup.ps1` | Supported |
| Windows — Git Bash or WSL | `setup.sh` | Supported |
| Windows — CMD | `setup.cmd` | Supported |

---

## Install

**macOS / Linux**
```sh
git clone https://github.com/pmh242/git-syncflow.git
cd git-syncflow
./setup.sh
```

**Windows — PowerShell**
```powershell
git clone https://github.com/pmh242/git-syncflow.git
cd git-syncflow
powershell -ExecutionPolicy Bypass -File .\setup.ps1
```

**Windows — CMD**
```bat
git clone https://github.com/pmh242/git-syncflow.git
cd git-syncflow
setup.cmd
```

**Windows — Git Bash or WSL**
```sh
git clone https://github.com/pmh242/git-syncflow.git
cd git-syncflow
./setup.sh
```

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

All aliases are defined in `git/.gitconfig.aliases` as a standard Git `[alias]` block. Both installers copy or symlink this file to `~/.gitconfig.aliases` and register it via `git config --global --add include.path`. No shell configuration is modified.

`setup.sh` creates a symlink so local edits to the repo are reflected immediately. `setup.ps1` and `setup.cmd` copy the file because creating symlinks on Windows requires administrator privileges. `setup.cmd` is a thin wrapper that delegates to `setup.ps1`.

---

## Troubleshooting

If installation fails, check `install-error.log` in the repo folder for error details. All installers write to this file on failure.
