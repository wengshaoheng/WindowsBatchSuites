:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Email : wsh21cn2003@126.com
:: 
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set CONFIG_FILE=MenuConfig.ini

set isGlobalSection=0
set isGlobalSectionBody=0
set isMenuSection=0
set isMenuSectionBody=0
set menuCounter=0

for /F "eol=; tokens=1,2,3,4,5,6* delims=#=" %%i in (%CONFIG_FILE%) do (
	if !isGlobalSection! equ 1 set isGlobalSectionBody=1
	
	if !isMenuSection! equ 1 set isMenuSectionBody=1
	
	if "%%i" == "[GLOBAL]" set isGlobalSection=1

	if "%%i" == "[MENU]" (
		set isGlobalSection=0
		set isGlobalSectionBody=0
		set isMenuSection=1
	)
	
	if !isGlobalSectionBody! equ 1 ( 
		set %%i=%%j
	)
	
	if !isMenuSectionBody! equ 1 (
		set /a menuCounter=!menuCounter!+1
		set menuKey_!menuCounter!=%%i
		set optionKey_!menuCounter!=%%j
		set cmdKey_!menuCounter!=%%k
		set menuDescKey_!menuCounter!=%%l
	)
)

