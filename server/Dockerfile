FROM python:3.9-alpine

EXPOSE 8000

# Create a directory called "serverdata"
RUN mkdir /serverdata
WORKDIR /serverdata

# Create a 1 KB file with "Hello world!" text
RUN echo "Hello world!" | dd of=./file.txt bs=1024 count=1

# creating checksumCheck file with md5sum which hold checksum of the file.txt  
RUN md5sum file.txt > checksumCheck.md5

# run python http.server with port 8000
CMD ["python", "-m", "http.server", "8000"]
