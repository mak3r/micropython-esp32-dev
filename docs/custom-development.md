# Custom Development

* M5Stack requires v3.2.3 of esp-idf
* `docker build -t esp-idf-upython /home/mark/dev/espressif/ -f ESP-IDF-V3.2.3.dockerfile`
* run the container just built
* `docker run -it --rm --privileged -v /dev:/dev esp-idf-upython:latest`

## Instructions to build and deploy CPython libs embedded on the device
From inside the docker container

* 
