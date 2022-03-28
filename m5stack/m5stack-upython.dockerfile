FROM debian:buster-slim
RUN apt update && \
apt upgrade -y && \
apt install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future python-pyparsing curl vim
#apt install -y make vim git git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 libncurses5-dev libncursesw5-dev

RUN git clone https://github.com/m5stack/M5Stack_MicroPython
WORKDIR /M5Stack_MicroPython/MicroPython_BUILD/
COPY sdkconfig .
COPY tftspi.h components/micropython/esp32/libs/tft/tftspi.h
RUN ./BUILD.sh

ENTRYPOINT ["/bin/bash"]

