#!/bin/bash

set -xe

main() {
  CURRENT=`mvn -U org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version|grep -Ev "(^\[|Download\w+:)"`
  echo "current version: ${CURRENT}"
  mvn archetype:generate \
     -DarchetypeArtifactId=operator-mvn-archetype \
     -DarchetypeGroupId=io.radanalytics \
     -DarchetypeVersion=${CURRENT} \
     -DinteractiveMode=false
  cd x-operator/
  mvn install
}

main
