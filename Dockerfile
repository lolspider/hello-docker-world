FROM openjdk:8-jdk-alpine
COPY build/libs/hello-docker-world-0.7.0.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
