FROM ubuntu AS stage
WORKDIR /app
COPY . .
RUN mvn package
RUN mv target/*.jar target/app.jar


FROM java:17-slim
WORKDIR /basic
COPY --from=stage targer/app.jar .
CMD ["java". "-jar", "target/app.jar"]
