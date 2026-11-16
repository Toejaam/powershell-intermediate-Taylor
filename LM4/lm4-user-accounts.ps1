
Get-ADUser -Filter * -Properties Department |
Select-Object Name, Department, Enabled |
Export-Csv lm4-user-accounts.csv
