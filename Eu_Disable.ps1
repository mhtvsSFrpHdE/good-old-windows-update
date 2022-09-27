# Stop at first error
$global:ErrorActionPreference = "Stop"

# Init cstpw
$global:CSTPW_SCRIPT_FILE = ".\cstpw.cmd"
. .\cstpw.ps1
Cstpw_CreateScript

# Confirm copy file exist
$microsoftEdgeUpdateTaskMachineCoreCopyExist = Test-Path -Path "Copy\MicrosoftEdgeUpdateTaskMachineCore.xml"
$microsoftEdgeUpdateTaskMachineUACopyExist = Test-Path -Path "Copy\MicrosoftEdgeUpdateTaskMachineUA.xml"

If ($microsoftEdgeUpdateTaskMachineCoreCopyExist -And $microsoftEdgeUpdateTaskMachineUACopyExist) {
    Cstpw_WriteScript 'schtasks.exe /change /disable /tn "\MicrosoftEdgeUpdateTaskMachineCore"'
    Cstpw_WriteScript 'schtasks.exe /change /disable /tn "\MicrosoftEdgeUpdateTaskMachineUA"'
    Cstpw_RunScript -Wait
    Write-Host "Edge update task should disabled"

    Copy-Item ".\TinyPE\Small_PE32.exe" -Destination "C:\Program Files (x86)\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe" -Force
    Write-Host "Edge updater should spoofed"
}
Else {
    New-Item "Copy" -Type Directory -Force
    Cstpw_WriteScript 'schtasks.exe /query /xml /tn "\MicrosoftEdgeUpdateTaskMachineCore" > "Copy\MicrosoftEdgeUpdateTaskMachineCore.xml"'
    Cstpw_WriteScript 'schtasks.exe /query /xml /tn "\MicrosoftEdgeUpdateTaskMachineUA" > "Copy\MicrosoftEdgeUpdateTaskMachineUA.xml"'

    Cstpw_RunScript -Wait
    Write-Host "Copy edge update task (not backup!) done"
    Write-Host "Please run again"
}