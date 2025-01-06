FROM amazoncorretto:21-al2023-headless

WORKDIR /app

COPY build/libs/web-server-*.jar ./

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "web-server-*.jar"]