param (
    [switch]$Wait = $false
)

# Stop at first error
$global:ErrorActionPreference = "Stop"

if ($Wait) {
    Write-Host "Wait for a while to finish update"
    timeout /t 300
}

$wuService = Get-Service -Name wuauserv
Stop-Service -InputObject $wuService -Force
Set-Service -InputObject $wuService -StartupType Disabled
Write-Host "Windows update service should disabled"

if ($Wait) {
    Read-Host "Press Enter to continue ..."
}
