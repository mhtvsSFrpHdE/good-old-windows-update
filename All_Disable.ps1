# Stop at first error
$global:ErrorActionPreference = "Stop"

# Init cstpw
$global:CSTPW_SCRIPT_FILE = ".\cstpw.cmd"
. .\cstpw.ps1
Cstpw_CreateScript

. .\WuTask_Disable.ps1
. .\Eu_Disable.ps1
