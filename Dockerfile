FROM maven:3.5-jdk-8-alpine

COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM store/oracle/serverjre:8

COPY --from=0 /usr/src/myapp/target/helloworld-1.0-SNAPSHOT.jar /usr/lib/helloworld.jar

CMD java -jar /usr/lib/helloworld.jar

