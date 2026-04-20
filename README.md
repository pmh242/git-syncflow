# git-syncflow

Git aliases for checking, updating, and syncing a repo from its upstream branch.

## What this tool does

Git Syncflow adds a few short Git commands:

- Check if your branch is ahead or behind
- Update safely when your branch can fast-forward
- Sync your branch to the upstream branch

## Quick Install

**Mac**
```sh
git clone https://github.com/pmh242/git-syncflow.git && cd git-syncflow && chmod +x setup.sh && ./setup.sh && git ghelp
```

**Windows**
```powershell
git clone https://github.com/pmh242/git-syncflow.git; cd git-syncflow; .\setup.ps1
```

Verify (run in Git Bash):
```sh
git ghelp
```

## Install

### Mac
1. Install
```sh
./setup.sh
```
2. Verify
```sh
git ghelp
```

### Windows
1. Install in PowerShell
```powershell
.\setup.ps1
```
2. Verify in Git Bash
```sh
git ghelp
```

This tool requires Git Bash or a POSIX-compatible shell on Windows.

## Commands

- `git gcheck` - tells you if your project is up to date with the online version or not
- `git gupdate` - safely updates your project with the latest changes from the online version
- `git gsync` - force resets your project to match the online version and removes extra files
- `git gsyncfull` - same as gsync, but also removes hidden or ignored files for a full cleanup
- `git ghelp` - shows the list of available commands

Note: `gsync` and `gsyncfull` will overwrite local changes and remove files.

## Simple Usage

- `git gcheck` - check status
- `git gupdate` - update safely

## Uninstall

### Mac
```sh
./uninstall.sh
```

### Windows
```powershell
.\uninstall.ps1
```
