#!/bin/bash

# built the image 
# Dockerfile is inside /server directory
docker build . -t application/server -f server/Dockerfile

#create a user-defined network
docker network create applicationserver

#create a volume
docker volume create servervol

#run application server
docker run -p 8000:8000 --name server --network applicationserver -v servervol:/serverdata application/server

