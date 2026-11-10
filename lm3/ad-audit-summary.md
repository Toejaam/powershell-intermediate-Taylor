# LM3 - Active Directory Security Audit Summary

## Finding 1: Disabled User Accounts

The Active Directory audit identified 5 disabled user accounts.

The accounts included:
- Guest
- krbtgt
- old.employee
- former.staff
- temp.employee

**Recommendation:** Review disabled accounts regularly. Confirm that former employee accounts no longer need access to company resources. Keep special built-in accounts such as Guest and krbtgt under appropriate security controls.

## Finding 2: Security Groups

The audit found 65 security groups and no empty groups.

The Domain Admins group contained the student account.

**Recommendation:** Review administrative group memberships regularly and make sure only authorized users have administrative access.

## Finding 3: Computer Inventory

The audit identified 48 computer accounts.

Only DC01 displayed operating system information. The other 47 computer accounts had missing operating system information.

**Recommendation:** Review computer accounts and update missing operating system information. Remove or disable outdated computer accounts when they are confirmed to be no longer in use.

## Finding 4: User Information

The audit identified user accounts with missing or inconsistent department, email, and office phone information.

Some department entries also contained spelling errors or incorrect values.

**Recommendation:** Keep user account information accurate and complete. Review accounts regularly and correct missing or incorrect information.

## Overall Audit Conclusion

PowerShell made it possible to collect Active Directory information and create reports quickly. The audit identified disabled accounts, administrative group membership, missing user information, and incomplete computer inventory details. Regular reviews can help improve Active Directory security and organization.