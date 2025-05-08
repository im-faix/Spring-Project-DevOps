FROM ubuntu AS stage
WORKDIR /app
COPY . .
RUN mvn package
RUN mv target/*.jar target/app.jar


FROM openjdk:21-jdk-slim
WORKDIR /basic
COPY --from=stage target/app.jar .
CMD ["java". "-jar", "app.jar"]
