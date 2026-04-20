#Requires -Version 5.1
$ErrorActionPreference = 'Stop'

try {
    $IncludeValue = '~/.gitconfig.aliases'
    $AliasesDest = Join-Path $env:USERPROFILE '.gitconfig.aliases'

    if (Get-Command git -ErrorAction SilentlyContinue) {
        $existing = git config --global --get-all include.path 2>$null
        if ($existing | Where-Object { $_ -eq $IncludeValue }) {
            & git config --global --unset-all --fixed-value include.path $IncludeValue 2>$null | Out-Null
        } else {
            Write-Host 'No Git Syncflow config found'
        }
    }

    if (Test-Path -LiteralPath $AliasesDest) {
        Remove-Item -LiteralPath $AliasesDest -Force
    }

    Write-Host 'Git Syncflow uninstalled'
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
