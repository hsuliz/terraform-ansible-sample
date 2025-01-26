FROM gradle:8.12.0-jdk21-corretto AS builder

WORKDIR /workspace

COPY src ./src
COPY gradle ./gradle
COPY settings.gradle.kts .
COPY build.gradle.kts .
COPY gradle.properties .

RUN gradle buildFatJar --no-daemon

FROM amazoncorretto:21-al2023-headless

WORKDIR /app

COPY --from=builder /workspace/build/libs/web-server.jar ./

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "web-server.jar"]