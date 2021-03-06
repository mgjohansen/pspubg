<#
.SYNOPSIS
    Returns players from the connected PUBG Api environment
    You must have invoked Set-PUBGApiKey and Set-PUBGRegion prior to executing this function
.PARAMETER PlayerNames
    Parameter to specify the player name(s) to search for. Optional Parameter.
.PARAMETER PlayerIDs
    Parameter to specify the player id(s) to search for. Optional Parameter.
.EXAMPLE
    Get-PUBGPlayers -PlayerNames 'Sourc3Unk0wn'
    Returns player with the name Sourc3Unk0wn
.EXAMPLE
    Get-PUBGPlayers -PlayerNames 'Priceless_dk,Sourc3Unk0wn'
    Returns multiple players
.EXAMPLE
    Get-PUBGPlayers -PlayerIDs 'account.659400b28be4471e822e4729586eaa41'
    Returns player with the account id 659400b28be4471e822e4729586eaa41
#>
function Get-PUBGPlayers {
    Param (
        [Parameter(Mandatory=$false)]
        [string] $PlayerNames,
        [Parameter(Mandatory=$false)]
        [string] $PlayerIDs
    )
    if ((Test-PUBGApiEnvironment) -eq $false) {
        'Please make sure the environment variables is set with Set-PUBGApiKey & Set-PUBGRegion before runnning this function'
        break
    }
    if ($PlayerNames -and $PlayerIDs -eq $false) {
        'You need to either input PlayerNames or PlayerIDs for this to work'
    }
    $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion
    if ($PlayerNames) {
        $RestURL = $RestURL + '/players?filter[playerNames]=' + $PlayerNames
    } elseif ($PlayerIDs) {
        $RestURL = $RestURL + '/players?filter[playerIds]=' + $PlayerIDs
    }
    $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    if ($Result -ne $null) {
        return $Result
    } else {
        'There was an error in your request'
    }
}