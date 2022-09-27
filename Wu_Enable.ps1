# Stop at first error
$global:ErrorActionPreference = "Stop"

$wuService = Get-Service -Name wuauserv
Set-Service -InputObject $wuService -StartupType Manual
Start-Service -InputObject $wuService
Write-Host "Update service should enabled and started"
