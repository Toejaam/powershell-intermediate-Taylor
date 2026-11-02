$Employees = Import-Csv "C:\Users\student\Downloads\employees-1.csv"

foreach ($Employee in $Employees) {
    "$($Employee.FirstName) $($Employee.LastName)"
}