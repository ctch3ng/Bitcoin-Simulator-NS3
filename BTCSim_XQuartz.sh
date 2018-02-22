#!/bin/sh
 
echo "Image: btc_simulator"
echo "Alias: BTCSim"

# run xhost and allow connections from your local machine:

ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip

docker run -it --name BTCSim -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix btc_simulator

xhost - $ip
docker rm /BTCSim
