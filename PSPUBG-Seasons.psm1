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