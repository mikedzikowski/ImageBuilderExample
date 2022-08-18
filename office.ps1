$ErrorActionPreference = 'STOP'

try {

    $TempPath = 'c:\temp'
    If (!(Test-Path $TempPath))
    {
        new-Item -ItemType Directory -Path c:\temp
    }
    Invoke-WebRequest -Uri 'https://aibcustomizationssa.blob.core.usgovcloudapi.net/newcontainer/configuration-Office365-x64.xml' -OutFile 'OfficeConfig.xml'
    Invoke-WebRequest -Uri 'https://aibcustomizationssa.blob.core.usgovcloudapi.net/newcontainer/setup.zip' -OutFile "Office365.zip"
    Expand-Archive -LiteralPath '.\Office365.zip' -Force
    Start-Process -FilePath '.\Office365\setup.exe' -ArgumentList "/configure .\Office365\OfficeConfig.xml" -Wait -PassThru
    write-host 'AIB Customization: Finished Install Office365+Project 2019+Visio2019'
}
catch {
    Write-Host $_
    Throw
}
