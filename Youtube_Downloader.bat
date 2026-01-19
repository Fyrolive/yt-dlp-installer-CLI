::============
:: LAUNCH
::============
@echo off
cd /d %USERPROFILE%\Downloads

echo If you seem to get trouble you didn't have before, try to relaunch the installer to download ffmpeg again.

::============
:: User app
::============

:main
echo ================================
echo   yt-dlp Downloader (Downloads)
echo ================================

echo Checking for yt-dlp updates ...
yt-dlp -U

echo 1 - Video (better quality)
echo 2 - MP3 Audio
echo 3 - Video clip
echo Q - Quit

set /p USER_CHOICE=Choice :

if "%USER_CHOICE%"=="1" goto video
if "%USER_CHOICE%"=="2" goto audio
if "%USER_CHOICE%"=="3" goto video-clip
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


:video-clip
set /p URL=URL :
set /p TIME=Clip (00:01:10-00:01:20) :
yt-dlp --download-sections "*%TIME%" "%URL%"
goto main


:end
echo Leaving, thanks for using !
timeout 2 > NUL
exit