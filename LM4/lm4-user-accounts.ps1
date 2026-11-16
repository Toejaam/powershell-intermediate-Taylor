
# Export Active Directory user accounts

Get-ADUser -Filter * -Properties Department |
Select-Object Name,Department,Enabled |
Export-Csv -Path ".\lm4-user-accounts.csv" -NoTypeInformation
