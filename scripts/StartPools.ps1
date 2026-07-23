Import-Module WebAdministration

$pools = @(
    "CARE_API",
    "CARE_RRS_API",
    "CARE_PL",
    "CARE_WSL"
)

foreach ($pool in $pools) {

    Write-Host "Checking $pool..."

    if ((Get-WebAppPoolState -Name $pool).Value -eq "Stopped") {

        Start-WebAppPool -Name $pool

        Write-Host "$pool started."

    }
    else {

        Write-Host "$pool is already running."

    }
}
