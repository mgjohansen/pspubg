# PSPUBG
This PowerShell module provides a series of cmdlets for interacting with the [PUBG API](https://developer.playbattlegrounds.com). Invoke-RestMethod is used for all API calls.

## Requirements
Requires PowerShell 3.0 or above (this is when `Invoke-RestMethod` was introduced).

## Usage
Download the [latest release](https://github.com/mgjohansen/pspubg/releases/latest) and extract the .psm1 and .psd1 files to your PowerShell profile directory (i.e. the `Modules` directory under wherever `$profile` points to in your PS console) and run:
`Import-Module PSPUBG`
Once you've done this, all the cmdlets will be at your disposal, you can see a full list using `Get-Command -Module PSPUBG`. Remember to run Set-PUBGApiKey & Set-PUBGRegion before beginning to work with the API.

## Cmdlets
* cmdlet 1
* cmdlet 2
* cmdlet 3

## Author
Author: Morten G. Johansen (<morten@glerupjohansen.dk>) // [Twitter](https://twitter.com/mgjohansen)