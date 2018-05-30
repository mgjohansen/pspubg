# PSPUBG
This PowerShell module provides a series of cmdlets for interacting with the [PUBG API](https://developer.playbattlegrounds.com). Invoke-RestMethod is used for all API calls.

## Requirements
Requires PowerShell 3.0 or above (this is when `Invoke-RestMethod` was introduced).

## Usage
You can install the module from [PowerShell Gallery](https://www.powershellgallery.com/packages/pspubg/) `Find-Module pspubg | Install-Module` and then run:
`Import-Module PSPUBG`
Once you've done this, all the cmdlets will be at your disposal, you can see a full list using `Get-Command -Module PSPUBG`. Remember to run Set-PUBGApiKey & Set-PUBGRegion before beginning to work with the API.

## Cmdlets
* Get-PUBGMatch
* Get-PUBGPlayers
* Get-PUBGSeasons
* Get-PUBGSeasonStats
* Remove-PUBGApiEnvironment
* Set-PUBGApiKey
* Set-PUBGRegion
* Test-PUBGApiEnvironment

## Author
Author: Morten G. Johansen (<morten@glerupjohansen.dk>) // [Twitter](https://twitter.com/mgjohansen)