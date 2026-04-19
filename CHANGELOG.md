# Changelog

All notable changes to this project will be documented here.

---

## [1.0.2] — 2026-04-19

### Added

- `setup.ps1` — native Windows PowerShell installer; copies `git/.gitconfig.aliases` to `~/.gitconfig.aliases` and registers it via `git config --global --add include.path`

### Changed

- README Install section split into per-platform blocks (macOS/Linux, Windows PowerShell, Windows Git Bash/WSL)
- README Requirements table updated: PowerShell now supported; CMD remains unsupported
- README How it works updated to document both installers and explain the symlink vs copy difference

### Notes

- macOS and Linux continue to use `setup.sh`
- Git aliases are unchanged; they work on Windows via Git for Windows' bundled `sh.exe`

---

## [1.0.1] — 2026-04-19

### Added

- Cross-platform support clarification: macOS, Linux, and Windows via Git Bash or WSL

### Changed

- README updated with Requirements section and platform compatibility table
- README Commands table now flags destructive aliases explicitly
- `setup.sh` now checks that `git` is installed before running
- `setup.sh` uses `--get-all | grep` + `--add` for `include.path` to avoid overwriting existing entries
- `ghelp` alias switched from `echo` to `printf` for reliable newline rendering across all POSIX shells
- `gcheck` alias removes unused `LOCAL` variable

### Notes

- PowerShell and CMD are not supported

---

## [1.0.0] — 2026-04-19

### Added

- `gcheck` — displays ahead/behind count vs upstream after a quiet fetch; shows `✓ up to date (↑ 0 | ↓ 0)` or `↑ ahead: N | ↓ behind: M`
- `gupdate` — runs `git fetch` followed by `git pull --ff-only`; fails safely if the branch has diverged
- `gsync` — runs `git fetch --all`, `git reset --hard <upstream>`, and `git clean -fd` to hard-sync the working tree
- `gsyncfull` — same as `gsync` with `git clean -fdx` to also remove ignored files
- `ghelp` — prints a short description of all available aliases
- `setup.sh` — idempotent installer that symlinks `git/.gitconfig.aliases` and registers it via `git config --global include.path`
