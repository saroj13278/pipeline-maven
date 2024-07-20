#!/bin/bash
echo "******************************************"
echo "***********Testing***********************"
echo "******************************************"
WORKSPACE=/var/lib/jenkins/workspace/maven-app
docker run --rm -it -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app/ maven "$@"
