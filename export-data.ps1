param(
    [Parameter(Mandatory = $true)]
    [string]$SQLFile,

    [string]$SERVER = "localhost",
    [string]$DATABASE = "test"
    
    [string]$Delimiter = ";"
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ConnectionString = "Server=$SERVER;Database=$DATABASE;Integrated Security=True;"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
Write-Host "Open connection to database: $DATABASE on $SERVER"
$SqlConnection.Open()

Write-Host "Executing SQL script: $SQLFile on database: $DATABASE"
$SqlCommand = $SqlConnection.CreateCommand()
$SqlCommand.CommandText = Get-Content "$ScriptDir\$SQLFile" -Raw
$SqlDataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter $SqlCommand
$DataSet = New-Object System.Data.DataSet
$SqlDataAdapter.Fill($DataSet) | Out-Null
$SqlConnection.Close()
$table = $DataSet.Tables[0]
Write-Host "SQL script execution completed. Exporting $($table.Rows.Count) rows to CSV."

$table | Export-Csv -Path "$ScriptDir\$SQLFile.csv" -NoTypeInformation -Delimiter $Delimiter
Write-Host "DONE. Results exported to CSV: $ScriptDir\$SQLFile.csv"
