import machine
from secrets import secrets

print("SSID: {}".format(secrets['SSID']))

pin10 = machine.Pin(10, machine.Pin.OUT)
p39 = machine.Pin(39, mode = machine.Pin.IN, pull = machine.Pin.PULL_UP)
# turn the LED OFF
#pin10.value(1)

p37 = machine.Pin(37, mode = machine.Pin.IN, pull = machine.Pin.PULL_UP)
p37.irq(trigger = machine.Pin.WAKE_LOW, wake = machine.DEEPSLEEP)

# Sleep 10 seconds or until p37 is triggered (Button A)
#machine.deepsleep(10000)

# Sleep until p37 is triggered (Button A)
machine.deepsleep()

