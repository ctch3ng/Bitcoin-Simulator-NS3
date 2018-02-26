#!/bin/sh
 
echo "Image: btc_simulator"
echo "Alias: BTCSim"

sudo docker run -it \
    --name BTCSim \
    btc_simulator

sudo docker rm /BTCSim
