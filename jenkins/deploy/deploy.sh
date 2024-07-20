#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth


scp -i /opt/March1.pem /tmp/.auth ubuntu@172.31.94.218:/tmp/.auth
scp -i /opt/March1.pem ./jenkins/deploy/publish.sh ubuntu@172.31.94.218:/tmp/publish
ssh -i /opt/March1.pem ubuntu@172.31.94.218 "/tmp/publish"
