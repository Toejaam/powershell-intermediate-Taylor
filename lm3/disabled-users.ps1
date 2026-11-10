
# Task 4 - Find Disabled Users

Import-Module ActiveDirectory

$dc = "172.16.0.6"
$cred = Get-Credential

# Find disabled users
$disabledUsers = Get-ADUser -Filter 'Enabled -eq $false' -Server $dc -Credential $cred

# Show disabled users
$disabledUsers | Format-Table Name, SamAccountName, Enabled

# Show total number
$disabledUsers.Count

# Save results to a CSV file
$disabledUsers | Select-Object Name, SamAccountName, Enabled |
Export-Csv -Path "$PSScriptRoot\disabled-users.csv" -NoTypeInformation
