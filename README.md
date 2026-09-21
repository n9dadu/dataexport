# Use PowerShell to export SQL data

## use:
``
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0export-datac.ps1" -SQLFile ... -SERVER ... -DATABASE ...
``
the SQLFile must exist in the same folder of script
