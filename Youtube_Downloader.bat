::============
:: LAUNCH
::============
@echo off
::later change in custom download path
cd /d %USERPROFILE%\Downloads

::TODO
echo Checking for updates...

@echo off
cd /d %USERPROFILE%\Downloads



::============
:: User app
::============

:main
echo ================================
echo   yt-dlp Downloader (Downloads)
echo ================================

echo 1 - Video (better quality)
echo 2 - MP3 Audio
echo 3 - Video clip
echo Q - Quit

set /p USER_CHOICE=Choice :

if "%USER_CHOICE%"=="1" goto video
if "%USER_CHOICE%"=="2" goto audio
if "%USER_CHOICE%"=="3" goto clip
if "%USER_CHOICE%" EQU "Q" (
	goto end
)
goto main


:video
set /p URL=URL :
yt-dlp "%URL%"
goto main


:audio
set /p URL=URL :
yt-dlp -x --audio-format mp3 "%URL%"
goto main


:clip
set /p URL=URL :
set /p TIME=Clip (00:01:10-00:01:20) :
yt-dlp --download-sections "*%TIME%" "%URL%"
goto main


:end
echo Leaving...
timeout 2 > NUL
exit