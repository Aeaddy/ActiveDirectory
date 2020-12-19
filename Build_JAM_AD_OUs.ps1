$OUNAME1 = "JAMHQ"
New-ADOrganizationalUnit -Name $OUNAME1 -PassThru

$OUNAMES2 = "Dev", "Prod"
$OUPATH2 = "OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME2 in $OUNAMES2) {
New-ADOrganizationalUnit -Name $OUNAME2 -Path $OUPATH2 -PassThru
}

$OUNAMES3 = "AP", "EMEA", "NA"
$OUPATH3 = "OU=Prod,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME3 in $OUNAMES3) {
New-ADOrganizationalUnit -Name $OUNAME3 -Path $OUPATH3 -PassThru
}

$OUNAMES4 = "AP", "EMEA", "NA"
$OUPATH4 = "OU=Dev,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME4 in $OUNAMES4) {
New-ADOrganizationalUnit -Name $OUNAME4 -Path $OUPATH4 -PassThru
}

$OUNAMES = "Users", "Desktops", "Laptops", "Exclusions"

$OUPATH = "OU=NA,OU=Prod,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}

$OUPATH = "OU=EMEA,OU=Prod,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}
$OUPATH = "OU=AP,OU=Prod,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}
$OUPATH = "OU=NA,OU=Dev,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}
$OUPATH = "OU=EMEA,OU=Dev,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}


$OUPATH = "OU=AP,OU=Dev,OU=JAMHQ,DC=jam,DC=on"
Foreach ($OUNAME in $OUNAMES) {
New-ADOrganizationalUnit -Name $OUNAME -Path $OUPATH -PassThru
}

New-ADGroup -Name CMAdmins -Path "OU=JAMHQ,DC=jam,DC=on" -GroupScope Global -PassThru
New-ADGroup -Name CMServers -Path "OU=JAMHQ,DC=jam,DC=on" -GroupScope Global -PassThru
Add-ADGroupMember "CMadmins" "CMservers"
New-ADUser ` -Name "CMAdmin" ` -Path  "OU=JAMHQ,DC=jam,DC=on" ` -SamAccountName  "CMAdmin" ` -DisplayName "CM Admin" ` -UserPrincipalName "CMadmin@jam.on" ` -AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) ` -PasswordNeverExpires $true ` -CannotChangePassword $true ` -Enabled $trueAdd-ADGroupMember "CMAdmins" "CMadmin";