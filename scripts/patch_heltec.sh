#!/usr/bin/env bash

set -e

sed -i 's/tools.esptool_py.path={runtime.tools.esptool_py.path}/tools.esptool_py.path={runtime.platform.path}\/tools/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/platform.txt
sed -i 's/WIFI_LoRa_32_V3.upload.maximum_size=1310720/WIFI_LoRa_32_V3.upload.maximum_size=3342336/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/boards.txt
sed -i 's/uint8_t data\[\] . . 0x00\, x0 . _x_start\, 0x00\, x1 . _x_start .\;/uint8_t data[] = { 0x00, uint8_t(x0 + _x_start), 0x00, uint8_t(x1 + _x_start) };/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7735.cpp
sed -i 's/uint8_t data\[\] . . color .. 8\, color . 0xFF ./uint8_t data[] = { uint8_t(color >> 8), uint8_t(color \& 0xFF) }/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7735.cpp
sed -i 's/uint8_t data\[\] = { bgcolor >> 8, bgcolor & 0xFF }/uint8_t data[] = { uint8_t(bgcolor >> 8), uint8_t(bgcolor \& 0xFF) }/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7735.cpp
sed -i '/#include <string.h>/a #include <Arduino.h>' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx126x.c
sed -i '/#include "..\/driver\/sx126x-board.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx126x.c
sed -i '/#include "..\/driver\/sx126x-board.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx126x.c
sed -i '/extern  void lora_printf(const char \*format, ...);/a extern uint8_t SpiInOut(Spi_t *obj, uint8_t outData );' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1276.c
sed -i '/extern  void lora_printf(const char \*format, ...);/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1276.c
sed -i '/extern  void lora_printf(const char \*format, ...);/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1276.c
sed -i '/#include <string.h>/a #include <Arduino.h>' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/radio/radio.c
sed -i 's/int8_t currentDrForNoAdr\;/int8_t currentDrForNoAdr = 0\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/uint8_t appData\[LORAWAN_APP_DATA_MAX_SIZE\]\;/uint8_t appData[LORAWAN_APP_DATA_MAX_SIZE] = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/uint32_t txDutyCycleTime \;/uint32_t txDutyCycleTime = 0\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/TimerEvent_t TxNextPacketTimer\;/TimerEvent_t TxNextPacketTimer = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/McpsReq_t mcpsReq\;/McpsReq_t mcpsReq = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/LoRaMacTxInfo_t txInfo\;/LoRaMacTxInfo_t txInfo = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/MibRequestConfirm_t mibReq\;/MibRequestConfirm_t mibReq = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/LoRaMacStatus_t status\;/LoRaMacStatus_t status = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/MlmeReq_t mlmeReq\;/MlmeReq_t mlmeReq = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/LoRaMacPrimitives_t LoRaMacPrimitive\;/LoRaMacPrimitives_t LoRaMacPrimitive = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/LoRaMacCallback_t LoRaMacCallback\;/LoRaMacCallback_t LoRaMacCallback = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/uint32_t uniqueId\[2\]\;/uint32_t uniqueId[2] = {}\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i 's/printDevParam()\;/\/\/printDevParam()\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/LoRaWan_APP.cpp
sed -i '/#include "Arduino.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/board.c
sed -i '/#include "Arduino.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/board.c
sed -i '/#include "Arduino.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/delay.c
sed -i '/#include "Arduino.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/delay.c
sed -i '/#include "..\/driver\/gpio-board.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/gpio-board.c
sed -i '/#include "..\/driver\/gpio-board.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/gpio-board.c
sed -i '/#include "..\/driver\/gpio-board.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/gpio.c
sed -i '/#include "..\/driver\/gpio-board.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/gpio.c
sed -i '/#include "..\/driver\/board-config.h"/a #include "debug.h"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1262-board.c
sed -i '/#include "..\/driver\/board-config.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1262-board.c
sed -i '/#include "..\/driver\/board-config.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1262-board.c
sed -i '/#include <Arduino.h>/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1276-board.c
sed -i '/#include <Arduino.h>/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/sx1276-board.c
sed -i 's/TimerSysTime_t c = { 0 }\;/TimerSysTime_t c = { 0, 0 }\;/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/driver/timer.h
sed -i '/#include "esp_sleep.h"/a #pragma GCC diagnostic ignored "-Wunused-variable"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/loramac/LoRaMac.c
sed -i '/#include "esp_sleep.h"/a #pragma GCC diagnostic ignored "-Wunused-function"' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/LoraWan102/src/loramac/LoRaMac.c
sed -i '/#include "soc\/soc_caps.h"/a #endif' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/WIFI_LoRa_32_V3/pins_arduino.h
sed -i '/#include "soc\/soc_caps.h"/a #undef WIFI_LoRa_32_V3' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/WIFI_LoRa_32_V3/pins_arduino.h
sed -i '/#include "soc\/soc_caps.h"/a #ifdef WIFI_LoRa_32_V3' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/WIFI_LoRa_32_V3/pins_arduino.h
sed -i '/#include <stdint.h>/a #endif' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/wifi_lora_32_V2/pins_arduino.h
sed -i '/#include <stdint.h>/a #undef WIFI_LoRa_32_V2' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/wifi_lora_32_V2/pins_arduino.h
sed -i '/#include <stdint.h>/a #ifdef WIFI_LoRa_32_V2' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/variants/wifi_lora_32_V2/pins_arduino.h
sed -i 's/uint8_t data\[\] = . color >> 8\, color . 0xFF ./uint8_t data[] = { uint8_t(color >> 8), uint8_t(color \& 0xFF) }/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7736.cpp
sed -i 's/uint8_t data\[\] = . bgcolor >> 8\, bgcolor . 0xFF ./uint8_t data[] = { uint8_t(bgcolor >> 8), uint8_t(bgcolor \& 0xFF) }/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7736.cpp
sed -i 's/uint8_t data\[\] . . 0x00\, x0 . _x_start\, 0x00\, x1 . _x_start .\;/uint8_t data[] = { 0x00, uint8_t(x0 + _x_start), 0x00, uint8_t(x1 + _x_start) };/g' .arduino15/packages/Heltec-esp32/hardware/esp32/0.0.9/libraries/DISPLAY/src/HT_st7736.cpp

# EOF
