# LM1 Lab - Get-DiskReport

## Task 1: Evaluate an Administrative Command

**Command:**
`Get-CimInstance Win32_LogicalDisk -ComputerName PC01`

**What information does the command provide?**

It retrieves information about a computer's drives, including drive letters, total disk size, and available free space.

**How might a systems administrator use it?**

An administrator can use this command to check storage on computers and servers and identify systems running low on disk space.

**Limitations:**

1. The command must be typed repeatedly.
2. It displays more information than necessary.
3. Checking multiple computers takes extra time.

## Task 2: Create Your First Administrative Function

**Purpose:**

The function makes checking disk space easier by allowing administrators to reuse the same command.

**Commands used:**

- `function` creates the function.
- `Get-CimInstance` retrieves disk information.
- `Win32_LogicalDisk` identifies logical drives.
- `Select-Object` selects the information to display.

**Expected output:**

The computer name, drive letter, disk size, and free space.

## Task 3: Add Parameters

**Parameter name:**

ComputerName

**Why parameters improve reusability:**

Parameters allow administrators to check different computers without changing the script.

**Results of testing:**

I tested the function using my Azure VM's computer name and localhost. Both returned disk information successfully.

## Task 4: Add Comment-Based Help

**Purpose:**

The help section explains what the function does, describes its parameter, and provides an example. This helps other administrators understand how to use the script.

I verified the help using `Get-Help Get-DiskReport -Full`.

## Task 5: Create an Administrative Report

**Purpose:**

I used Select-Object to display only the information needed for the disk report.

The report displays:

- Computer Name
- Drive Letter
- Size
- Free Space

This makes the results easier to read and understand.