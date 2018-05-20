<#
.SYNOPSIS
    Returns match from the connected PUBG Api environment
    You must have invoked Set-PUBGApiKey and SSet-PUBGRegion prior to executing this function
.PARAMETER MatchID
    Parameter to specify the match id to search for. Mandatory Parameter.
.EXAMPLE
    Get-PUBGMatch -MatchID '140adca4-cb4f-4976-87ee-19c794ba3ac2'
#>
function Get-PUBGMatch {
    Param (
        [Parameter(Mandatory=$true)]
        [string] $MatchID
    )
    if ((Test-PUBGApiEnvironment) -eq $false) {
        'Please make sure the environment variables is set with Set-PUBGApiKey & Set-PUBGRegion before runnning this function'
        break
    }
    $RestURL = $Global:PUBGRestUrl + $Global:PUBGRegion + '/matches/' + $MatchID
    $Result = Invoke-RestMethod -Method Get -Uri $RestURL -ContentType "application/json" -Headers $Global:PUBGApiHeader
    if ($Result -ne $null) {
        return $Result
    } else {
        'There was an error in your request'
    }
}