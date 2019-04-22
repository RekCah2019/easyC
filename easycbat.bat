@echo off

For %%A in (%1) do (
    Set myPath=%%~dpA
    Set name=%%~nA
)

If exist %myPath%%name%.c (attrib -r -h -s %myPath%%name%.c)
If exist %myPath%%name%.exe (attrib -r -h -s %myPath%%name%.exe)
If exist %myPath%result.txt (attrib -r -h -s %myPath%result.txt)

copy %myPath%%name%.easyc %myPath%%name%.c > nul
gcc %myPath%%name%.c -o %myPath%%name%.exe 2> %myPath%result.txt


For %%A in (%myPath%result.txt) do (Set size=%%~zA)
If %size%==0 (
	%myPath%%name%.exe
) else (
	type %myPath%result.txt
)

attrib +h %myPath%%name%.c
attrib +h %myPath%%name%.exe
attrib +h %myPath%result.txt

pause > nul