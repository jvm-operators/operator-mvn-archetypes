#!/bin/bash

set -xe

main() {
  CURRENT=`awk '/modelVersion/,/scm/' pom.xml | grep "<version>" | sed 's/\s*<[^>]*>\s*//g'`
  echo "current version: ${CURRENT}"
  mkdir dir-with-no-pom && cd dir-with-no-pom

  # finally generate the project
  mvn archetype:generate \
     -DarchetypeArtifactId=operator-mvn-archetype \
     -DarchetypeGroupId=io.radanalytics \
     -DarchetypeVersion=${CURRENT} \
     -DinteractiveMode=false
  cd x-operator/

  # try if it compiles
  mvn install
}

main
