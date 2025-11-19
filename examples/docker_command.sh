#!/bin/sh

echo "Attempting to use docker from /var/run/docker.sock..."
# TODO: change for a command that does require connection to socket
docker version
