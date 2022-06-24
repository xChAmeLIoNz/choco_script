
# If Chocolatey isn't installed, it will download and install it
if(!(Test-Path -Path "$env:ProgramData\Chocolatey")) {

	# Sets the Execution Policy to Bypass any prompt for the script
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Write-Output "Execution Policy set to 'Bypass'"
    # Downloads and installs the Chocolatey installation script
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Upgrades Chocolatey
choco upgrade chocolatey -y

# This will look for a file called 'packages.txt' and iterate through it, installing each package
Get-Content ".\packages.txt" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install $_ -y}

# This will get the content of the file 'packages.txt' uploaded on GitHub
#Invoke-WebRequest -Uri https://raw.githubusercontent.com/xChAmeLIoNz/choco_script/master/packages.txt | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install $_ -y}

# Sets the Execution Policy to RemoteSigned
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
Write-Output "Execution Policy set to RemoteSigned"