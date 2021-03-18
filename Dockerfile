FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/addition-service.jar app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 80
ENV JAVA_OPTS=""
ENTRYPOINT ["java", "-Dspring.profiles.active=docker", "-Djava.security.egd=file:/dev/./urandom", "-Dapp.port=${app.port}", "-jar","/app.jar"]
LABEL maintainer "Prolifics"
