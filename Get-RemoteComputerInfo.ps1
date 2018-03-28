

function Get-RemoteComputerInfo {

    <#
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
    
    #>
    
    Param(
        [parameter(Mandatory=$true)]
        [String]
        $RemoteComputer
        )
    
    #DataCollect
    $Procs = Get-Process -ComputerName $RemoteComputer
    $Disk = Get-WmiObject Win32_LogicalDisk -ComputerName $RemoteComputer | Where-Object{$_.DeviceID -like 'C:'}
    $ComputerInfo = Get-WMIObject -class Win32_ComputerSystem -ComputerName $RemoteComputer 
    $OSInfo = Get-WmiObject Win32_OperatingSystem -ComputerName $RemoteComputer
    $CPUInfo = Get-WmiObject Win32_Processor
    $PhysicalMemory = Get-WmiObject CIM_PhysicalMemory -ComputerName $RemoteComputer | Measure-Object -Property capacity -Sum | % {[math]::round(($_.sum / 1GB),2)} 
    
    #Math
    $OSTotalVirtualMemory = [math]::round($OSInfo.TotalVirtualMemorySize / 1MB, 2) 
    $OSTotalVisibleMemory = [math]::round(($OSInfo.TotalVisibleMemorySize  / 1MB), 2) 
    $Size = $([math]::Round(((($Disk.Size)/1024)/1024/1024)))
    $Freespace = $([math]::Round(((($Disk.FreeSpace)/1024)/1024/1024)))
    
    #Arrays
    $Object = @()
    
    
    
    #FormatOutput 
    
            $hash = @{
                    Computername    = $RemoteComputer
                    ProcessCount    = $Procs.Count
                    RunTime         = $(Get-date -Format "yyyy-MM-dd_hh:mm")
                    FreeDiskspace   = "$FreeSpace"          #+" GB"  
                    TotalDiskSize   = "$Size"               #+" GB"
                    DiskDrivename   = $Disk.DeviceID
                    ActiveUser      = $ComputerInfo.UserName
                    Manufacturer    = $ComputerInfo.Manufacturer
                    Model           = $ComputerInfo.Model
                    CPUName         = $CPUInfo.Name
                    CPUDescription  = $CPUInfo.DESCRIPTION
                    CPUCores        = $CPUInfo.NumberofCores
                    OSName          = $OSInfo.Caption
                    OSVersion       = $OSInfo.Version
                    TotalPhysicalMem= "$PhysicalMemory"     #+ " GB"
                    TotalVirtualMem = $OSTotalVirtualMemory
                    TotalVisibleMem = $OSTotalVisibleMemory
                    LastBootTime    = $OSInfo.LastBootUpTime
                    SerialNumber    = $OSInfo.SerialNumber
                    OSType          = $OSInfo.OSType
                    OSArchitecture  = $OSInfo.OSArchitecture
    
                    }        
                                        
                                                
                $Object += New-Object PSObject -Property $hash           
    
            
    #Result
    $Object 
    
    }
    #Help Get-RemoteComputerInfo
    #Help Get-RemoteComputerInfo -Examples
    Get-RemoteComputerInfo -RemoteComputer $env:COMPUTERNAME