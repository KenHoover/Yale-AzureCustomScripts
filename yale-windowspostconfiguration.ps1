
# yale-windowspostconfiguration.ps1

Param(
    [Parameter (mandatory=$true)][String]$VMOwnerUsername
)

# Add VM owner to local Administrators group
net localgroup Administrators /add yale\$VMOwnerUsername

# Send email to indicate that we're done.
send-mailmessage -To "ken.hoover@yale.edu" -From "azurebuilds@yale.edu" -smtpserver mail.yale.edu -Subject "Build succeeded for $env:computername" -Body "Build of $env:computername complete"


