<#
.SYNOPSIS
    Set's the API-key and Rest URL to the PUBG API
.NOTES
    You can create your app and get a API key from https://developer.playbattlegrounds.com
.PARAMETER ApiKey
    Parameter to specify API-key to use in the query. Mandatory Parameter.
.EXAMPLE
    Set-PUBGApiKey -ApiKey '12a3bc4d-5678-9e0f-8c92-8affa74dd371'
    Set's the Api-key to 12a3bc4d-5678-9e0f-8c92-8affa74dd371
#>
function Set-PUBGApiKey {
    param(
        [parameter(mandatory=$true)]
        [string]$ApiKey
    )
    $Global:PUBGRestUrl = 'https://api.playbattlegrounds.com/shards/'
    $Global:PUBGApiKey = $ApiKey
    $Global:PUBGApiHeader = @{Authorization = "Bearer $ApiKey";Accept = 'application/vnd.api+json'}
    return $true;
}

<#
.SYNOPSIS
    Set's the region to do the query on
.NOTES
    All avaliable PUBG regions can be seen here https://documentation.playbattlegrounds.com/en/making-requests.html#regions
.PARAMETER Region
    Parameter to specify region to use in the query. Manadatory Parameter.
.EXAMPLE
    Set-PUBGRegion -Region 'pc-eu'
    Set's the region to pc europe
#>
function Set-PUBGRegion {
    param(
        [parameter(mandatory=$true)]
        [ValidateSet('xbox-as','xbox-eu','xbox-na','xbox-oc','pc-krjp','pc-jp','pc-na','pc-eu','pc-ru','pc-oc','pc-kakao','pc-sea','pc-sa','pc-as')]
        [string]$Region
    )
    switch ($Region) {
        'xbox-as' { $Region = 'xbox-as' }
        'xbox-eu' { $Region = 'xbox-eu' }
        'xbox-na' { $Region = 'xbox-na' }
        'xbox-oc' { $Region = 'xbox-oc' }
        'pc-krjp' { $Region = 'pc-krjp' }
        'pc-jp' { $Region = 'pc-jp' }
        'pc-na' { $Region = 'pc-na' }
        'pc-eu' { $Region = 'pc-eu' }
        'pc-ru' { $Region = 'pc-ru' }
        'pc-oc' { $Region = 'pc-oc' }
        'pc-kakao' { $Region = 'pc-kakao' }
        'pc-sea' { $Region = 'pc-sea' }
        'pc-sa' { $Region = 'pc-sa' }
        'pc-as' { $Region = 'pc-as' }
    }
    $Global:PUBGRegion = $Region
    return $true;
}

<#
.SYNOPSIS
    Test if all required values have been set in the current session
.EXAMPLE
    Test-PUBGApiEnvironment
    Will check if a all values are set
#>
function Test-PUBGApiEnvironment {
    if ($Global:PUBGRestUrl -and $Global:PUBGApiKey -and $Global:PUBGRegion -and $Global:PUBGApiHeader) {
        return $true;
    } else {
        return $false;
    }
}

<#
.SYNOPSIS
    Removes all PUBG related variables
.EXAMPLE
    Remove-PUBGApiEnvironment
    Will clean your environment and remove all PUBG Global variables
#>
function Remove-PUBGApiEnvironment {
    if ($Global:PUBGRestUrl) {
        Remove-Variable -Name PUBGRestUrl -Scope Global
    }
    if ($Global:PUBGApiKey) {
        Remove-Variable -Name PUBGApiKey -Scope Global
    }
    if ($Global:PUBGRegion) {
        Remove-Variable -Name PUBGRegion -Scope Global
    }
    if ($Global:PUBGApiHeader) {
        Remove-Variable -Name PUBGApiHeader -Scope Global
    }
    return $true;
}
