@echo off
SETLOCAL EnableExtensions

:: Get the computer name
FOR /F "tokens=2 delims==" %%I IN ('wmic os get csname /value') DO SET computerName=%%I

:: Check the computer name and execute commands accordingly
IF "%computerName%"=="THINKPADT15" (
    .\hidapitester.exe --vidpid 046D:B35B --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x09,0x1d,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    .\hidapitester.exe --vidpid 046D:B034 --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x0a,0x1b,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
) ELSE IF "%computerName%"=="FRAMEWORK13" (
    .\hidapitester.exe --vidpid 046D:B35B --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x09,0x1d,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    .\hidapitester.exe --vidpid 046D:B034 --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x0a,0x1b,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
)

:: Execute the DisplaySwitch command
start /min cmd /c "DisplaySwitch.exe /internal"

ENDLOCAL
