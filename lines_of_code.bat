echo off

setlocal

set component=
set start_date=
set end_date=

cd %component%
call :get_stats
goto end_of_script

:get_stats
for /f "delims=" %%i in ('call git rev-list -n 1 --before=%start_date% master') do set starting_commit=%%i
for /f "delims=" %%i in ('call git rev-list -n 1 --before=%end_date master') do set ending_commit=%%i
git diff --shortstat %starting_commit%..%ending_commit% -- . > nul

if errorlevel 1 goto end_of_script

for /f "delims=" %%i in ('git diff --shortstat %starting_commit%..%ending_commit% -- .') do set data=%%i 
echo %component%: %data%
goto:eof

:end_of_script
cd ..
echo on
 