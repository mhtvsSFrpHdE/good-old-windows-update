# Stop at first error
$global:ErrorActionPreference = "Stop"

$wuService = Get-Service -Name wuauserv
Stop-Service -InputObject $wuService -Force
Set-Service -InputObject $wuService -StartupType Disabled
Write-Host "Windows update service should disabled"
