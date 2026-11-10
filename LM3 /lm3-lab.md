# LM3 – Active Directory Audit

## Task 2: Explore the Active Directory Module

### Active Directory Cmdlets

| Category             | Cmdlet                   | Description |
|---|---|---|
| Users                | Get-ADUser               | Retrieves information about Active Directory users. |
| Groups               | Get-ADGroup              | Retrieves information about Active Directory groups. |
| Computers            | Get-ADComputer           | Retrieves information about computer accounts. |
| Organizational Units | Get-ADOrganizationalUnit | Retrieves information about organizational units. |

### Summary

The Active Directory PowerShell module provides commands that allow administrators to retrieve and manage information about users, groups, computers, and organizational units. These commands help automate administrative tasks and make managing a domain easier.

## Task 3: Investigate User Accounts

### Total Number of Users

- Total Active Directory user accounts: 88

### Three Useful User Properties

| Property | Description | Example Value |
|---|---|---|
| Department | Identifies the employee's department. | IT |
| EmailAddress | Displays the user's email address. | ajackson1@nwtc.local |
| OfficePhone | Displays the user's office phone number. | 9205552710 |

### Default Properties vs. All Properties

The default Get-ADUser command displays basic account information such as the user's name, username, enabled status, and distinguished name.

Using the -Properties * parameter retrieves additional Active Directory attributes, including department, email address, office phone, and job title.

Get-Member displays the properties and methods available on the returned PowerShell objects, while -Properties * retrieves additional attributes from Active Directory.

### Additional Observations

During the investigation, I noticed several accounts with missing or inconsistent department information. Examples included Robin Miller with a misspelled department of Finanace, Robin Young with ITT, and Sam Jackson with Unknown.

I also identified four service accounts: svc_backup, svc_sql, svc_web, and svc_files. These accounts should be reviewed to ensure they have appropriate permissions and are being managed securely.

### Summary

PowerShell makes it easier to retrieve and examine user account information in Active Directory. This information can help administrators identify incomplete records, disabled accounts, and possible security concerns.

