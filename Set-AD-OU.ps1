<# 
This will accept a user name, check the domain to determine the OU it is in, then get the corresponding Computers OU to add the device to.
!#>

$ADUSER=Get-ADUser baxterjw | Select-Object -ExpandProperty DistinguishedName
$transformed = ($ADUSER -split ',' | Select -Skip 2) -Join ',' #splits on , then skips the first 2 values of the split, then rejoins the array with a ,
$combined = "OU=Computers,$transformed" #adds OU=Computers
Write-Output $combined #outputs to pipeline