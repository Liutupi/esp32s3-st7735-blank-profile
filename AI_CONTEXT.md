# AI Context: Blank Hardware Baseline

This is not an application firmware repo. Do not infer that any previously flashed feature should be preserved.

This repo contains only the hardware/build baseline for starting fresh ESP-IDF software on the user's ESP32-S3 + ST7735 board.

## Must Preserve

- Chip: ESP32-S3
- LCD: ST7735 128x160
- Serial port on current Windows machine: `COM4`
- ESP-IDF root: `C:\Users\Administrator\esp-idf`
- Safe workspace root: `C:\espbuild`
- BOOT button: `GPIO0`
- Secondary button: `GPIO39`
- LCD DC: `GPIO40`

Never repurpose `GPIO40`; it is the LCD DC pin.

## Display Pins

```text
Backlight GPIO42
MOSI      GPIO47
CLK       GPIO21
DC        GPIO40
RST       GPIO45
CS        GPIO41
```

## LCD Parameters

```text
width=128
height=160
mirror_x=true
mirror_y=true
swap_xy=false
invert_color=false
rgb_order=RGB
offset_x=0
offset_y=0
spi_mode=0
```

## Build Environment

```powershell
$env:PYTHONUTF8='1'
& 'C:\Users\Administrator\esp-idf\export.ps1'
```

Use a short ASCII path under `C:\espbuild` for new ESP-IDF source trees.

## Flash

Known safe app partition offset:

```text
0x100000
```

Generic app-only flash shape:

```powershell
python -m esptool --chip esp32s3 -p COM4 -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 16MB --flash_freq 80m 0x100000 <app.bin>
```
