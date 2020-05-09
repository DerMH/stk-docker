# SuperTuxKart Server Docker
Dockerized version of SuperTuxKart-Server

## Prerequisites
* Git has to be installed on your system.
* Docker has to be installed and working on your system.
* (For the use with docker-compose, also docker-compose has to be installed on your system.)

## Installation
1. On your Docker host, clone this repository:
```
git clone https://github.com/DerMH/stk-docker.git stk-docker
cd stk-docker/
```
2. Edit the Dockerfile and enter your SuperTuxKart account data.
3. Edit the server_config.xml and adjust parameters like password, game mode and server name.

From this point on there are two different options:

### 1. Build and run manually
For building the image enter:
`docker build --tag stk:1.0 . -f Dockerfile`
Building might take a while depending on your network connection and compile speed. Once the image is finished, you can run 
`docker run --publish 2757:2757 --publish 2759:2759 --detach stk:1.0`

### 2. Build and using docker-compose 
Using docker-compose is even easier. Just run `docker-compose up -d` in the cloned repository (containing the docker-compose.yml) and docker will start to build the image. Once building is finished, container will be started automatically. If image has already been build, container will start immediately.

## Use the server
Once the container is up and running, just start SuperTuxKart on your computer and search for servers online.

## Stop the server
Here are again two different options, depending on the way you started the server:
### 1. Server was started with docker-run
Execute `docker container ls` and search for the CONTAINER ID of your container. Then run `docker stop <CONTAINER ID>`. Container will be shut down and server stopped.

### 2. Server was started with docker-compose
Do a `cd stk-docker` to the cloned repository folder which includes the docker-compose.yml. Then simply run `docker-compose down`. Container will be shut down and server stopped.

## Future planning
I got the following ideas to implement somewhen in the future:
* Implement config location as a volume to make the configuration changeable from the host system.
* Check for possible optimization of image size.
* If you have any feedback or optimization suggestions, please let me know.
* ...
