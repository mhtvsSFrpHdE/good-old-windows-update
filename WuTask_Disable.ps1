# Disable Update service and Task

# Stop at first error
$global:ErrorActionPreference = "Stop"

# Go to script folder
cd $PSScriptRoot

# Init cstpw
$global:CSTPW_SCRIPT_FILE = ".\cstpw.cmd"
. .\cstpw.ps1
Cstpw_CreateScript

# Confirm copy file exist
$scheduledStartCopyExist = Test-Path -Path "Copy\Scheduled Start.xml"
$sihpostrebootCopyExist = Test-Path -Path "Copy\sihpostreboot.xml"

If ($scheduledStartCopyExist -And $sihpostrebootCopyExist) {
    . .\Wu_Disable.ps1

    Cstpw_WriteScript 'schtasks.exe /change /disable /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start"'
    Cstpw_RunScript -Wait
    Write-Host "Windows update task should disabled"
}
Else {
    New-Item "Copy" -Type Directory -Force
    Cstpw_WriteScript 'schtasks.exe /query /xml /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" > "Copy\Scheduled Start.xml"'
    Cstpw_WriteScript 'schtasks.exe /query /xml /tn "\Microsoft\Windows\WindowsUpdate\sihpostreboot" > "Copy\sihpostreboot.xml"'

    Cstpw_RunScript -Wait
    Write-Host "Copy windows update task (not backup!) done"
    Write-Host "Please run again"
}
