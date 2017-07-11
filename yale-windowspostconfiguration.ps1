# yale-windowspostconfiguration.ps1

Param(
    [Parameter (mandatory=$true)][String]$vmOwnerNetid
)

# Add VM owner to local Administrators group
$member = "yale\$vmOwnerNetid"
Add-LocalGroupMember -Group Administrators -Member $member

# Send email to indicate that we're done.
send-mailmessage -To "ken.hoover@yale.edu" -From "azurebuilds@yale.edu" -smtpserver mail.yale.edu -Subject "Build succeeded for $env:computername" -Body "Build of $env:computername for $member complete"


