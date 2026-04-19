#Requires -Version 5.1
$ErrorActionPreference = 'Stop'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git is not installed or not in PATH."
    exit 1
}

$ScriptDir   = Split-Path -Parent $MyInvocation.MyCommand.Path
$AliasesSrc  = Join-Path $ScriptDir "git\.gitconfig.aliases"
$AliasesDest = Join-Path $env:USERPROFILE ".gitconfig.aliases"

if (-not (Test-Path $AliasesSrc)) {
    Write-Error "Source not found: $AliasesSrc"
    exit 1
}

# Copy aliases file — overwrites each run so updates are picked up automatically
Copy-Item -Path $AliasesSrc -Destination $AliasesDest -Force
Write-Host "Copied: $AliasesDest"

# Register with global git config (idempotent, safe with multiple include.path entries)
# git config --get-all exits 1 when no entries exist; 2>$null suppresses that stderr noise
$existing    = git config --global --get-all include.path 2>$null
$alreadySet  = $existing | Where-Object { $_ -eq '~/.gitconfig.aliases' }

if ($alreadySet) {
    Write-Host "Git include.path already configured."
} else {
    git config --global --add include.path '~/.gitconfig.aliases'
    Write-Host "Git include.path set to ~/.gitconfig.aliases"
}

Write-Host ""
Write-Host "Done. Run 'git ghelp' to see available commands."
