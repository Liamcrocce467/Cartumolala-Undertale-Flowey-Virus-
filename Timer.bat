@echo off
title Flowey: I'll be there in 31 seconds :)) BWA HA HA HA HA HA 
color 0C

for /l %%i in (31,-1,1) do (
    cls
    echo.
    echo.
    echo              %%i
    timeout /t 1 /nobreak >nul
)

exit