-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2018 at 12:31 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

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
(1, 'superadmin', '1234', 'Dery', NULL, NULL, NULL, '2018-03-21 08:57:11', '2018-03-23 07:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `dms_form`
--

CREATE TABLE `dms_form` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporter_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cust_proj_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_purpose` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_form`
--

INSERT INTO `dms_form` (`id`, `id_dms_form`, `driver_name`, `driver_phone`, `type_of_vehicle`, `plat_no`, `transporter_company`, `shipment`, `cust_proj_name`, `id_purpose`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(83, 'dms21522058143', 'Fahri', '08777678678', 'Tronton Box', 'F 3322 BK', 'J&T', 'T165Y', '8', 2, '2018-03-25 23:55:43', 'Lutfi Febrianto', '2018-03-25 23:55:43', NULL),
(85, 'dms21522058369', 'Fatur', '08777678677', 'Tronton Box', 'F 3322 BK', 'DHL', 'T1644', '7', 2, '2018-03-25 23:59:29', 'Yudi Prabowo', '2018-03-26 00:01:31', NULL),
(86, 'dms11522058426', 'Yana', '0821234234', 'Container', 'F 1433 TT', 'DHL', 'A444T', '7', 1, '2018-03-26 00:00:26', 'Yudi Prabowo', '2018-03-26 00:01:09', NULL),
(87, 'dms21522059104', 'Faden', '0887789887', 'Tronton Box', 'F 6123 MM', 'DHL', 'A134EE', '7', 2, '2018-03-26 00:11:44', 'Lutfi Febrianto', '2018-03-26 00:11:44', NULL),
(88, 'dms11522059178', 'Edwin', '087686788', 'Container', 'F 1221 EE', 'DHL', 'T1333', '8', 1, '2018-03-26 00:12:58', 'Yudi Prabowo', '2018-03-26 23:35:44', NULL),
(89, 'dms21522059270', 'Andri', '08776666767', 'Tronton Box', 'F 6543 RR', 'JNE', 'A134RR', '7', 2, '2018-03-26 00:14:30', 'Yudi Prabowo', '2018-03-26 00:14:30', NULL),
(90, 'dms11522147013', 'Lutfi Febrianto', '0857188413592', 'Colt Diesel Double', 'FA 4353 TTA', 'Ninja Express', 'AA001', '7', 1, '2018-03-27 00:36:53', 'Yudi Prabowo', '2018-03-27 00:36:53', NULL);

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
(1, '085718841359', 'Lutfi', NULL, '2018-03-26 04:04:49', '2018-03-26 04:04:49'),
(2, '089634848272', 'Anto', NULL, '2018-03-26 04:04:49', '2018-03-26 04:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `dms_master_plat`
--

CREATE TABLE `dms_master_plat` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_master_plat`
--

INSERT INTO `dms_master_plat` (`id`, `id_dms_form`, `plat_no`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 'dms11521097479', 'F 1123 DB', 'lutfi', 'lutfi', '2018-03-14 21:04:39', '2018-03-22 04:28:28'),
(8, 'dms11521097507', 'F 3322 BK', 'lutfi', 'Yudi Prabowo', '2018-03-14 21:05:07', '2018-03-22 03:16:11'),
(9, 'dms11521097538', 'F 1123 RE', 'lutfi', NULL, '2018-03-14 21:05:38', '2018-03-22 04:28:42'),
(10, 'dms11521097691', 'F 6543 TR', 'lutfi', NULL, '2018-03-14 21:08:11', '2018-03-22 04:28:50'),
(11, 'dms11521097729', 'F 4353 TT', 'lutfi', NULL, '2018-03-14 21:08:49', '2018-03-22 04:28:57'),
(34, 'dms11522047053', 'F 1123 DB AA', 'Yudi Prabowo', NULL, '2018-03-25 20:50:53', '2018-03-25 20:50:53'),
(35, 'dms11522058426', 'F 1433 TT', 'Lutfi Febrianto', NULL, '2018-03-26 00:00:26', '2018-03-26 00:00:26'),
(36, 'dms21522059104', 'F 6123 MM', 'Lutfi Febrianto', NULL, '2018-03-26 00:11:44', '2018-03-26 00:11:44'),
(37, 'dms11522059178', 'F 1221 EE', 'Lutfi Febrianto', NULL, '2018-03-26 00:12:58', '2018-03-26 00:12:58'),
(38, 'dms21522059270', 'F 6543 RR', 'Yudi Prabowo', NULL, '2018-03-26 00:14:30', '2018-03-26 00:14:30'),
(39, 'dms11522147013', 'FA 4353 TTA', 'Yudi Prabowo', NULL, '2018-03-27 00:36:53', '2018-03-27 00:36:53');

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
(7, 'SCHNEIDER', 'Super Admin Yudi', 'Dery', '2018-03-21 23:13:07', '2018-03-26 07:18:19'),
(8, 'MONDELEZ', 'Super Admin Yudi', 'Dery', '2018-03-21 23:13:15', '2018-03-26 07:18:26');

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
(3, 'Colt Diesel Double', NULL, 'Super Admin Yudi', '2018-03-13 15:07:58', '2018-03-23 00:34:59'),
(4, 'Container', NULL, 'Super Admin Yudi', '2018-03-13 15:07:58', '2018-03-23 00:35:07'),
(5, 'Tronton Box', NULL, 'Super Admin Yudi', '2018-03-13 15:07:58', '2018-03-23 00:35:27');

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
(1, 'inound', '', NULL, NULL, NULL),
(2, 'outbound', '', NULL, NULL, NULL);

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
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction`
--

INSERT INTO `dms_transaction` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `arrival_time`, `exit_time`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(53, 'dms11521799208', '1', 'EDITED', '00:00:20', '', '2018-03-23 07:00:08', '2018-03-23 07:01:47', '2018-03-23 00:00:08', 'Yudi Prabowo', '2018-03-23 00:01:47', 'Yudi Prabowo'),
(54, 'dms11521800688', '1', 'EDITED', '00:00:25', '', '2018-03-23 07:24:48', '2018-03-23 07:26:33', '2018-03-23 00:24:48', 'Yudi Prabowo', '2018-03-23 00:26:33', 'Yudi Prabowo'),
(55, 'dms11521807489', '1', 'EDITED', '00:00:20', '', '2018-03-23 09:18:09', '2018-03-23 09:30:34', '2018-03-23 02:18:09', 'Lutfi Febrianto', '2018-03-23 02:30:34', 'lutfi'),
(56, 'dms11522045026', NULL, 'NEW', NULL, '', '2018-03-26 03:17:06', NULL, '2018-03-25 20:17:06', 'Yudi Prabowo', '2018-03-25 20:17:06', NULL),
(57, 'dms11522046203', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:36:43', NULL, '2018-03-25 20:36:43', 'Yudi Prabowo', '2018-03-25 20:36:43', NULL),
(58, 'dms11522046774', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:46:14', NULL, '2018-03-25 20:46:14', 'Yudi Prabowo', '2018-03-25 20:46:14', NULL),
(59, 'dms11522047020', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:50:20', NULL, '2018-03-25 20:50:20', 'Yudi Prabowo', '2018-03-25 20:50:20', NULL),
(62, 'dms21522058143', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 06:55:43', NULL, '2018-03-25 23:55:43', 'Lutfi Febrianto', '2018-03-25 23:55:43', NULL),
(64, 'dms21522058369', '1', 'Waiting Outside', '00:00:11', '2:30', '2018-03-26 06:59:29', '2018-03-26 07:01:31', '2018-03-25 23:59:29', 'Lutfi Febrianto', '2018-03-26 00:01:31', 'Yudi Prabowo'),
(65, 'dms11522058426', '2', 'Waiting Outside', '00:00:25', '2:30', '2018-03-26 07:00:26', '2018-03-26 07:01:09', '2018-03-26 00:00:26', 'Lutfi Febrianto', '2018-03-26 00:01:09', 'Yudi Prabowo'),
(66, 'dms21522059104', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:11:44', NULL, '2018-03-26 00:11:44', 'Lutfi Febrianto', '2018-03-26 00:11:44', NULL),
(67, 'dms11522059178', NULL, 'Waiting Outside', '12:02:00', '2:30', '2018-03-26 07:12:58', '2018-03-27 06:35:44', '2018-03-26 00:12:58', 'Lutfi Febrianto', '2018-03-26 23:35:44', 'Yudi Prabowo'),
(68, 'dms21522059270', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:14:30', NULL, '2018-03-26 00:14:30', 'Yudi Prabowo', '2018-03-26 00:14:30', NULL),
(69, 'dms11522147013', '2', 'Waiting Outside', '14:40:00', '2:30', '2018-03-27 07:36:53', '2018-03-27 10:11:22', '2018-03-27 00:36:53', 'Yudi Prabowo', '2018-03-27 03:11:22', 'Yudi Prabowo');

-- --------------------------------------------------------

--
-- Table structure for table `dms_transaction_history`
--

CREATE TABLE `dms_transaction_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dms_form` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waiting_time` time DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_transaction_history`
--

INSERT INTO `dms_transaction_history` (`id`, `id_dms_form`, `gate_number`, `status`, `waiting_time`, `duration`, `arrival_time`, `exit_time`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(102, 'dms11521799208', NULL, 'new', NULL, '', '2018-03-23 07:00:08', NULL, '2018-03-23 00:00:08', 'Yudi Prabowo', '2018-03-23 00:00:08', NULL),
(103, 'dms11521799208', '1', 'EDITED', '00:00:20', '', NULL, '2018-03-23 07:01:47', '2018-03-23 00:01:47', 'Yudi Prabowo', '2018-03-23 00:01:47', NULL),
(104, 'dms11521800688', NULL, 'new', NULL, '', '2018-03-23 07:24:48', NULL, '2018-03-23 00:24:48', 'Yudi Prabowo', '2018-03-23 00:24:48', NULL),
(105, 'dms11521800688', '1', 'EDITED', '00:00:25', '', NULL, '2018-03-23 07:26:33', '2018-03-23 00:26:33', 'Yudi Prabowo', '2018-03-23 00:26:33', NULL),
(106, 'dms11521807489', NULL, 'new', NULL, '', '2018-03-23 09:18:09', NULL, '2018-03-23 02:18:09', 'Lutfi Febrianto', '2018-03-23 02:18:09', NULL),
(107, 'dms11521807489', NULL, 'EDITED', '00:00:20', '', NULL, '2018-03-23 09:28:52', '2018-03-23 02:28:52', 'lutfi', '2018-03-23 02:28:52', NULL),
(108, 'dms11521807489', '1', 'EDITED', '00:00:20', '', NULL, '2018-03-23 09:30:34', '2018-03-23 02:30:34', 'lutfi', '2018-03-23 02:30:34', NULL),
(109, 'dms11522045026', NULL, 'new', NULL, '', '2018-03-26 03:17:06', NULL, '2018-03-25 20:17:06', 'Yudi Prabowo', '2018-03-25 20:17:06', NULL),
(110, 'dms11522046203', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:36:43', NULL, '2018-03-25 20:36:43', 'Yudi Prabowo', '2018-03-25 20:36:43', NULL),
(111, 'dms11522046774', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:46:14', NULL, '2018-03-25 20:46:14', 'Yudi Prabowo', '2018-03-25 20:46:14', NULL),
(112, 'dms11522047020', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:50:20', NULL, '2018-03-25 20:50:20', 'Yudi Prabowo', '2018-03-25 20:50:20', NULL),
(113, 'dms11522047053', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 03:50:53', NULL, '2018-03-25 20:50:54', 'Yudi Prabowo', '2018-03-25 20:50:54', NULL),
(114, 'dms11522058104', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 06:55:04', NULL, '2018-03-25 23:55:04', 'Lutfi Febrianto', '2018-03-25 23:55:04', NULL),
(115, 'dms21522058143', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 06:55:43', NULL, '2018-03-25 23:55:43', 'Lutfi Febrianto', '2018-03-25 23:55:43', NULL),
(116, 'dms11522058321', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 06:58:41', NULL, '2018-03-25 23:58:42', 'Lutfi Febrianto', '2018-03-25 23:58:42', NULL),
(117, 'dms21522058369', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 06:59:29', NULL, '2018-03-25 23:59:30', 'Lutfi Febrianto', '2018-03-25 23:59:30', NULL),
(118, 'dms11522058426', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:00:26', NULL, '2018-03-26 00:00:26', 'Lutfi Febrianto', '2018-03-26 00:00:26', NULL),
(119, 'dms11522058426', '2', 'Waiting Outside', '00:00:25', '02:30', NULL, '2018-03-26 07:01:09', '2018-03-26 00:01:09', 'Yudi Prabowo', '2018-03-26 00:01:09', NULL),
(120, 'dms21522058369', '1', 'Waiting Outside', '00:00:11', '02:30', NULL, '2018-03-26 07:01:31', '2018-03-26 00:01:32', 'Yudi Prabowo', '2018-03-26 00:01:32', NULL),
(121, 'dms21522059104', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:11:44', NULL, '2018-03-26 00:11:44', 'Lutfi Febrianto', '2018-03-26 00:11:44', NULL),
(122, 'dms11522059178', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:12:58', NULL, '2018-03-26 00:12:58', 'Lutfi Febrianto', '2018-03-26 00:12:58', NULL),
(123, 'dms21522059270', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-26 07:14:30', NULL, '2018-03-26 00:14:30', 'Yudi Prabowo', '2018-03-26 00:14:30', NULL),
(124, 'dms11522058321', '2', 'Waiting Outside', '00:00:12', '02:30', NULL, '2018-03-26 07:29:36', '2018-03-26 00:29:36', 'Yudi Prabowo', '2018-03-26 00:29:36', NULL),
(125, 'dms11522059178', NULL, 'Waiting Outside', '12:02:00', '02:30', NULL, '2018-03-27 06:35:44', '2018-03-26 23:35:44', 'Yudi Prabowo', '2018-03-26 23:35:44', NULL),
(126, 'dms11522147013', NULL, 'Waiting Gate', NULL, '00:00', '2018-03-27 07:36:53', NULL, '2018-03-27 00:36:53', 'Yudi Prabowo', '2018-03-27 00:36:53', NULL),
(127, 'dms11522147013', '8', 'Waiting Outside', '14:02:00', '02:30', NULL, '2018-03-27 07:37:30', '2018-03-27 00:37:30', 'Yudi Prabowo', '2018-03-27 00:37:30', NULL),
(128, 'dms11522147013', NULL, 'Waiting Outside', '14:23:00', '02:30', NULL, '2018-03-27 10:10:12', '2018-03-27 03:10:12', 'Yudi Prabowo', '2018-03-27 03:10:12', NULL),
(129, 'dms11522147013', NULL, 'Waiting Outside', '14:40:00', '02:30', NULL, '2018-03-27 10:11:13', '2018-03-27 03:11:13', 'Yudi Prabowo', '2018-03-27 03:11:13', NULL),
(130, 'dms11522147013', '2', 'Waiting Outside', '14:40:00', '02:30', NULL, '2018-03-27 10:11:22', '2018-03-27 03:11:23', 'Yudi Prabowo', '2018-03-27 03:11:23', NULL);

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
(5, 'CHECKER', 'Dery', NULL, '2018-03-23 00:53:23', '2018-03-23 00:53:23');

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
  `id_project` int(15) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dms_user_management`
--

INSERT INTO `dms_user_management` (`id`, `username`, `name`, `password`, `remember_token`, `id_usergroup`, `id_project`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'security', 'Lutfi Febrianto', '1234', NULL, 3, 7, 'lutfi', NULL, '2018-03-09 02:54:37', '2018-03-23 09:14:56'),
(3, 'superadmin', 'Yudi Prabowo', '1234', NULL, 1, 8, NULL, NULL, '2018-03-16 16:52:12', '2018-03-23 07:45:04'),
(4, 'admin1', 'Sandi Rizaldy', '1234', NULL, 2, 7, NULL, 'Dery', '2018-03-19 07:25:56', '2018-03-26 00:22:33'),
(5, 'admin2', 'lutfi', '1234', NULL, 2, 8, 'Dery', NULL, '2018-03-23 02:08:28', '2018-03-23 09:26:31');

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
(23, '2018_03_26_035845_create_master_phone_table', 4);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `dms_master_phone`
--
ALTER TABLE `dms_master_phone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dms_master_plat`
--
ALTER TABLE `dms_master_plat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `dms_master_project`
--
ALTER TABLE `dms_master_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dms_master_tc`
--
ALTER TABLE `dms_master_tc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dms_master_vehicle`
--
ALTER TABLE `dms_master_vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dms_purpose`
--
ALTER TABLE `dms_purpose`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dms_transaction`
--
ALTER TABLE `dms_transaction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `dms_transaction_history`
--
ALTER TABLE `dms_transaction_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `dms_user_group`
--
ALTER TABLE `dms_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dms_user_management`
--
ALTER TABLE `dms_user_management`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
