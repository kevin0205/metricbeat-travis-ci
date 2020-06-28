#!/bin/bash

echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin &> /dev/null
TAG="${TRAVIS_TAG:-latest}"
docker buildx build \
    --progress plain \
    --platform=$TARGET_ARCH \
    --build-arg VERSION=$TARGET_VERSION \
    -t $DOCKER_REPO:$TARGET_VERSION \
    -t $DOCKER_REPO \
    --push \
    .
