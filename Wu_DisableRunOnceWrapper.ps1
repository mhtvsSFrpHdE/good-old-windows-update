# Stop at first error
$global:ErrorActionPreference = "Stop"

# Init cstpw
$global:CSTPW_SCRIPT_FILE = ".\cstpw.cmd"
. .\cstpw.ps1
Cstpw_CreateScript

# Open setting
Cstpw_WriteScript 'explorer ms-settings:windowsupdate'
Cstpw_RunScript -Wait

# Run disable update
$disableScriptPath = "`"$($PSScriptRoot)\Wu_Disable.ps1`""
Start-Process powershell -ArgumentList "-File", $($disableScriptPath), "-Wait", "-NoExit" -Verb RunAs