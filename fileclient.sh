#!/bin/bash

# built the image
docker build . -t application/client -f client/Dockerfile

# find ip address of server 
server_ipaddr=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' server)

#create a volume
docker volume create clientvol

# run client application container, receive the file and verrify checksum 
docker run -d -e SERVER_IP_ADDRESS=$server_ipaddr -e SERVER_PORT=8000 --name client --network applicationserver -v clientvol:/clientdata application/client:latest
