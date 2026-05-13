# Hardware Baseline

## Device

| Item | Value |
| --- | --- |
| Chip | ESP32-S3 |
| Observed revision | QFN56 rev v0.2 |
| USB mode | USB-Serial/JTAG |
| PSRAM | 8MB observed |
| Flash size | 16MB used by flash command |
| Windows serial port | `COM4` |

## Buttons

| Role | GPIO | Notes |
| --- | --- | --- |
| BOOT | `GPIO0` | Main onboard button |
| Secondary button | `GPIO39` | Right-side lower / volume-down key |
| Volume up | `GPIO_NUM_NC` | Not connected in recorded setup |
| Touch | `GPIO_NUM_NC` | Not connected in recorded setup |

Only assume two physical controls: `GPIO0` and `GPIO39`.

## Display

| Signal | GPIO |
| --- | --- |
| Backlight | `GPIO42` |
| MOSI | `GPIO47` |
| CLK | `GPIO21` |
| DC | `GPIO40` |
| RST | `GPIO45` |
| CS | `GPIO41` |

Critical: `GPIO40` is LCD DC. Do not use it as a button.

## LCD Parameters

| Parameter | Value |
| --- | --- |
| Controller/config | ST7735 128x160 |
| Width | 128 |
| Height | 160 |
| Mirror X | true |
| Mirror Y | true |
| Swap XY | false |
| Invert color | false |
| RGB order | RGB |
| X offset | 0 |
| Y offset | 0 |
| SPI mode | 0 |

In the known Xiaozhi board config this is selected by:

```text
CONFIG_LCD_ST7735_128X160=y
```

## Audio Pins

The recorded config enables simplex audio:

```c
#define AUDIO_I2S_METHOD_SIMPLEX
```

| Role | GPIO |
| --- | --- |
| Mic WS | `GPIO4` |
| Mic SCK | `GPIO5` |
| Mic DIN | `GPIO6` |
| Speaker DOUT | `GPIO7` |
| Speaker BCLK | `GPIO15` |
| Speaker LRCK | `GPIO16` |

## LED

| Role | GPIO |
| --- | --- |
| Built-in LED | `GPIO48` |

## Partition Baseline

Known partition table:

| Name | Type | SubType | Offset | Size |
| --- | --- | --- | --- | --- |
| `nvs` | data | nvs | `0x9000` | `0x4000` |
| `otadata` | data | ota | `0xd000` | `0x2000` |
| `phy_init` | data | phy | `0xf000` | `0x1000` |
| `model` | data | spiffs | `0x10000` | `0xF0000` |
| `ota_0` | app | ota_0 | `0x100000` | `6M` |
| `ota_1` | app | ota_1 | `0x700000` | `6M` |

The default app-only flash offset for this partition layout is `0x100000`.
