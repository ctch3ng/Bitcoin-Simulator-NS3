#!/bin/sh
 
echo "Image: btc_simulator"
echo "Alias: BTCSim"

sudo docker run -it \
    --user=$(id -u) \
    --env="DISPLAY" \
    --workdir="/home/CS" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name BTCSim \
    btc_simulator

sudo docker rm /BTCSim
