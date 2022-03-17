docker run -it --rm --privileged  --device /dev/ttyACM0  mak3r/esptool:3.3-dev --port /dev/ttyACM0 --baud 9600  flash_id
