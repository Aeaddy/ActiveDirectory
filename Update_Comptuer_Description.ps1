
# Udpate Computer Description - PowerShell Script
Import-module ActiveDirectory  
Import-CSV "C:\Scripts\Computers.csv" | % { 
$Computer = $_.ComputerName 
$Desc = $_.Description 
Set-ADComputer $Computer -Description $Desc 
}