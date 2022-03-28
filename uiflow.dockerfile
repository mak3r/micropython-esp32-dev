FROM esp32-micropython:latest

WORKDIR /micropython/ports/esp32/modules
RUN git clone https://github.com/m5stack/UIFlow-Code

# RUN cd $IDF_PATH && \
# ./install.sh all && \
# . ./export.sh && \
# cd /micropython && \
# make -C mpy-cross && \
# cd /micropython/ports/esp32 && \
# make submodules && \
# make

ENTRYPOINT ["/bin/bash"]