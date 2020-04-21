#Requires -Version 3.0
<#

    .DESCRIPTION

        This script will bootstrap the deployment of an Azure DevOps SAAS environment.

        Dependencies: 
        
        Usage:

        To run the script excute bootstrap.ps1 -configDirectory "/folder/folder/ -configFile "config.json"
    

    .PARAMETER configDirectory

        [Mandatory Parameter] Folder path of the config file.
    
    .PARAMETER configFile

        [Mandatory Parameter] The name of the  config file.

    .NOTES

        AUTHOR: Steve Owens

        LASTEDIT: Apr 19, 2020

        VERSION: 1.0.1

#>
param(
    [string][Parameter(Mandatory = $true)] $configDirectory,
    [string][Parameter(Mandatory = $true)] $configFile
 )

$ErrorActionPreference = 'Stop'

$config = $configDirectory + $configFile

Write-Host "$config"
Test-Path -Path $config -ErrorAction Stop

# Validate config file exists
try {
    Write-Verbose "Testing that $configFile file exsists."
    Test-Path -Path $config -ErrorAction Stop | Out-Null
}
catch {
    if ($_ -like "false") {
        Write-Warning "The file $(($configFile).ToUpper()) does not exist!"
        Exit
    }
}