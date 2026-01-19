$ErrorActionPreference = "Stop"

Write-Host "Adding path variable for yt-dlp"

#adding variable
$binDir = "$env:LOCALAPPDATA\yt-dlp"
#$env:Path += ";$binDir"
$path = [Environment]::GetEnvironmentVariable("Path", "User")

if($path -notlike "*$binDir*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$path;$binDir",
        "User"
    )
    Write-Host "Variable added to the path successfully"
} else {
    Write-Host "Variable already added"
}
