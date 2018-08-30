FROM jkremser/mini-jre:8.1

ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

LABEL BASE_IMAGE="jkremser/mini-jre:8"

ADD target/${artifactId}-*.jar /${artifactId}.jar

CMD ["/usr/bin/java", "-jar", "/${artifactId}.jar"]
