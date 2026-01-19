$ErrorActionPreference = "Stop"

Write-Host "Installation of youtube downloader started !"

#Créating directory and path variables
$root = Split-Path -Parent $PSScriptRoot
$binDir = $root\yt-dlp\
New-Item -ItemType "Directory" -Path $root -Name "yt-dlp" 


#yt-dlp
Write-Host "Installation of yt-dlp started..."

Invoke-WebRequest `
    -Uri $https://github.com/yt-dlp/yt-dlp/releases/latest/yt-dlp.exe `
    -OutFile $binDir


#ffmpeg
Write-Host "Installation of ffmpeg started..."

Invoke-WebRequest `
    -Uri "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip" `
    -OutFile "$binDir\ffmpeg.zip"

