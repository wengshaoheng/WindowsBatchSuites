:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Email : wsh21cn2003@126.com
:: license : No License, Use it as the way you like
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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

