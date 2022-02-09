# Choose a base operating system
FROM ubuntu:18.04

# Update and install necessary packages
# one way to do
#RUN apt-get update
#RUN apt-get upgrade -y
#RUN apt-get install -y python3
# could need RUN pip3 install -y ...
# if hundreds of thing then usefull to combine things to avoid many layers and slow down
RUN  apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y python3

# from where we are building the container
COPY pi.py /code/pi.py
# it could also get cloned from github, or wget from web

RUN chmod +rx /code/pi.py

# Use environment variable to add executable to PATH
ENV PATH "/code:$PATH"

