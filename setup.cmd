@echo off

where powershell >nul 2>&1
if errorlevel 1 (
    echo Error: PowerShell is not available. Try setup.sh via Git Bash or WSL instead.
    exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%~dp0setup.ps1"
exit /b %errorlevel%
