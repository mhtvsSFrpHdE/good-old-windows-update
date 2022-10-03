# Stop at first error
$global:ErrorActionPreference = "Stop"

# Init cstpw
$global:CSTPW_SCRIPT_FILE = ".\cstpw.cmd"
. .\cstpw.ps1
Cstpw_CreateScript

# Enable update service
. .\Wu_Enable.ps1

# Remove certain update from list
Write-Host "Remove Windows Malicious Software Removal Tool..."
Hide-WindowsUpdate -Title "Windows Malicious Software Removal Tool" -AcceptAll

# Open setting
Cstpw_WriteScript 'explorer ms-settings:windowsupdate'
# Install update
# https://omgdebugging.com/2017/10/09/command-line-equivalent-of-wuauclt-in-windows-10-windows-server-2016/
Cstpw_WriteScript 'usoclient StartInteractiveScan'
Cstpw_RunScript -Wait

Write-Host "Update should started"

# Run once
. .\Wu_RunOnceSchedule.ps1
