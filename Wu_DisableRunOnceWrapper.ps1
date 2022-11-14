# Stop at first error
$global:ErrorActionPreference = "Stop"

# Open setting
Start-Process explorer -ArgumentList "ms-settings:windowsupdate"

Write-Host "Wait for a while to finish update"
Read-Host "Press Enter to continue disable Windows update service..."

# Run disable update
$disableScriptPath = "`"$($PSScriptRoot)\WuTask_Disable.ps1`""
Start-Process powershell -ArgumentList "-File", $($disableScriptPath) -Verb RunAs

Write-Host "Windows update service should disabled"
Read-Host "It is now safe to turn off this window."
