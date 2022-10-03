# Stop at first error
$global:ErrorActionPreference = "Stop"

# Run once
$disableScriptPath = "`"$($PSScriptRoot)\Wu_DisableRunOnceWrapper.ps1`""
$runOnceString = "powershell.exe -File $($disableScriptPath)"
$regPath = "HKCU:Software\Microsoft\Windows\CurrentVersion\RunOnce"
$regName = "DisableWindowsUpdate"
Set-ItemProperty $regPath -Name $regName -Value $runOnceString

Write-Host "Run once disable update at next start should scheduled"
