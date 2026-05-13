param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectDir,

    [Parameter(Mandatory = $true)]
    [string]$AppBin,

    [string]$IdfRoot = "C:\Users\Administrator\esp-idf",
    [string]$Port = "COM4",
    [string]$Offset = "0x100000"
)

$ErrorActionPreference = "Stop"
$env:PYTHONUTF8 = "1"

Set-Location $ProjectDir
& "$IdfRoot\export.ps1" | Out-Null
python -m esptool --chip esp32s3 -p $Port -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 16MB --flash_freq 80m $Offset $AppBin
