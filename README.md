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