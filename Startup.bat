@echo off

if "%OS%" == "Windows_NT" (
	setlocal
)

@setlocal EnableDelayedExpansion

call ConfigLoader.bat

call MenuLoader.bat

if "%OS%" == "Windows_NT" (
	endlocal
)

