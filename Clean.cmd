@ECHO OFF

setlocal

set MSBUILDEXE=msbuild.exe

set cfgOption=/p:Configuration=Release
REM set cfgOption=/p:Configuration=Debug
REM set cfgOption=/p:Configuration=Debug;Release
if not "%1"=="" set cfgOption=/p:Configuration=

set logOptions=/v:n /flp:Summary;Verbosity=diag;LogFile=msbuild.log /flp1:warningsonly;logfile=msbuild.wrn /flp2:errorsonly;logfile=msbuild.err
REM set logOptions=/v:diag /flp:Summary;Verbosity=diag;LogFile=msbuild.log /flp1:warningsonly;logfile=msbuild.wrn /flp2:errorsonly;logfile=msbuild.err

%MSBUILDEXE% "%~dp0\RoslynCodeProvider.msbuild" /t:Clean %logOptions% /maxcpucount /nodeReuse:false %cfgOption%%*
rd /q /s Roslyn46
rd /q /s Roslyn472
rd /q /s RoslynLatest
del /F msbuild.log
del /F msbuild.wrn
del /F msbuild.err

endlocal