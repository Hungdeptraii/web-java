# 👉 Giai đoạn 1: Build file .war với Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 👉 Giai đoạn 2: Chạy ứng dụng .war bằng JDK
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/*.war app.war
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.war"]
