FROM alpine:latest

# Install lftp
RUN apk add --no-cache lftp

# Create a directory called "clientdata"
RUN mkdir /clientdata
WORKDIR /clientdata

# creating a variable to store server ipaddress
ENV SERVER_IP_ADDRESS=""

#creating a variable to store server port
ENV SERVER_PORT=""

# lftp will help to download the files in the server 
# verify checksum of the file
# tail -f '/dev/null' will run the container until it is stopped manually
CMD sh -c "lftp -c 'mirror --parallel=2 http://${SERVER_IP_ADDRESS}:${SERVER_PORT}/' && md5sum -c 'checksumCheck.md5' && tail -f '/dev/null'"
