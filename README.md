# git-syncflow

Git aliases for checking, updating, and syncing a repository from its upstream branch.

## Install

**Mac**
1. Install
```sh
./setup.sh
```
2. Verify install
```sh
git ghelp
```

**Windows**
1. Install
```powershell
.\setup.ps1
```
2. Verify install (run in Git Bash)
```sh
git ghelp
```

This tool requires Git Bash or a POSIX-compatible shell on Windows.

## Commands

- `git gcheck` - show ahead/behind status vs upstream
- `git gupdate` - fetch and fast-forward pull
- `git gsync` - fetch, hard reset to upstream, and remove untracked files
- `git gsyncfull` - same as `gsync`, plus ignored files
- `git ghelp` - show the alias summary

Note: gsync and gsyncfull will overwrite local changes and remove files.

## Uninstall

**Mac**
```sh
./uninstall.sh
```

**Windows**
```powershell
.\uninstall.ps1
```
