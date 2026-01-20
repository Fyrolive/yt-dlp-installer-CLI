$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$scriptDir = Join-Path $root "scripts"
$binDir = "$env:LOCALAPPDATA\yt-dlp"

Write-Host "Installation path : $binDir"
#if the file already exist, delete it, else create it
if(Test-Path $binDir) {
    Write-Host "Removing previous existing files..."
    Remove-Item -Recurse -Force -Confirm:$false $binDir
}

New-Item -ItemType "Directory" -Path $binDir


Write-Host "Executing depedencies installation"
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\scripts\dependencies_installer.ps1.ps1"))


Write-Host "Executing global variable adding"
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\scripts\path_variable_adder.ps1"))


Write-Host "Creating CLI shortcut"
#CLI
Copy-Item `
    "$PSScriptRoot\CLI\Youtube_downloader_CLI.bat" `
    "$binDir\Youtube_downloader_CLI.bat"

#shortcut
$DesktopPath = [Environment]::GetFolderPath("Desktop")

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$DesktopPath\Youtube_Downloader_CLI.lnk")
$shortcut.TargetPath = "$binDir\Youtube_downloader_CLI.bat"
$shortcut.IconLocation =  "$PSScriptRoot\ico.png"
$shortcut.Save()

Write-Host 'Installation complete ! Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')