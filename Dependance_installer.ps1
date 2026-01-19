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

curl.exe -L `
    -o "$binDir\yt-dlp.exe" `
    "github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"


    
#ffmpeg
Write-Host "Installation of ffmpeg started..."

curl.exe -L `
    -o "$binDir\ffmpeg.zip" `
    "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"

Expand-Archive -Path "$binDir\ffmpeg.zip" -DestinationPath $binDir\ffmpeg-temp -Force

Copy-Item `
    "$binDir\ffmpeg-temp\*\bin\ffmpeg.exe" `
    "$binDir\ffmpeg.exe"
Copy-Item `
    "$binDir\ffmpeg-temp\*\bin\ffplay.exe" `
    "$binDir\ffplay.exe"
Copy-Item `
    "$binDir\ffmpeg-temp\*\bin\ffprobe.exe" `
    "$binDir\ffprobe.exe"

Remove-Item "$binDir\ffmpeg.zip" -Force
Remove-Item "$binDir\ffmpeg-temp" -Recurse -Force


#end
Write-Host "Download completed !"