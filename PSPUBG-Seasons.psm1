<#
.SYNOPSIS
    Returns seasons from the connected PUBG Api environment
    You must have invoked Set-PUBGApiKey and SSet-PUBGRegion prior to executing this function
.EXAMPLE
    Get-PUBGSeasons
    Returns all seasons of PUBG. The one with isCurrentSeason = true is the current one.
#>
function Get-PUBGSeasons {
    param(
        [parameter(mandatory=$false)]
        [switch]$Current
    )
    if ((Test-PUBGApiEnvironment) -eq $false) {
        'Please make sure the environment variables is set with Set-PUBGApiKey & Set-PUBGRegion before runnning this function'
        break
    }
    if ($Current) {
        $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion + '/seasons'
        $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader | Where-Object {(($_.data).attributes).isCurrentSeason -eq 'true'}
        $Result = $Result | Select-Object -ExpandProperty 'data' | Where-Object {($_.attributes).isCurrentSeason -eq 'true'}
    } else {
        $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion + '/seasons'
        $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    }
    if ($Result -ne $null) {
        return $Result
    } else {
        'There was an error in your request'
    }
}

<#
.SYNOPSIS
    Returns season information for a single player from the connected PUBG Api environment
    You must have invoked Set-PUBGApiKey and Set-PUBGRegion prior to executing this function
.EXAMPLE
    Get-PUBGSeasonStats -PlayerId '659400b28be4471e822e4729586eaa41' -SeasonId 'division.bro.official.2018-05'
    Returns season information for player id 659400b28be4471e822e4729586eaa41 and the season division.bro.official.2018-05.
#>
function Get-PUBGSeasonStats {
    param(
        [parameter(mandatory=$true)]
        [string]$PlayerId,
        [parameter(mandatory=$true)]
        [string]$SeasonId
    )
    if ((Test-PUBGApiEnvironment) -eq $false) {
        'Please make sure the environment variables is set with Set-PUBGApiKey & Set-PUBGRegion before runnning this function'
        break
    }
    if ($PlayerId -or $SeasonId -eq $false) {
        'You need to input PlayerId and SeasonId for this to work'
    }
        $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion + '/players/' + $PlayerId + '/seasons/' + $SeasonId
        $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    if ($Result -ne $null) {
        return $Result
    } else {
        'There was an error in your request'
    }
}