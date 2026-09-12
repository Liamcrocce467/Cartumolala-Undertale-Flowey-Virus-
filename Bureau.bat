@echo off
title SYSTEM ERROR
color 0C

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0bureau.ps1"

pause