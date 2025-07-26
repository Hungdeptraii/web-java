# Dùng JDK 17 để chạy ứng dụng
FROM openjdk:17-jdk-slim

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy file WAR vào container
COPY target/webtest-0.01-SNAPSHOT.war app.war

# Expose cổng mặc định
EXPOSE 8080

# Chạy WAR như ứng dụng Spring Boot độc lập
ENTRYPOINT ["java", "-jar", "app.war"]
