@set > env_vars.txt
call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
rem set PYTHONHOME=c:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\VC\SecurityIssueAnalysis\python
rem set PYTHONPATH=c:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\VC\SecurityIssueAnalysis\python
c:\harbour\bin\win\msvc64\hbmk2 test64.hbp -comp=msvc64
test.exe
@for /F %A in (aenv_vars.txt) do SET %A