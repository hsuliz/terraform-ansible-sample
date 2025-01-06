FROM amazoncorretto:21-al2023-headless

WORKDIR /app

COPY --from=builder /workspace/build/libs/simple-automation-*.jar ./

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "simple-automation-*.jar"]