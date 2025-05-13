FROM ubuntu AS stage
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install openjdk-17-jdk maven -y
RUN mvn clean package
RUN mv target/*.jar target/app.jar


FROM openjdk:21-jdk-slim
WORKDIR /basic
COPY --from=stage /app/target/app.jar .
CMD ["java","-jar", "app.jar"]
