FROM debian:buster-slim
ENV IDF_PATH /micropython/ports/esp32/esp-idf

RUN apt update && \
apt upgrade -y && \
apt install -y make vim git git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

RUN git clone https://github.com/micropython/micropython

RUN cd micropython/ports/esp32 && \
git clone -b v4.4 --recursive https://github.com/espressif/esp-idf.git 

RUN cd $IDF_PATH && \
./install.sh all && \
. ./export.sh && \
cd /micropython && \
make -C mpy-cross && \
cd /micropython/ports/esp32 && \
make submodules && \
make && \
mkdir /app

WORKDIR /app

# The following ENV variables are set by running this command
# source /micropython/ports/esp32/esp-idf/export.sh
# and then run the `env` command in the shell to see what's required
# Be aware that rebuids of the container image without manually resetting
# these values after an idf update could fail.
ENV IDF_PYTHON_ENV_PATH=/root/.espressif/python_env/idf4.4_py3.7_env
ENV OPENOCD_SCRIPTS=/root/.espressif/tools/openocd-esp32/v0.11.0-esp32-20211220/openocd-esp32/share/openocd/scripts
ENV PATH=/micropython/ports/esp32/esp-idf/components/esptool_py/esptool:/micropython/ports/esp32/esp-idf/components/espcoredump:/micropython/ports/esp32/esp-idf/components/partition_table:/micropython/ports/esp32/esp-idf/components/app_update:/root/.espressif/tools/xtensa-esp32-elf/esp-2021r2-8.4.0/xtensa-esp32-elf/bin:/root/.espressif/tools/xtensa-esp32s2-elf/esp-2021r2-8.4.0/xtensa-esp32s2-elf/bin:/root/.espressif/tools/xtensa-esp32s3-elf/esp-2021r2-8.4.0/xtensa-esp32s3-elf/bin:/root/.espressif/tools/riscv32-esp-elf/esp-2021r2-8.4.0/riscv32-esp-elf/bin:/root/.espressif/tools/esp32ulp-elf/2.28.51-esp-20191205/esp32ulp-elf-binutils/bin:/root/.espressif/tools/esp32s2ulp-elf/2.28.51-esp-20191205/esp32s2ulp-elf-binutils/bin:/root/.espressif/tools/openocd-esp32/v0.11.0-esp32-20211220/openocd-esp32/bin:/root/.espressif/python_env/idf4.4_py3.7_env/bin:/micropython/ports/esp32/esp-idf/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV IDF_TOOLS_EXPORT_CMD=/micropython/ports/esp32/esp-idf/export.sh
ENV IDF_TOOLS_INSTALL_CMD=/micropython/ports/esp32/esp-idf/install.sh
ENV _=/usr/bin/env

ENTRYPOINT ["/bin/bash"]