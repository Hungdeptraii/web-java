-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for order_doan
CREATE DATABASE IF NOT EXISTS `order_doan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `order_doan`;

-- Dumping structure for table order_doan.categories
CREATE TABLE IF NOT EXISTS `categories` (
                                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.categories: ~2 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
                                                                        (1, 'Đồ ăn', '2025-05-27 01:50:26', '2025-05-29 10:41:30'),
                                                                        (2, 'Đồ uống', '2025-05-29 10:25:14', '2025-05-29 10:41:31');

-- Dumping structure for table order_doan.customer_orders
CREATE TABLE IF NOT EXISTS `customer_orders` (
                                                 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `fullname` varchar(255) NOT NULL,
    `phone` varchar(255) DEFAULT NULL,
    `address` varchar(255) DEFAULT NULL,
    `note` varchar(255) DEFAULT NULL,
    `code` varchar(255) DEFAULT NULL,
    `ban` varchar(255) DEFAULT NULL,
    `status` int(11) DEFAULT 0,
    `reason` varchar(255) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.customer_orders: ~6 rows (approximately)
DELETE FROM `customer_orders`;
INSERT INTO `customer_orders` (`id`, `fullname`, `phone`, `address`, `note`, `code`, `ban`, `status`, `reason`, `created_at`, `updated_at`) VALUES
                                                                                                                                                (55, 'jhgftjyjy', '098 7675646', 'hethrthy', '', 'K9948', '', 2, 'không nhận', NULL, '2025-07-24 11:21:02'),
                                                                                                                                                (57, 'jftfherte', '087 5342542', 'gẻggr', '', 'G8830', '', 1, NULL, NULL, '2025-07-24 11:06:58'),
                                                                                                                                                (58, 'hgdyegfe', '098 7424543', 'ghrtht', '', 'Z1072', '', 2, 'không nhận', NULL, '2025-07-24 10:34:56'),
                                                                                                                                                (60, 'hfghgf', '098 7854636', 'fdgfdg', '', 'Y7096', '', 2, 'không liên lạc được', NULL, '2025-07-24 10:41:58'),
                                                                                                                                                (61, 'grgergr', '087 5425446', 'ghthrt', '', 'L1729', '', 1, NULL, NULL, '2025-07-24 10:56:27'),
                                                                                                                                                (62, 'gfjhjhgj', '087 6645676', 'hrthth', '', 'X2641', '', 0, NULL, NULL, NULL);

-- Dumping structure for table order_doan.customer_order_items
CREATE TABLE IF NOT EXISTS `customer_order_items` (
                                                      `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `order_id` bigint(20) unsigned NOT NULL,
    `product_id` bigint(20) NOT NULL,
    `quantity` int(11) NOT NULL,
    `price` int(11) NOT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `fk_order_id` (`order_id`),
    KEY `fk_product_id` (`product_id`),
    CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.customer_order_items: ~19 rows (approximately)
DELETE FROM `customer_order_items`;
INSERT INTO `customer_order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
                                                                                                                         (106, 55, 1, 3, 15000, NULL, NULL),
                                                                                                                         (107, 55, 2, 4, 100000, NULL, NULL),
                                                                                                                         (108, 55, 5, 1, 20000, NULL, NULL),
                                                                                                                         (110, 57, 2, 3, 100000, NULL, NULL),
                                                                                                                         (111, 57, 4, 1, 3000000, NULL, NULL),
                                                                                                                         (112, 58, 7, 1, 17000, NULL, NULL),
                                                                                                                         (113, 58, 8, 1, 17000, NULL, NULL),
                                                                                                                         (114, 58, 9, 1, 17000, NULL, NULL),
                                                                                                                         (118, 60, 6, 1, 3000, NULL, NULL),
                                                                                                                         (119, 60, 7, 1, 17000, NULL, NULL),
                                                                                                                         (120, 60, 8, 1, 17000, NULL, NULL),
                                                                                                                         (121, 61, 4, 1, 3000000, NULL, NULL),
                                                                                                                         (122, 61, 5, 1, 20000, NULL, NULL),
                                                                                                                         (123, 62, 4, 1, 3000000, NULL, NULL),
                                                                                                                         (124, 62, 5, 1, 20000, NULL, NULL),
                                                                                                                         (125, 62, 7, 1, 17000, NULL, NULL),
                                                                                                                         (126, 62, 8, 1, 17000, NULL, NULL),
                                                                                                                         (127, 62, 9, 1, 17000, NULL, NULL);

-- Dumping structure for table order_doan.logs
CREATE TABLE IF NOT EXISTS `logs` (
                                      `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) unsigned NOT NULL,
    `title` text NOT NULL,
    `content` text NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.logs: ~0 rows (approximately)
DELETE FROM `logs`;

