#!/bin/bash
echo "******************************************"
echo "***********Building***********************"
echo "******************************************"

WORKSPACE=/var/lib/jenkins/workspace/maven-app

#docker run --rm -it -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app/ maven "$@"
docker run --rm -i -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven "$@"


# List the contents of the target directory for debugging
echo "Listing contents of /app/ directory:"
docker run --rm -i -v $WORKSPACE/java-app:/app -w /app/ maven ls -la /app/

echo "Listing contents of /app/target/ directory:"
docker run --rm -i -v $WORKSPACE/java-app:/app -w /app/ maven ls -la /app/target/
