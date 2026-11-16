# Task 1: Create a New Employee Account

**Username Created:** joben

**Employee:** Jordan Bennett

**Department:** IT

**Title:** Systems Technician

**Email:** jordan.bennett@nwtc.local

**OU Location:** OU=IT,DC=taylor,DC=local

**Commands Used:**
- `New-ADOrganizationalUnit`
- `New-ADUser`
- `Get-ADUser`

**Result:** Created an enabled Active Directory account for Jordan Bennett and stored it in the IT organizational unit.




## Task 2: Correct Missing User Information

**Accounts reviewed:** 5

**Employee accounts corrected:** 1

### Account Information

- **Taylor Phillips (`taylor.phillips`):** Department, email, and phone number were already populated.
- **Jordan Bennett (`joben`):** Added the missing phone number `920-555-5555`. Department and email were already correct.
- **student:** Lab account, excluded from employee corrections.
- **Guest:** Built-in Windows account, excluded from employee corrections.
- **krbtgt:** Built-in Active Directory account, excluded from employee corrections.

### Commands Used

Find accounts with missing information:

```powershell
Get-ADUser -Filter * -Properties Department,EmailAddress,OfficePhone |
Where-Object {
    !$_.Department -or !$_.EmailAddress -or !$_.OfficePhone
} |
Select-Object Name,SamAccountName,Department,EmailAddress,OfficePhone
```

Update Jordan Bennett's phone number:

```powershell
Set-ADUser joben -OfficePhone "920-555-5555"
```

Verify account information:

```powershell
Get-ADUser -Filter * -Properties Department,EmailAddress,OfficePhone |
Select-Object Name,SamAccountName,Department,EmailAddress,OfficePhone,Enabled |
Format-Table -AutoSize
```

### Result

I reviewed five Active Directory accounts and corrected Jordan Bennett's missing phone number. I excluded the student and the built-in Guest and krbtgt accounts from employee corrections. The final report confirmed that Jordan's department, email, and phone number are populated.

## Task 3: Correct Invalid Department Names

**Number of accounts corrected:** 0

### Command Used

```powershell
Get-ADUser -Filter * -Properties Department |
Where-Object {
    $_.Department -in @("Unknown","ITT","Finanace")
} |
Select-Object Name,SamAccountName,Department
```

### Result

The search returned no results. No accounts were found with the department values `Unknown`, `ITT`, or `Finanace`, so no department corrections were necessary.



## Task 4: Manage Group Membership

### User Added
- Jordan Bennett (`joben`) was added to the `VPN_users` security group.

### User Removed
- No user was removed from `ServerAdmins` because the group did not exist initially.
- The `ServerAdmins` security group was created, but it had no members.

### Commands Used

Add Jordan Bennett to VPN_users:

```powershell
Add-ADGroupMember -Identity VPN_users -Members joben
```

Verify VPN_users membership:

```powershell
Get-ADGroupMember VPN_users
```

Create the missing ServerAdmins group:

```powershell
New-ADGroup -Name "ServerAdmins" -GroupScope Global -GroupCategory Security
```

Verify ServerAdmins:

```powershell
Get-ADGroupMember ServerAdmins
```

### Result
Jordan Bennett was successfully added to VPN_users. ServerAdmins did not exist in the domain, so I created the security group. The group had no members, so no user account could be removed.



## Task 5: Review Service Account Membership

### Account Reviewed
- Account name: `svc_backup`
- Status: Not found in Active Directory.
- Group membership: Could not be determined because the account does not exist.

### ServerAdmins Review
- The `ServerAdmins` security group exists.
- The group currently has no members.

### Commands Used

Check whether the service account exists:

```powershell
Get-ADUser svc_backup -Properties MemberOf
```

Check group memberships:

```powershell
Get-ADPrincipalGroupMembership svc_backup |
Select-Object Name,GroupScope,GroupCategory
```

Search for similar service accounts:

```powershell
Get-ADUser -Filter * |
Where-Object {
    $_.SamAccountName -like "*svc*" -or $_.Name -like "*backup*"
} |
Select-Object Name,SamAccountName,Enabled
```

Check ServerAdmins membership:

```powershell
Get-ADGroupMember ServerAdmins
```

### Decision and Result

The `svc_backup` account could not be found in Active Directory. A search for similar service accounts also returned no results.

No membership changes were made because the account does not exist. The `ServerAdmins` group currently has no members, so there was no existing membership to review.



## Task 6: Disable Former Employee Accounts

### Account Actions

- **temp.employee:** Searched for the account, but it did not exist in Active Directory.
- **former.employee:** Created the account and immediately disabled it.

### Commands Used

Check whether the accounts exist:

```powershell
Get-ADUser -Filter 'SamAccountName -eq "temp.employee" -or SamAccountName -eq "former.employee"' |
Select-Object Name,SamAccountName,Enabled
```

Create former.employee as a disabled account:

```powershell
New-ADUser -Name "Former Employee" -SamAccountName "former.employee" -Enabled $false
```

Verify the account:

```powershell
Get-ADUser former.employee -Properties Enabled |
Select-Object Name,SamAccountName,Enabled
```

### Result

The `temp.employee` account was not found. I created the `former.employee` account and set it to disabled immediately. I verified that its Enabled status is False.

