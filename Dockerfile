FROM amazoncorretto:21-al2023-headless

WORKDIR /app

COPY web-server-*.jar web-server.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "web-server.jar"]