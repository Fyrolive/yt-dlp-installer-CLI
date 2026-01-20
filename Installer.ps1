$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$scriptsDir = Join-Path $root "scripts"
$binDir = "$env:LOCALAPPDATA\yt-dlp"

Write-Host "Installation path : $binDir"
#if the file already exist, delete it, else create it
if(Test-Path $binDir) {
    Write-Host "Removing previous existing files..."
    Remove-Item -Recurse -Force -Confirm:$false $binDir
}

New-Item -ItemType "Directory" -Path $binDir


Write-Host "Executing depedencies installation"
#& (Join-Path $scriptsDir "dependencies_installer.ps1")

Write-Host "Executing global variable adding"
#& (Join-Path $scriptsDir "path_variable_adder.ps1")

Write-Host "Creating CLI shortcut"
#CLI
Copy-Item `
    "$PSScriptRoot\Youtube_downloader_CLI" `
    "$binDir\Youtube_downloader_CLI" `
    -Recurse

#shortcut
$DesktopPath = [Environment]::GetFolderPath("Desktop")

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$DesktopPath\Youtube_downloader_CLI.lnk")
$shortcut.TargetPath = "$binDir\Youtube_downloader_CLI\Youtube_downloader_CLI.bat"
$shortcut.IconLocation = "$binDir\Youtube_downloader_CLI\ico.ico"
$shortcut.Save()

Write-Host 'Installation complete ! Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')