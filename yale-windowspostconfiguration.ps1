# yale-windowspostconfiguration.ps1

send-mailmessage -To "ken.hoover@yale.edu" -From "azurebuilds@yale.edu" -smtpserver mail.yale.edu -Subject "Build succeeded for $env:computername" -Body "Build of $env:computername complete"


