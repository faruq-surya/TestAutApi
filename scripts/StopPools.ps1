Import-Module WebAdministration

$pools = @(
    "CARE_API",
    "CARE_RRS_API",
    "CARE_PL",
    "CARE_WSL"
)

foreach ($pool in $pools) {

    Write-Host "Stopping $pool..."

    if ((Get-WebAppPoolState $pool).Value -eq "Started") {

        Stop-WebAppPool $pool

        Write-Host "$pool stopped."

    }
    else {

        Write-Host "$pool already stopped."

    }
}
