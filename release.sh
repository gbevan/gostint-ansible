#!/bin/bash -e
# release to docker hub
PROJ="goethite/gostint-ansible"
VER=$(cat Dockerfile | grep "^FROM" | awk -F: '{print $2;}')

echo "Logging in to dockerhub"
docker login || exit 2

echo "Building $PROJ:$VER image"
docker build -t $PROJ:$VER . || exit 2

echo "Pushing $PROJ:$VER to dockerhub"
docker push $PROJ:$VER || exit 2
