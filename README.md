[![Build status](https://travis-ci.org/jvm-operators/operator-mvn-archetypes.svg?branch=master)](https://travis-ci.org/jvm-operators/operator-mvn-archetypes)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

Maven archetype that can speed up the development of other Java operators for Kubernetes and OpenShift.

## Usage

```bash
mvn archetype:generate \
    -DgroupId=io.acme \
    -DartifactId=my-new-operator \
    -DarchetypeArtifactId=operator-mvn-archetype \
    -DarchetypeGroupId=io.radanalytics \
    -DarchetypeVersion=0.0.1
```

By issuing the command above, you should be able to see new directory called `my-new-operator` with example operator, example Dockerfile, Makefile, etc.
