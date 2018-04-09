-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 08:12 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dms_dhl`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_user`
--

CREATE TABLE `cms_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_user`
--

INSERT INTO `cms_user` (`id`, `username`, `password`, `name`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '1234', 'Superadmin CMS', NULL, NULL, NULL, '2018-03-21 08:57:11', '2018-04-01 17:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `dms_form`
--

CREATE TABLE `dms_form` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_location` int(10) NOT NULL,
  `id_purpose` int(11) NOT NULL,
  `asal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tujuan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporter_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cust_proj_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_form`
--

INSERT INTO `dms_form` (`id`, `id_dms_form`, `plat_no`, `driver_name`, `id_location`, `id_purpose`, `asal`, `tujuan`, `driver_phone`, `type_of_vehicle`, `transporter_company`, `shipment`, `cust_proj_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(115, 'dms11522614907', 'B 1234 CIB', 'C.S.I Andw', 1, 2, 'Bogor', NULL, '089634848272', 'Container 20\'', 'DHL', 'A1234', '7', '2018-04-01 09:35:07', '1', '2018-04-09 06:45:51', NULL),
(116, 'dms11522614998', 'F 3322 CIB', 'C.M.I Iman', 1, 2, 'Malaysia', NULL, '09898711111111', 'Van / L300', 'SiCepat', 'A1444', '8', '2018-04-01 09:36:38', '1', '2018-04-09 06:45:59', NULL),
(117, 'dms21522615084', 'F 1123 CIB', 'C.S.O Rina', 1, 2, NULL, 'Bandung', '098098777', 'Fuso', 'TIKI', 'A1455', '7', '2018-04-01 09:38:04', '1', '2018-04-09 06:46:05', NULL),
(118, 'dms21522615194', 'F 1123 CIB', 'C.M.O Kiki', 1, 1, NULL, 'Bandung', '8899889898', 'Container 20\'', 'TIKI', 'A1234', '8', '2018-04-01 09:39:54', '1', '2018-04-09 17:32:49', NULL),
(119, 'DMS11522667446', 'F 1123 RE', 'S.S.I Riyan', 1, 1, 'Aceh', NULL, '098666767', 'Tronton', 'JNE', 'A0987', '7', '2018-04-01 09:45:39', '1', '2018-04-09 08:15:18', NULL),
(120, 'dms11522615629', 'F 1123 DB', 'S.M.I Fakih', 1, 1, 'Medan', NULL, '0987778878', 'Container 20\'', 'DHL', 'A0988', '8', '2018-04-01 09:47:09', '1', '2018-04-09 06:46:10', NULL),
(123, 'dms11522659432', 'F 6543 TR', 'Anditio', 1, 1, 'Jakarta', NULL, '0897678678', 'Big Mama / Yellow', 'TIKI', 'A98KK', '7', '2018-04-01 21:57:12', '1', '2018-04-09 06:46:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_location`
--

CREATE TABLE `dms_master_location` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_project` int(10) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_location`
--

INSERT INTO `dms_master_location` (`id`, `location`, `id_project`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Cibitung', 7, '1', '', '2018-03-28 09:57:16', '2018-04-09 06:45:19'),
(2, 'Surabaya', 8, '1', '', '2018-03-28 09:57:16', '2018-04-09 06:45:22'),
(3, 'Cibitung', 8, '1', '1', '2018-03-29 04:26:33', '2018-04-09 06:45:39'),
(4, 'Surabaya', 7, '1', NULL, '2018-03-29 00:56:10', '2018-04-09 06:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_phone`
--

CREATE TABLE `dms_master_phone` (
  `id` int(10) UNSIGNED NOT NULL,
  `driver_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_phone`
--

INSERT INTO `dms_master_phone` (`id`, `driver_phone`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(11, '085718841359', '1', NULL, '2018-04-01 08:27:51', '2018-04-09 06:43:53'),
(23, '089634848272', '1', NULL, '2018-04-01 09:56:02', '2018-04-09 06:44:00'),
(24, '085718888888', '2', NULL, '2018-04-01 19:52:51', '2018-04-09 06:43:57'),
(26, '089635675676', '1', NULL, '2018-04-01 20:10:55', '2018-04-09 06:44:04'),
(27, '098666767', '1', NULL, '2018-04-09 08:04:08', '2018-04-09 08:04:08'),
(28, '098666767', '1', NULL, '2018-04-09 16:55:33', '2018-04-09 16:55:33'),
(29, '098666767', '1', NULL, '2018-04-09 16:55:53', '2018-04-09 16:55:53'),
(30, 'E', '1', NULL, '2018-04-09 16:56:28', '2018-04-09 16:56:28'),
(31, 'E', '1', NULL, '2018-04-09 16:56:58', '2018-04-09 16:56:58'),
(32, '089634848272', '1', NULL, '2018-04-09 17:27:02', '2018-04-09 17:27:02'),
(33, '089634848272', '1', NULL, '2018-04-09 17:28:00', '2018-04-09 17:28:00'),
(34, '0897678678', '1', NULL, '2018-04-09 17:28:23', '2018-04-09 17:28:23'),
(35, '8899889898', '1', NULL, '2018-04-09 17:29:30', '2018-04-09 17:29:30'),
(36, '1', '1', NULL, '2018-04-09 17:30:03', '2018-04-09 17:30:03'),
(37, '8899889898', '1', NULL, '2018-04-09 17:32:50', '2018-04-09 17:32:50'),
(38, '1', '1', NULL, '2018-04-09 17:32:59', '2018-04-09 17:32:59'),
(39, '09898711111111', '1', NULL, '2018-04-09 17:33:55', '2018-04-09 17:33:55'),
(40, '1', '1', NULL, '2018-04-09 17:36:03', '2018-04-09 17:36:03'),
(41, '0897678678', '1', NULL, '2018-04-09 17:36:15', '2018-04-09 17:36:15'),
(42, '1', '1', NULL, '2018-04-09 17:36:32', '2018-04-09 17:36:32'),
(43, '1', '1', NULL, '2018-04-09 17:49:38', '2018-04-09 17:49:38'),
(44, '0897678678', '1', NULL, '2018-04-09 17:49:47', '2018-04-09 17:49:47'),
(45, '1', '1', NULL, '2018-04-09 17:49:55', '2018-04-09 17:49:55'),
(46, '089634848272', '1', NULL, '2018-04-09 17:53:02', '2018-04-09 17:53:02'),
(47, '089634848272', '1', NULL, '2018-04-09 17:53:27', '2018-04-09 17:53:27'),
(48, '089634848272', '1', NULL, '2018-04-09 18:00:03', '2018-04-09 18:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_plat`
--

CREATE TABLE `dms_master_plat` (
  `id` int(10) UNSIGNED NOT NULL,
  `plat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_plat`
--

INSERT INTO `dms_master_plat` (`id`, `plat_no`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(55, 'F 1123 RE', '3', NULL, '2018-04-01 09:45:39', '2018-04-09 06:42:17'),
(56, 'F 9923 DB', '3', NULL, '2018-04-01 09:47:09', '2018-04-09 06:42:21'),
(57, 'F 6543 TR', '3', NULL, '2018-04-01 09:48:24', '2018-04-09 06:42:24'),
(58, 'F 8823 TT', '3', NULL, '2018-04-01 09:49:32', '2018-04-09 06:42:26'),
(61, 'F 1233 RT', '2', NULL, '2018-04-01 19:52:51', '2018-04-09 06:42:29'),
(62, 'F 1123 RE', '1', NULL, '2018-04-09 08:04:08', '2018-04-09 08:04:08'),
(63, 'F 1123 RE', '1', NULL, '2018-04-09 16:55:33', '2018-04-09 16:55:33'),
(64, 'F 1123 RE', '1', NULL, '2018-04-09 16:55:52', '2018-04-09 16:55:52'),
(65, 'eeE', '1', NULL, '2018-04-09 16:56:28', '2018-04-09 16:56:28'),
(66, 'eeE', '1', NULL, '2018-04-09 16:56:58', '2018-04-09 16:56:58'),
(67, 'B 1234 CIB', '1', NULL, '2018-04-09 17:27:02', '2018-04-09 17:27:02'),
(68, 'B 1234 CIB', '1', NULL, '2018-04-09 17:28:00', '2018-04-09 17:28:00'),
(69, 'F 6543 TR', '1', NULL, '2018-04-09 17:28:23', '2018-04-09 17:28:23'),
(70, 'F 1123 CIB', '1', NULL, '2018-04-09 17:29:30', '2018-04-09 17:29:30'),
(71, 'F 9923 DB', '1', NULL, '2018-04-09 17:30:03', '2018-04-09 17:30:03'),
(72, 'F 1123 CIB', '1', NULL, '2018-04-09 17:32:50', '2018-04-09 17:32:50'),
(73, 'F 9923 DB', '1', NULL, '2018-04-09 17:32:59', '2018-04-09 17:32:59'),
(74, 'F 3322 CIB', '1', NULL, '2018-04-09 17:33:55', '2018-04-09 17:33:55'),
(75, 'F 9923 DB', '1', NULL, '2018-04-09 17:36:03', '2018-04-09 17:36:03'),
(76, 'F 6543 TR', '1', NULL, '2018-04-09 17:36:15', '2018-04-09 17:36:15'),
(77, 'F 9923 DB', '1', NULL, '2018-04-09 17:36:32', '2018-04-09 17:36:32'),
(78, 'F 9923 DB', '1', NULL, '2018-04-09 17:49:38', '2018-04-09 17:49:38'),
(79, 'F 6543 TR', '1', NULL, '2018-04-09 17:49:47', '2018-04-09 17:49:47'),
(80, 'F 9923 DB', '1', NULL, '2018-04-09 17:49:55', '2018-04-09 17:49:55'),
(81, 'B 1234 CIB', '1', NULL, '2018-04-09 17:53:02', '2018-04-09 17:53:02'),
(82, 'B 1234 CIB', '1', NULL, '2018-04-09 17:53:27', '2018-04-09 17:53:27'),
(83, 'B 1234 CIB', '1', NULL, '2018-04-09 18:00:03', '2018-04-09 18:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_project`
--

CREATE TABLE `dms_master_project` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_project`
--

INSERT INTO `dms_master_project` (`id`, `master_project_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 'SCHNEIDER', '1', '1', '2018-03-21 23:13:07', '2018-04-09 06:42:06'),
(8, 'MONDELEZ', '1', '1', '2018-03-21 23:13:15', '2018-04-09 06:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_status`
--

CREATE TABLE `dms_master_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_status`
--

INSERT INTO `dms_master_status` (`id`, `status_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Waiting Outside', '1', '1', '2018-03-28 03:47:07', '2018-04-09 06:41:48'),
(2, 'Waiting Gate', '1', NULL, '2018-03-28 03:47:07', '2018-04-09 06:41:37'),
(3, 'Truck Enter WH', '1', NULL, '2018-03-28 03:47:07', '2018-04-09 06:41:39'),
(4, 'Loading', '1', NULL, '2018-03-28 03:47:07', '2018-04-09 06:41:41'),
(5, 'Complete Loading', '1', NULL, '2018-03-28 03:47:07', '2018-04-09 06:41:43'),
(6, 'Leave Warehouse', '1', NULL, '2018-03-28 03:47:07', '2018-04-09 06:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_tc`
--

CREATE TABLE `dms_master_tc` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_tc_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_tc`
--

INSERT INTO `dms_master_tc` (`id`, `master_tc_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'DHL', NULL, NULL, '2018-03-13 15:10:31', '2018-03-13 15:10:31'),
(3, 'TIKI', NULL, NULL, '2018-03-13 15:10:31', '2018-03-13 15:10:31'),
(4, 'JNE', NULL, NULL, '2018-03-13 15:10:31', '2018-03-13 15:10:31'),
(5, 'J&T', NULL, NULL, '2018-03-13 15:10:31', '2018-03-13 15:10:31'),
(6, 'SiCepat', NULL, NULL, '2018-03-13 15:10:31', '2018-03-13 15:10:31'),
(7, 'Ninja Express', '1', NULL, '2018-03-15 01:09:12', '2018-04-09 06:41:25'),
(8, 'JNT', '1', NULL, '2018-03-23 02:09:33', '2018-04-09 06:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_vehicle`
--

CREATE TABLE `dms_master_vehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_vehicle_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_vehicle`
--

INSERT INTO `dms_master_vehicle` (`id`, `master_vehicle_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'Van / L300', NULL, '1', '2018-03-13 15:07:58', '2018-04-09 06:41:12'),
(4, 'CDE / CD4', NULL, '1', '2018-03-13 15:07:58', '2018-04-09 06:41:14'),
(5, 'CDD / CD6', NULL, '1', '2018-03-13 15:07:58', '2018-04-09 06:41:17'),
(6, 'Fuso', '1', NULL, '2018-04-06 08:01:46', '2018-04-09 06:40:52'),
(7, 'Tronton', '1', NULL, '2018-04-06 08:01:53', '2018-04-09 06:40:55'),
(8, 'Wing-Box', '1', NULL, '2018-04-06 08:02:01', '2018-04-09 06:40:57'),
(9, 'Container 20\'', '1', NULL, '2018-04-06 08:02:10', '2018-04-09 06:41:03'),
(10, 'Container 40\'', '1', NULL, '2018-04-06 08:02:18', '2018-04-09 06:41:05'),
(11, 'Big Mama / Yellow', '1', NULL, '2018-04-06 08:02:26', '2018-04-09 06:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `dms_purpose`
--

CREATE TABLE `dms_purpose` (
  `id` int(10) UNSIGNED NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_purpose`
--

INSERT INTO `dms_purpose` (`id`, `purpose`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Inbound', '1', '1', NULL, NULL),
(2, 'Outbound', '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dms_transaction`
--

CREATE TABLE `dms_transaction` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waiting_time` time DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_scan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by_checker` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction`
--

INSERT INTO `dms_transaction` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `last_scan`, `arrival_time`, `exit_time`, `updated_by_checker`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(94, 'dms11522614907', '2', '6', NULL, 'Apr 08, 18 21:55:15', '01:00', '2018-04-01 16:35:07', 'Apr 10, 18 01:00:20', 0, '2018-04-01 09:35:07', '1', '2018-04-09 18:00:20', '1'),
(95, 'dms11522614998', '2', '2', '15:21:00', 'Apr 04, 18 1:15:43', '', '2018-04-01 16:36:38', '2018-04-02 03:21:57', 0, '2018-04-01 09:36:38', '1', '2018-04-09 17:33:55', '1'),
(96, 'dms21522615084', '2', '2', NULL, 'Apr 04, 18 2:15:33', '', '2018-04-01 16:38:04', NULL, 0, '2018-04-01 09:38:04', '1', '2018-04-09 06:37:01', '1'),
(97, 'dms21522615194', '1', '2', NULL, 'Apr 04, 18 4:15:55', '', '2018-04-01 16:39:54', NULL, 0, '2018-04-01 09:39:55', '1', '2018-04-09 06:37:03', '1'),
(98, 'DMS11522667446', '2', '6', '13:00:00', 'Apr 04, 18 4:45:32', '23:28', '2018-04-01 16:45:39', 'Apr 09, 18 23:28:29', 0, '2018-04-01 09:45:39', '1', '2018-04-09 16:55:52', '1'),
(99, 'dms11522615629', '1', '6', NULL, 'Apr 04, 18 13:42:03', '', '2018-04-01 16:47:09', 'Apr 04, 18 13:42:21', 0, '2018-04-01 09:47:09', '1', '2018-04-09 06:37:07', '1'),
(102, 'dms11522659432', '1', '6', NULL, 'Apr 04, 18 5:45:12', '23:37', '2018-04-02 04:57:12', 'Apr 08, 18 23:37:35', 0, '2018-04-01 21:57:12', '1', '2018-04-09 06:37:09', '1');

-- --------------------------------------------------------

--
-- Table structure for table `dms_transaction_history`
--

CREATE TABLE `dms_transaction_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiting_time` time DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_scan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by_checker` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction_history`
--

INSERT INTO `dms_transaction_history` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `last_scan`, `arrival_time`, `exit_time`, `updated_by_checker`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(278, 'dms11522615539', NULL, '3', NULL, NULL, '14:08', NULL, NULL, 0, '2018-04-09 07:08:44', '1', '2018-04-09 07:08:44', NULL),
(279, 'dms11522615539', '2', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-04-09 08:04:08', '1', '2018-04-09 08:04:08', NULL),
(280, 'DMS11522667446', NULL, '4', NULL, NULL, '15:15', NULL, NULL, 0, '2018-04-09 08:15:48', '1', '2018-04-09 08:15:48', NULL),
(281, 'DMS11522667446', NULL, '5', NULL, NULL, '15:16', NULL, NULL, 0, '2018-04-09 08:16:03', '1', '2018-04-09 08:16:03', NULL),
(282, 'DMS11522667446', NULL, '3', NULL, NULL, '16:16', NULL, NULL, NULL, '2018-04-09 09:16:16', '1', '2018-04-09 09:16:16', NULL),
(283, 'DMS11522667446', NULL, '4', NULL, NULL, '17:05', NULL, NULL, NULL, '2018-04-09 10:05:20', '1', '2018-04-09 10:05:20', NULL),
(284, 'DMS11522667446', NULL, '5', NULL, NULL, '17:05', NULL, NULL, NULL, '2018-04-09 10:05:30', '1', '2018-04-09 10:05:30', NULL),
(285, 'DMS11522667446', NULL, '6', NULL, NULL, '23:28', NULL, 'Apr 09, 18 23:28:29', NULL, '2018-04-09 16:28:29', '1', '2018-04-09 16:28:29', NULL),
(286, 'DMS11522667446', '2', NULL, '01:00:00', NULL, NULL, NULL, NULL, NULL, '2018-04-09 16:55:33', '1', '2018-04-09 16:55:33', NULL),
(287, 'DMS11522667446', '2', NULL, '13:00:00', NULL, NULL, NULL, NULL, NULL, '2018-04-09 16:55:52', '1', '2018-04-09 16:55:52', NULL),
(288, 'DMS21523332588', NULL, '1', NULL, 'Apr 09, 18 23:56:28', NULL, 'Apr 09, 18 23:56:28', NULL, NULL, '2018-04-09 16:56:28', '1', '2018-04-09 16:56:28', NULL),
(289, 'DMS21523332588', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 16:56:58', '1', '2018-04-09 16:56:58', NULL),
(290, 'dms11522614907', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:27:02', '1', '2018-04-09 17:27:02', NULL),
(291, 'dms11522614907', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:28:00', '1', '2018-04-09 17:28:00', NULL),
(292, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:28:22', '1', '2018-04-09 17:28:22', NULL),
(293, 'dms21522615194', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:29:30', '1', '2018-04-09 17:29:30', NULL),
(294, 'DMS11522827294', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:30:03', '1', '2018-04-09 17:30:03', NULL),
(295, 'dms21522615194', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:32:50', '1', '2018-04-09 17:32:50', NULL),
(296, 'DMS11522827294', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:32:59', '1', '2018-04-09 17:32:59', NULL),
(297, 'dms11522614998', '2', NULL, '15:21:00', NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:33:55', '1', '2018-04-09 17:33:55', NULL),
(298, 'DMS11522827294', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:36:02', '1', '2018-04-09 17:36:02', NULL),
(299, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:36:15', '1', '2018-04-09 17:36:15', NULL),
(300, 'DMS11522827294', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:36:32', '1', '2018-04-09 17:36:32', NULL),
(301, 'DMS11522827294', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:49:38', '1', '2018-04-09 17:49:38', NULL),
(302, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:49:47', '1', '2018-04-09 17:49:47', NULL),
(303, 'DMS11522827294', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:49:55', '1', '2018-04-09 17:49:55', NULL),
(304, 'dms11522614907', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:53:02', '1', '2018-04-09 17:53:02', NULL),
(305, 'dms11522614907', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 17:53:27', '1', '2018-04-09 17:53:27', NULL),
(306, 'dms11522614907', NULL, '4', NULL, NULL, '00:55', NULL, NULL, NULL, '2018-04-09 17:55:12', '1', '2018-04-09 17:55:12', NULL),
(307, 'dms11522614907', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-09 18:00:03', '1', '2018-04-09 18:00:03', NULL),
(308, 'dms11522614907', NULL, '5', NULL, NULL, '01:00', NULL, NULL, NULL, '2018-04-09 18:00:10', '1', '2018-04-09 18:00:10', NULL),
(309, 'dms11522614907', NULL, '6', NULL, NULL, '01:00', NULL, 'Apr 10, 18 01:00:20', NULL, '2018-04-09 18:00:20', '1', '2018-04-09 18:00:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dms_user_group`
--

CREATE TABLE `dms_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `usergroup_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_user_group`
--

INSERT INTO `dms_user_group` (`id`, `usergroup_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'SUPER ADMIN', '1', NULL, '2018-03-09 02:53:14', '2018-04-09 06:38:12'),
(2, 'ADMIN', '1', NULL, '2018-03-16 04:38:53', '2018-04-09 06:38:04'),
(3, 'SECURITY', '1', NULL, '2018-03-16 04:38:53', '2018-04-09 06:38:05'),
(4, 'CHECKER', '1', NULL, '2018-03-23 00:53:23', '2018-04-09 06:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `dms_user_management`
--

CREATE TABLE `dms_user_management` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_usergroup` int(11) DEFAULT NULL,
  `id_location` int(10) DEFAULT NULL,
  `id_project` int(15) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_user_management`
--

INSERT INTO `dms_user_management` (`id`, `username`, `name`, `password`, `remember_token`, `id_usergroup`, `id_location`, `id_project`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin DMS', '1234', NULL, 1, 1, 8, '1', '1', '2018-03-16 16:52:12', '2018-04-09 06:39:03'),
(2, 'security1', 'Sec.Cib', '1234', NULL, 3, 1, 7, '1', '1', '2018-03-09 02:54:37', '2018-04-09 06:39:05'),
(3, 'security2', 'Sec.Sby', '1234', NULL, 3, 2, 7, '1', '1', '2018-03-09 02:54:37', '2018-04-09 06:39:07'),
(4, 'admin1a', 'Adm.Cib.Sch', '1234', NULL, 2, 1, 7, '1', '1', '2018-03-19 07:25:56', '2018-04-09 06:39:09'),
(5, 'admin1b', 'Adm.Cib.Mon', '1234', NULL, 2, 1, 8, '1', '1', '2018-03-23 02:08:28', '2018-04-09 06:39:11'),
(6, 'admin2a', 'Adm.Sby.Sch', '1234', NULL, 2, 2, 7, '1', '1', '2018-03-19 07:25:56', '2018-04-09 06:39:13'),
(7, 'admin2b', 'Adm.Sby.Mon', '1234', NULL, 2, 2, 8, '1', '1', '2018-03-23 02:08:28', '2018-04-09 06:39:15'),
(8, 'checker1a', 'Chk.Cib.Sch', '1234', NULL, 4, 1, 7, '1', '1', '2018-03-27 23:09:04', '2018-04-09 06:39:18'),
(9, 'checker1b', 'Chk.Cib.Mon', '1234', NULL, 4, 1, 8, '1', '1', '2018-03-27 23:09:04', '2018-04-09 06:39:20'),
(10, 'checker2a', 'Chk.Sby.Sch', '1234', NULL, 4, 2, 7, '1', '1', '2018-03-27 23:09:04', '2018-04-09 06:39:22'),
(11, 'checker2b', 'Chk.Sby.Mon', '1234', NULL, 4, 2, 8, '1', '1', '2018-03-27 23:09:04', '2018-04-09 06:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2018_03_08_074209_create_master_driver_table', 1),
(14, '2018_03_08_074330_create_master_tc_table', 1),
(15, '2018_03_08_074344_create_master_project_table', 1),
(16, '2018_03_08_074354_create_master_vehicle_table', 1),
(17, '2018_03_08_074531_create_user_management_table', 1),
(18, '2018_03_08_074616_create_user_group_table', 1),
(19, '2018_03_12_064949_create_form_table', 2),
(20, '2018_03_12_065117_create_transaction_table', 2),
(21, '2018_03_12_065130_create_transaction_history_table', 2),
(22, '2018_03_12_083901_create_purpose_table', 3),
(23, '2018_03_26_035845_create_master_phone_table', 4),
(24, '2018_03_28_033755_create_master_status_table', 5),
(25, '2018_03_28_095350_create_master_location_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'lutfi', 'lutfi.febrianto@gmail.com', '$2y$10$5qSWQLDNChSgSfiSDlxmnOy/HEFoG0I5Dix3FBPjSBS4YpbIA68Le', 'n4WQrwYtOjBXwHpCpYNi9DZvBQlY4DMsJ0z27DeXNjDbfpj1IffUCrvTJGRA', '2018-03-08 02:49:19', '2018-03-08 02:49:19'),
(2, 'asd', 'asd@gmail.com', '$2y$10$ckiDXVSoVqCiU.k.DajxB.dKP7vKXLzoyAEVNY2.6wt7edNOkt4si', 'eJHBrvf9DBsfmnVBhEQhEmpOaakb13JMlX5QhIKCZLLjWM3XHDxqqlQhgcwC', '2018-03-08 02:54:55', '2018-03-08 02:54:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_user`
--
ALTER TABLE `cms_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_form`
--
ALTER TABLE `dms_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_location`
--
ALTER TABLE `dms_master_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_phone`
--
ALTER TABLE `dms_master_phone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_plat`
--
ALTER TABLE `dms_master_plat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_project`
--
ALTER TABLE `dms_master_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_status`
--
ALTER TABLE `dms_master_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_tc`
--
ALTER TABLE `dms_master_tc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_master_vehicle`
--
ALTER TABLE `dms_master_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_purpose`
--
ALTER TABLE `dms_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_transaction`
--
ALTER TABLE `dms_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_transaction_history`
--
ALTER TABLE `dms_transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_user_group`
--
ALTER TABLE `dms_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dms_user_management`
--
ALTER TABLE `dms_user_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_user`
--
ALTER TABLE `cms_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dms_form`
--
ALTER TABLE `dms_form`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `dms_master_location`
--
ALTER TABLE `dms_master_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dms_master_phone`
--
ALTER TABLE `dms_master_phone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `dms_master_plat`
--
ALTER TABLE `dms_master_plat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `dms_master_project`
--
ALTER TABLE `dms_master_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dms_master_status`
--
ALTER TABLE `dms_master_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dms_master_tc`
--
ALTER TABLE `dms_master_tc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dms_master_vehicle`
--
ALTER TABLE `dms_master_vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dms_purpose`
--
ALTER TABLE `dms_purpose`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dms_transaction`
--
ALTER TABLE `dms_transaction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `dms_transaction_history`
--
ALTER TABLE `dms_transaction_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `dms_user_group`
--
ALTER TABLE `dms_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dms_user_management`
--
ALTER TABLE `dms_user_management`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
