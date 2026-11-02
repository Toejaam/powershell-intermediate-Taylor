# LM2 Lab

## Task 1: Explore a CSV File

- **File name:** employees-1.csv
- **Number of records:** 75
- **Number of columns:** 4
- **Column names:** FirstName, LastName, Location, Department
- **Example record:** Sarah Rodriguez, Denver, HR

I used Import-Csv to load the employee spreadsheet into PowerShell. It imported 75 employee records as objects.

## Task 2: Investigate Object Properties

I used Get-Member to view the properties of the employee objects.

The four properties are:
- **FirstName:** Sarah
- **LastName:** Rodriguez
- **Location:** Denver
- **Department:** HR

Each employee is stored as a PSCustomObject. This makes it easier to access and work with individual pieces of employee information.