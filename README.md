# ESP32-S3 ST7735 Blank Hardware Profile

This repository is a blank hardware baseline for building new ESP-IDF software for this specific ESP32-S3 board.

It intentionally does not describe any currently flashed application or app-level firmware feature.

Use this repo when starting a fresh firmware project and you only need the required hardware/build facts.

## Core Facts

- Target chip: ESP32-S3
- Observed package/revision: QFN56 rev v0.2
- USB mode: USB-Serial/JTAG
- Observed PSRAM: 8MB
- Flash size used for flashing: 16MB
- Known Windows serial port: `COM4`
- Known ESP-IDF root on this machine: `C:\Users\Administrator\esp-idf`
- Recommended Windows workspace root: `C:\espbuild`
- Avoid long or non-ASCII source paths for ESP-IDF builds on Windows.

## Required Board Settings

If using the Xiaozhi ESP-IDF codebase board options, keep:

```text
CONFIG_BOARD_TYPE_BREAD_COMPACT_WIFI_LCD=y
CONFIG_LCD_ST7735_128X160=y
CONFIG_PARTITION_TABLE_CUSTOM=y
CONFIG_PARTITION_TABLE_CUSTOM_FILENAME="partitions.csv"
```

For a completely new ESP-IDF app, use the pin map and LCD settings below.

## Critical Warning

Do not use `GPIO40` as a button or general input.

`GPIO40` is the LCD DC pin. Reusing it will break the display.

## Controls Available

- BOOT button: `GPIO0`
- Secondary / right-side lower button: `GPIO39`

No other reliable button is recorded for this hardware profile.

## Files

- [AI_CONTEXT.md](AI_CONTEXT.md): shortest briefing for future AI sessions.
- [HARDWARE_BASELINE.md](HARDWARE_BASELINE.md): human-readable hardware facts.
- [blank-board-profile.json](blank-board-profile.json): machine-readable profile.
- [config/partitions.baseline.csv](config/partitions.baseline.csv): known partition layout.
- [config/sdkconfig.baseline.defaults](config/sdkconfig.baseline.defaults): baseline Kconfig selections.
- [scripts/build-project.ps1](scripts/build-project.ps1): generic build wrapper.
- [scripts/flash-app.ps1](scripts/flash-app.ps1): generic app-only flash wrapper.

## Generic Build

```powershell
.\scripts\build-project.ps1 -ProjectDir 'C:\espbuild\your-new-firmware'
```

## Generic App-Only Flash

```powershell
.\scripts\flash-app.ps1 -ProjectDir 'C:\espbuild\your-new-firmware' -AppBin 'build\your-app.bin'
```

Default flash offset is `0x100000`, matching the baseline partition layout.
