# Bitcoin-Simulator-NS3
Dockerfile (Ubuntu, NS3, and Bitcoin Simulator)

The aim of this repository is to prepare a docker image for running the Bitcoin Simulator from 

[https://arthurgervais.github.io/Bitcoin-Simulator/index.html](https://arthurgervais.github.io/Bitcoin-Simulator/index.html)

The Dockerfile prepares a clean Ubuntu with all the prerequisites listed in

[https://www.nsnam.org/wiki/Installation](https://www.nsnam.org/wiki/Installation)

The Dockerfile then performs the installation procedures listed in

[https://arthurgervais.github.io/Bitcoin-Simulator/Installation.html](https://arthurgervais.github.io/Bitcoin-Simulator/Installation.html)

In a terminal (For both Ubuntu and OSX users):
```
sudo chmod u+x BTCSim_build.sh
./BTCSim_build.sh #build a docker image called btc_simulator
```
Then,
```
sudo chmod u+x BTCSim_run.sh
./BTCSim_run.sh # create a container BTCSim using the docker image btc_simulator
```
