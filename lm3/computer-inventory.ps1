
# Task 7 - Computer Inventory

# Import Active Directory
Import-Module ActiveDirectory

# Connect to domain controller
$dc = "172.16.0.6"

# Get all computers
$computers = Get-ADComputer -Filter * -Properties OperatingSystem -Server $dc -Credential $cred

# Display computer information
$computers | Format-Table Name, OperatingSystem

# Display total number of computers
$computers.Count

# Save computer information to CSV
$computers | Select-Object Name, OperatingSystem, DistinguishedName |
Export-Csv .\computer-inventory.csv -NoTypeInformation

# Task 7 Results
# Total computer accounts: 48
# Domain controller: DC01
# Desktop computers: 30
# Laptops: 10
# Additional servers: 4
# Older computers: 3
# Operating system information is missing for 47 computers