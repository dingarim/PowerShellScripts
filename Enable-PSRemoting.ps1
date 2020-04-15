Enable-PSRemoting –force

# Set start mode to automatic
Set-Service WinRM -StartMode Automatic


# Trust all hosts
Set-Item WSMan:localhost\client\trustedhosts -value *

