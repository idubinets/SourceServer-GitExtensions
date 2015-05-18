@echo off
echo -------------
call perl --version > NUL
if not %ERRORLEVEL% == 0 echo "Perl not found in path.  It can be found in the msysgit bin directory." && exit /b 1
call git --version > NUL
if not %ERRORLEVEL% == 0 echo "git not found in path." && exit /b 1
::Put the SourceServer files into their necessary location
echo - Copying necessary files '%PROGRAMFILES%\Debugging Tools for Windows (x64)\srcsrv'...
xcopy /y SourceServer\* "%PROGRAMFILES%\Debugging Tools for Windows (x64)\srcsrv" > NUL
if not %ERRORLEVEL% == 0 echo Copy Failed && exit /b 1
echo - Copying necessary files '%VS100COMNTOOLS%'...
xcopy /y %~dp0\InSystemPath\* "%VS100COMNTOOLS%" > NUL
if not %ERRORLEVEL% == 0 echo Copy Failed && exit /b 1
echo - Copying necessary files '%VS110COMNTOOLS%'...
xcopy /y %~dp0\InSystemPath\* "%VS110COMNTOOLS%" > NUL
if not %ERRORLEVEL% == 0 echo Copy Failed && exit /b 1

echo -------------
echo All that is left to do is:
echo Open Visual Studio.
echo Under Tools-^>Debugging, ensure that 'Enable source server support' is checked.
echo Enabling 'diagnostic messages” is a good idea as well.'