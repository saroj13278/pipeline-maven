#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u saroj13278 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG saroj13278/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push saroj13278/$IMAGE:$BUILD_TAG
