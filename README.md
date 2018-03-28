# Get-RemoteComputerInfo
Get Information about a computer

.SYNOPSIS
    Get Computer Information
    
    .DESCRIPTION
    Get Computer information for remote computers
    
    .PARAMETER RemoteComputer
    RemoteComputer
    
    .EXAMPLE
    
    Get-RemoteComputerInfo -RemoteComputer $env:COMPUTERNAME
    
    Get-RemoteComputerInfo -RemoteComputer 'Computername'
    
    run against several computers
    $Data = import-csv c:\temp\servers.csv 
    foreach($D in $Data){Get-RemoteComputerInfo -RemoteComputer $D.name}
    
    .NOTES
    General notes
    Disclaimer, run this at your own risk, supported AS-IS

    # Project Title

One Paragraph of project description goes here

## Getting Started

These instructions will help you getting started. 

### Prerequisites

What things you need to install the software and how to install them

```
Powershell
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Download the ps1 file
```

```
locate the script in powershell
```

```
dot source the function
```


PS C:\Users>cd "User\OneDrive\PowerShell\Inventory"

PS C:\Users\User\OneDrive\PowerShell\Inventory>. .\Get-RemoteComputerInfo.ps1

PS C:\Users\User\OneDrive\PowerShell\Inventory>Get-RemoteComputerInfo -RemoteComputer $env:COMPUTERNAME

OSArchitecture   : 64-bit
Manufacturer     : Parallels Software International Inc.
ActiveUser       : Computer\User
CPUCores         : 2
CPUName          : Intel(R) Core(TM) i5-7267U CPU @ 3.10GHz
FreeDiskspace    : 233
CPUDescription   : Intel64 Family 6 Model 142 Stepping 9
TotalVirtualMem  : 5.35
TotalPhysicalMem : 4
DiskDrivename    : C:
OSType           : 18
RunTime          : 2018-03-28_09:51
TotalVisibleMem  : 3.98
ProcessCount     : 148
OSVersion        : 10.0.16299
Computername     : Computer
SerialNumber     : 00330-80118-66768-AA713
OSName           : Microsoft Windows 10 Pro
TotalDiskSize    : 255
Model            : Parallels Virtual Platform
LastBootTime     : 20180325053800.585193+120

## Running the tests

Explain how to run the automated tests for this system

## Built With

* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/powershell-scripting?view=powershell-6) - Powershell is king


## Versioning

We use 

## Authors

* Eastrom


## License

This project is not licensed

## Acknowledgments

* Microsoft

