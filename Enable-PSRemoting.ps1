Enable-PSRemoting –force

# Set start mode to automatic
Set-Service WinRM -StartMode Automatic

# Verify start mode and state - it should be running
#Get-WmiObject -Class win32_service | Where-Object {$_.name -like "WinRM"}

# Trust all hosts
Set-Item WSMan:localhost\client\trustedhosts -value *

# Verify trusted hosts configuration
Get-Item WSMan:\localhost\Client\TrustedHosts


#
# --------------- Powershell Script to hardening the Window Server
#Step1: use the below url for binaries
New-Item -Path 'C:\vinhtran' -ItemType Directory
Set-Location -Path C:\vinhtran
Invoke-WebRequest -Uri "https://orchstoragedata.blob.core.windows.net/release3/binaries/2019-Datacenter/Hardening%20Ciphers%20and%20Schannels%20-%20Templates%20(2017.05.09a).zip?sp=r&st=2020-04-07T15:17:26Z&se=2022-04-07T23:17:26Z&spr=https&sv=2019-02-02&sr=b&sig=%2BKEBcGx3mDlukuUr012YF2OzN5Hlo6SLNlbTAlMzSus%3D" -Output vinh.zip 
Start-Sleep -s 60
expand-archive vinh.zip
Start-Sleep -s 60
Set-Location -Path '.\vinh\Hardening Ciphers and Schannels - Templates (2017.05.09a)\'
#. Step 3: then run the below script
#. $installResult = Start-Process -FilePath ".\IISCryptoCli.exe" -ArgumentList "/template", ".\KPMG_W2019_Crypto_Template_Recommended_v1.0.ictpl" -NoNewWindow -PassThru -Wait
