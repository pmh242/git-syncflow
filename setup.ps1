#Requires -Version 5.1
$ErrorActionPreference = 'Stop'

$LogFile = Join-Path $PSScriptRoot "install-error.log"

try {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw "git is not installed or not in PATH."
    }

    $AliasesSrc  = Join-Path $PSScriptRoot "git\.gitconfig.aliases"
    $AliasesDest = Join-Path $env:USERPROFILE ".gitconfig.aliases"

    if (-not (Test-Path $AliasesSrc)) {
        throw "Source not found: $AliasesSrc"
    }

    # Copy aliases file — overwrites each run so updates are picked up automatically
    Copy-Item -Path $AliasesSrc -Destination $AliasesDest -Force
    Write-Host "Copied: $AliasesDest"

    # Register with global git config (idempotent, safe with multiple include.path entries)
    # git config --get-all exits 1 when no entries exist; 2>$null suppresses that stderr noise
    $existing   = git config --global --get-all include.path 2>$null
    $alreadySet = $existing | Where-Object { $_ -eq '~/.gitconfig.aliases' }

    if ($alreadySet) {
        Write-Host "Git include.path already configured."
    } else {
        git config --global --add include.path '~/.gitconfig.aliases'
        Write-Host "Git include.path set to ~/.gitconfig.aliases"
    }

    Write-Host ""
    Write-Host "Done. Run 'git ghelp' to see available commands."
} catch {
    $_.Exception.Message | Out-File -FilePath $LogFile -Encoding utf8
    Write-Host "Installation failed. See install-error.log for details."
    exit 1
}
