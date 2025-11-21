FROM maven AS stage1
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTest
RUN mv target/*.jar target/app.jar


FROM eclipse-temurin:21-jdk
WORKDIR /basic
COPY --from=stage1 /app/target/app.jar .
CMD ["java","-jar", "app.jar"]
