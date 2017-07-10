# yale-windowspostconfiguration.ps1

# Install Telnet Client
# Install-WindowsFeature telnet-client

# Send email to indicate that we're done.
send-mailmessage -To "ken.hoover@yale.edu" -From "azurebuilds@yale.edu" -smtpserver mail.yale.edu -Subject "Build succeeded for $env:computername" -Body "Build of $env:computername complete"


