#Requires -Version 5.1
$ErrorActionPreference = 'Stop'

try {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw "git is not installed or not in PATH."
    }

    $AliasesSrc  = Join-Path $PSScriptRoot "git\.gitconfig.aliases"
    $AliasesDest = Join-Path $env:USERPROFILE ".gitconfig.aliases"
    $IncludeValue = '~/.gitconfig.aliases'

    if (-not (Test-Path $AliasesSrc)) {
        throw "Source not found: $AliasesSrc"
    }

    Copy-Item -Path $AliasesSrc -Destination $AliasesDest -Force

    $existing = git config --global --get-all include.path 2>$null
    if (-not ($existing | Where-Object { $_ -eq $IncludeValue })) {
        & git config --global --add include.path $IncludeValue | Out-Null
    }

    Write-Host ""
    Write-Host "Git Syncflow installed"
    Write-Host "Aliases file: $AliasesDest"
    Write-Host "Include registered: YES"
    Write-Host "Available commands:"
    Write-Host "  gcheck"
    Write-Host "  gupdate"
    Write-Host "  gsync"
    Write-Host "  gsyncfull"
    Write-Host "  ghelp"
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
