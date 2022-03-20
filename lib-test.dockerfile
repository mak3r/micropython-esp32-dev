FROM esp32-micropython:latest

WORKDIR /app
COPY . /app

ENTRYPOINT ["/bin/bash"]