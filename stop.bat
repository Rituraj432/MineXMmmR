@echo off
title Stop Miner Verification
cls
echo ====================================================
echo Monero Mining Rokne ke liye Password dalein:
echo ====================================================
set /p pass="Password: "

if "%pass%"=="*Hindu*" (
    taskkill /f /im xmrig.exe >nul 2>&1
    echo.
    echo Mining safalata-poorvak rok di gayi hai.
    pause
    exit
) else (
    echo.
    echo Galat password! Mining band nahi hogi.
    pause
    exit
)
