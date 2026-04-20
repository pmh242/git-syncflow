# git-syncflow

Git aliases for checking, updating, and syncing a repo from its upstream branch.

## What this tool does

Git Syncflow adds a few short Git commands:

- Check if your project is up to date or not
- Update your project safely with the latest changes
- Reset your project to match the online version if needed

## Quick Install

Use this if you want to install everything in one step.
Mac: run this in Terminal.
Windows: run this in PowerShell, then verify in Git Bash.

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

Mac: use Terminal.
Windows: use PowerShell, then verify in Git Bash.

Use this if you prefer to install step by step.

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

## Update

Use this if you already installed Git Syncflow and want to update it to the latest version.

Go to your git-syncflow folder, pull the latest changes, and run the installer again.

### Mac
```sh
git pull
./setup.sh
git ghelp
```

### Windows
```powershell
git pull
.\setup.ps1
git ghelp
```

## Uninstall

Mac: run this in Terminal.
Windows: run this in PowerShell.

Use this if you want to remove Git Syncflow from your computer.

### Mac
```sh
./uninstall.sh
```

### Windows
```powershell
.\uninstall.ps1
```
