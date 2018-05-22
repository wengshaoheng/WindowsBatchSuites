:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Created On
:: 
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if %enableCmdTitle% equ 1 title %cmdWndTitle%

::create the banner line
set bannerLine=
if not defined bannerRiskCount (
	set bannerRiskCount=50
) 

for /L %%a in (1, 1, %bannerRiskCount%) do (
	set bannerLine=!bannerLine!*
)

:: paint the parent menu
:GLOBAL_PAINT_MENU
cls
echo.
echo  %date% %time%
echo  %bannerLine%
echo.
echo  Title     : %displayTitle%
echo  Version   : %version%
echo  Copyright : %copyright%
echo.
echo  %bannerLine%
echo.
for /L %%a in (1, 1, %menuCounter%) do (
	echo  [ !optionKey_%%a! ] !menuDescKey_%%a!
)
echo  [ x ] Exit
echo.

set target_cmd=<nul
set /p option=%prompt%
if /I "%option%" == "x" (
	set /p ans=Are you sure to exit? y/n :
	if /i !ans! == y (
		exit 0
	) else (
		goto GLOBAL_PAINT_MENU
	)
)

for /L %%a in (1, 1, %menuCounter%) do (
	
	if !option! == !optionKey_%%a! (	
		set target_cmd=!cmdKey_%%a!
		goto HANDLE_OPTION
	)
)

:HANDLE_OPTION
if defined target_cmd (
	echo %target_cmd%
) else (
	echo Error: Invalid Option [ %OPTION% ], Please Input Again
)


set /p anykey=Please enter any key to continue

goto GLOBAL_PAINT_MENU






