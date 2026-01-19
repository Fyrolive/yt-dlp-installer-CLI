$ErrorActionPreference = "Stop"

Write-Host "Installation of youtube downloader started"

#Creating directory and path variables
$binDir = "$env:LOCALAPPDATA\yt-dlp"
Write-Host "Installation path : $binDir"
#if the file already exist, delete it
if(Test-Path $binDir) {
    Write-Host "Removing previous existing files..."
    Remove-Item -Recurse -Force -Confirm:$false $binDir
}

New-Item -ItemType "Directory" -Path $binDir

#yt-dlp
Write-Host "Installation of yt-dlp started..."

Invoke-WebRequest `
    -Uri "github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" `
    -OutFile $binDir\yt-dlp.exe


#ffmpeg
Write-Host "Installation of ffmpeg started..."

Invoke-WebRequest `
    -Uri "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip" `
    -OutFile "$binDir\ffmpeg.zip"

Copy-Item `
    "$binDir\ffmpeg-temp\*\bin\ffmpeg.exe" `
    "$binDir\ffmpeg.exe"

Remove-Item "$binDir\ffmpeg.zip" -Force
Remove-Item "$binDir\ffmpeg-temp" -Recurse -Force

Write-Host "Download completed !"