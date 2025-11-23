@echo off
echo ===========================================
echo   清理 Windows 中的 ANTHROPIC_API_KEY
echo ===========================================

echo.
echo [1] 清理前检测：
echo ---------------------------

echo - 当前会话: %ANTHROPIC_API_KEY%

echo - 用户级变量:
powershell -NoLogo -Command "[Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','User')"

echo - 系统级变量:
powershell -NoLogo -Command "[Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','Machine')"

echo.
echo [2] 执行清理：
echo ---------------------------

:: 清除当前会话
set ANTHROPIC_API_KEY=

:: 清除用户级
powershell -NoLogo -Command "[Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', $null, 'User')"

:: 清除系统级（需管理员权限）
powershell -NoLogo -Command "[Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', $null, 'Machine')"

echo.
echo [3] 清理后检测：
echo ---------------------------

echo - 当前会话: %ANTHROPIC_API_KEY%

echo - 用户级变量:
powershell -NoLogo -Command "[Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','User')"

echo - 系统级变量:
powershell -NoLogo -Command "[Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','Machine')"

echo.
echo 完成！请重新开启 CMD / PowerShell。
pause
