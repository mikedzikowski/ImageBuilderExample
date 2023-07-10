Invoke-WebRequest 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.2.1/npp.8.2.1.Installer.exe' -OutFile "$env:windir\temp\npp.8.2.1.Installer.exe"
Start-Process "$env:windir\temp\npp.8.2.1.Installer.exe" /S -NoNewWindow -Wait -PassThru




