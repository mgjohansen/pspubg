<#
.SYNOPSIS
    Returns seasons from the connected PUBG Api environment
    You must have invoked Set-PUBGApiKey and SSet-PUBGRegion prior to executing this function
.EXAMPLE
    Get-PUBGSeasons
    Returns player all seasons of PUBG. The one with isCurrentSeason = true is the current one.
#>
function Get-PUBGSeasons {
    if ((Test-PUBGApiEnvironment) -eq $false) {
        'Please make sure the environment variables is set with Set-PUBGApiKey & Set-PUBGRegion before runnning this function'
        break
    }
    $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion + '/seasons/'
    $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    if ($Result -ne $null) {
        return $Result
    } else {
        'There was an error in your request'
    }
}