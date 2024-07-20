#!/bin/bash
echo "******************************************"
echo "***********Building***********************"
echo "******************************************"

docker run --rm -it -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app/ maven "$@"
