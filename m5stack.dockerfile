FROM esp-idf-upython:latest

WORKDIR /app
RUN git clone https://github.com/m5stack/M5StickC-IDF m5stick 

WORKDIR /app/m5stick

ENTRYPOINT ["/bin/bash"]

# Run the docker image and then
# make menuconfig
# make flash 
# or 
# make flash monitor