-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2018 at 07:12 PM
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
(115, 'dms11522614907', 'B 1234 CIB', 'C.S.I Andw', 1, 2, 'Bogor', NULL, '089634848272', 'Container 20\'', 'DHL', 'A1234', '7', '2018-04-01 09:35:07', 'Superadmin DMS', '2018-04-08 13:38:05', NULL),
(116, 'dms11522614998', 'F 3322 CIB', 'C.M.I Iman', 1, 2, 'Malaysia', NULL, '09898711111111', 'Van / L300', 'SiCepat', 'A1444', '8', '2018-04-01 09:36:38', 'Superadmin DMS', '2018-04-08 13:40:12', NULL),
(117, 'dms21522615084', 'F 1123 CIB', 'C.S.O Rina', 1, 2, NULL, 'Bandung', '098098777', 'Fuso', 'TIKI', 'A1455', '7', '2018-04-01 09:38:04', 'Superadmin DMS', '2018-04-06 08:05:18', NULL),
(118, 'dms21522615194', 'F 1123 CIB', 'C.M.O Kiki', 1, 2, NULL, 'Bandung', '8899889898', 'Container 20\'', 'TIKI', 'A1234', '8', '2018-04-01 09:39:54', 'Superadmin DMS', '2018-04-06 08:05:31', NULL),
(119, 'dms11522615539', 'F 1123 RE', 'S.S.I Riyan', 1, 1, 'Aceh', NULL, '098666767', 'Tronton', 'JNE', 'A0987', '7', '2018-04-01 09:45:39', 'Superadmin DMS', '2018-04-06 08:04:08', NULL),
(120, 'dms11522615629', 'F 1123 DB', 'S.M.I Fakih', 1, 1, 'Medan', NULL, '0987778878', 'Container 20\'', 'DHL', 'A0988', '8', '2018-04-01 09:47:09', 'Superadmin DMS', '2018-04-06 08:04:15', NULL),
(121, 'dms21522615703', 'F 6543 TR', 'S.S.O Darevis', 2, 2, NULL, 'Manado', '077789877', 'Tronton Box', 'J&T', 'A1234', '7', '2018-04-01 09:48:23', 'Sec.Sby', '2018-04-02 03:29:13', NULL),
(122, 'dms21522615772', 'F 1123 RE', 'S.M.O Rika', 2, 2, NULL, 'Depok', '02772828', 'Tronton Box', 'JNE', 'A1444', '8', '2018-04-01 09:49:32', 'Sec.Sby', '2018-04-02 03:29:16', NULL),
(123, 'dms11522659432', 'F 6543 TR', 'Anditio', 1, 1, 'Jakarta', NULL, '0897678678', 'Big Mama / Yellow', 'TIKI', 'A98KK', '7', '2018-04-01 21:57:12', 'Superadmin DMS', '2018-04-06 08:04:22', NULL),
(124, 'DMS11522667446', 'F 4444 AA', 'test', 1, 1, 'A', NULL, '089634848272', 'Tronton Box', 'TIKI', 'A134EE', '1', '2018-04-02 00:10:46', 'Superadmin DMS', '2018-04-03 04:36:09', NULL),
(125, 'DMS11522763320', 'tes', 'tes', 1, 1, 'tes', NULL, 'tes', 'Colt Diesel Double', 'DHL', 'tes', '7', '2018-04-03 02:48:40', 'Superadmin DMS', '2018-04-03 02:48:40', NULL),
(126, 'DMS11522763336', 'tes', 'tes', 1, 1, 'tes', NULL, 'tes', 'Colt Diesel Double', 'DHL', 'tes', '7', '2018-04-03 02:48:56', 'Superadmin DMS', '2018-04-03 02:48:56', NULL),
(129, 'DMS11522764107', 'q', 'q', 1, 1, 'q', 'q', 'q', 'Colt Diesel Double', 'DHL', 'q', '7', '2018-04-03 03:01:47', 'Superadmin DMS', '2018-04-03 03:01:47', NULL),
(137, 'DMS11522827294', 'F 9923 DB', 'BARU bgt', 1, 1, '1', '1', '1', 'Van / L300', 'DHL', '123', '7', '2018-04-03 20:34:54', 'Superadmin DMS', '2018-04-06 08:04:28', NULL),
(138, 'DMS11522827966', 'test', 'test', 1, 1, 'e', 'e', 'e', 'Fuso', 'TIKI', 'e', '7', '2018-04-03 20:46:06', 'Superadmin DMS', '2018-04-06 08:04:42', NULL),
(141, 'DMS11522862406', 'baru', 'Ntaps', 1, 1, 's', 's', 'tes', 'Tronton', 'JNE', 'Success', '7', '2018-04-04 06:20:06', 'Superadmin DMS', '2018-04-06 08:04:55', NULL),
(143, 'DMS11522863516', 'tests', 's', 1, 1, 's', 's', 's', 'Wing-Box', 'SiCepat', 'sampais', '7', '2018-04-04 06:38:36', 'Superadmin DMS', '2018-04-06 08:05:03', NULL),
(144, 'DMS21523027088', 'F 1333 DDd', 'w', 1, 2, 'w', 'w', 'w', 'Fuso', 'TIKI', 'w', '7', '2018-04-06 04:04:48', 'Superadmin DMS', '2018-04-06 08:09:59', NULL),
(145, 'DMS11523239838', 'e', 'e', 1, 1, 'e', 'e', 'e', 'Van / L300', 'DHL', 'e', '7', '2018-04-08 15:10:38', 'Superadmin DMS', '2018-04-08 15:10:38', NULL),
(146, 'DMS11523239917', 'e', 'e', 1, 1, 'e', 'e', 'e', 'Van / L300', 'DHL', 'e', '7', '2018-04-08 15:11:57', 'Superadmin DMS', '2018-04-08 15:11:57', NULL);

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
(1, 'Cibitung', 7, 'Lutfi', '', '2018-03-28 09:57:16', '2018-03-28 10:19:00'),
(2, 'Surabaya', 8, 'Lutfi', '', '2018-03-28 09:57:16', '2018-03-28 10:19:03'),
(3, 'Cibitung', 8, '', 'Lutfi', '2018-03-29 04:26:33', '2018-03-29 04:26:33'),
(4, 'Surabaya', 7, 'Dery', NULL, '2018-03-29 00:56:10', '2018-03-29 07:56:20');

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
(11, '085718841359', 'Super Admin Name', NULL, '2018-04-01 08:27:51', '2018-04-01 08:27:51'),
(23, '089634848272', 'Super Admin Name', NULL, '2018-04-01 09:56:02', '2018-04-01 09:56:02'),
(24, '085718888888', 'Sec.Cib', NULL, '2018-04-01 19:52:51', '2018-04-01 19:52:51'),
(25, '09898711111111', 'Superadmin DMS', NULL, '2018-04-01 20:05:49', '2018-04-01 20:05:49'),
(26, '089635675676', 'Superadmin DMS', NULL, '2018-04-01 20:10:55', '2018-04-01 20:10:55'),
(27, '098666767', 'Superadmin DMS', NULL, '2018-04-01 20:17:19', '2018-04-01 20:17:19'),
(28, '0987778878', 'Superadmin DMS', NULL, '2018-04-01 20:20:38', '2018-04-01 20:20:38'),
(29, '0897678678', 'Superadmin DMS', NULL, '2018-04-01 21:57:12', '2018-04-01 21:57:12'),
(30, 'tes', 'Superadmin DMS', NULL, '2018-04-03 02:49:17', '2018-04-03 02:49:17'),
(31, 's', 'Superadmin DMS', NULL, '2018-04-03 02:51:38', '2018-04-03 02:51:38'),
(32, 'q', 'Superadmin DMS', NULL, '2018-04-03 03:02:33', '2018-04-03 03:02:33'),
(33, 'e', 'Superadmin DMS', NULL, '2018-04-03 03:05:13', '2018-04-03 03:05:13'),
(34, 'r', 'Superadmin DMS', NULL, '2018-04-03 20:02:42', '2018-04-03 20:02:42'),
(35, '1', 'Superadmin DMS', NULL, '2018-04-03 20:34:55', '2018-04-03 20:34:55'),
(36, 'w', 'Superadmin DMS', NULL, '2018-04-06 04:04:49', '2018-04-06 04:04:49'),
(37, '098098777', 'Superadmin DMS', NULL, '2018-04-06 08:05:18', '2018-04-06 08:05:18'),
(38, '8899889898', 'Superadmin DMS', NULL, '2018-04-06 08:05:31', '2018-04-06 08:05:31'),
(39, '098098777', 'Superadmin DMS', NULL, '2018-04-08 13:21:32', '2018-04-08 13:21:32'),
(40, '098098777', 'Superadmin DMS', NULL, '2018-04-08 13:23:56', '2018-04-08 13:23:56'),
(41, 'w', 'Superadmin DMS', NULL, '2018-04-08 13:24:24', '2018-04-08 13:24:24'),
(42, '089634848272', 'Superadmin DMS', NULL, '2018-04-08 13:38:05', '2018-04-08 13:38:05'),
(43, '09898711111111', 'Superadmin DMS', NULL, '2018-04-08 13:40:12', '2018-04-08 13:40:12'),
(44, '098666767', 'Superadmin DMS', NULL, '2018-04-08 14:00:07', '2018-04-08 14:00:07'),
(45, '089634848272', 'Superadmin DMS', NULL, '2018-04-08 14:51:56', '2018-04-08 14:51:56'),
(46, 'e', 'Superadmin DMS', NULL, '2018-04-08 15:11:58', '2018-04-08 15:11:58'),
(47, 'w', 'Superadmin DMS', NULL, '2018-04-08 15:12:29', '2018-04-08 15:12:29'),
(48, '0897678678', 'Superadmin DMS', NULL, '2018-04-08 16:33:54', '2018-04-08 16:33:54'),
(49, '0897678678', 'Superadmin DMS', NULL, '2018-04-08 16:34:10', '2018-04-08 16:34:10'),
(50, '0897678678', 'Superadmin DMS', NULL, '2018-04-08 16:34:35', '2018-04-08 16:34:35');

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
(55, 'F 1123 RE', 'Sec.Sby', NULL, '2018-04-01 09:45:39', '2018-04-01 09:45:39'),
(56, 'F 9923 DB', 'Sec.Sby', NULL, '2018-04-01 09:47:09', '2018-04-01 17:03:04'),
(57, 'F 6543 TR', 'Sec.Sby', NULL, '2018-04-01 09:48:24', '2018-04-01 09:48:24'),
(58, 'F 8823 TT', 'Sec.Sby', NULL, '2018-04-01 09:49:32', '2018-04-01 17:02:58'),
(61, 'F 1233 RT', 'Sec.Cib', NULL, '2018-04-01 19:52:51', '2018-04-01 19:52:51'),
(62, 'B 1234 CIB', 'Superadmin DMS', NULL, '2018-04-01 20:03:44', '2018-04-01 20:03:44'),
(63, 'F 3322 CIB', 'Superadmin DMS', NULL, '2018-04-01 20:05:49', '2018-04-01 20:05:49'),
(64, 'F 1333 DD', 'Superadmin DMS', NULL, '2018-04-01 20:10:55', '2018-04-01 20:10:55'),
(65, 'F 1123 DB', 'Superadmin DMS', NULL, '2018-04-01 20:20:38', '2018-04-01 20:20:38'),
(66, 'F 4444 AA', 'Superadmin DMS', NULL, '2018-04-02 00:10:47', '2018-04-02 00:10:47'),
(67, 'tes', 'Superadmin DMS', NULL, '2018-04-03 02:49:17', '2018-04-03 02:49:17'),
(68, 'q', 'Superadmin DMS', NULL, '2018-04-03 03:02:33', '2018-04-03 03:02:33'),
(69, 'eEe', 'Superadmin DMS', NULL, '2018-04-03 03:05:13', '2018-04-03 03:05:13'),
(70, 'r', 'Superadmin DMS', NULL, '2018-04-03 20:02:42', '2018-04-03 20:02:42'),
(71, 'test', 'Superadmin DMS', NULL, '2018-04-03 20:46:06', '2018-04-03 20:46:06'),
(72, 'e', 'Superadmin DMS', NULL, '2018-04-04 03:50:25', '2018-04-04 03:50:25'),
(73, 'baru', 'Superadmin DMS', NULL, '2018-04-04 06:20:06', '2018-04-04 06:20:06'),
(74, 'tests', 'Superadmin DMS', NULL, '2018-04-04 06:38:36', '2018-04-04 06:38:36'),
(75, 'F 1333 DDd', 'Superadmin DMS', NULL, '2018-04-06 04:04:49', '2018-04-06 04:04:49'),
(76, 'F 1123 CIB', 'Superadmin DMS', NULL, '2018-04-06 08:05:18', '2018-04-06 08:05:18'),
(77, 'F 1123 CIB', 'Superadmin DMS', NULL, '2018-04-08 13:21:32', '2018-04-08 13:21:32'),
(78, 'F 1123 CIB', 'Superadmin DMS', NULL, '2018-04-08 13:23:56', '2018-04-08 13:23:56'),
(79, 'F 1333 DDd', 'Superadmin DMS', NULL, '2018-04-08 13:24:24', '2018-04-08 13:24:24'),
(80, 'B 1234 CIB', 'Superadmin DMS', NULL, '2018-04-08 13:38:05', '2018-04-08 13:38:05'),
(81, 'F 3322 CIB', 'Superadmin DMS', NULL, '2018-04-08 13:40:12', '2018-04-08 13:40:12'),
(82, 'F 1123 RE', 'Superadmin DMS', NULL, '2018-04-08 14:00:07', '2018-04-08 14:00:07'),
(83, 'B 1234 CIB', 'Superadmin DMS', NULL, '2018-04-08 14:51:55', '2018-04-08 14:51:55'),
(84, 'e', 'Superadmin DMS', NULL, '2018-04-08 15:11:58', '2018-04-08 15:11:58'),
(85, 'F 1333 DDd', 'Superadmin DMS', NULL, '2018-04-08 15:12:29', '2018-04-08 15:12:29'),
(86, 'F 6543 TR', 'Superadmin DMS', NULL, '2018-04-08 16:33:54', '2018-04-08 16:33:54'),
(87, 'F 6543 TR', 'Superadmin DMS', NULL, '2018-04-08 16:34:10', '2018-04-08 16:34:10'),
(88, 'F 6543 TR', 'Superadmin DMS', NULL, '2018-04-08 16:34:35', '2018-04-08 16:34:35');

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
(7, 'SCHNEIDER', 'Super Admin Yudi', 'Dery', '2018-03-21 23:13:07', '2018-03-28 09:58:19'),
(8, 'MONDELEZ', 'Super Admin Yudi', 'Dery', '2018-03-21 23:13:15', '2018-03-28 09:58:23');

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
(1, 'Waiting Outside', 'Lutfi', 'Dery', '2018-03-28 03:47:07', '2018-03-27 22:38:42'),
(2, 'Waiting Gate', 'Lutfi', NULL, '2018-03-28 03:47:07', '2018-03-28 03:47:07'),
(3, 'Truck Enter WH', 'Lutfi', NULL, '2018-03-28 03:47:07', '2018-03-28 03:47:07'),
(4, 'Loading', 'Lutfi', NULL, '2018-03-28 03:47:07', '2018-03-28 03:47:07'),
(5, 'Complete Loading', 'Lutfi', NULL, '2018-03-28 03:47:07', '2018-03-28 03:47:07'),
(6, 'Leave Warehouse', 'Lutfi', NULL, '2018-03-28 03:47:07', '2018-03-28 03:47:07');

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
(7, 'Ninja Express', 'lutfi', NULL, '2018-03-15 01:09:12', '2018-03-15 01:09:12'),
(8, 'JNT', 'Dery', NULL, '2018-03-23 02:09:33', '2018-03-23 02:09:33');

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
(3, 'Van / L300', NULL, 'Superadmin CMS', '2018-03-13 15:07:58', '2018-04-06 08:01:22'),
(4, 'CDE / CD4', NULL, 'Superadmin CMS', '2018-03-13 15:07:58', '2018-04-06 08:01:31'),
(5, 'CDD / CD6', NULL, 'Superadmin CMS', '2018-03-13 15:07:58', '2018-04-06 08:01:38'),
(6, 'Fuso', 'Superadmin CMS', NULL, '2018-04-06 08:01:46', '2018-04-06 08:01:46'),
(7, 'Tronton', 'Superadmin CMS', NULL, '2018-04-06 08:01:53', '2018-04-06 08:01:53'),
(8, 'Wing-Box', 'Superadmin CMS', NULL, '2018-04-06 08:02:01', '2018-04-06 08:02:01'),
(9, 'Container 20\'', 'Superadmin CMS', NULL, '2018-04-06 08:02:10', '2018-04-06 08:02:10'),
(10, 'Container 40\'', 'Superadmin CMS', NULL, '2018-04-06 08:02:18', '2018-04-06 08:02:18'),
(11, 'Big Mama / Yellow', 'Superadmin CMS', NULL, '2018-04-06 08:02:26', '2018-04-06 08:02:26');

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
(1, 'Inbound', '', NULL, NULL, NULL),
(2, 'Outbound', '', NULL, NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction`
--

INSERT INTO `dms_transaction` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `last_scan`, `arrival_time`, `exit_time`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(94, 'dms11522614907', '2', '3', NULL, 'Apr 08, 18 21:55:15', '21:55', '2018-04-01 16:35:07', '2018-04-02 03:21:12', '2018-04-01 09:35:07', 'S.Cib', '2018-04-08 14:55:15', 'Superadmin DMS'),
(95, 'dms11522614998', NULL, '1', NULL, 'Apr 04, 18 1:15:43', '', '2018-04-01 16:36:38', '2018-04-02 03:21:57', '2018-04-01 09:36:38', 'S.Cib', '2018-04-04 02:58:36', 'Superadmin DMS'),
(96, 'dms21522615084', '2', '2', NULL, 'Apr 04, 18 2:15:33', '', '2018-04-01 16:38:04', NULL, '2018-04-01 09:38:04', 'S.Cib', '2018-04-08 13:23:56', 'Superadmin DMS'),
(97, 'dms21522615194', NULL, '1', NULL, 'Apr 04, 18 4:15:55', '', '2018-04-01 16:39:54', NULL, '2018-04-01 09:39:55', 'S.Cib', '2018-04-06 08:05:31', 'Superadmin DMS'),
(98, 'dms11522615539', '1', '6', NULL, 'Apr 04, 18 4:45:32', '23:28', '2018-04-01 16:45:39', 'Apr 08, 18 23:28:18', '2018-04-01 09:45:39', 'Sec.Sby', '2018-04-08 16:28:18', 'Superadmin DMS'),
(99, 'dms11522615629', '1', '6', NULL, 'Apr 04, 18 13:42:03', '', '2018-04-01 16:47:09', 'Apr 04, 18 13:42:21', '2018-04-01 09:47:09', 'Sec.Sby', '2018-04-04 06:42:21', 'Superadmin DMS'),
(100, 'dms21522615703', NULL, '1', NULL, 'Apr 04, 18 3:45:31', '', '2018-04-01 16:48:23', NULL, '2018-04-01 09:48:23', 'Sec.Sby', '2018-04-04 02:58:16', NULL),
(101, 'dms21522615772', NULL, '1', NULL, 'Apr 04, 18 5:15:53', '', '2018-04-01 16:49:32', NULL, '2018-04-01 09:49:32', 'Sec.Sby', '2018-04-04 02:58:12', NULL),
(102, 'dms11522659432', '1', '6', NULL, 'Apr 04, 18 5:45:12', '23:37', '2018-04-02 04:57:12', 'Apr 08, 18 23:37:35', '2018-04-01 21:57:12', 'Superadmin DMS', '2018-04-08 16:37:35', 'Superadmin DMS'),
(103, 'DMS11522667446', '1', '6', NULL, 'Apr 04, 18 9:52:12', '', '2018-04-02 07:10:46', '2018-04-02 07:13:56', '2018-04-02 00:10:46', 'Superadmin DMS', '2018-04-04 02:58:57', 'Superadmin DMS'),
(113, 'DMS11522827294', '1', '6', NULL, 'Apr 04, 18 13:57:56', '14:06', '2018-04-04 03:34:54', 'Apr 04, 18 14:06:53', '2018-04-03 20:34:55', 'Superadmin DMS', '2018-04-04 07:06:53', 'Superadmin DMS'),
(114, 'DMS11522827966', NULL, '1', NULL, 'Apr 04, 18 03:46:06', '', '2018-04-04 03:46:06', NULL, '2018-04-03 20:46:06', 'Superadmin DMS', '2018-04-06 08:04:35', 'Superadmin DMS'),
(117, 'DMS11522862406', '1', '6', NULL, 'Apr 04, 18 13:35:03', '', '2018-04-04 13:20:06', 'Apr 04, 18 13:36:12', '2018-04-04 06:20:06', 'Superadmin DMS', '2018-04-04 06:36:12', 'Superadmin DMS'),
(119, 'DMS11522863516', '1', '6', NULL, 'Apr 04, 18 14:12:52', '14:09', 'Apr 04, 18 13:38:36', 'Apr 06, 18 14:09:18', '2018-04-04 06:38:36', 'Superadmin DMS', '2018-04-06 07:09:18', 'Superadmin DMS'),
(120, 'DMS21523027088', '2', '2', NULL, NULL, NULL, 'Apr 06, 18 11:04:48', NULL, '2018-04-06 04:04:48', 'Superadmin DMS', '2018-04-08 13:24:24', 'Superadmin DMS'),
(121, 'DMS11523239838', NULL, '1', NULL, 'Apr 08, 18 22:10:38', NULL, 'Apr 08, 18 22:10:38', NULL, '2018-04-08 15:10:38', 'Superadmin DMS', '2018-04-08 15:10:38', NULL),
(122, 'DMS11523239917', NULL, '1', NULL, 'Apr 08, 18 22:11:57', NULL, 'Apr 08, 18 22:11:57', NULL, '2018-04-08 15:11:57', 'Superadmin DMS', '2018-04-08 15:11:57', NULL);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction_history`
--

INSERT INTO `dms_transaction_history` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `last_scan`, `arrival_time`, `exit_time`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(102, 'dms11521799208', NULL, 'new', NULL, '0000-00-00 00:00:00', '', '2018-03-23 07:00:08', NULL, '2018-03-23 00:00:08', 'Yudi Prabowo', '2018-03-23 00:00:08', NULL),
(103, 'dms11521799208', '1', 'EDITED', '00:00:20', '0000-00-00 00:00:00', '', NULL, '2018-03-23 07:01:47', '2018-03-23 00:01:47', 'Yudi Prabowo', '2018-03-23 00:01:47', NULL),
(104, 'dms11521800688', NULL, 'new', NULL, '0000-00-00 00:00:00', '', '2018-03-23 07:24:48', NULL, '2018-03-23 00:24:48', 'Yudi Prabowo', '2018-03-23 00:24:48', NULL),
(105, 'dms11521800688', '1', 'EDITED', '00:00:25', '0000-00-00 00:00:00', '', NULL, '2018-03-23 07:26:33', '2018-03-23 00:26:33', 'Yudi Prabowo', '2018-03-23 00:26:33', NULL),
(106, 'dms11521807489', NULL, 'new', NULL, '0000-00-00 00:00:00', '', '2018-03-23 09:18:09', NULL, '2018-03-23 02:18:09', 'Lutfi Febrianto', '2018-03-23 02:18:09', NULL),
(107, 'dms11521807489', NULL, 'EDITED', '00:00:20', '0000-00-00 00:00:00', '', NULL, '2018-03-23 09:28:52', '2018-03-23 02:28:52', 'lutfi', '2018-03-23 02:28:52', NULL),
(108, 'dms11521807489', '1', 'EDITED', '00:00:20', '0000-00-00 00:00:00', '', NULL, '2018-03-23 09:30:34', '2018-03-23 02:30:34', 'lutfi', '2018-03-23 02:30:34', NULL),
(109, 'dms11522045026', NULL, 'new', NULL, '0000-00-00 00:00:00', '', '2018-03-26 03:17:06', NULL, '2018-03-25 20:17:06', 'Yudi Prabowo', '2018-03-25 20:17:06', NULL),
(110, 'dms11522046203', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 03:36:43', NULL, '2018-03-25 20:36:43', 'Yudi Prabowo', '2018-03-25 20:36:43', NULL),
(111, 'dms11522046774', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 03:46:14', NULL, '2018-03-25 20:46:14', 'Yudi Prabowo', '2018-03-25 20:46:14', NULL),
(112, 'dms11522047020', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 03:50:20', NULL, '2018-03-25 20:50:20', 'Yudi Prabowo', '2018-03-25 20:50:20', NULL),
(113, 'dms11522047053', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 03:50:53', NULL, '2018-03-25 20:50:54', 'Yudi Prabowo', '2018-03-25 20:50:54', NULL),
(114, 'dms11522058104', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 06:55:04', NULL, '2018-03-25 23:55:04', 'Lutfi Febrianto', '2018-03-25 23:55:04', NULL),
(115, 'dms21522058143', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 06:55:43', NULL, '2018-03-25 23:55:43', 'Lutfi Febrianto', '2018-03-25 23:55:43', NULL),
(116, 'dms11522058321', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 06:58:41', NULL, '2018-03-25 23:58:42', 'Lutfi Febrianto', '2018-03-25 23:58:42', NULL),
(117, 'dms21522058369', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 06:59:29', NULL, '2018-03-25 23:59:30', 'Lutfi Febrianto', '2018-03-25 23:59:30', NULL),
(118, 'dms11522058426', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 07:00:26', NULL, '2018-03-26 00:00:26', 'Lutfi Febrianto', '2018-03-26 00:00:26', NULL),
(119, 'dms11522058426', '2', 'Waiting Outside', '00:00:25', '0000-00-00 00:00:00', '', NULL, '2018-03-26 07:01:09', '2018-03-26 00:01:09', 'Yudi Prabowo', '2018-03-26 00:01:09', NULL),
(120, 'dms21522058369', '1', 'Waiting Outside', '00:00:11', '0000-00-00 00:00:00', '', NULL, '2018-03-26 07:01:31', '2018-03-26 00:01:32', 'Yudi Prabowo', '2018-03-26 00:01:32', NULL),
(121, 'dms21522059104', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 07:11:44', NULL, '2018-03-26 00:11:44', 'Lutfi Febrianto', '2018-03-26 00:11:44', NULL),
(122, 'dms11522059178', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 07:12:58', NULL, '2018-03-26 00:12:58', 'Lutfi Febrianto', '2018-03-26 00:12:58', NULL),
(123, 'dms21522059270', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-26 07:14:30', NULL, '2018-03-26 00:14:30', 'Yudi Prabowo', '2018-03-26 00:14:30', NULL),
(124, 'dms11522058321', '2', 'Waiting Outside', '00:00:12', '0000-00-00 00:00:00', '', NULL, '2018-03-26 07:29:36', '2018-03-26 00:29:36', 'Yudi Prabowo', '2018-03-26 00:29:36', NULL),
(125, 'dms11522059178', NULL, 'Waiting Outside', '12:02:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 06:35:44', '2018-03-26 23:35:44', 'Yudi Prabowo', '2018-03-26 23:35:44', NULL),
(126, 'dms11522147013', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-27 07:36:53', NULL, '2018-03-27 00:36:53', 'Yudi Prabowo', '2018-03-27 00:36:53', NULL),
(127, 'dms11522147013', '8', 'Waiting Outside', '14:02:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 07:37:30', '2018-03-27 00:37:30', 'Yudi Prabowo', '2018-03-27 00:37:30', NULL),
(128, 'dms11522147013', NULL, 'Waiting Outside', '14:23:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 10:10:12', '2018-03-27 03:10:12', 'Yudi Prabowo', '2018-03-27 03:10:12', NULL),
(129, 'dms11522147013', NULL, 'Waiting Outside', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 10:11:13', '2018-03-27 03:11:13', 'Yudi Prabowo', '2018-03-27 03:11:13', NULL),
(130, 'dms11522147013', '2', 'Waiting Outside', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 10:11:22', '2018-03-27 03:11:23', 'Yudi Prabowo', '2018-03-27 03:11:23', NULL),
(131, 'dms11522181557', NULL, 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', '2018-03-27 17:12:37', NULL, '2018-03-27 10:12:37', 'Yudi Prabowo', '2018-03-27 10:12:37', NULL),
(132, 'dms11522181557', '32', 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:14:13', '2018-03-27 10:14:13', 'Yudi Prabowo', '2018-03-27 10:14:13', NULL),
(133, 'dms11522181557', '12', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:17:22', '2018-03-27 10:17:23', 'Yudi Prabowo', '2018-03-27 10:17:23', NULL),
(134, 'dms11522181557', '123', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:17:43', '2018-03-27 10:17:43', 'Yudi Prabowo', '2018-03-27 10:17:43', NULL),
(135, 'dms11522181557', '12', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:18:08', '2018-03-27 10:18:08', 'Yudi Prabowo', '2018-03-27 10:18:08', NULL),
(136, 'dms11522147013', '22', 'Waiting Gate', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:20:32', '2018-03-27 10:20:32', 'Yudi Prabowo', '2018-03-27 10:20:32', NULL),
(137, 'dms11522147013', '22a', 'Waiting Gatek', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:21:09', '2018-03-27 10:21:10', 'Yudi Prabowo', '2018-03-27 10:21:10', NULL),
(138, 'dms11522181557', '12a', 'Waiting Gatek', NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:21:18', '2018-03-27 10:21:19', 'Yudi Prabowo', '2018-03-27 10:21:19', NULL),
(139, 'dms11522147013', '22a', 'Waiting Gate', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:24:21', '2018-03-27 10:24:21', 'Yudi Prabowo', '2018-03-27 10:24:21', NULL),
(140, 'dms11522181557', '12a', 'Waiting Gate', NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:24:28', '2018-03-27 10:24:28', 'Yudi Prabowo', '2018-03-27 10:24:28', NULL),
(141, 'dms11522147013', '22a', 'Waiting Gate', '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:27:07', '2018-03-27 10:27:07', 'Yudi Prabowo', '2018-03-27 10:27:07', NULL),
(142, 'dms11522147013', '22', NULL, '14:40:00', '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:29:02', '2018-03-27 10:29:02', 'Yudi Prabowo', '2018-03-27 10:29:02', NULL),
(143, 'dms11522181557', '12a', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:29:14', '2018-03-27 10:29:14', 'Yudi Prabowo', '2018-03-27 10:29:14', NULL),
(144, 'dms11522182594', NULL, 'Waiting Outside', NULL, '0000-00-00 00:00:00', '', '2018-03-27 17:29:54', NULL, '2018-03-27 10:29:54', 'Yudi Prabowo', '2018-03-27 10:29:54', NULL),
(145, 'dms11522182636', NULL, 'Waiting Outside', NULL, '0000-00-00 00:00:00', '', '2018-03-27 17:30:36', NULL, '2018-03-27 10:30:37', 'Yudi Prabowo', '2018-03-27 10:30:37', NULL),
(146, 'dms11522182594', '2', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:30:49', '2018-03-27 10:30:49', 'Yudi Prabowo', '2018-03-27 10:30:49', NULL),
(147, 'dms11522182594', '23', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-27 17:30:58', '2018-03-27 10:30:59', 'Yudi Prabowo', '2018-03-27 10:30:59', NULL),
(148, 'dms11522182594', '22', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 03:34:53', '2018-03-27 20:34:53', 'Yudi Prabowo', '2018-03-27 20:34:53', NULL),
(149, 'dms11522220740', NULL, 'Waiting Outside', NULL, '0000-00-00 00:00:00', '', '2018-03-28 04:05:40', NULL, '2018-03-27 21:05:40', 'Yudi Prabowo', '2018-03-27 21:05:40', NULL),
(150, 'dms11522220854', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 04:07:34', NULL, '2018-03-27 21:07:34', 'Yudi Prabowo', '2018-03-27 21:07:34', NULL),
(151, 'dms21522232784', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:26:24', NULL, '2018-03-28 00:26:24', 'Super Admin Name', '2018-03-28 00:26:24', NULL),
(152, 'dms11522233702', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:41:42', NULL, '2018-03-28 00:41:42', 'Super Admin Name', '2018-03-28 00:41:42', NULL),
(153, 'dms11522233782', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:43:02', NULL, '2018-03-28 00:43:03', 'Super Admin Name', '2018-03-28 00:43:03', NULL),
(154, 'dms11522233932', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:45:32', NULL, '2018-03-28 00:45:32', 'Super Admin Name', '2018-03-28 00:45:32', NULL),
(155, 'dms11522234246', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:50:46', NULL, '2018-03-28 00:50:46', 'Super Admin Name', '2018-03-28 00:50:46', NULL),
(156, 'dms11522234259', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:50:59', NULL, '2018-03-28 00:50:59', 'Super Admin Name', '2018-03-28 00:50:59', NULL),
(157, 'dms11522234259', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 07:54:21', '2018-03-28 00:54:21', 'Super Admin Name', '2018-03-28 00:54:21', NULL),
(158, 'dms11522233782', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 07:54:35', '2018-03-28 00:54:35', 'Super Admin Name', '2018-03-28 00:54:35', NULL),
(159, 'dms11522234695', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 07:58:15', NULL, '2018-03-28 00:58:16', 'Super Admin Name', '2018-03-28 00:58:16', NULL),
(160, 'dms11522235356', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 08:09:16', NULL, '2018-03-28 01:09:16', 'Super Admin Name', '2018-03-28 01:09:16', NULL),
(161, 'dms11522235376', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 08:09:36', NULL, '2018-03-28 01:09:36', 'Super Admin Name', '2018-03-28 01:09:36', NULL),
(162, 'dms11522235410', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 08:10:10', NULL, '2018-03-28 01:10:10', 'Super Admin Name', '2018-03-28 01:10:10', NULL),
(163, 'dms11522235421', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 08:10:21', NULL, '2018-03-28 01:10:21', 'Super Admin Name', '2018-03-28 01:10:21', NULL),
(164, 'dms11522235458', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 08:10:58', NULL, '2018-03-28 01:10:58', 'Super Admin Name', '2018-03-28 01:10:58', NULL),
(165, 'dms11522234695', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 08:52:37', '2018-03-28 01:52:37', 'Super Admin Name', '2018-03-28 01:52:37', NULL),
(166, 'dms11522234695', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 08:55:15', '2018-03-28 01:55:15', 'Super Admin Name', '2018-03-28 01:55:15', NULL),
(167, 'dms11522238425', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 09:00:25', NULL, '2018-03-28 02:00:26', 'Super Admin Name', '2018-03-28 02:00:26', NULL),
(168, 'dms11522238425', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 09:01:29', '2018-03-28 02:01:29', 'Super Admin Name', '2018-03-28 02:01:29', NULL),
(169, 'dms11522234695', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 09:15:56', '2018-03-28 02:15:56', 'Super Admin Name', '2018-03-28 02:15:56', NULL),
(170, 'dms11522234695', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 09:19:56', '2018-03-28 02:19:56', 'Super Admin Name', '2018-03-28 02:19:56', NULL),
(171, 'dms11522239766', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 09:22:46', NULL, '2018-03-28 02:22:46', 'Security Name', '2018-03-28 02:22:46', NULL),
(172, 'dms11522243381', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-03-28 10:23:01', NULL, '2018-03-28 03:23:01', 'Security Name', '2018-03-28 03:23:01', NULL),
(173, 'dms11522243381', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-28 10:23:35', '2018-03-28 03:23:36', 'Super Admin Name', '2018-03-28 03:23:36', NULL),
(174, 'dms11522233932', '2', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-03-29 04:21:11', '2018-03-28 21:21:11', 'Super Admin Name', '2018-03-28 21:21:11', NULL),
(175, 'dms11522610087', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 15:14:47', NULL, '2018-04-01 08:14:48', 'Super Admin Name', '2018-04-01 08:14:48', NULL),
(176, 'dms11522610372', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 15:19:32', NULL, '2018-04-01 08:19:32', 'Super Admin Name', '2018-04-01 08:19:32', NULL),
(177, 'dms11522610546', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 15:22:26', NULL, '2018-04-01 08:22:27', 'Super Admin Name', '2018-04-01 08:22:27', NULL),
(178, 'dms11522234695', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:25:06', '2018-04-01 08:25:06', 'Super Admin Name', '2018-04-01 08:25:06', NULL),
(179, 'dms11522234695', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:25:25', '2018-04-01 08:25:25', 'Super Admin Name', '2018-04-01 08:25:25', NULL),
(180, 'dms11522243381', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:26:13', '2018-04-01 08:26:13', 'Super Admin Name', '2018-04-01 08:26:13', NULL),
(181, 'dms11522610546', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:26:43', '2018-04-01 08:26:43', 'Super Admin Name', '2018-04-01 08:26:43', NULL),
(182, 'dms11522610546', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:27:51', '2018-04-01 08:27:51', 'Super Admin Name', '2018-04-01 08:27:51', NULL),
(183, 'dms11522243381', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:28:39', '2018-04-01 08:28:40', 'Super Admin Name', '2018-04-01 08:28:40', NULL),
(184, 'dms11522243381', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:32:46', '2018-04-01 08:32:46', 'Super Admin Name', '2018-04-01 08:32:46', NULL),
(185, 'dms11522243381', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 15:33:27', '2018-04-01 08:33:28', 'Super Admin Name', '2018-04-01 08:33:28', NULL),
(186, 'dms11522613464', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:11:04', NULL, '2018-04-01 09:11:04', 'Security Name', '2018-04-01 09:11:04', NULL),
(187, 'dms11522614907', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:35:07', NULL, '2018-04-01 09:35:07', 'S.Cib', '2018-04-01 09:35:07', NULL),
(188, 'dms11522614998', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:36:38', NULL, '2018-04-01 09:36:38', 'S.Cib', '2018-04-01 09:36:38', NULL),
(189, 'dms21522615084', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:38:04', NULL, '2018-04-01 09:38:04', 'S.Cib', '2018-04-01 09:38:04', NULL),
(190, 'dms21522615194', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:39:54', NULL, '2018-04-01 09:39:55', 'S.Cib', '2018-04-01 09:39:55', NULL),
(191, 'dms11522615539', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:45:39', NULL, '2018-04-01 09:45:39', 'Sec.Sby', '2018-04-01 09:45:39', NULL),
(192, 'dms11522615629', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:47:09', NULL, '2018-04-01 09:47:09', 'Sec.Sby', '2018-04-01 09:47:09', NULL),
(193, 'dms21522615703', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:48:23', NULL, '2018-04-01 09:48:23', 'Sec.Sby', '2018-04-01 09:48:23', NULL),
(194, 'dms21522615772', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-01 16:49:32', NULL, '2018-04-01 09:49:32', 'Sec.Sby', '2018-04-01 09:49:32', NULL),
(195, 'dms11522614907', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-01 16:56:02', '2018-04-01 09:56:02', 'Super Admin Name', '2018-04-01 09:56:02', NULL),
(196, 'dms11522651927', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-02 02:52:07', NULL, '2018-04-01 19:52:08', 'Sec.Cib', '2018-04-01 19:52:08', NULL),
(197, 'dms11522651971', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-02 02:52:51', NULL, '2018-04-01 19:52:51', 'Sec.Cib', '2018-04-01 19:52:51', NULL),
(198, 'dms11522614907', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:03:44', '2018-04-01 20:03:44', 'Superadmin DMS', '2018-04-01 20:03:44', NULL),
(199, 'dms11522614907', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:05:11', '2018-04-01 20:05:11', 'Superadmin DMS', '2018-04-01 20:05:11', NULL),
(200, 'dms11522614998', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:05:49', '2018-04-01 20:05:49', 'Superadmin DMS', '2018-04-01 20:05:49', NULL),
(201, 'dms11522653055', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-02 03:10:55', NULL, '2018-04-01 20:10:55', 'Superadmin DMS', '2018-04-01 20:10:55', NULL),
(202, 'dms11522614907', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:11:13', '2018-04-01 20:11:13', 'Superadmin DMS', '2018-04-01 20:11:13', NULL),
(203, 'dms11522615539', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:17:19', '2018-04-01 20:17:19', 'Superadmin DMS', '2018-04-01 20:17:19', NULL),
(204, 'dms11522615629', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:20:38', '2018-04-01 20:20:38', 'Superadmin DMS', '2018-04-01 20:20:38', NULL),
(205, 'dms11522614907', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:21:12', '2018-04-01 20:21:12', 'Superadmin DMS', '2018-04-01 20:21:12', NULL),
(206, 'dms11522614998', NULL, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 03:21:57', '2018-04-01 20:21:57', 'Superadmin DMS', '2018-04-01 20:21:57', NULL),
(207, 'dms11522659432', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-02 04:57:12', NULL, '2018-04-01 21:57:12', 'Superadmin DMS', '2018-04-01 21:57:12', NULL),
(208, 'DMS11522667446', NULL, '1', NULL, '0000-00-00 00:00:00', '', '2018-04-02 07:10:46', NULL, '2018-04-02 00:10:46', 'Superadmin DMS', '2018-04-02 00:10:46', NULL),
(209, 'DMS11522667446', '1', NULL, NULL, '0000-00-00 00:00:00', '', NULL, '2018-04-02 07:13:56', '2018-04-02 00:13:56', 'Superadmin DMS', '2018-04-02 00:13:56', NULL),
(210, 'DMS11522763356', NULL, '1', NULL, '2018-04-03 09:49:17', '', '2018-04-03 09:49:16', NULL, '2018-04-03 02:49:17', 'Superadmin DMS', '2018-04-03 02:49:17', NULL),
(211, 'DMS11522763497', NULL, '1', NULL, '2018-04-03 09:51:37', '', '2018-04-03 09:51:37', NULL, '2018-04-03 02:51:37', 'Superadmin DMS', '2018-04-03 02:51:37', NULL),
(212, 'DMS11522764152', NULL, '1', NULL, '1522749752', '', '2018-04-03 10:02:32', NULL, '2018-04-03 03:02:32', 'Superadmin DMS', '2018-04-03 03:02:32', NULL),
(213, 'DMS11522764313', NULL, '1', NULL, 'Apr 03, 18 10:05:13', '', '2018-04-03 10:05:13', NULL, '2018-04-03 03:05:13', 'Superadmin DMS', '2018-04-03 03:05:13', NULL),
(214, 'DMS11522764903', NULL, '1', NULL, 'Apr 03, 18 10:15:03', '', '2018-04-03 10:15:03', NULL, '2018-04-03 03:15:03', 'Superadmin DMS', '2018-04-03 03:15:03', NULL),
(215, 'DMS11522825362', NULL, '1', NULL, 'Apr 04, 18 03:02:42', '', '2018-04-04 03:02:42', NULL, '2018-04-03 20:02:42', 'Superadmin DMS', '2018-04-03 20:02:42', NULL),
(216, 'DMS11522825523', NULL, '1', NULL, 'Apr 04, 18 03:05:23', '', '2018-04-04 03:05:23', NULL, '2018-04-03 20:05:23', 'Superadmin DMS', '2018-04-03 20:05:23', NULL),
(217, 'DMS11522826813', NULL, '1', NULL, 'Apr 04, 18 03:26:53', '', '2018-04-04 03:26:53', NULL, '2018-04-03 20:26:54', 'Superadmin DMS', '2018-04-03 20:26:54', NULL),
(218, 'DMS11522826838', NULL, '1', NULL, 'Apr 04, 18 03:27:18', '', '2018-04-04 03:27:18', NULL, '2018-04-03 20:27:18', 'Superadmin DMS', '2018-04-03 20:27:18', NULL),
(219, 'DMS11522827294', NULL, '1', NULL, 'Apr 04, 18 03:34:54', '', '2018-04-04 03:34:54', NULL, '2018-04-03 20:34:55', 'Superadmin DMS', '2018-04-03 20:34:55', NULL),
(220, 'DMS11522827966', NULL, '1', NULL, 'Apr 04, 18 03:46:06', '', '2018-04-04 03:46:06', NULL, '2018-04-03 20:46:06', 'Superadmin DMS', '2018-04-03 20:46:06', NULL),
(221, 'DMS11522853425', NULL, '1', NULL, 'Apr 04, 18 10:50:25', '', '2018-04-04 10:50:25', NULL, '2018-04-04 03:50:25', 'Superadmin DMS', '2018-04-04 03:50:25', NULL),
(222, 'DMS11522854639', NULL, '1', NULL, NULL, '', '2018-04-04 11:10:39', NULL, '2018-04-04 04:10:40', 'Superadmin DMS', '2018-04-04 04:10:40', NULL),
(223, 'DMS11522854639', '1', NULL, NULL, NULL, '', NULL, '2018-04-04 11:47:02', '2018-04-04 04:47:02', 'Superadmin DMS', '2018-04-04 04:47:02', NULL),
(224, 'DMS11522854639', '1', NULL, NULL, NULL, '', NULL, '2018-04-04 12:37:01', '2018-04-04 05:37:01', 'Superadmin DMS', '2018-04-04 05:37:01', NULL),
(225, 'DMS11522862406', NULL, '1', NULL, NULL, '', '2018-04-04 13:20:06', NULL, '2018-04-04 06:20:06', 'Superadmin DMS', '2018-04-04 06:20:06', NULL),
(226, 'DMS11522862406', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 06:27:52', 'Superadmin DMS', '2018-04-04 06:27:52', NULL),
(227, 'DMS11522863516', NULL, '1', NULL, NULL, '', 'Apr 04, 18 13:38:36', NULL, '2018-04-04 06:38:36', 'Superadmin DMS', '2018-04-04 06:38:36', NULL),
(228, 'DMS11522863516', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 06:38:58', 'Superadmin DMS', '2018-04-04 06:38:58', NULL),
(229, 'dms11522615629', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 06:42:00', 'Superadmin DMS', '2018-04-04 06:42:00', NULL),
(230, 'dms11522614907', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 06:43:02', 'Superadmin DMS', '2018-04-04 06:43:02', NULL),
(231, 'DMS11522827294', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 06:57:44', 'Superadmin DMS', '2018-04-04 06:57:44', NULL),
(232, 'DMS11522827294', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 07:06:51', 'Superadmin DMS', '2018-04-04 07:06:51', NULL),
(233, 'dms11522614907', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 07:36:05', 'Superadmin DMS', '2018-04-04 07:36:05', NULL),
(234, 'dms11522614907', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-04 07:36:39', 'Superadmin DMS', '2018-04-04 07:36:39', NULL),
(235, 'DMS21523027088', NULL, '1', NULL, NULL, '', 'Apr 06, 18 11:04:48', NULL, '2018-04-06 04:04:48', 'Superadmin DMS', '2018-04-06 04:04:48', NULL),
(236, 'DMS21523027088', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 07:09:38', 'Superadmin DMS', '2018-04-06 07:09:38', NULL),
(237, 'dms11522614907', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:03:54', 'Superadmin DMS', '2018-04-06 08:03:54', NULL),
(238, 'dms11522614998', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:03', 'Superadmin DMS', '2018-04-06 08:04:03', NULL),
(239, 'dms11522615539', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:08', 'Superadmin DMS', '2018-04-06 08:04:08', NULL),
(240, 'dms11522615629', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:15', 'Superadmin DMS', '2018-04-06 08:04:15', NULL),
(241, 'dms11522659432', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:22', 'Superadmin DMS', '2018-04-06 08:04:22', NULL),
(242, 'DMS11522827294', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:28', 'Superadmin DMS', '2018-04-06 08:04:28', NULL),
(243, 'DMS11522827966', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:35', 'Superadmin DMS', '2018-04-06 08:04:35', NULL),
(244, 'DMS11522827966', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:42', 'Superadmin DMS', '2018-04-06 08:04:42', NULL),
(245, 'DMS11522862406', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:04:55', 'Superadmin DMS', '2018-04-06 08:04:55', NULL),
(246, 'DMS11522863516', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:05:03', 'Superadmin DMS', '2018-04-06 08:05:03', NULL),
(247, 'dms21522615084', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:05:18', 'Superadmin DMS', '2018-04-06 08:05:18', NULL),
(248, 'dms21522615194', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:05:31', 'Superadmin DMS', '2018-04-06 08:05:31', NULL),
(249, 'dms11522614907', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:06:50', 'Superadmin DMS', '2018-04-06 08:06:50', NULL),
(250, 'DMS21523027088', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:09:59', 'Superadmin DMS', '2018-04-06 08:09:59', NULL),
(251, 'DMS21523027088', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:10:08', 'Superadmin DMS', '2018-04-06 08:10:08', NULL),
(252, 'DMS21523027088', '12', NULL, NULL, NULL, '', NULL, NULL, '2018-04-06 08:11:15', 'Superadmin DMS', '2018-04-06 08:11:15', NULL),
(253, 'dms21522615084', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:19:47', 'Superadmin DMS', '2018-04-08 13:19:47', NULL),
(254, 'dms21522615084', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:21:32', 'Superadmin DMS', '2018-04-08 13:21:32', NULL),
(255, 'dms21522615084', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:23:56', 'Superadmin DMS', '2018-04-08 13:23:56', NULL),
(256, 'DMS21523027088', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:24:24', 'Superadmin DMS', '2018-04-08 13:24:24', NULL),
(257, 'dms11522614907', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:38:05', 'Superadmin DMS', '2018-04-08 13:38:05', NULL),
(258, 'dms11522614998', NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 13:40:12', 'Superadmin DMS', '2018-04-08 13:40:12', NULL),
(259, 'dms11522615539', '1', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 14:00:07', 'Superadmin DMS', '2018-04-08 14:00:07', NULL),
(260, 'dms11522614907', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 14:51:55', 'Superadmin DMS', '2018-04-08 14:51:55', NULL),
(261, 'DMS11523239838', NULL, '1', NULL, 'Apr 08, 18 22:10:38', '', 'Apr 08, 18 22:10:38', NULL, '2018-04-08 15:10:38', 'Superadmin DMS', '2018-04-08 15:10:38', NULL),
(262, 'DMS11523239917', NULL, '1', NULL, 'Apr 08, 18 22:11:57', '', 'Apr 08, 18 22:11:57', NULL, '2018-04-08 15:11:58', 'Superadmin DMS', '2018-04-08 15:11:58', NULL),
(263, 'DMS21523027088', '2', NULL, NULL, NULL, '', NULL, NULL, '2018-04-08 15:12:29', 'Superadmin DMS', '2018-04-08 15:12:29', NULL),
(264, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-08 16:33:53', 'Superadmin DMS', '2018-04-08 16:33:53', NULL),
(265, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-08 16:34:10', 'Superadmin DMS', '2018-04-08 16:34:10', NULL),
(266, 'dms11522659432', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-08 16:34:35', 'Superadmin DMS', '2018-04-08 16:34:35', NULL),
(267, 'dms11522659432', NULL, '3', NULL, NULL, '23:34', NULL, NULL, '2018-04-08 16:34:44', 'Superadmin DMS', '2018-04-08 16:34:44', NULL),
(268, 'dms11522659432', NULL, '4', NULL, NULL, '23:37', NULL, NULL, '2018-04-08 16:37:25', 'Superadmin DMS', '2018-04-08 16:37:25', NULL),
(269, 'dms11522659432', NULL, '5', NULL, NULL, '23:37', NULL, NULL, '2018-04-08 16:37:30', 'Superadmin DMS', '2018-04-08 16:37:30', NULL),
(270, 'dms11522659432', NULL, '6', NULL, NULL, '23:37', NULL, 'Apr 08, 18 23:37:35', '2018-04-08 16:37:35', 'Superadmin DMS', '2018-04-08 16:37:35', NULL);

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
(1, 'SUPER ADMIN', 'lutfi', 'lutfi', '2018-03-09 02:53:14', '2018-03-19 07:35:45'),
(2, 'ADMIN', '', NULL, '2018-03-16 04:38:53', '2018-03-19 07:35:23'),
(3, 'SECURITY', '', NULL, '2018-03-16 04:38:53', '2018-03-19 07:35:36'),
(4, 'CHECKER', 'Dery', NULL, '2018-03-23 00:53:23', '2018-03-28 05:51:45');

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
(1, 'security1', 'Sec.Cib', '1234', NULL, 3, 1, 7, 'lutfi', 'Dery', '2018-03-09 02:54:37', '2018-04-01 16:40:59'),
(2, 'security2', 'Sec.Sby', '1234', NULL, 3, 2, 7, 'lutfi2', 'Dery2', '2018-03-09 02:54:37', '2018-04-01 16:41:05'),
(3, 'superadmin', 'Superadmin DMS', '1234', NULL, 1, 1, 8, NULL, 'Dery', '2018-03-16 16:52:12', '2018-04-01 17:06:47'),
(4, 'admin1a', 'Adm.Cib.Sch', '1234', NULL, 2, 1, 7, NULL, 'Dery', '2018-03-19 07:25:56', '2018-04-01 16:41:14'),
(5, 'admin1b', 'Adm.Cib.Mon', '1234', NULL, 2, 1, 8, 'Dery', 'Dery', '2018-03-23 02:08:28', '2018-04-01 16:41:19'),
(6, 'checker1a', 'Chk.Cib.Sch', '1234', NULL, 4, 1, 7, 'Dery', 'Dery', '2018-03-27 23:09:04', '2018-04-01 16:41:41'),
(8, 'checker1b', 'Chk.Cib.Mon', '1234', NULL, 4, 1, 8, 'Dery', 'Dery', '2018-03-27 23:09:04', '2018-04-01 16:41:45'),
(9, 'admin2a', 'Adm.Sby.Sch', '1234', NULL, 2, 2, 7, NULL, 'Dery', '2018-03-19 07:25:56', '2018-04-01 16:53:22'),
(10, 'admin2b', 'Adm.Sby.Mon', '1234', NULL, 2, 2, 8, 'Dery', 'Dery', '2018-03-23 02:08:28', '2018-04-01 16:53:30'),
(11, 'checker2a', 'Chk.Sby.Sch', '1234', NULL, 4, 2, 7, 'Dery', 'Dery', '2018-03-27 23:09:04', '2018-04-01 16:53:38'),
(12, 'checker2b', 'Chk.Sby.Mon', '1234', NULL, 4, 2, 8, 'Dery', 'Dery', '2018-03-27 23:09:04', '2018-04-01 16:53:44');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `dms_master_location`
--
ALTER TABLE `dms_master_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dms_master_phone`
--
ALTER TABLE `dms_master_phone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `dms_master_plat`
--
ALTER TABLE `dms_master_plat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `dms_transaction_history`
--
ALTER TABLE `dms_transaction_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `dms_user_group`
--
ALTER TABLE `dms_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dms_user_management`
--
ALTER TABLE `dms_user_management`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
