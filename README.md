# Chocolatey Powershell Script
Simple powershell script to automate software installation on newly configurated windows machines using Chocolatey.
## Prerequisites
If you can't run the script, run this first:

``
Set-ExecutionPolicy Bypass -Scope Process -Force
``

## Usage
``
.\choco_script.ps1
``

The script will install Chocolatey if it's not already installed, then it will proceed to install all the packages written inside the 'packages.txt' file.
## Add new packages
In order to do so, open the 'packages.txt' file and insert the package name you want to install.

BE SURE to separate each package with a line break.

You can find the community package repository here:

https://community.chocolatey.org/packages

