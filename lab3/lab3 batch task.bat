@echo off
ECHO Enter the directory path from which you want to delete files:
SET /P target_dir=

IF NOT EXIST "%target_dir%" (
    ECHO The specified directory does not exist: %target_dir%
    ECHO Program terminated with exit code 1. >&2
    PAUSE
    EXIT /B 1
)

ECHO Enter the file extension you want to delete (e.g., .docx, .txt):
SET /P file_ext=

ECHO Do you really want to delete all files with the extension %file_ext% in the directory %target_dir%? (Y/N)
SET /P confirm=
IF /I NOT "%confirm%"=="Y" (
    ECHO Operation canceled.
    PAUSE
    EXIT /B 1
)

ATTRIB -R -H -A "%target_dir%\*%file_ext%" /S /D
DEL /Q "%target_dir%\*%file_ext%"

ECHO Program successfully completed with exit code 0. >&2
PAUSE
EXIT /B 0
