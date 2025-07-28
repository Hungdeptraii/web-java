# Deployment Guide

## Fixed Issues

1. **Main Class Configuration**: Fixed the Spring Boot Maven plugin configuration in `pom.xml` to use the correct main class `com.nhl.Application` instead of `com.example.webtest.Application`.

2. **Packaging Type**: Changed from JAR to WAR packaging for better deployment compatibility.

3. **Render Configuration**: Created proper `render.yaml` configuration for Render deployment.

## Deployment Steps

### For Render.com Deployment:

1. **Push your changes to your Git repository**
2. **Connect your repository to Render.com**
3. **Create a new Web Service**
4. **Use the following configuration:**
   - **Build Command**: `mvn clean package`
   - **Start Command**: `java -jar target/webtest-0.0.1-SNAPSHOT.war`
   - **Environment**: Java 17

### Database Configuration:

Make sure your remote database (sql10.freesqldatabase.com) has the proper table structure. Run the following SQL script on your database:

```sql
CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `level` int(11) DEFAULT 1,
    `google_id` text DEFAULT NULL,
    `facebook_id` text DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `phone` text NOT NULL,
    `fullname` varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `avatar` varchar(255) DEFAULT NULL,
    `code` text DEFAULT NULL,
    `remember_token` varchar(255) DEFAULT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `is_online` tinyint(1) DEFAULT 0,
    `last_seen` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` datetime NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
```

### Environment Variables:

Make sure to set these environment variables in your deployment platform:
- `SPRING_DATASOURCE_URL`: Your database URL
- `SPRING_DATASOURCE_USERNAME`: Your database username
- `SPRING_DATASOURCE_PASSWORD`: Your database password

## Troubleshooting

If you still encounter the "Field 'id' doesn't have a default value" error, the custom ID generator (`DatabaseIdGenerator`) should handle this automatically.

## Files Modified

1. `pom.xml` - Fixed main class and packaging type
2. `render.yaml` - Added deployment configuration
3. `src/main/java/com/nhl/model/User.java` - Added custom ID generator
4. `src/main/java/com/nhl/model/DatabaseIdGenerator.java` - Custom ID generator for database compatibility 