/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pre_order_baju
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `produk_id` bigint(20) unsigned NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_produk_id_foreign` (`produk_id`),
  CONSTRAINT `cart_items_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pengirim` varchar(255) DEFAULT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_design`
--

DROP TABLE IF EXISTS `custom_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_design` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `wa` varchar(30) NOT NULL,
  `ukuran` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_desain` varchar(255) DEFAULT NULL,
  `status` enum('pending','sukses','gagal') DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_design`
--

LOCK TABLES `custom_design` WRITE;
/*!40000 ALTER TABLE `custom_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_designs`
--

DROP TABLE IF EXISTS `custom_designs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_designs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `wa` varchar(30) NOT NULL,
  `ukuran` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_desain` varchar(255) DEFAULT NULL,
  `status` enum('pending','sukses','gagal') DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_designs`
--

LOCK TABLES `custom_designs` WRITE;
/*!40000 ALTER TABLE `custom_designs` DISABLE KEYS */;
INSERT INTO `custom_designs` VALUES
(1,'pants','Mentari Agustina','mentaritari253@gmail.com','081380278631','\"{\\\"lingkar_pinggang\\\":\\\"10\\\",\\\"lingkar_paha\\\":\\\"10\\\",\\\"pesak\\\":\\\"10\\\",\\\"lingkar_lutut\\\":\\\"10\\\",\\\"lingkar_kaki_bawah\\\":\\\"10\\\",\\\"panjang_celana_rok\\\":\\\"10\\\"}\"','2025-06-17 22:30:10','2025-06-17 22:30:10','storage/desain_custom/1750174210_4-removebg-preview.png','pending'),
(2,'pants','Yafi Mahadika','yafi.mahadika2@gmail.com','081380278631','\"{\\\"lingkar_pinggang\\\":\\\"10\\\",\\\"lingkar_paha\\\":\\\"10\\\",\\\"pesak\\\":\\\"10\\\",\\\"lingkar_lutut\\\":\\\"10\\\",\\\"lingkar_kaki_bawah\\\":\\\"10\\\",\\\"panjang_celana_rok\\\":\\\"10\\\"}\"','2025-06-17 22:30:48','2025-06-19 05:01:48','storage/desain_custom/1750174248_2-removebg-preview.png','sukses');
/*!40000 ALTER TABLE `custom_designs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
-- Table structure for table `keranjangs`
--

DROP TABLE IF EXISTS `keranjangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keranjangs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `produk_id` bigint(20) unsigned NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keranjangs_produk_id_foreign` (`produk_id`),
  CONSTRAINT `keranjangs_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keranjangs`
--

LOCK TABLES `keranjangs` WRITE;
/*!40000 ALTER TABLE `keranjangs` DISABLE KEYS */;
/*!40000 ALTER TABLE `keranjangs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komplain_messages`
--

DROP TABLE IF EXISTS `komplain_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `komplain_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `komplain_id` bigint(20) unsigned NOT NULL,
  `pesan` text NOT NULL,
  `pengirim` enum('pelanggan','admin') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `komplain_messages_komplain_id_foreign` (`komplain_id`),
  CONSTRAINT `komplain_messages_komplain_id_foreign` FOREIGN KEY (`komplain_id`) REFERENCES `komplains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komplain_messages`
--

LOCK TABLES `komplain_messages` WRITE;
/*!40000 ALTER TABLE `komplain_messages` DISABLE KEYS */;
INSERT INTO `komplain_messages` VALUES
(1,1,'Selamat Malam','pelanggan','2025-05-27 13:42:28','2025-05-27 13:42:28'),
(2,1,'Selamat Malam','admin','2025-05-27 17:54:29','2025-05-27 17:54:29'),
(3,2,'Selamat Malam','pelanggan','2025-05-28 05:14:13','2025-05-28 05:14:13'),
(4,2,'Selamat Malam','admin','2025-05-28 05:15:09','2025-05-28 05:15:09'),
(5,3,'yooo','pelanggan','2025-06-10 01:23:27','2025-06-10 01:23:27'),
(6,3,'hallo','admin','2025-06-10 01:23:39','2025-06-10 01:23:39'),
(7,4,'Selamat Pagi','pelanggan','2025-06-21 09:41:46','2025-06-21 09:41:46'),
(8,4,'Hallo Selamat Pagi','admin','2025-06-21 09:42:06','2025-06-21 09:42:06');
/*!40000 ALTER TABLE `komplain_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komplains`
--

DROP TABLE IF EXISTS `komplains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `komplains` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `kontak` varchar(255) NOT NULL,
  `topik` varchar(255) DEFAULT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komplains`
--

LOCK TABLES `komplains` WRITE;
/*!40000 ALTER TABLE `komplains` DISABLE KEYS */;
INSERT INTO `komplains` VALUES
(1,'Mentari Agustina','08210121212','Barang rusak','closed','2025-05-27 13:42:23','2025-05-27 17:54:51'),
(2,'Mentari Agustina','08210121212','Paket belum sampai','closed','2025-05-28 05:14:05','2025-05-28 05:15:40'),
(3,'Mentari','12345','Barang rusak','closed','2025-06-10 01:23:23','2025-06-10 01:24:04'),
(4,'Mentari','12345','Barang rusak','open','2025-06-21 09:41:40','2025-06-21 09:41:40');
/*!40000 ALTER TABLE `komplains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2025_05_17_060159_add_role_to_users_table',1),
(6,'2025_05_17_070519_update_role_column_on_users_table',1),
(7,'2025_05_17_095220_create_produks_table',1),
(8,'2025_05_17_132740_create_cart_items_table',1),
(9,'2025_05_17_135231_create_keranjangs_table',1),
(10,'2025_05_18_075724_create_transaksis_table',1),
(11,'2025_05_18_103104_add_status_to_transaksis_table',1),
(12,'2025_05_18_110734_add_serial_number_to_transaksis_table',1),
(13,'2025_05_22_191125_create_chats_table',1),
(14,'2025_05_23_092622_create_komplains_table',1),
(15,'2025_05_23_093900_create_komplain_messages_table',1),
(16,'2025_05_23_205833_add_status_to_komplains_table',1),
(17,'2025_05_23_215940_add_topik_status_to_komplains_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
-- Table structure for table `produks`
--

DROP TABLE IF EXISTS `produks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `produks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` bigint(20) unsigned NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `stock` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stock`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produks`
--

LOCK TABLES `produks` WRITE;
/*!40000 ALTER TABLE `produks` DISABLE KEYS */;
INSERT INTO `produks` VALUES
(6,'Kayla Blouse Brown','- Blouse berbahan satin\r\n- Kerah bulat\r\n- Terdapat risleting di bagian belakang\r\n- Dipermanis dengan aksen pita yang bisa diikat ke depan\r\n- Lengan panjang dengan manset satu kancing\r\n\r\nLebar Bahu x Lingkar Dada x Panjang Lengan\r\n- One size : (35 cm x 100 cm x 56 cm)',100000,'Blouse','produk/zZadlh1sUQLwRWpRDCVfUotNMF7xiw3jarMq1Cf4.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 11:05:00','2025-06-19 13:15:12'),
(7,'Kimberly Blouse Navy','Tampil chic dengan mengenakan atasan ini! Memiliki detail yang unik. Padankan dengan celana panjang palazzo dan heels serta hijab favoritmu\r\n\r\nUkuran:\r\nLebar Bahu: 50 cm\r\nLingkar Dada: 108 cm\r\nPanjang Tangan: 48 cm\r\nLingkar Pinggang: 96 cm\r\nPanjang Baju: 55-70 cm\r\n\r\nUkuran yang Dikenakan Model:\r\nSize: One Size\r\nTinggi Model: 174 cm',150000,'Blouse','produk/39zzxo7GXYCdHw4LoUCIL6yON0IqLeNO3FTteY5Q.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 11:07:27','2025-06-16 11:07:27'),
(8,'Kimberly Blouse Black','Tampil chic dengan mengenakan atasan ini! Memiliki detail yang unik. Padankan dengan celana panjang palazzo dan heels serta hijab favoritmu\r\n\r\nUkuran:\r\nLebar Bahu: 50 cm\r\nLingkar Dada: 108 cm\r\nPanjang Tangan: 48 cm\r\nLingkar Pinggang: 96 cm\r\nPanjang Baju: 55-70 cm\r\n\r\nUkuran yang Dikenakan Model:\r\nSize: One Size\r\nTinggi Model: 174 cm',150000,'Blouse','produk/qOwrkEjwUqtsBYLCCqEE7QayviCIZf1ROrsNJIwB.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 11:07:58','2025-06-16 11:07:58'),
(9,'Lucy Tunik Yellow','Lucy Tunik\r\n- Tunik bernuansa pastel\r\n- Warna kuning lemon lembut\r\n- Rempel dibagian dada\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, lingkar dada 100cm, mengenakan ukuran One size\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 100cm x 96cm x 104cm x 90cm)',175000,'Tunic','produk/qb0C4WGJQXTercyorZV6eZJrV09bWvzupW4UWxxM.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"5\",\"XL\":null,\"ALL\":null}','2025-06-16 11:09:42','2025-06-16 11:09:42'),
(10,'Rose Gallica Dress White','Satin\r\n  Warna white\r\n  Lengan panjang\r\n  Resleting belakang\r\n  Belt\r\n  Regular fit\r\n  Size XL',250000,'Dress','produk/rcCKynli32dq9EBousuc1N5VOEvAMlPuGoWV0AiL.jpg','{\"S\":null,\"M\":null,\"L\":\"1\",\"XL\":\"1\",\"ALL\":null}','2025-06-16 11:10:58','2025-06-16 11:10:58'),
(11,'Milleya Dress Black','- Dress dengan nuansa warna hitam dan motif abstrak di bagian depan baju\r\n- Leher mandarin\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material silk dengan furinng tidak transparan, ringan, dan semi stretch\r\n\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 102cm x 116cm x 140cm x 145cm)',250000,'Dress','produk/6XW9Z00J57C4IMsGlUh8X8zKqMEE9FciicQzAVgS.jpg','{\"S\":null,\"M\":null,\"L\":\"1\",\"XL\":\"1\",\"ALL\":null}','2025-06-16 11:12:51','2025-06-16 11:12:51'),
(12,'Mattana Blouse Brown','Mattana Blouse Brown – Elegan, Modis, dan Timeless\r\n\r\nTampil anggun dengan Mattana Blouse Brown, blouse dengan desain klasik yang memancarkan kesan chic dan effortless elegance. Terbuat dari material berkualitas yang nyaman dan ringan, blouse ini hadir dengan potongan longgar yang memberi kesan stylish sekaligus santun.\r\n\r\nDetail kantong depan dengan kancing full memberikan sentuhan modern utility, sementara warna cokelat lembutnya membuat blouse ini mudah dipadukan dengan berbagai outfit. Cocok untuk tampilan casual hingga semi-formal, Mattana Blouse Brown siap menjadi fashion statement favoritmu!\r\n\r\n✨ Fitur Utama:\r\n✔️ Desain elegan dengan siluet longgar\r\n✔️ Material nyaman dan breathable\r\n✔️ Kancing depan full untuk gaya versatile\r\n✔️ Warna netral yang mudah di-mix and match\r\n\r\nPadukan dengan rok feminin atau celana tailored untuk tampilan yang lebih sophisticated. Upgrade gaya harianmu dengan Mattana Blouse Brown sekarang!',175000,'Blouse','produk/MVOq8Glk7unLKBFqMSkdcDr3MWLXReqSDNyewMgv.jpg','{\"S\":null,\"M\":\"1\",\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-16 11:14:02','2025-06-16 11:14:02'),
(13,'Muthia Pearl Dress Salem','Satin\r\n Leher Bulat\r\n Muriara dibagian depan\r\n Resleting dibagian belakang\r\n Regular fit\r\n Size M L XL\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n\r\nM : 145 cm x 92-96 cm x 10-14 cm\r\nL : 146 cm x 96-100 cm x 12-16 cm\r\nXL : 146 cm x 98-102 cm x 14- 18 cm',300000,'Dress','produk/INvt2SMA5dDqlJlUTOat4QU7xqkwlC4VnL5Bfioc.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 11:16:26','2025-06-16 11:16:26'),
(14,'Ayden Pants Gray','Celana palazzo\r\n Celana Casual\r\n Regular fit\r\n 2 kantong samping\r\n Material arabian crepe\r\n Tinggi model 177cm, mengenakan ukuran One size',100000,'Pants','produk/xg4LpVph6UX1d8JX9MyQ0inciociGOZO8MxmNAZl.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"1\"}','2025-06-16 11:17:49','2025-06-16 11:17:49'),
(15,'Hoshiko Stripe Shirt Black','Hoshiko Stripe Shirt – Bold, Elegant & Artistic\r\n\r\nTampil unik dan penuh karakter dengan Hoshiko Stripe Shirt! Perpaduan motif garis vertikal yang klasik dengan sentuhan bordir burung dan bunga yang artistik menjadikan kemeja ini pilihan sempurna untuk kamu yang ingin tampil beda namun tetap elegan.\r\n\r\n✨ Detail Produk:\r\n✔ Material: Kain premium yang nyaman, adem, dan mudah disetrika.\r\n✔ Desain Eksklusif: Kombinasi motif stripe dengan bordir burung & floral yang estetik.\r\n✔ Model Kemeja: Lengan panjang dengan kancing depan, cocok untuk tampilan casual hingga semi-formal.\r\n✔ Pilihan Warna: Navy yang mewah & Black yang elegan.\r\n\r\nCocok dipadukan dengan celana jeans atau rok untuk tampilan chic dan modis! Yuk, upgrade gaya fashion kamu dengan Hoshiko Stripe Shirt dan jadilah pusat perhatian!',1000000,'Shirt','produk/BTGCVEs3SZSvDfeRFKWibvNfPu9G41Sa9gqfBYSZ.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 11:20:43','2025-06-16 11:20:43'),
(16,'Hoshiko Stripe Shirt Navy','Hoshiko Stripe Shirt – Bold, Elegant & Artistic\r\n\r\nTampil unik dan penuh karakter dengan Hoshiko Stripe Shirt! Perpaduan motif garis vertikal yang klasik dengan sentuhan bordir burung dan bunga yang artistik menjadikan kemeja ini pilihan sempurna untuk kamu yang ingin tampil beda namun tetap elegan.\r\n\r\n✨ Detail Produk:\r\n✔ Material: Kain premium yang nyaman, adem, dan mudah disetrika.\r\n✔ Desain Eksklusif: Kombinasi motif stripe dengan bordir burung & floral yang estetik.\r\n✔ Model Kemeja: Lengan panjang dengan kancing depan, cocok untuk tampilan casual hingga semi-formal.\r\n✔ Pilihan Warna: Navy yang mewah & Black yang elegan.\r\n\r\nCocok dipadukan dengan celana jeans atau rok untuk tampilan chic dan modis! Yuk, upgrade gaya fashion kamu dengan Hoshiko Stripe Shirt dan jadilah pusat perhatian!',1000000,'Shirt','produk/RYoPxFuuEOrH3NUFRlMZK6Lxubb9OWdnfOcRALMy.jpg','{\"S\":null,\"M\":\"4\",\"L\":null,\"XL\":null,\"ALL\":null}','2025-06-16 11:21:18','2025-06-16 11:21:18'),
(17,'Mikha Ruffle One Set Brown','Mikha Ruffle One Set Brown – Feminine & Chic in One Look!\r\n\r\nTampil anggun dengan sentuhan ruffle yang elegan! Mikha Ruffle One Set Brown hadir dengan desain modern yang memberikan kesan stylish namun tetap nyaman untuk berbagai aktivitas.\r\n\r\n✨ Detail Produk:\r\n✔ Material: Kain premium yang lembut, adem, dan nyaman dipakai sepanjang hari.\r\n✔ Desain Unik: Kemeja lengan panjang dengan aksen ruffle di bahu, menciptakan tampilan yang feminin dan fashionable.\r\n✔ Bawahan: Celana panjang berpotongan lurus yang memberikan efek ramping dan elegan.\r\n✔ Warna: Brown – hangat, natural, dan mudah dipadukan dengan berbagai aksesori.\r\n\r\nCocok untuk gaya casual, office look, hingga acara spesial. Yuk, upgrade gaya fashion-mu dengan Mikha Ruffle One Set Brown dan tampil memukau di setiap kesempatan!',650000,'One Set','produk/7dwt4zdbPJ6Bt3VL1bRNt449TMk1BKwPd0DrlaGX.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 11:22:13','2025-06-16 11:22:13'),
(18,'Erisa One Set Brown','Erisa One Set – Simplicity with Elegance\r\n\r\nHadir dengan desain minimalis namun tetap elegan, Erisa One Set siap menjadi pilihan outfit favoritmu! Tersedia dalam dua warna klasik, Brown yang hangat dan Navy yang mewah, setelan ini memancarkan pesona feminin yang anggun.\r\n\r\n✨ Detail Produk:\r\n✔ Material: Kain premium yang lembut dan adem, nyaman digunakan sepanjang hari.\r\n✔ Desain Eksklusif: Kemeja lengan panjang dengan aksen ruffle di bagian depan dan detail bunga yang mempercantik tampilan.\r\n✔ Bawahan: Celana panjang berpotongan lurus yang memberikan kesan ramping dan elegan.\r\n✔ Pilihan Warna: Brown – natural dan hangat | Navy – elegan dan berkelas.\r\n\r\nCocok untuk gaya casual chic hingga semi-formal! Padukan dengan aksesori favoritmu dan tampil effortlessly stylish dengan Erisa One Set.',550000,'One Set','produk/oon8J07c1Ru4A5ljEhkVV9te1B8O96lBHKqetJdc.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"7\"}','2025-06-16 11:26:53','2025-06-16 11:26:53'),
(20,'Daisy Shirt Navy One Set','Daisy Shirt Navy One Set – Elegan & Nyaman untuk Segala Kesempatan\r\n\r\nTampil anggun dan stylish dengan Daisy Shirt Navy One Set! Setelan bernuansa navy yang mewah ini menghadirkan sentuhan klasik dengan detail bordir bunga daisy yang cantik dan menawan.\r\n\r\n✨ Detail Produk:\r\n✔ Material: Kain premium yang nyaman dan ringan, cocok untuk aktivitas sehari-hari maupun acara spesial.\r\n✔ Desain: Kemeja lengan panjang dengan kancing depan serta bordir bunga yang mempermanis tampilan.\r\n✔ Bawahan: Celana panjang berpotongan lurus yang memberikan kesan elegan dan effortless.\r\n✔ Warna: Navy deep yang mewah dan mudah dipadukan dengan berbagai aksesori.\r\n\r\nSempurna untuk tampilan semi-formal maupun casual chic! Yuk, lengkapi koleksi fashion kamu dengan Daisy Shirt Navy One Set dan tampil percaya diri di setiap momen!',1250000,'One Set','produk/eMkipkoAxNhDVpmAGqrqFlCfoiTKNjkAyrXIm3aM.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 11:30:32','2025-06-16 11:30:51'),
(21,'Lalita Pavlin Shirt Black','Nikmati sentuhan elegan dalam setiap momen dengan Lalita Pavlin Shirt. Dibuat dari bahan katun premium yang lembut dan nyaman, kemeja ini dirancang untuk memberikan tampilan mewah sekaligus menjaga kenyamanan Anda sepanjang hari.\r\n\r\nDetail bordir burung bangau yang anggun dihiasi bunga-bunga indah menambah kesan artistik dan memukau di bagian depan dan belakang. Potongan klasik yang dikombinasikan dengan desain modern membuatnya sempurna untuk acara formal maupun santai.\r\n\r\nTampil percaya diri dan penuh gaya dengan Lalita Pavlin Shirt, pilihan sempurna untuk Anda yang menghargai keindahan dan kualitas terbaik.\r\n\r\n*Size : All size (LD = 98-104 CM)*',1250000,'Shirt','produk/rfqqcf4oZqfKTcbhN6mAB9spyRd7fzTRC66FHc5y.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 11:32:15','2025-06-16 11:32:15'),
(22,'Chrysant Shirt Hijau Olive','Tampil memukau dengan sentuhan elegan dan modern dari Chrysant Shirt. Baju ini menghadirkan nuansa klasik dalam warna hijau zaitun yang berpadu sempurna dengan bordir bunga chrysan biru gelap, menciptakan kesan eksklusif dan artistik.\r\n\r\nDesainnya memadukan kenyamanan dan gaya dengan potongan longgar, detail saku depan yang praktis, serta kancing yang memperkuat tampilan minimalis namun tetap fashionable. Cocok dikenakan untuk acara formal maupun semi-casual, memberikan Anda kepercayaan diri dalam setiap langkah.\r\n\r\nHadirkan pesona elegan dan jadilah pusat perhatian dengan Chrysant Shirt dari Bellybee!',850000,'Shirt','produk/W4Xt2rgoHghVSuzmYWRYnY2ZCc7eZ251qzRMMg9y.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 11:33:38','2025-06-16 11:33:38'),
(23,'Chriysant Shirt Navy Elegance','Ciptakan kesan anggun dan percaya diri dengan Chrysant Shirt berwarna biru navy yang memukau. Dihiasi bordir bunga chrysan berwarna putih yang kontras, desain ini memancarkan keindahan klasik dengan sentuhan modern.\r\n\r\nDetail kancing depan yang rapi serta potongan lengan panjang menjadikan baju ini pilihan sempurna untuk berbagai suasana, baik formal maupun semi-formal. Terdapat saku praktis di bagian dada, menambah kesan stylish sekaligus fungsional.\r\n\r\nPadukan dengan celana favorit Anda untuk tampilan elegan dan effortless. Chrysant Shirt by Bellybee, pilihan sempurna untuk Anda yang ingin tampil beda dan berkelas!\r\n\r\nSize : All Size LD 104 cm',850000,'Shirt','produk/hFqGfRWHNNsnWlEmkArZTpGKR2pKmwf1bnz3SorZ.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 11:35:32','2025-06-16 11:35:32'),
(24,'Eliana Zetta One Set White','Eliana Zetta One Set produk terbaru dari Bellybee dengan model yang casula dan elegan. Dengan bahan katun premium yang dingin dan nyaman di pakai sehari-hari dan juga terdapat aksen bordir bunga yang mempercantikan tampilan pada saat di kenakan. Cocok di kenakan pada saat acara formal maupun non formal.\r\n\r\nUkuran All Size \r\nLD = 104 Cm',1250000,'One Set','produk/UIabmWJSgtFuy2dHBTdvo9DFWRTI5ecRvRJPjBg4.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"6\"}','2025-06-16 11:37:37','2025-06-16 11:37:37'),
(25,'Eliana Zetta One Set Black','Eliana Zetta One Set produk terbaru dari Bellybee dengan model yang casula dan elegan. Dengan bahan katun premium yang dingin dan nyaman di pakai sehari-hari dan juga terdapat aksen bordir bunga yang mempercantikan tampilan pada saat di kenakan. Cocok di kenakan pada saat acara formal maupun non formal.\r\n\r\nUkuran All Size \r\nLD = 104 Cm',1250000,'One Set','produk/LikwWdtFwiLFITxayjENOoNcPyBuPiAXSM0w7ndo.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 11:40:23','2025-06-16 11:40:23'),
(26,'Phoenix Stripe Shirt Coklat','Atasan kemeja casual dengan detail :\r\n\r\n- Bordir burung di bagian kiri depan.\r\n-Bahan katun yang ringan dan nyaman di pakai\r\n- Terdapat bordir daun di bagian lengan kiri\r\n- Bisa dipadukan dengan celana jeans dan juga rok, membuat penampilan lebih menarik dan elegan.',850000,'Shirt','produk/S0tWnsYcr0lFWfWq0kF5HWslJJKpjqqItZvGlOGJ.jpg','{\"S\":null,\"M\":\"1\",\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 11:41:28','2025-06-16 11:41:28'),
(27,'Bellis Gardenia Tunik Black','- Tunik dengan bahan katun yang nyaman di pakai.\r\n- Terdapat bordir bunga di bagian kiri depan.\r\n- Di lengkapi dengan ikat pinggang (gesper) yang membuat kesan feminim pada saat di pakai.\r\n- Dengan design casual cocok di kenakan pada saat acara formal maupun non formal.\r\n- Terdapat saku (kantong) di bagian kanan dan kiri.\r\n- Wudhu friendly karena terdapat kancing di bagian lengan.\r\n- Cocok di padukan dengan jenas maupun legging bagi yang berhijab.',850000,'Tunic','produk/8UvPwyqHFR6OgvdV5peL0UG36UbVbKlKxiWgyJbl.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 11:42:35','2025-06-16 11:42:35'),
(28,'Ciara Bloom Dress Brown','Dress cantik dengan hiasan payet di bagian kerah dan terdapat bordir payet yang cantik. Dengan desigen yang elegan semakin mempercantik penampilan. Bisa di gunakan di berbagai acara formal maupun non formal. Bahan yang adem dan nyaman di pakai seharian, serta wudhu friendly buat yang berhijab. Terdapat juga zipper di bagian belakang yang mempermudah kita untuk memakainya.\r\n\r\nLingkar Dada x Panjang\r\n\r\nM : 94 cm - 96 cm x 140 cm\r\nL  : 99 cm - 101 cm x 140 cm\r\nXL : 104 cm - 106 cm x 140 cm\r\n\r\n*untuk ukuran bisa berbeda 2-3cm, karena pengukuran diamil secara manual.',1750000,'Dress','produk/wAMn13OrVkmUb5PLs9BrKe8Y6qBqCEsTh1X2GvCZ.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"1\",\"XL\":null,\"ALL\":null}','2025-06-16 11:45:53','2025-06-16 11:45:53'),
(29,'Phoenix Stripe Shirt Navy','Atasan kemeja casual dengan detail :\r\n\r\n- Bordir burung di bagian kiri depan.\r\n- Bahan katun yang ringan dan nyaman di pakai\r\n- Terdapat bordir daun di bagian lengan kiri\r\n- Bisa dipadukan dengan celana jeans dan juga rok, membuat penampilan lebih menarik dan elegan.',850000,'Shirt','produk/mtQTHsEzRwSrxqgluaGD3MxQyGIxFVAZJG2yyfhM.jpg','{\"S\":null,\"M\":\"1\",\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 11:49:41','2025-06-16 11:49:41'),
(30,'Rosemarry Flower One Set Navy','Satu set baju semi casual yang cantik, dengan detail :\r\n\r\nUntuk atasan :\r\n- Terdapat rempel di bagian kerah dan juga lengan yang membuat look manis saat di pakai.\r\n- Dengan bordir bunga full di bagian depan membuat penampilan semkain cantik \r\n- Lengan atas model puffy\r\n- Di bagian depan terdapat kancing hidup yang mempermudah kita untuk memakainya.\r\n- Cocok di pakai untuk acara formal maupun non formal.\r\n- Wudhu friendly karena di bagian lengan terdapat karet.\r\n\r\nUntuk Bawahan :\r\n- Di bagian pinggang celana terdapat karet yang bisa menyesuaikan bentuk pinggang.\r\n- Celana model cutbray, yang akan membuat kita terlihat langsing dan modis saat di pakai.\r\n- Di bagian celana terdapat ziper yang mempermudah kita untuk memakainya.',1500000,'One Set','produk/bJgSmGmFyGHf1URo201gj3MER4AZKQmPwZeVown0.jpg','{\"S\":null,\"M\":null,\"L\":\"1\",\"XL\":\"1\",\"ALL\":\"2\"}','2025-06-16 11:51:01','2025-06-16 11:51:01'),
(31,'Lamia Ivy Bloom Kaftan Soft Purple','Bellybee menghadirkan produk kaftan edisi lebaran yang sangat elegan. Dengan bahan yang ringan dan dingin, sangat nyaman di pakai seharian dan juga beribadah. Terdapat bordir bunga di bagian depan dan di hiasi payet yang mempercantik tampilan pada saat di pakai. Lalu, terdapat gesper untuk  lebih mempercantik penampilan.',1125000,'Dress','produk/4lSSlD3QtizWPpGjNyNMutweyWdyLY2ja1xvTSSB.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"1\"}','2025-06-16 11:52:18','2025-06-16 11:52:18'),
(32,'Bellis Gardenia Tunik Navy','- Tunik dengan bahan katun yang nyaman di pakai.\r\n- Terdapat bordir bunga di bagian kiri depan.\r\n- Di lengkapi dengan ikat pinggang (gesper) yang membuat kesan feminim pada saat di pakai.\r\n- Dengan design casual cocok di kenakan pada saat acara formal maupun non formal.\r\n- Terdapat saku (kantong) di bagian kanan dan kiri.\r\n- Wudhu friendly karena terdapat kancing di bagian lengan.\r\n- Cocok di padukan dengan jenas maupun legging bagi yang berhijab.',850000,'Tunic','produk/oJnGuoZvVZGqYPkmHZ1L8rxONaqarMx9TjHieNO6.jpg','{\"S\":null,\"M\":\"1\",\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 11:53:42','2025-06-16 11:53:42'),
(33,'Rosemarry Flower One Set Coklat','Satu set baju semi casual yang cantik, dengan detail :\r\n\r\nUntuk atasan :\r\n- Terdapat rempel di bagian kerah dan juga lengan yang membuat look manis saat di pakai.\r\n- Dengan bordir bunga full di bagian depan membuat penampilan semkain cantik \r\n- Lengan atas model puffy\r\n- Di bagian depan terdapat kancing hidup yang mempermudah kita untuk memakainya.\r\n- Cocok di pakai untuk acara formal maupun non formal.\r\n- Wudhu friendly karena di bagian lengan terdapat karet.\r\n\r\nUntuk Bawahan :\r\n- Di bagian pinggang celana terdapat karet yang bisa menyesuaikan bentuk pinggang.\r\n- Celana model cutbray, yang akan membuat kita terlihat langsing dan modis saat di pakai.\r\n- Di bagian celana terdapat ziper yang mempermudah kita untuk memakainya.',1500000,'One Set','produk/UNpSt2y7sXzUq4XnvsTaCfXKakQcNnpp8oXOBBOo.jpg','{\"S\":null,\"M\":null,\"L\":\"1\",\"XL\":null,\"ALL\":\"2\"}','2025-06-16 11:59:37','2025-06-16 11:59:37'),
(34,'Lamia Ivy Bloom Kaftan White','Bellybee menghadirkan produk kaftan edisi lebaran yang sangat elegan. Dengan bahan yang ringan dan dingin, sangat nyaman di pakai seharian dan juga beribadah. Terdapat bordir bunga di bagian depan dan di hiasi payet yang mempercantik tampilan pada saat di pakai. Lalu, terdapat gesper untuk  lebih mempercantik penampilan',1250000,'Dress','produk/4mqxTdzYp4yOtDhj6pd1lQvubY4DETGxPjcyKBH8.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 12:01:12','2025-06-16 12:01:12'),
(35,'Bellis Gardenia Tunik Coklat','- Tunik dengan bahan katun yang nyaman di pakai.\r\n- Terdapat bordir bunga di bagian kiri depan.\r\n- Di lengkapi dengan ikat pinggang (gesper) yang membuat kesan feminim pada saat di pakai.\r\n- Dengan design casual cocok di kenakan pada saat acara formal maupun non formal.\r\n- Terdapat saku (kantong) di bagian kanan dan kiri.\r\n- Wudhu friendly karena terdapat kancing di bagian lengan.\r\n- Cocok di padukan dengan jenas maupun legging bagi yang berhijab.',850000,'Tunic','produk/V69TFnegN4dtutx13iKDBuj0EreVlSlYqVv5sILN.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"6\"}','2025-06-16 12:02:31','2025-06-16 12:06:33'),
(36,'Lamia Ivy Bloom Kaftan Sage','Bellybee menghadirkan produk kaftan edisi lebaran yang sangat elegan. Dengan bahan yang ringan dan dingin, sangat nyaman di pakai seharian dan juga beribadah. Terdapat bordir bunga di bagian depan dan di hiasi payet yang mempercantik tampilan pada saat di pakai. Lalu, terdapat gesper untuk  lebih mempercantik penampilan.',1250000,'Dress','produk/sos28av3UWgeRVNKWXjoFFN3JhJTohx8quTH3RgG.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 12:03:34','2025-06-16 12:03:34'),
(37,'Ciara Bloom Dress Pink','Dress cantik dengan hiasan payet di bagian kerah dan terdapat bordir payet yang cantik. Dengan desigen yang elegan semakin mempercantik penampilan. Bisa di gunakan di berbagai acara formal maupun non formal. Bahan yang adem dan nyaman di pakai seharian, serta wudhu friendly buat yang berhijab. Terdapat juga zipper di bagian belakang yang mempermudah kita untuk memakainya.\r\n\r\nJangan cuci mesin, Jangan di peras, Gosok dengan suhu rendah, Jangan gunakan pemutih.\r\n\r\nLingkar Dada x Panjang\r\n\r\nM : 94 cm - 96 cm x 140 cm\r\nXL : 104 cm - 106 cm x 140 cm\r\n\r\n*untuk ukuran bisa berbeda 2-3cm, karena pengukuran diamil secara manual.',1750000,'Dress','produk/H2v8kVfeClhx5tMcsxUIrXodMuygxgKteLZk2hYq.jpg','{\"S\":null,\"M\":\"1\",\"L\":null,\"XL\":\"1\",\"ALL\":null}','2025-06-16 12:04:45','2025-06-16 12:04:45'),
(38,'Ciara Bloom Dress White','Dress cantik dengan hiasan payet di bagian kerah dan terdapat bordir payet yang cantik. Dengan desigen yang elegan semakin mempercantik penampilan. Bisa di gunakan di berbagai acara formal maupun non formal. Bahan yang adem dan nyaman di pakai seharian, serta wudhu friendly buat yang berhijab. Terdapat juga zipper di bagian belakang yang mempermudah kita untuk memakainya.\r\n\r\nJangan cuci mesin, Jangan di peras, Gosok dengan suhu rendah, Jangan gunakan pemutih.\r\n\r\nLingkar Dada x Panjang\r\n\r\nM : 94 cm - 96 cm x 140 cm\r\n\r\n*untuk ukuran bisa berbeda 2-3cm, karena pengukuran diamil secara manual.',1750000,'Dress','produk/xJRYPTWmYqUnxKkfMgyWxoQ4ESotC4Lwwyi9tGzb.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 12:06:14','2025-06-16 12:06:14'),
(39,'Audrey Flower Set','Audrey Flower Set Dress Broken White dengan Motif Bunga timbul dengan di padukan kain katun toyobo premium, dapat di padukan heels untuk tampilan yang chic dan menawan.\r\n\r\nDetail Atasan :\r\n- Material Katun Toyobo Premium\r\n- Motif Bunga timbul \r\n- Kerah Turtle Neck \r\n- Regular fit\r\n\r\nDetail bawahan :\r\n-Regular fit\r\n-Terdapat ornamen pita hidup di kedua sisi celana\r\n-Material Katun Toyobo Premium',875000,'One Set','produk/IB0pxzSmfyA8hnRWYem18KVdNETk7mIVcnlQpy01.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-16 12:12:12','2025-06-16 12:12:12'),
(40,'Alisha Series Scarf Brown Ethnic','-100% Premium Cotton Voal\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/1fJN6Rh2yn0lCdBKCER988C5TbEA9fDGhFu5YWE7.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 14:10:27','2025-06-16 14:10:27'),
(41,'Alisha Series Scarf Mint Green Ethnic','-100% Premium Cotton Voal\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/oaoUtITbvC8SAmnlfsTzzN8zBQ6L7KZDl0Oelqd6.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 14:13:26','2025-06-16 14:13:26'),
(42,'Alisha Series Scarf Space','-100% Premium Satin Voal\r\n- Free Masker dengan motif senada\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan satin lembut, namun jenis yang tidak licin \r\n- Bahan Dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/P7nRa99vCHYW6YKy8op0nkygDX95YyDu9rumWoWG.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"6\"}','2025-06-16 14:14:36','2025-06-16 14:14:36'),
(43,'Alisha Series Scarf Blush Flower','-100% Premium Satin Voal\r\n- Free Masker dengan motif senada\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan satin lembut, namun jenis yang tidak licin \r\n- Bahan Dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/42CE1ZtbptqDhFcfyvdc0stcXmwl5Qjuq9WnvxKx.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 14:16:32','2025-06-16 14:16:32'),
(44,'Alisha Series Scarf Maroon Ethnic','-100% Premium Cotton Voal\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan cotton voal yang lembut, dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/QLlnyXHgGDVaoI3DDf4KrK9hOqQ22waxP0arKYb1.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 14:17:38','2025-06-16 14:17:38'),
(45,'Jasmine Dress White','Jasmine Flower Dress Broken White dengan Motif Bunga timbul dengan di padukan kain katun toyobo premium, dapat di padukan heels untuk tampilan yang chic dan menawan\r\n-Dilengkapi dengan ikat pinggang yang menambahkan kesan elegant\r\n\r\n\r\nSpesifikasi Produk\r\n- Material Katun Toyobo Premium\r\n- Motif Bunga timbul \r\n- Kerah Turtle Neck',1000000,'Dress','produk/9pMuS5lmMZApZQsUdkGPjNuVRC2IU485RtJ89hfe.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"1\",\"XL\":null,\"ALL\":null}','2025-06-16 14:20:02','2025-06-16 14:20:02'),
(46,'Ameena Sweet Dress','- Dress Polos dengan Warna Broken White yang Cantik\r\n- Dengan Aksen Renda dibagian Kerah Baju\r\n- Regular fit\r\n- Terdapat dua kantong dibagian Depan\r\n- Kancing Depan\r\n- Material satin tidak transparan, ringan, dan semi stretch',875000,'Dress','produk/LQjLbFZf4uAYIMZkMSekdwUuApZp6SHNxXLHntzS.jpg','{\"S\":null,\"M\":\"5\",\"L\":\"1\",\"XL\":null,\"ALL\":null}','2025-06-16 14:21:26','2025-06-16 14:21:26'),
(47,'Shabilla Dress Salem','Katun Toyobo\r\n Kancing Depan\r\n Kerah Kemeja\r\n Belt\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n M : 145 cm x 92-96 cm x 10-14 cm\r\n L : 146 cm x 96-100 cm x 12-16 cm\r\n XL : 148 cm x 98-102 cm x 14- 18 cm',200000,'Dress','produk/AHerKdnD0BapVc6vm1qF3g8bCCed4PKQ5X3h8rLX.jpg','{\"S\":null,\"M\":null,\"L\":\"5\",\"XL\":null,\"ALL\":null}','2025-06-16 14:24:50','2025-06-16 14:25:52'),
(48,'Shabilla Dress Pink','Katun Toyobo\r\n Kancing Depan\r\n Kerah Kemeja\r\n Belt\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n M : 145 cm x 92-96 cm x 10-14 cm\r\n L : 146 cm x 96-100 cm x 12-16 cm\r\n XL : 148 cm x 98-102 cm x 14- 18 cm',200000,'Dress','produk/PXPrNkwI5h0pasPgdDCnmn0DsKa3QahTSfAnaIRa.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 14:25:39','2025-06-16 14:25:39'),
(49,'Erendira Blouse White','Lebar Bahu x Lingkar Dada x Panjang Lengan\r\n- M : (34 cm x 96 cm x 56 cm )\r\n- L : (35 cm x 100 cm x 56 cm)\r\n- XL : (36 cm x 104 cm x 56 cm)',150000,'Blouse','produk/6iMMuAetuQlpr5wMfkfYdVBygZ1QJ4YWQWJo4DaS.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 14:28:47','2025-06-16 14:28:47'),
(50,'Erendira Blouse Black','Lebar Bahu x Lingkar Dada x Panjang Lengan\r\n- M : (34 cm x 96 cm x 56 cm )\r\n- L : (35 cm x 100 cm x 56 cm)\r\n- XL : (36 cm x 104 cm x 56 cm)',150000,'Blouse','produk/Cy1KF625jexRuXQ5JRxmh3z7Nxrth7HnVY25c9rs.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-16 14:29:35','2025-06-16 14:29:35'),
(51,'Chia Bloom Tunik Dustypink','Keterangan\r\n- Tunik detail panel brokat dengan mutiara\r\n- Warna dove\r\n- Kerah bulat\r\n- Payet\r\n- Regular fit\r\n- Zipper belakang\r\n- Material Lace, tidak transparan, ringan dan tidak stretch\r\n\r\n\r\nPanjang lengan xLebar dada x Lebar pinggang x Lebar pinggul x Panjang\r\n- One size (56cm x 100cm x 102cm x 135cm)',1500000,'Tunic','produk/Bn0Obz4Q5PzW55dkY7xbJSXMmNaem5NDvStPNZSq.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 14:31:34','2025-06-16 14:31:34'),
(52,'Black Luxe Tunic','- Tunik becasual\r\n- Warna hitam\r\n- Kerah kemeja\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Material cotton tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, lingkar dada 100cm, mengenakan ukuran One size',465000,'Tunic','produk/UinD0bnRru8xShE5YtZgB6QmvkuEULw77i4xsuiZ.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 14:33:05','2025-06-16 14:33:05'),
(53,'Shafa Dress Maroon','- Dress polos dengan nuansa warna dark\r\n- Kerut dibagian dada\r\n- Kerah mandarin\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan semi stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 102cm x 116cm x 140cm x 145cm)',250000,'Dress','produk/oHGqs9IgMzcfqlsyMAcqDgEhiiyvRkGrEZr7TFYS.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 14:35:51','2025-06-16 14:35:51'),
(54,'Shafa Dress Navy','- Dress polos dengan nuansa warna dark\r\n- Kerut dibagian dada\r\n- Kerah mandarin\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan semi stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 102cm x 116cm x 140cm x 145cm)',250000,'Dress','produk/2wxhuXHqo88wrzfCayogiD4DLYD2jGcG42MBhLys.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 14:40:12','2025-06-16 14:40:12'),
(55,'Shafa Dress Navy Army','- Dress polos dengan nuansa warna dark\r\n- Kerut dibagian dada\r\n- Kerah mandarin\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan semi stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 102cm x 116cm x 140cm x 145cm)',250000,'Dress','produk/hHa8cDzWsbJl98e5LjoEHuESdK4Wr8kF2SvrGSMo.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 14:41:04','2025-06-16 14:41:04'),
(56,'Signature Premium Scarf Leaf Mint','-100% Premium Ultra Fine Voal\r\n- Lasercut\r\n-Bahan voal kualitas tertinggi di kelasnya\r\n-Design Digital Print Exclusive\r\n-Bahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah\r\n-For your daily and special event\r\n- 110 cm x 110 cm',289000,'Hijab','produk/McWrpvdNd5kyhz2X88cKW7KzWieEu5QkiRETubZR.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 14:42:32','2025-06-16 14:42:32'),
(57,'Aisyah Prayer Set Orange','Keterangan\r\nSet mukena berwarna pastel yang lembut\r\n\r\nDetail atasan:\r\n- Warna pink\r\n- Regular fit\r\n- Bordir dan payet\r\n- Material satin silk tidak transparan, ringan, dan tidak stretch\r\n- Kerah bulat\r\n- Zipper\r\n\r\nDetail bawahan:\r\n- Warna purple\r\n- Regular fit\r\n- Karet pinggang elastis\r\n- Termasuk tas\r\n- Material satin silk tidak transparan, ringan, dan tidak stretch',1500000,'Prayer Set','produk/7AlsQycx247T1UMnj8VZxAKM99Z0LC9nU1r9IisN.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 14:43:51','2025-06-16 14:43:51'),
(58,'Rayana Set White','Kombinasi brukat di bagian atas\r\n Unlined\r\n Regular fit\r\n Resleting belakang\r\n Material katun tidak transparan, ringan, dan tidak stretch\r\n\r\nDetail bawahan:\r\n Warna broken white\r\n Regular fit\r\n Karet pinggang elastis, kancing dan resleting depan\r\n 2 kantong depan\r\n Material katun tidak transparan, ringan, dan tidak stretch\r\n Tinggi model 176cm, mengenakan ukuran M\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n M (92 cm x 12 cm x 90 cm)\r\n L (98 cm x 12 cm x 90 cm)\r\n XL (104 cm x 13 cm x 90 cm)',850000,'One Set','produk/74AnwBToUJiWegoVS85mJnFWeMlXnFArohjK1gc9.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"1\",\"XL\":null,\"ALL\":null}','2025-06-16 14:48:34','2025-06-18 14:34:01'),
(59,'Elousie Tunik Khaky','- Tunik becasual\r\n- Kerah lipat\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 90 cm)\r\n- L (98 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',150000,'Tunic','produk/fNMjzdi0dAAb0U4acaodHh2VhGFxF4PAAmxuTAYf.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 14:49:47','2025-06-16 14:49:47'),
(60,'Jenie Kulot Pants Black','- Celana kulot bernuansa monokrom untuk daily look\r\n- Warna hitam\r\n- High rise\r\n- Regular fit\r\n- Kancing dan resleting depan\r\n- Material satin silk tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M\r\n\r\n\r\nLingkar Pinggang x Panjang Badan:\r\n- M (86 cm x 105 cm)\r\n- L (90 cm x 105 cm)\r\n- XL (100 cm x 105 cm',150000,'Pants','produk/rSy8RRNY64zCJkVSbyXRxYfDwEUr5g2i6BVwIU66.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:04:49','2025-06-16 15:04:49'),
(61,'Elousie Tunic Latte','- Tunik casual\r\n- Kerah lipat\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan nyaman\r\n- Warna Latte\r\n\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 90 cm)\r\n- L (98 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',150000,'Tunic','produk/xxY4EYuzMHlS7ePb9AwYTTpJZ3VyXZs9jzDcQ9bo.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-16 15:06:07','2025-06-16 15:06:07'),
(62,'Louisa Blouse Pink','Blouse casual\r\nKerah V\r\nRegular fit\r\nKancing depan\r\nMaterial katun\r\nTinggi model 176cm, mengenakan ukuran M\r\n\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang\r\nM (72cm x 69cm x 122cm x 108cm)\r\nL (73cm x 70cm x 126cm x 112cm)',125000,'Blouse','produk/Grmvv7WljDhxZ9jA1X3RYm8Qa2CL8c1jqtds9AoU.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 15:06:57','2025-06-16 15:06:57'),
(63,'Luna Blouse Black','Solid tone puff sleeves top with tie detail on cuff\r\nUnlined\r\nV-neckline\r\nRegular fit\r\nLong sleeves\r\nSatin',100000,'Blouse','produk/bUkW5tfHcB6IsQcLeWCIVKOA2HY2NVRusd8vTFhg.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 15:07:52','2025-06-16 15:07:52'),
(64,'Elsa Bloom Tunik Green Mint','Keterangan\r\n- Tunik detail lace\r\n- Kerah shanghai\r\n- Payet dibagian leher\r\n- Regular fit\r\n- Zipper belakang\r\n- Material Lace, tidak transparan, ringan dan tidak stretch',1500000,'Tunic','produk/fta71ui3SzNa71COOimeJMOM7EDB3qfg4manVryF.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:09:01','2025-06-16 15:09:01'),
(65,'Amelia Blouse Baby Blue','- Blouse yang didesain simple namun unik dan cantik\r\n- Bentuk leher oval dengan aksen kerah yang manis\r\n- Risleting belakang\r\n- Terdapat tali yang dapat diikat di belakang\r\n- Lengan 3/4\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Tangan x Lingkar Pinggang x Panjang Baju\r\nOne Size (108cm x 50cm x 48cm x 96cm x 55-70cm)',75000,'Blouse','produk/XvEKrb8PTB9MXaGohCMrBNduglt7ovm1mJZzQjVf.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:09:53','2025-06-16 15:09:53'),
(66,'Aleyna Dress Pink','Dress cantik untuk gaya berhijabmu. Dress dengan nuansa warna putih dengan kancing dibagian depan.\r\n\r\nPanjang lengan x Lingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n\r\n  M (55.2cm x 90.2cm x 92-96cm x 98.4cm x 145cm)\r\n  L (55.9cm x 95.2cm x 98-100cm x 103.6cm x 146cm)\r\n  XL (56.5cm x 100.4cm x 104cm x 108.6cm x 146cm)',250000,'Dress','produk/OLtcfgL6BJpItBLZvzzCEDffswxosbMJU2zP1dv3.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:11:27','2025-06-16 15:11:27'),
(67,'Chairil Dress','Satin kombinasi Lace\r\n  Leher Kerah Mandarin\r\n  Ruffle dibagian depan\r\n  Resleting dibagian belakang\r\n  Regular fit\r\n\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\nOne Size : 145 cm x 96-100 cm x 12-16 cm',250000,'Dress','produk/YFC7m5bmoOWnmH2OITUoocBe2yfA8Exl39RZpydy.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"3\",\"XL\":\"1\",\"ALL\":null}','2025-06-16 15:12:55','2025-06-16 15:12:55'),
(68,'Ashley Dress Orange','Tunik lace dengan kombinasi rok satin orange dengan kancing bagian depan , tampil canti dengan Ashley Dress.\r\n\r\nPanjang baju 140 cm\r\nLingkar dada 95 cm\r\nLingkar pinggang 90 cm\r\nPanjang tangan 55 cm',250000,'Dress','produk/SwDjmV0Ng55iMKb9AFAurrZjrpCVVo7MfKsyh18v.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 15:13:55','2025-06-16 15:57:24'),
(69,'Zendaya Blouse Salem','Berbahan Satin dengan vareasi Kerah di leher yang unik dan elegant \r\n\r\n\r\nUkuran:\r\nLebar Bahu: 50 cm\r\nLingkar Dada: 108 cm\r\nPanjang Tangan: 48 cm\r\nLingkar Pinggang: 96 cm\r\nPanjang Baju: 55-70 cm\r\n\r\nUkuran yang Dikenakan Model:\r\nSize: One Size\r\nTinggi Model: 174 cm',100000,'Blouse','produk/zAgk3Ub5bGtXGguZs35Bp487fUalxnusbs5gsiRU.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 15:15:45','2025-06-16 15:15:45'),
(70,'Zendaya Blouse Whhite','Berbahan Satin dengan vareasi Kerah di leher yang unik dan elegant \r\n\r\n\r\nUkuran:\r\nLebar Bahu: 50 cm\r\nLingkar Dada: 108 cm\r\nPanjang Tangan: 48 cm\r\nLingkar Pinggang: 96 cm\r\nPanjang Baju: 55-70 cm\r\n\r\nUkuran yang Dikenakan Model:\r\nSize: One Size\r\nTinggi Model: 174 cm',100000,'Blouse','produk/Pjrpk6MLnRyKNLxLZ2XlHnWoetOkCNfrtmr32pML.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:16:16','2025-06-16 15:16:16'),
(71,'Marlina Blouse White','Tampil chic dengan mengenakan atasan lengan panjang ini! Memiliki detail yang unik. Padankan dengan celana panjang dan heels serta hijab favoritmu\r\n\r\nUkuran:\r\nLebar Bahu: 50 cm\r\nLingkar Dada: 98 cm\r\nPanjang Tangan: 48 cm\r\nLingkar Pinggang: 96 cm\r\nPanjang Baju: 55-70 cm\r\n\r\nUkuran yang Dikenakan Model: Size: One Size Tinggi Model: 174 cm',100000,'Blouse','produk/ANOn8AevhgqG5KFmpXamQwWlkEPdjciOUZLfkOEj.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:17:37','2025-06-16 15:17:37'),
(72,'Attire Lace Tunik Yelloow','- Tunik bernuansa pastel\r\n- Kerah mandarin\r\n- Rimple dibagian bawah\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Furing di bagian dalam yang nyaman dan tidak transparan\r\n- Material lace yang bermotif polkadot kecil, lembut dan berkualitas premium\r\n- Tinggi model 176cm, mengenakan ukuran One size (lingkar dada 100cm)\r\n- All Size',1000000,'Tunic','produk/TPsNTnucbz8iEWce5VchqqSV2hnQTgMDdjfS1Y3p.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:18:51','2025-06-16 15:18:51'),
(73,'Attire Lace Tunik Blue','- Tunik bernuansa pastel\r\n- Kerah mandarin\r\n- Rimple dibagian bawah\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Furing di bagian dalam yang nyaman dan tidak transparan\r\n- Material lace yang bermotif polkadot kecil, lembut dan berkualitas premium\r\n- Tinggi model 176cm, mengenakan ukuran One size (lingkar dada 100cm)\r\n- All Size',1000000,'Tunic','produk/MWXz6Z8khEU352pKSJz1lkqdsmYgcWy0GCggprib.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:19:40','2025-06-16 15:19:40'),
(74,'Attire Lace Tunik Beige','- Tunik bernuansa pastel\r\n- Kerah mandarin\r\n- Rimple dibagian bawah\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Furing di bagian dalam yang nyaman dan tidak transparan\r\n- Material lace yang bermotif polkadot kecil, lembut dan berkualitas premium\r\n- Tinggi model 176cm, mengenakan ukuran One size (lingkar dada 100cm)\r\n- All Size',1000000,'Tunic','produk/HM5lQ91AAv9mjPGKlotN0XAs54DCyPITzBKfUt4o.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:20:10','2025-06-16 15:20:10'),
(75,'Ayla Tunik Babby Pink','Tampil gaya dengan mengenakan atasan lengan panjang ini! Padankan dengan celana panjang serta hijab favoritmu!\r\n\r\nUkuran :\r\nLebar Bahu: 43 cm\r\nLingkar Dada: 98 cm\r\nPanjang Tangan: 62 cm\r\nLingkar Pinggang: 112 cm\r\nPanjang Baju: 100 cm\r\n\r\nBahan: Satin',185000,'Tunic','produk/GFRj00icwhQUnUdfOJzyOI1J9AyDXbEubDjlflpT.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:21:19','2025-06-16 15:21:19'),
(76,'Sheyla Blouse Red Maroon','- Blouse dengan desain feminim dan simple\r\n- Bahan Satin\r\n- Lengan panjang dengan manset kancing satu\r\n- Dipermanis dengan pita di belakang\r\n- Risleting di bagian punggung\r\n- Kerah bulat\r\n\r\n\r\nLingkar Dada x Lingkar Pinggang x Panjang\r\nOne Size (100cm x 90 cm x 67 cm)',100000,'Tunic','produk/gP9Iv3FnMeLCqvieq2c9g1y7UOw5MCUNdeujPJ0E.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 15:22:33','2025-06-16 15:22:33'),
(77,'Claudia Bloom Set Yellow','Keterangan\r\nSet baju muslim desain asimetris bergaya elegan\r\n\r\nDetail atasan:\r\n- Blouse dan outer\r\n- Warna yellow\r\n- Kerah bulat\r\n- Bordir dan payet pada bagian dada kanan\r\n- Regular fit\r\n- Material madam sexy tidak transparan, ringan dan semi stretch\r\n\r\nDetail bawahan:\r\n- Warna yellow\r\n- Mid rise\r\n- Unlined\r\n- Regular fit\r\n- Kancing dan resleting depan\r\n- Material madam sexy tidak transparan, ringan dan semi stretch\r\n\r\nOne size : LD108',1000000,'One Set','produk/xSOs7MYyAHFt9TfqaFREeEZbojAv0W1dN3YiqmNN.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"9\"}','2025-06-16 15:23:38','2025-06-16 15:23:38'),
(78,'Alexa Tunik Black','Material satin\r\n Kerah V\r\n Lengan panjang\r\n Seleting belakang\r\n Regular fit -All Size\r\n\r\nLingkar dada x panjang baju x panjang lengan x lingkar dada\r\n102 cm x 100 cm x 55 cm x 100 cm',125000,'Tunic','produk/AONxfDdC0BP1bRHi4SdxXRF5259oqEll4C2DEF90.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:24:36','2025-06-16 15:24:36'),
(79,'ClaireDe Lune Brown','Tunik Claire De Lune adalah long tunik dengan desain brokat yang elegan dan dihias payet tabur yang dikerjakan handmade dengan hati-hati dan teliti, menjadikan Claire De Lune Tunik sangat cantik dan fit untuk berbagai acara formal.\r\n\r\n- Long Tunik dengan paduan dua brokat yang berbeda di tampak depan dan belakang, sehingga memberikan tampilan yang unik nan chic.\r\n- Brokat di bagian depan dihias full payet premium yang exclusive\r\n- Risleting di bagian belakang\r\n- Kerah bulat\r\n- Bagian pergelangan tangan dipermanis dengan pita\r\n- Dilengkapi furing yang nyaman\r\n- One Size',1500000,'Dress','produk/asTtqIatg0I6JA4oBhOtQJSYyaI4grAXSaEXphse.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:25:31','2025-06-16 15:25:31'),
(80,'Selena Lace Tunik White','- Tunik bernuansa pastel\r\n- Warna broken white\r\n- Rimple dibagian leher\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Furing dibagian dalam\r\n- Material lace dengan furing tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, lingkar dada 100cm, mengenakan ukuran One size\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 100cm x 96cm x 104cm x 90cm)',499000,'Tunic','produk/AOqFV5Y7Mk4BcKboByvursRLuu6khwbj6mUdIlwH.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:27:01','2025-06-16 15:27:01'),
(81,'Lavinne Blouse Black','- Casual blouse bernuansa pastel dengan lace\r\n- Warna Black\r\n- Kerah Bulat\r\n- Unlined\r\n- Regular fit\r\n- Material Organdi dengan furing tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Panjang\r\nOne Size  (100cm x 100cm x 85cm',100000,'Blouse','produk/gpFXytRzdv3WMxuR7anKvA0n6nuUzNoftdfKuKZv.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:28:43','2025-06-16 15:28:43'),
(82,'Lavinne Blouse White','- Casual blouse bernuansa pastel dengan lace\r\n- Warna White\r\n- Kerah Bulat\r\n- Unlined\r\n- Regular fit\r\n- Material Organdi dengan furing tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Panjang\r\nOne Size  (100cm x 100cm x 85cm',100000,'Blouse','produk/bmfzqLKXICFv3WcUvZUF8KJ6fy9X8uVG7kefFKQo.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 15:29:29','2025-06-16 15:29:29'),
(83,'Lavinne Blouse Nude','- Casual blouse bernuansa pastel dengan lace\r\n- Warna Nude\r\n- Kerah Bulat\r\n- Unlined\r\n- Regular fit\r\n- Material Organdi dengan furing tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Lingkar Pinggang x Panjang\r\nOne Size  (100cm x 100cm x 85cm',100000,'Blouse','produk/CltMPAWxEmvFbIcfJjBTHAboq8yuV937XY5vcyG7.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:30:00','2025-06-16 15:30:00'),
(84,'Ribbon Skirt Violet','Tampil gaya dengan rok ini. Memlki model simple. Padankan dengan atasan dan kerudung senada favoritmu.\r\n\r\nUkuran :\r\nLingkar Pinggang: 74 cm\r\nLingkar Pinggul: 132 cm\r\nPanjang: 109 cm Tinggi Model: 174 cm',75000,'Skirt','produk/K2TGYCJsVrWsxAZxDS2RlBYoPSSoLJCgHxmYOcvO.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"13\"}','2025-06-16 15:31:05','2025-06-16 15:31:05'),
(85,'Siena Blouse Broken white','Blouse casual\r\n Kerah Balik\r\n Regular fit\r\n Material linen\r\n Size L dan XL\r\n\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang\r\n\r\n L (73cm x 70cm x 126cm x 112cm)\r\n XL (74cm x 71cm x 130cm x 116cm)',100000,'Blouse','produk/xWZbLS6JB6n3X670eB0AvBFWcv1Meat9jXDi0ItF.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 15:31:59','2025-06-16 15:31:59'),
(86,'Premium Katun Voal Arabian Scarf Periwinkle','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/NtlbngQPdDtVfkMhmVWV32Ht8zZ0Pd6dnYbKbx7w.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:32:58','2025-06-16 15:32:58'),
(87,'Hazel Tunic Salem','- Tunik becasual\r\n- Kerah bulat\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton tidak transparan, ringan, dan tidak\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 90 cm)\r\n- L (98 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',150000,'Tunic','produk/1S7AEdSBCd7E20RIhhEFOT47uEBz6dOK5mwkQ9a2.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:33:54','2025-06-16 15:34:23'),
(88,'Shakira Dress Orange','Satin\r\n Leher V\r\n Resleting dibagian belakang\r\n Regular fit\r\n All Size\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n\r\n145 cm x 96-100 cm x 12-16 cm',150000,'Dress','produk/xfIu7Ti7Cg205CVNlJUVTDFDNR5tPnORpp4QJYhI.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"7\"}','2025-06-16 15:35:23','2025-06-16 15:35:23'),
(89,'Beby Polca Tunik','- Tunik casual\r\n- Warna polkadot\r\n- Kerah V\r\n- Unlined\r\n- Regular fit\r\n- Kancing depan\r\n- Material cotton tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, lingkar dada 100cm, mengenakan ukuran One size\r\n\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 100cm x 96cm x 104cm x 98cm)',250000,'Tunic','produk/KpcovnLG4aFOqHFmQ2C0u1bmGweW8AsSW8EpLzOx.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"6\"}','2025-06-16 15:36:19','2025-06-16 15:36:19'),
(90,'Zendaya Set Brown','Set pakaian muslim desain two tones bergaya semi formal\r\nDetail atasan:\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nDetail bawahan:\r\n- Mid rise\r\n- Regular fit\r\n- Karet pinggang elastis, kancing dan resleting depan\r\n- 2 kantong depan\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M',685000,'One Set','produk/e9wDWLcCX7axYabhMbXoJIKAL42VaNlqB1eGY1tK.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 15:38:48','2025-06-16 15:38:48'),
(91,'Zendaya Set Salem','Set pakaian muslim desain two tones bergaya semi formal\r\nDetail atasan:\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nDetail bawahan:\r\n- Mid rise\r\n- Regular fit\r\n- Karet pinggang elastis, kancing dan resleting depan\r\n- 2 kantong depan\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M',685000,'One Set','produk/Sw9oePlwuqhdjsvmlgij4bCHAtWDaGrB8kWYCTqz.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:39:50','2025-06-16 15:39:50'),
(92,'Zendaya Set Yellow','Set pakaian muslim desain two tones bergaya semi formal\r\nDetail atasan:\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nDetail bawahan:\r\n- Mid rise\r\n- Regular fit\r\n- Karet pinggang elastis, kancing dan resleting depan\r\n- 2 kantong depan\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M',685000,'One Set','produk/U9vToG3aS2zWCrfGWQlJN8ixNavDqri4x19oHdZc.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"6\"}','2025-06-16 15:44:43','2025-06-16 15:44:43'),
(93,'Zendaya Set Green','Set pakaian muslim desain two tones bergaya semi formal\r\nDetail atasan:\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nDetail bawahan:\r\n- Mid rise\r\n- Regular fit\r\n- Karet pinggang elastis, kancing dan resleting depan\r\n- 2 kantong depan\r\n- Material satin tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M',685000,'One Set','produk/nyFK02LNYQHhFiHCTs9Gu6HnBVUtCcy1BFJvRl47.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 15:45:21','2025-06-16 15:45:21'),
(94,'Kirana Dress White','Katun Toyobo\r\n Warna variasi\r\n Leher V\r\n Resleting dibagian belakang\r\n Regular fit\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n146 cm x 96-100 cm x 12-16 cm',350000,'Dress','produk/26bPzWaCbivgT1nX2bQW31IPgHOb7dMjbsFvGJUw.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:46:18','2025-06-18 13:54:33'),
(95,'Polkadot Tunik Grey White','Tunik\r\n Kerah bulat\r\n All Size\r\n Material katun dan lace\r\n\r\nLingkar dada x Lingkar pinggang x Lingkar pinggul x Panjang\r\n( 98cm x 100cm x 102cm x 98cm )',200000,'Tunic','produk/c1cdckxiWNeSfYlEI0s1zThvA238uWxm4wfavUwf.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"9\"}','2025-06-16 15:47:10','2025-06-16 15:47:10'),
(96,'Arielle Dress Baby Pink','Arielle Dress dengan desain yang chic padankan dengan hijab dan heels favoritkamu\r\n\r\n Satin\r\n Warna baby pink\r\n Lengan panjang\r\n Resleting belakang\r\n Leher shanghai\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\nM : 145 cm x 92-96 cm x 10-14 cm\r\nL : 146 cm x 96-100 cm x 12-16 cm\r\nXL : 146 cm x 98-102 cm x 14- 18 cm',350000,'Dress','produk/2o2EEjezPf3PPvhB6JV9tlqSuynKa5g5FeaJHyKO.jpg','{\"S\":null,\"M\":null,\"L\":\"8\",\"XL\":null,\"ALL\":null}','2025-06-16 15:48:12','2025-06-16 15:48:12'),
(97,'Hazel Tunik Khaky','- Tunik becasual\r\n- Kerah bulat\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material cotton madina, lembut, nyaman, berserat linen dan adem dikenakan seharian\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (95 cm x 12 cm x 90 cm)\r\n- L (100 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',150000,'Tunic','produk/VjNWa1s1ScNw6A7riyMTxTCZkrUR1Wu3eVwB2hE3.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 15:49:25','2025-06-16 15:49:25'),
(98,'Kamila Dress Violet','Tampil anggun dan dress motif yang menawan, padukan dengan hijab polos.\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n\r\nL : 146 cm x 96-100 cm x 12-16 cm\r\nXL : 146 cm x 98-102 cm x 14- 18 cm',150000,'Dress','produk/dcyXXLkCsVF7ugIcuILpxemBb4QMGBJzTZNc8wFO.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":\"2\",\"ALL\":null}','2025-06-16 15:50:51','2025-06-16 15:50:51'),
(99,'Signature Premium Scarf Pansy Navy','-100% Premium Ultra Fine Voal\r\n- Lasercut\r\n-Bahan voal kualitas tertinggi di kelasnya\r\n-Design Digital Print Exclusive\r\n-Bahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah\r\n-For your daily and special event\r\n110 cm x 110 cm',289000,'Hijab','produk/0lVHmnrc4LuRk4Ez4QbMKCIZaA87Tg9NBmEsUVKW.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:51:46','2025-06-16 15:51:46'),
(100,'Premium Katun Voal Arabian Scarf Maroon','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/pYSGLofCtyvx1e0CfL6cKXV8K6FMmN5x4xxHWnB2.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"1\"}','2025-06-16 15:52:35','2025-06-16 15:52:35'),
(101,'Ava Dress','- Dress dengan nuansa warna abstrak\r\n- Leher mandarin\r\n- Unlined\r\n- Regular fit\r\n- Resleting belakang\r\n- Material silk dengan furinng tidak transparan, ringan, dan semi stretch\r\n\r\n\r\nLingkar Dada x Lingkar Pinggang x Lingkar Pinggul x Panjang\r\n- One size ( 102cm x 116cm x 140cm x 145cm)',150000,'Dress','produk/zIskjTnHLzOLFdWYMoinLGDgLNdowcYI6LC7YOq4.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 15:55:28','2025-06-18 13:55:10'),
(102,'Mattana Blouse Dusty Pink','Blouse casual\r\nKerah kemeja\r\nRegular fit\r\nKancing depan\r\nMaterial katun\r\nTinggi model 176cm, mengenakan ukuran M\r\n\r\nPanjang lengan x Lingkar Dada x Lingkar Pinggang\r\nL (55cm x 100cm x 110cm)',175000,'Blouse','produk/drlOhtlyMfGUcy2s0SMNMmhgCHr2wTHW2NeQZWHU.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-16 15:56:44','2025-06-16 15:58:18'),
(103,'Shana Lace Dress Brown','Keterangan\r\n- Lace gamis bernuansa elegan\r\n- Warna brown\r\n- Kerah mandarin\r\n- Payet bagian leher\r\n- Regular fit\r\n- Zipper bagian belakang\r\n\r\nLingkar dada x Lingkar pinggang x Lingkar pinggul x Panjang\r\n- One Size (102cm x 100cm x 104cm x 145cm)',1500000,'Dress','produk/IZW8T7LFsINuwRInHDvbVjrmhqRYJab10qRbcOdJ.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 15:59:50','2025-06-16 15:59:50'),
(104,'Claudia Bloom Set Pink','Keterangan\r\nSet baju muslim desain asimetris bergaya elegan\r\n\r\nDetail atasan:\r\n- Blouse dan outer\r\n- Warna pink\r\n- Kerah bulat\r\n- Bordir dan payet pada bagian dada kanan\r\n- Regular fit\r\n- Material madam sexy tidak transparan, ringan dan semi stretch\r\n\r\nDetail bawahan:\r\n- Warna pink\r\n- Mid rise\r\n- Unlined\r\n- Regular fit\r\n- Kancing dan resleting depan\r\n- Material madam sexy tidak transparan, ringan dan semi stretch\r\n\r\nLingkar Dada x Panjang atasan x Lingkar Pinggang x Panjang depan x Panjang sisi dalam\r\n- L (108cm x 103cm x 78cm x 31cm x 73c',1000000,'One Set','produk/G94I2YbGiuIcvUhcsxpJsHUvAMr4yrInea0KgtLA.jpg','{\"S\":null,\"M\":null,\"L\":\"6\",\"XL\":null,\"ALL\":null}','2025-06-16 16:02:19','2025-06-16 16:02:19'),
(105,'Premium Katun Voal Arabian Scarf Punch','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/JdhjiQ4dVum1ZtFuPrmDjQmpdhCF9oCzFI1i4Jqp.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"1\"}','2025-06-16 16:03:09','2025-06-16 16:03:09'),
(106,'Najwa Blouse Baby pink','Tampil gaya dengan mengenakan atasan lengan panjang ini! Dengan detail kancing. Padankan dengan celana panjang dan heels serta hijab favoritmu!\r\n\r\nUkuran L:\r\nLebar Bahu: 43 cm\r\nLingkar Dada: 98 cm\r\nPanjang Tangan: 62 cm\r\nLingkar Pinggang: 112 cm\r\nPanjang Baju: 88 cm\r\n\r\nBahan: Satin',100000,'Blouse','produk/vLS63bwssYGD0dYuB03WPqGXkyNhfLQfDnRyuXEK.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 16:05:05','2025-06-16 16:05:05'),
(107,'Shella Dress Broken White','Satin\r\n Leher Bulat\r\n Lace bagian depan\r\n Resleting dibagian belakang\r\n Regular fit\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n\r\nAllSize : 146 cm x 108-115 cm x 14- 18 cm',150000,'Dress','produk/aMKFs8OTN4YleekqKhI1khygd8VvHYkVCNChPABU.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"7\"}','2025-06-16 16:06:18','2025-06-18 13:55:34'),
(108,'Ribbon Blouse Red','Atasan dengan bahan satin silk yang nyaman digunakan.\r\nTanpa kancing dan resliuting dengan hiasan pita dibagian depan\r\n\r\n\r\nPanjang Baju 65 cmLingkar Dada 110 cm Lingkar Pingang 180 cm',75000,'Blouse','produk/1VkvVvBnkmsx45vfMGw6ACIt9Nm8MnTJHBRoYr2k.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 16:07:58','2025-06-16 16:07:58'),
(109,'Ribbon Blouse Navy','Atasan dengan bahan satin silk yang nyaman digunakan.\r\nTanpa kancing dan resliuting dengan hiasan pita dibagian depan\r\n\r\n\r\nPanjang Baju 65 cmLingkar Dada 110 cm Lingkar Pingang 180 cm',75000,'Blouse','produk/v2DjEsO6r7dES5DopiwORVI7UJg0rxMNjzEEj4Ke.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 16:08:26','2025-06-16 16:08:26'),
(110,'Ribbon Blouse Green','Atasan dengan bahan satin silk yang nyaman digunakan.\r\nTanpa kancing dan resliuting dengan hiasan pita dibagian depan\r\n\r\n\r\nPanjang Baju 65 cmLingkar Dada 110 cm Lingkar Pingang 180 cm',75000,'Blouse','produk/9n0IQFJifckNHnuPurTlzBbRaaRGEmvjQ2BWPCH6.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-16 16:08:51','2025-06-16 16:08:51'),
(111,'Halima Blouse Red','Tunik CASUAL\r\n Kerah bulat\r\n Regular fit\r\n Material katun toyobo\r\n Tinggi model 172 cm, menggunakan ukuran M\r\n\r\nLingkar dada x Lingkar pinggang x Lingkar pinggul x Panjang\r\n M (96cm x 98cm x 100cm x 88cm )\r\n L ( 98cm x 100cm x 102cm x 89cm )\r\n XL ( 100cm x 102cm x 104cm x 90cm )',125000,'Blouse','produk/cxsGac6Q8Itk3xuXXrS62IUwHzDm91iKTeVrRXu2.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 16:10:38','2025-06-16 16:10:38'),
(112,'Halima Blouse Pink','Tunik CASUAL\r\n Kerah bulat\r\n Regular fit\r\n Material katun toyobo\r\n Tinggi model 172 cm, menggunakan ukuran M\r\n\r\nLingkar dada x Lingkar pinggang x Lingkar pinggul x Panjang\r\n M (96cm x 98cm x 100cm x 88cm )\r\n L ( 98cm x 100cm x 102cm x 89cm )\r\n XL ( 100cm x 102cm x 104cm x 90cm )',125000,'Blouse','produk/ZYK4nxAvLlwLvjSeDauVQpn0MTwyfVV0KtWni0eu.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-16 16:12:00','2025-06-16 16:12:00'),
(113,'Premium Katun Voal Arabian Scarf Silver','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/nAkG2t7KHk3BJUXtSYVd4sRCbH4Cnwv8fk4XPWfA.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 16:54:12','2025-06-16 16:54:12'),
(114,'Kimmy Set White','Detail atasan:\r\n Kerah bulat\r\n Regular fit\r\n Resleting belakang\r\n \r\nDetail bawahan:\r\n Mid rise\r\n Regular fit\r\n Karet pinggang elastis, kancing dan resleting depan\r\n 2 kantong depan\r\n\r\n Tinggi model 176cm, mengenakan ukuran M\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n M (92 cm x 12 cm x 65 cm)\r\n L (98 cm x 12 cm x 65 cm)\r\n XL (104 cm x 13 cm x 65 cm)',300000,'One Set','produk/vblr2eLWeVeMWU3SYYo1bSH4RYckH6OZ8jI40L7U.jpg','{\"S\":null,\"M\":\"1\",\"L\":\"1\",\"XL\":null,\"ALL\":null}','2025-06-16 16:55:37','2025-06-16 16:55:37'),
(115,'Ghilsya Lacey Dress Broken white','Dress kombinasi lace dan satin\r\n Kancing bagian depan\r\n Kerah Shanghai\r\n Size M L XL\r\n Material satin\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n\r\nM : 145 cm x 92-96 cm x 10-14 cm\r\nL : 146 cm x 96-100 cm x 12-16 cm\r\nXL : 147 cm x 98-102 cm x 14- 18 cm',200000,'Dress','produk/ajXLIiULVefUHQyNz2OrzwizNTaHmUV7A9RRUh5a.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 16:56:47','2025-06-16 16:56:47'),
(116,'Letty Pants Pink','Sempurnakan tampilanmu dengan celana slim fit yang memiliki detail highwaist. Padankan dengan atasan kemeja serta hijab warna netral dan sepatu favoritmu.\r\n\r\nUkuran :\r\nLingkar Pinggang: 72 cm\r\nLingkar Pinggul: 102 cm\r\nPanjang: 95 cm\r\nBahan Katun',75000,'Pants','produk/j6y9cYcGaiJGht1JfnrI9Oq9eBeZ78CzYuYPbtGZ.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":\"2\",\"ALL\":null}','2025-06-16 16:57:41','2025-06-16 16:57:41'),
(117,'Elsa Bloom Tunik Gold','- Tunik detail lace\r\n- Kerah shanghai\r\n- Payet dibagian leher\r\n- Regular fit\r\n- Zipper belakang\r\n- Material Lace, tidak transparan, ringan dan tidak stretch\r\n\r\nPanjang lengan xLebar dada x Lebar pinggang x Lebar pinggul x Panjang\r\n- One size (56cm x 100cm x 102cm x 135cm)',1500000,'Tunic','produk/KiFFAg3Roe5CjAbg3VOZ0kmoMS3kGSlu7ygYANml.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 16:58:25','2025-06-16 16:58:36'),
(118,'Elsa Bloom Tunik Brown','Keterangan\r\n- Tunik detail lace\r\n- Kerah shanghai\r\n- Payet dibagian leher\r\n- Regular fit\r\n- Zipper belakang\r\n- Material Lace, tidak transparan, ringan dan tidak stretch\r\n\r\nPanjang lengan xLebar dada x Lebar pinggang x Lebar pinggul x Panjang\r\n- One size (56cm x 100cm x 102cm x 135cm)',1500000,'Tunic','produk/qiDmT4UJkEQ9Wd6nK9b2sP2KaWCnOhNYId2VnFGl.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 16:59:25','2025-06-16 16:59:25'),
(119,'Devina Tunik Tosca','- Tunik berbahan Chiffon berkualitas\r\n- Motif bunga warna hijau dan biru toska\r\n- Terdapat kancing di bagian dada\r\n- Model cutting asimetris yang cantik (panjang dibagian belakang dan pendek dibagian depan, runcing dibagian sisi kiri dan kanan)\r\n\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 90 cm)\r\n- L (98 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',100000,'Tunic','produk/0tF7Tx34NhSsjsFTvpNwI4UDekEjjdGTTup0tABY.jpg','{\"S\":null,\"M\":null,\"L\":\"4\",\"XL\":null,\"ALL\":null}','2025-06-16 17:00:42','2025-06-16 17:00:42'),
(120,'Premium Katun Voal Arabian Scarf Carnation','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/FPKCiGBFx0tvhXRXkQpdFqwa66fuzJE5YbcGi0Gp.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-16 17:01:30','2025-06-16 17:01:30'),
(121,'Vana Tunik Gray','-Tunik manis dengan desain cutting asimetris yang unik. Padukan dengan celana dan high heels untuk tampilan chic yang menarik.\r\n-Resleting belakang\r\n-Terdapat tali serut di bagian lengan, menambah aksen feminim\r\n-Panjang lengan model 3/4\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 90 cm)\r\n- L (98 cm x 12 cm x 90 cm)\r\n- XL (104 cm x 13 cm x 90 cm)',125000,'Tunic','produk/C3BFHTcYyjg0tk65wDqwDxG2DU84kutDFlTCxhLe.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-16 17:02:23','2025-06-16 17:02:23'),
(122,'Shana Lace Dress Beige','Keterangan\r\n- Lace gamis bernuansa elegan\r\n- Warna beige\r\n- Kerah mandarin\r\n- Payet bagian leher\r\n- Regular fit\r\n- Zipper bagian belakang\r\n\r\nLingkar dada x Lingkar pinggang x Lingkar pinggul x Panjang\r\n- One Size (102cm x 100cm x 104cm x 145cm)',1500000,'Dress','produk/rCsk5cSx0fbRI211DmXIhYcafUAmzhd9gxpaUZ9Z.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 17:03:15','2025-06-16 17:03:15'),
(123,'Louisa Blouse Navy','Blouse casual\r\nKerah V\r\nRegular fit\r\nKancing depan\r\nMaterial katun\r\nTinggi model 176cm, mengenakan ukuran M\r\n\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang\r\nM (72cm x 69cm x 122cm x 108cm)\r\nL (73cm x 70cm x 126cm x 112cm)',125000,'Blouse','produk/xSpKMpH9yTyKR1jTt2vKyWuryJEVSoSuCCFuFBeh.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-16 17:04:13','2025-06-16 17:04:13'),
(124,'Recca Pants Sian','Ukuran:\r\nLingkar Pinggang: 66-86 cm\r\nLingkar Pinggul: 110 cm\r\nPanjang: 101 cm\r\n\r\nUkuran yang Dikenakan Model:\r\nSize: One Size\r\nTinggi Model: 174 cm',75000,'Pants','produk/YvvuqKXoEKNtl5LTpUG0wwG8LYoP2cUz5xMm39D1.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-16 17:05:44','2025-06-16 17:05:44'),
(125,'Alisha Series Scarf Royal Blue Charm','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/iona1y0arSsjbm1wHbViRDhGto8iRvTbP8P2MM0F.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:40:22','2025-06-18 13:40:22'),
(126,'Alisha Series Scarf Tribal Grey','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/sLEmvKYYwMPDS1TkunmCKzDrWqQyG24KtpxXyy5r.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:41:07','2025-06-18 13:41:07'),
(127,'Alisha Series Scarf Rope','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/BK6BS2GbT8cQO7MF6K9hxmSP93y513FA4yRzMY1X.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"4\"}','2025-06-18 13:42:01','2025-06-18 13:42:01'),
(128,'Alisha Series Scarf Cheer Blue','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/LkCMeKnHKWam33o5GiDFcD4EGjPgvxW5wda7ZlIn.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"1\"}','2025-06-18 13:42:53','2025-06-18 13:42:53'),
(129,'Alisha Series Scarf Blueish Grey','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/smSCHbUk09TYRkE8pFm3IDGSyl7d9dATxtl9Qrmr.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:43:40','2025-06-18 13:43:40'),
(130,'Alisha Series Scarf Leaf Beige','-100% Premium Cotton VoaL\r\n\r\n- Warna dasar beige dengan tone peach\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/vioumXTVP8BtVWP0tsw1ZwoShmCv5gfC05PEPgpH.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:44:41','2025-06-18 13:44:41'),
(131,'Brisia Dress White','- Gamis bernuansa monokrom detail diagonal frill\r\n- Warna hitam\r\n- Kerah crew\r\n- Regular fit\r\n- Resleting belakang\r\n- Material jacquard tidak transparan, ringan, dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M\r\n\r\nLingkar Dada x Lebar Bahu x Panjang Badan:\r\n- M (92 cm x 12 cm x 140 cm)\r\n- L (98 cm x 12 cm x 140 cm)\r\n- XL (104 cm x 13 cm x 140 cm)',1500000,'Dress','produk/bF0IA3NNNwsKMG9rd7EV6SB50VK8v64P3YPMaB7v.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":\"1\",\"ALL\":null}','2025-06-18 13:46:07','2025-06-18 13:46:07'),
(132,'Diane Set Black','Set Pakaian Casual dengan Desain Two Tones\r\nDetail atasan :\r\n- Ragular Fit\r\n- Kancing Depan\r\n- Material Catton, Ringan dan Tidak Stretch\r\n- Free Mask dengan Warna senada\r\n\r\nDetail bawahan :\r\n- Ragular Fit\r\n- Matreial Catton, Ringan dan Tidak Stretch',695000,'One Set','produk/e28pWz0lo1xxLnVIdJoFttHrOrmgksK4N90VDjVP.jpg','{\"S\":null,\"M\":\"6\",\"L\":\"2\",\"XL\":\"1\",\"ALL\":null}','2025-06-18 13:47:26','2025-06-18 13:47:26'),
(133,'Premium Katun Voal Arabian Scarf Denim','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/MtwJaE5W24xE3UQlqdUZE3f8nqbLLb0BBqgtK5P4.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:49:14','2025-06-18 13:49:14'),
(134,'Alisha Series Scarf Blue Tartan','-100% Premium Satin Voal\r\n- Free Masker dengan motif senada\r\n- Lasercut\r\n​- Design Digital Print Exclusive\r\n- Bahan satin lembut, namun jenis yang tidak licin \r\n- Bahan Dingin, mudah dibentuk dan tegak di bagian wajah\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/1RxqmWVPg2K8JOWtAd6NsRIE5UhTbPpPcKHeeUyM.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-18 13:50:46','2025-06-18 13:50:46'),
(135,'Premium Katun Voal Arabian Scarf Pisthacio','100% Premium Ultra Fine Voal\r\nLasercut\r\nBahan voal kualitas tertinggi di kelasnya\r\nDesign Digital Print Exclusive\r\nBahan Dingin, lembut, tidak licin, mudah dibentuk dan tegak di bagian wajah',289000,'Hijab','produk/EAf3k38DtEbRR0hcKWtMipCUO1FZvNQzoq64G3m2.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:52:12','2025-06-18 13:52:12'),
(136,'Oceana Kaftan White Blue','Kaftan bernuansa pastel untuk formal look\r\n Kerah bulat\r\n Muatiara dibagian leher dan depan\r\n Rimple dibagian depan\r\n Regular fit\r\n Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Panjang Badan:\r\n One Size (118 cm x 140 cm)',400000,'Dress','produk/AjweG2ObF76bK7lUAjWzpOZZSl9fNFgsQsaRgZOd.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-18 13:53:51','2025-06-18 13:53:51'),
(137,'Oceana Kaftan White Pink','Kaftan bernuansa pastel untuk formal look\r\n Kerah bulat\r\n Muatiara dibagian leher dan depan\r\n Rimple dibagian depan\r\n Regular fit\r\n Material satin tidak transparan, ringan, dan tidak stretch\r\n\r\nLingkar Dada x Panjang Badan:\r\n One Size (118 cm x 140 cm)',400000,'Dress','produk/fZgX0ZGkxrkAjASFzyOkDht3hKyNgG0zm4bLBB07.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"2\"}','2025-06-18 13:57:15','2025-06-18 13:57:15'),
(138,'Kayla Dress White','Satin\r\n Leher Shanghai\r\n Lengan Balon\r\n Resleting dibagian belakang\r\n Regular fit\r\n Size M L XL\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n M : 145 cm x 92-96 cm x 10-14 cm\r\n L : 146 cm x 96-100 cm x 12-16 cm\r\n XL : 146 cm x 98-102 cm x 14- 18 cm',350000,'Dress','produk/PeGIYHx1oSgxpsMbfRlUwOSXccS7tb6YU55Oak3W.jpg','{\"S\":null,\"M\":\"1\",\"L\":\"4\",\"XL\":\"1\",\"ALL\":null}','2025-06-18 13:58:39','2025-06-18 13:58:39'),
(139,'Polkadot Prayer Set Brown','Set mukena berwarna lembut\r\nDetail atasan :\r\n- Ragular Fit\r\n- Aksen lace di bagian tepi bawah mukena\r\n- Dengan motif polkadot\r\n- Detail tali karet yang kuat namun tetap elastis\r\n- Bahan sejuk dan nyaman saat digunakan untuk beribadah\r\n\r\nDetail Bawahan :\r\n- Ragular Fit\r\n- Karet pinggang kuat namun tetap elastis\r\n- Bahan sejuk dan nyaman saat digunakan untuk beribadah',1500000,'Prayer Set','produk/PM6OUsyAueZB3wzP6wCuqRqTukw5p0ruvWmC6Y4f.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-18 13:59:42','2025-06-18 13:59:42'),
(140,'Polkadot Prayer Set Pink','Set mukena berwarna lembut\r\nDetail atasan :\r\n- Ragular Fit\r\n- Aksen lace di bagian tepi bawah mukena\r\n- Dengan motif polkadot\r\n- Detail tali karet yang kuat namun tetap elastis\r\n- Bahan sejuk dan nyaman saat digunakan untuk beribadah\r\n\r\nDetail Bawahan :\r\n- Ragular Fit\r\n- Karet pinggang kuat namun tetap elastis\r\n- Bahan sejuk dan nyaman saat digunakan untuk beribadah',1500000,'Prayer Set','produk/wRAuqc9jswA249f3XqSTIQedwUkFmGtf6v1aYHEh.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-18 14:00:24','2025-06-18 14:00:24'),
(141,'Cheslie Dress White','Satin\r\n  Leher Bulat\r\n  Aksen flow dibagian atas tangan\r\n  Resleting dibagian belakang\r\n  Regular fit\r\n\r\nPanjang baju x Lingkar dada x Lebar bahu\r\n  M : 145 cm x 92-96 cm x 10-14 cm\r\n  L : 145 cm x 96-100 cm x 12-16 cm\r\n  XL : 146 cm x 98-102 cm x 14- 18 cm',350000,'Dress','produk/XkSJukbe2bzv93meW8ehuXrh2HnvbqVmT9kjlrtK.jpg','{\"S\":null,\"M\":\"3\",\"L\":null,\"XL\":\"3\",\"ALL\":null}','2025-06-18 14:01:24','2025-06-18 14:01:24'),
(142,'Raline Dress White','Raline Dress dengan desain yang chic padankan dengan hijab dan heels favoritkamu\r\n- Satin\r\n- Leher Bulat\r\n- Ruffle dibagian depan\r\n- Cutting asimetris yang unik dan elegan di bagian lengan\r\n- Resleting dibagian belakang\r\n- Regular fit',350000,'Dress','produk/UNpN5EBoxZsLAvGyqHlgM5AnBwl6ToYyCXFXrdc5.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"3\",\"XL\":\"3\",\"ALL\":null}','2025-06-18 14:02:36','2025-06-18 14:02:36'),
(143,'Az Zahra Prayer Set White','Detail mukena:\r\n- Regular fit\r\n- Detail tali karet yg kuat namun tetap elastis\r\n- Bahan sejuk, tidak panas saat digunakan untuk beribadah\r\n\r\nDetail bawahan:\r\n- Regular fit\r\n- Karet pinggang kuat namun tetap elastis\r\n- Nyaman saat digunakan\r\n- Bahan sejuk, tidak panas saat digunakan untuk beribad',750000,'Prayer Set','produk/seT5XOhMTMu6Ou6IB0AGSR31jLU69N9iinIEaSoe.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"3\"}','2025-06-18 14:03:35','2025-06-18 14:03:35'),
(144,'Rose Ruffle Skirt Black','- Rok muslim satin finish dengan aksen frill\r\n- Warna hitam\r\n- High rise\r\n- Regular fit\r\n- Karet pinggang dengan kancing hook\r\n- Material satin silk semi transparan, ringan dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M\r\n\r\n\r\nLingkar Pinggang x Panjang Badan:\r\n- M (90 cm x 105 cm)\r\n- L (96 cm x 105 cm)\r\n- XL (104 cm x 105 cm)',100000,'Skirt','produk/rVoJ1zR1bCm1tRKeLShGvpiT1KA3LCsauh7FUyxP.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-18 14:05:32','2025-06-18 14:05:32'),
(145,'Rose Ruffle Skirt Navy','- Rok muslim satin finish dengan aksen frill\r\n- Warna Navy\r\n- High rise\r\n- Regular fit\r\n- Karet pinggang dengan kancing hook\r\n- Material satin silk semi transparan, ringan dan tidak stretch\r\n- Tinggi model 176cm, mengenakan ukuran M\r\n\r\n\r\nLingkar Pinggang x Panjang Badan:\r\n- M (90 cm x 105 cm)\r\n- L (96 cm x 105 cm)\r\n- XL (104 cm x 105 cm)',100000,'Skirt','produk/WUgSPkJVEF9TAUXMCbZBi7A4TxLT7kpTp9quAX8A.jpg','{\"S\":null,\"M\":null,\"L\":\"3\",\"XL\":\"1\",\"ALL\":null}','2025-06-18 14:06:36','2025-06-18 14:06:36'),
(146,'Zhelly Shirt Navy','Detail baju :\r\n-atasan lengan panjang dengan motif bunga\r\n-kancing dibagian depan kerah kemeja, cocok dipakai untuk style casual kamu\r\n-bahan katun, tidak stretch dan nyaman di pakai\r\n-padu padankan dengan cullote pants atau jeans agar penampilan kamu semakin stylish.\r\n\r\nPanjang baju 60 cm\r\nLingkar dada 90 cm\r\nPanjang tangan 55 cm\r\n\r\n** ukuran dapat berbeda 2-3 cm karena barang diproduksi masall',100000,'Shirt','produk/6npKaxAQXtBedXG7RcXgsf3cqzu53hmY4zRHZ8Yi.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-18 14:08:33','2025-06-18 14:08:33'),
(147,'Zhelly Shirt Violet','Detail baju :\r\n-atasan lengan panjang dengan motif bunga\r\n-kancing dibagian depan kerah kemeja, cocok dipakai untuk style casual kamu\r\n-bahan katun, tidak stretch dan nyaman di pakai\r\n-padu padankan dengan cullote pants atau jeans agar penampilan kamu semakin stylish.\r\n\r\nPanjang baju 60 cm\r\nLingkar dada 90 cm\r\nPanjang tangan 55 cm\r\n\r\n** ukuran dapat berbeda 2-3 cm karena barang diproduksi masall',100000,'Shirt','produk/V3bOywkvivAzArBLzj7hUUbFfoiCrVBCr4cNgvtD.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"10\"}','2025-06-18 14:09:36','2025-06-18 14:09:36'),
(148,'Claire Blouse Pink','Blouse casual\r\nKerah bulat\r\nRegular fit\r\nMaterial katun\r\nTinggi model 176cm, mengenakan ukuran M\r\n\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang\r\nL (73cm x 70cm x 126cm x 112cm)\r\nXL (74cm x 71cm x 130cm x 116cm)',125000,'Blouse','produk/uRTL3B110ylgY1DGbUI37FJhOozXXfqAnhmP9JZ8.jpg','{\"S\":null,\"M\":\"2\",\"L\":\"3\",\"XL\":\"3\",\"ALL\":null}','2025-06-18 14:11:38','2025-06-18 14:11:38'),
(149,'Loora Blouse Yellow','Blouse casual\r\n  Warna Yellow\r\n  Kerah bulat\r\n  Regular fit\r\n  Material katun toyobo\r\n  Tinggi model 172cm, mengenakan ukuran M\r\n\r\n\r\n\r\nLingkar Dada\r\n- M : 96 cm\r\n- L :  100 cm\r\n- XL : 104 cm',125000,'Blouse','produk/XIYbCRaV05wPEHI1omU6N6WiN7zIS5CYO7yBwGjS.jpg','{\"S\":null,\"M\":null,\"L\":\"4\",\"XL\":null,\"ALL\":null}','2025-06-18 14:13:54','2025-06-18 14:15:56'),
(150,'Loora Blouse Beige','Blouse casual\r\n  Warna Beige\r\n  Kerah bulat\r\n  Regular fit\r\n  Material katun toyobo\r\n  Tinggi model 172cm, mengenakan ukuran M\r\n\r\n\r\n\r\nLingkar Dada\r\n- M : 96 cm\r\n- L :  100 cm\r\n- XL : 104 cm',125000,'Blouse','produk/Y9X4BZFE8PtTja3HV9XYDseXhs7B9DrBUWQQQa1u.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-18 14:14:55','2025-06-18 14:16:07'),
(151,'Loora Blouse Black','Blouse casual\r\n  Warna Black\r\n  Kerah bulat\r\n  Regular fit\r\n  Material katun toyobo\r\n  Tinggi model 172cm, mengenakan ukuran M\r\n\r\n\r\n\r\nLingkar Dada\r\n- M : 96 cm\r\n- L :  100 cm\r\n- XL : 104 cm',125000,'Blouse','produk/fXQHttLv5WRXSQwVXJPsQLzxbFJKSuGKvx49v1O6.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-18 14:15:41','2025-06-18 14:16:18'),
(152,'Cassie Tunik Black','- Material Katun\r\n- Lengan panjang dengan tali serut\r\n- Kerah bulat\r\n- Risleting belakang\r\n- Pola cutting bawah asimetris',125000,'Tunic','produk/5H1TgEsDAgnA54aEuDhWRUnPrW6BRkkfQeEm7vBL.jpg','{\"S\":null,\"M\":\"1\",\"L\":\"1\",\"XL\":\"2\",\"ALL\":null}','2025-06-18 14:17:38','2025-06-18 14:17:38'),
(153,'Claire Blouse Navy','Blouse casual\r\nKerah bulat\r\nRegular fit\r\nMaterial katun\r\nTinggi model 176cm, mengenakan ukuran M\r\n\r\n\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang\r\nL (73cm x 70cm x 126cm x 112cm)\r\nXL (74cm x 71cm x 130cm x 116cm)',125000,'Blouse','produk/hKJzDn9qSdbCam2lQNxaZEM6HvUYwXgZJxyMPdf1.jpg','{\"S\":null,\"M\":\"3\",\"L\":\"3\",\"XL\":null,\"ALL\":null}','2025-06-18 14:18:55','2025-06-18 14:18:55'),
(154,'Flower Cardi Brown','Glamorous Flower Cardigan 3/4 Sleeve terbuat dari material jaguard embose yang lembut dengan tren warna . Koleksi tepat untuk gaya yang fashionable.\r\n\r\nBahan : Jaguard Embose\r\nSize : M L XL\r\nDetail Ukuran : Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang.\r\n\r\n M (36cm x 62cm x 96cm x 90cm x 57cm)\r\n L (38cm x 63cm x 100cm x 94cm x 58cm)\r\n XL (40cm x 64cm x 104cm x 98cm x 59cm)',750000,'Outerwear','produk/2gh1HPiaOlJS8vaUaJxKzwamPHyLghgmRzZy1uf2.jpg','{\"S\":null,\"M\":null,\"L\":\"5\",\"XL\":null,\"ALL\":null}','2025-06-18 14:21:36','2025-06-18 14:21:36'),
(155,'Flower Cardi Gold','Glamorous Flower Cardigan 3/4 Sleeve terbuat dari material jaguard embose yang lembut dengan tren warna . Koleksi tepat untuk gaya yang fashionable.\r\n\r\nBahan : Jaguard Embose\r\nSize : M L XL\r\nDetail Ukuran : Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang.\r\n\r\n M (36cm x 62cm x 96cm x 90cm x 57cm)\r\n L (38cm x 63cm x 100cm x 94cm x 58cm)\r\n XL (40cm x 64cm x 104cm x 98cm x 59cm)',750000,'Outerwear','produk/HUdW6ePBwAupqLTV7IgoSEgFDAaPKD4zOu4GSVZn.jpg','{\"S\":null,\"M\":null,\"L\":\"2\",\"XL\":null,\"ALL\":null}','2025-06-18 14:22:04','2025-06-18 14:22:04'),
(156,'Brisia Outer Gray','Detail Atasan \r\nBahan Cotton corduroy lembut dengan tekstur garis\r\nTerdapat Kancing Pada Bagian Depan\r\nWarna Silver\r\nBahan Tidak strech\r\nModel Kerah Jas\r\n\r\n\r\nLingkar dada x Lingkar ketiak X Panjang tangan X Panjang baju\r\nAllsize: 100cm x 48cm x 45cm x 63cm',150000,'Outerwear','produk/m7ai0TdIhChKWS8H2Z5j5Wa22vBGjMpI1D8Aoqrp.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"20\"}','2025-06-18 14:23:14','2025-06-18 14:23:14'),
(157,'Alisha Series Scarf Leaf Dusty Grey','-100% Premium Cotton VoaL\r\n\r\n- Lasercut\r\n\r\n​- Design Digital Print Exclusive\r\n\r\n- Bahan cotton voal yang lembut, bahan dingin, mudah dibentuk dan tegak di bagian wajah\r\n\r\n- For your daily and special event\r\n\r\n- Size 110cm x 110 cm',289000,'Hijab','produk/fOkiZPF4OD9Jr7phcZBht8A4nCFhAxtBV04wexp4.jpg','{\"S\":null,\"M\":null,\"L\":null,\"XL\":null,\"ALL\":\"5\"}','2025-06-18 14:36:56','2025-06-18 14:36:56'),
(158,'dada','dada',12,'Shirt','produk/9GFr5FirZv8p7bGPOH8ZloG21Ec5zndENs58x4lR.jpg','{\"S\":\"1\",\"M\":\"1\",\"L\":\"1\",\"XL\":\"1\",\"ALL\":\"1\"}','2025-06-19 12:02:14','2025-06-19 12:02:14'),
(159,'awd','awd',1000000,'Blouse','produk/xcL6vZ97gFAZRAUlAXgrLZeJP105F0Dp3j2I6zPc.jpg','{\"S\":\"1\",\"M\":\"1\",\"L\":\"1\",\"XL\":\"1\",\"ALL\":\"1\"}','2025-06-19 13:08:57','2025-06-19 13:12:55');
/*!40000 ALTER TABLE `produks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_items`
--

DROP TABLE IF EXISTS `transaksi_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi_id` bigint(20) unsigned NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `ukuran` varchar(20) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `nomor_resi` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `transaksi_id` (`transaksi_id`),
  CONSTRAINT `transaksi_items_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_items`
--

LOCK TABLES `transaksi_items` WRITE;
/*!40000 ALTER TABLE `transaksi_items` DISABLE KEYS */;
INSERT INTO `transaksi_items` VALUES
(56,40,'Ciara Bloom Dress','All Size',1,500000,'SN-0QFKH4LMPC','1111111','2025-06-01 06:05:38','2025-06-01 06:07:58','sukses'),
(57,40,'Jasmine Dress White','All Size',1,1500000,'SN-BUW7L1DCXG','1111111','2025-06-01 06:05:38','2025-06-01 06:08:01','sukses'),
(58,41,'Rose Gallica Dress White','All Size',1,250000,'SN-WES3BBS6IT',NULL,'2025-06-21 09:32:45','2025-06-21 09:32:45','pending');
/*!40000 ALTER TABLE `transaksi_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksis`
--

DROP TABLE IF EXISTS `transaksis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `va_number` varchar(255) DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksis`
--

LOCK TABLES `transaksis` WRITE;
/*!40000 ALTER TABLE `transaksis` DISABLE KEYS */;
INSERT INTO `transaksis` VALUES
(40,'Yafi Mahadika','08213123123123','yafi.mahadika2@gmail.com','Jln. Salemba Utan Barat, RT04/RW07 No.09','BCA','889464046610','2025-06-01 18:05:37',2000000,'2025-06-01 06:05:38','2025-06-01 06:08:01','sukses',NULL),
(41,'Yafi Mahadika','082112101926','yafi.mahadika2@gmail.com','Salemba','BCA','886433361173','2025-06-21 21:32:45',250000,'2025-06-21 09:32:45','2025-06-21 09:32:45','pending',NULL);
/*!40000 ALTER TABLE `transaksis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','produk','operation','finance') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Yafi Mahadika','yafi.mahadika2@gmail.com',NULL,'$2y$10$TlWsC5A5WQLTGkY9nDLRTOG7giTlTM03hXSsgNV2hPq0SYS/fW7Aa',NULL,'2025-05-24 12:14:17','2025-05-24 12:14:17','admin'),
(2,'Operator','Operator@gmail.com',NULL,'$2y$10$8WcuxYwtfRocWriOIxs2JeagMeTFhyZpkLKHpr/k5xRgDIMyRGEP2',NULL,'2025-06-01 05:34:58','2025-06-01 05:34:58','operation'),
(3,'Produk','Produk@gmail.com',NULL,'$2y$10$tJNcieFH3OhydqLKCmpJnujakhrRzHNUkkAXg0/ubicm3VDqr4Mmq',NULL,'2025-06-01 05:39:53','2025-06-01 05:39:53','produk'),
(4,'Finance','finance@gmail.com',NULL,'$2y$10$BL0z/r4t9IH/sYaga.6s8ux21a1f9xy4lZsMI5dWUIoPrBp7osfZ6',NULL,'2025-06-01 05:41:38','2025-06-01 05:41:38','finance'),
(5,'Admin','admin@gmail.com',NULL,'$2y$10$o8wMhMia4bWvKoioOhbRDuRe11qdSre32Fayp0oZCd//aqRYbL9cW','zdLQaUeJKwP7VvmoJt8vhgq3SH4AZDJ9BPzPdOnb9hE1noOiHmGYQqyPDvgY','2025-06-01 05:42:17','2025-06-01 05:42:17','admin'),
(6,'dada','phvvf4qp72@bltiwd.com',NULL,'$2y$10$kZ5UUK1azZg9AwnsLLAV1OSmkr/2uOZR4zddM1hH/2H8/xdeVftkm',NULL,'2025-06-19 12:01:00','2025-06-19 12:01:00','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-21 10:29:50
