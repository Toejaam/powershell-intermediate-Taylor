<#
.SYNOPSIS
Gets disk space information from a computer.

.DESCRIPTION
Retrieves logical disk information from a local or remote
computer and displays the computer name, drive letter,
total disk size, and available free space.

.PARAMETER ComputerName
Specifies the name of the computer to retrieve disk information from.

.EXAMPLE
Get-DiskReport -ComputerName PC01

Gets disk information from the computer named PC01.
#>

function Get-DiskReport {
    param (
        $ComputerName
    )

    Get-CimInstance Win32_LogicalDisk -ComputerName $ComputerName |
    Select-Object PSComputerName, DeviceID, Size, FreeSpace
}

