# Dùng JDK 17 để chạy ứng dụng
FROM eclipse-temurin:17-jdk

# Tạo thư mục làm việc trong container
WORKDIR /app
COPY --from=builder /app/target/*.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
