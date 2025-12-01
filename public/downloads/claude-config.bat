@echo off
color 0A
title Claude Code Config Tool
cls

:: ========= Auto-generated Config =========
set "MY_KEY=sk-rF2gGdMu6xFl7JixOmJylKGARHDoXIt0B5FEVMQfqpSlMoUq"
set "MY_URL=https://api0.ktws007.xyz"
:: =========================================

set "TARGET_DIR=%USERPROFILE%\.claude"
if not exist "%TARGET_DIR%" md "%TARGET_DIR%"

(
echo {
echo   "env": {
echo     "ANTHROPIC_AUTH_TOKEN": "%MY_KEY%",
echo     "ANTHROPIC_BASE_URL": "%MY_URL%"
echo   }
echo }
) > "%TARGET_DIR%\settings.json"

cls
echo.
echo  ========================================================
echo.
echo   SUCCESS! base_url and api_key have been configured!
echo.
echo   Now you can use Claude Code:
echo     - Terminal: type "claude" to start
echo     - VS Code: use Claude Code extension
echo.
echo  ========================================================
echo.
echo  Config saved to: %TARGET_DIR%\settings.json
echo.
pause
