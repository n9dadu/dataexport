# Use PowerShell to export SQL data

## use:
``
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0export-datac.ps1" -SQLFile ... -SERVER ... -DATABASE ... -DELIMITER ...
``
### default parameter
* **-SQLFile**: mandatory
* **-SERVER**: optional, default = ``localhost``
* **-DATABASE**: optional, default= ``test``
* **-DELIMITER**: optional - default=``;``
## description:
* The SQLFile must exist in the same folder of script
* data exported to ``SQLFile``.csv (e.g C:\\...\\Data-Query.sql.csv)
