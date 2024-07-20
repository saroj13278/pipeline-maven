#!/bin/bash
echo "******************************************"
echo "***********Building***********************"
echo "******************************************"

WORKSPACE=/var/lib/jenkins/workspace/maven-app

#docker run --rm -it -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app/ maven "$@"
docker run --rm -i -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app/ maven "$@"
