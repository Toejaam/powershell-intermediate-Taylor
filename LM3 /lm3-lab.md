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

- Total Active Directory users: 88

### Useful User Properties

| Property | Description | Example Value |
|---|---|---|
| Department | Identifies the employee's department. | [ENTER ACTUAL VALUE] |
| EmailAddress | Displays the user's email address. | [ENTER ACTUAL VALUE] |
| OfficePhone | Displays the user's office phone number. | [ENTER ACTUAL VALUE] |

### Default Properties vs. All Properties

The default Get-ADUser command displays basic account information. Using the -Properties * parameter retrieves additional Active Directory attributes, including department, email address, office phone, and other user information.

### Summary

PowerShell makes it easier to retrieve and examine user account information in Active Directory. This information can help administrators identify incomplete accounts and potential security concerns.
