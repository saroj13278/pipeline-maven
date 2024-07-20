#!/bin/sh


#copy the jar
WORKSPACE=/var/lib/jenkins/workspace/maven-app
ls -la $WORKSPACE/java-app/target/
cp -f /var/lib/jenkins/workspace/maven-app/java-app/target/*.jar jenkins/build/

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build
