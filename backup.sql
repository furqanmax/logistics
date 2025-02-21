-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: beingmothers
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country_codes`
--

DROP TABLE IF EXISTS `country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_codes`
--

LOCK TABLES `country_codes` WRITE;
/*!40000 ALTER TABLE `country_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drop_points`
--

DROP TABLE IF EXISTS `drop_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drop_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `drop_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_mobile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drop_points_order_id_foreign` (`order_id`),
  KEY `drop_points_uid_foreign` (`uid`),
  CONSTRAINT `drop_points_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drop_points_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drop_points`
--

LOCK TABLES `drop_points` WRITE;
/*!40000 ALTER TABLE `drop_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `drop_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2025_01_11_100420_create_permission_tables',1),(6,'2025_01_13_110638_create_posts_table',2),(7,'2025_01_14_074428_create_categories_table',3),(8,'2025_01_14_080809_create_pcats_table',4),(9,'2025_01_14_081118_create_product_categories_table',5),(10,'2025_01_14_084900_create_vehicles_table',5),(11,'2025_01_14_110941_create_sub_categories_table',6),(12,'2025_01_14_115206_create_sub_categories_table',7),(13,'2025_01_14_120201_create_products_table',8),(14,'2025_01_14_122408_create_zones_table',9),(15,'2025_01_15_145953_create_managers_table',10),(16,'2025_01_15_161655_create_riders_table',11),(17,'2025_01_16_134829_create_coupons_table',12),(18,'2025_01_16_144427_create_codes_table',13),(19,'2025_01_16_144435_create_country_codes_table',13),(20,'2025_01_16_145228_create_banners_table',14),(21,'2025_01_17_123806_create_orders_table',15),(22,'2025_01_23_145115_create_payment_lists_table',16),(23,'2025_01_23_151813_create_settings_table',17),(24,'2025_01_25_085423_create_tbl_user_table',18),(25,'2025_01_25_093635_create_drop_points_table',19),(26,'2025_01_25_100240_create_wallet_reports_table',20),(27,'2025_01_25_101134_create_parcel_data_table',21),(28,'2025_01_25_101625_create_cashes_table',22),(29,'2025_01_25_102204_wallet_report',22),(30,'2025_01_25_102250_tbl_drop_points',22),(31,'2025_02_01_081612_modify_nullable_fields_in_tbl_user',23);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2),(2,'App\\Models\\User',3),(3,'App\\Models\\User',4),(5,'App\\Models\\User',4),(1,'App\\Models\\User',7),(1,'App\\Models\\User',8),(4,'App\\Models\\User',9),(5,'App\\Models\\Merchant',10),(5,'App\\Models\\User',10);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcel_data`
--

DROP TABLE IF EXISTS `parcel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcel_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcel_data`
--

LOCK TABLES `parcel_data` WRITE;
/*!40000 ALTER TABLE `parcel_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=844 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (568,'view-any Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(569,'view Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(570,'create Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(571,'update Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(572,'delete Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(573,'delete-any Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(574,'restore Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(575,'restore-any Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(576,'replicate Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(577,'reorder Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(578,'force-delete Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(579,'force-delete-any Banner','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(580,'view-any Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(581,'view Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(582,'create Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(583,'update Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(584,'delete Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(585,'delete-any Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(586,'restore Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(587,'restore-any Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(588,'replicate Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(589,'reorder Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(590,'force-delete Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(591,'force-delete-any Cash','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(592,'view-any Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(593,'view Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(594,'create Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(595,'update Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(596,'delete Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(597,'delete-any Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(598,'restore Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(599,'restore-any Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(600,'replicate Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(601,'reorder Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(602,'force-delete Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(603,'force-delete-any Category','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(604,'view-any CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(605,'view CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(606,'create CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(607,'update CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(608,'delete CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(609,'delete-any CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(610,'restore CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(611,'restore-any CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(612,'replicate CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(613,'reorder CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(614,'force-delete CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(615,'force-delete-any CountryCode','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(616,'view-any Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(617,'view Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(618,'create Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(619,'update Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(620,'delete Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(621,'delete-any Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(622,'restore Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(623,'restore-any Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(624,'replicate Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(625,'reorder Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(626,'force-delete Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(627,'force-delete-any Coupon','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(628,'view-any DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(629,'view DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(630,'create DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(631,'update DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(632,'delete DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(633,'delete-any DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(634,'restore DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(635,'restore-any DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(636,'replicate DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(637,'reorder DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(638,'force-delete DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(639,'force-delete-any DropPoint','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(640,'view-any Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(641,'view Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(642,'create Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(643,'update Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(644,'delete Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(645,'delete-any Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(646,'restore Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(647,'restore-any Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(648,'replicate Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(649,'reorder Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(650,'force-delete Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(651,'force-delete-any Manager','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(652,'view-any Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(653,'view Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(654,'create Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(655,'update Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(656,'delete Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(657,'delete-any Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(658,'restore Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(659,'restore-any Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(660,'replicate Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(661,'reorder Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(662,'force-delete Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(663,'force-delete-any Merchant','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(664,'view-any Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(665,'view Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(666,'create Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(667,'update Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(668,'delete Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(669,'delete-any Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(670,'restore Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(671,'restore-any Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(672,'replicate Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(673,'reorder Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(674,'force-delete Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(675,'force-delete-any Order','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(676,'view-any ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(677,'view ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(678,'create ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(679,'update ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(680,'delete ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(681,'delete-any ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(682,'restore ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(683,'restore-any ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(684,'replicate ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(685,'reorder ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(686,'force-delete ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(687,'force-delete-any ParcelData','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(688,'view-any PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(689,'view PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(690,'create PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(691,'update PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(692,'delete PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(693,'delete-any PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(694,'restore PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(695,'restore-any PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(696,'replicate PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(697,'reorder PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(698,'force-delete PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(699,'force-delete-any PaymentList','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(700,'view-any Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(701,'view Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(702,'create Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(703,'update Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(704,'delete Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(705,'delete-any Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(706,'restore Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(707,'restore-any Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(708,'replicate Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(709,'reorder Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(710,'force-delete Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(711,'force-delete-any Permission','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(712,'view-any Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(713,'view Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(714,'create Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(715,'update Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(716,'delete Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(717,'delete-any Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(718,'restore Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(719,'restore-any Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(720,'replicate Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(721,'reorder Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(722,'force-delete Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(723,'force-delete-any Post','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(724,'view-any Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(725,'view Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(726,'create Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(727,'update Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(728,'delete Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(729,'delete-any Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(730,'restore Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(731,'restore-any Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(732,'replicate Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(733,'reorder Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(734,'force-delete Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(735,'force-delete-any Product','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(736,'view-any ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(737,'view ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(738,'create ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(739,'update ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(740,'delete ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(741,'delete-any ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(742,'restore ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(743,'restore-any ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(744,'replicate ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(745,'reorder ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(746,'force-delete ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(747,'force-delete-any ProductCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(748,'view-any Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(749,'view Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(750,'create Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(751,'update Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(752,'delete Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(753,'delete-any Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(754,'restore Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(755,'restore-any Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(756,'replicate Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(757,'reorder Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(758,'force-delete Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(759,'force-delete-any Rider','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(760,'view-any Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(761,'view Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(762,'create Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(763,'update Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(764,'delete Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(765,'delete-any Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(766,'restore Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(767,'restore-any Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(768,'replicate Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(769,'reorder Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(770,'force-delete Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(771,'force-delete-any Role','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(772,'view-any Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(773,'view Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(774,'create Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(775,'update Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(776,'delete Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(777,'delete-any Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(778,'restore Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(779,'restore-any Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(780,'replicate Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(781,'reorder Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(782,'force-delete Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(783,'force-delete-any Setting','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(784,'view-any SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(785,'view SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(786,'create SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(787,'update SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(788,'delete SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(789,'delete-any SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(790,'restore SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(791,'restore-any SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(792,'replicate SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(793,'reorder SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(794,'force-delete SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(795,'force-delete-any SubCategory','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(796,'view-any User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(797,'view User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(798,'create User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(799,'update User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(800,'delete User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(801,'delete-any User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(802,'restore User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(803,'restore-any User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(804,'replicate User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(805,'reorder User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(806,'force-delete User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(807,'force-delete-any User','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(808,'view-any Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(809,'view Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(810,'create Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(811,'update Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(812,'delete Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(813,'delete-any Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(814,'restore Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(815,'restore-any Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(816,'replicate Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(817,'reorder Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(818,'force-delete Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(819,'force-delete-any Vehicle','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(820,'view-any WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(821,'view WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(822,'create WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(823,'update WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(824,'delete WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(825,'delete-any WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(826,'restore WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(827,'restore-any WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(828,'replicate WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(829,'reorder WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(830,'force-delete WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(831,'force-delete-any WalletReport','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(832,'view-any Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(833,'view Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(834,'create Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(835,'update Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(836,'delete Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(837,'delete-any Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(838,'restore Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(839,'restore-any Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(840,'replicate Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(841,'reorder Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(842,'force-delete Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17'),(843,'force-delete-any Zone','web','2025-02-01 09:08:17','2025-02-01 09:08:17');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test','test content','2025-01-13 06:01:56','2025-01-13 06:01:56');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (569,5),(580,5),(582,5),(592,5),(628,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2025-01-13 03:07:27','2025-01-13 03:07:27'),(2,'Writer','web','2025-01-13 03:54:47','2025-01-13 03:54:47'),(3,'Moderator','web','2025-01-13 04:37:37','2025-01-13 04:37:37'),(4,'testing','web','2025-01-30 11:11:04','2025-01-30 11:11:04'),(5,'developer','web','2025-02-01 02:49:48','2025-02-01 02:49:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_banner`
--

DROP TABLE IF EXISTS `tbl_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_banner` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_banner`
--

LOCK TABLES `tbl_banner` WRITE;
/*!40000 ALTER TABLE `tbl_banner` DISABLE KEYS */;
INSERT INTO `tbl_banner` VALUES (1,'01JHQSVB85ZF0WS802QJ7W88TD.svg',1,'2025-01-16 09:26:32','2025-01-16 09:26:32');
/*!40000 ALTER TABLE `tbl_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cash`
--

DROP TABLE IF EXISTS `tbl_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cash` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint unsigned NOT NULL,
  `amt` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdate` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_cash_rid_foreign` (`rid`),
  CONSTRAINT `tbl_cash_rid_foreign` FOREIGN KEY (`rid`) REFERENCES `tbl_rider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cash`
--

LOCK TABLES `tbl_cash` WRITE;
/*!40000 ALTER TABLE `tbl_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_status` int NOT NULL,
  `cat_img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'test',1,'01JHJ7SBPZVCMFYJP9AWCRM854.svg','2025-01-14 05:34:40','2025-01-14 05:34:40');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_code`
--

DROP TABLE IF EXISTS `tbl_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ccode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_code`
--

LOCK TABLES `tbl_code` WRITE;
/*!40000 ALTER TABLE `tbl_code` DISABLE KEYS */;
INSERT INTO `tbl_code` VALUES (1,'+91',1,'2025-01-16 09:19:35','2025-01-16 09:19:35');
/*!40000 ALTER TABLE `tbl_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_drop_points`
--

DROP TABLE IF EXISTS `tbl_drop_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_drop_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `drop_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_mobile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_drop_points_order_id_foreign` (`order_id`),
  KEY `tbl_drop_points_uid_foreign` (`uid`),
  CONSTRAINT `tbl_drop_points_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_drop_points_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_drop_points`
--

LOCK TABLES `tbl_drop_points` WRITE;
/*!40000 ALTER TABLE `tbl_drop_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_drop_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manager`
--

DROP TABLE IF EXISTS `tbl_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manager` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_manager_email_unique` (`email`),
  KEY `tbl_manager_zone_id_foreign` (`zone_id`),
  CONSTRAINT `tbl_manager_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manager`
--

LOCK TABLES `tbl_manager` WRITE;
/*!40000 ALTER TABLE `tbl_manager` DISABLE KEYS */;
INSERT INTO `tbl_manager` VALUES (1,'test manager','01JHN9H98ZSPM3960PKRGT75BQ.svg',1,'9999999999','manager@example.com','password',1,'2025-01-15 10:02:56','2025-01-15 10:02:56');
/*!40000 ALTER TABLE `tbl_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `rid` bigint unsigned NOT NULL DEFAULT '0',
  `cat_id` bigint unsigned NOT NULL,
  `dzone` bigint unsigned NOT NULL,
  `vehicleid` bigint unsigned NOT NULL,
  `pick_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_lat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_lng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `o_total` double(8,2) NOT NULL,
  `cou_id` bigint unsigned NOT NULL,
  `cou_amt` double(8,2) NOT NULL,
  `trans_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_status` enum('Pending','Processing','On Route','Completed','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `dcommission` double(8,2) NOT NULL DEFAULT '0.00',
  `wall_amt` double(8,2) DEFAULT NULL,
  `p_method_id` bigint unsigned NOT NULL,
  `odate` datetime NOT NULL,
  `rlats` text COLLATE utf8mb4_unicode_ci,
  `rlongs` text COLLATE utf8mb4_unicode_ci,
  `delivertime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` VALUES (11,4,6,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','On Route',1.00,0.00,2,'2024-12-05 14:02:47','19.1578651','77.3310261',NULL,NULL,NULL),(12,4,0,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 14:02:52',NULL,NULL,NULL,NULL,NULL),(13,4,6,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','Processing',1.00,0.00,2,'2024-12-05 14:02:58','19.1578651','77.3310261',NULL,NULL,NULL),(14,4,6,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','On Route',1.00,0.00,2,'2024-12-05 19:07:39','19.1578651','77.3310261',NULL,NULL,NULL),(15,4,0,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 19:15:22',NULL,NULL,NULL,NULL,NULL),(16,4,0,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 19:19:25',NULL,NULL,NULL,NULL,NULL),(17,4,0,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 19:39:37',NULL,NULL,NULL,NULL,NULL),(18,4,0,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 19:41:10',NULL,NULL,NULL,NULL,NULL),(19,4,6,0,2,6,'48X9+CM6, Gadipura, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Nanded-Waghala, Maharashtra 431604, India Nanded Maharashtra India 431604 ','19.148529007635','77.319147102535',0.00,3620.00,0,0.00,'0','Processing',1.00,0.00,2,'2024-12-05 19:43:15','19.1578651','77.3310261',NULL,NULL,NULL),(20,4,6,18,3,6,'58Q7+QVX, Asra Nagar, Nanded-Waghala, Nanded, Maharashtra 431605, India Nanded-Waghala Maharashtra India 431605 ','19.189627606043','77.314725480974',10.00,10.00,0,0.00,'0','Completed',1.00,0.00,2,'2024-12-05 20:38:07','19.1578651','77.3310261','2024-12-05 20:43:03',NULL,NULL),(21,4,6,18,3,6,'589P+HPP, Maltekri Rd, Hyder Bagh, Dashmesh Nagar, Harsh Nagar, Nanded, Bondhar Tarf Haveli, Maharashtra 431601, India Bondhar Tarf Haveli Maharashtra India 431601 ','19.170316401615','77.336188182235',10.00,10.00,0,0.00,'0','Completed',1.00,0.00,2,'2024-12-05 20:51:56','19.1578651','77.3310261','2024-12-05 20:54:39',NULL,NULL),(22,4,0,18,3,6,'58P4+QCF, Asra Nagar, Nanded, Taroda Bk., Maharashtra 431605, India Nanded Maharashtra India 431605 ','19.186927536576','77.306057922542',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-10 20:18:48',NULL,NULL,NULL,NULL,NULL),(23,4,0,18,3,6,'58P4+QCF, Asra Nagar, Nanded, Taroda Bk., Maharashtra 431605, India Nanded Maharashtra India 431605 ','19.186927536576','77.306057922542',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-06 13:25:52',NULL,NULL,NULL,NULL,NULL),(24,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-08 12:48:50',NULL,NULL,NULL,NULL,NULL),(25,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-08 12:49:15',NULL,NULL,NULL,NULL,NULL),(26,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-08 12:51:58',NULL,NULL,NULL,NULL,NULL),(27,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-08 13:13:17',NULL,NULL,NULL,NULL,NULL),(28,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-08 13:45:45',NULL,NULL,NULL,NULL,NULL),(29,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:31:34',NULL,NULL,NULL,NULL,NULL),(30,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:33:44',NULL,NULL,NULL,NULL,NULL),(31,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:35:59',NULL,NULL,NULL,NULL,NULL),(32,4,0,18,0,0,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:38:44',NULL,NULL,NULL,NULL,NULL),(33,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:47:21',NULL,NULL,NULL,NULL,NULL),(34,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:49:23',NULL,NULL,NULL,NULL,NULL),(35,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:51:07',NULL,NULL,NULL,NULL,NULL),(36,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:51:32',NULL,NULL,NULL,NULL,NULL),(37,4,0,18,3,6,'58P4+QCF, Asra Nagar, Nanded, Taroda Bk., Maharashtra 431605, India Nanded Maharashtra India 431605 ','19.186927536576','77.306057922542',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 12:54:23',NULL,NULL,NULL,NULL,NULL),(38,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:02:01',NULL,NULL,NULL,NULL,NULL),(39,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:03:04',NULL,NULL,NULL,NULL,NULL),(40,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:06:03',NULL,NULL,NULL,NULL,NULL),(41,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:08:40',NULL,NULL,NULL,NULL,NULL),(42,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:10:26',NULL,NULL,NULL,NULL,NULL),(43,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:11:32',NULL,NULL,NULL,NULL,NULL),(44,4,0,18,3,6,'Asra Nagar, Nanded, Maharashtra 431605, India','19.1869276','77.306058',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:13:14',NULL,NULL,NULL,NULL,NULL),(45,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:26:08',NULL,NULL,NULL,NULL,NULL),(46,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:26:18',NULL,NULL,NULL,NULL,NULL),(47,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 13:51:49',NULL,NULL,NULL,NULL,NULL),(48,4,0,18,3,6,'Asra Nagar, Nanded, Maharashtra 431605, India','19.1869276','77.306058',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 14:04:02',NULL,NULL,NULL,NULL,NULL),(49,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-09 14:43:19',NULL,NULL,NULL,NULL,NULL),(50,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-10 15:44:52',NULL,NULL,NULL,NULL,NULL),(51,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-10 15:44:52',NULL,NULL,NULL,NULL,NULL),(52,4,0,18,3,6,'Irrigation Colony, Peer Burhan Nagar, Nanded, Maharashtra, India','19.1825906','77.3080313',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-10 15:45:09',NULL,NULL,NULL,NULL,NULL),(53,4,0,18,0,6,'','','',10.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-11 15:24:19',NULL,NULL,NULL,NULL,NULL),(110,14,6,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','On Route',1.00,0.00,2,'2024-12-05 14:02:47','19.1578651','77.3310261',NULL,NULL,NULL),(120,14,0,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2024-12-05 14:02:52',NULL,NULL,NULL,NULL,NULL),(121,14,6,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','On Route',1.00,0.00,2,'2025-01-18 14:02:47','19.1578651','77.3310261',NULL,'2025-01-18 08:32:47','2025-01-18 08:32:47'),(122,14,0,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-18 14:02:52',NULL,NULL,NULL,'2025-01-18 08:32:52','2025-01-18 08:32:52'),(123,15,7,0,2,6,'123 Sample Street, Test City, Maharashtra 431601, India','19.157800000000','77.330900000000',500.00,550.00,0,0.00,'0','Completed',50.00,0.00,2,'2025-01-18 15:15:00','19.1578000','77.3309000',NULL,'2025-01-18 09:45:00','2025-01-18 09:45:00'),(124,16,8,0,2,6,'456 Another Lane, Sample Town, Maharashtra 431601, India','19.200000000000','77.350000000000',1000.00,1100.00,0,0.00,'0','Cancelled',0.00,0.00,2,'2025-01-18 16:00:00','19.2000000','77.3500000',NULL,'2025-01-18 10:30:00','2025-01-18 10:30:00'),(125,17,9,0,2,6,'789 Test Plaza, City Center, Maharashtra 431601, India','19.250000000000','77.360000000000',1500.00,1550.00,0,0.00,'0','Processing',100.00,0.00,2,'2025-01-18 17:30:00','19.2500000','77.3600000',NULL,'2025-01-18 12:00:00','2025-01-18 12:00:00'),(126,18,10,0,2,6,'101 Final Ave, South Block, Maharashtra 431601, India','19.300000000000','77.370000000000',2000.00,2100.00,0,0.00,'0','Pending',150.00,0.00,2,'2025-01-18 18:45:00','19.3000000','77.3700000',NULL,'2025-01-18 13:15:00','2025-01-18 13:15:00'),(127,19,11,0,2,6,'200 Delivery Lane, West Side, Maharashtra 431601, India','19.350000000000','77.380000000000',2500.00,2600.00,0,0.00,'0','On Route',200.00,0.00,2,'2025-01-18 19:00:00','19.3500000','77.3800000',NULL,'2025-01-18 13:30:00','2025-01-18 13:30:00'),(128,4,6,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','On Route',1.00,0.00,2,'2025-01-18 14:02:47','19.1578651','77.3310261',NULL,'2025-01-18 08:32:47','2025-01-18 08:32:47'),(129,4,0,0,2,6,'585J+58W, Hyder Bagh Rd Number 2, Hyder Bagh, Dashmesh Nagar, Deglour Naka, Nanded, Hyder Bagh 1 & 2? Maharashtra 431601, India Nanded Maharashtra India 431601 ','19.157869303082','77.330986708403',0.00,10.00,0,0.00,'0','Pending',0.00,0.00,2,'2025-01-18 14:02:52',NULL,NULL,NULL,'2025-01-18 08:32:52','2025-01-18 08:32:52'),(130,4,7,0,2,6,'123 Sample Street, Test City, Maharashtra 431601, India','19.157800000000','77.330900000000',500.00,550.00,0,0.00,'0','Completed',50.00,0.00,2,'2025-01-18 15:15:00','19.1578000','77.3309000',NULL,'2025-01-18 09:45:00','2025-01-18 09:45:00'),(131,4,8,0,2,6,'456 Another Lane, Sample Town, Maharashtra 431601, India','19.200000000000','77.350000000000',1000.00,1100.00,0,0.00,'0','Cancelled',0.00,0.00,2,'2025-01-18 16:00:00','19.2000000','77.3500000',NULL,'2025-01-18 10:30:00','2025-01-18 10:30:00'),(132,4,9,0,2,6,'789 Test Plaza, City Center, Maharashtra 431601, India','19.250000000000','77.360000000000',1500.00,1550.00,0,0.00,'0','Processing',100.00,0.00,2,'2025-01-18 17:30:00','19.2500000','77.3600000',NULL,'2025-01-18 12:00:00','2025-01-18 12:00:00'),(133,4,10,0,2,6,'101 Final Ave, South Block, Maharashtra 431601, India','19.300000000000','77.370000000000',2000.00,2100.00,0,0.00,'0','Pending',150.00,0.00,2,'2025-01-18 18:45:00','19.3000000','77.3700000',NULL,'2025-01-18 13:15:00','2025-01-18 13:15:00'),(134,4,11,0,2,6,'200 Delivery Lane, West Side, Maharashtra 431601, India','19.350000000000','77.380000000000',2500.00,2600.00,0,0.00,'0','On Route',200.00,0.00,2,'2025-01-18 19:00:00','19.3500000','77.3800000',NULL,'2025-01-18 13:30:00','2025-01-18 13:30:00');
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_list`
--

DROP TABLE IF EXISTS `tbl_payment_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_list` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `p_show` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_list`
--

LOCK TABLES `tbl_payment_list` WRITE;
/*!40000 ALTER TABLE `tbl_payment_list` DISABLE KEYS */;
INSERT INTO `tbl_payment_list` VALUES (1,'Razorpay','images/payment/1619504987.png','RAZORPAY_KEY',1,'Card, UPI, Net banking, Wallet(Phone Pe, Amazon Pay, Freecharge)',1,NULL,NULL),(2,'Cash On Delivery','images/payment/1619505033.png','-',1,'Pay via Cash at the time of delivery, It\'s free and only takes a few minutes',0,NULL,NULL),(3,'Paypal','images/payment/1619505061.png','Paypal_key_here,0',1,'Credit/Debit card with Easier way to pay ? online and on your mobile.',0,NULL,NULL),(4,'Stripe','images/payment/1619505089.png','Primary_Key_Here,Secret_Key_Here',1,'Accept all major debit and credit cards from customers in every country',0,NULL,NULL),(5,'Wallet','images/payment/1619505033.png','-',1,'If Complete Payment Using Wallet',0,NULL,NULL),(6,'PayStack','images/payment/1628342058.png','Primary_Key_Here,Secret_Key_Here',1,'Credit/Debit card with Easier way to pay ? online and on your mobile.',0,NULL,NULL),(7,'FlutterWave','images/payment/1628342087.png','Flutterwave_key_here',1,'Card,pay with USSD,pay with bank,pay with barter',0,NULL,NULL),(8,'Paytm','images/payment/1628342058.png','M_ID,M_KEY,TEST',1,'Credit/Debit card,net banking,paytm wallet',0,NULL,NULL),(10,'SenangPay','images/payment/1619505089.png','M_ID,SECRET_KEY,TEST',1,'Accept all major debit and credit cards all Related Banks',0,NULL,NULL);
/*!40000 ALTER TABLE `tbl_payment_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pcat`
--

DROP TABLE IF EXISTS `tbl_pcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pcat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pcat`
--

LOCK TABLES `tbl_pcat` WRITE;
/*!40000 ALTER TABLE `tbl_pcat` DISABLE KEYS */;
INSERT INTO `tbl_pcat` VALUES (1,'test',1,'2025-01-14 03:20:39','2025-01-14 03:20:39'),(2,'test 123',1,'2025-01-14 06:26:47','2025-01-14 06:26:47');
/*!40000 ALTER TABLE `tbl_pcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` bigint unsigned NOT NULL,
  `subcat_id` bigint unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_product_cat_id_foreign` (`cat_id`),
  KEY `tbl_product_subcat_id_foreign` (`subcat_id`),
  CONSTRAINT `tbl_product_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `tbl_pcat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_product_subcat_id_foreign` FOREIGN KEY (`subcat_id`) REFERENCES `tbl_subcat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,2,1,'first product',1000.00,1,'2025-01-14 06:45:21','2025-01-14 06:45:21');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rider`
--

DROP TABLE IF EXISTS `tbl_rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rider` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rimg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `rate` double(8,2) NOT NULL,
  `lcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` double(8,2) NOT NULL,
  `bank_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upi_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rstatus` int NOT NULL DEFAULT '1',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept` int NOT NULL DEFAULT '0',
  `reject` int NOT NULL DEFAULT '0',
  `complete` int NOT NULL DEFAULT '0',
  `dzone` bigint unsigned NOT NULL,
  `vehiid` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_rider_dzone_foreign` (`dzone`),
  KEY `tbl_rider_vehiid_foreign` (`vehiid`),
  CONSTRAINT `tbl_rider_dzone_foreign` FOREIGN KEY (`dzone`) REFERENCES `zones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_rider_vehiid_foreign` FOREIGN KEY (`vehiid`) REFERENCES `tbl_vehicle` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rider`
--

LOCK TABLES `tbl_rider` WRITE;
/*!40000 ALTER TABLE `tbl_rider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_rider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_scoupon`
--

DROP TABLE IF EXISTS `tbl_scoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_scoupon` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `c_img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdate` date NOT NULL,
  `c_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `ctitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amt` int NOT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_scoupon`
--

LOCK TABLES `tbl_scoupon` WRITE;
/*!40000 ALTER TABLE `tbl_scoupon` DISABLE KEYS */;
INSERT INTO `tbl_scoupon` VALUES (1,'01JHQQ2QD5AV6P377D9C9TGYRP.svg','2025-01-17','test','123412','test',1,'asfasdf',10,'test','2025-01-16 08:38:08','2025-01-16 08:38:08');
/*!40000 ALTER TABLE `tbl_scoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setting`
--

DROP TABLE IF EXISTS `tbl_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_setting` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `webname` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `weblogo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pdboy` int NOT NULL,
  `one_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scredit` int NOT NULL,
  `rcredit` int NOT NULL,
  `gkey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehiid` int NOT NULL,
  `couvid` int NOT NULL,
  `kglimit` int NOT NULL,
  `kgprice` double(8,2) NOT NULL,
  `semail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `smobile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setting`
--

LOCK TABLES `tbl_setting` WRITE;
/*!40000 ALTER TABLE `tbl_setting` DISABLE KEYS */;
INSERT INTO `tbl_setting` VALUES (1,'Parcel','images/website/1732891470.png','Asia/Kolkata','$',100,'a0aaea91-8061-467a-a908-7f4fcef4d49b','os_v2_app_ucvovemamfdhvkiip5h455gutp6txl6jvlpeubvk2lomvh5k3aquii4tsutrzcxewj3gybs7vaeyxzc23zf65o5kjag5c3a227bbs7q','parcel','parcel',4,4,'AIzaSyBFowC-MIb5gOAKD44Tm5DEzmLTEv-aQ0g',6,6,10,15.00,'support@cscodetech.com','+917276465975',NULL,NULL);
/*!40000 ALTER TABLE `tbl_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subcat`
--

DROP TABLE IF EXISTS `tbl_subcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subcat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` bigint unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_subcat_cat_id_foreign` (`cat_id`),
  CONSTRAINT `tbl_subcat_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `tbl_pcat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subcat`
--

LOCK TABLES `tbl_subcat` WRITE;
/*!40000 ALTER TABLE `tbl_subcat` DISABLE KEYS */;
INSERT INTO `tbl_subcat` VALUES (1,2,'test sub cat',1,'2025-01-14 06:28:10','2025-01-14 06:28:10');
/*!40000 ALTER TABLE `tbl_subcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rdate` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `ccode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int DEFAULT NULL,
  `refercode` int DEFAULT NULL,
  `wallet` int DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Admin','admin@example.com','7777777777','$2a$10$ECZow80XJI634v9IIPsQ0OvsTRpxXb8WZtff8kZQinUcljaRshEiK','2025-01-25 14:30:17',1,'+91',0,NULL,0,'2025-01-13 03:07:27','tp7zNEfEiKpxNmu0EClt9JCPiiRngL5qDS5F1koecw8ebrIRZD8ZE3t9lqoQ','2025-01-13 03:07:27','2025-01-13 03:07:27'),(2,'Test','test@example.com','7777777777','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2025-01-25 14:30:17',1,'+91',0,NULL,0,'2025-01-13 03:07:27','neYQDNnr7YrEhSHLVOl0dEychNAcwg93sjHtuMkDe1hYdmzsS0lfRpYw1hw9','2025-01-13 03:07:27','2025-01-13 03:07:27'),(3,'Writer','writer@example.com','7777777777','$2y$10$IKeV.2pBNeNMXrYPqFfvpudFHPjI/bpF0RlamhdctxxigdKd9dDTu','2025-01-25 14:30:17',1,'+91',0,NULL,0,'2025-01-13 09:26:12',NULL,'2025-01-13 03:55:24','2025-01-13 03:55:24'),(4,'Moderator','moderator@example.com','7777777777','$2y$10$qAcXGyqnAAVnqHiAOoQHaemZBiPWEptwaLFUJkPMFb6o4dTDbsfE6','2025-01-25 14:30:17',1,'+91',0,NULL,0,'2025-01-13 10:10:35',NULL,'2025-01-13 04:36:26','2025-01-13 04:46:11'),(5,'merchant','merchant@example.com','9999999999','Admin@123','2025-01-28 19:54:29',1,'1',1,NULL,1,'2025-01-14 14:22:44',NULL,'2025-01-28 08:52:50','2025-01-28 08:52:50'),(6,'shop','shop@makkimasjid.com','3333333333','Admin@123','2025-01-08 20:00:16',1,'1',11,1,0,'2025-01-20 14:30:30',NULL,'2025-01-28 09:01:07','2025-01-28 09:01:07'),(7,'shop2','shop2@example.com','2222222222','$2y$10$Lteb/ve7DkH5SmVkfmgQfO4zFiPS1kHmKCYRRi04JFmLM7JCOisPW','2025-01-21 20:16:32',1,'1',1,NULL,1,'2025-01-13 15:49:38',NULL,'2025-01-28 09:16:41','2025-01-28 09:27:17'),(8,'mer','mer@ex.com','2222222222','$2y$10$piQ4qEHbH8/.niZ4.qU5rOOtStTYtmdXe.XRtd2tAl3DakXv6FUui','2025-01-19 20:43:40',1,'1',1,NULL,1,'2025-01-21 15:13:31',NULL,'2025-01-28 09:43:53','2025-01-28 09:43:53'),(9,'dev test','devtest@devtest.com','888888888','$2y$10$VtLqZxAlQ.1SlgOvDz.joudhDCN4gFSX4gbh8.aOZasIr0v1rgVc6','2025-01-30 12:49:03',1,'+91',1,NULL,0,'2025-01-30 07:19:03',NULL,'2025-01-30 07:19:03','2025-01-30 11:13:05'),(10,'Furqan A','maxjack@example.com','7767908797','$2y$10$PbZXPBfAL7tTpz6/ra.MYuNi9hGB1ytqMh7owNvJJ9ZO.k8tib.OS',NULL,1,NULL,NULL,NULL,0,'2025-01-29 08:13:13',NULL,'2025-02-01 02:47:26','2025-02-01 02:49:02');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vehicle`
--

DROP TABLE IF EXISTS `tbl_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vehicle` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ukms` int NOT NULL,
  `uprice` int NOT NULL,
  `aprice` int NOT NULL,
  `capcity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttime` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vehicle`
--

LOCK TABLES `tbl_vehicle` WRITE;
/*!40000 ALTER TABLE `tbl_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_vehicle` VALUES (1,'Twowheerler','images/banner/1732891331.png',1,'<p>test</p>',10,1,10,'4','42',10,NULL,NULL),(2,'test','01JHJ3QWXPQ956GFPK7XGY97M5.svg',1,'zdfad',5,5,5,'10','5',3,'2025-01-14 04:23:58','2025-01-14 04:23:58');
/*!40000 ALTER TABLE `tbl_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com','2025-01-13 03:07:27','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dINrtc2FywDwvWrX7GLBZhHtFO0EhetSwHoR7fQMynXheO0zTfE5YYvHxKav','2025-01-13 03:07:27','2025-01-13 03:07:27'),(2,'Test','test@example.com','2025-01-13 03:07:27','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','neYQDNnr7YrEhSHLVOl0dEychNAcwg93sjHtuMkDe1hYdmzsS0lfRpYw1hw9','2025-01-13 03:07:27','2025-01-13 03:07:27'),(3,'Writer','writer@example.com','2025-01-13 09:26:12','$2y$10$IKeV.2pBNeNMXrYPqFfvpudFHPjI/bpF0RlamhdctxxigdKd9dDTu',NULL,'2025-01-13 03:55:24','2025-01-13 03:55:24'),(4,'Moderator','moderator@example.com','2025-01-13 10:10:35','$2y$10$qAcXGyqnAAVnqHiAOoQHaemZBiPWEptwaLFUJkPMFb6o4dTDbsfE6',NULL,'2025-01-13 04:36:26','2025-01-13 04:46:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_report`
--

DROP TABLE IF EXISTS `wallet_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_report` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amt` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_report_uid_foreign` (`uid`),
  CONSTRAINT `wallet_report_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_report`
--

LOCK TABLES `wallet_report` WRITE;
/*!40000 ALTER TABLE `wallet_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_reports`
--

DROP TABLE IF EXISTS `wallet_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amt` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_reports_uid_foreign` (`uid`),
  CONSTRAINT `wallet_reports_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_reports`
--

LOCK TABLES `wallet_reports` WRITE;
/*!40000 ALTER TABLE `wallet_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `coordinates` polygon NOT NULL,
  `alias` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Nanded',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0•‰∞ù>TS@H˘cf\'3@ò\‰∞]3TS@b8ä/3@\¬\‰∞˝\¬QS@\0J*ûè(3@\ƒ\‰∞\›hSS@\Ó\‚\¬ó 3@£‰∞ΩVS@≥\ÉP{\'3@ã\‰∞(TS@A¨äs/3@•‰∞ù>TS@H˘cf\'3@','(19.153901063830663, 77.316321776149),(19.1840597521688, 77.31563513064118),(19.158441434215927, 77.27752630495759),(19.127304956989306, 77.30327551150056),(19.154225380145892, 77.34550421023103),(19.185356776243143, 77.31494848513337)',NULL,NULL),(2,'Nanded',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0•]\ŸPTZS@\rÆ\ƒ\Û\Á8@•]\ŸP4R@Õ•äa\◊7@•]\ŸP§eR@\ÊM\"∂©</@•]\ŸP|T@\r-%N C1@•]\ŸPTZS@\rÆ\ƒ\Û\Á8@','(24.906063320971942, 77.41139622904883),(23.84132430205276, 72.05006810404883),(15.618482295692248, 73.58815404154883),(17.26221168906782, 81.93776341654883)',NULL,NULL),(3,'Test Zone 1',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\01|DLâúS@±üp1@‡¢ì•÷úS@y\Ê\Â∞˚n1@\ˆ)\«dqúS@sÄ`éo1@1|DLâúS@±üp1@','(17.43754,78.44588),(17.433528,78.450601),(17.43406,78.444421)','2025-01-16 16:45:58','2025-01-16 16:45:58'),(4,'Test Zone 2',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0ãq˛&†S@Öwπà\Ôt1@\ ˝EÅ†S@2¨\‚ç\Ãs1@JA∑ó4†S@Ö∂úKqu1@ãq˛&†S@Öwπà\Ôt1@','(17.45678,78.50123),(17.45234,78.50789),(17.45876,78.50321)','2025-01-16 16:45:58','2025-01-16 16:45:58'),(5,'Test Zone 3',0,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0åmßS@∂π1=aë1@6\»$#gßS@é;•É\ıè1@aq8\Û´ßS@ƒ±.n£ë1@åmßS@∂π1=aë1@','(17.56789,78.61111),(17.56234,78.61567),(17.56890,78.61987)','2025-01-16 16:45:58','2025-01-16 16:45:58'),(6,'Test Zone',1,_binary '\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0`%\È(@\ÈüN\„\'\ÙD@\0\0\0è\Ê(@#R≠\ÙD@\0\0\0\Ë)\‰(@\…z\Ò\ﬁs\ÛD@\0\0\0X\Â(@O\ÌΩ\"<\ÛD@\0\0\0®r\Í(@\’H\'=3\ÛD@ˇˇˇ\œ\¬\Í(@~lXè\ÛD@\0\0\0xH\Í(@f\À\›ô\ÛD@ˇˇˇ\'\\\Í(@O[˝ \ı\ÛD@\0\0\00U\È(@\ÙΩ\\n\ÙD@\0\0\0`%\È(@\ÈüN\„\'\ÙD@','Vatican Area',NULL,NULL),(7,'testttt',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0öôôôôöS@ï∂∏\∆gV1@\Á\∆\ÙÑ%õS@ÀÜ5ïEU1@\Â^`V(õS@\'¬ÜßWV1@5∂◊ÇﬁöS@Qi\ƒ\Ã>W1@öôôôôöS@ï∂∏\∆gV1@','(17.337521300073,78.415625095367),(17.333092816006,78.424165248871),(17.337275275984,78.424336910248),(17.340801589753,78.419830799103),(17.340801589753,78.419830799103)','2025-01-19 06:17:00','2025-01-19 06:17:00'),(8,'hellllo',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0˘/»öS@CT\·\œ\V1@©\˜TN{õS@¥\Ã\"[U1@É¯¿éˇöS@(eRCT1@ú0a4+öS@\Œ4a˚\…T1@˘/»öS@CT\·\œ\V1@','(17.335717077292,78.420259952545),(17.338136320389,78.420774936676),(17.338136320389,78.420774936676),(17.335512055225,78.421289920807),(17.339612453054,78.418457508087),(17.33342081706,78.429400920868),(17.328541168703,78.421847820282),(17.33120653892,78.408887386322),(17.33120653892,78.408887386322)','2025-01-19 06:19:50','2025-01-19 06:19:50'),(9,'hello world',1,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0gF?\ZNìS@ \Ó\ÍUÄ1@;q9^ÅîS@dîg^1@+¶\“O8ìS@\r∆àD°}1@\Ò§ÖìS@%]3˘f1@\ÙÜ˚»≠íS@Föxx~1@AaP¶—íS@`\ ¿Å1@∑\ºTlìS@\Z\›A\ÏLÅ1@gF?\ZNìS@ \Ó\ÍUÄ1@','(17.501311382401,78.301641941071),(17.496313312016,78.320395946503),(17.490741530567,78.300311565399),(17.497665262649,78.305032253265),(17.494019069748,78.291857242584),(17.503933265991,78.29404592514),(17.505080328163,78.303487300873),(17.505080328163,78.303487300873)','2025-01-19 06:21:22','2025-01-19 06:21:22');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-02  2:01:37
