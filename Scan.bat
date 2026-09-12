@echo off
setlocal EnableDelayedExpansion
title Hacking...
mode con: cols=100 lines=30
color 0C

:: =========================================================
:: FAUX VIRUS - EFFETS VISUELS UNIQUEMENT
:: =========================================================

cls
echo.
echo.
echo                  ███████╗ █████╗ ██╗     ███████╗███████╗
echo                  ██╔════╝██╔══██╗██║     ██╔════╝██╔════╝
echo                  █████╗  ███████║██║     █████╗  ███████╗
echo                  ██╔══╝  ██╔══██║██║     ██╔══╝  ╚════██║
echo                  ██║     ██║  ██║███████╗███████╗███████║
echo                  ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
echo.
echo                    CRITICAL SYSTEM ERROR
echo.
timeout /t 2 /nobreak >nul

:: =========================================================
:: FAUX SCAN
:: =========================================================

color 0A
cls
echo.
echo [SYSTEM SCAN]
echo.
echo Initialisation...
timeout /t 1 /nobreak >nul

for /l %%i in (1,1,20) do (
    set /a percent=%%i*5
    echo Analyse du systeme... !percent!%%
    timeout /t 1 /nobreak >nul
)

color 0C
cls
echo.
echo =========================================================
echo              !!! MENACES DETECTEES !!!
echo =========================================================
echo.
echo  [!] processus inconnu detecte
echo  [!] acces non autorise detecte
echo  [!] fichiers suspects detectes
echo.
timeout /t 3 /nobreak >nul

:: =========================================================
:: FAUX PIRATAGE
:: =========================================================

cls
color 0A

echo Connecting to remote server...
timeout /t 1 /nobreak >nul

echo Establishing secure connection...
timeout /t 1 /nobreak >nul

echo Access granted.
timeout /t 1 /nobreak >nul

echo Downloading system data...
timeout /t 1 /nobreak >nul

echo Encrypting files...
timeout /t 1 /nobreak >nul

echo Uploading data...
timeout /t 2 /nobreak >nul

:: =========================================================
:: SON 1
:: =========================================================

if exist "%~0Song\alarme-muito-alto.mp3" (
    start "" "%~0Song\acorda-estouradao.mp3"  
)

:: =========================================================
:: PROGRAMMES ALEATOIRES
:: =========================================================

color 0C

set /a choix=!random! %% 4 + 1

if !choix!==1 start "" calc.exe
if !choix!==2 start "" notepad.exe
if !choix!==3 start "" cmd.exe
if !choix!==4 start "" explorer.exe

timeout /t 3 /nobreak >nul

set /a choix=!random! %% 4 + 1

if !choix!==1 start "" calc.exe
if !choix!==2 start "" notepad.exe
if !choix!==3 start "" mspaint.exe
if !choix!==4 start "" explorer.exe

timeout /t 3 /nobreak >nul

:: =========================================================
:: DECOMPTE
:: =========================================================

cls

for /l %%i in (10,-1,1) do (
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo                         %%i
    echo.
    echo                  SYSTEM FAILURE
    timeout /t 1 /nobreak >nul
)

:: =========================================================
:: SON 2
:: =========================================================

if exist "%~0Song\alarme-muito-alto.mp3" (
    start "" "%~0Song\acorda-estouradao.mp3"
)

:: =========================================================
:: FAUSSES ERREURS
:: =========================================================

cls
color 0C

echo.
echo ERROR 0x00000001
timeout /t 1 /nobreak >nul
echo ERROR 0x00000027
timeout /t 1 /nobreak >nul
echo ERROR 0x00000094
timeout /t 1 /nobreak >nul
echo ERROR 0x000001AF
timeout /t 1 /nobreak >nul
echo ERROR 0x00000421
timeout /t 2 /nobreak >nul

:: =========================================================
:: PROGRAMMES ALEATOIRES
:: =========================================================

set /a choix=!random! %% 3 + 1

if !choix!==1 start "" notepad.exe
if !choix!==2 start "" calc.exe
if !choix!==3 start "" cmd.exe

timeout /t 2 /nobreak >nul

:: =========================================================
:: SON 3 + DECOMPTE
:: =========================================================

if exist "%~0Song\alarme-muito-alto.mp3" (
    start "" "%~0Song\acorda-estouradao.mp3"
)

start "" "%~dp0Cartumolala.bat"

timeout /t 5 /nobreak >nul

:: =========================================================
:: REVELATION
:: =========================================================

color 0A
cls

echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         :)
echo.
echo                    
echo.                    Bye Bye PC !!
echo.
echo                 
echo.
echo.

timeout /t 5 /nobreak >nul

exit