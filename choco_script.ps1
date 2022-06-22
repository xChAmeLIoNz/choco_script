<# append '!' at the start before saving the script for final use #>
$Global:policy = Get-ExecutionPolicy
if(!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
	
    #$policy = Get-ExecutionPolicy
    
	if($policy -ne "Bypass") {
		Set-ExecutionPolicy Bypass -Scope Process -Force
        Write-Output "Execution Policy set to 'Bypass'"
        #Set-ExecutionPolicy RemoteSigned -Scope Process -Force
	}
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

}

choco upgrade chocolatey
##Get-Content ".\packages.txt" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install $_ -y}
Invoke-WebRequest -Uri https://raw.githubusercontent.com/xChAmeLIoNz/choco_script/master/packages.txt | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{}
Set-ExecutionPolicy $Global:policy -Scope Process -Force
Write-Output "Execution Policy set to $Global:policy"