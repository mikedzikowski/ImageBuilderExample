$appName = 'office'
$drive = 'C:\'
Set-Location 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName
set-Location $LocalPath
$setupExeOutputPath = $LocalPath + '\' +'Office365.zip'
$xmlOutputPath = $LocalPath + '\'+ 'Office365\' + 'OfficeConfig.xml'
$officeExe = $LocalPath + '\'+ 'Office365\' + 'setup.exe'
Write-host 'AIB Customization: Start Install Office365+Project 2019+Visio2019'
Invoke-WebRequest -Uri 'https://<STORAGE ACCOUNT>.blob.core.usgovcloudapi.net/<CONTAINER>/setup.zip' -OutFile $setupExeOutputPath
Expand-Archive -LiteralPath $setupExeOutputPath -Force
$directory = Get-ChildItem
Write-Host "DIRECTORY: $($directory.DirectoryName[0])"
Write-Host "FILES: $($directory)"
Invoke-WebRequest -Uri 'https://<STORAGE ACCOUNT>.blob.core.usgovcloudapi.net/<CONTAINER>/<YOUR OFFICE XML>.xml' -OutFile $xmlOutputPath
Start-Process -FilePath $officeExe -Args "/configure $xmlOutputPath" -PassThru -NoNewWindow -Wait -Verbose
write-host 'AIB Customization: Finished Install Office365+Project 2019+Visio2019'

