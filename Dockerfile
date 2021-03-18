# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ADD target/addition-service.jar app.jar
# RUN sh -c 'touch /app.jar'
# EXPOSE 80
# ENV JAVA_OPTS=""
# ENTRYPOINT ["java", "-Dspring.profiles.active=docker", "-Djava.security.egd=file:/dev/./urandom", "-Dapp.port=${app.port}", "-jar","/app.jar"]
# LABEL maintainer "Prolifics"

# Stage-1
FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests

# Stage-2
FROM openjdk:8-jdk-alpine
COPY --from=build /workspace/target/addition-service.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

LABEL maintainer "Prolifics"