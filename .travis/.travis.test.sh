#!/bin/bash

set -xe

main() {
  CURRENT=`cat pom.xml | grep "<version>" | sed 's/\s*<[^>]*>\s*//g'`
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
