@echo off

cd /D "%~dp0"
call "%~dp0\update-config.bat"
LaunchUtils/busybox-sh.bat ./LaunchUtils/ScriptCaller.sh %*
