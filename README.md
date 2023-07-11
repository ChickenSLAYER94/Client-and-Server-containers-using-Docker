# Client-and-Server-containers-using-Docker
This project involves the creation of two Docker containers: one for the server and another for the client, allowing them to communicate with each other.

### Server-side Container

The server-side container runs a server application using an Alpine image. It performs the following steps:

1. Generates a file named `file.txt` and calculates its MD5 checksum.
2. Stores the file and its checksum in a persistent volume called `/serverdata`.
3. Transfers the file and checksum to the client using a Python-based HTTP server.
4. Creates a user-defined network called `applicationserver` to facilitate communication with the client within the same network.

### Client-side Container

The client-side container, also using an Alpine image, performs the following actions:

1. Identifies the IP address of the server and establishes a connection.
2. Receives and saves the `file.txt` and checksum files sent by the server in the persistent volume `/clientvol`.
3. Verifies the integrity of the received files by comparing the checksums.
   - If the checksums match, the files were successfully received from the server.
   - If the checksums do not match, there may have been an issue during transmission.

> Note: Ensure that the client container is on the same network as the server for proper communication.

## Getting Started

To run this project locally, follow these steps:

Step 1. Clone the repository.

Step 2. Run command in terminal: 
```bash
./fileserver.sh
```
After this wait for around 10 seconds for server to get ready.

Step 3. Run command in different terminal: 
```bash 
./fileclient.sh
```

Step 4. Run command to get into shell of the client container: 
```bash
docker exec -it client sh
```

Step 5. Verify the files' integrity by checking the checksum: 
```bash
md5sum -c 'checksumCheck.md5'
```

If output is : "file.txt:OK" that means file is received properly.

