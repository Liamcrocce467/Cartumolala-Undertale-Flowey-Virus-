@echo off
title MODIFICATION DU BUREAU
color 0C

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0fond d'ecrand.ps1"

@echo off
if "%1"=="hidden" goto MAIN

powershell.exe -WindowStyle Hidden -Command "Start-Process '%~f0' -ArgumentList hidden -WindowStyle Hidden"
exit /b

:MAIN

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0fond d'ecrand.ps1"