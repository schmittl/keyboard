:: The easiest way to create a shortcut with batch seems to be with a temporary vb script...
@echo off

set script="%RANDOM%.vbs"
set targetfile="caps.exe"

echo If AutoHotKey is not installed use the standalone executable
set /p standalone=Use standalone executable? [y/n] (default - y)?:

if "%standalone%" == "n" (
    set targetfile="caps.ahk"
    echo Using AutoHotKey file
) else (
    echo Using standalone executable
)

echo Using %targetfile% as target file for shortcut

echo Set wsc = WScript.CreateObject("WScript.Shell") >> %script%
echo dim lnkpath >> %script%
echo lnkpath = wsc.SpecialFolders("startup") ^& "\caps.LNK" >> %script%
echo Set lnk = wsc.CreateShortcut(lnkpath) >> %script%
echo lnk.targetpath = wsc.CurrentDirectory ^& "\" ^& %targetfile% >> %script%
echo lnk.workingdirectory = wsc.CurrentDirectory >> %script%
echo lnk.save >> %script%
echo WScript.Echo "Created shortcut at ==> " ^& lnkpath >> %script%
echo WScript.Echo "Shortcut target ==> " ^& lnk.targetpath >> %script%

cscript /nologo %script%

if %ERRORLEVEL% EQU 0 Echo Script completed successfully! || Echo Ow. An Error has occurred..

del %script%

PAUSE
