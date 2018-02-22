# Bitcoin-Simulator-NS3
Dockerfile (Ubuntu, NS3, and Bitcoin Simulator)

The aim of this repository is to prepare a docker image for running the Bitcoin Simulator from 
```
https://arthurgervais.github.io/Bitcoin-Simulator/index.html
```
The Dockerfile prepares a clean Ubuntu with all the prerequisites listed in
```
https://www.nsnam.org/wiki/Installation
```
The Dockerfile then performs the installation procedures listed in
```
https://arthurgervais.github.io/Bitcoin-Simulator/Installation.html
```

In a terminal (For both Ubuntu and OSX users):
```
sudo chmod u+x BTCSim_build.sh
./BTCSim_build.sh #build a docker image called btc_simulator
```

For Ubuntu users:
```
sudo chmod u+x BTCSim_X11.sh
./BTCSim_X11.sh # create a container BTCSim using the docker image btc_simulator
```

For OSX users:
Make sure XQuartz is installed and in XQuartz: Preferences -> Security -> (Check) Allow connections from network clients
```
sudo chmod u+x BTCSim_XQuartz.sh
./BTCSim_XQuartz.sh # create a container BTCSim using the docker image btc_simulator
```
