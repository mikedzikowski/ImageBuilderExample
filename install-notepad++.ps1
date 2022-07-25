mkdir 'c:\temp'
Invoke-WebRequest 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.2.1/npp.8.2.1.Installer.exe' -OutFile c:\temp\npp.8.2.1.Installer.exe
Start-Process 'C:\temp\npp.8.2.1.Installer.exe' /S -NoNewWindow -Wait -PassThru




