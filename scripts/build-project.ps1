param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectDir,

    [string]$IdfRoot = "C:\Users\Administrator\esp-idf",
    [string]$BuildDir = "build"
)

$ErrorActionPreference = "Stop"
$env:PYTHONUTF8 = "1"

Set-Location $ProjectDir
& "$IdfRoot\export.ps1"
idf.py -B $BuildDir build
