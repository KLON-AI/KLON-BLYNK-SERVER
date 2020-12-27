
@echo off
color a

set ip_address_string="IP Address"
set ip_address_string="IPv4 Address"
echo.
echo **************************
echo.
echo Starting KLON Server
echo BRAINIFII
echo.
echo **************************
echo.
echo Your working directory is %~dp0
echo.
echo **************************
echo.
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Local Server IP Address is: %%f
    echo Hardware Port : 8080
	echo Application Port : 9443
)
echo.
echo **************************
echo.

echo Getting server file name..... 
echo.

for /f "delims=" %%x in ('dir /od /b server*.jar') do set latestjar=%%x

@echo on

java -jar %latestjar% -dataFolder dataFolder
IF /I "%ERRORLEVEL%" NEQ "0" (
    ECHO Server failed to started
)
pause