#!/bin/sh


#copy the jar
WORKSPACE=/var/lib/jenkins/workspace/maven-app
cp -f $WORKSPACE/java-app/target/*.jar jenkins/build/

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build
