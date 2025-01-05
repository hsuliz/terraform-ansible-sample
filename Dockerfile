FROM gradle:8.12.0-jdk21-corretto AS builder

WORKDIR /workspace

COPY . ./

RUN ./gradlew buildFatJar


FROM amazoncorretto:21-al2023-headless

WORKDIR /app

COPY --from=builder /workspace/build/libs/simple-automation-all.jar ./

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "simple-automation-all.jar"]