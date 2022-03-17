FROM python:3.7

RUN apt update && apt -y upgrade && \
apt install -y git curl vim bash python3-serial

RUN git clone https://github.com/espressif/esptool.git

WORKDIR esptool

ENTRYPOINT ["/usr/bin/python3", "/esptool/esptool.py"]



