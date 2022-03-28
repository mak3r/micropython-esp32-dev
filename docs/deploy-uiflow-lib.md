# Prepare Micropython with UIFlow libs

* `docker build -t uiflow /home/mark/dev/espressif/ -f uiflow.dockerfile`
* Make sure there is an M5Stack device connected to the serial port
* `docker run -it --rm --name uiflow --privileged -v /dev:/dev uiflow:latest`
* `export DEVICE=/dev/ttyUSB0`
* `/root/.espressif/python_env/idf4.4_py3.7_env/bin/python esp-idf/components/esptool_py/esptool/esptool.py -p ${DEVICE} -b 115200 --before default_reset --after hard_reset --chip esp32  write_flash --flash_mode dio --flash_size detect --flash_freq 40m 0x1000 build-GENERIC/bootloader/bootloader.bin 0x8000 build-GENERIC/partition_table/partition-table.bin 0x10000 build-GENERIC/micropython.bin`