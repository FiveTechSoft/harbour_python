setlocal
call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
set PYTHONHOME=c:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311
set PYTHONPATH=c:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311
c:\harbour\bin\win\msvc64\hbmk2 %1.prg test64.hbp -comp=msvc64
%1.exe
endlocal
