@echo off

pushd "%ONEDRIVE%\Scratches"

if "%1" equ "" call :make_daily_scratch

start "" gvim.exe "%MDFILE%"
goto end

:make_daily_scratch
set YEAR=%DATE:~0,4%
set MONTH=%DATE:~5,2%
set DAY=%DATE:~-2,2%
set MDFILE=%YEAR%-%MONTH%-%DAY%-2.md
if not exist "%MDFILE%" (
    echo # %YEAR%-%MONTH%-%DAY%> "%MDFILE%"
    type "yyyy-mm-dd.md" >> "%MDFILE%"
)
goto :eof

:end
popd

