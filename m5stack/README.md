# M5Stack official micropython

## Build and Flash
* `docker build -t m5stack-upython /home/mark/dev/espressif/m5stack/ -f m5stack-upython.dockerfile`
* Run the container and flash the device

    ```
    docker run -it --rm --name m5stack --privileged -v /dev:/dev m5stack-upython:latest
    ./BUILD.sh flash
    ./BUILD.sh monitor
    ```

import machine, display, time, math

tft = display.TFT()

#ESP32-WROVER-KIT v3:
#tft.init(tft.ST7789, rst_pin=18, 


#Adafruit:
#tft.init(tft.ILI9341, width=240, height=320, miso=19,mosi=18,clk=5,cs=15,dc=33, bgr=True)

#Set correct configuration
tft.init(tft.ILI9341, width=240, height=320, miso=19,mosi=23,clk=18,cs=5,dc=26,tcs=27,hastouch=True, bgr=True)

maxx = 240
maxy = 320
miny = 12
touch = False

import display
tft=display.TFT()
tft.init(tft.M5STACK, width=135, height=240, mosi=15, miso=4, clk=19, cs=5, dc=23, rst_pin=18)

# M5Stack:
tft.init(tft.M5STACK, width=240, height=320, rst_pin=33, backl_pin=32, miso=19, mosi=23, clk=18, cs=14, dc=27, bgr=True, backl_on=1)

import display
tft=display.TFT()
tft.init(tft.M5STACK, width=135, height=240, mosi=15, miso=4, clk=13, cs=5, dc=23, rst_pin=18)
