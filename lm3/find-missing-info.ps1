
# Task 5 - Find Missing User Information

# Import Active Directory
Import-Module ActiveDirectory

# Connect to the domain controller
$dc = "172.16.0.6"
$cred = Get-Credential

# Get all Active Directory users
$users = Get-ADUser -Filter * -Properties Department, EmailAddress, OfficePhone -Server $dc -Credential $cred

# Find users missing information
$missingUsers = $users | Where-Object {
    !$_.Department -or !$_.EmailAddress -or !$_.OfficePhone
}

# Display users missing information
$missingUsers | Format-Table Name, Department, EmailAddress, OfficePhone

# Export results to CSV
$missingUsers | Export-Csv .\incomplete-users.csv -NoTypeInformation

# Display total number of users found
$missingUsers.Count
