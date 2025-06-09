-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 08:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pre_order_baju`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengirim` varchar(255) DEFAULT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komplains`
--

CREATE TABLE `komplains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kontak` varchar(255) NOT NULL,
  `topik` varchar(255) DEFAULT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `komplains`
--

INSERT INTO `komplains` (`id`, `nama`, `kontak`, `topik`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mentari Agustina', '08210121212', 'Barang rusak', 'closed', '2025-05-27 13:42:23', '2025-05-27 17:54:51'),
(2, 'Mentari Agustina', '08210121212', 'Paket belum sampai', 'closed', '2025-05-28 05:14:05', '2025-05-28 05:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `komplain_messages`
--

CREATE TABLE `komplain_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `komplain_id` bigint(20) UNSIGNED NOT NULL,
  `pesan` text NOT NULL,
  `pengirim` enum('pelanggan','admin') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `komplain_messages`
--

INSERT INTO `komplain_messages` (`id`, `komplain_id`, `pesan`, `pengirim`, `created_at`, `updated_at`) VALUES
(1, 1, 'Selamat Malam', 'pelanggan', '2025-05-27 13:42:28', '2025-05-27 13:42:28'),
(2, 1, 'Selamat Malam', 'admin', '2025-05-27 17:54:29', '2025-05-27 17:54:29'),
(3, 2, 'Selamat Malam', 'pelanggan', '2025-05-28 05:14:13', '2025-05-28 05:14:13'),
(4, 2, 'Selamat Malam', 'admin', '2025-05-28 05:15:09', '2025-05-28 05:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_17_060159_add_role_to_users_table', 1),
(6, '2025_05_17_070519_update_role_column_on_users_table', 1),
(7, '2025_05_17_095220_create_produks_table', 1),
(8, '2025_05_17_132740_create_cart_items_table', 1),
(9, '2025_05_17_135231_create_keranjangs_table', 1),
(10, '2025_05_18_075724_create_transaksis_table', 1),
(11, '2025_05_18_103104_add_status_to_transaksis_table', 1),
(12, '2025_05_18_110734_add_serial_number_to_transaksis_table', 1),
(13, '2025_05_22_191125_create_chats_table', 1),
(14, '2025_05_23_092622_create_komplains_table', 1),
(15, '2025_05_23_093900_create_komplain_messages_table', 1),
(16, '2025_05_23_205833_add_status_to_komplains_table', 1),
(17, '2025_05_23_215940_add_topik_status_to_komplains_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `stock` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stock`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `nama`, `deskripsi`, `harga`, `kategori`, `gambar`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Sora Dandelion Flower Stripe Shirt', 'Sora Dandelion Flower Stripe Shirt memadukan motif bordir bunga dandelion biru dengan lengan panjang stripe vertikal, menciptakan kesan feminin dan modern. Kemeja loose fit ini nyaman dipakai seharian berkat bahan katun premium yang adem dan tidak mudah kusut. Cocok untuk tampilan semi-formal, kasual elegan, atau gaya kerja yang stylish.', 500000, 'Shirt', 'produk/MTTYfXTgwYqBdQN1F3k0HHIiC7EUc65XKkjsdMUY.jpg', '{\"S\":\"10\",\"M\":\"10\",\"L\":\"10\",\"XL\":\"10\",\"ALL\":\"10\"}', '2025-05-27 13:53:43', '2025-05-27 13:53:43'),
(2, 'Ciara Bloom Dress', 'Ciara Bloom Dress hadir dengan nuansa rose brown yang lembut, dihiasi bordir bunga mewah dari dada hingga ujung rok untuk kesan feminin dan elegan. Dress panjang A-line ini dilengkapi lengan puff bermanset dan dibuat dari bahan premium lace, tulle, serta inner halus yang nyaman dipakai. Cocok untuk acara formal seperti pesta, wisuda, atau hari raya, terutama bagi kamu yang berhijab.', 500000, 'Dress', 'produk/hhwohm7zjqUOqkBr0RhiSfnAiDPyXh2xX8tkk4SB.jpg', '{\"S\":\"10\",\"M\":\"10\",\"L\":\"10\",\"XL\":\"10\",\"ALL\":\"10\"}', '2025-05-27 13:55:18', '2025-05-27 13:55:18'),
(3, 'Chrysant Shirt', 'Chrysant Shirt adalah kemeja longline lengan panjang berwarna army green dengan bordir bunga krisan navy yang memadukan kesan tegas dan feminin. Dilengkapi dua kantong dada dan kancing depan senada, kemeja ini terbuat dari katun premium yang nyaman dikenakan. Cocok untuk gaya smart casual, acara santai, atau tampilan kerja yang stylish.', 850000, 'Shirt', 'produk/zCAVSEJ3LugXKAebWviyGOZKC3L0wUBfYTkjDtO8.jpg', '{\"S\":\"10\",\"M\":\"10\",\"L\":\"10\",\"XL\":\"10\",\"ALL\":\"10\"}', '2025-05-31 04:28:15', '2025-05-31 04:28:15'),
(4, 'Jasmine Dress White', 'Jasmine Dress White adalah gaun panjang A-line berwarna putih dengan bordir bunga hitam yang memberikan kesan elegan dan artistik. Dilengkapi lengan puff ¾, tali pinggang yang bisa disesuaikan, dan potongan flare yang anggun saat melangkah. Terbuat dari katun premium yang ringan dan adem, cocok untuk acara semi-formal, pesta siang hari, atau sesi foto.', 1500000, 'Dress', 'produk/plkWZxHWvgpEwlgrIDMQMOVd6YcVmpqulUlvBklC.jpg', '{\"S\":\"10\",\"M\":\"10\",\"L\":\"10\",\"XL\":\"10\",\"ALL\":\"10\"}', '2025-05-31 04:30:24', '2025-05-31 04:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `nama`, `telepon`, `email`, `alamat`, `metode_pembayaran`, `va_number`, `expired_at`, `total`, `created_at`, `updated_at`, `status`, `items`) VALUES
(40, 'Yafi Mahadika', '08213123123123', 'yafi.mahadika2@gmail.com', 'Jln. Salemba Utan Barat, RT04/RW07 No.09', 'BCA', '889464046610', '2025-06-01 18:05:37', 2000000, '2025-06-01 06:05:38', '2025-06-01 06:08:01', 'sukses', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_items`
--

CREATE TABLE `transaksi_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_id` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `ukuran` varchar(20) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `nomor_resi` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_items`
--

INSERT INTO `transaksi_items` (`id`, `transaksi_id`, `nama_produk`, `ukuran`, `jumlah`, `harga`, `serial_number`, `nomor_resi`, `created_at`, `updated_at`, `status`) VALUES
(56, 40, 'Ciara Bloom Dress', 'All Size', 1, 500000, 'SN-0QFKH4LMPC', '1111111', '2025-06-01 06:05:38', '2025-06-01 06:07:58', 'sukses'),
(57, 40, 'Jasmine Dress White', 'All Size', 1, 1500000, 'SN-BUW7L1DCXG', '1111111', '2025-06-01 06:05:38', '2025-06-01 06:08:01', 'sukses');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','produk','operation','finance') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Yafi Mahadika', 'yafi.mahadika2@gmail.com', NULL, '$2y$10$TlWsC5A5WQLTGkY9nDLRTOG7giTlTM03hXSsgNV2hPq0SYS/fW7Aa', NULL, '2025-05-24 12:14:17', '2025-05-24 12:14:17', 'admin'),
(2, 'Operator', 'Operator@gmail.com', NULL, '$2y$10$8WcuxYwtfRocWriOIxs2JeagMeTFhyZpkLKHpr/k5xRgDIMyRGEP2', NULL, '2025-06-01 05:34:58', '2025-06-01 05:34:58', 'operation'),
(3, 'Produk', 'Produk@gmail.com', NULL, '$2y$10$tJNcieFH3OhydqLKCmpJnujakhrRzHNUkkAXg0/ubicm3VDqr4Mmq', NULL, '2025-06-01 05:39:53', '2025-06-01 05:39:53', 'produk'),
(4, 'Finance', 'finance@gmail.com', NULL, '$2y$10$BL0z/r4t9IH/sYaga.6s8ux21a1f9xy4lZsMI5dWUIoPrBp7osfZ6', NULL, '2025-06-01 05:41:38', '2025-06-01 05:41:38', 'finance'),
(5, 'Admin', 'admin@gmail.com', NULL, '$2y$10$o8wMhMia4bWvKoioOhbRDuRe11qdSre32Fayp0oZCd//aqRYbL9cW', NULL, '2025-06-01 05:42:17', '2025-06-01 05:42:17', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_user_id_foreign` (`user_id`),
  ADD KEY `cart_items_produk_id_foreign` (`produk_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjangs_produk_id_foreign` (`produk_id`);

--
-- Indexes for table `komplains`
--
ALTER TABLE `komplains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komplain_messages`
--
ALTER TABLE `komplain_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komplain_messages_komplain_id_foreign` (`komplain_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_items`
--
ALTER TABLE `transaksi_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komplains`
--
ALTER TABLE `komplains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komplain_messages`
--
ALTER TABLE `komplain_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `transaksi_items`
--
ALTER TABLE `transaksi_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `komplain_messages`
--
ALTER TABLE `komplain_messages`
  ADD CONSTRAINT `komplain_messages_komplain_id_foreign` FOREIGN KEY (`komplain_id`) REFERENCES `komplains` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi_items`
--
ALTER TABLE `transaksi_items`
  ADD CONSTRAINT `transaksi_items_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
