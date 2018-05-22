:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Created On
:: 
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if %enableCmdTitle% equ 1 title %title%

:GLOBAL_PAINT_MENU
cls
echo.
echo  %date% %time%
echo  ***************************************************************
echo.
echo  Title     : %displayTitle%
echo  Version   : %version%
echo  Copyright : %copyright%
echo.
echo  ***************************************************************
echo.
for /L %%a in (1, 1, %menuCounter%) do (
	echo  [ !optionKey_%%a! ] !menuDescKey_%%a!
)
echo.
set /p option=%prompt%

for /L %%a in (1, 1, %menuCounter%) do (
	if !option! == !optionKey_%%a! (
		call !commandKey_%%a!
	)
)

set /p anykey=Please Enter Any Key
goto GLOBAL_PAINT_MENU






