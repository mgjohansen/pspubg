<#
.SYNOPSIS
    Returns clients from the connected Liquid Planner URL (optionally based on a name)
.NOTES
    You must have invoked Set-LiquidPlannerAuth or Set-LiquidPlannerAuthToken prior to executing this cmdlet
.PARAMETER Name
    Parameter to specify the name to search for. Operator is a contains condition. Optional Parameter.
.PARAMETER Filter
    Parameter to specify filter to use in the query. Optional Parameter.
.EXAMPLE
    Get-LiquidPlannerClient -Name 'Client ABC'
    Return clients that contains the name Client ABC
.EXAMPLE
    Get-LiquidPlannerClient -Filter '?filter[]=name%20contains%20Microsoft'
    Return clients that contains the name Microsoft
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
    $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion
    if ($PlayerNames) {
        $RestURL = $RestURL + '/players?filter[playerNames]=' + $PlayerNames
    } elseif ($PlayerIDs) {
        $RestURL = $RestURL + '/players?filter[playerIds]=' + $PlayerIDs
    }
    $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    return $Result
}