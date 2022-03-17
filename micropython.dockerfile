FROM debian:buster-slim
ENV IDF_PATH /micropython/ports/esp32/esp-idf

RUN apt update && \
apt upgrade -y && \
apt install -y make vim git git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

RUN git clone https://github.com/micropython/micropython

RUN cd micropython/ports/esp32 && \
git clone -b v4.4 --recursive https://github.com/espressif/esp-idf.git 

RUN cd /micropython/ports/esp32/esp-idf && \
./install.sh all && \
. ./export.sh && \
cd /micropython && \
make -C mpy-cross && \
cd /micropython/ports/esp32 && \
make submodules && \
make

ENTRYPOINT ["/bin/bash"]