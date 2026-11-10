
# Task 6 - Investigate Security Groups

# Import Active Directory
Import-Module ActiveDirectory

# Connect to the domain controller
$dc = "172.16.0.6"

# Get all security groups
$groups = Get-ADGroup -Filter 'GroupCategory -eq "Security"' -Server $dc -Credential $cred

# Display all security groups
$groups | Format-Table Name

# Display the total number of groups
$groups.Count

# Check each group for members
foreach ($group in $groups) {

    # Get group members
    $members = Get-ADGroupMember -Identity $group -Server $dc -Credential $cred

    # Display groups with no members
    if ($members.Count -eq 0) {
        Write-Host $group.Name
    }
}
# Task 6 Results
# Total security groups: 65
# Empty groups: None found
# Administrative group: Domain Admins
# Domain Admins member: student