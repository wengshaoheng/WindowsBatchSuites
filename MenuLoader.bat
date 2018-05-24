:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Email : wsh21cn2003@126.com
:: license : No License, Use it as the way you like
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if %enableCmdTitle% equ 1 title %cmdWndTitle%

::create the banner line
set bannerLine=<nul
if not defined bannerRiskCount (
	set bannerRiskCount=50
) 

for /L %%a in (1, 1, %bannerRiskCount%) do (
	set bannerLine=!bannerLine!*
)

:: paint the top menu
:PAINT_TOP_MENU
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
set option=<nul
set /p option=%prompt%
if /I "%option%" == "x" (
	set /p ans=Are you sure to exit? y/n :
	if /i !ans! == y (
		exit 0
	) else (
		goto PAINT_TOP_MENU
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
	if "cmdCatKey_!option!" == "CMD" (
		cmd /Q /C "%target_cmd%"
	) else (
		set parentTitle=!menuDescKey_%option%!
		set parentId=!option!
		set subMenuCounter=!sm_counter_%option%!
		goto PAINT_SUB_MENU
	)
) else (
	echo.
	echo Error: Invalid option [ %OPTION% ], please re-input ~
)

set option=<nul
echo.
set /p anykey=Please enter any key to continue ~

goto PAINT_TOP_MENU


:PAINT_SUB_MENU
cls
echo.
echo  %date% %time%
echo  %bannerLine%
echo.
echo  Title     : %parentTitle%
echo  Version   : %version%
echo  Copyright : %copyright%
echo.
echo  %bannerLine%
echo.
for /L %%a in (1, 1, %subMenuCounter%) do (
	echo  [ %%a ] !menuDescKey_%parentId%_%%a!
)
echo  [ x ] Exit
echo.

set sub_target_cmd=<nul
set /p sub_option=%prompt%
if /I "%sub_option%" == "x" (
	set sub_target_cmd=<nul
	set sub_option=<nul
	goto PAINT_TOP_MENU
)

for /L %%a in (1, 1, %menuCounter%) do (
	
	if !sub_option! == !optionKey_%parentId%_%%a! (	
		set sub_target_cmd=!cmdKey_%parentId%_%%a!
		goto SUB_HANDLE_OPTION
	)
)

:SUB_HANDLE_OPTION
if defined sub_target_cmd (
	cmd /Q /C "%sub_target_cmd%"
) else (
	echo.
	echo Error: Invalid option [ %sub_option% ], please re-input ~
)

set sub_option=<nul
echo.
set /p anykey=Please enter any key to continue ~

goto PAINT_SUB_MENU