-- Dumping structure for table order_doan.order
CREATE TABLE IF NOT EXISTS `order` (
                                       `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `code` varchar(50) NOT NULL,
    `vitri` varchar(50) NOT NULL,
    `order` text NOT NULL,
    `lenmon` tinyint(1) unsigned NOT NULL DEFAULT 0,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.order: ~0 rows (approximately)
DELETE FROM `order`;

-- Dumping structure for table order_doan.pending_payment
CREATE TABLE IF NOT EXISTS `pending_payment` (
                                                 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `paymentMethod` varchar(50) DEFAULT NULL,
    `transactionDate` timestamp NULL DEFAULT NULL,
    `code` varchar(50) DEFAULT NULL,
    `content` text DEFAULT NULL,
    `transferType` text DEFAULT NULL,
    `transferAmount` float DEFAULT NULL,
    `status` text DEFAULT 'pending',
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.pending_payment: ~0 rows (approximately)
DELETE FROM `pending_payment`;

-- Dumping structure for table order_doan.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
                                                        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `tokenable_id` bigint(20) unsigned NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `last_used_at` timestamp NULL DEFAULT NULL,
    `expires_at` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
    KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table order_doan.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table order_doan.products
CREATE TABLE IF NOT EXISTS `products` (
                                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `category_id` bigint(20) DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    `image` varchar(255) DEFAULT NULL,
    `price` int(11) NOT NULL,
    `sale` int(11) unsigned DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
    CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.products: ~8 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `price`, `sale`, `created_at`, `updated_at`) VALUES
                                                                                                               (1, 1, 'Bánh burger loại 4', 'f79380cb-71e1-473f-93e9-e8f3d5a02840_burger-3.jpg', 15000, NULL, '2025-05-27 01:20:04', '2025-07-22 17:24:13'),
                                                                                                               (2, 1, 'Bánh burger loại 2', 'fa51ec15-7ed3-4611-963a-d877fd05edfb_burger-2.jpg', 100000, NULL, '2025-05-27 01:22:29', '2025-07-22 17:37:27'),
                                                                                                               (4, 2, 'Nước cam', 'drink-4.jpg', 3000000, NULL, '2025-05-27 01:23:23', '2025-07-12 16:33:07'),
                                                                                                               (5, 1, 'Bánh creap', 'dessert-2.jpg', 20000, NULL, '2025-05-27 01:26:33', '2025-05-29 10:42:06'),
                                                                                                               (6, 1, 'Bánh kem', 'dessert-3.jpg', 3000, NULL, '2025-05-27 01:27:04', '2025-05-29 10:42:07'),
                                                                                                               (7, 2, 'Bia hơi', 'drink-2.jpg', 17000, NULL, '2025-05-27 01:27:23', '2025-07-12 15:54:16'),
                                                                                                               (8, 2, 'Nước chanh bạc hà', 'drink-4.jpg', 17000, NULL, '2025-05-27 01:27:23', '2025-07-12 16:33:05'),
                                                                                                               (9, 2, 'Trà hibiscus', 'drink-4.jpg', 17000, NULL, '2025-05-27 01:27:23', '2025-05-29 10:42:11');

-- Dumping structure for table order_doan.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
                                          `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_activity` int(11) NOT NULL,
    `status` int(11) NOT NULL DEFAULT 0,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE,
    KEY `sessions_user_id_index` (`user_id`) USING BTREE,
    KEY `sessions_last_activity_index` (`last_activity`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table order_doan.sessions: ~0 rows (approximately)
DELETE FROM `sessions`;

-- Dumping structure for table order_doan.setting
CREATE TABLE IF NOT EXISTS `setting` (
                                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `value` varchar(255) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.setting: ~12 rows (approximately)
DELETE FROM `setting`;
INSERT INTO `setting` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
                                                                              (1, 'Tên tài khoản', 'NGUYEN HOANG LAM', '2024-07-28 07:05:33', '2025-06-09 07:48:49'),
                                                                              (2, 'Số tài khoản', '0196908102005', '2024-07-28 07:04:35', '2025-06-03 06:46:49'),
                                                                              (3, 'Tên ngân hàng', 'Ngân hàng TMCP Quân đội - MBBank', '2024-07-28 07:06:25', '2025-06-03 06:46:49'),
                                                                              (4, 'Số ngân hàng', '970422', '2024-07-28 07:23:19', '2025-06-03 06:46:49'),
                                                                              (5, 'Chi nhánh', 'Chi nhánh Cầu Giấy', '2024-07-28 07:23:19', '2025-06-03 06:46:49'),
                                                                              (6, 'Tên cửa hàng', 'Cafe shop', '2025-05-30 18:03:39', '2025-06-03 06:46:49'),
                                                                              (7, 'Số điện thoại', '089 1123123', '2025-05-30 03:43:16', '2025-06-09 07:43:06'),
                                                                              (8, 'Địa chỉ email', '789', '2025-05-30 03:43:29', '2025-06-03 06:46:49'),
                                                                              (9, 'Địa chỉ', '123', '2025-05-30 03:43:04', '2025-06-03 06:46:49'),
                                                                              (10, 'Mật khẩu wifi', 'cafeshop123', '2025-05-31 17:49:32', '2025-06-03 06:46:49'),
                                                                              (11, 'Logo', 'logo1024.png', '2025-06-06 06:17:00', '2025-06-06 06:30:20'),
                                                                              (12, 'Mô tả', 'Chào mừng', '2025-05-30 04:11:10', '2025-06-06 06:16:56');

-- Dumping structure for table order_doan.table
CREATE TABLE IF NOT EXISTS `table` (
                                       `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `ban` varchar(50) NOT NULL,
    `vitriban` varchar(50) NOT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.table: ~3 rows (approximately)
DELETE FROM `table`;
INSERT INTO `table` (`id`, `ban`, `vitriban`, `created_at`, `updated_at`) VALUES
                                                                              (1, 'D123', 'Ngoài trời', '2025-05-31 06:57:54', '2025-05-31 08:18:43'),
                                                                              (2, 'B123', 'Trong nhà tầng 1', '2025-05-31 08:08:34', '2025-05-31 08:08:34'),
                                                                              (3, 'AB123', 'Trong nhà tầng 2', '2025-05-31 08:09:29', '2025-05-31 08:09:29');

-- Dumping structure for table order_doan.users
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
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `level`, `google_id`, `facebook_id`, `email`, `phone`, `fullname`, `password`, `avatar`, `code`, `remember_token`, `email_verified_at`, `is_online`, `last_seen`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                             (1, 2, NULL, NULL, 'website8386@gmail.com', '123 1231231', 'nguyễn văn NHL', '$2y$12$Ei.LmAW1oTdFFI7t3I6Rb.nMnNx4m2ijU4e/czDWLq5jAiZ8EQAsu', NULL, '3777', 'qNwiWjeefCZ6Nn8Je4NsA1oyC8444yWfn4tE0REoS7Z1GPi40GfqMNY4CL4D', '2025-02-10 10:44:40', 1, '2025-06-09 08:24:24', '2025-02-10 10:42:57', '2025-07-03 12:02:58'),
                                                                                                                                                                                                                             (2, 1, NULL, NULL, '123@123', '123', 'Nguyễn Văn B', '$2y$12$Ei.LmAW1oTdFFI7t3I6Rb.nMnNx4m2ijU4e/czDWLq5jAiZ8EQAsu', 'goidoan_avatar_1749402599.png', '3777', 'ApxgGNF66UFlqKWykXhOZU4WPoswSfh2sbFQwdjLCOUrLcuP2ASie41GCPoc', '2025-02-10 10:44:40', 1, '2025-07-03 12:57:32', '2025-03-05 08:13:30', '2025-07-03 12:57:32'),
                                                                                                                                                                                                                             (3, 3, NULL, NULL, '456@456', '456', 'Nguyễn Văn C', '$2y$12$Ei.LmAW1oTdFFI7t3I6Rb.nMnNx4m2ijU4e/czDWLq5jAiZ8EQAsu', 'goidoan_avatar_1749402599.png', '3777', 'qXAacWzUxcXW9AajtW8BwxkbiKsrTmSykZVNJs5GDq9SfHsOh4EJOHvrsfmY', '2025-02-10 10:44:40', 1, '2025-06-14 10:15:28', '2025-03-05 08:13:30', '2025-06-14 10:15:28');

-- Dumping structure for table order_doan.users_level
CREATE TABLE IF NOT EXISTS `users_level` (
                                             `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `status` tinyint(1) unsigned NOT NULL DEFAULT 1,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.users_level: ~3 rows (approximately)
DELETE FROM `users_level`;
INSERT INTO `users_level` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
                                                                                   (1, 'Nhân viên', 1, '2023-10-27 09:01:34', '2025-05-28 10:17:46'),
                                                                                   (2, 'Trưởng ca', 1, '2023-10-27 09:41:12', '2025-05-28 10:18:18'),
                                                                                   (3, 'Quản trị viên', 1, '2023-11-03 20:38:56', '2025-04-04 18:53:03');

-- Dumping structure for table order_doan.website_info
CREATE TABLE IF NOT EXISTS `website_info` (
                                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `logo` varchar(255) DEFAULT NULL,
    `dia_chi` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `mo_ta` varchar(255) DEFAULT NULL,
    `so_dien_thoai` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table order_doan.website_info: ~1 rows (approximately)
DELETE FROM `website_info`;
INSERT INTO `website_info` (`id`, `logo`, `dia_chi`, `email`, `mo_ta`, `so_dien_thoai`) VALUES
    (1, 'logo1024.png', '123', 'doan@gmail.com', 'ngon - bổ - rẻ', '0987654321');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
