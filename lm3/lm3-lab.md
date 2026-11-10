# LM3 – Active Directory Audit

## Lab Overview

This lab focused on using PowerShell to investigate and audit an Active Directory environment. I used Active Directory commands to retrieve users, groups, and computer information and created CSV reports.

**Domain Controller:** DC01  
**Domain Controller IP:** 172.16.0.6  
**Original Windows VM:** PI-TaylorPhilli  
**Original Windows VM IP:** 172.16.0.4

---

## Task 1: Deploy Domain Controller

Deployed a Windows Server domain controller named DC01.

- Computer name: DC01
- Private IP address: 172.16.0.6

The domain controller was successfully deployed.

## Task 2: Install and Verify Active Directory PowerShell Tools

Installed and verified the Active Directory PowerShell module.

Commands used:

```powershell
Get-Module ActiveDirectory -ListAvailable
Get-Command Get-ADUser
Import-Module ActiveDirectory
```

Verified the following Active Directory commands:

| Cmdlet | Description |
|---|---|
| Get-ADUser | Retrieves Active Directory user accounts |
| Get-ADGroup | Retrieves Active Directory groups |
| Get-ADComputer | Retrieves computer accounts |
| Get-ADOrganizationalUnit | Retrieves organizational units |

The Active Directory PowerShell module was successfully installed and working.

## Task 3: Retrieve Active Directory Users

Connected to the domain controller using PowerShell and retrieved all Active Directory users.

Commands used:

```powershell
$dc = "172.16.0.6"
$cred = Get-Credential

$users = Get-ADUser -Filter * -Server $dc -Credential $cred

$users.Count
```

**Total user accounts found: 88**

Retrieved additional user information using:

```powershell
$allUsers = Get-ADUser -Filter * -Properties * -Server $dc -Credential $cred

$allUsers | Format-Table Name, Department, EmailAddress, OfficePhone, Title
```

### Observations

- Some users were missing department information.
- Robin Miller had a department listed as `Finanace`.
- Robin Young had a department listed as `ITT`.
- Sam Jackson had a department listed as `Unknown`.
- Four service accounts were identified:
  - svc_backup
  - svc_sql
  - svc_web
  - svc_files

## Task 4: Find Disabled Accounts

Created a PowerShell script named `disabled-users.ps1` to find disabled Active Directory accounts.

The script:
- Retrieved disabled user accounts.
- Displayed the disabled users.
- Counted the disabled accounts.
- Exported the results to `disabled-users.csv`.

**Total disabled accounts found: 5**

Accounts identified:
- Guest
- krbtgt
- old.employee
- former.staff
- temp.employee

The CSV report was successfully created.

## Task 5: Find Missing User Information

Created a PowerShell script named `find-missing-info.ps1` to find users missing important account information.

The script checked for missing:
- Department
- Email address
- Office phone number

The results were displayed in PowerShell and exported to:

`incomplete-users.csv`

The CSV report was successfully created.

## Task 6: Investigate Security Groups

Created a PowerShell script named `security-groups.ps1` to investigate Active Directory security groups.

### Results

- Total security groups: 65
- Empty security groups: None found
- Administrative group identified: Domain Admins
- Domain Admins member identified: student

The `student` account was found in the Domain Admins group.

## Task 7: Create Computer Inventory

Created a PowerShell script named `computer-inventory.ps1` to retrieve Active Directory computer accounts.

The script displayed computer names and operating systems and exported the results to `computer-inventory.csv`.

### Results

- Total computer accounts: 48
- Domain controller: 1
- Desktop computers: 30
- Laptops: 10
- Additional servers: 4
- Older computers: 3

Only DC01 displayed operating system information. The other 47 computer accounts had blank operating system information.

## Task 8: Security Audit Findings

Created `ad-audit-summary.md` to document the security audit findings and recommendations.

### Main Findings

1. Five disabled user accounts were identified.
2. The environment contained 65 security groups.
3. No empty security groups were found.
4. The student account was a member of Domain Admins.
5. The environment contained 48 computer accounts.
6. Forty-seven computer accounts were missing operating system information.
7. Some user accounts had missing or incorrect information.

### Recommendations

- Review disabled accounts regularly.
- Check administrative group memberships to make sure access is appropriate.
- Review computer accounts and update missing information.
- Correct missing or inaccurate user information.
- Review service accounts and their permissions regularly.

## Final Lab Summary

This lab helped me learn how to use PowerShell to manage and investigate Active Directory.

I learned how to retrieve user accounts, identify disabled accounts, find missing user information, investigate security groups, and create a computer inventory.

PowerShell made it easier to collect information and export reports into CSV files. The audit also showed why it is important to keep Active Directory accounts and information accurate and secure.

