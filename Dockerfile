# Dùng JDK 17 để chạy ứng dụng
FROM eclipse-temurin:17-jdk

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy file WAR vào container
COPY target/web-java.war app.war

# Expose cổng mặc định
EXPOSE 8080

# Chạy WAR như ứng dụng Spring Boot độc lập
ENTRYPOINT ["java", "-jar", "app.war"]
