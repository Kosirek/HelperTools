echo off

for /d %%a in (*) do (
	set module=%%a
	call :pull_func)
	
goto end_of_script

:pull_func
echo --==** %module% **==--
cd %module%
if errorlevel 1 goto :eof
cd .git
if errorlevel 1 goto final_step
cd ..
call git pull
if errorlevel 1 goto :refresh
:final_step
cd ..
goto:eof

:refresh
git stash save
git pull
git stash pop
git pull
goto:eof

:end_of_script
echo on

