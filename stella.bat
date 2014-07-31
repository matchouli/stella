@setlocal enableExtensions enableDelayedExpansion
@echo off
echo ***************************************************************
echo ** EXECUTING : %~n0

call %~dp0\conf.bat



:: arguments
set "params=domain:"app feature virtual api" action:"init get-data get-assets update-data update-assets revert-data revert-assets setup-env install list create-env run-env stop-env destroy-env info-env create-box get-box" id:"_ANY_""
set "options=-f: -arch:"#x64 x86" -vcpu:_ANY_ -vmem:_ANY_ -head: -login: -vers:_ANY_ -approot:_ANY_ -workroot:_ANY_ -cachedir:_ANY_"

call %STELLA_COMMON%\argopt.bat :argopt %*
if "%ARGOPT_FLAG_ERROR%"=="1" goto :usage
if "%ARGOPT_FLAG_HELP%"=="1" goto :usage

set ARCH=%-arch%
set FORCE=%-f%

:: setting env
call %STELLA_COMMON%\common.bat :init_stella_env



REM --------------- APP ----------------------------
if "%DOMAIN%"=="app" (

	if "%ACTION%"=="init" (
		
		if "%-approot%"=="" (
			set "-approot=%_STELLA_CURRENT_RUNNING_DIR%"
		)
		if "%-workroot%"=="" (
			set "-workroot=."
		)

		if "%-cachedir%"=="" (
			set "-cachedir=!-workroot!\cache"
		)

		call %STELLA_COMMON%\common-app :init_app "%id%" "!-approot!" "!-workroot!" "!-cachedir!"

		cd /D "!-approot!"
		call stella.bat feature install default

		@echo off
	)

	if not "%ACTION%"=="init" (
		if not exist "%_STELLA_APP_PROPERTIES_FILE%" (
			echo ** ERROR properties file does not exist
		)
	)

	if "%ACTION%"=="get-data" (
		if "%id%"=="all" (
			call %STELLA_COMMON%\common-app.bat :get_all_data
		) else (
			call %STELLA_COMMON%\common-app.bat :get_data "%id%"
		)
	)
	
	if "%ACTION%"=="get-assets" (
		if "%id%"=="all" (
			call %STELLA_COMMON%\common-app.bat :get_all_assets		
		) else (
			call %STELLA_COMMON%\common-app.bat :get_assets "%id%"
		)
	)

	if "%ACTION%"=="update-data" (
		call %STELLA_COMMON%\common-app.bat :update_data "%id%"
	)
	
	if "%ACTION%"=="update-assets" (
		call %STELLA_COMMON%\common-app.bat :update_assets "%id%"
	)

	if "%ACTION%"=="revert-data" (
		call %STELLA_COMMON%\common-app.bat :revert_data "%id%"
	)
	
	if "%ACTION%"=="revert-assets" (
		call %STELLA_COMMON%\common-app.bat :revert_assets "%id%"
	)

	
	if "%ACTION%"=="setup-env" (
		if "%id%"=="all" (
			call %STELLA_COMMON%\common-app.bat :setup_all_env
		) else (
			call %STELLA_COMMON%\common-app.bat :setup_env "%id%"
		)
	)

)
if "%DOMAIN%"=="app" goto :end



REM --------------- API ----------------------------
if "%DOMAIN%"=="api" (
	if "%ACTION%"=="list" (
		if "%id%"=="all" (
			call %STELLA_COMMON%\common-api.bat :api_list "VAR"
			echo !VAR!
			goto :end
		)
	)
)
if "%DOMAIN%"=="api" goto :end


REM --------------- FEATURE ----------------------------
if "%DOMAIN%"=="feature" (
	set "_feature_options=-arch=%ARCH%"
	if "%-f%"=="1" set "_feature_options=%_feature_options% -f"
	if not "%-vers%"=="1" set "_feature_options=%_feature_options% -vers=%-vers%"
	
	call %STELLA_ROOT%\feature.bat %ACTION% %id% %_feature_options%
	@echo off
	goto :end
	
)
if "%DOMAIN%"=="feature" goto :end


REM --------------- VIRTUAL ----------------------------
if "%DOMAIN%"=="virtual" (
	set "_virtual_options="
	if not "%-vcpu%"=="" set "_virtual_options=!_virtual_options! -vcpu=%-vcpu%"
	if not "%-vmem%"=="" set "_virtual_options=!_virtual_options! -vmem=%-vmem%"
	if "%-head%"=="1" set "_virtual_options=!_virtual_options! -head"
	if "%-login%"=="1" set "_virtual_options=!_virtual_options! -login"

	if "%-f%"=="1" set "_virtual_options=!_virtual_options! -f"
	
	call %STELLA_ROOT%\virtual.bat %ACTION% %id% !_virtual_options!
	@echo off
	goto :end
)
if "%DOMAIN%"=="virtual" goto :end



:usage
	echo USAGE :
	echo %~n0 %ARGOPT_HELP_SYNTAX%
	echo ----------------
	echo List of commands
	echo 	* application management :
	echo 		%~n0 app init ^<application name^> [-approot=^<path^>] [-workroot=^<path^>] [-cachedir=^<path^>]
	echo 		%~n0 app get-data^|get-assets^|update-data^|update-assets^|revert-data^|revert-assets ^<data id^|assets id^|all^>
	echo 		%~n0 app setup-env ^<env id^|all^> : download, build, deploy and run virtual environment based on app properties
	echo	* feature management :
	echo 		%~n0 feature install default : install minimal default features for Stella
	echo 		%~n0 feature install ^<feature name^> [-vers=^<version^>] : install a features. version is optional
	echo 		%~n0 feature list ^<all^|feature name^>: list all available features OR available version of a feature
	echo 		%~n0 feature list all: list available features
	echo	* virtual management :
	echo 		%~n0 virtual create-env ^<env id#distrib id^> [-head] [-vmem=xxxx] [-vcpu=xx] : create a new environment from a generic box prebuilt with a specific distribution
	echo		%~n0 virtual run-env ^<env id^> [-login] : manage environment
	echo		%~n0 virtual stop-env^|destroy-env ^<env id^> : manage environment
	echo 		%~n0 virtual create-box^|get-box ^<distrib id^> : manage generic boxes built with a specific distribution
	echo 		%~n0 virtual list ^<box^|env^|distrib^>
	echo	* API :
	echo 		%~n0 api list all : list public functions of stella api
goto :end



:end
@echo ** END **
@cd /D %_STELLA_CURRENT_RUNNING_DIR%
@echo on
@endlocal