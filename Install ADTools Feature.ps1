$SYSDR = $env:SystemDrive
$FILEPATH="$SYSDR\temp"

New-Item -ItemType Directory $FILEPATH

Configuration DeployADTools   
{ 
 
  param(
    [Parameter(Mandatory=$true)]
    [String[]]$Servers
  )
 
  Node $Servers
  { 
   



  WindowsFeature RSAT-AD-Tools
{
    Name = "RSAT-AD-Tools"
    Ensure = "Present"
    IncludeAllSubFeature = $true
}



}

} 


#Commands to execute:
DeployADTools -Servers localhost -OutputPath $FILEPATH

Start-DscConfiguration -Path $FILEPATH -wait -Verbose -Force -ErrorAction Stop  

Remove-Item $FILEPATH -Recurse

