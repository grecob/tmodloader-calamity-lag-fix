@echo off

set "myGamesPath=%USERPROFILE%\Documents\My Games\Terraria"

REM if terraria folder isn't found, check for Onedrive folder
IF NOT EXIST "%myGamesPath%" (
    set "myGamesPath=%USERPROFILE%\OneDrive\Documents\My Games\Terraria"
)
REM if folder still isn't found, exit
IF NOT EXIST "%myGamesPath%" (
    ECHO Terraria folder not found at "%USERPROFILE%\Documents\My Games\Terraria" or "%USERPROFILE%\OneDrive\Documents\My Games\Terraria"
    pause
    exit
)
ECHO My Games Path: %myGamesPath%

set "file1=%myGamesPath%\config.json"
set "file2=%myGamesPath%\tModLoader\config.json"
ECHO Config File 1 Path: %file1%
ECHO Config File 2 Path: %file2%

set "key="MultiplayerNPCSmoothingRange""
set "new_value=0"	

setlocal enabledelayedexpansion
REM Process the terraria config
if exist "%file1%" (
    echo Updating file: %file1%
    attrib "%file1%" | find /i "R" >nul
    if not errorlevel 1 (
        attrib -r "%file1%"
        echo Removed read-only attribute from: %file1%
    )

    > "%file1%.temp" (
        set "modified=0"
        for /f "tokens=* delims=" %%i in ('findstr /n "^" "%file1%"') do (
            set "line=%%i"
            set "line=!line:*:=!"
            if !modified! equ 0 (
                echo !line! | findstr /c:%key% >nul
                if not errorlevel 1 (
                    set "line=  %key%: %new_value%,"
                    set "modified=1"
                )
            )
            echo !line!
        )
    )

    move /y "%file1%.temp" "%file1%" >nul

    REM Make the file read-only
    attrib +r "%file1%"
    echo Updated and made read-only: %file1%
) else (
    echo File not found: %file1%
    pause
)

REM Process the tmodLoader config
if exist "%file2%" (
    echo Updating file: %file2%
    attrib "%file2%" | find /i "R" >nul
    if not errorlevel 1 (
        attrib -r "%file2%"
        echo Removed read-only attribute from: %file2%
    )

    > "%file2%.temp" (
        set "modified=0"
        for /f "tokens=* delims=" %%i in ('findstr /n "^" "%file2%"') do (
            set "line=%%i"
            set "line=!line:*:=!"
            if !modified! equ 0 (
                echo !line! | findstr /c:%key% >nul
                if not errorlevel 1 (
                    set "line=  %key%: %new_value%,"
                    set "modified=1"
                )
            )
            echo !line!
        )
    )

    move /y "%file2%.temp" "%file2%" >nul

    REM Make the file read-only
    attrib +r "%file2%"
    echo Updated and made read-only: %file2%
) else (
    echo File not found: %file2%
    pause
)

endlocal