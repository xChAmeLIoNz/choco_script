Set-ExecutionPolicy Bypass -Scope Process -Force
# Install a newer version of Powershell (7.2.4)
$uri="https://github.com/PowerShell/PowerShell/releases/download/v7.2.4/PowerShell-7.2.4-win-x64.msi"
Invoke-WebRequest -Uri $uri -Outfile ".\powershell-7.2.4.msi"; .\powershell-7.2.4.msi
### Download the Choco script from github and runs it
$chocoUri="https://raw.githubusercontent.com/xChAmeLIoNz/choco_script/master/choco_script.ps1"
#Invoke-WebRequest -Uri $chocoUri -Outfile ".\choco_script.ps1"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($chocoUri))
#.\choco_script.ps1
reg import ".\best_performance.reg"; .\restart_themes.bat
# Add the Ultimate Power Scheme
powercfg -duplicatescheme 391fdfc6-f37d-4a08-9c60-1d84e60b1853
# Set the Scheme active
powercfg -S 391fdfc6-f37d-4a08-9c60-1d84e60b1853
Set-ExecutionPolicy RemoteSigned -Scope Process -Force