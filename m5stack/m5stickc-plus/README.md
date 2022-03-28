import machine
import random

import st7789
import colors

spi = machine.SPI(1, baudrate=20_000_000, polarity=1,sck=machine.Pin(13, machine.Pin.OUT), miso=machine.Pin(4, machine.Pin.IN), mosi=machine.Pin(15, machine.Pin.OUT))

tft = st7789.ST7789(spi, 135, 240, reset=machine.Pin(18, machine.Pin.OUT), dc=machine.Pin(23, machine.Pin.OUT), cs=machine.Pin(5, machine.Pin.OUT), buf=bytearray(2048))

c = colors.rgb565(random.getrandbits(8), random.getrandbits(8), random.getrandbits(8))

tft.fill(c)
tft.text("Hello World", 10, 30, colors.WHITE, c)