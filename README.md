# micropython-esp32-dev
These instructions are used to setup an M5StickC Plus device with pure micropython so one does not have to use prototyping environment blockly/uiflow. 

## Build the container
* As of writing this
    * the latest idf version is v4.4
    * M5Stack IDF requires v3.2.3
* `docker build -t esp32-upython /home/mark/dev/espressif/ -f micropython.dockerfile`

## Run the container
`docker run -it --rm --name micropython --privileged -v /dev:/dev esp32-upython:latest `

## The following commands are done inside the container 
There is of course a way to configure the container to operate like one of the tools nested inside. There is also a way to make the container smaller overall. These could be done later if needed. 

### Export the serial port it is connected to
`export DEVICE=/dev/ttyUSB0`

### CD into the esp32 directory
`cd /micropython/ports/esp32`

### Erase the flash
I had to do this the first time I wiped out the UIFlow bin that was previously installed.

`/root/.espressif/python_env/idf4.4_py3.7_env/bin/python esp-idf/components/esptool_py/esptool/esptool.py -p ${DEVICE} erase_flash`

### Write micropython to the device
`/root/.espressif/python_env/idf4.4_py3.7_env/bin/python esp-idf/components/esptool_py/esptool/esptool.py -p ${DEVICE} -b 115200 --before default_reset --after hard_reset --chip esp32  write_flash --flash_mode dio --flash_size detect --flash_freq 40m 0x1000 build-GENERIC/bootloader/bootloader.bin 0x8000 build-GENERIC/partition_table/partition-table.bin 0x10000 build-GENERIC/micropython.bin`

## Work

* Now you can access python on the device via serial port which gives the repl.
* Also have a look a the [espressif getting started guide](https://docs.espressif.com/projects/esp-idf/en/v4.2/esp32/get-started/index.html#get-started-configure) 