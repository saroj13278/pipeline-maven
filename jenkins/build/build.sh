#!/bin/sh


#copy the jar
cp -f java-app/target/*.jar jenkins/build/

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build
