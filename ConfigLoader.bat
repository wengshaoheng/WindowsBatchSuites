:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Author: Mars.Weng (wengshaoheng)
:: Email : wsh21cn2003@126.com
:: license : No License, Use it as the way you like
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Load All Configuration Items From The MenuConfig.ini File
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
		if "%%i" == "MM" (
			set /a menuCounter=!menuCounter!+1
			set optionKey_!menuCounter!=!menuCounter!
			set menuCatKey_!menuCounter!=%%i
			set cmdCatKey_!menuCounter!=%%j
			set cmdKey_!menuCounter!=%%k
			set menuDescKey_!menuCounter!=%%l
			if "%%j" == "SMN" (
				set sm_counter_!menuCounter!=0
			)
		) 
		
		if "%%i" == "SM" (
			set /a sm_counter_%%j=!sm_counter_%%j!+1
			set optionKey_%%j_!sm_counter_%%j!=!sm_counter_%%j!
			set parentKey_%%j_!sm_counter_%%j!=%%j
			set cmdKey_%%j_!sm_counter_%%j!=%%k 
			set menuDescKey_%%j_!sm_counter_%%j!=%%l
		)
	)
)
