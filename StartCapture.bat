@echo off
echo ====================================
echo   Network Capture - START
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

REM Create temp directory if it doesn't exist
if not exist "C:\Temp" mkdir C:\Temp

REM Stop any existing capture
pktmon stop >nul 2>&1

REM Start the capture
echo Starting packet capture...
pktmon start --capture --comp nics -s 128 --file-name C:\Temp\morning-trace.etl

echo.
echo Capture is now RUNNING!
echo.
echo Leave this window open or close it - the capture continues in the background.
echo When you're ready to stop (after about 5 minutes), run "StopCapture.bat" as Administrator.
echo.
pause
