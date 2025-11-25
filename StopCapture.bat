@echo off
echo ====================================
echo   Network Capture - STOP
echo ====================================
echo.

REM Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    echo Right-click the file and select "Run as administrator"
    pause
    exit /b 1
)

echo Stopping packet capture...
pktmon stop

echo.
echo Converting capture to readable format...
if exist "C:\Temp\morning-trace.etl" (
    pktmon format C:\Temp\morning-trace.etl -o C:\Temp\morning-trace.txt
    echo.
    echo ====================================
    echo   CAPTURE COMPLETE!
    echo ====================================
    echo.
    echo Files saved:
    echo  - C:\Temp\morning-trace.etl
    echo  - C:\Temp\morning-trace.txt
) else (
    echo ERROR: Capture file not found. Make sure StartCapture.bat ran successfully.
)

echo.
pause
