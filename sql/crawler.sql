-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 15, 2023 at 11:49 AM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crawler`
--

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int NOT NULL,
  `zone_id` int DEFAULT NULL,
  `domain` varchar(256) NOT NULL,
  `domain_is2` tinyint(1) DEFAULT NULL,
  `add_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_timestamp` timestamp NULL DEFAULT NULL,
  `expire_timestamp` timestamp NULL DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `is_offline` tinyint(1) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `zone_id`, `domain`, `domain_is2`, `add_timestamp`, `check_timestamp`, `expire_timestamp`, `is_free`, `is_offline`, `level`, `disabled`) VALUES
(1, 4, 'fulldome.pro', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(2, 6, '7thsense.one', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(3, 9, 'lumenandforge.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(4, 9, 'dataton.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(5, 9, 'elumenati.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(6, 9, 'pacificdomes.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(7, 9, 'vioso.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0),
(8, 9, 'frontpictures.com', 1, '2023-06-15 04:42:17', NULL, NULL, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int NOT NULL,
  `from_page_id` int NOT NULL,
  `to_page_id` int NOT NULL,
  `has_a_text` tinyint(1) NOT NULL,
  `a_text` varchar(256) NOT NULL,
  `before_text` varchar(256) NOT NULL,
  `after_text` varchar(256) NOT NULL,
  `first_seen_timestamp` timestamp NOT NULL,
  `last_seen_timestamp` timestamp NOT NULL,
  `blinked` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `domain_id` int NOT NULL,
  `url` varchar(256) NOT NULL,
  `is_index` tinyint(1) NOT NULL,
  `add_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `crawled` tinyint(1) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `crawl_timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int NOT NULL,
  `zone` varchar(16) NOT NULL,
  `disabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `zone`, `disabled`) VALUES
(1, 'info', 0),
(2, 'gov', 0),
(3, 'edu', 0),
(4, 'pro', 0),
(5, 'online', 0),
(6, 'one', 0),
(7, 'org', 0),
(8, 'net', 0),
(9, 'com', 0),
(10, 'ru', 0),
(11, 'in', 0),
(12, 'ua', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain` (`domain`),
  ADD KEY `zone` (`zone_id`),
  ADD KEY `domain_is2` (`domain_is2`),
  ADD KEY `is_free` (`is_free`),
  ADD KEY `is_offline` (`is_offline`),
  ADD KEY `level` (`level`),
  ADD KEY `ignore` (`disabled`),
  ADD KEY `add_timestamp` (`add_timestamp`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `from_page_id` (`from_page_id`,`to_page_id`) USING BTREE,
  ADD KEY `has_a_text` (`has_a_text`),
  ADD KEY `first_seen_timestamp` (`first_seen_timestamp`),
  ADD KEY `last_seen_timestamp` (`last_seen_timestamp`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crawled` (`crawled`),
  ADD KEY `success` (`success`),
  ADD KEY `crawl_timestamp` (`crawl_timestamp`),
  ADD KEY `domain_id` (`domain_id`),
  ADD KEY `is_index` (`is_index`),
  ADD KEY `add_timestamp` (`add_timestamp`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zone` (`zone`),
  ADD KEY `disabled` (`disabled`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
