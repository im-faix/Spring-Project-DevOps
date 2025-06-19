FROM ubuntu AS stage1
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install openjdk-17-jdk maven -y
RUN mvn clean package
RUN mv target/*.jar target/app.jar


FROM openjdk:21-jdk-slim
WORKDIR /basic
COPY --from=stage1 /app/target/app.jar .
CMD ["java","-jar", "app.jar"]
