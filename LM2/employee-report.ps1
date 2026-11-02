$Employees = Import-Csv "C:\Users\student\Downloads\employees-1.csv"

foreach ($Employee in $Employees) {
    "$($Employee.FirstName) $($Employee.LastName)"
}

$Report = $Employees | Select-Object @{Name="EmployeeName";Expression={"$($_.FirstName) $($_.LastName)"}}, Department, Location

$Report

$Report | Export-Csv ".\employee-report.csv" -NoTypeInformation