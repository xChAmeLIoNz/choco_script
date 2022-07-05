$pws = Read-Host -Prompt "Do you want to install Powershell v7.2.4? Y/N"
if($pws -ieq "y") {
	Set-ExecutionPolicy Bypass -Scope Process -Force
	# Install a newer version of Powershell (7.2.4)
	$uri="https://github.com/PowerShell/PowerShell/releases/download/v7.2.4/PowerShell-7.2.4-win-x64.msi"
	Invoke-WebRequest -Uri $uri -Outfile ".\powershell-7.2.4.msi"; .\powershell-7.2.4.msi
}
$choco = Read-Host -Prompt "Do you want to download Choco_Script and run it? Y/N"
if($choco -ieq "y") {
	### Download the Choco script from github and runs it
	$chocoUri="https://raw.githubusercontent.com/xChAmeLIoNz/choco_script/master/choco_script.ps1"
	#Invoke-WebRequest -Uri $chocoUri -Outfile ".\choco_script.ps1"
	Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($chocoUri))
	#.\choco_script.ps1
}
$perf = Read-Host -Prompt "Apply performance registry? Y/N"
if($perf -ieq "y") {
	reg import ".\best_performance.reg"; .\restart_themes.bat
}
$power = Read-Host -Prompt "Apply Ultimate Power Scheme? Y/N"
if($power -ieq "y") {
	# Add the Ultimate Power Scheme
	powercfg -duplicatescheme 391fdfc6-f37d-4a08-9c60-1d84e60b1853
	# Set the Scheme active
	powercfg -S 391fdfc6-f37d-4a08-9c60-1d84e60b1853
}
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
Write-Output "ExecutionPolicy set to RemoteSigned"
Write-Output "You may want to reboot now..."