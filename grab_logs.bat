echo off

setlocal

set component=
set entry_date=%2
set closure_date=%3
set author=%1
set report_file="..\grabbed_%author%_from_%entry_date%_to_%closure_date%.log"

cd %component%
echo --==** %component% **==-- >> %report_file%
git log --author=%author% --no-notes --abrev-commit --sparse --date_order --no-merges --branches --first_parent --pretty=reference --since=%entry_date% --until=%closure_date% >> %report_file%
echo -------------------------------------------------
git shortlog -s --author=%author% --since=%entry_date% --until=%closure_date% >> %report_file%

cd ..

endlocal
echo on