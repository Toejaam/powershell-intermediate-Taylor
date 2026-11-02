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

## Task 3: Use a foreach Loop

I used a foreach loop to go through each employee record and display their first and last name. The loop processed all 75 employees. This is useful because it allows PowerShell to process multiple employee records automatically instead of handling them one at a time.

## Task 4: Create an Employee Report

I used Select-Object to create a report with each employee's full name, department, and location. These fields are useful because administrators can quickly identify employees and see which department and location they belong to.

## Task 5: Export the Report to CSV

I used Export-Csv to save the employee report as employee-report.csv. The file was saved in my LM2 folder. This makes it easy to open the report in Excel and share the employee information.

