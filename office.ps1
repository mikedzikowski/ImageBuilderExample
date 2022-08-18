$ErrorActionPreference = 'STOP'

try {

    $TempPath = 'c:\temp'
    If (!(Test-Path $TempPath))
    {
        new-Item -ItemType Directory -Path c:\temp
    }
    Invoke-WebRequest -Uri 'https://<YOUR STORAGE ACCOUNT>.blob.core.usgovcloudapi.net/<YOUR CONTAINER>/setup.zip' -OutFile "Office365.zip"
    Expand-Archive -LiteralPath '.\Office365.zip' -Force
    Set-Location .\Office365
    Invoke-WebRequest -Uri 'https://<YOUR STORAGE ACCOUNT>.blob.core.usgovcloudapi.net/<YOUR CONTAINER>/<YOUR XML>.xml' -OutFile 'OfficeConfig.xml'
    Start-Process -FilePath '.\setup.exe' -ArgumentList "/configure .\OfficeConfig.xml" -WorkingDirectory ".\" -Wait
    write-host 'AIB Customization: Finished Install Office365+Project 2019+Visio2019'
}
catch {
    Write-Host $_
    Throw
}

