<#
.SYNOPSIS
Gets disk information from a computer.

.DESCRIPTION
Shows the computer name, drive letter, disk size, and free space.

.PARAMETER ComputerName
The name of the computer to check.

.EXAMPLE
Get-DiskReport -ComputerName PC01
#>

function Get-DiskReport {
    param (
        $ComputerName
    )

    Get-CimInstance Win32_LogicalDisk -ComputerName $ComputerName |
    Select-Object @{Name="Computer Name";Expression={$ComputerName}},
                  @{Name="Drive Letter";Expression={$_.DeviceID}},
                  Size,
                  FreeSpace
}