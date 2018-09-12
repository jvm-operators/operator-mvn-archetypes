#!/bin/bash

set -xe

main() {
  CURRENT=`awk '/modelVersion/,/scm/' pom.xml | grep "<version>" | sed 's/\s*<[^>]*>\s*//g'`
  echo "current version: ${CURRENT}"
  mkdir dir-with-no-pom1 && cd dir-with-no-pom1

  # finally generate the project
  mvn archetype:generate \
     -DarchetypeArtifactId=operator-mvn-archetype \
     -DarchetypeGroupId=io.radanalytics \
     -DarchetypeVersion=${CURRENT} \
     -DinteractiveMode=false
  cd x-operator/

  # try if it compiles
  make build

  echo -e "\e[92m\n\n\n\n----------------\n    SUCCESS\n----------------\n\n\n\n\e[0m"
  cd ../..
  mkdir dir-with-no-pom2 && cd dir-with-no-pom2
  mvn archetype:generate \
     -DarchetypeArtifactId=operator-scala-mvn-archetype \
     -DarchetypeGroupId=io.radanalytics \
     -DarchetypeVersion=${CURRENT} \
     -DinteractiveMode=false

  cd x-operator/

  make build

  echo -e "\e[92m\n\n\n\n----------------\n    SUCCESS\n----------------\n\n\n\n\e[0m"
}

main
