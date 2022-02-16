-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 12:48 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_settings`
--

CREATE TABLE `api_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `ban_status` tinyint(1) NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bar_notifications`
--

CREATE TABLE `bar_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bar_notifications`
--

INSERT INTO `bar_notifications` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(57, 'new-version', '', '2022-01-24 04:09:46', '2022-01-24 04:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `canned_response`
--

CREATE TABLE `canned_response` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `centres`
--

CREATE TABLE `centres` (
  `id` int(20) NOT NULL,
  `region_id` int(20) NOT NULL,
  `centre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `centres`
--

INSERT INTO `centres` (`id`, `region_id`, `centre`) VALUES
(1, 3, 'DIANI BLISS'),
(2, 3, 'KILIFI'),
(3, 3, 'KIZINGO'),
(4, 3, 'MALINDI'),
(5, 3, 'MTWAPA'),
(6, 4, 'EMBU'),
(7, 4, 'GARISSA'),
(8, 4, 'KERUGOYA'),
(9, 4, 'MARALAL'),
(10, 4, 'MAUA'),
(11, 4, 'MERU'),
(12, 4, 'MURANG\'A'),
(13, 4, 'NANYUKI'),
(14, 4, 'NYERI 1'),
(15, 4, 'NYERI 2'),
(16, 4, 'OLKALOU'),
(17, 4, 'PANARI NYAHURURU'),
(18, 1, 'KITUI'),
(19, 1, 'BURUBURU'),
(20, 1, 'EMALI'),
(21, 1, 'EMBAKASI'),
(22, 1, 'ENTERPRISE ROAD'),
(23, 1, 'JOGOO ROAD'),
(24, 1, 'KIBERA'),
(25, 1, 'MACHAKOS'),
(26, 1, 'MFI'),
(27, 1, 'PIPELINE'),
(28, 1, 'UMOJA'),
(29, 1, 'WOTE'),
(30, 2, 'ANANAS MALL- THIKA'),
(31, 2, 'COLLEGE HOUSE'),
(32, 2, 'GITHURAI'),
(33, 2, 'HAILE SELASSIE'),
(34, 2, 'JUJA MALL'),
(35, 2, 'KAWANGWARE'),
(36, 2, 'KIAMBU BLISS'),
(37, 2, 'MOI AVENUE'),
(38, 2, 'TELEPOSTA'),
(39, 2, 'THIKA BLISS'),
(40, 2, 'WESTLANDS'),
(41, 2, 'WINDSOR'),
(42, 6, 'AWENDO'),
(43, 6, 'BUSIA'),
(44, 6, 'HOMABAY'),
(45, 6, 'KAKAMEGA'),
(46, 6, 'KIMILILI'),
(47, 6, 'KISII 1'),
(48, 6, 'KISII 2'),
(49, 6, 'KISUMU AL IMRAN'),
(50, 6, 'KISUMU MEGA PLAZA'),
(51, 6, 'KISUMU MEGACITY'),
(52, 6, 'MBALE'),
(53, 6, 'MUMIAS'),
(54, 6, 'NYAMIRA'),
(55, 6, 'SIAYA'),
(56, 6, 'WEBUYE'),
(57, 5, 'ELDAMA RAVINE'),
(58, 5, 'ELDORET A'),
(59, 5, 'ELDORET ZION MALL'),
(60, 5, 'ITEN'),
(61, 5, 'KABARNET'),
(62, 5, 'KAKUMA'),
(63, 5, 'KAPENGURIA'),
(64, 5, 'KAPSABET'),
(65, 5, 'KERICHO'),
(66, 5, 'KITALE'),
(67, 5, 'NAIVASHA'),
(68, 5, 'NAKURU'),
(69, 5, 'NAROK');

-- --------------------------------------------------------

--
-- Table structure for table `client_result`
--

CREATE TABLE `client_result` (
  `id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `member_no` varchar(50) DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL COMMENT '0=>Principal,1=>Dependent\r\n',
  `client_location` varchar(50) DEFAULT NULL,
  `client_visit_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `scheme` varchar(50) DEFAULT NULL,
  `company_id` int(10) NOT NULL,
  `company_location` varchar(50) NOT NULL,
  `service` int(10) NOT NULL,
  `service_issue` varchar(50) NOT NULL,
  `reported_by` int(10) NOT NULL,
  `esclated_to` varchar(50) NOT NULL,
  `date_time_logged` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_result`
--

INSERT INTO `client_result` (`id`, `ticket_id`, `client_name`, `member_no`, `mobile_no`, `member_type`, `client_location`, `client_visit_date`, `scheme`, `company_id`, `company_location`, `service`, `service_issue`, `reported_by`, `esclated_to`, `date_time_logged`, `created_at`, `updated_at`) VALUES
(54, 267, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 13:31:42', 'Healthier Kenya', 1, 'MERU', 6, 'Wrong Diagnosis', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 01:31:42', '2022-01-12 14:58:39', '2022-01-14 13:31:42'),
(55, 267, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 13:31:42', 'Healthier Kenya', 1, 'GARISSA', 3, 'No Radiology Services', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 01:31:42', '2022-01-13 06:32:42', '2022-01-14 13:31:42'),
(56, 270, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2021-05-28 08:05:00', 'Healthier Kenya', 1, 'ELDORET ZION MALL', 5, 'No Dental Services', 1, '', NULL, '2022-01-13 09:24:20', NULL),
(57, 271, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-13 11:46:34', 'Healthier Kenya', 1, 'KISUMU AL IMRAN', 8, 'Package inquiry', 8, 'Michael.Gone@blisshealthcare.coke', '2022-01-12 23:46:33', '2022-01-13 09:31:48', '2022-01-13 11:46:34'),
(58, 267, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 13:31:42', 'Healthier Kenya', 1, 'NANYUKI', 8, 'Package Complaints', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 01:31:42', '2022-01-13 11:11:35', '2022-01-14 13:31:42'),
(59, 273, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2021-05-28 08:05:00', 'Healthier Kenya', 1, 'WESTLANDS', 6, 'Drug Reaction', 1, '', NULL, '2022-01-13 11:34:12', NULL),
(60, 267, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 13:31:42', 'Healthier Kenya', 1, 'KERUGOYA', 3, 'No Radiology Services', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 01:31:42', '2022-01-13 11:37:52', '2022-01-14 13:31:42'),
(61, 275, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 12:01:52', 'Healthier Kenya', 1, 'MALINDI', 3, 'Equipment/ Machine', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 00:01:51', '2022-01-13 11:39:35', '2022-01-14 12:01:52'),
(62, 275, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 12:01:52', 'Healthier Kenya', 1, 'KIZINGO', 2, 'Lack of drugs', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 00:01:51', '2022-01-13 11:41:40', '2022-01-14 12:01:52'),
(63, 271, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-13 11:46:34', 'Healthier Kenya', 1, 'MBALE', 1, 'Wrong Lenses', 1, 'Michael.Gone@blisshealthcare.coke', '2022-01-12 23:46:33', '2022-01-13 11:46:33', '2022-01-13 11:46:34'),
(64, 275, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 12:01:52', 'Healthier Kenya', 1, 'DIANI BLISS', 2, 'Incomplete dose', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 00:01:51', '2022-01-14 12:01:51', '2022-01-14 12:01:52'),
(65, 267, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-14 13:31:42', 'Healthier Kenya', 1, 'MERU', 2, 'Incomplete dose', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-14 01:31:42', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(66, 280, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-15 17:39:42', 'Healthier Kenya', 1, 'PANARI NYAHURURU', 6, 'Treatment Errors', 4, 'michael.Gone@blisshealthcare.coke', '2022-01-15 05:39:42', '2022-01-15 15:41:48', '2022-01-15 17:39:42'),
(67, 280, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-15 17:39:42', 'Healthier Kenya', 1, 'WINDSOR', 2, 'Incomplete dose', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-15 05:39:42', '2022-01-15 15:47:10', '2022-01-15 17:39:42'),
(68, 280, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-15 17:39:42', 'Healthier Kenya', 1, 'NAROK', 4, 'Lack of Specimen Holder', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-15 05:39:42', '2022-01-15 17:32:43', '2022-01-15 17:39:42'),
(69, 280, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-15 17:39:42', 'Healthier Kenya', 1, 'PANARI NYAHURURU', 2, 'Lack of drugs', 1, 'michael.Gone@blisshealthcare.coke', '2022-01-15 05:39:42', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(70, 284, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-15 17:50:23', 'Healthier Kenya', 1, 'KERUGOYA', 4, 'Wrong Lab Results', 1, 'Michael.Gone@blisshealthcare.coke', '2022-01-15 05:50:23', '2022-01-15 17:50:22', '2022-01-15 17:50:23'),
(71, 285, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:00:44', 'Healthier Kenya', 1, 'KIZINGO', 2, 'Incomplete dose', 1, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:00:44', '2022-01-17 09:00:44', '2022-01-17 09:00:44'),
(72, 286, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:03:21', 'Healthier Kenya', 1, 'KIZINGO', 1, 'Quality of frames', 1, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:03:21', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(73, 287, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:04:08', 'Healthier Kenya', 1, 'NYERI 2', 3, 'Delay in service delivery', 1, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:04:07', '2022-01-17 09:04:07', '2022-01-17 09:04:08'),
(74, 288, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:04:52', 'Healthier Kenya', 1, 'MALINDI', 4, 'Lack of Specimen Holder', 3, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:04:52', '2022-01-17 09:04:51', '2022-01-17 09:04:52'),
(75, 289, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:05:26', 'Healthier Kenya', 1, 'KAPENGURIA', 5, 'Equipment/ Machine', 1, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:05:26', '2022-01-17 09:05:26', '2022-01-17 09:05:26'),
(76, 290, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:06:18', 'Healthier Kenya', 1, 'UMOJA', 6, 'Wrong Diagnosis', 4, 'ms.nairobinorth@blisshealthcare.co.ke', '2022-01-17 09:06:18', '2022-01-17 09:06:18', '2022-01-17 09:06:18'),
(77, 291, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:07:09', 'Healthier Kenya', 1, 'NAKURU', 7, 'Staff incompetence', 4, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:07:09', '2022-01-17 09:07:09', '2022-01-17 09:07:09'),
(78, 292, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:07:41', 'Healthier Kenya', 1, 'MURANG\'A', 8, 'Package Complaints', 1, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:07:40', '2022-01-17 09:07:40', '2022-01-17 09:07:41'),
(79, 293, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:08:03', 'Healthier Kenya', 1, 'JUJA MALL', 9, 'Abnormal Bills', 1, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 09:08:03', '2022-01-17 09:08:02', '2022-01-17 09:08:03'),
(80, 294, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:08:38', 'Healthier Kenya', 1, 'MAUA', 10, 'Staff Grooming', 1, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:08:38', '2022-01-17 09:08:37', '2022-01-17 09:08:38'),
(81, 295, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 09:25:14', 'Healthier Kenya', 1, 'MTWAPA', 6, 'Delayed Doctor Appointment', 1, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:25:14', '2022-01-17 09:25:14', '2022-01-17 09:25:14'),
(82, 296, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 10:10:51', 'Healthier Kenya', 1, 'PANARI NYAHURURU', 11, 'Facility Hygiene and Tidiness', 1, 'ms.central@blisshealthcare.co.ke', '2022-01-16 22:10:50', '2022-01-17 10:10:50', '2022-01-17 10:10:51'),
(83, 297, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 11:16:42', 'Healthier Kenya', 1, 'OLKALOU', 12, 'Billing-Medical-Bills', 1, 'support@makl.co.ke', '2022-01-16 23:16:42', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(84, 298, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 12:18:30', 'Healthier Kenya', 1, 'MTWAPA', 6, 'Delayed Doctor Appointment', 1, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 00:18:29', '2022-01-17 12:18:29', '2022-01-17 12:18:30'),
(85, 299, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-17 14:32:23', 'Healthier Kenya', 1, 'JUJA MALL', 9, 'Abnormal Bills', 6, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 02:32:23', '2022-01-17 14:32:22', '2022-01-17 14:32:23'),
(86, 300, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-18 08:23:54', 'Healthier Kenya', 1, 'NYERI 1', 3, 'No Radiology Services', 1, 'hr2@blisshealthcare.co.ke', '2022-01-18 08:23:54', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(87, 301, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-19 09:48:14', 'Healthier Kenya', 1, 'MALINDI', 12, 'Billing-Member-Limits', 1, 'support@makl.co.ke', '2022-01-19 09:48:13', '2022-01-19 09:48:13', '2022-01-19 09:48:14'),
(88, 302, 'Peris chepkemoi', '12172', 722369852, 'Principal', 'Diani', '2022-01-19 09:50:10', 'Healthier Kenya', 1, 'KERUGOYA', 5, 'Equipment/ Machine', 1, 'ms.central@blisshealthcare.co.ke', '2022-01-19 09:50:10', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(89, 303, 'test patient', '12345', 721569874, 'Principal', 'Mombasa', '2022-01-19 09:57:27', 'Healthier kenya', 1, 'MALINDI', 11, 'Facility Maintenance', 1, 'ms.coast@blisshealthcare.co.ke', '2022-01-19 09:57:26', '2022-01-19 09:57:26', '2022-01-19 09:57:27'),
(90, 304, 'test patient', '12345', 721569874, 'Principal', 'Mombasa', '2022-01-21 18:54:58', 'Healthier kenya', 1, 'KITUI', 12, 'Ambulance', 1, 'medical@makl.co.ke', '2022-01-21 06:54:58', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(91, 305, 'test patient', '12345', 721569874, 'Principal', 'Mombasa', '2022-01-21 19:09:55', 'Healthier kenya', 1, 'MTWAPA', 12, 'Preauth approval', 3, 'medical@makl.co.ke', '2022-01-21 07:09:55', '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(92, 306, 'test patient', '12345', 721569874, 'Principal', 'Mombasa', '2022-01-22 06:18:03', 'Healthier kenya', 1, 'PANARI NYAHURURU', 12, 'MVC', 2, 'medical@makl.co.ke', '2022-01-22 06:18:03', '2022-01-22 06:18:02', '2022-01-22 06:18:03'),
(93, 307, 'test patient', '12345', 721569874, 'Principal', 'Mombasa', '2022-01-22 09:02:26', 'Healthier kenya', 1, 'ELDAMA RAVINE', 12, 'Billing-Last-Expense', 7, 'support@makl.co.ke', '2022-01-22 09:02:25', '2022-01-22 09:02:25', '2022-01-22 09:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `common_settings`
--

CREATE TABLE `common_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `optional_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `common_settings`
--

INSERT INTO `common_settings` (`id`, `option_name`, `option_value`, `status`, `optional_field`, `created_at`, `updated_at`) VALUES
(1, 'itil', '', '0', '', NULL, NULL),
(2, 'ticket_token_time_duration', '1', '', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(3, 'enable_rtl', '', '', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(4, 'user_set_ticket_status', '', '1', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(5, 'send_otp', '', '0', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(6, 'email_mandatory', '', '1', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(7, 'user_priority', '', '0', '', '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(8, 'dummy_data_installation', '', '1', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_centre_dept`
--

CREATE TABLE `contact_centre_dept` (
  `id` int(20) NOT NULL,
  `service_issue_id` int(20) NOT NULL,
  `department` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_centre_dept`
--

INSERT INTO `contact_centre_dept` (`id`, `service_issue_id`, `department`) VALUES
(1, 48, 'MEDICAL'),
(2, 49, 'CUSTOMER SERVICE'),
(3, 50, 'CUSTOMER SERVICE'),
(4, 51, 'CUSTOMER SERVICE'),
(5, 52, 'CUSTOMER SERVICE'),
(6, 53, 'CUSTOMER SERVICE'),
(7, 54, 'CUSTOMER SERVICE'),
(8, 55, 'CUSTOMER SERVICE'),
(9, 56, 'CUSTOMER SERVICE'),
(10, 57, 'CUSTOMER SERVICE'),
(11, 58, 'CUSTOMER SERVICE'),
(12, 59, 'MEDICAL'),
(13, 60, 'CUSTOMER SERVICE'),
(14, 61, 'MEDICAL');

-- --------------------------------------------------------

--
-- Table structure for table `country_code`
--

CREATE TABLE `country_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nicename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `numcode` smallint(6) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country_code`
--

INSERT INTO `country_code` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'NUL', 0, 0, '2016-12-13 03:19:33', '2016-12-13 03:19:33'),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229, '2016-12-13 03:19:34', '2016-12-13 03:19:34'),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 'NUL', 0, 0, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'NUL', 0, 246, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345, '2016-12-13 03:19:35', '2016-12-13 03:19:35'),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'NUL', 0, 61, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'NUL', 0, 672, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(53, 'CI', 'COTE DIVOIRE', 'Cote DIvoire', 'CIV', 384, 225, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420, '2016-12-13 03:19:36', '2016-12-13 03:19:36'),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594, '2016-12-13 03:19:37', '2016-12-13 03:19:37'),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'NUL', 0, 0, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592, '2016-12-13 03:19:38', '2016-12-13 03:19:38'),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'NUL', 0, 0, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7, '2016-12-13 03:19:39', '2016-12-13 03:19:39'),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLES REPUBLIC OF', 'Korea, Democratic Peoples Republic of', 'PRK', 408, 850, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(116, 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', 'Lao Peoples Democratic Republic', 'LAO', 418, 856, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389, '2016-12-13 03:19:40', '2016-12-13 03:19:40'),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(137, 'YT', 'MAYOTTE', 'Mayotte', 'NUL', 0, 269, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664, '2016-12-13 03:19:41', '2016-12-13 03:19:41'),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968, '2016-12-13 03:19:42', '2016-12-13 03:19:42'),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 'NUL', 0, 970, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70, '2016-12-13 03:19:43', '2016-12-13 03:19:43'),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', 'NUL', 0, 381, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386, '2016-12-13 03:19:44', '2016-12-13 03:19:44'),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'NUL', 0, 0, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 'NUL', 0, 670, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228, '2016-12-13 03:19:45', '2016-12-13 03:19:45'),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'NUL', 0, 1, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998, '2016-12-13 03:19:46', '2016-12-13 03:19:46'),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260, '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263, '2016-12-13 03:19:47', '2016-12-13 03:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `custom_forms`
--

CREATE TABLE `custom_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `formname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form_fields`
--

CREATE TABLE `custom_form_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `forms_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `date_format`
--

CREATE TABLE `date_format` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `date_format`
--

INSERT INTO `date_format` (`id`, `format`) VALUES
(1, 'dd/mm/yyyy'),
(2, 'dd-mm-yyyy'),
(3, 'dd.mm.yyyy'),
(4, 'mm/dd/yyyy'),
(5, 'mm:dd:yyyy'),
(6, 'mm-dd-yyyy'),
(7, 'yyyy/mm/dd'),
(8, 'yyyy.mm.dd'),
(9, 'yyyy-mm-dd');

-- --------------------------------------------------------

--
-- Table structure for table `date_time_format`
--

CREATE TABLE `date_time_format` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `date_time_format`
--

INSERT INTO `date_time_format` (`id`, `format`) VALUES
(1, 'd/m/Y H:i:s'),
(2, 'd.m.Y H:i:s'),
(3, 'd-m-Y H:i:s'),
(4, 'm/d/Y H:i:s'),
(5, 'm.d.Y H:i:s'),
(6, 'm-d-Y H:i:s'),
(7, 'Y/m/d H:i:s'),
(8, 'Y.m.d H:i:s'),
(9, 'Y-m-d H:i:s');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sla` int(10) UNSIGNED DEFAULT NULL,
  `manager` int(10) UNSIGNED DEFAULT NULL,
  `ticket_assignment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `outgoing_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auto_ticket_response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auto_message_response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auto_response_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_access` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department_sign` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `type`, `sla`, `manager`, `ticket_assignment`, `outgoing_email`, `template_set`, `auto_ticket_response`, `auto_message_response`, `auto_response_email`, `recipient`, `group_access`, `department_sign`, `created_at`, `updated_at`) VALUES
(1, 'Support', '1', 1, NULL, '', '', '', '', '', '', '', '', '', '2016-12-13 03:19:27', '2016-12-13 03:19:27'),
(2, 'Sales', '1', 1, NULL, '', '', '', '', '', '', '', '', '', '2016-12-13 03:19:28', '2016-12-13 03:19:28'),
(3, 'Operation', '1', 1, NULL, '', '', '', '', '', '', '', '', '', '2016-12-13 03:19:28', '2016-12-13 03:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `dump_department`
--

CREATE TABLE `dump_department` (
  `id` int(10) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `Open` int(10) DEFAULT NULL,
  `Resolved` int(10) DEFAULT NULL,
  `Closed` int(10) DEFAULT NULL,
  `OPen_7_15` int(10) DEFAULT NULL,
  `Resolved_7_15` int(10) DEFAULT NULL,
  `Closed_7_15` int(10) DEFAULT NULL,
  `OPen_16_30` int(10) DEFAULT NULL,
  `Closed_16_30` int(10) DEFAULT NULL,
  `Resolved_16_30` int(10) NOT NULL,
  `OPen_30` int(11) DEFAULT NULL,
  `Resolved_30` int(11) DEFAULT NULL,
  `Closed_30` int(11) DEFAULT NULL,
  `Progress` int(10) DEFAULT NULL,
  `Progress_7_15` int(10) DEFAULT NULL,
  `Progress_16_30` int(10) DEFAULT NULL,
  `Progress_30` int(10) DEFAULT NULL,
  `sort_service_datawise` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dump_department`
--

INSERT INTO `dump_department` (`id`, `service_name`, `Open`, `Resolved`, `Closed`, `OPen_7_15`, `Resolved_7_15`, `Closed_7_15`, `OPen_16_30`, `Closed_16_30`, `Resolved_16_30`, `OPen_30`, `Resolved_30`, `Closed_30`, `Progress`, `Progress_7_15`, `Progress_16_30`, `Progress_30`, `sort_service_datawise`) VALUES
(1, 'Billing-Medical-Bills', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Billing-Member-Limits', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Ambulance', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Preauth approval', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'MVC', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Billing-Last-Expense', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `help_topic` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fetching_host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fetching_port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fetching_protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fetching_encryption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailbox_protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imap_config` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sending_host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sending_port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sending_protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sending_encryption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_validate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_authentication` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auto_response` tinyint(1) NOT NULL,
  `fetching_status` tinyint(1) NOT NULL,
  `move_to_folder` tinyint(1) NOT NULL,
  `delete_email` tinyint(1) NOT NULL,
  `do_nothing` tinyint(1) NOT NULL,
  `sending_status` tinyint(1) NOT NULL,
  `authentication` tinyint(1) NOT NULL,
  `header_spoofing` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `email_address`, `email_name`, `department`, `priority`, `help_topic`, `user_name`, `password`, `fetching_host`, `fetching_port`, `fetching_protocol`, `fetching_encryption`, `mailbox_protocol`, `imap_config`, `folder`, `sending_host`, `sending_port`, `sending_protocol`, `sending_encryption`, `smtp_validate`, `smtp_authentication`, `internal_notes`, `auto_response`, `fetching_status`, `move_to_folder`, `delete_email`, `do_nothing`, `sending_status`, `authentication`, `header_spoofing`, `created_at`, `updated_at`) VALUES
(1, 'No_Reply@medbookafrica.com', 'No Reply', 1, 2, 1, 'No_Reply@lifecarekenya.com', 'eyJpdiI6IllET2Z4UmdIRVhnSktoc3BRV1BSb0E9PSIsInZhbHVlIjoib0o2U1lkUlVoUTg5dWJSS0NadytBZz09IiwibWFjIjoiZDZhNWNhMTFiNTVjODJjMGI0M2E1OTFmNmRiNjAxZDRjYzdlNTgwYThjYjQ2ODdmN2ExYWQzYzgwNmRhNDU4NyJ9', 'outlook.office365.com', '993', 'pop', 'tls', 'novalidate-cert', '', '', 'smtp.office365.com', '587', 'smtp', 'tls', '1', '1', '', 0, 1, 0, 0, 0, 1, 1, 0, '2021-08-28 00:33:49', '2021-08-28 00:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `esclation_matrix`
--

CREATE TABLE `esclation_matrix` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `companyservice` varchar(50) NOT NULL,
  `company_service_issue` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `level` int(10) NOT NULL,
  `min1` varchar(10) DEFAULT NULL,
  `min2` varchar(10) DEFAULT NULL,
  `min3` varchar(10) DEFAULT NULL,
  `min4` varchar(10) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `email3` varchar(50) DEFAULT NULL,
  `email4` varchar(50) DEFAULT NULL,
  `minutes` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `esclation_matrix`
--

INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Bliss Medical  Centre', 'OPTICAL', 'Delayed spectacles', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Bliss Medical  Centre', 'OPTICAL', 'Wrong Lenses', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Bliss Medical  Centre', 'OPTICAL', 'No frames', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Bliss Medical  Centre', 'OPTICAL', 'No spectacle case', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Bliss Medical  Centre', 'OPTICAL', 'No optical service', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Bliss Medical  Centre', 'OPTICAL', 'Quality of frames', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Bliss Medical  Centre', 'OPTICAL', 'No cases', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Bliss Medical  Centre', 'OPTICAL', 'Equipment/ Machine', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Stephen.Mwale@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(169, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Bliss Medical  Centre', 'PHARMACY', 'Lack of drugs', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Bliss Medical  Centre', 'PHARMACY', 'Incomplete dose', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Bliss Medical  Centre', 'PHARMACY', 'Quality of drugs', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Bliss Medical  Centre', 'PHARMACY', 'Issuance of wrong drugs', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'Bliss Medical  Centre', 'RADIOLOGY', 'Equipment/ Machine', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Bliss Medical  Centre', 'RADIOLOGY', 'No Radiology Services', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'Bliss Medical  Centre', 'RADIOLOGY', 'image/film not given', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Bliss Medical  Centre', 'RADIOLOGY', 'Delay in service delivery', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'radiology@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(334, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'Bliss Medical  Centre', 'LABORATORY', 'Delayed Results', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'Bliss Medical  Centre', 'LABORATORY', 'Lack of Specimen Holder', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'Bliss Medical  Centre', 'LABORATORY', 'Wrong Lab Results', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'sylvia.sote@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', ' hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'Bliss Medical  Centre', 'DENTAL', 'Delayed Appointment', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'Bliss Medical  Centre', 'DENTAL', 'Equipment/ Machine', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'dental@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'Bliss Medical  Centre', 'DENTAL', 'No Dental Services', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', ' hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'Bliss Medical  Centre', 'MEDICAL', 'Drug Reaction', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'harrison.vigedi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(500, 'Bliss Medical  Centre', 'MEDICAL', 'Wrong Diagnosis', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'Bliss Medical  Centre', 'MEDICAL', 'Treatment Errors', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'Bliss Medical  Centre', 'MEDICAL', 'Delayed Doctor Appointment', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'Bliss Medical  Centre', 'MEDICAL', 'No improvement on treatment', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'Bliss Medical  Centre', 'MEDICAL', 'Poor Service', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Equipment/ Machine', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Staff incompetence', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'Delayed Appointment', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 'Bliss Medical  Centre', 'PHYSIOTHERAPY', 'No Physiotherapy Services', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package inquiry', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 'Bliss Medical  Centre', 'TELEMEDICINE', 'Package Complaints', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 'Bliss Medical  Centre', 'TELEMEDICINE', 'CDM', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', 'Michael.Gone@blisshealthcare.coke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(664, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 'Bliss Medical  Centre', 'ACCOUNTS', 'Reimbursements ', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 'Bliss Medical  Centre', 'ACCOUNTS', 'No receipt for payment', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 'Bliss Medical  Centre', 'ACCOUNTS', 'Payment made to Staff', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 'Bliss Medical  Centre', 'ACCOUNTS', 'Abnormal Bills', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'Bharat.Rawat@blisshealthcare.co.ke', 'Pradeep.Meharishi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'hr.cluster1@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 'Bliss Medical  Centre', 'HR', 'Staff Indiscipline', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 'Bliss Medical  Centre', 'HR', 'Bad Attitude by Staff', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 'Bliss Medical  Centre', 'HR', 'Staff Grooming', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'hr.cluster2@blisshealthcare.co.ke', 'alfred.gakumbi@blisshealthcare.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi East', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi East', 1, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi West', 1, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi West', 1, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Coast', 1, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Coast', 1, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Mount Kenya', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Mount Kenya', 1, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Rift Valley', 1, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Rift Valley', 1, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nyanza', 1, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nyanza', 1, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi East', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi East', 2, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi West', 2, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi West', 2, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Coast', 2, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Coast', 2, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Mount Kenya', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Mount Kenya', 2, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Rift Valley', 2, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Rift Valley', 2, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nyanza', 2, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nyanza', 2, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi East', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi East', 3, '1440', '720', '720', '', 'ms.nairobinorth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nairobi West', 3, '1440', '720', '720', '', 'hr1@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(824, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nairobi West', 3, '1440', '720', '720', '', 'ms.nairobisouth@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Coast', 3, '1440', '720', '720', '', 'hr4@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Coast', 3, '1440', '720', '720', '', 'ms.coast@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Mount Kenya', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Mount Kenya', 3, '1440', '720', '720', '', 'ms.central@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Rift Valley', 3, '1440', '720', '720', '', 'hr5@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Rift Valley', 3, '1440', '720', '720', '', 'ms.riftvalley@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Bad Attitude by Staff', 'Nyanza', 3, '1440', '720', '720', '', 'hr2@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Uniform', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Facility Hygiene and Tidiness', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'manager.nursing@blisshealthcare.co.ke', 'batul.fankupi@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'facility maintenance', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'antony.maina@blisshealthcare.co.ke', 'lawrence.gitau@blisshealthcare.co.ke', '', '', '', '2022-01-19 09:55:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 'Bliss Medical  Centre', 'CUSTOMER EXPERIENCE ISSUES', 'Follow up on pre-auth', 'Nyanza', 3, '1440', '720', '720', '', 'ms.nyanza@blisshealthcare.co.ke', 'customerexperience@blisshealthcare.co.ke', 'carol.machine@blisshealthcare.co.ke', '', '', '', '2022-01-17 10:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi East', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi East', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi East', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi East', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi East', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi East', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi East', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi East', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi East', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi West', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi West', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi West', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi West', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi West', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi West', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi West', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi West', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi West', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Coast', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Coast', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Coast', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Coast', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Coast', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Coast', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Coast', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Coast', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Coast', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Mount Kenya', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Mount Kenya', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Mount Kenya', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Mount Kenya', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Mount Kenya', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Mount Kenya', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Mount Kenya', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Mount Kenya', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Mount Kenya', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Rift Valley', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Rift Valley', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Rift Valley', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Rift Valley', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Rift Valley', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Rift Valley', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Rift Valley', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Rift Valley', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Rift Valley', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nyanza', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nyanza', 1, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nyanza', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nyanza', 1, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nyanza', 1, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nyanza', 1, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nyanza', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nyanza', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nyanza', 1, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi East', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi East', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi East', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi East', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi East', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi East', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi East', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi East', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi East', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi West', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi West', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi West', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi West', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi West', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi West', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi West', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi West', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi West', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Coast', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Coast', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Coast', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Coast', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Coast', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Coast', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Coast', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Coast', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Coast', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Mount Kenya', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Mount Kenya', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Mount Kenya', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Mount Kenya', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Mount Kenya', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Mount Kenya', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Mount Kenya', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Mount Kenya', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Mount Kenya', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Rift Valley', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Rift Valley', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Rift Valley', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Rift Valley', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Rift Valley', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Rift Valley', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Rift Valley', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Rift Valley', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Rift Valley', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nyanza', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nyanza', 2, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `esclation_matrix` (`id`, `company_name`, `companyservice`, `company_service_issue`, `region`, `level`, `min1`, `min2`, `min3`, `min4`, `email1`, `email2`, `email3`, `email4`, `minutes`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1007, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nyanza', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nyanza', 2, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nyanza', 2, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nyanza', 2, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nyanza', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nyanza', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nyanza', 2, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1015, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi East', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi East', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-smart-Card-holder', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi East', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi East', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi East', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi East', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi East', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi East', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi East', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nairobi West', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nairobi West', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nairobi West', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nairobi West', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nairobi West', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nairobi West', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nairobi West', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nairobi West', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nairobi West', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Coast', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Coast', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Coast', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Coast', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Coast', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Coast', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Coast', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Coast', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Coast', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Mount Kenya', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Mount Kenya', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Mount Kenya', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Mount Kenya', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Mount Kenya', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Mount Kenya', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Mount Kenya', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Mount Kenya', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Mount Kenya', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Rift Valley', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Rift Valley', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Rift Valley', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Rift Valley', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Rift Valley', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Rift Valley', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Rift Valley', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Rift Valley', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Rift Valley', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Ambulance', 'Nyanza', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Last-Expense', 'Nyanza', 3, '30', '30', '30', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Group-Life-Cover', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Medical-Bills', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Member-Limits', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Co-pay', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-mart-Card-holder', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Billing-Scheme-Benefits', 'Nyanza', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Eligibility', 'Nyanza', 3, '30', '30', '30', '', 'support@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Last Expense', 'Nyanza', 3, '30', '30', '30', '', 'cs@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Missing Button-Preauth Button', 'Nyanza', 3, '30', '30', '15', '', 'support@makl.co.ke', 'sheila.joy@makl.co.ke', 'Meenakshi.P@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'MVC', 'Nyanza', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'One Time Pin', 'Nyanza', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'Outbound@makl.co.ke', 'sheila.joy@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, 'Bliss Medical  Centre', 'CONTACT CENTRE', 'Preauth approval', 'Nyanza', 3, '30', '30', '30', '', 'medical@makl.co.ke', 'andrew.kinyanjui@makl.co.ke', 'Mrityunjay.Singh@makl.co.ke', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faveo_mails`
--

CREATE TABLE `faveo_mails` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_id` int(11) NOT NULL,
  `drive` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faveo_queues`
--

CREATE TABLE `faveo_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_values`
--

CREATE TABLE `field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `child_id` int(10) UNSIGNED DEFAULT NULL,
  `field_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_status` tinyint(1) NOT NULL,
  `can_create_ticket` tinyint(1) NOT NULL,
  `can_edit_ticket` tinyint(1) NOT NULL,
  `can_post_ticket` tinyint(1) NOT NULL,
  `can_close_ticket` tinyint(1) NOT NULL,
  `can_assign_ticket` tinyint(1) NOT NULL,
  `can_transfer_ticket` tinyint(1) NOT NULL,
  `can_delete_ticket` tinyint(1) NOT NULL,
  `can_ban_email` tinyint(1) NOT NULL,
  `can_manage_canned` tinyint(1) NOT NULL,
  `can_manage_faq` tinyint(1) NOT NULL,
  `can_view_agent_stats` tinyint(1) NOT NULL,
  `department_access` tinyint(1) NOT NULL,
  `admin_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `group_status`, `can_create_ticket`, `can_edit_ticket`, `can_post_ticket`, `can_close_ticket`, `can_assign_ticket`, `can_transfer_ticket`, `can_delete_ticket`, `can_ban_email`, `can_manage_canned`, `can_manage_faq`, `can_view_agent_stats`, `department_access`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 'Group A', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27'),
(2, 'Group B', 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27'),
(3, 'Group C', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `group_assign_department`
--

CREATE TABLE `group_assign_department` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topic`
--

CREATE TABLE `help_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_form` int(10) UNSIGNED DEFAULT NULL,
  `department` int(10) UNSIGNED DEFAULT NULL,
  `ticket_status` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `sla_plan` int(10) UNSIGNED DEFAULT NULL,
  `thank_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_num_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `auto_assign` int(10) UNSIGNED DEFAULT NULL,
  `auto_response` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `help_topic`
--

INSERT INTO `help_topic` (`id`, `topic`, `parent_topic`, `custom_form`, `department`, `ticket_status`, `priority`, `sla_plan`, `thank_page`, `ticket_num_format`, `internal_notes`, `status`, `type`, `auto_assign`, `auto_response`, `created_at`, `updated_at`) VALUES
(1, 'Support query', '', NULL, 1, 1, 2, 1, '', '1', '', 1, 1, NULL, 0, '2016-12-13 03:19:28', '2016-12-13 03:19:28'),
(2, 'Sales query', '', NULL, 2, 1, 2, 1, '', '1', '', 0, 1, NULL, 0, '2016-12-13 03:19:28', '2016-12-13 03:19:28'),
(3, 'Operational query', '', NULL, 3, 1, 2, 1, '', '1', '', 0, 1, NULL, 0, '2016-12-13 03:19:28', '2016-12-13 03:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_article`
--

CREATE TABLE `kb_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_article_relationship`
--

CREATE TABLE `kb_article_relationship` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_category`
--

CREATE TABLE `kb_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `parent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kb_category`
--

INSERT INTO `kb_category` (`id`, `name`, `slug`, `description`, `status`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Issue Handeling', 'issue-handeling', 'These are the list of error handling issue.', 1, 0, '2016-12-13 03:23:54', '2016-12-13 03:23:54'),
(2, 'Policy', 'policy', 'These are the policies defined by this organization.', 1, 0, '2016-12-13 03:24:38', '2016-12-13 03:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `kb_comment`
--

CREATE TABLE `kb_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_pages`
--

CREATE TABLE `kb_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_settings`
--

CREATE TABLE `kb_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `pagination` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kb_settings`
--

INSERT INTO `kb_settings` (`id`, `pagination`, `created_at`, `updated_at`) VALUES
(1, 10, '2016-12-13 03:19:32', '2016-12-13 03:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `locale`) VALUES
(1, 'English', 'en'),
(2, 'Italian', 'it'),
(3, 'German', 'de'),
(4, 'French', 'fr'),
(5, 'Brazilian Portuguese', 'pt_BR'),
(6, 'Dutch', 'nl'),
(7, 'Spanish', 'es'),
(8, 'Norwegian', 'nb_NO'),
(9, 'Danish', 'da');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `User` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Attempts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LastLogin` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `User`, `IP`, `Attempts`, `LastLogin`, `created_at`, `updated_at`) VALUES
(1, 'demo_admin', '127.0.0.1', '0', '2022-01-03 06:33:10', '2016-12-13 03:19:53', '2016-12-13 03:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `log_notification`
--

CREATE TABLE `log_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `log` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log_notification`
--

INSERT INTO `log_notification` (`id`, `log`, `created_at`, `updated_at`) VALUES
(1, 'NOT-1', '2016-12-13 03:19:29', '2016-12-13 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `mailbox_protocol`
--

CREATE TABLE `mailbox_protocol` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mailbox_protocol`
--

INSERT INTO `mailbox_protocol` (`id`, `name`, `value`) VALUES
(1, 'IMAP', '/imap'),
(2, 'IMAP+SSL', '/imap/ssl'),
(3, 'IMAP+TLS', '/imap/tls'),
(4, 'IMAP+SSL/No-validate', '/imap/ssl/novalidate-cert');

-- --------------------------------------------------------

--
-- Table structure for table `mail_services`
--

CREATE TABLE `mail_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mail_services`
--

INSERT INTO `mail_services` (`id`, `name`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 'SMTP', 'smtp', '2016-12-13 03:19:08', '2016-12-13 03:19:08'),
(2, 'Php Mail', 'mail', '2016-12-13 03:19:08', '2016-12-13 03:19:08'),
(3, 'Send Mail', 'sendmail', '2016-12-13 03:19:08', '2016-12-13 03:19:08'),
(4, 'Mailgun', 'mailgun', '2016-12-13 03:19:08', '2016-12-13 03:19:08'),
(5, 'Mandrill', 'mandrill', '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(6, 'Log file', 'log', '2016-12-13 03:19:09', '2016-12-13 03:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `master_status`
--

CREATE TABLE `master_status` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_status`
--

INSERT INTO `master_status` (`id`, `name`) VALUES
(4, ''),
(3, 'Closed'),
(5, 'Deleted'),
(1, 'Open'),
(2, 'Resolved');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`, `id`) VALUES
('2016_02_16_140450_create_banlist_table', 1, 1),
('2016_02_16_140450_create_canned_response_table', 1, 2),
('2016_02_16_140450_create_custom_form_fields_table', 1, 3),
('2016_02_16_140450_create_custom_forms_table', 1, 4),
('2016_02_16_140450_create_date_format_table', 1, 5),
('2016_02_16_140450_create_date_time_format_table', 1, 6),
('2016_02_16_140450_create_department_table', 1, 7),
('2016_02_16_140450_create_emails_table', 1, 8),
('2016_02_16_140450_create_group_assign_department_table', 1, 9),
('2016_02_16_140450_create_groups_table', 1, 10),
('2016_02_16_140450_create_help_topic_table', 1, 11),
('2016_02_16_140450_create_kb_article_relationship_table', 1, 12),
('2016_02_16_140450_create_kb_article_table', 1, 13),
('2016_02_16_140450_create_kb_category_table', 1, 14),
('2016_02_16_140450_create_kb_comment_table', 1, 15),
('2016_02_16_140450_create_kb_pages_table', 1, 16),
('2016_02_16_140450_create_kb_settings_table', 1, 17),
('2016_02_16_140450_create_languages_table', 1, 18),
('2016_02_16_140450_create_log_notification_table', 1, 19),
('2016_02_16_140450_create_mailbox_protocol_table', 1, 20),
('2016_02_16_140450_create_organization_table', 1, 21),
('2016_02_16_140450_create_password_resets_table', 1, 22),
('2016_02_16_140450_create_plugins_table', 1, 23),
('2016_02_16_140450_create_settings_alert_notice_table', 1, 24),
('2016_02_16_140450_create_settings_auto_response_table', 1, 25),
('2016_02_16_140450_create_settings_company_table', 1, 26),
('2016_02_16_140450_create_settings_email_table', 1, 27),
('2016_02_16_140450_create_settings_ratings_table', 1, 28),
('2016_02_16_140450_create_settings_system_table', 1, 29),
('2016_02_16_140450_create_settings_ticket_table', 1, 30),
('2016_02_16_140450_create_sla_plan_table', 1, 31),
('2016_02_16_140450_create_team_assign_agent_table', 1, 32),
('2016_02_16_140450_create_teams_table', 1, 33),
('2016_02_16_140450_create_template_table', 1, 34),
('2016_02_16_140450_create_ticket_attachment_table', 1, 35),
('2016_02_16_140450_create_ticket_collaborator_table', 1, 36),
('2016_02_16_140450_create_ticket_form_data_table', 1, 37),
('2016_02_16_140450_create_ticket_priority_table', 1, 38),
('2016_02_16_140450_create_ticket_source_table', 1, 39),
('2016_02_16_140450_create_ticket_status_table', 1, 40),
('2016_02_16_140450_create_ticket_thread_table', 1, 41),
('2016_02_16_140450_create_tickets_table', 1, 42),
('2016_02_16_140450_create_time_format_table', 1, 43),
('2016_02_16_140450_create_timezone_table', 1, 44),
('2016_02_16_140450_create_user_assign_organization_table', 1, 45),
('2016_02_16_140450_create_users_table', 1, 46),
('2016_02_16_140450_create_version_check_table', 1, 47),
('2016_02_16_140450_create_widgets_table', 1, 48),
('2016_02_16_140454_add_foreign_keys_to_canned_response_table', 1, 49),
('2016_02_16_140454_add_foreign_keys_to_department_table', 1, 50),
('2016_02_16_140454_add_foreign_keys_to_emails_table', 1, 51),
('2016_02_16_140454_add_foreign_keys_to_group_assign_department_table', 1, 52),
('2016_02_16_140454_add_foreign_keys_to_help_topic_table', 1, 53),
('2016_02_16_140454_add_foreign_keys_to_kb_article_relationship_table', 1, 54),
('2016_02_16_140454_add_foreign_keys_to_kb_comment_table', 1, 55),
('2016_02_16_140454_add_foreign_keys_to_organization_table', 1, 56),
('2016_02_16_140454_add_foreign_keys_to_settings_system_table', 1, 57),
('2016_02_16_140454_add_foreign_keys_to_team_assign_agent_table', 1, 58),
('2016_02_16_140454_add_foreign_keys_to_teams_table', 1, 59),
('2016_02_16_140454_add_foreign_keys_to_ticket_attachment_table', 1, 60),
('2016_02_16_140454_add_foreign_keys_to_ticket_collaborator_table', 1, 61),
('2016_02_16_140454_add_foreign_keys_to_ticket_form_data_table', 1, 62),
('2016_02_16_140454_add_foreign_keys_to_ticket_thread_table', 1, 63),
('2016_02_16_140454_add_foreign_keys_to_tickets_table', 1, 64),
('2016_02_16_140454_add_foreign_keys_to_user_assign_organization_table', 1, 65),
('2016_02_16_140454_add_foreign_keys_to_users_table', 1, 66),
('2016_03_31_061239_create_notifications_table', 1, 67),
('2016_03_31_061534_create_notification_types_table', 1, 68),
('2016_03_31_061740_create_user_notification_table', 1, 69),
('2016_04_18_115852_create_workflow_name_table', 1, 70),
('2016_04_18_115900_create_workflow_rule_table', 1, 71),
('2016_04_18_115908_create_workflow_action_table', 1, 72),
('2016_05_10_102423_create_country_code_table', 1, 73),
('2016_05_10_102604_create_bar_notifications_table', 1, 74),
('2016_05_11_105244_create_api_settings_table', 1, 75),
('2016_05_19_055008_create_workflow_close_table', 1, 76),
('2016_06_02_072210_create_common_settings_table', 1, 77),
('2016_06_02_074913_create_login_attempts_table', 1, 78),
('2016_06_02_080005_create_ratings_table', 1, 79),
('2016_06_02_081020_create_rating_ref_table', 1, 80),
('2016_06_02_090225_create_settings_security_table', 1, 81),
('2016_06_02_090628_create_templates_table', 1, 82),
('2016_06_02_094409_create_template_sets_table', 1, 83),
('2016_06_02_094420_create_template_types_table', 1, 84),
('2016_06_02_095357_create_ticket_token_table', 1, 85),
('2016_06_28_141613_version1079table', 1, 86),
('2016_07_02_051247_create_jobs_table', 1, 87),
('2016_07_02_051439_create_failed_jobs_table', 1, 88),
('2016_07_19_071910_create_field_values_table', 1, 89),
('2016_07_26_084458_create_faveo_mails_table', 1, 90),
('2016_07_26_090201_create_faveo_queues_table', 1, 91),
('2016_07_26_094753_create_mail_services_table', 1, 92),
('2016_07_26_095020_create_queue_services_table', 1, 93),
('2016_07_29_113012_create_conditions_table', 1, 94),
('2016_08_08_095744_create_social_media_table', 1, 95),
('2016_08_12_104410_create_user_additional_infos_table', 1, 96),
('2016_08_16_104539_alter_ticket_source_table', 1, 97),
('2016_11_30_122809_alter_attachment_table', 2, 98);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_id` int(11) NOT NULL,
  `userid_created` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `model_id`, `userid_created`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 3, '2016-12-13 03:45:19', '2016-12-13 03:45:19'),
(2, 2, 5, 3, '2016-12-13 03:50:56', '2016-12-13 03:50:56'),
(3, 3, 6, 3, '2016-12-13 03:55:55', '2016-12-13 03:55:55'),
(4, 4, 7, 3, '2016-12-13 03:58:40', '2016-12-13 03:58:40'),
(5, 4, 1, 2, '2016-12-13 04:01:55', '2016-12-13 04:01:55'),
(6, 5, 7, 3, '2016-12-13 04:02:49', '2016-12-13 04:02:49'),
(8, 7, 9, 3, '2021-08-06 01:42:59', '2021-08-06 01:42:59'),
(9, 8, 9, 3, '2021-08-09 03:23:43', '2021-08-09 03:23:43'),
(10, 9, 10, 3, '2021-08-16 02:35:40', '2021-08-16 02:35:40'),
(11, 10, 10, 3, '2021-08-17 23:38:43', '2021-08-17 23:38:43'),
(12, 19, 10, 3, '2021-08-18 01:47:14', '2021-08-18 01:47:14'),
(13, 20, 10, 3, '2021-08-18 01:51:48', '2021-08-18 01:51:48'),
(14, 21, 10, 3, '2021-08-18 01:54:08', '2021-08-18 01:54:08'),
(15, 22, 10, 3, '2021-08-18 02:06:19', '2021-08-18 02:06:19'),
(16, 23, 10, 3, '2021-08-18 02:06:58', '2021-08-18 02:06:58'),
(17, 24, 10, 3, '2021-08-18 02:31:25', '2021-08-18 02:31:25'),
(18, 27, 10, 3, '2021-08-18 02:39:01', '2021-08-18 02:39:01'),
(19, 28, 10, 3, '2021-08-20 01:59:29', '2021-08-20 01:59:29'),
(20, 29, 10, 3, '2021-08-20 03:05:30', '2021-08-20 03:05:30'),
(21, 30, 10, 3, '2021-08-20 03:08:58', '2021-08-20 03:08:58'),
(22, 31, 10, 3, '2021-08-20 04:46:34', '2021-08-20 04:46:34'),
(23, 32, 10, 3, '2021-08-20 04:49:01', '2021-08-20 04:49:01'),
(24, 33, 10, 3, '2021-08-20 06:59:21', '2021-08-20 06:59:21'),
(25, 34, 10, 3, '2021-08-20 07:09:09', '2021-08-20 07:09:09'),
(26, 35, 10, 3, '2021-08-20 07:13:28', '2021-08-20 07:13:28'),
(27, 35, 10, 2, '2021-08-21 01:48:10', '2021-08-21 01:48:10'),
(28, 35, 10, 2, '2021-08-21 01:51:08', '2021-08-21 01:51:08'),
(29, 36, 10, 3, '2021-08-23 19:35:38', '2021-08-23 19:35:38'),
(30, 37, 10, 3, '2021-08-23 19:46:12', '2021-08-23 19:46:12'),
(31, 38, 10, 3, '2021-08-23 19:48:05', '2021-08-23 19:48:05'),
(32, 39, 10, 3, '2021-08-23 19:49:03', '2021-08-23 19:49:03'),
(33, 40, 10, 3, '2021-08-23 19:50:35', '2021-08-23 19:50:35'),
(34, 41, 10, 3, '2021-08-24 00:58:10', '2021-08-24 00:58:10'),
(35, 42, 10, 3, '2021-08-24 02:14:39', '2021-08-24 02:14:39'),
(36, 43, 10, 3, '2021-08-25 02:43:19', '2021-08-25 02:43:19'),
(37, 44, 10, 3, '2021-08-26 01:46:52', '2021-08-26 01:46:52'),
(38, 45, 10, 3, '2021-08-26 02:57:27', '2021-08-26 02:57:27'),
(39, 46, 10, 3, '2021-08-26 07:04:34', '2021-08-26 07:04:34'),
(40, 47, 10, 3, '2021-08-26 07:08:46', '2021-08-26 07:08:46'),
(41, 48, 10, 3, '2021-08-26 07:15:12', '2021-08-26 07:15:12'),
(42, 49, 10, 3, '2021-08-27 02:54:33', '2021-08-27 02:54:33'),
(43, 50, 10, 3, '2021-08-27 06:58:57', '2021-08-27 06:58:57'),
(44, 51, 10, 3, '2021-08-27 07:05:17', '2021-08-27 07:05:17'),
(45, 52, 10, 3, '2021-08-27 07:11:02', '2021-08-27 07:11:02'),
(46, 53, 10, 3, '2021-08-28 00:38:25', '2021-08-28 00:38:25'),
(47, 54, 10, 3, '2021-08-30 00:59:23', '2021-08-30 00:59:23'),
(48, 55, 10, 3, '2021-08-30 01:04:13', '2021-08-30 01:04:13'),
(49, 56, 17, 3, '2021-08-30 01:09:04', '2021-08-30 01:09:04'),
(50, 57, 10, 3, '2021-08-30 01:12:11', '2021-08-30 01:12:11'),
(51, 58, 10, 3, '2021-08-30 01:21:45', '2021-08-30 01:21:45'),
(52, 59, 10, 3, '2021-08-30 01:24:09', '2021-08-30 01:24:09'),
(53, 60, 10, 3, '2021-08-30 01:38:37', '2021-08-30 01:38:37'),
(54, 61, 10, 3, '2021-08-30 02:05:53', '2021-08-30 02:05:53'),
(55, 62, 10, 3, '2021-08-30 03:37:33', '2021-08-30 03:37:33'),
(56, 63, 10, 3, '2021-08-30 03:47:32', '2021-08-30 03:47:32'),
(57, 65, 10, 3, '2021-08-30 04:21:02', '2021-08-30 04:21:02'),
(58, 66, 10, 3, '2021-08-30 04:42:21', '2021-08-30 04:42:21'),
(59, 67, 10, 3, '2021-08-30 04:44:19', '2021-08-30 04:44:19'),
(60, 68, 10, 3, '2021-08-30 04:54:22', '2021-08-30 04:54:22'),
(61, 69, 10, 3, '2021-08-30 04:54:48', '2021-08-30 04:54:48'),
(62, 70, 10, 3, '2021-08-30 05:03:46', '2021-08-30 05:03:46'),
(63, 71, 10, 3, '2021-08-30 05:06:35', '2021-08-30 05:06:35'),
(64, 72, 10, 3, '2021-08-30 06:02:49', '2021-08-30 06:02:49'),
(65, 73, 10, 3, '2021-08-30 06:05:45', '2021-08-30 06:05:45'),
(66, 74, 10, 3, '2021-08-30 06:15:47', '2021-08-30 06:15:47'),
(67, 75, 10, 3, '2021-08-30 06:17:52', '2021-08-30 06:17:52'),
(68, 76, 10, 3, '2021-08-30 06:19:51', '2021-08-30 06:19:51'),
(69, 77, 10, 3, '2021-08-30 06:20:25', '2021-08-30 06:20:25'),
(70, 78, 10, 3, '2021-08-30 06:22:20', '2021-08-30 06:22:20'),
(71, 79, 10, 3, '2021-08-30 06:29:10', '2021-08-30 06:29:10'),
(72, 80, 10, 3, '2021-08-30 06:40:48', '2021-08-30 06:40:48'),
(73, 81, 10, 3, '2021-08-30 06:43:15', '2021-08-30 06:43:15'),
(74, 82, 10, 3, '2021-08-30 06:46:59', '2021-08-30 06:46:59'),
(75, 83, 10, 3, '2021-08-30 06:55:51', '2021-08-30 06:55:51'),
(76, 84, 10, 3, '2021-08-30 07:05:40', '2021-08-30 07:05:40'),
(77, 85, 19, 3, '2021-08-30 07:42:53', '2021-08-30 07:42:53'),
(78, 86, 20, 3, '2021-08-30 08:05:13', '2021-08-30 08:05:13'),
(79, 87, 20, 3, '2021-08-30 08:09:01', '2021-08-30 08:09:01'),
(80, 88, 20, 3, '2021-08-30 08:09:54', '2021-08-30 08:09:54'),
(81, 89, 20, 3, '2021-08-30 08:12:33', '2021-08-30 08:12:33'),
(82, 90, 20, 3, '2021-08-30 08:14:02', '2021-08-30 08:14:02'),
(83, 91, 20, 3, '2021-08-30 08:14:18', '2021-08-30 08:14:18'),
(84, 92, 20, 3, '2021-08-30 08:23:24', '2021-08-30 08:23:24'),
(85, 93, 19, 3, '2021-08-31 00:48:20', '2021-08-31 00:48:20'),
(86, 94, 19, 3, '2021-08-31 02:43:50', '2021-08-31 02:43:50'),
(87, 95, 19, 3, '2021-08-31 04:57:04', '2021-08-31 04:57:04'),
(88, 95, 19, 3, '2021-08-31 05:07:01', '2021-08-31 05:07:01'),
(89, 96, 19, 3, '2021-08-31 06:30:38', '2021-08-31 06:30:38'),
(90, 97, 20, 3, '2021-08-31 23:34:08', '2021-08-31 23:34:08'),
(91, 98, 20, 3, '2021-08-31 23:44:19', '2021-08-31 23:44:19'),
(92, 99, 19, 3, '2021-08-31 23:50:15', '2021-08-31 23:50:15'),
(93, 100, 10, 3, '2021-08-31 23:52:54', '2021-08-31 23:52:54'),
(94, 101, 10, 3, '2021-09-02 07:23:18', '2021-09-02 07:23:18'),
(95, 102, 10, 3, '2021-09-02 07:24:56', '2021-09-02 07:24:56'),
(96, 103, 10, 3, '2021-09-02 07:28:09', '2021-09-02 07:28:09'),
(97, 104, 10, 3, '2021-09-02 07:30:08', '2021-09-02 07:30:08'),
(98, 105, 10, 3, '2021-09-02 07:31:23', '2021-09-02 07:31:23'),
(99, 106, 10, 3, '2021-09-02 08:37:37', '2021-09-02 08:37:37'),
(100, 107, 10, 3, '2021-09-02 23:38:53', '2021-09-02 23:38:53'),
(101, 108, 10, 3, '2021-09-03 02:28:52', '2021-09-03 02:28:52'),
(102, 109, 10, 3, '2021-09-03 02:38:28', '2021-09-03 02:38:28'),
(103, 110, 10, 3, '2021-09-03 02:54:35', '2021-09-03 02:54:35'),
(104, 111, 10, 3, '2021-09-03 03:00:57', '2021-09-03 03:00:57'),
(105, 112, 10, 3, '2021-09-03 03:52:54', '2021-09-03 03:52:54'),
(106, 113, 10, 3, '2021-09-03 03:53:10', '2021-09-03 03:53:10'),
(107, 114, 10, 3, '2021-09-03 03:54:38', '2021-09-03 03:54:38'),
(108, 115, 10, 3, '2021-09-03 03:55:55', '2021-09-03 03:55:55'),
(109, 116, 10, 3, '2021-09-03 03:57:21', '2021-09-03 03:57:21'),
(110, 117, 10, 3, '2021-09-03 03:58:16', '2021-09-03 03:58:16'),
(111, 118, 10, 3, '2021-09-03 04:05:46', '2021-09-03 04:05:46'),
(112, 119, 10, 3, '2021-09-03 23:46:37', '2021-09-03 23:46:37'),
(113, 120, 10, 3, '2021-09-03 23:55:43', '2021-09-03 23:55:43'),
(114, 121, 10, 3, '2021-09-04 00:02:24', '2021-09-04 00:02:24'),
(115, 122, 10, 3, '2021-09-04 00:04:26', '2021-09-04 00:04:26'),
(116, 123, 10, 3, '2021-09-04 01:03:39', '2021-09-04 01:03:39'),
(117, 124, 10, 3, '2021-09-04 01:41:49', '2021-09-04 01:41:49'),
(118, 125, 10, 3, '2021-09-04 01:43:53', '2021-09-04 01:43:53'),
(119, 126, 10, 3, '2021-09-04 01:46:18', '2021-09-04 01:46:18'),
(120, 127, 10, 3, '2021-09-04 01:48:11', '2021-09-04 01:48:11'),
(121, 128, 10, 3, '2021-09-04 01:52:25', '2021-09-04 01:52:25'),
(122, 129, 10, 3, '2021-09-04 01:53:12', '2021-09-04 01:53:12'),
(123, 130, 10, 3, '2021-09-04 01:57:56', '2021-09-04 01:57:56'),
(124, 131, 22, 3, '2021-09-04 02:01:17', '2021-09-04 02:01:17'),
(125, 132, 10, 3, '2021-09-04 02:09:17', '2021-09-04 02:09:17'),
(126, 133, 23, 3, '2021-09-04 02:11:04', '2021-09-04 02:11:04'),
(127, 134, 23, 3, '2021-09-04 02:13:00', '2021-09-04 02:13:00'),
(128, 132, 10, 3, '2021-09-04 02:14:36', '2021-09-04 02:14:36'),
(129, 135, 10, 3, '2021-09-07 01:04:56', '2021-09-07 01:04:56'),
(130, 136, 22, 3, '2021-09-07 01:08:46', '2021-09-07 01:08:46'),
(131, 137, 22, 3, '2021-09-07 01:10:19', '2021-09-07 01:10:19'),
(132, 138, 22, 3, '2021-09-07 01:11:25', '2021-09-07 01:11:25'),
(133, 139, 22, 3, '2021-09-07 01:12:24', '2021-09-07 01:12:24'),
(134, 140, 10, 3, '2021-09-07 03:09:00', '2021-09-07 03:09:00'),
(135, 141, 23, 3, '2021-09-07 03:52:02', '2021-09-07 03:52:02'),
(136, 142, 22, 3, '2021-09-08 05:47:22', '2021-09-08 05:47:22'),
(137, 142, 22, 3, '2021-09-08 05:48:50', '2021-09-08 05:48:50'),
(138, 144, 22, 3, '2021-09-08 06:01:00', '2021-09-08 06:01:00'),
(139, 145, 22, 3, '2021-09-08 06:01:49', '2021-09-08 06:01:49'),
(140, 146, 22, 3, '2021-09-08 06:02:21', '2021-09-08 06:02:21'),
(141, 147, 22, 3, '2021-09-08 06:03:58', '2021-09-08 06:03:58'),
(142, 148, 22, 3, '2021-09-08 06:04:35', '2021-09-08 06:04:35'),
(143, 149, 22, 3, '2021-09-08 06:05:16', '2021-09-08 06:05:16'),
(144, 150, 22, 3, '2021-09-08 06:06:25', '2021-09-08 06:06:25'),
(145, 151, 22, 3, '2021-09-08 06:08:07', '2021-09-08 06:08:07'),
(146, 152, 22, 3, '2021-09-08 06:10:54', '2021-09-08 06:10:54'),
(147, 153, 22, 3, '2021-09-08 06:11:46', '2021-09-08 06:11:46'),
(148, 154, 22, 3, '2021-09-08 06:43:31', '2021-09-08 06:43:31'),
(149, 155, 22, 3, '2021-09-08 06:47:30', '2021-09-08 06:47:30'),
(150, 156, 22, 3, '2021-09-08 07:37:16', '2021-09-08 07:37:16'),
(151, 157, 22, 3, '2021-09-08 07:40:29', '2021-09-08 07:40:29'),
(152, 157, 22, 3, '2021-09-08 07:46:32', '2021-09-08 07:46:32'),
(153, 159, 22, 3, '2021-09-08 07:59:07', '2021-09-08 07:59:07'),
(154, 156, 10, 3, '2021-09-10 07:58:47', '2021-09-10 07:58:47'),
(155, 161, 10, 3, '2021-09-10 08:00:09', '2021-09-10 08:00:09'),
(156, 162, 10, 3, '2021-09-10 08:20:46', '2021-09-10 08:20:46'),
(157, 163, 10, 3, '2021-09-10 09:08:19', '2021-09-10 09:08:19'),
(158, 164, 10, 3, '2021-09-10 09:18:08', '2021-09-10 09:18:08'),
(159, 165, 1, 3, '2021-09-11 07:19:11', '2021-09-11 07:19:11'),
(160, 166, 1, 3, '2021-09-11 07:23:21', '2021-09-11 07:23:21'),
(161, 167, 10, 3, '2021-09-11 07:27:59', '2021-09-11 07:27:59'),
(162, 168, 22, 3, '2021-09-11 08:19:58', '2021-09-11 08:19:58'),
(163, 169, 22, 3, '2021-09-11 08:26:55', '2021-09-11 08:26:55'),
(164, 170, 22, 3, '2021-09-11 08:27:55', '2021-09-11 08:27:55'),
(165, 171, 22, 3, '2021-09-11 08:28:32', '2021-09-11 08:28:32'),
(166, 172, 22, 3, '2021-09-11 08:29:37', '2021-09-11 08:29:37'),
(167, 173, 22, 3, '2021-09-11 08:30:27', '2021-09-11 08:30:27'),
(168, 174, 22, 3, '2021-09-11 08:31:19', '2021-09-11 08:31:19'),
(169, 175, 22, 3, '2021-09-11 08:39:29', '2021-09-11 08:39:29'),
(170, 176, 22, 3, '2021-09-11 08:40:47', '2021-09-11 08:40:47'),
(171, 177, 22, 3, '2021-09-11 08:42:18', '2021-09-11 08:42:18'),
(172, 178, 23, 3, '2021-09-11 08:51:50', '2021-09-11 08:51:50'),
(173, 179, 23, 3, '2021-09-11 08:57:26', '2021-09-11 08:57:26'),
(174, 180, 23, 3, '2021-09-11 08:59:19', '2021-09-11 08:59:19'),
(175, 181, 22, 3, '2021-09-11 09:01:56', '2021-09-11 09:01:56'),
(176, 182, 28, 3, '2021-09-11 09:09:54', '2021-09-11 09:09:54'),
(177, 183, 28, 3, '2021-09-11 09:11:03', '2021-09-11 09:11:03'),
(178, 184, 22, 3, '2021-09-13 10:28:32', '2021-09-13 10:28:32'),
(179, 185, 22, 3, '2021-09-13 10:29:25', '2021-09-13 10:29:25'),
(180, 186, 22, 3, '2021-09-13 10:30:42', '2021-09-13 10:30:42'),
(181, 187, 22, 3, '2021-09-13 10:31:33', '2021-09-13 10:31:33'),
(182, 188, 22, 3, '2021-09-13 10:32:00', '2021-09-13 10:32:00'),
(183, 189, 22, 3, '2021-09-13 10:38:09', '2021-09-13 10:38:09'),
(184, 190, 1, 3, '2021-09-13 10:42:17', '2021-09-13 10:42:17'),
(185, 191, 22, 3, '2021-09-13 10:47:01', '2021-09-13 10:47:01'),
(186, 192, 22, 3, '2021-09-13 10:47:35', '2021-09-13 10:47:35'),
(187, 193, 1, 3, '2021-09-14 10:10:30', '2021-09-14 10:10:30'),
(188, 193, 1, 2, '2021-09-14 11:00:15', '2021-09-14 11:00:15'),
(189, 194, 1, 3, '2021-09-15 09:52:41', '2021-09-15 09:52:41'),
(190, 195, 22, 3, '2021-09-21 03:52:36', '2021-09-21 03:52:36'),
(191, 196, 22, 3, '2021-09-21 03:54:22', '2021-09-21 03:54:22'),
(192, 197, 23, 3, '2021-09-21 03:56:32', '2021-09-21 03:56:32'),
(193, 198, 23, 3, '2021-09-21 04:18:56', '2021-09-21 04:18:56'),
(194, 199, 22, 3, '2021-09-22 13:45:34', '2021-09-22 13:45:34'),
(195, 200, 22, 3, '2021-09-23 03:07:36', '2021-09-23 03:07:36'),
(196, 201, 22, 3, '2021-09-23 06:16:30', '2021-09-23 06:16:30'),
(197, 202, 22, 3, '2021-09-23 07:24:58', '2021-09-23 07:24:58'),
(198, 200, 22, 3, '2021-09-24 08:52:28', '2021-09-24 08:52:28'),
(199, 201, 22, 3, '2021-09-24 12:58:41', '2021-09-24 12:58:41'),
(200, 203, 22, 3, '2021-09-24 13:27:25', '2021-09-24 13:27:25'),
(201, 204, 1, 3, '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(202, 204, 1, 2, '2021-10-01 04:12:09', '2021-10-01 04:12:09'),
(203, 205, 1, 3, '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(204, 205, 1, 2, '2021-10-01 04:17:57', '2021-10-01 04:17:57'),
(205, 205, 1, 3, '2021-10-01 13:05:46', '2021-10-01 13:05:46'),
(206, 206, 1, 3, '2021-10-06 07:38:42', '2021-10-06 07:38:42'),
(207, 207, 1, 3, '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(208, 208, 1, 3, '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(209, 209, 56, 3, '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(210, 210, 56, 3, '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(211, 211, 56, 3, '2021-10-18 12:40:32', '2021-10-18 12:40:32'),
(212, 212, 40, 3, '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(213, 213, 40, 3, '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(214, 214, 40, 3, '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(215, 215, 40, 3, '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(216, 216, 60, 3, '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(217, 217, 49, 3, '2021-10-25 09:43:59', '2021-10-25 09:43:59'),
(218, 218, 49, 3, '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(219, 219, 49, 3, '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(220, 220, 56, 3, '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(221, 221, 49, 3, '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(222, 222, 56, 3, '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(223, 223, 49, 3, '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(224, 224, 34, 3, '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(225, 225, 34, 3, '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(226, 226, 34, 3, '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(227, 227, 34, 3, '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(228, 228, 34, 3, '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(229, 229, 34, 3, '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(230, 230, 34, 3, '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(231, 231, 34, 3, '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(232, 232, 40, 3, '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(233, 233, 40, 3, '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(234, 234, 49, 3, '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(235, 235, 49, 3, '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(236, 238, 34, 3, '2021-10-27 11:38:58', '2021-10-27 11:38:58'),
(237, 239, 34, 3, '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(238, 240, 34, 3, '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(239, 241, 34, 3, '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(240, 242, 34, 3, '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(241, 243, 34, 3, '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(242, 244, 40, 3, '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(243, 245, 40, 3, '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(244, 246, 22, 3, '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(245, 254, 79, 3, '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(246, 255, 79, 3, '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(247, 256, 80, 3, '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(248, 257, 80, 3, '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(249, 258, 34, 3, '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(250, 259, 34, 3, '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(251, 260, 34, 3, '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(252, 262, 48, 3, '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(253, 263, 1, 3, '2021-11-15 07:07:17', '2021-11-15 07:07:17'),
(254, 264, 1, 3, '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(255, 265, 22, 3, '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(256, 266, 22, 3, '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(257, 267, 86, 3, '2022-01-12 14:56:21', '2022-01-12 14:56:21'),
(258, 267, 86, 3, '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(259, 267, 86, 3, '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(260, 270, 89, 3, '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(261, 271, 89, 3, '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(262, 267, 96, 3, '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(263, 273, 86, 3, '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(264, 267, 86, 3, '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(265, 275, 86, 3, '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(266, 275, 86, 3, '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(267, 271, 86, 3, '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(268, 275, 96, 3, '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(269, 267, 86, 3, '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(270, 280, 86, 3, '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(271, 280, 86, 3, '2022-01-15 15:47:10', '2022-01-15 15:47:10'),
(272, 280, 86, 3, '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(273, 280, 86, 3, '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(274, 284, 86, 3, '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(275, 285, 86, 3, '2022-01-17 09:00:44', '2022-01-17 09:00:44'),
(276, 286, 86, 3, '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(277, 287, 86, 3, '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(278, 288, 86, 3, '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(279, 289, 86, 3, '2022-01-17 09:05:26', '2022-01-17 09:05:26'),
(280, 290, 86, 3, '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(281, 291, 86, 3, '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(282, 292, 86, 3, '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(283, 293, 86, 3, '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(284, 294, 86, 3, '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(285, 295, 86, 3, '2022-01-17 09:25:14', '2022-01-17 09:25:14'),
(286, 296, 86, 3, '2022-01-17 10:10:50', '2022-01-17 10:10:50'),
(287, 297, 86, 3, '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(288, 298, 89, 3, '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(289, 299, 86, 3, '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(290, 300, 94, 3, '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(291, 301, 94, 3, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(292, 302, 94, 3, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(293, 303, 94, 3, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(294, 304, 86, 3, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(295, 305, 86, 3, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(296, 306, 86, 3, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(297, 307, 86, 3, '2022-01-22 09:02:25', '2022-01-22 09:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`id`, `message`, `type`, `icon_class`, `created_at`, `updated_at`) VALUES
(1, 'A new user is registered', 'registration', 'fa fa-user', '2016-12-13 03:19:14', '2016-12-13 03:19:14'),
(2, 'You have a new reply on this ticket', 'reply', 'fa fa-envelope', '2016-12-13 03:19:14', '2016-12-13 03:19:14'),
(3, 'A new ticket has been created', 'new_ticket', 'fa fa-envelope', '2016-12-13 03:19:14', '2016-12-13 03:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `head` int(10) UNSIGNED DEFAULT NULL,
  `internal_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `name`, `phone`, `website`, `address`, `head`, `internal_notes`, `created_at`, `updated_at`) VALUES
(1, 'Bliss Medical centre', '1234567890', '', 'Nairobi East', NULL, '', NULL, NULL),
(2, 'Bliss Medical centre', '1234567890', '', 'Nairobi West', NULL, '', NULL, NULL),
(3, 'Bliss Medical centre', '1234567890', '', 'Coast', NULL, '', NULL, NULL),
(4, 'Bliss Medical centre', '1234567890', '', 'Mount Kenya', NULL, '', NULL, NULL),
(5, 'Bliss Medical centre', '1234567890', '', 'Rift Valley', NULL, '', NULL, NULL),
(6, 'Bliss Medical centre', '1234567890', '', 'Nyanza', NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization1`
--

CREATE TABLE `organization1` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `head` int(10) UNSIGNED DEFAULT NULL,
  `internal_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organization1`
--

INSERT INTO `organization1` (`id`, `name`, `phone`, `website`, `address`, `head`, `internal_notes`, `created_at`, `updated_at`) VALUES
(1, 'LIfeCare  ', '111111152255', 'https://www.maxhealthcare.in', 'Lifecare Bungoma', NULL, '', '2021-08-09 05:22:23', '2021-08-11 04:05:32'),
(6, 'LIfeCare ', '', '', 'Lifecare Migori', NULL, '', '2021-08-14 11:09:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_services`
--

CREATE TABLE `queue_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queue_services`
--

INSERT INTO `queue_services` (`id`, `name`, `short_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sync', 'sync', 1, '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(2, 'Database', 'database', 0, '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(3, 'Beanstalkd', 'beanstalkd', 0, '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(4, 'SQS', 'sqs', 0, '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(5, 'Iron', 'iron', 0, '2016-12-13 03:19:09', '2016-12-13 03:19:09'),
(6, 'Redis', 'redis', 0, '2016-12-13 03:19:09', '2016-12-13 03:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL,
  `allow_modification` int(11) NOT NULL,
  `rating_scale` int(11) NOT NULL,
  `rating_area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `restrict` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `name`, `display_order`, `allow_modification`, `rating_scale`, `rating_area`, `restrict`, `created_at`, `updated_at`) VALUES
(1, 'OverAll Satisfaction', 1, 1, 5, 'Helpdesk Area', '', '2016-12-13 03:19:53', '2016-12-13 03:19:53'),
(2, 'Reply Rating', 1, 1, 5, 'Comment Area', '', '2016-12-13 03:19:53', '2016-12-13 03:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `rating_ref`
--

CREATE TABLE `rating_ref` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `rating_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rating_ref`
--

INSERT INTO `rating_ref` (`id`, `rating_id`, `ticket_id`, `thread_id`, `rating_value`, `created_at`, `updated_at`) VALUES
(1, 1, 92, 0, 5, '2021-08-31 05:59:16', '2021-08-31 05:59:18'),
(2, 1, 201, 0, 4, '2021-09-23 04:18:29', '2021-09-23 04:18:29'),
(3, 2, 232, 340, 1, '2021-10-27 04:15:40', '2021-10-27 04:15:42'),
(4, 2, 297, 423, 3, '2022-01-17 09:51:48', '2022-01-17 09:51:48'),
(5, 2, 295, 421, 4, '2022-01-17 09:52:37', '2022-01-17 09:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `reported_table`
--

CREATE TABLE `reported_table` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reported_table`
--

INSERT INTO `reported_table` (`id`, `name`) VALUES
(1, 'Email'),
(2, 'Facility Patient Feedback'),
(3, 'SMS Survey'),
(4, 'Facebook'),
(5, 'Twitter'),
(6, 'Instagram'),
(7, 'Linkedin'),
(8, 'WhatsApp'),
(11, 'Outbound CSAT CC'),
(12, 'Inbound CC');

-- --------------------------------------------------------

--
-- Table structure for table `search_demo`
--

CREATE TABLE `search_demo` (
  `id` int(10) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `member_no` int(10) NOT NULL,
  `mobile_no` varchar(12) NOT NULL,
  `member_type` varchar(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `v_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scheme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `search_demo`
--

INSERT INTO `search_demo` (`id`, `client_name`, `member_no`, `mobile_no`, `member_type`, `location`, `v_date`, `scheme`) VALUES
(1, 'vikash', 1001, '548744086742', '1', 'Banguma', '2021-08-19 16:37:25', 'premium'),
(2, 'vishnu', 1002, '8178568977', '2', 'Banguma', '2021-08-03 16:40:42', 'premium');

-- --------------------------------------------------------

--
-- Table structure for table `sent_email_level1`
--

CREATE TABLE `sent_email_level1` (
  `id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `esclated1_email_user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sent_email_level1`
--

INSERT INTO `sent_email_level1` (`id`, `ticket_id`, `esclated1_email_user_id`, `created_at`, `updated_at`) VALUES
(262, 271, 'ms.nyanza@blisshealthcare.co.ke', '2022-01-13 11:46:33', NULL),
(263, 271, 'Stephen.Mwale@blisshealthcare.co.ke', '2022-01-13 11:46:33', NULL),
(264, 271, 'Michael.Gone@blisshealthcare.coke', '2022-01-13 11:46:34', NULL),
(265, 275, 'ms.coast@blisshealthcare.co.ke', '2022-01-14 12:01:51', NULL),
(266, 275, 'harrison.vigedi@blisshealthcare.co.ke', '2022-01-14 12:01:51', NULL),
(267, 275, 'michael.Gone@blisshealthcare.coke', '2022-01-14 12:01:52', NULL),
(268, 267, 'ms.central@blisshealthcare.co.ke', '2022-01-14 13:31:42', NULL),
(269, 267, 'harrison.vigedi@blisshealthcare.co.ke', '2022-01-14 13:31:42', NULL),
(270, 267, 'michael.Gone@blisshealthcare.coke', '2022-01-14 13:31:42', NULL),
(271, 280, 'ms.central@blisshealthcare.co.ke', '2022-01-15 15:41:48', NULL),
(272, 280, 'batul.fankupi@blisshealthcare.co.ke', '2022-01-15 15:41:48', NULL),
(273, 280, 'Michael.Gone@blisshealthcare.coke', '2022-01-15 15:41:48', NULL),
(274, 280, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-15 15:47:10', NULL),
(275, 280, 'harrison.vigedi@blisshealthcare.co.ke', '2022-01-15 15:47:10', NULL),
(276, 280, 'michael.Gone@blisshealthcare.coke', '2022-01-15 15:47:10', NULL),
(277, 280, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-15 17:32:43', NULL),
(278, 280, 'sylvia.sote@blisshealthcare.co.ke', '2022-01-15 17:32:44', NULL),
(279, 280, 'Michael.Gone@blisshealthcare.coke', '2022-01-15 17:32:44', NULL),
(280, 280, 'ms.central@blisshealthcare.co.ke', '2022-01-15 17:39:42', NULL),
(281, 280, 'harrison.vigedi@blisshealthcare.co.ke', '2022-01-15 17:39:42', NULL),
(282, 280, 'michael.Gone@blisshealthcare.coke', '2022-01-15 17:39:42', NULL),
(283, 284, 'ms.central@blisshealthcare.co.ke', '2022-01-15 17:50:23', NULL),
(284, 284, 'sylvia.sote@blisshealthcare.co.ke', '2022-01-15 17:50:23', NULL),
(285, 284, 'Michael.Gone@blisshealthcare.coke', '2022-01-15 17:50:23', NULL),
(286, 285, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:00:44', NULL),
(287, 285, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:00:44', NULL),
(288, 285, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:00:44', NULL),
(289, 286, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:03:21', NULL),
(290, 286, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:03:21', NULL),
(291, 286, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:03:21', NULL),
(292, 287, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:04:07', NULL),
(293, 287, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:04:07', NULL),
(294, 287, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:04:08', NULL),
(295, 288, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:04:52', NULL),
(296, 288, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:04:52', NULL),
(297, 288, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:04:52', NULL),
(298, 289, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:05:26', NULL),
(299, 289, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:05:26', NULL),
(300, 289, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:05:26', NULL),
(301, 290, 'ms.nairobinorth@blisshealthcare.co.ke', '2022-01-17 09:06:18', NULL),
(302, 290, 'ms.nairobinorth@blisshealthcare.co.ke', '2022-01-17 09:06:18', NULL),
(303, 290, 'ms.nairobinorth@blisshealthcare.co.ke', '2022-01-17 09:06:18', NULL),
(304, 291, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:07:09', NULL),
(305, 291, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:07:09', NULL),
(306, 291, 'ms.riftvalley@blisshealthcare.co.ke', '2022-01-17 09:07:09', NULL),
(307, 292, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:07:40', NULL),
(308, 292, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:07:40', NULL),
(309, 292, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:07:40', NULL),
(310, 293, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 09:08:03', NULL),
(311, 293, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 09:08:03', NULL),
(312, 293, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 09:08:03', NULL),
(313, 294, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:08:38', NULL),
(314, 294, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:08:38', NULL),
(315, 294, 'ms.central@blisshealthcare.co.ke', '2022-01-17 09:08:38', NULL),
(316, 295, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:25:14', NULL),
(317, 295, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:25:14', NULL),
(318, 295, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 09:25:14', NULL),
(319, 296, 'ms.central@blisshealthcare.co.ke', '2022-01-17 10:10:50', NULL),
(320, 296, 'ms.central@blisshealthcare.co.ke', '2022-01-17 10:10:50', NULL),
(321, 296, 'ms.central@blisshealthcare.co.ke', '2022-01-17 10:10:51', NULL),
(322, 297, 'support@makl.co.ke', '2022-01-17 11:16:42', NULL),
(323, 297, 'support@makl.co.ke', '2022-01-17 11:16:42', NULL),
(324, 297, 'support@makl.co.ke', '2022-01-17 11:16:42', NULL),
(325, 298, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 12:18:29', NULL),
(326, 298, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 12:18:30', NULL),
(327, 298, 'ms.coast@blisshealthcare.co.ke', '2022-01-17 12:18:30', NULL),
(328, 299, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 14:32:23', NULL),
(329, 299, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 14:32:23', NULL),
(330, 299, 'ms.nairobisouth@blisshealthcare.co.ke', '2022-01-17 14:32:23', NULL),
(331, 300, 'hr2@blisshealthcare.co.ke', '2022-01-18 08:23:54', NULL),
(332, 300, 'hr2@blisshealthcare.co.ke', '2022-01-18 08:23:54', NULL),
(333, 300, 'hr2@blisshealthcare.co.ke', '2022-01-18 08:23:54', NULL),
(334, 301, 'support@makl.co.ke', '2022-01-19 09:48:13', NULL),
(335, 301, 'support@makl.co.ke', '2022-01-19 09:48:13', NULL),
(336, 301, 'support@makl.co.ke', '2022-01-19 09:48:14', NULL),
(337, 302, 'ms.central@blisshealthcare.co.ke', '2022-01-19 09:50:10', NULL),
(338, 302, 'ms.central@blisshealthcare.co.ke', '2022-01-19 09:50:10', NULL),
(339, 302, 'ms.central@blisshealthcare.co.ke', '2022-01-19 09:50:10', NULL),
(340, 303, 'ms.coast@blisshealthcare.co.ke', '2022-01-19 09:57:26', NULL),
(341, 303, 'ms.coast@blisshealthcare.co.ke', '2022-01-19 09:57:26', NULL),
(342, 303, 'ms.coast@blisshealthcare.co.ke', '2022-01-19 09:57:26', NULL),
(343, 304, 'medical@makl.co.ke', '2022-01-21 18:54:58', NULL),
(344, 304, 'medical@makl.co.ke', '2022-01-21 18:54:58', NULL),
(345, 304, 'medical@makl.co.ke', '2022-01-21 18:54:58', NULL),
(346, 305, 'medical@makl.co.ke', '2022-01-21 19:09:55', NULL),
(347, 305, 'medical@makl.co.ke', '2022-01-21 19:09:55', NULL),
(348, 305, 'medical@makl.co.ke', '2022-01-21 19:09:55', NULL),
(349, 306, 'medical@makl.co.ke', '2022-01-22 06:18:03', NULL),
(350, 306, 'medical@makl.co.ke', '2022-01-22 06:18:03', NULL),
(351, 306, 'medical@makl.co.ke', '2022-01-22 06:18:03', NULL),
(352, 307, 'support@makl.co.ke', '2022-01-22 09:02:25', NULL),
(353, 307, 'support@makl.co.ke', '2022-01-22 09:02:25', NULL),
(354, 307, 'support@makl.co.ke', '2022-01-22 09:02:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `created_at`, `status`, `updated_at`, `deleted_at`) VALUES
(1, 'OPTICAL', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'PHARMACY', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'RADIOLOGY', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'LABORATORY', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'DENTAL', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'MEDICAL', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'PHYSIOTHERAPY', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'TELEMEDICINE', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'ACCOUNTS', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'HR', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'CUSTOMER EXPERIENCE ISSUES', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'CONTACT CENTRE', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `services1`
--

CREATE TABLE `services1` (
  `id` int(10) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services1`
--

INSERT INTO `services1` (`id`, `service_name`, `created_at`, `status`, `updated_at`, `deleted_at`) VALUES
(1, 'OPTICAL', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(2, 'PHARMACY', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(3, 'RADIOLOGY', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(4, 'LABORATORY', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(5, 'MEDICAL', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(6, 'ACCOUNTS', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(7, 'HR', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(8, 'PATIENT EXPERIENCE ISSUES', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(9, 'FACILITY ONE-STOP ISSUES', '2021-08-12 09:30:43', 0, '2021-08-12 11:28:16', NULL),
(10, 'DENTAL', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(11, 'PHYSIOTHERAPY', '2021-08-12 09:30:43', 0, '2021-08-12 11:28:16', NULL),
(12, 'ETHICAL', '2021-08-12 09:30:43', 1, '2021-08-12 11:28:16', NULL),
(13, 'TELEMEDICINE', '2021-08-12 09:30:43', 0, '2021-08-12 11:28:16', NULL),
(15, 'TEST', '2021-08-12 05:58:30', 0, '2021-08-12 05:58:30', NULL),
(17, 'ADMISSION', '2021-08-21 07:03:07', 1, '2021-08-21 07:03:07', NULL),
(18, 'CATERING', '2021-08-23 00:06:14', 1, '2021-08-23 00:06:14', NULL),
(19, 'DIALYSIS', '2021-08-23 00:37:21', 1, '2021-08-23 00:37:21', NULL),
(20, 'DISCHARGE', '2021-08-23 06:02:38', 1, '2021-08-23 06:02:38', NULL),
(21, 'NURSING', '2021-08-23 07:15:08', 1, '2021-08-23 07:15:08', NULL),
(22, 'HOUSEKEEPING', '2021-08-23 07:57:20', 1, '2021-08-23 07:57:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services_1`
--

CREATE TABLE `services_1` (
  `COL 1` varchar(2) DEFAULT NULL,
  `COL 2` varchar(26) DEFAULT NULL,
  `COL 3` varchar(6) DEFAULT NULL,
  `COL 4` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_1`
--

INSERT INTO `services_1` (`COL 1`, `COL 2`, `COL 3`, `COL 4`) VALUES
('id', 'service_name', 'status', ''),
('1', 'OPTICAL', '1', ''),
('2', 'PHARMACY', '1', ''),
('3', 'RADIOLOGY', '1', ''),
('4', 'LABORATORY', '1', ''),
('5', 'DENTAL', '1', ''),
('6', 'MEDICAL', '1', ''),
('7', 'PHYSIOTHERAPY', '1', ''),
('8', 'TELEMEDICINE', '1', ''),
('9', 'ACCOUNTS', '1', ''),
('10', 'HR', '1', ''),
('11', 'CUSTOMER EXPERIENCE ISSUES', '1', ''),
('12', 'CALL CENTRE', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_issue`
--

CREATE TABLE `service_issue` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_issue_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_issue`
--

INSERT INTO `service_issue` (`id`, `service_id`, `service_issue_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Delayed spectacles', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'Wrong Lenses', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'No frames', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'No spectacle case', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'No optical service', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'Quality of frames', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'No cases', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'Equipment/ Machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, 'Lack of drugs', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 2, 'Incomplete dose', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 2, 'Quality of drugs', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 2, 'Issuance of wrong drugs', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 3, 'Equipment/ Machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 3, 'No Radiology Services', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 3, 'image/film not given', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 3, 'Delay in service delivery', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 4, 'Delayed Results', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 4, 'Lack of Specimen Holder', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 4, 'Wrong Lab Results', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 5, 'Delayed Appointment', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 5, 'Equipment/ Machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 5, 'No Dental Services', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 6, 'Drug Reaction', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 6, 'Wrong Diagnosis', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 6, 'Treatment Errors', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 6, 'Delayed Doctor Appointment', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 6, 'No improvement on treatment', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 6, 'Poor Service', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 7, 'Equipment/ Machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 7, 'Staff incompetence', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 7, 'Delayed Appointment', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 7, 'No Physiotherapy Services', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 8, 'Package inquiry', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 8, 'Package Complaints', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 8, 'CDM', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 9, 'Reimbursements ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 9, 'No receipt for payment', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 9, 'Payment made to Staff', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 9, 'Abnormal Bills', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 10, 'Staff Indiscipline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 10, 'Bad Attitude by Staff', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 10, 'Staff Grooming', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 11, 'Bad Attitude by Staff', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 11, 'Uniform', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 11, 'Facility Hygiene and Tidiness', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 11, 'Facility Maintenance', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 11, 'Follow up on pre-auth', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 12, 'Ambulance', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 12, 'Billing-Last-Expense', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 12, 'Billing-Group-Life-Cover', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 12, 'Billing-Medical-Bills', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 12, 'Billing-Member-Limits', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 12, 'Billing-Co-pay', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 12, 'Billing-Smart-Card-holder', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 12, 'Billing-Scheme-Benefits', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 12, 'Eligibility', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 12, 'Last Expense', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 12, 'Missing Button-Preauth Button', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 12, 'MVC', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 12, 'One Time Pin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 12, 'Preauth approval', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `service_issue1`
--

CREATE TABLE `service_issue1` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_issue_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_issue1`
--

INSERT INTO `service_issue1` (`id`, `service_id`, `service_issue_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Delayed spectacles\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 1, 'Wrong Lenses', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, 1, 'No frames\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, 1, 'No spectacle case\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 1, 'No optical service\r\n\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 1, 'Quality of frames\r\n\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(7, 1, 'Equipment/ Machine\r\n\r\n\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(8, 2, 'Lack of drugs', '2021-08-12 10:04:30', '2021-08-12 10:04:30', NULL),
(9, 2, 'Incomplete dose', '2021-08-12 10:04:30', '2021-08-12 10:04:30', NULL),
(10, 2, 'Quality of drugs', '2021-08-12 10:04:30', '2021-08-12 10:04:30', NULL),
(11, 2, 'Wrong Prescription', '2021-08-12 10:04:30', '2021-08-12 10:04:30', NULL),
(12, 3, 'Equipment/ Machine', '2021-08-12 10:07:16', '2021-08-12 10:07:16', NULL),
(13, 3, 'No Radiology Services', '2021-08-12 10:07:16', '2021-08-12 10:07:16', NULL),
(14, 3, 'image/film not given', '2021-08-12 10:07:16', '2021-08-12 10:07:16', NULL),
(15, 3, 'Delays', '2021-08-12 10:07:16', '2021-08-12 10:07:16', NULL),
(16, 4, 'Delayed Results', '2021-08-12 10:09:24', '2021-08-12 10:09:24', NULL),
(17, 4, 'Lack of Specimen Holder\r\n', '2021-08-12 10:09:24', '2021-08-12 10:09:24', NULL),
(18, 4, 'Wrong Lab Results', '2021-08-12 10:09:24', '2021-08-12 10:09:24', NULL),
(19, 5, 'Drug Reaction', '2021-08-12 10:15:46', '2021-08-12 10:15:46', NULL),
(20, 5, 'Wrong Diagnosis', '2021-08-12 10:15:46', '2021-08-12 10:15:46', NULL),
(21, 5, 'Treatment Errors', '2021-08-12 10:15:46', '2021-08-12 10:15:46', NULL),
(22, 5, 'Delayed Doctor Appointment', '2021-08-12 10:15:46', '2021-08-12 10:15:46', NULL),
(23, 5, 'No improvement on treatment', '2021-08-12 10:15:46', '2021-08-12 10:15:46', NULL),
(24, 5, 'Poor Service', '2021-08-12 10:17:03', '2021-08-12 10:17:03', NULL),
(25, 6, 'Reimbursements', '2021-08-12 10:19:18', '2021-08-12 10:19:18', NULL),
(26, 6, 'No receipt for payment', '2021-08-12 10:19:18', '2021-08-12 10:19:18', NULL),
(27, 6, 'Payment made to Staff', '2021-08-12 10:19:18', '2021-08-12 10:19:18', NULL),
(28, 6, 'Abnormal Bills', '2021-08-12 10:19:18', '2021-08-12 10:19:18', NULL),
(29, 6, 'High Average Cost', '2021-08-12 10:19:18', '2021-08-12 10:19:18', NULL),
(30, 7, 'Staff Indiscipline', '2021-08-12 10:20:31', '2021-08-12 10:20:31', NULL),
(31, 7, 'Staff Grooming', '2021-08-12 10:20:31', '2021-08-12 10:20:31', NULL),
(32, 7, 'Bad Attitude by Staff', '2021-08-12 10:20:31', '2021-08-12 10:20:31', NULL),
(33, 8, 'Bad Attitude  by Staff', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(34, 8, 'Uniform', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(35, 8, 'Facility Hygiene and Tidiness', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(36, 8, 'Facility Maintainance', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(37, 8, 'Long Stay of Patients', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(38, 8, 'Follow up on pre-auth', '2021-08-12 10:23:15', '2021-08-12 10:23:15', NULL),
(45, 9, 'Available Services', '2021-08-12 10:27:02', '2021-08-12 10:27:02', NULL),
(47, 9, 'Appointment Booking', '2021-08-12 10:27:02', '2021-08-12 10:27:02', NULL),
(48, 9, 'Scheme rules inquiry', '2021-08-12 10:27:02', '2021-08-12 10:27:02', NULL),
(49, 9, 'Available balance on smart card', '2021-08-12 10:27:02', '2021-08-12 10:27:02', NULL),
(50, 9, 'Operational Hours', '2021-08-12 10:28:37', '2021-08-12 10:28:37', NULL),
(52, 10, 'No Dental Services', '2021-08-12 10:28:37', '2021-08-12 10:28:37', NULL),
(53, 10, 'Delayed Appointment', '2021-08-12 10:29:46', '2021-08-12 10:29:46', NULL),
(55, 11, 'Delayed Appointment\n', '2021-08-12 10:29:46', '2021-08-12 10:29:46', NULL),
(56, 10, 'Equipment/ Machine', '2021-08-12 10:41:21', '2021-08-12 10:41:21', NULL),
(57, 11, 'Equipment/ Machine', '2021-08-12 10:45:39', '2021-08-12 10:45:39', NULL),
(58, 11, 'No Dialysis services\r\n', '2021-08-12 10:45:39', '2021-08-12 10:45:39', NULL),
(59, 12, 'Medical Negligence', '2021-08-12 10:47:45', '2021-08-12 10:47:45', NULL),
(60, 12, 'Gross Misconduct', '2021-08-12 10:47:45', '2021-08-12 10:47:45', NULL),
(61, 12, 'Delays in service delivery', '2021-08-12 10:47:45', '2021-08-12 10:47:45', NULL),
(62, 12, 'Staff incompetence', '2021-08-12 10:47:45', '2021-08-12 10:47:45', NULL),
(63, 13, 'Equipment/ Machine', '2021-08-12 10:49:47', '2021-08-12 10:49:47', NULL),
(64, 13, 'Staff incompetence\r\n', '2021-08-12 10:49:47', '2021-08-12 10:49:47', NULL),
(65, 13, 'Delayed Appointment', '2021-08-12 10:49:47', '2021-08-12 10:49:47', NULL),
(66, 13, 'No Physiotherapy Services', '2021-08-12 10:49:47', '2021-08-12 10:49:47', NULL),
(82, 15, 'Test1', '2021-08-12 05:58:46', '2021-08-12 05:58:46', NULL),
(83, 15, 'Test2', '2021-08-12 05:58:59', '2021-08-12 05:58:59', NULL),
(84, 15, 'Test3', '2021-08-12 06:08:36', '2021-08-12 06:08:36', NULL),
(85, 17, 'Delayed Admission', '2021-08-21 07:03:36', '2021-08-21 07:03:36', NULL),
(86, 17, 'Lack Of Beds', '2021-08-21 07:04:07', '2021-08-21 07:04:07', NULL),
(87, 18, 'Inadequate Food', '2021-08-23 00:06:51', '2021-08-23 00:06:51', NULL),
(88, 18, 'Lack Of Food', '2021-08-23 00:07:08', '2021-08-23 00:07:08', NULL),
(89, 18, 'Uncooked Food', '2021-08-23 00:07:25', '2021-08-23 00:07:25', NULL),
(90, 18, 'Food Hygiene', '2021-08-23 00:07:38', '2021-08-23 00:07:38', NULL),
(91, 19, 'Delayed Appointment', '2021-08-23 00:37:48', '2021-08-23 00:37:48', NULL),
(92, 19, 'Equipment/ Machine', '2021-08-23 00:45:22', '2021-08-23 00:45:22', NULL),
(93, 19, 'No Dialysis Services', '2021-08-23 00:47:13', '2021-08-23 00:47:13', NULL),
(94, 20, 'Delayed Discharge', '2021-08-23 06:03:03', '2021-08-23 06:03:03', NULL),
(95, 20, 'Lack Of Discharge Drugs', '2021-08-23 06:03:27', '2021-08-23 06:03:27', NULL),
(96, 20, 'Lack Of Discharge Summary', '2021-08-23 06:03:52', '2021-08-23 06:03:52', NULL),
(97, 21, 'Bad Attitude By Nurses', '2021-08-23 07:15:45', '2021-08-23 07:15:45', NULL),
(98, 21, 'Noisy Nursing Station', '2021-08-23 07:16:04', '2021-08-23 07:16:04', NULL),
(99, 21, 'Delays In Service Delivery', '2021-08-23 07:16:25', '2021-08-23 07:16:25', NULL),
(100, 21, 'Staff Incompetence', '2021-08-23 07:16:39', '2021-08-23 07:16:39', NULL),
(101, 22, 'Dirty Rooms', '2021-08-23 07:57:56', '2021-08-23 07:57:56', NULL),
(102, 22, 'Laundry', '2021-08-23 07:58:13', '2021-08-23 07:58:13', NULL),
(103, 22, 'Patient Gowns', '2021-08-23 07:58:32', '2021-08-23 07:58:32', NULL),
(104, 22, 'Hospital Linen', '2021-08-23 07:58:49', '2021-08-23 07:58:49', NULL),
(105, 17, 'Poor Communication', '2021-09-15 09:35:47', '2021-09-15 09:35:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_issue_1`
--

CREATE TABLE `service_issue_1` (
  `COL 1` varchar(2) DEFAULT NULL,
  `COL 2` varchar(10) DEFAULT NULL,
  `COL 3` varchar(29) DEFAULT NULL,
  `COL 4` varchar(10) DEFAULT NULL,
  `COL 5` varchar(10) DEFAULT NULL,
  `COL 6` varchar(10) DEFAULT NULL,
  `COL 7` varchar(10) DEFAULT NULL,
  `COL 8` varchar(10) DEFAULT NULL,
  `COL 9` varchar(10) DEFAULT NULL,
  `COL 10` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_issue_1`
--

INSERT INTO `service_issue_1` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`) VALUES
('id', 'service_id', 'service_issue_name', 'created_at', 'updated_at', 'deleted_at', '', '', '', ''),
('1', '1', 'Delayed spectacles', '', '', 'null', '', '', '', ''),
('1', '2', 'Wrong Lenses', '', '', 'null', '', '', '', ''),
('1', '3', 'No frames', '', '', 'null', '', '', '', ''),
('1', '4', 'No spectacle case', '', '', 'null', '', '', '', ''),
('1', '5', 'No optical service', '', '', 'null', '', '', '', ''),
('1', '6', 'Quality of frames', '', '', 'null', '', '', '', ''),
('1', '7', 'No cases', '', '', 'null', '', '', '', ''),
('1', '8', 'Equipment/ Machine', '', '', 'null', '', '', '', ''),
('2', '9', 'Lack of drugs', '', '', 'null', '', '', '', ''),
('2', '10', 'Incomplete dose', '', '', 'null', '', '', '', ''),
('2', '11', 'Quality of drugs', '', '', 'null', '', '', '', ''),
('2', '12', 'Issuance of wrong drugs', '', '', 'null', '', '', '', ''),
('3', '13', 'Equipment/ Machine', '', '', 'null', '', '', '', ''),
('3', '14', 'No Radiology Services', '', '', 'null', '', '', '', ''),
('3', '15', 'image/film not given', '', '', 'null', '', '', '', ''),
('3', '16', 'Delay in service delivery', '', '', 'null', '', '', '', ''),
('4', '17', 'Delayed Results', '', '', 'null', '', '', '', ''),
('4', '18', 'Lack of Specimen Holder', '', '', 'null', '', '', '', ''),
('4', '19', 'Wrong Lab Results', '', '', 'null', '', '', '', ''),
('5', '20', 'Delayed Appointment', '', '', 'null', '', '', '', ''),
('5', '21', 'Equipment/ Machine', '', '', 'null', '', '', '', ''),
('5', '22', 'No Dental Services', '', '', 'null', '', '', '', ''),
('6', '23', 'Drug Reaction', '', '', 'null', '', '', '', ''),
('6', '24', 'Wrong Diagnosis', '', '', 'null', '', '', '', ''),
('6', '25', 'Treatment Errors', '', '', 'null', '', '', '', ''),
('6', '26', 'Delayed Doctor Appointment', '', '', 'null', '', '', '', ''),
('6', '27', 'No improvement on treatment', '', '', 'null', '', '', '', ''),
('6', '28', 'Poor Service', '', '', 'null', '', '', '', ''),
('7', '29', 'Equipment/ Machine', '', '', 'null', '', '', '', ''),
('7', '30', 'Staff incompetence', '', '', 'null', '', '', '', ''),
('7', '31', 'Delayed Appointment', '', '', 'null', '', '', '', ''),
('7', '32', 'No Physiotherapy Services', '', '', 'null', '', '', '', ''),
('8', '33', 'Package inquiry', '', '', 'null', '', '', '', ''),
('8', '34', 'Package Complaints', '', '', 'null', '', '', '', ''),
('8', '35', 'CDM', '', '', 'null', '', '', '', ''),
('9', '36', 'Reimbursements ', '', '', 'null', '', '', '', ''),
('9', '37', 'No receipt for payment', '', '', 'null', '', '', '', ''),
('9', '38', 'Payment made to Staff', '', '', 'null', '', '', '', ''),
('9', '39', 'Abnormal Bills', '', '', 'null', '', '', '', ''),
('10', '40', 'Staff Indiscipline', '', '', 'null', '', '', '', ''),
('10', '41', 'Bad Attitude by Staff', '', '', 'null', '', '', '', ''),
('10', '42', 'Staff Grooming', '', '', 'null', '', '', '', ''),
('11', '43', 'Bad Attitude by Staff', '', '', 'null', '', '', '', ''),
('11', '44', 'Uniform', '', '', 'null', '', '', '', ''),
('11', '45', 'Facility Hygiene and Tidiness', '', '', 'null', '', '', '', ''),
('11', '46', 'Facility Maintainance', '', '', 'null', '', '', '', ''),
('11', '47', 'Follow up on pre-auth', '', '', 'null', '', '', '', ''),
('12', '48', 'Ambulance', '', '', 'null', '', '', '', ''),
('12', '49', 'Billing-Last-Expense', '', '', 'null', '', '', '', ''),
('12', '50', 'Billing-Group-Life-Cover', '', '', 'null', '', '', '', ''),
('12', '51', 'Billing-Medical-Bills', '', '', 'null', '', '', '', ''),
('12', '52', 'Billing-Member-Limits', '', '', 'null', '', '', '', ''),
('12', '53', 'Billing-Co-pay', '', '', 'null', '', '', '', ''),
('12', '54', 'Billing-mart-Card-holder', '', '', 'null', '', '', '', ''),
('12', '55', 'Billing-Scheme-Benefits', '', '', 'null', '', '', '', ''),
('12', '56', 'Eligibility', '', '', 'null', '', '', '', ''),
('12', '57', 'Last Expense', '', '', 'null', '', '', '', ''),
('12', '58', 'Missing Button-Preauth Button', '', '', 'null', '', '', '', ''),
('12', '59', 'MVC', '', '', 'null', '', '', '', ''),
('12', '60', 'One Time Pin', '', '', 'null', '', '', '', ''),
('12', '61', 'Preauth approval', '', '', 'null', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings_alert_notice`
--

CREATE TABLE `settings_alert_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_status` tinyint(1) NOT NULL,
  `ticket_admin_email` tinyint(1) NOT NULL,
  `ticket_department_manager` tinyint(1) NOT NULL,
  `ticket_department_member` tinyint(1) NOT NULL,
  `ticket_organization_accmanager` tinyint(1) NOT NULL,
  `message_status` tinyint(1) NOT NULL,
  `message_last_responder` tinyint(1) NOT NULL,
  `message_assigned_agent` tinyint(1) NOT NULL,
  `message_department_manager` tinyint(1) NOT NULL,
  `message_organization_accmanager` tinyint(1) NOT NULL,
  `internal_status` tinyint(1) NOT NULL,
  `internal_last_responder` tinyint(1) NOT NULL,
  `internal_assigned_agent` tinyint(1) NOT NULL,
  `internal_department_manager` tinyint(1) NOT NULL,
  `assignment_status` tinyint(1) NOT NULL,
  `assignment_assigned_agent` tinyint(1) NOT NULL,
  `assignment_team_leader` tinyint(1) NOT NULL,
  `assignment_team_member` tinyint(1) NOT NULL,
  `transfer_status` tinyint(1) NOT NULL,
  `transfer_assigned_agent` tinyint(1) NOT NULL,
  `transfer_department_manager` tinyint(1) NOT NULL,
  `transfer_department_member` tinyint(1) NOT NULL,
  `overdue_status` tinyint(1) NOT NULL,
  `overdue_assigned_agent` tinyint(1) NOT NULL,
  `overdue_department_manager` tinyint(1) NOT NULL,
  `overdue_department_member` tinyint(1) NOT NULL,
  `system_error` tinyint(1) NOT NULL,
  `sql_error` tinyint(1) NOT NULL,
  `excessive_failure` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_alert_notice`
--

INSERT INTO `settings_alert_notice` (`id`, `ticket_status`, `ticket_admin_email`, `ticket_department_manager`, `ticket_department_member`, `ticket_organization_accmanager`, `message_status`, `message_last_responder`, `message_assigned_agent`, `message_department_manager`, `message_organization_accmanager`, `internal_status`, `internal_last_responder`, `internal_assigned_agent`, `internal_department_manager`, `assignment_status`, `assignment_assigned_agent`, `assignment_team_leader`, `assignment_team_member`, `transfer_status`, `transfer_assigned_agent`, `transfer_department_manager`, `transfer_department_member`, `overdue_status`, `overdue_assigned_agent`, `overdue_department_manager`, `overdue_department_member`, `system_error`, `sql_error`, `excessive_failure`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2016-12-13 03:19:29', '2016-12-13 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings_auto_response`
--

CREATE TABLE `settings_auto_response` (
  `id` int(10) UNSIGNED NOT NULL,
  `new_ticket` tinyint(1) NOT NULL,
  `agent_new_ticket` tinyint(1) NOT NULL,
  `submitter` tinyint(1) NOT NULL,
  `participants` tinyint(1) NOT NULL,
  `overlimit` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_auto_response`
--

INSERT INTO `settings_auto_response` (`id`, `new_ticket`, `agent_new_ticket`, `submitter`, `participants`, `overlimit`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, 0, '2016-12-13 03:19:29', '2016-12-13 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings_company`
--

CREATE TABLE `settings_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `landing_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offline_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thank_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_company`
--

INSERT INTO `settings_company` (`id`, `company_name`, `website`, `phone`, `address`, `landing_page`, `offline_page`, `thank_page`, `logo`, `use_logo`, `created_at`, `updated_at`) VALUES
(1, 'Complaint Management Tool', '', '', '', '', '', '', 'Blisslogo.jpg', '1', '2016-12-13 03:19:29', '2016-12-13 03:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `settings_email`
--

CREATE TABLE `settings_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alert_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_fetching` tinyint(1) NOT NULL,
  `notification_cron` tinyint(1) NOT NULL,
  `strip` tinyint(1) NOT NULL,
  `separator` tinyint(1) NOT NULL,
  `all_emails` tinyint(1) NOT NULL,
  `email_collaborator` tinyint(1) NOT NULL,
  `attachment` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_email`
--

INSERT INTO `settings_email` (`id`, `template`, `sys_email`, `alert_email`, `admin_email`, `mta`, `email_fetching`, `notification_cron`, `strip`, `separator`, `all_emails`, `email_collaborator`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 'default', '1', '', '', '', 1, 1, 0, 0, 1, 1, 1, '2016-12-13 03:19:29', '2021-08-28 00:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `settings_ratings`
--

CREATE TABLE `settings_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish` int(11) NOT NULL,
  `modify` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_security`
--

CREATE TABLE `settings_security` (
  `id` int(10) UNSIGNED NOT NULL,
  `lockout_message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backlist_offender` int(11) NOT NULL,
  `backlist_threshold` int(11) NOT NULL,
  `lockout_period` int(11) NOT NULL,
  `days_to_keep_logs` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_security`
--

INSERT INTO `settings_security` (`id`, `lockout_message`, `backlist_offender`, `backlist_threshold`, `lockout_period`, `days_to_keep_logs`, `created_at`, `updated_at`) VALUES
(1, 'You have been locked out of application due to too many failed login attempts.', 0, 15, 15, 0, '2016-12-13 03:19:47', '2016-12-13 03:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `settings_system`
--

CREATE TABLE `settings_system` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `log_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purge_log` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_enable` int(11) NOT NULL,
  `api_key_mandatory` int(11) NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_farmat` int(10) UNSIGNED DEFAULT NULL,
  `date_format` int(10) UNSIGNED DEFAULT NULL,
  `date_time_format` int(10) UNSIGNED DEFAULT NULL,
  `day_date_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_zone` int(10) UNSIGNED DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_system`
--

INSERT INTO `settings_system` (`id`, `status`, `url`, `name`, `department`, `page_size`, `log_level`, `purge_log`, `api_enable`, `api_key_mandatory`, `api_key`, `name_format`, `time_farmat`, `date_format`, `date_time_format`, `day_date_time`, `time_zone`, `content`, `version`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'Perzue | HELP DESK', '1', '', '', '', 0, 0, '', '', NULL, NULL, 1, '', 32, '', '1.11.0', '2016-12-13 03:19:29', '2016-12-13 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings_ticket`
--

CREATE TABLE `settings_ticket` (
  `id` int(10) UNSIGNED NOT NULL,
  `num_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num_sequence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sla` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `help_topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_open_ticket` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collision_avoid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lock_ticket_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `captcha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `claim_response` tinyint(1) NOT NULL,
  `assigned_ticket` tinyint(1) NOT NULL,
  `answered_ticket` tinyint(1) NOT NULL,
  `agent_mask` tinyint(1) NOT NULL,
  `html` tinyint(1) NOT NULL,
  `client_update` tinyint(1) NOT NULL,
  `max_file_size` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_ticket`
--

INSERT INTO `settings_ticket` (`id`, `num_format`, `num_sequence`, `priority`, `sla`, `help_topic`, `max_open_ticket`, `collision_avoid`, `lock_ticket_frequency`, `captcha`, `status`, `claim_response`, `assigned_ticket`, `answered_ticket`, `agent_mask`, `html`, `client_update`, `max_file_size`, `created_at`, `updated_at`) VALUES
(1, '$$$$-####-####', 'sequence', '1', '2', '1', '', '2', '0', '', 1, 0, 0, 0, 0, 0, 0, 0, '2016-12-13 03:19:29', '2016-12-13 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `sla_plan`
--

CREATE TABLE `sla_plan` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grace_period` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `transient` tinyint(1) NOT NULL,
  `ticket_overdue` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sla_plan`
--

INSERT INTO `sla_plan` (`id`, `name`, `grace_period`, `admin_note`, `status`, `transient`, `ticket_overdue`, `created_at`, `updated_at`) VALUES
(1, 'Sla 1', '6 Hours', '', 1, 0, 0, '2016-12-13 03:19:25', '2016-12-13 03:19:25'),
(2, 'Sla 2', '12 Hours', '', 1, 0, 0, '2016-12-13 03:19:25', '2016-12-13 03:19:25'),
(3, 'Sla 3', '24 Hours', '', 1, 0, 0, '2016-12-13 03:19:25', '2016-12-13 03:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_report_excel`
--

CREATE TABLE `support_report_excel` (
  `id` int(11) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Open` bigint(20) DEFAULT NULL,
  `Close` bigint(20) DEFAULT NULL,
  `Reopened` int(11) DEFAULT NULL,
  `Inprogress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `support_report_excel`
--

INSERT INTO `support_report_excel` (`id`, `Date`, `Open`, `Close`, `Reopened`, `Inprogress`) VALUES
(1, '20th September 2021', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `team_lead` int(10) UNSIGNED DEFAULT NULL,
  `assign_alert` tinyint(1) NOT NULL,
  `admin_notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `status`, `team_lead`, `assign_alert`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 'Level 1 Support', 1, NULL, 0, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27'),
(2, 'Level 2 Support', 0, NULL, 0, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27'),
(3, 'Developer', 0, NULL, 0, '', '2016-12-13 03:19:27', '2016-12-13 03:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `team_assign_agent`
--

CREATE TABLE `team_assign_agent` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team_assign_agent`
--

INSERT INTO `team_assign_agent` (`id`, `team_id`, `agent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `template_set_to_clone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `set_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `variable`, `type`, `subject`, `message`, `description`, `set_id`, `created_at`, `updated_at`) VALUES
(1, 'This template is for sending notice to agent when ticket is assigned to them', '0', 1, '', '<div>Hello {!!$ticket_agent_name!!},<br /><br /><b>Ticket No:</b> {!!$ticket_number!!}<br />Has been assigned to you by {!!$ticket_assigner!!} <br /> Please check and resppond on the ticket.<br /> Link: {!!$ticket_link!!}<br /><br />Thank You<br />Kind Regards,<br /> {!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:50', '2016-12-13 03:19:50'),
(2, 'This template is for sending notice to client with ticket link to check ticket without logging in to system', '1', 2, 'Check your Ticket', '<div>Hello {!!$user!!},<br /><br />Click the link below to view your requested ticket<br /> {!!$ticket_link_with_number!!}<br /><br />Kind Regards,<br /> {!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:50', '2016-12-13 03:19:50'),
(3, 'This template is for sending notice to client when ticket status is changed to close', '0', 3, '', '<div>Hello,<br /><br />This message is regarding your ticket ID {!!$ticket_number!!}. We are changing the status of this ticket to \"Closed\" as the issue appears to be resolved.<br /><br />Thank you<br />Kind regards,<br /> {!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:50', '2016-12-13 03:19:50'),
(4, 'This template is for sending notice to client on successful ticket creation', '0', 4, '', '<div><span>Hello {!!$user!!}<br /><br /></span><span>Thank you for contacting us. This is an automated response confirming the receipt of your ticket. Our team will get back to you as soon as possible. When replying, please make sure that the ticket ID is kept in the subject so that we can track your replies.<br /><br /></span><span><b>Ticket ID:</b> {!!$ticket_number!!} <br /><br /></span><span> {!!$department_sign!!}<br /></span>You can check the status of or update this ticket online at: {!!$system_link!!}</div>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(5, 'This template is for sending notice to agent on new ticket creation', '0', 5, '', '<div>Hello {!!$ticket_agent_name!!},<br /><br />New ticket {!!$ticket_number!!}created <br /><br /><b>From</b><br /><b>Name:</b> {!!$ticket_client_name!!}   <br /><b>E-mail:</b> {!!$ticket_client_email!!}<br /><br /> {!!$content!!}<br /><br />Kind Regards,<br /> {!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(6, 'This template is for sending notice to client on new ticket created by agent in name of client', '0', 6, '', '<div> {!!$content!!}<br /><br /> {!!$agent_sign!!}<br /><br />You can check the status of or update this ticket online at: {!!$system_link!!}</div>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(7, 'This template is for sending notice to client on new registration during new ticket creation for un registered clients', '1', 7, 'Registration Confirmation', '<p>Hello {!!$user!!}, </p><p>This email is confirmation that you are now registered at our helpdesk.</p><p><b>Registered Email:</b> {!!$email_address!!}</p><p><b>Password:</b> {!!$user_password!!}</p><p>You can visit the helpdesk to browse articles and contact us at any time: {!!$system_link!!}</p><p>Thank You.</p><p>Kind Regards,</p><p> {!!$system_from!!} </p>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(8, 'This template is for sending notice to any user about reset password option', '1', 8, 'Reset your Password', 'Hello {!!$user!!},<br /><br />You asked to reset your password. To do so, please click this link:<br /><br /> {!!$password_reset_link!!}<br /><br />This will let you change your password to something new. If you didn\'t ask for this, don\'t worry, we\'ll keep your password safe.<br /><br />Thank You.<br /><br />Kind Regards,<br /> {!!$system_from!!}', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(9, 'This template is for sending notice to client when a reply made to his/her ticket', '0', 9, '', '<span></span><div><span></span><p> {!!$content!!}<br /></p><p> {!!$agent_sign!!} </p><p><b>Ticket Details</b></p><p><b>Ticket ID:</b> {!!$ticket_number!!}</p></div>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(10, 'This template is for sending notice to agent when ticket reply is made by client on a ticket', '0', 10, '', '<div>Hello {!!$ticket_agent_name!!},<br /><b><br /></b>A reply been made to ticket {!!$ticket_number!!}<br /><b><br /></b><b>From<br /></b><b>Name: </b>{!!$ticket_client_name!!}<br /><b>E-mail: </b>{!!$ticket_client_email!!}<br /><b><br /></b> {!!$content!!}<br /><b><br /></b>Kind Regards,<br /> {!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:51', '2016-12-13 03:19:51'),
(11, 'This template is for sending notice to client about registration confirmation link', '1', 11, 'Verify your email address', '<p>Hello {!!$user!!}, </p><p>This email is confirmation that you are now registered at our helpdesk.</p><p><b>Registered Email:</b> {!!$email_address!!}</p><p>Please click on the below link to activate your account and Login to the system {!!$password_reset_link!!}</p><p>Thank You.</p><p>Kind Regards,</p><p> {!!$system_from!!} </p>', '', 1, '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(12, 'This template is for sending notice to team when ticket is assigned to team', '1', 12, '', '<div>Hello {!!$ticket_agent_name!!},<br /><br /><b>Ticket No:</b> {!!$ticket_number!!}<br />Has been assigned to your team : {!!$team!!} by {!!$ticket_assigner!!} <br /><br />Thank You<br />Kind Regards,<br />{!!$system_from!!}</div>', '', 1, '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(13, 'This template is for sending notice to client when password is changed', '1', 13, 'Verify your email address', 'Hello {!!$user!!},<br /><br />Your password is successfully changed.Your new password is : {!!$user_password!!}<br /><br />Thank You.<br /><br />Kind Regards,<br /> {!!$system_from!!}', '', 1, '2016-12-13 03:19:52', '2016-12-13 03:19:52'),
(14, 'This template is to notify users when their tickets are merged.', '1', 14, 'Your tickets have been merged.', '<p>Hello {!!$user!!},<br />&nbsp;</p><p>Your ticket(s) with ticket number {!!$merged_ticket_numbers!!} have been closed and&nbsp;merged with <a href=\"{!!$ticket_link!!}\">{!!$ticket_number!!}</a>.&nbsp;</p><p>Possible reasons for merging tickets</p><ul><li>Tickets are duplicate</li<li>Tickets state&nbsp;the same issue</li><li>Another member from your organization has created a ticket for the same issue</li></ul><p><a href=\"{!!$system_link!!}\">Click here</a> to login to your account and check your tickets.</p><p>Regards,</p><p>{!!$system_from!!}</p>', '', 1, '2017-01-02 00:20:12', '2017-01-02 00:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `template_sets`
--

CREATE TABLE `template_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template_sets`
--

INSERT INTO `template_sets` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'default', 1, '2016-12-13 03:19:47', '2016-12-13 03:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `template_types`
--

CREATE TABLE `template_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template_types`
--

INSERT INTO `template_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'assign-ticket', '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(2, 'check-ticket', '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(3, 'close-ticket', '2016-12-13 03:19:47', '2016-12-13 03:19:47'),
(4, 'create-ticket', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(5, 'create-ticket-agent', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(6, 'create-ticket-by-agent', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(7, 'registration-notification', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(8, 'reset-password', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(9, 'ticket-reply', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(10, 'ticket-reply-agent', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(11, 'registration', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(12, 'team_assign_ticket', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(13, 'reset_new_password', '2016-12-13 03:19:48', '2016-12-13 03:19:48'),
(14, 'merge-ticket-notification', '2017-01-02 00:20:11', '2017-01-02 00:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `dept_id` int(10) UNSIGNED DEFAULT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `sla` int(10) UNSIGNED DEFAULT NULL,
  `help_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `rating` tinyint(1) NOT NULL,
  `ratingreply` tinyint(1) NOT NULL,
  `flags` int(11) NOT NULL,
  `ip_address` int(11) NOT NULL,
  `assigned_to` int(10) UNSIGNED DEFAULT NULL,
  `lock_by` int(11) NOT NULL,
  `lock_at` datetime DEFAULT NULL,
  `source` int(10) UNSIGNED DEFAULT NULL,
  `isoverdue` int(11) NOT NULL,
  `reopened` int(11) NOT NULL,
  `isanswered` int(11) NOT NULL,
  `html` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `closed` int(11) NOT NULL,
  `is_transferred` tinyint(1) NOT NULL,
  `transferred_at` datetime NOT NULL,
  `reopened_at` datetime DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `last_response_at` datetime DEFAULT NULL,
  `approval` int(11) NOT NULL,
  `follow_up` int(11) NOT NULL,
  `sent_mail_level1` int(1) DEFAULT NULL,
  `sent_mail_level2` int(1) DEFAULT NULL,
  `sent_mail_level3` int(1) DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_number`, `user_id`, `dept_id`, `team_id`, `priority_id`, `sla`, `help_topic_id`, `status`, `rating`, `ratingreply`, `flags`, `ip_address`, `assigned_to`, `lock_by`, `lock_at`, `source`, `isoverdue`, `reopened`, `isanswered`, `html`, `is_deleted`, `closed`, `is_transferred`, `transferred_at`, `reopened_at`, `duedate`, `closed_at`, `last_message_at`, `last_response_at`, `approval`, `follow_up`, `sent_mail_level1`, `sent_mail_level2`, `sent_mail_level3`, `location`, `status_updated_by`, `created_at`, `updated_at`) VALUES
(204, 'LCBG1', 1, 1, NULL, 2, 3, 1, 8, 0, 0, 0, 0, 32, 0, NULL, 1, 0, 0, 1, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2021-10-02 10:10:31', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'Lifecare Bungoma', NULL, '2021-10-01 07:10:31', '2021-10-01 04:12:09'),
(267, 'BHMK1', 86, 1, NULL, 2, 3, 1, 2, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-13 17:56:20', '2022-01-15 18:42:25', NULL, NULL, 0, 0, 1, NULL, NULL, 'MARALAL', 86, '2022-01-12 14:56:20', '2022-01-15 15:42:25'),
(268, 'BHMK1', 86, 1, NULL, 2, 3, 1, 3, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-13 17:58:38', '2022-01-14 15:18:12', NULL, NULL, 0, 0, NULL, NULL, NULL, 'MERU', 89, '2022-01-12 14:58:38', '2022-01-14 12:18:12'),
(269, 'BHMK1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 96, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 09:32:41', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'GARISSA', NULL, '2022-01-13 06:32:41', '2022-01-13 06:32:41'),
(270, 'BHRV1', 89, 1, NULL, 2, 3, 1, 3, 0, 0, 0, 0, 97, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 12:24:19', '2022-01-14 17:43:48', NULL, NULL, 0, 0, 1, NULL, NULL, 'ELDORET ZION MALL', 89, '2022-01-13 09:24:19', '2022-01-14 14:43:48'),
(271, 'BHLN1', 89, 1, NULL, 2, 3, 1, 8, 0, 0, 0, 0, 91, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 12:31:46', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KISUMU AL IMRAN', 89, '2022-01-13 09:31:46', '2022-01-13 14:18:47'),
(272, 'BHMK1', 96, 1, NULL, 2, 3, 1, 3, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:11:34', '2022-01-13 15:53:04', NULL, NULL, 0, 0, NULL, NULL, NULL, 'NANYUKI', 86, '2022-01-13 11:11:34', '2022-01-13 12:53:04'),
(273, 'BHNW1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 86, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:34:11', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'WESTLANDS', NULL, '2022-01-13 11:34:11', '2022-01-24 09:56:15'),
(274, 'BHMK1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 96, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:37:50', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'KERUGOYA', NULL, '2022-01-13 11:37:50', '2022-01-13 11:37:51'),
(275, 'BHLC1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:39:35', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MALINDI', NULL, '2022-01-13 11:39:35', '2022-01-14 12:01:52'),
(276, 'BHLC1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:41:39', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'KIZINGO', NULL, '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(277, 'BHLN1', 86, 1, NULL, 2, 3, 1, 3, 0, 0, 0, 0, 91, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-14 14:46:32', '2022-01-14 15:29:26', NULL, NULL, 0, 0, NULL, NULL, NULL, 'MBALE', 91, '2022-01-13 11:46:32', '2022-01-14 12:29:26'),
(278, 'BHLC1', 96, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-15 15:01:50', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'DIANI BLISS', NULL, '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(279, 'BHMK1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-15 16:31:41', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'MERU', NULL, '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(280, 'BLISS1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-16 18:41:47', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'PANARI NYAHURURU', NULL, '2022-01-15 15:41:47', '2022-01-15 17:39:42'),
(281, 'BLISS1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-16 18:47:08', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'WINDSOR', NULL, '2022-01-15 15:47:08', '2022-01-17 11:15:33'),
(282, 'BLISS1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-16 20:32:42', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'NAROK', NULL, '2022-01-15 17:32:42', '2022-01-17 11:36:13'),
(283, 'BLISS1', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-16 20:39:41', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'PANARI NYAHURURU', NULL, '2022-01-15 17:39:41', '2022-01-15 17:39:41'),
(284, 'BLISS2', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-16 20:50:21', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KERUGOYA', NULL, '2022-01-15 17:50:21', '2022-01-15 17:50:23'),
(285, 'BLISS3', 86, 1, NULL, 2, 3, 1, 3, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:00:42', '2022-01-17 15:26:05', NULL, NULL, 0, 0, 1, NULL, NULL, 'KIZINGO', 88, '2022-01-17 09:00:42', '2022-01-17 12:26:05'),
(286, 'BLISS4', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:03:20', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KIZINGO', NULL, '2022-01-17 09:03:20', '2022-01-17 09:03:21'),
(287, 'BLISS5', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:04:06', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'NYERI 2', NULL, '2022-01-17 09:04:06', '2022-01-17 09:04:08'),
(288, 'BLISS6', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:04:50', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MALINDI', NULL, '2022-01-17 09:04:50', '2022-01-17 09:04:52'),
(289, 'BLISS7', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:05:25', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KAPENGURIA', NULL, '2022-01-17 09:05:25', '2022-01-17 11:36:13'),
(290, 'BLISS8', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 86, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:06:17', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'UMOJA', NULL, '2022-01-17 09:06:17', '2022-01-17 09:06:18'),
(291, 'BLISS9', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:07:08', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'NAKURU', NULL, '2022-01-17 09:07:08', '2022-01-17 11:36:13'),
(292, 'BLISS10', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:07:39', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MURANG\'A', NULL, '2022-01-17 09:07:39', '2022-01-17 09:07:40'),
(293, 'BLISS11', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:08:01', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'JUJA MALL', NULL, '2022-01-17 09:08:01', '2022-01-22 06:56:14'),
(294, 'BLISS12', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:08:36', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MAUA', NULL, '2022-01-17 09:08:36', '2022-01-17 09:08:38'),
(295, 'BLISS13', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 12:25:13', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MTWAPA', NULL, '2022-01-17 09:25:13', '2022-01-17 09:25:14'),
(296, 'BLISS14', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 13:10:49', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'PANARI NYAHURURU', NULL, '2022-01-17 10:10:49', '2022-01-17 10:10:51'),
(297, 'BLISS15', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 106, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 14:16:41', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'OLKALOU', NULL, '2022-01-17 11:16:41', '2022-01-17 11:16:42'),
(298, 'BLISS16', 89, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 15:18:28', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MTWAPA', NULL, '2022-01-17 12:18:28', '2022-01-17 12:18:30'),
(299, 'BLISS17', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 87, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-18 17:32:22', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'JUJA MALL', NULL, '2022-01-17 14:32:22', '2022-01-17 14:32:23'),
(300, 'BLISS18', 94, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 96, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-19 11:23:53', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'NYERI 1', NULL, '2022-01-18 08:23:53', '2022-01-18 08:23:54'),
(301, 'BLISS19', 94, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 106, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-20 12:48:12', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MALINDI', NULL, '2022-01-19 09:48:12', '2022-01-19 09:48:14'),
(302, 'BLISS20', 94, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 89, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-20 12:50:09', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KERUGOYA', NULL, '2022-01-19 09:50:09', '2022-01-19 09:50:10'),
(303, 'BLISS21', 94, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 88, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-20 12:57:25', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MALINDI', NULL, '2022-01-19 09:57:25', '2022-01-19 09:57:26'),
(304, 'BLISS22', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 104, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-22 21:54:57', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'KITUI', NULL, '2022-01-21 18:54:57', '2022-01-21 18:54:58'),
(305, 'BLISS23', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 104, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-22 22:09:54', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'MTWAPA', NULL, '2022-01-21 19:09:54', '2022-01-21 19:09:55'),
(306, 'BLISS24', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 104, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-23 09:18:00', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'PANARI NYAHURURU', NULL, '2022-01-22 06:18:00', '2022-01-22 06:18:03'),
(307, 'BLISS25', 86, 1, NULL, 2, 3, 1, 1, 0, 0, 0, 0, 106, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', NULL, '2022-01-23 12:02:24', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 'ELDAMA RAVINE', NULL, '2022-01-22 09:02:24', '2022-01-22 09:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachment`
--

CREATE TABLE `ticket_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thread_id` int(10) UNSIGNED DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  `driver` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_collaborator`
--

CREATE TABLE `ticket_collaborator` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_form_data`
--

CREATE TABLE `ticket_form_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_form_data`
--

INSERT INTO `ticket_form_data` (`id`, `ticket_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 204, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(2, 204, 'memberno', '', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(3, 204, 'mobiles', '0715556316', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(4, 204, 'membertype', 'Principal', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(5, 204, 'searchpatienttype', 'InPatient', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(6, 204, 'locationname', '', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(7, 204, 'recent_visit_date', '28-05-2021  11:41:00', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(8, 204, 'clientschema', 'CASH - HOSPITAL', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(9, 204, 'company', '1', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(10, 204, 'company_location', 'Lifecare Bungoma', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(11, 204, 'patient_type', 'InPatient', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(12, 204, 'service', '1', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(13, 204, 'service_issue', 'Delayed spectacles\r\n', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(14, 204, 'reported_via', '1', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(15, 204, 'files', '', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(16, 205, 'patientfullname', 'ONYANGO SHADRACK MAINA', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(17, 205, 'memberno', '470440', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(18, 205, 'mobiles', '721858262', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(19, 205, 'membertype', 'Principal', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(21, 205, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(22, 205, 'recent_visit_date', '11-05-2020  07:27:00', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(23, 205, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(24, 205, 'company', '1', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(25, 205, 'company_location', 'Lifecare Bungoma', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(26, 205, 'patient_type', 'OutPatient', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(27, 205, 'service', '2', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(28, 205, 'service_issue', 'Lack of drugs', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(29, 205, 'reported_via', '1', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(30, 205, 'files', '', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(31, 206, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(32, 206, 'memberno', '', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(33, 206, 'mobiles', '0715556316', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(34, 206, 'membertype', 'Principal', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(35, 206, 'searchpatienttype', 'InPatient', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(36, 206, 'locationname', '', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(37, 206, 'recent_visit_date', '28-05-2021  11:41:00', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(38, 206, 'clientschema', 'CASH - HOSPITAL', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(39, 206, 'company', '1', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(40, 206, 'company_location', 'Lifecare Migori', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(41, 206, 'patient_type', 'InPatient', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(42, 206, 'service', '25', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(43, 206, 'service_issue', 'Billing - Last-Expense', '2021-10-06 07:38:41', '2021-10-06 07:38:41'),
(44, 206, 'reported_via', '1', '2021-10-06 07:38:42', '2021-10-06 07:38:42'),
(45, 206, 'files', '', '2021-10-06 07:38:42', '2021-10-06 07:38:42'),
(46, 207, 'patientfullname', 'MESHACK MAKOKHA ', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(47, 207, 'memberno', '531234', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(48, 207, 'mobiles', '0729951054', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(49, 207, 'membertype', 'Principal', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(50, 207, 'searchpatienttype', 'OutPatient', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(51, 207, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(52, 207, 'recent_visit_date', '06-07-2020  09:37:00', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(53, 207, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(54, 207, 'company', '1', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(55, 207, 'company_location', 'Lifecare Bungoma', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(56, 207, 'patient_type', 'OutPatient', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(57, 207, 'service', '2', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(58, 207, 'service_issue', 'Lack of drugs', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(59, 207, 'reported_via', '1', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(60, 207, 'files', '', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(61, 208, 'patientfullname', 'MESHACK MAKOKHA ', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(62, 208, 'memberno', '531234', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(63, 208, 'mobiles', '0729951054', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(64, 208, 'membertype', 'Principal', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(65, 208, 'searchpatienttype', 'OutPatient', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(66, 208, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(67, 208, 'recent_visit_date', '06-07-2020  09:37:00', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(68, 208, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(69, 208, 'company', '1', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(70, 208, 'company_location', 'Lifecare Migori', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(71, 208, 'patient_type', 'InPatient', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(72, 208, 'service', '8', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(73, 208, 'service_issue', 'Facility Hygiene and Tidiness', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(74, 208, 'reported_via', '1', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(75, 208, 'files', '', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(76, 209, 'patientfullname', 'OKELO BENSON O', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(77, 209, 'memberno', '244316', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(78, 209, 'mobiles', '0720716458', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(79, 209, 'membertype', 'Principal', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(80, 209, 'searchpatienttype', 'OutPatient', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(81, 209, 'locationname', '', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(82, 209, 'recent_visit_date', '03-03-2021  16:43:00', '2021-10-14 07:52:03', '2021-10-14 07:52:03'),
(83, 209, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(84, 209, 'company', '1', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(85, 209, 'company_location', 'Lifecare Bungoma', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(86, 209, 'patient_type', 'InPatient', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(87, 209, 'service', '8', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(88, 209, 'service_issue', 'Bad Attitude  by Staff', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(89, 209, 'reported_via', '1', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(90, 209, 'files', '', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(91, 210, 'patientfullname', 'IRENE ADEDE OWUOR', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(92, 210, 'memberno', '538585', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(93, 210, 'mobiles', '0712821894', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(94, 210, 'membertype', 'Principal', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(95, 210, 'searchpatienttype', 'OutPatient', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(96, 210, 'locationname', 'Lifecare Hospitals-Migori ( A Unit of AfriHospital Holdings Limited)', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(97, 210, 'recent_visit_date', '04-06-2021  15:44:00', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(98, 210, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(99, 210, 'company', '1', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(100, 210, 'company_location', 'Lifecare Bungoma', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(101, 210, 'patient_type', 'OutPatient', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(102, 210, 'service', '24', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(103, 210, 'service_issue', 'Billing Query', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(104, 210, 'reported_via', '1', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(105, 210, 'files', '', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(106, 211, 'patientfullname', 'MESHACK MAKOKHA ', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(107, 211, 'memberno', '531234', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(108, 211, 'mobiles', '0729951054', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(109, 211, 'membertype', 'Principal', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(110, 211, 'searchpatienttype', 'OutPatient', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(111, 211, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(112, 211, 'recent_visit_date', '06-07-2020  09:37:00', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(113, 211, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(114, 211, 'company', '1', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(115, 211, 'company_location', 'Lifecare Migori', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(116, 211, 'patient_type', 'InPatient', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(117, 211, 'service', '24', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(118, 211, 'service_issue', 'Billing Query', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(119, 211, 'reported_via', '1', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(120, 211, 'files', '', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(121, 212, 'patientfullname', 'GEOFFREY SANDE ', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(122, 212, 'memberno', '435962', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(123, 212, 'mobiles', '0725901714', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(124, 212, 'membertype', 'Principal', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(125, 212, 'searchpatienttype', 'OutPatient', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(126, 212, 'locationname', 'Lifecare Hospitals Migori ( A Unit of AfriHospital Holdings Limited)', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(127, 212, 'recent_visit_date', '04-06-2021  12:11:00', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(128, 212, 'clientschema', 'MAKL-CDM SCHEME-MIGORI.', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(129, 212, 'company', '1', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(130, 212, 'company_location', 'Lifecare Migori', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(131, 212, 'patient_type', 'OutPatient', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(132, 212, 'service', '4', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(133, 212, 'service_issue', 'Lack of Specimen Holder\r\n', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(134, 212, 'reported_via', '1', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(135, 212, 'files', '', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(136, 213, 'patientfullname', 'JOHN ALBERT ', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(137, 213, 'memberno', '580958', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(138, 213, 'mobiles', '0723636150', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(139, 213, 'membertype', 'Dependent', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(140, 213, 'searchpatienttype', 'OutPatient', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(141, 213, 'locationname', '', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(142, 213, 'recent_visit_date', '07-06-2021  12:40:00', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(143, 213, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(144, 213, 'company', '1', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(145, 213, 'company_location', 'Lifecare Migori', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(146, 213, 'patient_type', 'OutPatient', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(147, 213, 'service', '8', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(148, 213, 'service_issue', 'Long Stay of Patients', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(149, 213, 'reported_via', '2', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(150, 213, 'files', '', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(151, 214, 'patientfullname', 'WILL JENSEN ALLY', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(152, 214, 'memberno', '571693', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(153, 214, 'mobiles', '0725760740', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(154, 214, 'membertype', 'Dependent', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(155, 214, 'searchpatienttype', 'OutPatient', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(156, 214, 'locationname', '', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(157, 214, 'recent_visit_date', '12-05-2021  13:08:00', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(158, 214, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(159, 214, 'company', '1', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(160, 214, 'company_location', 'Lifecare Migori', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(161, 214, 'patient_type', 'OutPatient', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(162, 214, 'service', '8', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(163, 214, 'service_issue', 'Long Stay of Patients', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(164, 214, 'reported_via', '2', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(165, 214, 'files', '', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(166, 215, 'patientfullname', 'MARTIN GOGA OCHOME', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(167, 215, 'memberno', '490974', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(168, 215, 'mobiles', '0723839601', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(169, 215, 'membertype', 'Principal', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(170, 215, 'searchpatienttype', 'OutPatient', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(171, 215, 'locationname', '', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(172, 215, 'recent_visit_date', '10-10-2021  13:32:00', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(173, 215, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(174, 215, 'company', '1', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(175, 215, 'company_location', 'Lifecare Migori', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(176, 215, 'patient_type', 'OutPatient', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(177, 215, 'service', '4', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(178, 215, 'service_issue', 'Delayed Results', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(179, 215, 'reported_via', '2', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(180, 215, 'files', '', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(181, 216, 'patientfullname', 'MESHACK MAKOKHA ', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(182, 216, 'memberno', '531234', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(183, 216, 'mobiles', '0729951054', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(184, 216, 'membertype', 'Principal', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(185, 216, 'searchpatienttype', 'OutPatient', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(186, 216, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(187, 216, 'recent_visit_date', '06-07-2020  09:37:00', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(188, 216, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(189, 216, 'company', '1', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(190, 216, 'company_location', 'Lifecare Bungoma', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(191, 216, 'patient_type', 'OutPatient', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(192, 216, 'service', '25', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(193, 216, 'service_issue', 'Missing  Button - Claim Button', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(194, 216, 'reported_via', '1', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(195, 216, 'files', '', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(196, 217, 'patientfullname', 'ELIZABETH KOMORA CHUNGUNE', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(197, 217, 'memberno', '', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(198, 217, 'mobiles', '0716333033', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(199, 217, 'membertype', 'Dependent', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(200, 217, 'searchpatienttype', 'OutPatient', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(201, 217, 'locationname', '', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(202, 217, 'recent_visit_date', '05-10-2021  14:19:00', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(203, 217, 'clientschema', 'CASH - HOSPITAL', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(204, 217, 'company', '1', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(205, 217, 'company_location', 'Lifecare Kikuyu', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(206, 217, 'patient_type', 'OutPatient', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(207, 217, 'service', '21', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(208, 217, 'service_issue', 'Delays In Service Delivery', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(209, 217, 'reported_via', '2', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(210, 217, 'files', '', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(211, 218, 'patientfullname', 'ELIZABETH KOMORA CHUNGUNE', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(212, 218, 'memberno', '', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(213, 218, 'mobiles', '0716333033', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(214, 218, 'membertype', 'Dependent', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(215, 218, 'searchpatienttype', 'OutPatient', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(216, 218, 'locationname', '', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(217, 218, 'recent_visit_date', '05-10-2021  14:19:00', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(218, 218, 'clientschema', 'CASH - HOSPITAL', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(219, 218, 'company', '1', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(220, 218, 'company_location', 'Lifecare Kikuyu', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(221, 218, 'patient_type', 'OutPatient', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(222, 218, 'service', '8', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(223, 218, 'service_issue', 'Facility Hygiene and Tidiness', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(224, 218, 'reported_via', '2', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(225, 218, 'files', '', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(226, 219, 'patientfullname', 'ELIZABETH KOMORA CHUNGUNE', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(227, 219, 'memberno', '', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(228, 219, 'mobiles', '0716333033', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(229, 219, 'membertype', 'Dependent', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(230, 219, 'searchpatienttype', 'OutPatient', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(231, 219, 'locationname', '', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(232, 219, 'recent_visit_date', '05-10-2021  14:19:00', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(233, 219, 'clientschema', 'CASH - HOSPITAL', '2021-10-25 10:11:32', '2021-10-25 10:11:32'),
(234, 219, 'company', '1', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(235, 219, 'company_location', 'Lifecare Kikuyu', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(236, 219, 'patient_type', 'OutPatient', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(237, 219, 'service', '5', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(238, 219, 'service_issue', 'Wrong Diagnosis', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(239, 219, 'reported_via', '2', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(240, 219, 'files', '', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(241, 220, 'patientfullname', 'MESHACK MAKOKHA ', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(242, 220, 'memberno', '531234', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(243, 220, 'mobiles', '0729951054', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(244, 220, 'membertype', 'Principal', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(245, 220, 'searchpatienttype', 'OutPatient', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(246, 220, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(247, 220, 'recent_visit_date', '06-07-2020  09:37:00', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(248, 220, 'clientschema', 'MAKL-TSC OUTPATIENT DENTAL & OPTICAL', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(249, 220, 'company', '1', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(250, 220, 'company_location', 'Lifecare Bungoma', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(251, 220, 'patient_type', 'OutPatient', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(252, 220, 'service', '10', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(253, 220, 'service_issue', 'No Dental Services', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(254, 220, 'reported_via', '1', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(255, 220, 'files', '', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(256, 221, 'patientfullname', 'ELIZABETH KOMORA CHUNGUNE', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(257, 221, 'memberno', '', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(258, 221, 'mobiles', '0716333033', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(259, 221, 'membertype', 'Dependent', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(260, 221, 'searchpatienttype', 'OutPatient', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(261, 221, 'locationname', '', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(262, 221, 'recent_visit_date', '05-10-2021  14:19:00', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(263, 221, 'clientschema', 'CASH - HOSPITAL', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(264, 221, 'company', '1', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(265, 221, 'company_location', 'Lifecare Kikuyu', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(266, 221, 'patient_type', 'OutPatient', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(267, 221, 'service', '5', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(268, 221, 'service_issue', 'Delayed Doctor Appointment', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(269, 221, 'reported_via', '2', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(270, 221, 'files', '', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(271, 222, 'patientfullname', 'MATHEW ONDIEK AGAIH', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(272, 222, 'memberno', '264282', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(273, 222, 'mobiles', '0721939385', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(274, 222, 'membertype', 'Dependent', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(275, 222, 'searchpatienttype', 'OutPatient', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(276, 222, 'locationname', 'Lifecare Hospitals-Migori ( A Unit of AfriHospital Holdings Limited)', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(277, 222, 'recent_visit_date', '05-09-2021  11:16:00', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(278, 222, 'clientschema', 'AON MAKL-TSC-MIGORI', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(279, 222, 'company', '1', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(280, 222, 'company_location', 'Lifecare Migori', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(281, 222, 'patient_type', 'InPatient', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(282, 222, 'service', '25', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(283, 222, 'service_issue', 'Billing- Medical-Bills', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(284, 222, 'reported_via', '1', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(285, 222, 'files', '', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(286, 223, 'patientfullname', 'ELIZABETH KOMORA CHUNGUNE', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(287, 223, 'memberno', '', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(288, 223, 'mobiles', '0716333033', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(289, 223, 'membertype', 'Dependent', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(290, 223, 'searchpatienttype', 'OutPatient', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(291, 223, 'locationname', '', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(292, 223, 'recent_visit_date', '05-10-2021  14:19:00', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(293, 223, 'clientschema', 'CASH - HOSPITAL', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(294, 223, 'company', '1', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(295, 223, 'company_location', 'Lifecare Kikuyu', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(296, 223, 'patient_type', 'InPatient', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(297, 223, 'service', '18', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(298, 223, 'service_issue', 'Food', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(299, 223, 'reported_via', '2', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(300, 223, 'files', '', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(301, 224, 'patientfullname', 'SUSY NEKESA WAKWABUBI', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(302, 224, 'memberno', '829861', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(303, 224, 'mobiles', '717365656', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(304, 224, 'membertype', 'Principal', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(305, 224, 'searchpatienttype', 'OutPatient', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(306, 224, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(307, 224, 'recent_visit_date', '04-07-2021  10:58:00', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(308, 224, 'clientschema', 'AON MAKL-TSC', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(309, 224, 'company', '1', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(310, 224, 'company_location', 'Lifecare Bungoma', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(311, 224, 'patient_type', 'OutPatient', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(312, 224, 'service', '8', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(313, 224, 'service_issue', 'Long Stay of Patients', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(314, 224, 'reported_via', '2', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(315, 224, 'files', '', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(316, 225, 'patientfullname', 'MOSES KIMATWA SIMATWO', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(317, 225, 'memberno', '7531379', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(318, 225, 'mobiles', '0720769638', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(319, 225, 'membertype', 'Principal', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(320, 225, 'searchpatienttype', 'OutPatient', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(321, 225, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(322, 225, 'recent_visit_date', '23-09-2021  11:29:00', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(323, 225, 'clientschema', 'NHIF INSURANCE', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(324, 225, 'company', '1', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(325, 225, 'company_location', 'Lifecare Bungoma', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(326, 225, 'patient_type', 'InPatient', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(327, 225, 'service', '18', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(328, 225, 'service_issue', 'Food', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(329, 225, 'reported_via', '2', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(330, 225, 'files', '', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(331, 226, 'patientfullname', 'JOHN FRANCES EKWARO', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(332, 226, 'memberno', '0080715', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(333, 226, 'mobiles', '0724877273', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(334, 226, 'membertype', 'Principal', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(335, 226, 'searchpatienttype', 'OutPatient', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(336, 226, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(337, 226, 'recent_visit_date', '27-09-2021  08:30:00', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(338, 226, 'clientschema', 'NHIF INSURANCE', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(339, 226, 'company', '1', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(340, 226, 'company_location', 'Lifecare Bungoma', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(341, 226, 'patient_type', 'InPatient', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(342, 226, 'service', '8', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(343, 226, 'service_issue', 'Facility Maintainance', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(344, 226, 'reported_via', '2', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(345, 226, 'files', '', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(346, 227, 'patientfullname', 'DANIEL MAKONA ', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(347, 227, 'memberno', '210912', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(348, 227, 'mobiles', '0706772938', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(349, 227, 'membertype', 'Principal', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(350, 227, 'searchpatienttype', 'OutPatient', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(351, 227, 'locationname', '', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(352, 227, 'recent_visit_date', '22-01-2021  11:19:00', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(353, 227, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(354, 227, 'company', '1', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(355, 227, 'company_location', 'Lifecare Bungoma', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(356, 227, 'patient_type', 'InPatient', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(357, 227, 'service', '8', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(358, 227, 'service_issue', 'Long Stay of Patients', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(359, 227, 'reported_via', '2', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(360, 227, 'files', '', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(361, 228, 'patientfullname', 'OMAR MANDELA YUSUF', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(362, 228, 'memberno', '846235', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(363, 228, 'mobiles', '0758232990', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(364, 228, 'membertype', 'Dependent', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(365, 228, 'searchpatienttype', 'OutPatient', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(366, 228, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(367, 228, 'recent_visit_date', '20-10-2021  10:56:00', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(368, 228, 'clientschema', 'AON MAKL-TSC', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(369, 228, 'company', '1', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(370, 228, 'company_location', 'Lifecare Bungoma', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(371, 228, 'patient_type', 'InPatient', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(372, 228, 'service', '18', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(373, 228, 'service_issue', 'Food', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(374, 228, 'reported_via', '2', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(375, 228, 'files', '', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(376, 229, 'patientfullname', 'BENSON MANYONYI ', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(377, 229, 'memberno', '11970255', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(378, 229, 'mobiles', '0721875223', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(379, 229, 'membertype', 'Principal', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(380, 229, 'searchpatienttype', 'OutPatient', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(381, 229, 'locationname', '', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(382, 229, 'recent_visit_date', '10-05-2021  14:36:00', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(383, 229, 'clientschema', 'ONE ACRE FUND GROUP 2', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(384, 229, 'company', '1', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(385, 229, 'company_location', 'Lifecare Bungoma', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(386, 229, 'patient_type', 'InPatient', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(387, 229, 'service', '17', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(388, 229, 'service_issue', 'Delayed Admission', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(389, 229, 'reported_via', '1', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(390, 229, 'files', '', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(391, 230, 'patientfullname', 'ELVIS WAFULA ', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(392, 230, 'memberno', '23544274', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(393, 230, 'mobiles', '711155974', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(394, 230, 'membertype', 'Principal', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(395, 230, 'searchpatienttype', 'OutPatient', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(396, 230, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(397, 230, 'recent_visit_date', '23-10-2021  23:24:00', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(398, 230, 'clientschema', 'NHIF INSURANCE', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(399, 230, 'company', '1', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(400, 230, 'company_location', 'Lifecare Bungoma', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(401, 230, 'patient_type', 'InPatient', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(402, 230, 'service', '17', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(403, 230, 'service_issue', 'Lack Of Beds', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(404, 230, 'reported_via', '2', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(405, 230, 'files', '', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(406, 231, 'patientfullname', 'CYLLION MASHETI ', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(407, 231, 'memberno', '689066', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(408, 231, 'mobiles', '0706061191', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(409, 231, 'membertype', 'Principal', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(410, 231, 'searchpatienttype', 'OutPatient', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(411, 231, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(412, 231, 'recent_visit_date', '10-01-2021  14:20:00', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(413, 231, 'clientschema', 'AON MAKL-TSC', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(414, 231, 'company', '1', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(415, 231, 'company_location', 'Lifecare Bungoma', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(416, 231, 'patient_type', 'InPatient', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(417, 231, 'service', '18', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(418, 231, 'service_issue', 'Food', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(419, 231, 'reported_via', '2', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(420, 231, 'files', '', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(421, 232, 'patientfullname', 'ROSELYNE AKINYI ABULO', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(422, 232, 'memberno', '332563', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(423, 232, 'mobiles', '0723391494', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(424, 232, 'membertype', 'Principal', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(425, 232, 'searchpatienttype', 'OutPatient', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(426, 232, 'locationname', 'Lifecare Hospitals-Migori ( A Unit of AfriHospital Holdings Limited)', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(427, 232, 'recent_visit_date', '11-01-2021  10:48:00', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(428, 232, 'clientschema', 'AON MAKL-TSC-MIGORI', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(429, 232, 'company', '1', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(430, 232, 'company_location', 'Lifecare Migori', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(431, 232, 'patient_type', 'InPatient', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(432, 232, 'service', '8', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(433, 232, 'service_issue', 'Uniform', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(434, 232, 'reported_via', '2', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(435, 232, 'files', '', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(436, 233, 'patientfullname', 'DALMAS OMOLLO OUMA', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(437, 233, 'memberno', '450077', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(438, 233, 'mobiles', '0719365757', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(439, 233, 'membertype', 'Principal', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(440, 233, 'searchpatienttype', 'OutPatient', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(441, 233, 'locationname', '', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(442, 233, 'recent_visit_date', '08-10-2021  08:51:00', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(443, 233, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(444, 233, 'company', '1', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(445, 233, 'company_location', 'Lifecare Migori', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(446, 233, 'patient_type', 'OutPatient', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(447, 233, 'service', '5', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(448, 233, 'service_issue', 'Delayed Doctor Appointment', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(449, 233, 'reported_via', '2', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(450, 233, 'files', '', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(451, 234, 'patientfullname', 'JAMES WAMAGATA NGUGI', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(452, 234, 'memberno', '', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(453, 234, 'mobiles', '0721819035', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(454, 234, 'membertype', 'Principal', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(455, 234, 'searchpatienttype', 'OutPatient', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(456, 234, 'locationname', '', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(457, 234, 'recent_visit_date', '26-10-2021  10:14:00', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(458, 234, 'clientschema', 'CASH - HOSPITAL', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(459, 234, 'company', '1', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(460, 234, 'company_location', 'Lifecare Kikuyu', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(461, 234, 'patient_type', 'OutPatient', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(462, 234, 'service', '8', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(463, 234, 'service_issue', 'Facility Maintainance', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(464, 234, 'reported_via', '2', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(465, 234, 'files', '', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(466, 235, 'patientfullname', 'IVY MWANIKI WANJIRU', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(467, 235, 'memberno', '337837', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(468, 235, 'mobiles', '0722658400', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(469, 235, 'membertype', 'Principal', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(470, 235, 'searchpatienttype', 'OutPatient', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(471, 235, 'locationname', '', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(472, 235, 'recent_visit_date', '25-10-2021  14:22:00', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(473, 235, 'clientschema', 'AON MAKL-TSC', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(474, 235, 'company', '1', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(475, 235, 'company_location', 'Lifecare Kikuyu', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(476, 235, 'patient_type', 'InPatient', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(477, 235, 'service', '25', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(478, 235, 'service_issue', 'Billing- Medical-Bills', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(479, 235, 'reported_via', '2', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(480, 235, 'files', '', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(481, 238, 'patientfullname', 'EVERLYNE OKISAI ', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(482, 238, 'memberno', '538165', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(483, 238, 'mobiles', '0720744627', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(484, 238, 'membertype', 'Principal', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(485, 238, 'searchpatienttype', 'OutPatient', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(486, 238, 'locationname', '', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(487, 238, 'recent_visit_date', '23-10-2021  14:16:00', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(488, 238, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(489, 238, 'company', '1', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(490, 238, 'company_location', 'Lifecare Bungoma', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(491, 238, 'patient_type', 'OutPatient', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(492, 238, 'service', '5', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(493, 238, 'service_issue', 'No improvement on treatment', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(494, 238, 'reported_via', '2', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(495, 238, 'files', '', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(496, 239, 'patientfullname', 'MARGARET ANYANGO OKUKU', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(497, 239, 'memberno', '246831', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(498, 239, 'mobiles', '0721825247', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(499, 239, 'membertype', 'Dependent', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(500, 239, 'searchpatienttype', 'OutPatient', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(501, 239, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(502, 239, 'recent_visit_date', '26-10-2021  11:36:00', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(503, 239, 'clientschema', 'AON MAKL-TSC', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(504, 239, 'company', '1', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(505, 239, 'company_location', 'Lifecare Bungoma', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(506, 239, 'patient_type', 'OutPatient', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(507, 239, 'service', '8', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(508, 239, 'service_issue', 'Long Stay of Patients', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(509, 239, 'reported_via', '1', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(510, 239, 'files', '', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(511, 240, 'patientfullname', 'ARIANNA ANN PAMBA', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(512, 240, 'memberno', '540779', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(513, 240, 'mobiles', '0715850062', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(514, 240, 'membertype', 'Principal', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(515, 240, 'searchpatienttype', 'OutPatient', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(516, 240, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(517, 240, 'recent_visit_date', '10-05-2019  14:51:00', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(518, 240, 'clientschema', 'AON MAKL-TSC', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(519, 240, 'company', '1', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(520, 240, 'company_location', 'Lifecare Bungoma', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(521, 240, 'patient_type', 'InPatient', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(522, 240, 'service', '8', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(523, 240, 'service_issue', 'Bad Attitude  by Staff', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(524, 240, 'reported_via', '2', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(525, 240, 'files', '', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(526, 241, 'patientfullname', 'ELA NEKESA NEKESA', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(527, 241, 'memberno', '541710', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(528, 241, 'mobiles', '0724074046', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(529, 241, 'membertype', 'Principal', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(530, 241, 'searchpatienttype', 'OutPatient', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(531, 241, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(532, 241, 'recent_visit_date', '10-02-2021  16:31:00', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(533, 241, 'clientschema', 'AON MAKL-TSC', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(534, 241, 'company', '1', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(535, 241, 'company_location', 'Lifecare Bungoma', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(536, 241, 'patient_type', 'InPatient', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(537, 241, 'service', '17', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(538, 241, 'service_issue', 'Delayed Admission', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(539, 241, 'reported_via', '1', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(540, 241, 'files', '', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(541, 242, 'patientfullname', 'HEDWICK AKUMU ', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(542, 242, 'memberno', '426751', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(543, 242, 'mobiles', '710389791', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(544, 242, 'membertype', 'Principal', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(545, 242, 'searchpatienttype', 'OutPatient', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(546, 242, 'locationname', '', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(547, 242, 'recent_visit_date', '27-10-2021  12:42:00', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(548, 242, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(549, 242, 'company', '1', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(550, 242, 'company_location', 'Lifecare Bungoma', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(551, 242, 'patient_type', 'OutPatient', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(552, 242, 'service', '5', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(553, 242, 'service_issue', 'Delayed Doctor Appointment', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(554, 242, 'reported_via', '2', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(555, 242, 'files', '', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(556, 243, 'patientfullname', 'MERCY MAXWELL AGEMA', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(557, 243, 'memberno', '', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(558, 243, 'mobiles', '0717095229', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(559, 243, 'membertype', 'Principal', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(560, 243, 'searchpatienttype', 'OutPatient', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(561, 243, 'locationname', '', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(562, 243, 'recent_visit_date', '27-10-2021  14:42:00', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(563, 243, 'clientschema', 'CASH - HOSPITAL', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(564, 243, 'company', '1', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(565, 243, 'company_location', 'Lifecare Bungoma', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(566, 243, 'patient_type', 'OutPatient', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(567, 243, 'service', '5', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(568, 243, 'service_issue', 'Delayed Doctor Appointment', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(569, 243, 'reported_via', '2', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(570, 243, 'files', '', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(571, 244, 'patientfullname', 'EUGENE ODHIAMBO OCHUODHO', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(572, 244, 'memberno', '565943', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(573, 244, 'mobiles', '0727670911', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(574, 244, 'membertype', 'Dependent', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(575, 244, 'searchpatienttype', 'OutPatient', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(576, 244, 'locationname', '', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(577, 244, 'recent_visit_date', '30-03-2021  14:06:00', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(578, 244, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(579, 244, 'company', '1', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(580, 244, 'company_location', 'Lifecare Migori', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(581, 244, 'patient_type', 'OutPatient', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(582, 244, 'service', '5', '2021-10-27 15:09:08', '2021-10-27 15:09:08');
INSERT INTO `ticket_form_data` (`id`, `ticket_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(583, 244, 'service_issue', 'Delayed Doctor Appointment', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(584, 244, 'reported_via', '2', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(585, 244, 'files', '', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(586, 245, 'patientfullname', 'GERALD OPIR IGNATIUS', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(587, 245, 'memberno', '520498', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(588, 245, 'mobiles', '0725687465', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(589, 245, 'membertype', 'Principal', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(590, 245, 'searchpatienttype', 'OutPatient', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(591, 245, 'locationname', 'Lifecare Hospitals-Migori ( A Unit of AfriHospital Holdings Limited)', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(592, 245, 'recent_visit_date', '19-02-2021  16:13:00', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(593, 245, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME-MIGORI.', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(594, 245, 'company', '1', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(595, 245, 'company_location', 'Lifecare Migori', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(596, 245, 'patient_type', 'OutPatient', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(597, 245, 'service', '21', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(598, 245, 'service_issue', 'Delays In Service Delivery', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(599, 245, 'reported_via', '2', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(600, 245, 'files', '', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(601, 246, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(602, 246, 'memberno', '', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(603, 246, 'mobiles', '0715556316', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(604, 246, 'membertype', 'Principal', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(605, 246, 'searchpatienttype', 'InPatient', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(606, 246, 'locationname', '', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(607, 246, 'recent_visit_date', '28-05-2021  11:41:00', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(608, 246, 'clientschema', 'CASH - HOSPITAL', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(609, 246, 'company', '1', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(610, 246, 'company_location', 'Lifecare Kikuyu', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(611, 246, 'patient_type', 'InPatient', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(612, 246, 'service', '24', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(613, 246, 'service_issue', 'Billing Query', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(614, 246, 'reported_via', '2', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(615, 246, 'files', '', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(616, 254, 'patientfullname', 'ONYANGO SHADRACK MAINA', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(617, 254, 'memberno', '470440', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(618, 254, 'mobiles', '721858262', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(619, 254, 'membertype', 'Principal', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(620, 254, 'searchpatienttype', 'OutPatient', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(621, 254, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(622, 254, 'recent_visit_date', '11-05-2020  07:27:00', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(623, 254, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(624, 254, 'company', '1', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(625, 254, 'company_location', 'Lifecare Bungoma', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(626, 254, 'patient_type', 'OutPatient', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(627, 254, 'service', '24', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(628, 254, 'service_issue', 'Refunds', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(629, 254, 'reported_via', '1', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(630, 254, 'files', '', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(631, 255, 'patientfullname', 'ONYANGO SHADRACK MAINA', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(632, 255, 'memberno', '470440', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(633, 255, 'mobiles', '721858262', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(634, 255, 'membertype', 'Principal', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(635, 255, 'searchpatienttype', 'OutPatient', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(636, 255, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(637, 255, 'recent_visit_date', '07-04-2020  12:38:00', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(638, 255, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(639, 255, 'company', '1', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(640, 255, 'company_location', 'Lifecare Bungoma', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(641, 255, 'patient_type', 'OutPatient', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(642, 255, 'service', '10', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(643, 255, 'service_issue', 'No Dental Services', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(644, 255, 'reported_via', '6', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(645, 255, 'files', '', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(646, 256, 'patientfullname', 'ONYANGO SHADRACK MAINA', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(647, 256, 'memberno', '470440', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(648, 256, 'mobiles', '721858262', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(649, 256, 'membertype', 'Principal', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(650, 256, 'searchpatienttype', 'OutPatient', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(651, 256, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(652, 256, 'recent_visit_date', '11-05-2020  07:27:00', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(653, 256, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(654, 256, 'company', '1', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(655, 256, 'company_location', 'Lifecare Bungoma', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(656, 256, 'patient_type', 'OutPatient', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(657, 256, 'service', '10', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(658, 256, 'service_issue', 'Delayed Appointment', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(659, 256, 'reported_via', '1', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(660, 256, 'files', '', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(661, 257, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(662, 257, 'memberno', '', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(663, 257, 'mobiles', '0715556316', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(664, 257, 'membertype', 'Principal', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(665, 257, 'searchpatienttype', 'InPatient', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(666, 257, 'locationname', '', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(667, 257, 'recent_visit_date', '28-05-2021  11:41:00', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(668, 257, 'clientschema', 'CASH - HOSPITAL', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(669, 257, 'company', '1', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(670, 257, 'company_location', 'Lifecare Kikuyu', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(671, 257, 'patient_type', 'OutPatient', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(672, 257, 'service', '4', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(673, 257, 'service_issue', 'Delayed Results', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(674, 257, 'reported_via', '8', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(675, 257, 'files', '', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(676, 258, 'patientfullname', 'HAZEL ATIENO OWILI', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(677, 258, 'memberno', '0760866', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(678, 258, 'mobiles', '0720969056', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(679, 258, 'membertype', 'Principal', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(680, 258, 'searchpatienttype', 'OutPatient', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(681, 258, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(682, 258, 'recent_visit_date', '06-10-2020  11:46:00', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(683, 258, 'clientschema', 'NHIF INSURANCE', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(684, 258, 'company', '1', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(685, 258, 'company_location', 'Lifecare Bungoma', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(686, 258, 'patient_type', 'OutPatient', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(687, 258, 'service', '24', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(688, 258, 'service_issue', 'Refunds', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(689, 258, 'reported_via', '3', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(690, 258, 'files', '', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(691, 259, 'patientfullname', 'HAZEL ATIENO OWILI', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(692, 259, 'memberno', '0760866', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(693, 259, 'mobiles', '0720969056', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(694, 259, 'membertype', 'Principal', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(695, 259, 'searchpatienttype', 'OutPatient', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(696, 259, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(697, 259, 'recent_visit_date', '06-10-2020  11:46:00', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(698, 259, 'clientschema', 'NHIF INSURANCE', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(699, 259, 'company', '1', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(700, 259, 'company_location', 'Lifecare Migori', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(701, 259, 'patient_type', 'InPatient', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(702, 259, 'service', '25', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(703, 259, 'service_issue', 'Billing - Last-Expense', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(704, 259, 'reported_via', '1', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(705, 259, 'files', '', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(706, 260, 'patientfullname', 'HAZEL ATIENO OWILI', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(707, 260, 'memberno', '0760866', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(708, 260, 'mobiles', '0720969056', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(709, 260, 'membertype', 'Principal', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(710, 260, 'searchpatienttype', 'OutPatient', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(711, 260, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(712, 260, 'recent_visit_date', '06-10-2020  11:46:00', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(713, 260, 'clientschema', 'NHIF INSURANCE', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(714, 260, 'company', '1', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(715, 260, 'company_location', 'Lifecare Bungoma', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(716, 260, 'patient_type', 'OutPatient', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(717, 260, 'service', '4', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(718, 260, 'service_issue', 'Lack of Specimen Holder\r\n', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(719, 260, 'reported_via', '1', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(720, 260, 'files', '', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(721, 262, 'patientfullname', 'AMORELLE ANINDO ', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(722, 262, 'memberno', '479911', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(723, 262, 'mobiles', '712664330', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(724, 262, 'membertype', 'Principal', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(725, 262, 'searchpatienttype', 'OutPatient', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(726, 262, 'locationname', 'LifeCare Hospitals - Bungoma', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(727, 262, 'recent_visit_date', '07-12-2019  10:58:00', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(728, 262, 'clientschema', 'MAKL-TSC OUTPATIENT SCHEME', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(729, 262, 'company', '1', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(730, 262, 'company_location', 'Lifecare Bungoma', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(731, 262, 'patient_type', 'OutPatient', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(732, 262, 'service', '25', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(733, 262, 'service_issue', 'Eligibility', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(734, 262, 'reported_via', '4', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(735, 262, 'files', '', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(736, 263, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(737, 263, 'memberno', '', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(738, 263, 'mobiles', '0715556316', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(739, 263, 'membertype', 'Principal', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(740, 263, 'searchpatienttype', 'InPatient', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(741, 263, 'locationname', '', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(742, 263, 'recent_visit_date', '28-05-2021  11:41:00', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(743, 263, 'clientschema', 'CASH - HOSPITAL', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(744, 263, 'company', '1', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(745, 263, 'company_location', 'Lifecare Bungoma', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(746, 263, 'patient_type', 'OutPatient', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(747, 263, 'service', '10', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(748, 263, 'service_issue', 'Delayed Appointment', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(749, 263, 'reported_via', '1', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(750, 263, 'files', '', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(751, 264, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(752, 264, 'memberno', '', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(753, 264, 'mobiles', '0715556316', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(754, 264, 'membertype', 'Principal', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(755, 264, 'searchpatienttype', 'InPatient', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(756, 264, 'locationname', '', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(757, 264, 'recent_visit_date', '28-05-2021  11:41:00', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(758, 264, 'clientschema', 'CASH - HOSPITAL', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(759, 264, 'company', '1', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(760, 264, 'company_location', 'Lifecare Bungoma', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(761, 264, 'patient_type', 'InPatient', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(762, 264, 'service', '22', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(763, 264, 'service_issue', 'Laundry', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(764, 264, 'reported_via', '1', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(765, 264, 'files', '', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(766, 265, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(767, 265, 'memberno', '', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(768, 265, 'mobiles', '0715556316', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(769, 265, 'membertype', 'Principal', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(770, 265, 'searchpatienttype', 'InPatient', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(771, 265, 'locationname', '', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(772, 265, 'recent_visit_date', '28-05-2021  11:41:00', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(773, 265, 'clientschema', 'CASH - HOSPITAL', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(774, 265, 'company', '1', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(775, 265, 'company_location', 'Lifecare Bungoma', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(776, 265, 'patient_type', 'OutPatient', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(777, 265, 'service', '25', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(778, 265, 'service_issue', 'Ambulance', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(779, 265, 'reported_via', '1', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(780, 265, 'files', '', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(781, 266, 'patientfullname', 'CATHERINE NEKESA WANYAMA', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(782, 266, 'memberno', '', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(783, 266, 'mobiles', '0715556316', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(784, 266, 'membertype', 'Principal', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(785, 266, 'searchpatienttype', 'InPatient', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(786, 266, 'locationname', '', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(787, 266, 'recent_visit_date', '28-05-2021  11:41:00', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(788, 266, 'clientschema', 'CASH - HOSPITAL', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(789, 266, 'company', '1', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(790, 266, 'company_location', 'Lifecare Bungoma', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(791, 266, 'patient_type', 'OutPatient', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(792, 266, 'service', '4', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(793, 266, 'service_issue', 'Lack of Specimen Holder', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(794, 266, 'reported_via', '1', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(795, 266, 'files', '', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(796, 267, 'patientfullname', 'Peris chepkemoi', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(797, 267, 'memberno', '12172', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(798, 267, 'mobiles', '0727226387', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(799, 267, 'membertype', 'Principal', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(800, 267, 'locationname', 'Mombasa', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(801, 267, 'recent_visit_date', '10/01/2022', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(802, 267, 'clientschema', 'Healthier kenya', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(803, 267, 'company', '1', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(804, 267, 'company_location', 'MARALAL', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(805, 267, 'service', '2', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(806, 267, 'service_issue', 'Lack of drugs', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(807, 267, 'reported_via', '1', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(808, 267, 'files', '', '2022-01-12 14:56:20', '2022-01-12 14:56:20'),
(809, 268, 'patientfullname', 'Peris chepkemoi', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(810, 268, 'memberno', '12172', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(811, 268, 'mobiles', '0727226387', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(812, 268, 'membertype', 'Principal', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(813, 268, 'locationname', 'Mombasa', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(814, 268, 'recent_visit_date', '10/01/2022', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(815, 268, 'clientschema', 'Healthier kenya', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(816, 268, 'company', '1', '2022-01-12 14:58:38', '2022-01-12 14:58:38'),
(817, 268, 'company_location', 'MERU', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(818, 268, 'service', '6', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(819, 268, 'service_issue', 'Wrong Diagnosis', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(820, 268, 'reported_via', '1', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(821, 268, 'files', '', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(822, 269, 'patientfullname', 'Peris chepkemoi', '2022-01-13 06:32:41', '2022-01-13 06:32:41'),
(823, 269, 'memberno', '12172', '2022-01-13 06:32:41', '2022-01-13 06:32:41'),
(824, 269, 'mobiles', '0727226387', '2022-01-13 06:32:41', '2022-01-13 06:32:41'),
(825, 269, 'membertype', 'Principal', '2022-01-13 06:32:41', '2022-01-13 06:32:41'),
(826, 269, 'locationname', 'Mombasa', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(827, 269, 'recent_visit_date', '10/01/2022', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(828, 269, 'clientschema', 'Healthier kenya', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(829, 269, 'company', '1', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(830, 269, 'company_location', 'GARISSA', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(831, 269, 'service', '3', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(832, 269, 'service_issue', 'No Radiology Services', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(833, 269, 'reported_via', '1', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(834, 269, 'files', '', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(835, 270, 'patientfullname', 'Peris chepkemoi', '2022-01-13 09:24:19', '2022-01-13 09:24:19'),
(836, 270, 'memberno', '12172', '2022-01-13 09:24:19', '2022-01-13 09:24:19'),
(837, 270, 'mobiles', '0727226387', '2022-01-13 09:24:19', '2022-01-13 09:24:19'),
(838, 270, 'membertype', 'Principal', '2022-01-13 09:24:19', '2022-01-13 09:24:19'),
(839, 270, 'locationname', 'Mombasa', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(840, 270, 'recent_visit_date', '10/01/2022', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(841, 270, 'clientschema', 'Healthier kenya', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(842, 270, 'company', '1', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(843, 270, 'company_location', 'ELDORET ZION MALL', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(844, 270, 'service', '5', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(845, 270, 'service_issue', 'No Dental Services', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(846, 270, 'reported_via', '1', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(847, 270, 'files', '', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(848, 271, 'patientfullname', 'Peris chepkemoi', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(849, 271, 'memberno', '12172', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(850, 271, 'mobiles', '0727226387', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(851, 271, 'membertype', 'Principal', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(852, 271, 'locationname', 'Mombasa', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(853, 271, 'recent_visit_date', '10/01/2022', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(854, 271, 'clientschema', 'Healthier kenya', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(855, 271, 'company', '1', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(856, 271, 'company_location', 'KISUMU AL IMRAN', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(857, 271, 'service', '8', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(858, 271, 'service_issue', 'Package inquiry', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(859, 271, 'reported_via', '8', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(860, 271, 'files', '', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(861, 272, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:11:34', '2022-01-13 11:11:34'),
(862, 272, 'memberno', '12172', '2022-01-13 11:11:34', '2022-01-13 11:11:34'),
(863, 272, 'mobiles', '0727226387', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(864, 272, 'membertype', 'Principal', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(865, 272, 'locationname', 'Mombasa', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(866, 272, 'recent_visit_date', '10/01/2022', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(867, 272, 'clientschema', 'Healthier kenya', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(868, 272, 'company', '1', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(869, 272, 'company_location', 'NANYUKI', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(870, 272, 'service', '8', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(871, 272, 'service_issue', 'Package Complaints', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(872, 272, 'reported_via', '1', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(873, 272, 'files', '', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(874, 273, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(875, 273, 'memberno', '12172', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(876, 273, 'mobiles', '0727226387', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(877, 273, 'membertype', 'Principal', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(878, 273, 'locationname', 'Mombasa', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(879, 273, 'recent_visit_date', '10/01/2022', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(880, 273, 'clientschema', 'Healthier kenya', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(881, 273, 'company', '1', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(882, 273, 'company_location', 'WESTLANDS', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(883, 273, 'service', '6', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(884, 273, 'service_issue', 'Drug Reaction', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(885, 273, 'reported_via', '1', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(886, 273, 'files', '', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(887, 274, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(888, 274, 'memberno', '12172', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(889, 274, 'mobiles', '0727226387', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(890, 274, 'membertype', 'Principal', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(891, 274, 'locationname', 'Mombasa', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(892, 274, 'recent_visit_date', '10/01/2022', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(893, 274, 'clientschema', 'Healthier kenya', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(894, 274, 'company', '1', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(895, 274, 'company_location', 'KERUGOYA', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(896, 274, 'service', '3', '2022-01-13 11:37:51', '2022-01-13 11:37:51'),
(897, 274, 'service_issue', 'No Radiology Services', '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(898, 274, 'reported_via', '1', '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(899, 274, 'files', '', '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(900, 275, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(901, 275, 'memberno', '12172', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(902, 275, 'mobiles', '0727226387', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(903, 275, 'membertype', 'Principal', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(904, 275, 'locationname', 'Mombasa', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(905, 275, 'recent_visit_date', '10/01/2022', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(906, 275, 'clientschema', 'Healthier kenya', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(907, 275, 'company', '1', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(908, 275, 'company_location', 'MALINDI', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(909, 275, 'service', '3', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(910, 275, 'service_issue', 'Equipment/ Machine', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(911, 275, 'reported_via', '1', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(912, 275, 'files', '', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(913, 276, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(914, 276, 'memberno', '12172', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(915, 276, 'mobiles', '0727226387', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(916, 276, 'membertype', 'Principal', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(917, 276, 'locationname', 'Mombasa', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(918, 276, 'recent_visit_date', '10/01/2022', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(919, 276, 'clientschema', 'Healthier kenya', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(920, 276, 'company', '1', '2022-01-13 11:41:39', '2022-01-13 11:41:39'),
(921, 276, 'company_location', 'KIZINGO', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(922, 276, 'service', '2', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(923, 276, 'service_issue', 'Lack of drugs', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(924, 276, 'reported_via', '1', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(925, 276, 'files', '', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(926, 277, 'patientfullname', 'Peris chepkemoi', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(927, 277, 'memberno', '12172', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(928, 277, 'mobiles', '0727226387', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(929, 277, 'membertype', 'Principal', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(930, 277, 'locationname', 'Mombasa', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(931, 277, 'recent_visit_date', '10/01/2022', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(932, 277, 'clientschema', 'Healthier kenya', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(933, 277, 'company', '1', '2022-01-13 11:46:32', '2022-01-13 11:46:32'),
(934, 277, 'company_location', 'MBALE', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(935, 277, 'service', '1', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(936, 277, 'service_issue', 'Wrong Lenses', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(937, 277, 'reported_via', '1', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(938, 277, 'files', '', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(939, 278, 'patientfullname', 'Peris chepkemoi', '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(940, 278, 'memberno', '12172', '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(941, 278, 'mobiles', '0727226387', '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(942, 278, 'membertype', 'Principal', '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(943, 278, 'locationname', 'Mombasa', '2022-01-14 12:01:50', '2022-01-14 12:01:50'),
(944, 278, 'recent_visit_date', '10/01/2022', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(945, 278, 'clientschema', 'Healthier kenya', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(946, 278, 'company', '1', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(947, 278, 'company_location', 'DIANI BLISS', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(948, 278, 'service', '2', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(949, 278, 'service_issue', 'Incomplete dose', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(950, 278, 'reported_via', '1', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(951, 278, 'files', '', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(952, 279, 'patientfullname', 'Peris chepkemoi', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(953, 279, 'memberno', '12172', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(954, 279, 'mobiles', '0727226387', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(955, 279, 'membertype', 'Principal', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(956, 279, 'locationname', 'Mombasa', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(957, 279, 'recent_visit_date', '10/01/2022', '2022-01-14 13:31:41', '2022-01-14 13:31:41'),
(958, 279, 'clientschema', 'Healthier kenya', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(959, 279, 'company', '1', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(960, 279, 'company_location', 'MERU', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(961, 279, 'service', '2', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(962, 279, 'service_issue', 'Incomplete dose', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(963, 279, 'reported_via', '1', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(964, 279, 'files', '', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(965, 280, 'patientfullname', 'Peris chepkemoi', '2022-01-15 15:41:47', '2022-01-15 15:41:47'),
(966, 280, 'memberno', '12172', '2022-01-15 15:41:47', '2022-01-15 15:41:47'),
(967, 280, 'mobiles', '0727226387', '2022-01-15 15:41:47', '2022-01-15 15:41:47'),
(968, 280, 'membertype', 'Principal', '2022-01-15 15:41:47', '2022-01-15 15:41:47'),
(969, 280, 'locationname', 'Mombasa', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(970, 280, 'recent_visit_date', '10/01/2022', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(971, 280, 'clientschema', 'Healthier kenya', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(972, 280, 'company', '1', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(973, 280, 'company_location', 'PANARI NYAHURURU', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(974, 280, 'service', '6', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(975, 280, 'service_issue', 'Treatment Errors', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(976, 280, 'reported_via', '4', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(977, 280, 'files', '', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(978, 281, 'patientfullname', 'Peris chepkemoi', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(979, 281, 'memberno', '12172', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(980, 281, 'mobiles', '0727226387', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(981, 281, 'membertype', 'Principal', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(982, 281, 'locationname', 'Mombasa', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(983, 281, 'recent_visit_date', '10/01/2022', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(984, 281, 'clientschema', 'Healthier kenya', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(985, 281, 'company', '1', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(986, 281, 'company_location', 'WINDSOR', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(987, 281, 'service', '2', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(988, 281, 'service_issue', 'Incomplete dose', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(989, 281, 'reported_via', '1', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(990, 281, 'files', '', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(991, 282, 'patientfullname', 'Peris chepkemoi', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(992, 282, 'memberno', '12172', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(993, 282, 'mobiles', '0727226387', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(994, 282, 'membertype', 'Principal', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(995, 282, 'locationname', 'Mombasa', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(996, 282, 'recent_visit_date', '10/01/2022', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(997, 282, 'clientschema', 'Healthier kenya', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(998, 282, 'company', '1', '2022-01-15 17:32:42', '2022-01-15 17:32:42'),
(999, 282, 'company_location', 'NAROK', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(1000, 282, 'service', '4', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(1001, 282, 'service_issue', 'Lack of Specimen Holder', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(1002, 282, 'reported_via', '1', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(1003, 282, 'files', '', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(1004, 283, 'patientfullname', 'Peris chepkemoi', '2022-01-15 17:39:41', '2022-01-15 17:39:41'),
(1005, 283, 'memberno', '12172', '2022-01-15 17:39:41', '2022-01-15 17:39:41'),
(1006, 283, 'mobiles', '0727226387', '2022-01-15 17:39:41', '2022-01-15 17:39:41'),
(1007, 283, 'membertype', 'Principal', '2022-01-15 17:39:41', '2022-01-15 17:39:41'),
(1008, 283, 'locationname', 'Mombasa', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1009, 283, 'recent_visit_date', '10/01/2022', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1010, 283, 'clientschema', 'Healthier kenya', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1011, 283, 'company', '1', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1012, 283, 'company_location', 'PANARI NYAHURURU', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1013, 283, 'service', '2', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1014, 283, 'service_issue', 'Lack of drugs', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1015, 283, 'reported_via', '1', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1016, 283, 'files', '', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(1017, 284, 'patientfullname', 'Peris chepkemoi', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1018, 284, 'memberno', '12172', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1019, 284, 'mobiles', '0727226387', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1020, 284, 'membertype', 'Principal', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1021, 284, 'locationname', 'Mombasa', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1022, 284, 'recent_visit_date', '10/01/2022', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1023, 284, 'clientschema', 'Healthier kenya', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1024, 284, 'company', '1', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1025, 284, 'company_location', 'KERUGOYA', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1026, 284, 'service', '4', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1027, 284, 'service_issue', 'Wrong Lab Results', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1028, 284, 'reported_via', '1', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1029, 284, 'files', '', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(1030, 285, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:00:42', '2022-01-17 09:00:42'),
(1031, 285, 'memberno', '12172', '2022-01-17 09:00:42', '2022-01-17 09:00:42'),
(1032, 285, 'mobiles', '0727226387', '2022-01-17 09:00:42', '2022-01-17 09:00:42'),
(1033, 285, 'membertype', 'Principal', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1034, 285, 'locationname', 'Mombasa', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1035, 285, 'recent_visit_date', '10/01/2022', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1036, 285, 'clientschema', 'Healthier kenya', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1037, 285, 'company', '1', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1038, 285, 'company_location', 'KIZINGO', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1039, 285, 'service', '2', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1040, 285, 'service_issue', 'Incomplete dose', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1041, 285, 'reported_via', '1', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1042, 285, 'files', '', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(1043, 286, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1044, 286, 'memberno', '12172', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1045, 286, 'mobiles', '0727226387', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1046, 286, 'membertype', 'Principal', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1047, 286, 'locationname', 'Mombasa', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1048, 286, 'recent_visit_date', '10/01/2022', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1049, 286, 'clientschema', 'Healthier kenya', '2022-01-17 09:03:20', '2022-01-17 09:03:20'),
(1050, 286, 'company', '1', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1051, 286, 'company_location', 'KIZINGO', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1052, 286, 'service', '1', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1053, 286, 'service_issue', 'Quality of frames', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1054, 286, 'reported_via', '1', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1055, 286, 'files', '', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(1056, 287, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:04:06', '2022-01-17 09:04:06'),
(1057, 287, 'memberno', '12172', '2022-01-17 09:04:06', '2022-01-17 09:04:06'),
(1058, 287, 'mobiles', '0727226387', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1059, 287, 'membertype', 'Principal', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1060, 287, 'locationname', 'Mombasa', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1061, 287, 'recent_visit_date', '10/01/2022', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1062, 287, 'clientschema', 'Healthier kenya', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1063, 287, 'company', '1', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1064, 287, 'company_location', 'NYERI 2', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1065, 287, 'service', '3', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1066, 287, 'service_issue', 'Delay in service delivery', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1067, 287, 'reported_via', '1', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1068, 287, 'files', '', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(1069, 288, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:04:50', '2022-01-17 09:04:50'),
(1070, 288, 'memberno', '12172', '2022-01-17 09:04:50', '2022-01-17 09:04:50'),
(1071, 288, 'mobiles', '0727226387', '2022-01-17 09:04:50', '2022-01-17 09:04:50'),
(1072, 288, 'membertype', 'Principal', '2022-01-17 09:04:50', '2022-01-17 09:04:50'),
(1073, 288, 'locationname', 'Mombasa', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1074, 288, 'recent_visit_date', '10/01/2022', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1075, 288, 'clientschema', 'Healthier kenya', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1076, 288, 'company', '1', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1077, 288, 'company_location', 'MALINDI', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1078, 288, 'service', '4', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1079, 288, 'service_issue', 'Lack of Specimen Holder', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1080, 288, 'reported_via', '3', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1081, 288, 'files', '', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(1082, 289, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1083, 289, 'memberno', '12172', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1084, 289, 'mobiles', '0727226387', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1085, 289, 'membertype', 'Principal', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1086, 289, 'locationname', 'Mombasa', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1087, 289, 'recent_visit_date', '10/01/2022', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1088, 289, 'clientschema', 'Healthier kenya', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1089, 289, 'company', '1', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1090, 289, 'company_location', 'KAPENGURIA', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1091, 289, 'service', '5', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1092, 289, 'service_issue', 'Equipment/ Machine', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1093, 289, 'reported_via', '1', '2022-01-17 09:05:25', '2022-01-17 09:05:25'),
(1094, 289, 'files', '', '2022-01-17 09:05:26', '2022-01-17 09:05:26'),
(1095, 290, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1096, 290, 'memberno', '12172', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1097, 290, 'mobiles', '0727226387', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1098, 290, 'membertype', 'Principal', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1099, 290, 'locationname', 'Mombasa', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1100, 290, 'recent_visit_date', '10/01/2022', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1101, 290, 'clientschema', 'Healthier kenya', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1102, 290, 'company', '1', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1103, 290, 'company_location', 'UMOJA', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1104, 290, 'service', '6', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1105, 290, 'service_issue', 'Wrong Diagnosis', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1106, 290, 'reported_via', '4', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1107, 290, 'files', '', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(1108, 291, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1109, 291, 'memberno', '12172', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1110, 291, 'mobiles', '0727226387', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1111, 291, 'membertype', 'Principal', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1112, 291, 'locationname', 'Mombasa', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1113, 291, 'recent_visit_date', '10/01/2022', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1114, 291, 'clientschema', 'Healthier kenya', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1115, 291, 'company', '1', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1116, 291, 'company_location', 'NAKURU', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1117, 291, 'service', '7', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1118, 291, 'service_issue', 'Staff incompetence', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1119, 291, 'reported_via', '4', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1120, 291, 'files', '', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(1121, 292, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1122, 292, 'memberno', '12172', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1123, 292, 'mobiles', '0727226387', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1124, 292, 'membertype', 'Principal', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1125, 292, 'locationname', 'Mombasa', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1126, 292, 'recent_visit_date', '10/01/2022', '2022-01-17 09:07:39', '2022-01-17 09:07:39'),
(1127, 292, 'clientschema', 'Healthier kenya', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1128, 292, 'company', '1', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1129, 292, 'company_location', 'MURANG\'A', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1130, 292, 'service', '8', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1131, 292, 'service_issue', 'Package Complaints', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1132, 292, 'reported_via', '1', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1133, 292, 'files', '', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(1134, 293, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:08:01', '2022-01-17 09:08:01'),
(1135, 293, 'memberno', '12172', '2022-01-17 09:08:01', '2022-01-17 09:08:01'),
(1136, 293, 'mobiles', '0727226387', '2022-01-17 09:08:01', '2022-01-17 09:08:01'),
(1137, 293, 'membertype', 'Principal', '2022-01-17 09:08:01', '2022-01-17 09:08:01'),
(1138, 293, 'locationname', 'Mombasa', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1139, 293, 'recent_visit_date', '10/01/2022', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1140, 293, 'clientschema', 'Healthier kenya', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1141, 293, 'company', '1', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1142, 293, 'company_location', 'JUJA MALL', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1143, 293, 'service', '9', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1144, 293, 'service_issue', 'Abnormal Bills', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1145, 293, 'reported_via', '1', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1146, 293, 'files', '', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(1147, 294, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1148, 294, 'memberno', '12172', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1149, 294, 'mobiles', '0727226387', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1150, 294, 'membertype', 'Principal', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1151, 294, 'locationname', 'Mombasa', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1152, 294, 'recent_visit_date', '10/01/2022', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1153, 294, 'clientschema', 'Healthier kenya', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1154, 294, 'company', '1', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1155, 294, 'company_location', 'MAUA', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1156, 294, 'service', '10', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1157, 294, 'service_issue', 'Staff Grooming', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1158, 294, 'reported_via', '1', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1159, 294, 'files', '', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(1160, 295, 'patientfullname', 'Peris chepkemoi', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1161, 295, 'memberno', '12172', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1162, 295, 'mobiles', '0727226387', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1163, 295, 'membertype', 'Principal', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1164, 295, 'locationname', 'Mombasa', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1165, 295, 'recent_visit_date', '10/01/2022', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1166, 295, 'clientschema', 'Healthier kenya', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1167, 295, 'company', '1', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1168, 295, 'company_location', 'MTWAPA', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1169, 295, 'service', '6', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1170, 295, 'service_issue', 'Delayed Doctor Appointment', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1171, 295, 'reported_via', '1', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1172, 295, 'files', '', '2022-01-17 09:25:13', '2022-01-17 09:25:13'),
(1173, 296, 'patientfullname', 'Peris chepkemoi', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1174, 296, 'memberno', '12172', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1175, 296, 'mobiles', '0727226387', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1176, 296, 'membertype', 'Principal', '2022-01-17 10:10:49', '2022-01-17 10:10:49');
INSERT INTO `ticket_form_data` (`id`, `ticket_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1177, 296, 'locationname', 'Mombasa', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1178, 296, 'recent_visit_date', '10/01/2022', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1179, 296, 'clientschema', 'Healthier kenya', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1180, 296, 'company', '1', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1181, 296, 'company_location', 'PANARI NYAHURURU', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1182, 296, 'service', '11', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1183, 296, 'service_issue', 'Facility Hygiene and Tidiness', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1184, 296, 'reported_via', '1', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1185, 296, 'files', '', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(1186, 297, 'patientfullname', 'Peris chepkemoi', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1187, 297, 'memberno', '12172', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1188, 297, 'mobiles', '0727226387', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1189, 297, 'membertype', 'Principal', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1190, 297, 'locationname', 'Mombasa', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1191, 297, 'recent_visit_date', '10/01/2022', '2022-01-17 11:16:41', '2022-01-17 11:16:41'),
(1192, 297, 'clientschema', 'Healthier kenya', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1193, 297, 'company', '1', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1194, 297, 'company_location', 'OLKALOU', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1195, 297, 'service', '12', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1196, 297, 'service_issue', 'Billing-Medical-Bills', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1197, 297, 'reported_via', '1', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1198, 297, 'files', '', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(1199, 298, 'patientfullname', 'Peris chepkemoi', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1200, 298, 'memberno', '12172', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1201, 298, 'mobiles', '0727226387', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1202, 298, 'membertype', 'Principal', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1203, 298, 'locationname', 'Mombasa', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1204, 298, 'recent_visit_date', '10/01/2022', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1205, 298, 'clientschema', 'Healthier kenya', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1206, 298, 'company', '1', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1207, 298, 'company_location', 'MTWAPA', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1208, 298, 'service', '6', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1209, 298, 'service_issue', 'Delayed Doctor Appointment', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1210, 298, 'reported_via', '1', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1211, 298, 'files', '', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(1212, 299, 'patientfullname', 'Peris chepkemoi', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1213, 299, 'memberno', '12172', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1214, 299, 'mobiles', '0727226387', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1215, 299, 'membertype', 'Principal', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1216, 299, 'locationname', 'Mombasa', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1217, 299, 'recent_visit_date', '10/01/2022', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1218, 299, 'clientschema', 'Healthier kenya', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1219, 299, 'company', '1', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1220, 299, 'company_location', 'JUJA MALL', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1221, 299, 'service', '9', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1222, 299, 'service_issue', 'Abnormal Bills', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1223, 299, 'reported_via', '6', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1224, 299, 'files', '', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(1225, 300, 'patientfullname', 'Peris chepkemoi', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1226, 300, 'memberno', '12172', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1227, 300, 'mobiles', '0727226387', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1228, 300, 'membertype', 'Principal', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1229, 300, 'locationname', 'Mombasa', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1230, 300, 'recent_visit_date', '10/01/2022', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1231, 300, 'clientschema', 'Healthier kenya', '2022-01-18 08:23:53', '2022-01-18 08:23:53'),
(1232, 300, 'company', '1', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1233, 300, 'company_location', 'NYERI 1', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1234, 300, 'service', '3', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1235, 300, 'service_issue', 'No Radiology Services', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1236, 300, 'reported_via', '1', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1237, 300, 'files', '', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(1238, 301, 'patientfullname', 'test patient', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1239, 301, 'memberno', '12345', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1240, 301, 'mobiles', '0721569874', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1241, 301, 'membertype', 'Principal', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1242, 301, 'locationname', 'Mombasa', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1243, 301, 'recent_visit_date', '10/01/2022', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1244, 301, 'clientschema', 'Healthier kenya', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1245, 301, 'company', '1', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1246, 301, 'company_location', 'MALINDI', '2022-01-19 09:48:12', '2022-01-19 09:48:12'),
(1247, 301, 'service', '12', '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(1248, 301, 'service_issue', 'Billing-Member-Limits', '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(1249, 301, 'reported_via', '1', '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(1250, 301, 'files', '', '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(1251, 302, 'patientfullname', 'test patient', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1252, 302, 'memberno', '12345', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1253, 302, 'mobiles', '0721569874', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1254, 302, 'membertype', 'Principal', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1255, 302, 'locationname', 'Mombasa', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1256, 302, 'recent_visit_date', '10/01/2022', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1257, 302, 'clientschema', 'Healthier kenya', '2022-01-19 09:50:09', '2022-01-19 09:50:09'),
(1258, 302, 'company', '1', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1259, 302, 'company_location', 'KERUGOYA', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1260, 302, 'service', '5', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1261, 302, 'service_issue', 'Equipment/ Machine', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1262, 302, 'reported_via', '1', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1263, 302, 'files', '', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(1264, 303, 'patientfullname', 'test patient', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1265, 303, 'memberno', '12345', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1266, 303, 'mobiles', '0721569874', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1267, 303, 'membertype', 'Principal', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1268, 303, 'locationname', 'Mombasa', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1269, 303, 'recent_visit_date', '10/01/2022', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1270, 303, 'clientschema', 'Healthier kenya', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1271, 303, 'company', '1', '2022-01-19 09:57:25', '2022-01-19 09:57:25'),
(1272, 303, 'company_location', 'MALINDI', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(1273, 303, 'service', '11', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(1274, 303, 'service_issue', 'Facility Maintenance', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(1275, 303, 'reported_via', '1', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(1276, 303, 'files', '', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(1277, 304, 'patientfullname', 'test patient', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1278, 304, 'memberno', '12345', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1279, 304, 'mobiles', '0721569874', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1280, 304, 'membertype', 'Principal', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1281, 304, 'locationname', 'Mombasa', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1282, 304, 'recent_visit_date', '10/01/2022', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1283, 304, 'clientschema', 'Healthier kenya', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1284, 304, 'company', '1', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1285, 304, 'company_location', 'KITUI', '2022-01-21 18:54:57', '2022-01-21 18:54:57'),
(1286, 304, 'service', '12', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(1287, 304, 'service_issue', 'Ambulance', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(1288, 304, 'reported_via', '1', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(1289, 304, 'files', '', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(1290, 305, 'patientfullname', 'test patient', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1291, 305, 'memberno', '12345', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1292, 305, 'mobiles', '0721569874', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1293, 305, 'membertype', 'Principal', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1294, 305, 'locationname', 'Mombasa', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1295, 305, 'recent_visit_date', '10/01/2022', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1296, 305, 'clientschema', 'Healthier kenya', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1297, 305, 'company', '1', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1298, 305, 'company_location', 'MTWAPA', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1299, 305, 'service', '12', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1300, 305, 'service_issue', 'Preauth approval', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1301, 305, 'reported_via', '3', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1302, 305, 'files', '', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(1303, 306, 'patientfullname', 'test patient', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1304, 306, 'memberno', '12345', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1305, 306, 'mobiles', '0721569874', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1306, 306, 'membertype', 'Principal', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1307, 306, 'locationname', 'Mombasa', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1308, 306, 'recent_visit_date', '10/01/2022', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1309, 306, 'clientschema', 'Healthier kenya', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1310, 306, 'company', '1', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1311, 306, 'company_location', 'PANARI NYAHURURU', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1312, 306, 'service', '12', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1313, 306, 'service_issue', 'MVC', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1314, 306, 'reported_via', '2', '2022-01-22 06:18:01', '2022-01-22 06:18:01'),
(1315, 306, 'files', '', '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(1316, 307, 'patientfullname', 'test patient', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1317, 307, 'memberno', '12345', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1318, 307, 'mobiles', '0721569874', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1319, 307, 'membertype', 'Principal', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1320, 307, 'locationname', 'Mombasa', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1321, 307, 'recent_visit_date', '10/01/2022', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1322, 307, 'clientschema', 'Healthier kenya', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1323, 307, 'company', '1', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1324, 307, 'company_location', 'ELDAMA RAVINE', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1325, 307, 'service', '12', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1326, 307, 'service_issue', 'Billing-Last-Expense', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1327, 307, 'reported_via', '7', '2022-01-22 09:02:24', '2022-01-22 09:02:24'),
(1328, 307, 'files', '', '2022-01-22 09:02:25', '2022-01-22 09:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priority`
--

CREATE TABLE `ticket_priority` (
  `priority_id` int(10) UNSIGNED NOT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority_urgency` tinyint(1) NOT NULL,
  `ispublic` tinyint(1) NOT NULL,
  `is_default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_priority`
--

INSERT INTO `ticket_priority` (`priority_id`, `priority`, `status`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Low', '1', 'Low', '#00a65a', 4, 1, '', NULL, NULL),
(2, 'Normal', '1', 'Normal', '#314262', 3, 1, '1', NULL, NULL),
(3, 'High', '1', 'High', '#f39c11', 2, 1, '', NULL, NULL),
(4, 'Emergency', '1', 'Emergency', '#dd4b38', 1, 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_source`
--

CREATE TABLE `ticket_source` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_source`
--

INSERT INTO `ticket_source` (`id`, `name`, `value`, `css_class`) VALUES
(1, 'web', 'Web', 'fa fa-internet-explorer'),
(2, 'email', 'E-mail', 'fa fa-envelope'),
(3, 'agent', 'Agent Panel', 'fa fa-envelope'),
(4, 'facebook', 'Facebook', 'fa fa-facebook'),
(5, 'twitter', 'Twitter', 'fa fa-twitter'),
(6, 'call', 'Call', 'fa fa-phone'),
(7, 'chat', 'Chat', 'fa fa-comment'),
(8, 'web', 'Web', ''),
(9, 'email', 'E-mail', ''),
(10, 'agent', 'Agent Panel', '');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_status`
--

CREATE TABLE `ticket_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flags` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `email_user` int(11) NOT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_status`
--

INSERT INTO `ticket_status` (`id`, `name`, `state`, `mode`, `message`, `flags`, `sort`, `email_user`, `icon_class`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'Open', 'open', 3, 'Ticket have been Reopened by', 0, 1, 0, '', 'Open tickets.', '2016-12-13 03:19:23', '2016-12-13 03:19:23'),
(2, 'Resolved', 'closed', 1, 'Ticket have been Resolved by', 0, 2, 0, '', 'Resolved tickets.', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(3, 'Closed', 'closed', 3, 'Ticket have been Closed by', 0, 3, 0, '', 'Closed tickets. Tickets will still be accessible on client and staff panels.', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(4, 'Archived', 'archived', 3, 'Ticket have been Archived by', 0, 4, 0, '', 'Tickets only adminstratively available but no longer accessible on ticket queues and client panel.', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(5, 'Deleted', 'deleted', 3, 'Ticket have been Deleted by', 0, 5, 0, '', 'Tickets queued for deletion. Not accessible on ticket queues.', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(6, 'Unverified', 'unverified', 3, 'User account verification required.', 0, 6, 0, '', 'Ticket will be open after user verifies his/her account.', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(7, 'Request Approval', 'unverified', 3, 'Approval requested by', 0, 7, 0, '', 'Ticket will be approve  after Admin verifies  this ticket', '2016-12-13 03:19:24', '2016-12-13 03:19:24'),
(8, 'Inprogress', 'inprogress', 3, 'If have a sometime system problem', 0, 0, 0, '', 'Ticket is pending for sometime', '2021-10-27 11:39:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_thread`
--

CREATE TABLE `ticket_thread` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `poster` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` int(10) UNSIGNED DEFAULT NULL,
  `reply_rating` int(11) NOT NULL,
  `rating_count` int(11) NOT NULL,
  `is_internal` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longblob DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_thread`
--

INSERT INTO `ticket_thread` (`id`, `ticket_id`, `user_id`, `poster`, `source`, `reply_rating`, `rating_count`, `is_internal`, `title`, `body`, `format`, `ip_address`, `created_at`, `updated_at`) VALUES
(282, 204, 1, 'client', NULL, 0, 0, 0, 'trst tiket', 0x3c703e68693c2f703e, '', '', '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(283, 204, 1, 'support', NULL, 0, 0, 0, '', 0x3c703e636f6d6d656e7420746f6f3c2f703e, '', '', '2021-10-01 04:12:09', '2021-10-01 04:12:09'),
(284, 205, 1, 'client', NULL, 0, 0, 0, 'second tic', 0x3c703e686920677579733c2f703e, '', '', '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(285, 205, 1, 'support', NULL, 0, 0, 0, '', 0x3c703e74657374323c2f703e, '', '', '2021-10-01 04:17:57', '2021-10-01 04:17:57'),
(286, 205, 1, 'client', NULL, 0, 0, 0, 'second tic[#LCBG2]', 0x3c703e6920616d20636f6d6d656e74696e67206f6e2074686973207469636b65743c2f703e, '', '', '2021-10-01 13:05:46', '2021-10-01 13:05:46'),
(287, 205, 1, 'support', NULL, 0, 0, 0, '', 0x3c703e416e6f7468657220636f6d6d656e743c2f703e, '', '', '2021-10-03 13:09:19', '2021-10-03 13:09:19'),
(288, 205, 22, '', NULL, 0, 0, 0, 'second tic[#LCBG2]', 0x3c703e436f6d6d656e7420627920557074616c206b616e743c2f703e, '', '', '2021-10-03 13:11:15', '2021-10-03 13:11:15'),
(289, 204, 22, '', NULL, 0, 0, 0, 'trst tiket[#LCBG1]', 0x3c703e487572727920757020636f6d6d656e74206f6e2074686973207469636b65743c2f703e, '', '', '2021-10-03 13:12:15', '2021-10-03 13:12:15'),
(290, 206, 1, 'client', NULL, 0, 0, 0, 'test ticket created ', 0x3c703e6869266e6273703b3c2f703e, '', '', '2021-10-06 07:38:42', '2021-10-06 07:38:42'),
(291, 207, 1, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e546573743c2f703e, '', '', '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(292, 207, 1, 'support', NULL, 0, 0, 0, '', 0x3c703e7465737420636c6f737572653c2f703e, '', '', '2021-10-12 13:57:35', '2021-10-12 13:57:35'),
(293, 208, 1, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e546573743c2f703e, '', '', '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(294, 208, 1, 'support', NULL, 0, 0, 0, '', 0x3c703e5465737420436c6f737572653c2f703e, '', '', '2021-10-12 14:08:54', '2021-10-12 14:08:54'),
(295, 205, 56, '', NULL, 0, 0, 0, 'second tic[#LCBG2]', 0x3c703e7465737420636c6f737572653c2f703e, '', '', '2021-10-14 06:41:37', '2021-10-14 06:41:37'),
(296, 209, 56, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e746573743c2f703e, '', '', '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(297, 210, 56, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e546573743c2f703e, '', '', '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(298, 211, 56, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e546573743c2f703e, '', '', '2021-10-18 12:40:31', '2021-10-18 12:40:31'),
(299, 205, 49, '', NULL, 0, 0, 0, 'second tic[#LCBG2]', 0x3c703e7465737420636c6f7365643c2f703e, '', '', '2021-10-18 15:23:41', '2021-10-18 15:23:41'),
(300, 212, 40, 'client', NULL, 0, 0, 0, 'Provide test strips and improve on time', 0x3c703e496d70726f7665206f6e2074696d65206d616e6167656d6e65743c2f703e, '', '', '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(301, 213, 40, 'client', NULL, 0, 0, 0, 'Additional pediatric required, ', 0x3c703e446f63746f722074616b657320616c6f74206f662074696d6520736565696e672070617469656e74732e3c2f703e, '', '', '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(302, 214, 40, 'client', NULL, 0, 0, 0, 'Time management', 0x3c703e494d70726f7665206f6e2074696d65206d616e6167656d656e743c2f703e, '', '', '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(303, 215, 40, 'client', NULL, 0, 0, 0, 'Time management at the lab', 0x3c703e3430206d696e75746573206368616e67656420746f20636c6f736520746f20616e20686f75723c2f703e, '', '', '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(304, 214, 40, '', NULL, 0, 0, 0, 'Time management[#LCMG6]', 0x3c703e50617469656e7473206172652061647669736564207768656e2074686520646f63746f72206973207374696c6c20646f696e672068697320726f756e647320616e64206172652061736b6564206966207468657920776f756c64206d696e6420736565696e6720612067656e6572616c207072616374696f6e696f6e65722c2062757420736f6d652063686f6f736520746f20776169742e3c2f703e, '', '', '2021-10-22 06:09:17', '2021-10-22 06:09:17'),
(305, 214, 40, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204576656c6c796e652020204f6b756d75, '', '', '2021-10-22 06:09:22', '2021-10-22 06:09:22'),
(306, 216, 60, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e746573743c2f703e, '', '', '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(307, 213, 56, '', NULL, 0, 0, 0, 'Additional pediatric required, [#LCMG5]', 0x3c703e7465737420636c6f737572653c2f703e, '', '', '2021-10-25 07:09:38', '2021-10-25 07:09:38'),
(308, 217, 49, 'client', NULL, 0, 0, 0, 'TEST', 0x3c703e5445535420434f4d504c41494e543c2f703e, '', '', '2021-10-25 09:43:58', '2021-10-25 09:43:58'),
(309, 218, 49, 'client', NULL, 0, 0, 0, 'TEST', 0x3c703e5445535420434f4d504c41494e3c2f703e, '', '', '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(310, 218, 49, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920456c697a616265746820204b6f6d6f7261, '', '', '2021-10-25 10:00:35', '2021-10-25 10:00:35'),
(311, 218, 49, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920456c697a616265746820204b6f6d6f7261, '', '', '2021-10-25 10:01:36', '2021-10-25 10:01:36'),
(312, 219, 49, 'client', NULL, 0, 0, 0, 'TEST', 0x3c703e5445535420434f4d504c41494e3c2f703e, '', '', '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(313, 209, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-25 11:31:52', '2021-10-25 11:31:52'),
(314, 220, 56, 'client', NULL, 0, 0, 0, 'Test', 0x3c703e544553543c2f703e, '', '', '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(315, 210, 22, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e205265736f6c76656420627920557470616c206b616e74, '', '', '2021-10-25 11:40:50', '2021-10-25 11:40:50'),
(316, 211, 22, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920557470616c206b616e74, '', '', '2021-10-25 11:41:11', '2021-10-25 11:41:11'),
(317, 221, 49, 'client', NULL, 0, 0, 0, 'TEST', 0x3c703e5445535420434f4d504c41494e3c2f703e, '', '', '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(318, 221, 49, '', NULL, 0, 0, 0, 'TEST[#LCKK4]', 0x3c703e5445535420434f4d504c4554453c2f703e, '', '', '2021-10-25 12:21:14', '2021-10-25 12:21:14'),
(319, 221, 49, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920456c697a616265746820204b6f6d6f7261, '', '', '2021-10-25 12:21:28', '2021-10-25 12:21:28'),
(320, 222, 56, 'client', NULL, 0, 0, 0, ' test test test', 0x3c703e50617469656e7420636f6d706c61696e6564206f6620686967682062696c6c733c2f703e, '', '', '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(321, 222, 56, '', NULL, 0, 0, 0, ' test test test[#LCMG8]', 0x3c703e50617469656e742063616c6c65642072657175657374696e6720666f72207374617475733c2f703e, '', '', '2021-10-25 13:06:04', '2021-10-25 13:06:04'),
(322, 222, 56, '', NULL, 0, 0, 0, ' test test test[#LCMG8]', 0x3c703e50617469656e742061737369737465643c2f703e, '', '', '2021-10-25 13:11:40', '2021-10-25 13:11:40'),
(323, 222, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-25 13:11:55', '2021-10-25 13:11:55'),
(324, 223, 49, 'client', NULL, 0, 0, 0, 'TEST', 0x3c703e5445535420434f4d504c41494e3c2f703e, '', '', '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(325, 223, 49, '', NULL, 0, 0, 0, 'TEST[#LCKK5]', 0x3c703e5445535420434f4d504c4554453c2f703e, '', '', '2021-10-25 14:32:13', '2021-10-25 14:32:13'),
(326, 223, 49, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920456c697a616265746820204b6f6d6f7261, '', '', '2021-10-25 14:32:36', '2021-10-25 14:32:36'),
(327, 223, 45, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f7365642062792041726e6f6c642020204e6465677761, '', '', '2021-10-25 14:32:36', '2021-10-25 14:32:36'),
(328, 224, 34, 'client', NULL, 0, 0, 0, 'MOVEMENTS IN THE HOSPITAL', 0x3c703e5448452050415449454e54205245504f52545320544841542049542049532048454354494320464f522043532050415449454e545320574954482042414249455320494e20544845204e49435520544f204d4f56452046524f4d204f4e4520504c41434520544f20544845204f544845522e3c2f703e, '', '', '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(329, 215, 39, '', NULL, 0, 0, 0, 'Time management at the lab[#LCMG7]', 0x3c703e6668672072616e206f7574206f662073746f636b20776520686164206c6974746c6520646f776e2074696d6520647572696e67207265706c6163656d656e742e266e6273703b3c2f703e, '', '', '2021-10-26 15:53:57', '2021-10-26 15:53:57'),
(330, 215, 39, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204b656e6e6564792020416e79616e6775, '', '', '2021-10-26 15:54:12', '2021-10-26 15:54:12'),
(331, 225, 34, 'client', NULL, 0, 0, 0, 'DIABETIC PATIENTS', 0x3c703e544845204b49544348454e20444f4553204e4f54205354524943544c592041444845524520544f20544845495220444945542e3c2f703e, '', '', '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(332, 226, 34, 'client', NULL, 0, 0, 0, 'MATRESSES', 0x3c703e544845204d41545452455353455320415245205448494e20414e4420554e434f4d464f525441424c453c2f703e, '', '', '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(333, 212, 39, '', NULL, 0, 0, 0, 'Provide test strips and improve on time[#LCMG4]', 0x3c703e7765206861766520736f6d6520697373756573207769746820756e6465727374616666696e672062757420636c6f73696e67206974206279204672696461792e2077652077696c6c206265206b65656e206f6e2074696d65206d616e6167656d656e742e3c2f703e, '', '', '2021-10-26 15:57:48', '2021-10-26 15:57:48'),
(334, 212, 39, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204b656e6e6564792020416e79616e6775, '', '', '2021-10-26 15:57:56', '2021-10-26 15:57:56'),
(335, 227, 34, 'client', NULL, 0, 0, 0, 'POST OPERATION', 0x3c703e504f5354204f5045524154494f4e2050415449454e5453204e45454420544f20484156452041204341524554414b45523c2f703e, '', '', '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(336, 228, 34, 'client', NULL, 0, 0, 0, 'FOOD MENU', 0x3c703e54484520464f4f44204d454e5520495320534f204c494d4954454420492e4520464f4f4453204c494b45204152524f5720524f4f545320414e44205748495445204d45415420415245204d495353494e472c3c2f703e, '', '', '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(337, 229, 34, 'client', NULL, 0, 0, 0, 'DELAYED ADMISSION', 0x3c703e4c41434b204f4620434c41524954592055504f4e2041444d495353494f4e20415420544845204445534b20414e4420414c534f2041424f5554205448452050415449454e5420434f4e444954494f4e2e414c534f2c20544845524520495320414e2041444d495353494f4e20434f535420425245414b2d444f574e3c2f703e, '', '', '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(338, 230, 34, 'client', NULL, 0, 0, 0, 'PEADIATRIC', 0x3c703e50454144532050415449454e54532053484f554c44204e4f542042452041444d495454454420544f20544845204144554c542057415244532e3c2f703e, '', '', '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(339, 231, 34, 'client', NULL, 0, 0, 0, 'FOOD QUANTITY', 0x3c703e464f4f44205155414e5449545920495320544f4f20534d414c4c2e3c2f703e, '', '', '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(340, 232, 40, 'client', NULL, 0, 0, 0, 'Incomplete admission kit', 0x3c703e50617469656e7420776173206e6f7420676976656e206120636f6d706c6574652061646d697373696f6e206b69742073696e6365207468657920617265206f7574206f662073746f636b3c2f703e, '', '', '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(341, 233, 40, 'client', NULL, 0, 0, 0, 'Slow service at the consultation room', 0x3c703e446f63746f72732064656c617965642061742074686520656d657267656e637920617474656e64696e6720746f206f746865722070617469656e74733c2f703e, '', '', '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(342, 234, 49, 'client', NULL, 0, 0, 0, 'Parking for patients', 0x3c703e50617469656e7420636f6d706c61696e6564206f66207061726b696e6720666f722070617469656e7473206e6f7420686176696e672061207369676e616765202e20486520636c61696d73207468657265206e6565647320746f2062652061206c6162656c6c6564207369676e61676520666f722070617469656e7473207061726b696e672e3c2f703e, '', '', '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(343, 235, 49, 'client', NULL, 0, 0, 0, 'General long TAT', 0x3c703e70617469656e7420636f6d706c61696e6564206f66206c6f6e67205441542073696e63652074686520686f73706974616c2068616420746f207365656b20617070726f76616c2066726f6d2074686520696e737572616e636520636f6d70616e792e3c2f703e, '', '', '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(344, 216, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-27 07:35:08', '2021-10-27 07:35:08'),
(345, 217, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-27 07:36:31', '2021-10-27 07:36:31'),
(346, 219, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-27 07:37:32', '2021-10-27 07:37:32'),
(347, 220, 56, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204a616d65732020204d756972757269, '', '', '2021-10-27 07:38:16', '2021-10-27 07:38:16'),
(348, 238, 34, 'client', NULL, 0, 0, 0, 'commence medication as you wait for admission', 0x3c703e696e2061646d697373696f6e206172656120636f6d6d656e6365206d656469636174696f6e20617320796f75207761697420666f722061646d697373696f6e2070726f636573733c2f703e, '', '', '2021-10-27 11:38:57', '2021-10-27 11:38:57'),
(349, 239, 34, 'client', NULL, 0, 0, 0, 'shorten admission process', 0x3c703e73686f7274656e2061646d697373696f6e2070726f636573733c2f703e, '', '', '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(350, 240, 34, 'client', NULL, 0, 0, 0, 'co-ordination', 0x3c703e73686f756c6420636f6f7264696e6174652077656c6c287374616666732920776865726520616c6c20776f726b73206d75737420726573706563742065616368206f74686572206465636973696f6e2066726f6d2077617463686d616e20746f206e75727365733c2f703e, '', '', '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(351, 241, 34, 'client', NULL, 0, 0, 0, 'reduce paper work during admission', 0x3c703e726564756365207061706572776f726b20647572696e672061646d697373696f6e2e3c2f703e, '', '', '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(352, 240, 22, '', NULL, 0, 0, 1, '', 0x49662068617665206120736f6d6574696d652073797374656d2070726f626c656d20557470616c206b616e74, '', '', '2021-10-27 12:24:25', '2021-10-27 12:24:25'),
(353, 240, 22, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e205265736f6c76656420627920557470616c206b616e74, '', '', '2021-10-27 12:24:34', '2021-10-27 12:24:34'),
(354, 240, 22, '', NULL, 0, 0, 1, '', 0x49662068617665206120736f6d6574696d652073797374656d2070726f626c656d20557470616c206b616e74, '', '', '2021-10-27 12:24:39', '2021-10-27 12:24:39'),
(355, 224, 34, 'support', NULL, 0, 0, 0, '', 0x3c756c20747970653d226469736322207374796c653d22666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d7765696768743a203430303b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b206261636b67726f756e642d636f6c6f723a2077686974653b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b20636f6c6f723a20626c61636b3b20666f6e742d73697a653a20313570783b206d617267696e2d746f703a203070783b206d617267696e2d626f74746f6d3a203070783b223e3c6c69207374796c653d22636f6c6f723a20626c61636b3b20666f6e742d73697a653a20313170743b20666f6e742d66616d696c793a2043616c696272692c2073616e732d73657269663b206261636b67726f756e642d636f6c6f723a2077686974653b206d617267696e3a20307078203070782030707820333670743b223e616c6c2d646179203120506f7374204373204d6f74686572732077696c6c206265206665727269656420746f204e4943552077697468206120776865656c636861697220746f20656e737572652074686579206861766520616e20656173792074696d65207768656e20676f696e6720746f20627265617374666565642057696e66726564204177696e6a6120616e64204a6f686e204d616c616c6120746f20656e737572652074686973206973206265696e6720646f6e652e3c2f6c693e3c2f756c3e3c703e3c623e3c2f623e3c693e3c2f693e3c753e3c2f753e3c7375623e3c2f7375623e3c7375703e3c2f7375703e3c737472696b653e3c2f737472696b653e3c62723e3c2f703e, '', '', '2021-10-27 12:47:52', '2021-10-27 12:47:52'),
(356, 226, 34, 'support', NULL, 0, 0, 0, '', 0x3c646976207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d76617269616e742d6e756d657269633a20696e68657269743b20666f6e742d76617269616e742d656173742d617369616e3a20696e68657269743b20666f6e742d7765696768743a203430303b20666f6e742d737472657463683a20696e68657269743b20666f6e742d73697a653a20313570783b206c696e652d6865696768743a20696e68657269743b20666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20626c61636b3b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b206261636b67726f756e642d636f6c6f723a2077686974653b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b223e3c646976207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e743a20696e68657269743b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20696e68657269743b223e3c756c3e3c6c693e3c7370616e207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e743a20696e68657269743b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20696e68657269743b223e4d722e2042656e736f6e2c204d722e20456d6d616e75656c2c20616e642057696e66726564204177696e6a612c20746f20666f6c6c6f77207570206f6e20686f7720666172207468652070726f636573732069732e3c7370616e206c616e673d22656e2d555322207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e743a20696e68657269743b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20696e68657269743b223e3c2f7370616e3e3c2f7370616e3e3c2f6c693e3c2f756c3e3c2f6469763e3c2f6469763e3c646976207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d76617269616e742d6e756d657269633a20696e68657269743b20666f6e742d76617269616e742d656173742d617369616e3a20696e68657269743b20666f6e742d7765696768743a203430303b20666f6e742d737472657463683a20696e68657269743b20666f6e742d73697a653a20313570783b206c696e652d6865696768743a20696e68657269743b20666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20626c61636b3b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b206261636b67726f756e642d636f6c6f723a2077686974653b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b223e3c627220636c6173733d224170706c652d696e7465726368616e67652d6e65776c696e65223e3c623e3c2f623e3c693e3c2f693e3c753e3c2f753e3c7375623e3c2f7375623e3c7375703e3c2f7375703e3c737472696b653e3c2f737472696b653e3c62723e3c2f6469763e, '', '', '2021-10-27 12:52:11', '2021-10-27 12:52:11'),
(357, 227, 34, 'support', NULL, 0, 0, 0, '', 0x3c756c207374796c653d22636f6c6f723a207267622833322c2033312c203330293b20666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d7765696768743a203430303b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b206261636b67726f756e642d636f6c6f723a20726762283235352c203235352c20323535293b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b223e3c6c693e57696e6672656420616e64204e616e637920746f20456e73757265207765206861766520656e6f7567682050617469656e747320417474656e64616e747320746f20646f207468652073616d652e3c2f6c693e3c2f756c3e3c703e3c623e3c2f623e3c693e3c2f693e3c753e3c2f753e3c7375623e3c2f7375623e3c7375703e3c2f7375703e3c737472696b653e3c2f737472696b653e3c62723e3c2f703e, '', '', '2021-10-27 12:52:40', '2021-10-27 12:52:40'),
(358, 229, 34, 'support', NULL, 0, 0, 0, '', 0x3c756c20747970653d226469736322207374796c653d22636f6c6f723a2072676228302c20302c2030293b20666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d7765696768743a203430303b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b20666f6e742d73697a653a20313570783b206261636b67726f756e642d636f6c6f723a20726762283235352c203235352c20323535293b206d617267696e2d746f703a203070783b206d617267696e2d626f74746f6d3a203070783b223e3c6c69207374796c653d22636f6c6f723a20626c61636b3b20666f6e742d73697a653a20313170743b20666f6e742d66616d696c793a2043616c696272692c2073616e732d73657269663b206261636b67726f756e642d636f6c6f723a2077686974653b206d617267696e3a20307078203070782030707820333670743b223e3c7370616e207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e743a20696e68657269743b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a2072676228302c2033322c203936293b206261636b67726f756e642d636f6c6f723a2077686974653b223e573c2f7370616e3e3c7370616e207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20666f6e743a20696e68657269743b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20696e68657269743b206261636b67726f756e642d636f6c6f723a2077686974653b223e65207368616c6c2068617665206f6e6520484f4420617320616e2061646d697373696f6e206368616d70696f6e20746f20656e73757265207468657920666f6c6c6f7720757020616e6420696d70726f7665206f6e207468652054415420746f20626520666f6c6c6f7765642062792057696e667265642c2056616c656e74696e6f20616e642044722e204b61796f6e67612e3c2f7370616e3e3c2f6c693e3c2f756c3e3c703e3c623e3c2f623e3c693e3c2f693e3c753e3c2f753e3c7375623e3c2f7375623e3c7375703e3c2f7375703e3c737472696b653e3c2f737472696b653e3c62723e3c2f703e, '', '', '2021-10-27 12:54:43', '2021-10-27 12:54:43'),
(359, 230, 34, 'support', NULL, 0, 0, 0, '', 0x3c756c20747970653d226469736322207374796c653d22666f6e742d66616d696c793a2043616c696272692c20417269616c2c2048656c7665746963612c2073616e732d73657269663b20666f6e742d7374796c653a206e6f726d616c3b20666f6e742d76617269616e742d6c69676174757265733a206e6f726d616c3b20666f6e742d76617269616e742d636170733a206e6f726d616c3b20666f6e742d7765696768743a203430303b206c65747465722d73706163696e673a206e6f726d616c3b206f727068616e733a20323b20746578742d616c69676e3a2073746172743b20746578742d696e64656e743a203070783b20746578742d7472616e73666f726d3a206e6f6e653b2077686974652d73706163653a206e6f726d616c3b207769646f77733a20323b20776f72642d73706163696e673a203070783b202d7765626b69742d746578742d7374726f6b652d77696474683a203070783b206261636b67726f756e642d636f6c6f723a2077686974653b20746578742d6465636f726174696f6e2d746869636b6e6573733a20696e697469616c3b20746578742d6465636f726174696f6e2d7374796c653a20696e697469616c3b20746578742d6465636f726174696f6e2d636f6c6f723a20696e697469616c3b20636f6c6f723a20626c61636b3b20666f6e742d73697a653a20313570783b206d617267696e2d746f703a203070783b206d617267696e2d626f74746f6d3a203070783b223e3c6c69207374796c653d22636f6c6f723a20626c61636b3b20666f6e742d73697a653a20313170743b20666f6e742d66616d696c793a2043616c696272692c2073616e732d73657269663b206261636b67726f756e642d636f6c6f723a2077686974653b206d617267696e3a20307078203070782030707820333670743b223e5468652044514d732c2057696e66726564204177696e6a6120616e64204d722e42656e736f6e20746f206c6f6f6b20696e746f207468697320616e6420676574206120736f6c7574696f6e206f6e207468652073616d65203c2f6c693e3c2f756c3e3c703e3c623e3c2f623e3c693e3c2f693e3c753e3c2f753e3c7375623e3c2f7375623e3c7375703e3c2f7375703e3c737472696b653e3c2f737472696b653e3c62723e3c2f703e, '', '', '2021-10-27 12:58:27', '2021-10-27 12:58:27'),
(360, 242, 34, 'client', NULL, 0, 0, 0, 'DELAYED DOCTOR ', 0x3c703e7468652070617469656e742077616974656420666f72206c6f6e6720746f20736565207468652067796e613c62723e3c2f703e, '', '', '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(361, 243, 34, 'client', NULL, 0, 0, 0, 'DELAYED DOCTOR ', 0x3c703e54686572652077617320612064656c617920617420746865204f474420636c696e69632e3c62723e3c2f703e, '', '', '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(362, 232, 40, '', NULL, 0, 0, 0, 'Incomplete admission kit[#LCMG9]', 0x3c703e5468652061646d697373696f6e206b69742077617320696e636f6d706c6574652c2070617469656e7473207765726520676976656e206d696e7573266e6273703b206120746f77656c2e3c2f703e, '', '', '2021-10-27 15:06:58', '2021-10-27 15:06:58'),
(363, 232, 40, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e205265736f6c766564206279204576656c6c796e652020204f6b756d75, '', '', '2021-10-27 15:07:01', '2021-10-27 15:07:01'),
(364, 244, 40, 'client', NULL, 0, 0, 0, 'Additional doctors', 0x3c703e47726561742073657276696365732c20627574206e756d626572206f6620646f63746f72732073686f756c6420626520696e6372656173656420746f206361746368207468652068696768206e756d626572206f662070617469656e74732061742074686520686f73706974616c3c2f703e, '', '', '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(365, 245, 40, 'client', NULL, 0, 0, 0, 'Delayed discharge', 0x3c703e50617469656e7420636f6d706c61696e6564207468617420697420746f6f6b206865722066726f6d203132206e6f6f6e20746f20352e303020746f20626520646973636861726765643c2f703e, '', '', '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(366, 246, 22, 'client', NULL, 0, 0, 0, 'test ticket by me', 0x6e6f206d657373616765, '', '', '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(367, 244, 56, '', NULL, 0, 0, 1, '', 0x49662068617665206120736f6d6574696d652073797374656d2070726f626c656d204a616d65732020204d756972757269, '', '', '2021-10-28 07:48:50', '2021-10-28 07:48:50'),
(368, 254, 79, 'client', NULL, 0, 0, 0, 'Testing', 0x3c703e68693c2f703e, '', '', '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(369, 255, 79, 'client', NULL, 0, 0, 0, 'test 2', 0x3c703e54686973206973207468652074657374207469636b65743c2f703e, '', '', '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(370, 256, 80, 'client', NULL, 0, 0, 0, 'Test3', 0x3c703e546869732069732074657374207469636b65742063726561746564206279204d65656e616b7368693c2f703e, '', '', '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(371, 257, 80, 'client', NULL, 0, 0, 0, 'Test4', 0x3c703e546869732069732074657374207469636b65742063726561746564206279206d65656e616b73686920703c2f703e, '', '', '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(372, 258, 34, 'client', NULL, 0, 0, 0, 'Test5', 0x3c703e546869732069732074657374207469636b657420637265617465642062792057696e6e69653c2f703e, '', '', '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(373, 259, 34, 'client', NULL, 0, 0, 0, 'Test6', 0x3c703e546869732069732074657374207469636b657420637265617465642062792077696e6e653c2f703e, '', '', '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(374, 260, 34, 'client', NULL, 0, 0, 0, 'Test55', 0x3c703e6869693c2f703e, '', '', '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(375, 262, 48, 'client', NULL, 0, 0, 0, 'Test10', 0x3c703e746869732069732074657374207469636b65743c2f703e, '', '', '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(376, 262, 22, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e205265736f6c76656420627920557470616c206b616e74, '', '', '2021-11-15 04:22:51', '2021-11-15 04:22:51'),
(377, 260, 22, '', NULL, 0, 0, 1, '', 0x49662068617665206120736f6d6574696d652073797374656d2070726f626c656d20557470616c206b616e74, '', '', '2021-11-15 04:24:01', '2021-11-15 04:24:01'),
(378, 259, 22, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920557470616c206b616e74, '', '', '2021-11-15 04:25:45', '2021-11-15 04:25:45'),
(379, 263, 1, 'client', NULL, 0, 0, 0, 'for testing', 0x3c703e6768676668663c2f703e, '', '', '2021-11-15 07:07:16', '2021-11-15 07:07:16'),
(380, 263, 1, '', NULL, 0, 0, 0, 'for testing[#LCBG28]', 0x3c703e6869206775797320686f772061726520796f753c2f703e, '', '', '2021-11-16 03:45:49', '2021-11-16 03:45:49'),
(381, 264, 1, 'client', NULL, 0, 0, 0, 'test1 ', 0x3c703e68696969693c2f703e, '', '', '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(382, 265, 22, 'client', NULL, 0, 0, 0, 'sdfsd', 0x3c703e73646673643c2f703e, '', '', '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(383, 266, 22, 'client', NULL, 0, 0, 0, 'dfhdg', 0x3c703e646667643c2f703e, '', '', '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(384, 267, 86, 'client', NULL, 0, 0, 0, 'dasdxzsx', 0x3c703e73613c2f703e, '', '', '2022-01-12 14:56:21', '2022-01-12 14:56:21'),
(385, 268, 86, 'client', NULL, 0, 0, 0, 'refunds', 0x3c703e726566756e64206d6520706c656173653c2f703e, '', '', '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(386, 269, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e6d65646963696e652069737375653c2f703e, '', '', '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(387, 270, 89, 'client', NULL, 0, 0, 0, 'NO services', 0x3c703e4e6f2073657276696365733c62723e3c2f703e, '', '', '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(388, 271, 89, 'client', NULL, 0, 0, 0, 'inquiry', 0x3c703e7061636b61676520696e71756972793c2f703e, '', '', '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(389, 272, 96, 'client', NULL, 0, 0, 0, 'Delayed spectaclessa', 0x3c703e4358435843583c2f703e, '', '', '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(390, 273, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e73617361736473643c2f703e, '', '', '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(391, 274, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e7361736173613c2f703e, '', '', '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(392, 275, 86, 'client', NULL, 0, 0, 0, 'refunds', 0x3c703e7361736173617361733c2f703e, '', '', '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(393, 276, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e7361736173616173613c2f703e, '', '', '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(394, 277, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e77726f6e67206c656e7365733c2f703e, '', '', '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(395, 272, 86, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204e6a6f6b69204e6a7567756e61, '', '', '2022-01-13 12:53:04', '2022-01-13 12:53:04'),
(396, 277, 86, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204e6a6f6b69204e6a7567756e61, '', '', '2022-01-13 13:57:18', '2022-01-13 13:57:18'),
(397, 271, 89, '', NULL, 0, 0, 1, '', 0x49662068617665206120736f6d6574696d652073797374656d2070726f626c656d204865636b6d616e20576173756e61, '', '', '2022-01-13 14:18:47', '2022-01-13 14:18:47'),
(398, 278, 96, 'client', NULL, 0, 0, 0, 'dose', 0x3c703e696e636f6d706c65746520646f73653c2f703e, '', '', '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(399, 268, 89, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204865636b6d616e20576173756e61, '', '', '2022-01-14 12:18:12', '2022-01-14 12:18:12'),
(400, 277, 91, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920537465766520204f636869656e67, '', '', '2022-01-14 12:29:26', '2022-01-14 12:29:26'),
(401, 279, 86, 'client', NULL, 0, 0, 0, 'dewsw', 0x3c703e647361647364663c2f703e, '', '', '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(402, 270, 89, '', NULL, 0, 0, 0, 'NO services[#BHRV1]', 0x3c703e4578706c61696e266e6273703b3c2f703e, '', '', '2022-01-14 14:43:36', '2022-01-14 14:43:36'),
(403, 270, 89, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f736564206279204865636b6d616e20576173756e61, '', '', '2022-01-14 14:43:48', '2022-01-14 14:43:48'),
(404, 267, 89, '', NULL, 0, 0, 0, 'dasdxzsx[#BHMK1]', 0x3c703e656464646473613c2f703e, '', '', '2022-01-14 14:51:05', '2022-01-14 14:51:05'),
(405, 280, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e73616173613c2f703e, '', '', '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(406, 267, 86, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e205265736f6c766564206279204e6a6f6b69204e6a7567756e61, '', '', '2022-01-15 15:42:25', '2022-01-15 15:42:25'),
(407, 281, 86, 'client', NULL, 0, 0, 0, 'frames', 0x3c703e6164787364787a733c2f703e, '', '', '2022-01-15 15:47:09', '2022-01-15 15:47:09'),
(408, 282, 86, 'client', NULL, 0, 0, 0, 'refunds', 0x3c703e73617361737373737373733c2f703e, '', '', '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(409, 283, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e7361617373666478663c2f703e, '', '', '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(410, 284, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e6b65726575676f7961206c61622069737375653c2f703e, '', '', '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(411, 285, 86, 'client', NULL, 0, 0, 0, 'Delayed spectacles', 0x3c703e61736173643c2f703e, '', '', '2022-01-17 09:00:43', '2022-01-17 09:00:43'),
(412, 286, 86, 'client', NULL, 0, 0, 0, 'frames', 0x3c703e6672616d65733c2f703e, '', '', '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(413, 287, 86, 'client', NULL, 0, 0, 0, 'Delay', 0x3c703e44656c617920696e20736572766963652064656c69766572793c62723e3c2f703e, '', '', '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(414, 288, 86, 'client', NULL, 0, 0, 0, 'lack of specimen holder', 0x3c703e6c61636b206f662073706563696d656e20686f6c6465723c62723e3c2f703e, '', '', '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(415, 289, 86, 'client', NULL, 0, 0, 0, 'equipment', 0x3c703e65717569706d656e743c62723e3c2f703e, '', '', '2022-01-17 09:05:26', '2022-01-17 09:05:26'),
(416, 290, 86, 'client', NULL, 0, 0, 0, 'Diagnosis', 0x3c703e77726f6e6720646961676e6f7369733c2f703e, '', '', '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(417, 291, 86, 'client', NULL, 0, 0, 0, 'staff', 0x3c703e737461666620696e636f6d706574656e63653c2f703e, '', '', '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(418, 292, 86, 'client', NULL, 0, 0, 0, 'package ', 0x3c703e7061636b61676520636f6d706c61696e74733c2f703e, '', '', '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(419, 293, 86, 'client', NULL, 0, 0, 0, 'bills', 0x3c703e61626e6f726d616c2062696c6c733c2f703e, '', '', '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(420, 294, 86, 'client', NULL, 0, 0, 0, 'staff grooming ', 0x3c703e73746166662067726f6f6d696e67266e6273703b3c62723e3c2f703e, '', '', '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(421, 295, 86, 'client', NULL, 0, 0, 0, 'Delay doc appointment', 0x3c703e64656c61793c2f703e, '', '', '2022-01-17 09:25:14', '2022-01-17 09:25:14'),
(422, 296, 86, 'client', NULL, 0, 0, 0, 'hygiene at the facility', 0x3c703e48594749454e453c2f703e, '', '', '2022-01-17 10:10:49', '2022-01-17 10:10:49'),
(423, 297, 86, 'client', NULL, 0, 0, 0, 'medical bills', 0x3c703e6d65646963616c2062696c6c733c62723e3c2f703e, '', '', '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(424, 289, 86, '', NULL, 0, 0, 0, 'equipment[#BLISS7]', 0x3c703e4b696e646c79206578706c61696e3c2f703e, '', '', '2022-01-17 11:36:16', '2022-01-17 11:36:16'),
(425, 289, 89, '', NULL, 0, 0, 0, 'equipment[#BLISS7]', 0x77652061726520776f726b696e67206f6e206974, '', '', '2022-01-17 11:50:17', '2022-01-17 11:50:17'),
(426, 289, 86, '', NULL, 0, 0, 0, 'equipment[#BLISS7]', 0x3c703e4f4b3c2f703e, '', '', '2022-01-17 12:03:48', '2022-01-17 12:03:48'),
(427, 289, 86, '', NULL, 0, 0, 0, 'equipment[#BLISS7]', 0x3c703e4b696e646c7920757064617465207768656e20646f6e653c2f703e, '', '', '2022-01-17 12:09:36', '2022-01-17 12:09:36'),
(428, 296, 86, '', NULL, 0, 0, 0, 'hygiene at the facility[#BLISS14]', 0x3c703e466f72776172643c2f703e, '', '', '2022-01-17 12:16:25', '2022-01-17 12:16:25'),
(429, 292, 89, '', NULL, 0, 0, 0, 'package [#BLISS10]', 0x3c703e72656f70656e3c2f703e, '', '', '2022-01-17 12:17:45', '2022-01-17 12:17:45'),
(430, 298, 89, 'Heckman Wasuna', NULL, 0, 0, 0, 'appointment', 0x3c703e6170706f696e746d656e743c62723e3c2f703e, '', '', '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(431, 298, 86, '', NULL, 0, 0, 0, 'appointment[#BLISS16]', 0x3c703e4563686573616820776f726b696e67206f6e2069743c2f703e, '', '', '2022-01-17 12:19:35', '2022-01-17 12:19:35'),
(432, 298, 88, '', NULL, 0, 0, 0, 'appointment[#BLISS16]', 0x3c703e49276d20776f726b696e67206f6e2069743c2f703e, '', '', '2022-01-17 12:25:30', '2022-01-17 12:25:30'),
(433, 285, 88, '', NULL, 0, 0, 1, '', 0x5469636b65742068617665206265656e20436c6f73656420627920427269616e2045636865736168, '', '', '2022-01-17 12:26:05', '2022-01-17 12:26:05'),
(434, 295, 89, '', NULL, 0, 0, 0, 'Delay doc appointment[#BLISS13]', 0x3c703e576f726b206f6e207468697320757267656e746c793c2f703e, '', '', '2022-01-17 12:52:46', '2022-01-17 12:52:46'),
(435, 299, 86, 'Njoki Njuguna', NULL, 0, 0, 0, 'billing abnormal', 0x3c703e61626e6f726d616c2062696c6c733c2f703e, '', '', '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(436, 300, 94, 'Agnes Mutua', NULL, 0, 0, 0, 'radiology issue', 0x3c703e726164696f6c6f67792069737375653c62723e3c2f703e, '', '', '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(437, 300, 94, '', NULL, 0, 0, 0, 'radiology issue[#BLISS18]', 0x3c703e5468697320697320757267656e743c2f703e, '', '', '2022-01-18 08:31:55', '2022-01-18 08:31:55'),
(438, 301, 94, 'Agnes Mutua', NULL, 0, 0, 0, 'member limit', 0x3c703e6d656d626572206c696d69743c62723e3c2f703e, '', '', '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(439, 302, 94, 'Agnes Mutua', NULL, 0, 0, 0, 'dasdxzsx', 0x3c703e66736762663c2f703e, '', '', '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(440, 303, 94, 'Agnes Mutua', NULL, 0, 0, 0, 'maintenance', 0x3c703e6d61696e74656e616e63653c62723e3c2f703e, '', '', '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(441, 303, 94, '', NULL, 0, 0, 0, 'maintenance[#BLISS21]', 0x3c703e636865636b3c2f703e, '', '', '2022-01-19 14:16:45', '2022-01-19 14:16:45'),
(442, 304, 86, 'Njoki Njuguna', NULL, 0, 0, 0, 'delayed ambulance', 0x3c703e666173616473613c2f703e, '', '', '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(443, 305, 86, 'Njoki Njuguna', NULL, 0, 0, 0, 'preauth', 0x3c703e707265617574683c62723e3c2f703e, '', '', '2022-01-21 19:09:54', '2022-01-21 19:09:54'),
(444, 306, 86, 'Njoki Njuguna', NULL, 0, 0, 0, 'mvc', 0x3c703e6d76633c2f703e, '', '', '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(445, 307, 86, 'Njoki Njuguna', NULL, 0, 0, 0, 'billing', 0x3c703e62696c6c696e673c2f703e, '', '', '2022-01-22 09:02:25', '2022-01-22 09:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_token`
--

CREATE TABLE `ticket_token` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezone`
--

CREATE TABLE `timezone` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timezone`
--

INSERT INTO `timezone` (`id`, `name`, `location`) VALUES
(1, 'Pacific/Midway', '(GMT-11:00) Midway Island'),
(2, 'US/Samoa', '(GMT-11:00) Samoa'),
(3, 'US/Hawaii', '(GMT-10:00) Hawaii'),
(4, 'US/Alaska', '(GMT-09:00) Alaska'),
(5, 'US/Pacific', '(GMT-08:00) Pacific Time (US &amp; Canada)'),
(6, 'America/Tijuana', '(GMT-08:00) Tijuana'),
(7, 'US/Arizona', '(GMT-07:00) Arizona'),
(8, 'US/Mountain', '(GMT-07:00) Mountain Time (US &amp; Canada)'),
(9, 'America/Chihuahua', '(GMT-07:00) Chihuahua'),
(10, 'America/Mazatlan', '(GMT-07:00) Mazatlan'),
(11, 'America/Mexico_City', '(GMT-06:00) Mexico City'),
(12, 'America/Monterrey', '(GMT-06:00) Monterrey'),
(13, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan'),
(14, 'US/Central', '(GMT-06:00) Central Time (US &amp; Canada)'),
(15, 'US/Eastern', '(GMT-05:00) Eastern Time (US &amp; Canada)'),
(16, 'US/East-Indiana', '(GMT-05:00) Indiana (East)'),
(17, 'America/Bogota', '(GMT-05:00) Bogota'),
(18, 'America/Lima', '(GMT-05:00) Lima'),
(19, 'America/Caracas', '(GMT-04:30) Caracas'),
(20, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)'),
(21, 'America/La_Paz', '(GMT-04:00) La Paz'),
(22, 'America/Santiago', '(GMT-04:00) Santiago'),
(23, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland'),
(24, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires'),
(25, 'Greenland', '(GMT-03:00) Greenland'),
(26, 'Atlantic/Stanley', '(GMT-02:00) Stanley'),
(27, 'Atlantic/Azores', '(GMT-01:00) Azores'),
(28, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.'),
(29, 'Africa/Casablanca', '(GMT) Casablanca'),
(30, 'Europe/Dublin', '(GMT) Dublin'),
(31, 'Europe/Lisbon', '(GMT) Lisbon'),
(32, 'Europe/London', '(GMT) London'),
(33, 'Africa/Monrovia', '(GMT) Monrovia'),
(34, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam'),
(35, 'Europe/Belgrade', '(GMT+01:00) Belgrade'),
(36, 'Europe/Berlin', '(GMT+01:00) Berlin'),
(37, 'Europe/Bratislava', '(GMT+01:00) Bratislava'),
(38, 'Europe/Brussels', '(GMT+01:00) Brussels'),
(39, 'Europe/Budapest', '(GMT+01:00) Budapest'),
(40, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen'),
(41, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana'),
(42, 'Europe/Madrid', '(GMT+01:00) Madrid'),
(43, 'Europe/Paris', '(GMT+01:00) Paris'),
(44, 'Europe/Prague', '(GMT+01:00) Prague'),
(45, 'Europe/Rome', '(GMT+01:00) Rome'),
(46, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo'),
(47, 'Europe/Skopje', '(GMT+01:00) Skopje'),
(48, 'Europe/Stockholm', '(GMT+01:00) Stockholm'),
(49, 'Europe/Vienna', '(GMT+01:00) Vienna'),
(50, 'Europe/Warsaw', '(GMT+01:00) Warsaw'),
(51, 'Europe/Zagreb', '(GMT+01:00) Zagreb'),
(52, 'Europe/Athens', '(GMT+02:00) Athens'),
(53, 'Europe/Bucharest', '(GMT+02:00) Bucharest'),
(54, 'Africa/Cairo', '(GMT+02:00) Cairo'),
(55, 'Africa/Harare', '(GMT+02:00) Harare'),
(56, 'Europe/Helsinki', '(GMT+02:00) Helsinki'),
(57, 'Europe/Istanbul', '(GMT+02:00) Istanbul'),
(58, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem'),
(59, 'Europe/Kiev', '(GMT+02:00) Kyiv'),
(60, 'Europe/Minsk', '(GMT+02:00) Minsk'),
(61, 'Europe/Riga', '(GMT+02:00) Riga'),
(62, 'Europe/Sofia', '(GMT+02:00) Sofia'),
(63, 'Europe/Tallinn', '(GMT+02:00) Tallinn'),
(64, 'Europe/Vilnius', '(GMT+02:00) Vilnius'),
(65, 'Asia/Baghdad', '(GMT+03:00) Baghdad'),
(66, 'Asia/Kuwait', '(GMT+03:00) Kuwait'),
(67, 'Africa/Nairobi', '(GMT+03:00) Nairobi'),
(68, 'Asia/Riyadh', '(GMT+03:00) Riyadh'),
(69, 'Asia/Tehran', '(GMT+03:30) Tehran'),
(70, 'Europe/Moscow', '(GMT+04:00) Moscow'),
(71, 'Asia/Baku', '(GMT+04:00) Baku'),
(72, 'Europe/Volgograd', '(GMT+04:00) Volgograd'),
(73, 'Asia/Muscat', '(GMT+04:00) Muscat'),
(74, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi'),
(75, 'Asia/Yerevan', '(GMT+04:00) Yerevan'),
(76, 'Asia/Kabul', '(GMT+04:30) Kabul'),
(77, 'Asia/Karachi', '(GMT+05:00) Karachi'),
(78, 'Asia/Tashkent', '(GMT+05:00) Tashkent'),
(79, 'Asia/Kolkata', '(GMT+05:30) Kolkata'),
(80, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu'),
(81, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg'),
(82, 'Asia/Almaty', '(GMT+06:00) Almaty'),
(83, 'Asia/Dhaka', '(GMT+06:00) Dhaka'),
(84, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk'),
(85, 'Asia/Bangkok', '(GMT+07:00) Bangkok'),
(86, 'Asia/Ho_Chi_Minh', '(GMT+07.00) Ho Chi Minh'),
(87, 'Asia/Jakarta', '(GMT+07:00) Jakarta'),
(88, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk'),
(89, 'Asia/Chongqing', '(GMT+08:00) Chongqing'),
(90, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong'),
(91, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur'),
(92, 'Australia/Perth', '(GMT+08:00) Perth'),
(93, 'Asia/Singapore', '(GMT+08:00) Singapore'),
(94, 'Asia/Taipei', '(GMT+08:00) Taipei'),
(95, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar'),
(96, 'Asia/Urumqi', '(GMT+08:00) Urumqi'),
(97, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk'),
(98, 'Asia/Seoul', '(GMT+09:00) Seoul'),
(99, 'Asia/Tokyo', '(GMT+09:00) Tokyo'),
(100, 'Australia/Adelaide', '(GMT+09:30) Adelaide'),
(101, 'Australia/Darwin', '(GMT+09:30) Darwin'),
(102, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk'),
(103, 'Australia/Brisbane', '(GMT+10:00) Brisbane'),
(104, 'Australia/Canberra', '(GMT+10:00) Canberra'),
(105, 'Pacific/Guam', '(GMT+10:00) Guam'),
(106, 'Australia/Hobart', '(GMT+10:00) Hobart'),
(107, 'Australia/Melbourne', '(GMT+10:00) Melbourne'),
(108, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby'),
(109, 'Australia/Sydney', '(GMT+10:00) Sydney'),
(110, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok'),
(111, 'Asia/Magadan', '(GMT+12:00) Magadan'),
(112, 'Pacific/Auckland', '(GMT+12:00) Auckland'),
(113, 'Pacific/Fiji', '(GMT+12:00) Fiji');

-- --------------------------------------------------------

--
-- Table structure for table `time_format`
--

CREATE TABLE `time_format` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_format`
--

INSERT INTO `time_format` (`id`, `format`) VALUES
(1, 'H:i:s'),
(2, 'H.i.s');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ban` tinyint(1) NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `ext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` int(11) NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_sign` text COLLATE utf8_unicode_ci NOT NULL,
  `account_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `assign_group` int(10) UNSIGNED DEFAULT NULL,
  `primary_dpt` int(10) UNSIGNED DEFAULT NULL,
  `agent_tzone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `daylight_save` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit_access` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `directory_listing` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vacation_mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `first_name`, `last_name`, `gender`, `email`, `ban`, `password`, `active`, `is_delete`, `ext`, `country_code`, `phone_number`, `mobile`, `agent_sign`, `account_type`, `account_status`, `assign_group`, `primary_dpt`, `agent_tzone`, `daylight_save`, `limit_access`, `directory_listing`, `vacation_mode`, `company`, `role`, `internal_note`, `profile_pic`, `remember_token`, `flag`, `created_at`, `updated_at`, `user_language`) VALUES
(86, 'NNjuguna', 'Njoki', 'Njuguna', 0, 'ms.nairobinorth@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', 1, 1, '', '', '', '', '', '', 'admin', '', '', 'kVgkOPZ5kygx3l2pRWzQ2H5elnRKVpcYJT7VXmPbPYbtmxTqA7GII3g8R4xX', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'en'),
(87, 'MMurugi', 'Mary', 'Murugi', 0, 'ms.nairobisouth@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', 1, 1, '', '', '', '', '', '', 'admin', '', '', NULL, 2, '0000-00-00 00:00:00', '2022-01-17 11:16:04', NULL),
(88, 'BEchesah', 'Brian', 'Echesah', 0, 'ms.coast@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', 1, 1, '', '', '', '', '', '', 'admin', '', '', 'WcJbtHav08Tp6vjMd9dan4ewnI4sRu1prS5mci46jj5Eck9gSymFuBuKQBAd', 1, '0000-00-00 00:00:00', '2022-01-18 06:31:45', NULL),
(89, 'HWasuna', 'Heckman', 'Wasuna', 0, 'ms.central@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'tAWkjPMOwO0mLbEdWmfYuJrxEiBsefGJ8I9V7XCPRWw2VV7qpOrGbV3TkAUR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(90, 'RSigei', 'Robert', 'Sigei', 0, 'ms.riftvalley@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'user', '', '', NULL, 2, '0000-00-00 00:00:00', '2022-01-22 06:56:14', NULL),
(91, 'SOchieng', 'Steve ', 'Ochieng', 0, 'ms.nyanza@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'kobqMwmKXgU6ry1BNFohJpDYKWZD16I5r13KjZmJk95NuKK5567iEV2GGzCE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(92, 'MGone', 'Michael', 'Gone', 0, 'Michael.Gone@BLISSHEALTHCARE.CO.KE', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'KsD1bsvWGMZa6c2CXnWTgeIBvkLURMZwS6Awx2c08owiXdvVRedsa4EQX81a', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(93, 'MKahiti', 'Maria', 'Kahiti', 0, 'hr1@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', '9PhkRI7DgSMW4SGAEePudMNOn4mAoOt3EmlbEh2l0CzEIVbMw1ysM2Zgrvsn', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(94, 'AMutua', 'Agnes', 'Mutua', 0, 'hr4@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'user', '', '', 'PQifr34wxvBWGVhwaVeP9NWVp5Bpwr9CyEiz8y5fwHxv72XxyO0wVaMADd5Y', 2, '0000-00-00 00:00:00', '2022-01-18 05:23:14', NULL),
(95, 'GMbiti', 'Grace', 'Mbiti', 0, 'hr.cluster1@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'Zd7MIMiSd17GLAAGfnVEZNzZYVM3NOwhPMqU8r0IOtVPmRn4qeeaYA4FuAM1', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(96, 'LOdhiambo', 'Linda', 'Odhiambo', 0, 'hr2@blisshealthcare.co.ke', 0, '$2y$10$A.9bo8OhlSCh2dSpSej3seuNULIGcNq2kOXujQzDE2Yf025ycHErO', 1, 0, '', 0, '', NULL, '', '', '', 1, 1, '', '', '', '', '', '', 'admin', '', '', '3JhRRH7jGqkqqpHkq5bDQiK5vOTcVraMhO8x5gLFLWZMaNBOkDChNjYRadET', 2, '0000-00-00 00:00:00', '2022-01-18 03:52:00', NULL),
(97, 'JOyando', 'Juliet', 'Oyando', 0, 'hr5@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'KNmLYvgD2FCzqbVeWDXFBrf411K9W1OYtLlRmSTZiFGpVyqtMfeEMZ3TRltX', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(98, 'SMwale', 'Stephen', 'Mwale', 0, 'Stephen.Mwale@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'tofKsqZ5xS8fNyMwQU7s2oxR9oBTyX5E0XynxxguoLdgcx8v8FuzCcaU0nuE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(99, 'BOmondi', 'Brenda', 'Omondi', 0, 'hr.cluster2@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 'qqGxOtarcp2aLZTTAVs0qQ4PdbVcwptI2eayffwS394snqisbwx5iStN8sTx', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(100, 'HVigedi', 'Harrison', 'Vigedi', 0, 'harrison.vigedi@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', '6sqU8Cs5R14f8NCzSp7P4it9eBIIyN2b5kcGvHNNBFJdemXdjbXoDlnsa2iU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(101, 'FOmune', 'Felix', 'Omune', 0, 'radiology@blisshealthcare.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(103, 'mmetrine', 'Metrine', 'Metrine', 0, 'peris@gmail.com', 0, '$2y$10$QfN4tm1TW181G/FgCmGTqewTLHXM0tg4Nc1RcQuMYU.jq/QxMiBNW', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'user', '', '', NULL, 0, '2022-01-07 06:07:38', '2022-01-07 06:07:38', NULL),
(104, 'medical', 'medical', 'medical', 0, 'medical@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(105, 'akinyanjui', 'andrew', 'kinyanjui', 0, 'andrew.kinyanjui@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(106, 'support', 'support', 'MAKL', 0, 'support@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(107, 'sjoy', 'sheila', 'joy', 0, 'sheila.joy@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(108, 'outbound', 'outbound', 'outbound', 0, 'Outbound@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(109, 'mpramanik', 'meenakshi', 'pramanik', 0, 'Meenakshi.P@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(110, 'service', 'service', 'excellence', 0, 'service.excellence@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(111, 'teamlead', 'team', 'lead', 0, 'cs@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(112, 'MSingh', 'Mrityunjay', 'Singh', 0, 'Mrityunjay.Singh@makl.co.ke', 0, '$2y$10$FiGWJLFb4dAi6KXxSa5iFO2GkEht.w5up2V0TkcIA8ux7rmJfCykK', 1, 0, '', 0, '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', 'agent', '', '', 't1GbwouBrBODyUzrhbz7RyW5HpXR6fCB9SBwriTrGryNLzEAlJ4uaGnfxQwl', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_updated`
--

CREATE TABLE `users_updated` (
  `COL 1` varchar(2) DEFAULT NULL,
  `COL 2` varchar(11) DEFAULT NULL,
  `COL 3` varchar(10) DEFAULT NULL,
  `COL 4` varchar(10) DEFAULT NULL,
  `COL 5` varchar(6) DEFAULT NULL,
  `COL 6` varchar(40) DEFAULT NULL,
  `COL 7` varchar(3) DEFAULT NULL,
  `COL 8` varchar(60) DEFAULT NULL,
  `COL 9` varchar(6) DEFAULT NULL,
  `COL 10` varchar(9) DEFAULT NULL,
  `COL 11` varchar(3) DEFAULT NULL,
  `COL 12` varchar(12) DEFAULT NULL,
  `COL 13` varchar(12) DEFAULT NULL,
  `COL 14` varchar(6) DEFAULT NULL,
  `COL 15` varchar(10) DEFAULT NULL,
  `COL 16` varchar(12) DEFAULT NULL,
  `COL 17` varchar(14) DEFAULT NULL,
  `COL 18` varchar(12) DEFAULT NULL,
  `COL 19` varchar(11) DEFAULT NULL,
  `COL 20` varchar(11) DEFAULT NULL,
  `COL 21` varchar(13) DEFAULT NULL,
  `COL 22` varchar(12) DEFAULT NULL,
  `COL 23` varchar(17) DEFAULT NULL,
  `COL 24` varchar(13) DEFAULT NULL,
  `COL 25` varchar(7) DEFAULT NULL,
  `COL 26` varchar(5) DEFAULT NULL,
  `COL 27` varchar(13) DEFAULT NULL,
  `COL 28` varchar(11) DEFAULT NULL,
  `COL 29` varchar(60) DEFAULT NULL,
  `COL 30` varchar(4) DEFAULT NULL,
  `COL 31` varchar(15) DEFAULT NULL,
  `COL 32` varchar(16) DEFAULT NULL,
  `COL 33` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_additional_infos`
--

CREATE TABLE `user_additional_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_organization`
--

CREATE TABLE `user_assign_organization` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_assign_organization`
--

INSERT INTO `user_assign_organization` (`id`, `org_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 11, '2021-08-31 02:37:00', '2021-08-31 02:37:00'),
(6, 1, 5, '2021-09-15 09:23:26', '2021-09-15 09:23:26'),
(7, 1, 103, '2022-01-07 06:07:38', '2022-01-07 06:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`id`, `notification_id`, `user_id`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, '2016-12-13 03:45:20', '2016-12-13 03:45:20'),
(2, 1, 1, 1, '2016-12-13 03:45:20', '2021-09-13 11:38:56'),
(3, 2, 2, 0, '2016-12-13 03:50:56', '2016-12-13 03:50:56'),
(4, 2, 1, 1, '2016-12-13 03:50:56', '2021-09-13 11:38:56'),
(5, 3, 2, 0, '2016-12-13 03:55:55', '2016-12-13 03:55:55'),
(6, 3, 1, 1, '2016-12-13 03:55:55', '2021-09-13 11:38:56'),
(7, 4, 2, 0, '2016-12-13 03:58:40', '2016-12-13 03:58:40'),
(8, 4, 1, 1, '2016-12-13 03:58:40', '2021-09-13 11:38:56'),
(9, 5, 2, 0, '2016-12-13 04:01:55', '2016-12-13 04:01:55'),
(10, 5, 1, 1, '2016-12-13 04:01:55', '2021-09-13 11:38:56'),
(11, 6, 2, 0, '2016-12-13 04:02:49', '2016-12-13 04:02:49'),
(12, 6, 1, 1, '2016-12-13 04:02:49', '2021-09-13 11:38:56'),
(15, 8, 2, 0, '2021-08-06 01:42:59', '2021-08-06 01:42:59'),
(16, 8, 1, 1, '2021-08-06 01:42:59', '2021-09-13 11:38:56'),
(17, 9, 2, 0, '2021-08-09 03:23:43', '2021-08-09 03:23:43'),
(18, 9, 1, 1, '2021-08-09 03:23:43', '2021-09-13 11:38:56'),
(19, 9, 10, 0, '2021-08-09 03:23:43', '2021-08-09 03:23:43'),
(20, 10, 2, 0, '2021-08-16 02:35:40', '2021-08-16 02:35:40'),
(21, 10, 1, 1, '2021-08-16 02:35:40', '2021-09-13 11:38:56'),
(22, 10, 10, 0, '2021-08-16 02:35:40', '2021-08-16 02:35:40'),
(23, 11, 2, 0, '2021-08-17 23:38:43', '2021-08-17 23:38:43'),
(24, 11, 1, 1, '2021-08-17 23:38:43', '2021-09-13 11:38:56'),
(25, 11, 10, 0, '2021-08-17 23:38:43', '2021-08-17 23:38:43'),
(26, 12, 2, 0, '2021-08-18 01:47:14', '2021-08-18 01:47:14'),
(27, 12, 1, 1, '2021-08-18 01:47:14', '2021-09-13 11:38:56'),
(28, 12, 10, 0, '2021-08-18 01:47:14', '2021-08-18 01:47:14'),
(29, 13, 2, 0, '2021-08-18 01:51:48', '2021-08-18 01:51:48'),
(30, 13, 1, 1, '2021-08-18 01:51:48', '2021-09-13 11:38:56'),
(31, 13, 10, 0, '2021-08-18 01:51:48', '2021-08-18 01:51:48'),
(32, 14, 2, 0, '2021-08-18 01:54:08', '2021-08-18 01:54:08'),
(33, 14, 1, 1, '2021-08-18 01:54:08', '2021-09-13 11:38:56'),
(34, 14, 10, 0, '2021-08-18 01:54:08', '2021-08-18 01:54:08'),
(35, 15, 2, 0, '2021-08-18 02:06:19', '2021-08-18 02:06:19'),
(36, 15, 1, 1, '2021-08-18 02:06:19', '2021-09-13 11:38:56'),
(37, 15, 10, 0, '2021-08-18 02:06:19', '2021-08-18 02:06:19'),
(38, 16, 2, 0, '2021-08-18 02:06:58', '2021-08-18 02:06:58'),
(39, 16, 1, 1, '2021-08-18 02:06:58', '2021-09-13 11:38:56'),
(40, 16, 10, 0, '2021-08-18 02:06:58', '2021-08-18 02:06:58'),
(41, 17, 2, 0, '2021-08-18 02:31:25', '2021-08-18 02:31:25'),
(42, 17, 1, 1, '2021-08-18 02:31:25', '2021-09-13 11:38:56'),
(43, 17, 10, 0, '2021-08-18 02:31:25', '2021-08-18 02:31:25'),
(44, 18, 2, 0, '2021-08-18 02:39:01', '2021-08-18 02:39:01'),
(45, 18, 1, 1, '2021-08-18 02:39:01', '2021-09-13 11:38:56'),
(46, 18, 10, 0, '2021-08-18 02:39:01', '2021-08-18 02:39:01'),
(47, 19, 2, 0, '2021-08-20 01:59:29', '2021-08-20 01:59:29'),
(48, 19, 1, 1, '2021-08-20 01:59:29', '2021-09-13 11:38:56'),
(49, 19, 10, 0, '2021-08-20 01:59:29', '2021-08-20 01:59:29'),
(50, 20, 2, 0, '2021-08-20 03:05:30', '2021-08-20 03:05:30'),
(51, 20, 1, 1, '2021-08-20 03:05:30', '2021-09-13 11:38:56'),
(52, 20, 10, 0, '2021-08-20 03:05:30', '2021-08-20 03:05:30'),
(53, 21, 2, 0, '2021-08-20 03:08:58', '2021-08-20 03:08:58'),
(54, 21, 1, 1, '2021-08-20 03:08:58', '2021-09-13 11:38:56'),
(55, 21, 10, 0, '2021-08-20 03:08:58', '2021-08-20 03:08:58'),
(56, 22, 2, 0, '2021-08-20 04:46:34', '2021-08-20 04:46:34'),
(57, 22, 1, 1, '2021-08-20 04:46:34', '2021-09-13 11:38:56'),
(58, 22, 10, 0, '2021-08-20 04:46:34', '2021-08-20 04:46:34'),
(59, 23, 2, 0, '2021-08-20 04:49:01', '2021-08-20 04:49:01'),
(60, 23, 1, 1, '2021-08-20 04:49:01', '2021-09-13 11:38:56'),
(61, 23, 10, 0, '2021-08-20 04:49:01', '2021-08-20 04:49:01'),
(62, 24, 2, 0, '2021-08-20 06:59:21', '2021-08-20 06:59:21'),
(63, 24, 1, 1, '2021-08-20 06:59:21', '2021-09-13 11:38:56'),
(64, 24, 10, 0, '2021-08-20 06:59:21', '2021-08-20 06:59:21'),
(65, 25, 2, 0, '2021-08-20 07:09:09', '2021-08-20 07:09:09'),
(66, 25, 1, 1, '2021-08-20 07:09:09', '2021-09-13 11:38:56'),
(67, 25, 10, 0, '2021-08-20 07:09:09', '2021-08-20 07:09:09'),
(68, 26, 2, 0, '2021-08-20 07:13:28', '2021-08-20 07:13:28'),
(69, 26, 1, 1, '2021-08-20 07:13:28', '2021-09-13 11:38:56'),
(70, 26, 10, 0, '2021-08-20 07:13:28', '2021-08-20 07:13:28'),
(71, 27, 2, 0, '2021-08-21 01:48:10', '2021-08-21 01:48:10'),
(72, 27, 1, 1, '2021-08-21 01:48:10', '2021-09-13 11:38:56'),
(73, 27, 10, 0, '2021-08-21 01:48:10', '2021-08-21 01:48:10'),
(74, 28, 2, 0, '2021-08-21 01:51:08', '2021-08-21 01:51:08'),
(75, 28, 1, 1, '2021-08-21 01:51:08', '2021-09-13 11:38:56'),
(76, 28, 10, 0, '2021-08-21 01:51:08', '2021-08-21 01:51:08'),
(77, 29, 2, 0, '2021-08-23 19:35:38', '2021-08-23 19:35:38'),
(78, 29, 1, 1, '2021-08-23 19:35:38', '2021-09-13 11:38:56'),
(79, 29, 10, 0, '2021-08-23 19:35:38', '2021-08-23 19:35:38'),
(80, 30, 2, 0, '2021-08-23 19:46:12', '2021-08-23 19:46:12'),
(81, 30, 1, 1, '2021-08-23 19:46:12', '2021-09-13 11:38:56'),
(82, 30, 10, 0, '2021-08-23 19:46:12', '2021-08-23 19:46:12'),
(83, 31, 2, 0, '2021-08-23 19:48:05', '2021-08-23 19:48:05'),
(84, 31, 1, 1, '2021-08-23 19:48:05', '2021-09-13 11:38:56'),
(85, 31, 10, 0, '2021-08-23 19:48:05', '2021-08-23 19:48:05'),
(86, 32, 2, 0, '2021-08-23 19:49:03', '2021-08-23 19:49:03'),
(87, 32, 1, 1, '2021-08-23 19:49:03', '2021-09-13 11:38:56'),
(88, 32, 10, 0, '2021-08-23 19:49:03', '2021-08-23 19:49:03'),
(89, 33, 2, 0, '2021-08-23 19:50:35', '2021-08-23 19:50:35'),
(90, 33, 1, 1, '2021-08-23 19:50:35', '2021-09-13 11:38:56'),
(91, 33, 10, 0, '2021-08-23 19:50:35', '2021-08-23 19:50:35'),
(92, 34, 2, 0, '2021-08-24 00:58:10', '2021-08-24 00:58:10'),
(93, 34, 1, 1, '2021-08-24 00:58:10', '2021-09-13 11:38:56'),
(94, 34, 10, 0, '2021-08-24 00:58:10', '2021-08-24 00:58:10'),
(95, 35, 2, 0, '2021-08-24 02:14:39', '2021-08-24 02:14:39'),
(96, 35, 1, 1, '2021-08-24 02:14:39', '2021-09-13 11:38:56'),
(97, 35, 10, 0, '2021-08-24 02:14:39', '2021-08-24 02:14:39'),
(98, 36, 2, 0, '2021-08-25 02:43:19', '2021-08-25 02:43:19'),
(99, 36, 1, 1, '2021-08-25 02:43:19', '2021-09-13 11:38:56'),
(100, 36, 10, 0, '2021-08-25 02:43:19', '2021-08-25 02:43:19'),
(101, 37, 2, 0, '2021-08-26 01:46:52', '2021-08-26 01:46:52'),
(102, 37, 1, 1, '2021-08-26 01:46:52', '2021-09-13 11:38:56'),
(103, 37, 10, 0, '2021-08-26 01:46:52', '2021-08-26 01:46:52'),
(104, 38, 2, 0, '2021-08-26 02:57:27', '2021-08-26 02:57:27'),
(105, 38, 1, 1, '2021-08-26 02:57:27', '2021-09-13 11:38:56'),
(106, 38, 10, 0, '2021-08-26 02:57:27', '2021-08-26 02:57:27'),
(107, 39, 2, 0, '2021-08-26 07:04:34', '2021-08-26 07:04:34'),
(108, 39, 1, 1, '2021-08-26 07:04:34', '2021-09-13 11:38:56'),
(109, 39, 10, 0, '2021-08-26 07:04:34', '2021-08-26 07:04:34'),
(110, 40, 2, 0, '2021-08-26 07:08:46', '2021-08-26 07:08:46'),
(111, 40, 1, 1, '2021-08-26 07:08:46', '2021-09-13 11:38:56'),
(112, 40, 10, 0, '2021-08-26 07:08:46', '2021-08-26 07:08:46'),
(113, 41, 2, 0, '2021-08-26 07:15:12', '2021-08-26 07:15:12'),
(114, 41, 1, 1, '2021-08-26 07:15:12', '2021-09-13 11:38:56'),
(115, 41, 10, 0, '2021-08-26 07:15:12', '2021-08-26 07:15:12'),
(116, 42, 2, 0, '2021-08-27 02:54:33', '2021-08-27 02:54:33'),
(117, 42, 1, 1, '2021-08-27 02:54:33', '2021-09-13 11:38:56'),
(118, 42, 10, 0, '2021-08-27 02:54:33', '2021-08-27 02:54:33'),
(119, 43, 2, 0, '2021-08-27 06:58:57', '2021-08-27 06:58:57'),
(120, 43, 1, 1, '2021-08-27 06:58:57', '2021-09-13 11:38:56'),
(121, 43, 10, 0, '2021-08-27 06:58:57', '2021-08-27 06:58:57'),
(122, 44, 2, 0, '2021-08-27 07:05:17', '2021-08-27 07:05:17'),
(123, 44, 1, 1, '2021-08-27 07:05:17', '2021-09-13 11:38:56'),
(124, 44, 10, 0, '2021-08-27 07:05:17', '2021-08-27 07:05:17'),
(125, 45, 2, 0, '2021-08-27 07:11:02', '2021-08-27 07:11:02'),
(126, 45, 1, 1, '2021-08-27 07:11:02', '2021-09-13 11:38:56'),
(127, 45, 10, 0, '2021-08-27 07:11:02', '2021-08-27 07:11:02'),
(128, 46, 2, 0, '2021-08-28 00:38:25', '2021-08-28 00:38:25'),
(129, 46, 1, 1, '2021-08-28 00:38:25', '2021-09-13 11:38:56'),
(130, 46, 10, 0, '2021-08-28 00:38:25', '2021-08-28 00:38:25'),
(131, 47, 2, 0, '2021-08-30 00:59:23', '2021-08-30 00:59:23'),
(132, 47, 1, 1, '2021-08-30 00:59:23', '2021-09-13 11:38:56'),
(133, 47, 10, 0, '2021-08-30 00:59:23', '2021-08-30 00:59:23'),
(134, 48, 2, 0, '2021-08-30 01:04:13', '2021-08-30 01:04:13'),
(135, 48, 1, 1, '2021-08-30 01:04:13', '2021-09-13 11:38:56'),
(136, 48, 10, 0, '2021-08-30 01:04:13', '2021-08-30 01:04:13'),
(137, 49, 2, 0, '2021-08-30 01:09:04', '2021-08-30 01:09:04'),
(138, 49, 1, 1, '2021-08-30 01:09:04', '2021-09-13 11:38:56'),
(139, 49, 10, 0, '2021-08-30 01:09:04', '2021-08-30 01:09:04'),
(140, 50, 2, 0, '2021-08-30 01:12:11', '2021-08-30 01:12:11'),
(141, 50, 1, 1, '2021-08-30 01:12:11', '2021-09-13 11:38:56'),
(142, 50, 10, 0, '2021-08-30 01:12:11', '2021-08-30 01:12:11'),
(143, 51, 2, 0, '2021-08-30 01:21:45', '2021-08-30 01:21:45'),
(144, 51, 1, 1, '2021-08-30 01:21:45', '2021-09-13 11:38:56'),
(145, 51, 10, 0, '2021-08-30 01:21:45', '2021-08-30 01:21:45'),
(146, 52, 2, 0, '2021-08-30 01:24:09', '2021-08-30 01:24:09'),
(147, 52, 1, 1, '2021-08-30 01:24:09', '2021-09-13 11:38:56'),
(148, 52, 10, 0, '2021-08-30 01:24:09', '2021-08-30 01:24:09'),
(149, 53, 2, 0, '2021-08-30 01:38:37', '2021-08-30 01:38:37'),
(150, 53, 1, 1, '2021-08-30 01:38:37', '2021-09-13 11:38:56'),
(151, 53, 10, 0, '2021-08-30 01:38:37', '2021-08-30 01:38:37'),
(152, 54, 2, 0, '2021-08-30 02:05:53', '2021-08-30 02:05:53'),
(153, 54, 1, 1, '2021-08-30 02:05:53', '2021-09-13 11:38:56'),
(154, 54, 10, 0, '2021-08-30 02:05:53', '2021-08-30 02:05:53'),
(155, 55, 2, 0, '2021-08-30 03:37:33', '2021-08-30 03:37:33'),
(156, 55, 1, 1, '2021-08-30 03:37:33', '2021-09-13 11:38:56'),
(157, 55, 10, 0, '2021-08-30 03:37:33', '2021-08-30 03:37:33'),
(158, 56, 2, 0, '2021-08-30 03:47:32', '2021-08-30 03:47:32'),
(159, 56, 1, 1, '2021-08-30 03:47:32', '2021-09-13 11:38:56'),
(160, 56, 10, 0, '2021-08-30 03:47:32', '2021-08-30 03:47:32'),
(161, 57, 2, 0, '2021-08-30 04:21:02', '2021-08-30 04:21:02'),
(162, 57, 1, 1, '2021-08-30 04:21:02', '2021-09-13 11:38:56'),
(163, 57, 10, 0, '2021-08-30 04:21:02', '2021-08-30 04:21:02'),
(164, 58, 2, 0, '2021-08-30 04:42:21', '2021-08-30 04:42:21'),
(165, 58, 1, 1, '2021-08-30 04:42:21', '2021-09-13 11:38:56'),
(166, 58, 10, 0, '2021-08-30 04:42:21', '2021-08-30 04:42:21'),
(167, 59, 2, 0, '2021-08-30 04:44:19', '2021-08-30 04:44:19'),
(168, 59, 1, 1, '2021-08-30 04:44:19', '2021-09-13 11:38:56'),
(169, 59, 10, 0, '2021-08-30 04:44:19', '2021-08-30 04:44:19'),
(170, 60, 2, 0, '2021-08-30 04:54:22', '2021-08-30 04:54:22'),
(171, 60, 1, 1, '2021-08-30 04:54:22', '2021-09-13 11:38:56'),
(172, 60, 10, 0, '2021-08-30 04:54:22', '2021-08-30 04:54:22'),
(173, 61, 2, 0, '2021-08-30 04:54:48', '2021-08-30 04:54:48'),
(174, 61, 1, 1, '2021-08-30 04:54:48', '2021-09-13 11:38:56'),
(175, 61, 10, 0, '2021-08-30 04:54:48', '2021-08-30 04:54:48'),
(176, 62, 2, 0, '2021-08-30 05:03:46', '2021-08-30 05:03:46'),
(177, 62, 1, 1, '2021-08-30 05:03:46', '2021-09-13 11:38:56'),
(178, 62, 10, 0, '2021-08-30 05:03:46', '2021-08-30 05:03:46'),
(179, 63, 2, 0, '2021-08-30 05:06:35', '2021-08-30 05:06:35'),
(180, 63, 1, 1, '2021-08-30 05:06:35', '2021-09-13 11:38:56'),
(181, 63, 10, 0, '2021-08-30 05:06:35', '2021-08-30 05:06:35'),
(182, 64, 2, 0, '2021-08-30 06:02:49', '2021-08-30 06:02:49'),
(183, 64, 1, 1, '2021-08-30 06:02:49', '2021-09-13 11:38:56'),
(184, 64, 10, 0, '2021-08-30 06:02:49', '2021-08-30 06:02:49'),
(185, 65, 2, 0, '2021-08-30 06:05:45', '2021-08-30 06:05:45'),
(186, 65, 1, 1, '2021-08-30 06:05:45', '2021-09-13 11:38:56'),
(187, 65, 10, 0, '2021-08-30 06:05:45', '2021-08-30 06:05:45'),
(188, 66, 2, 0, '2021-08-30 06:15:47', '2021-08-30 06:15:47'),
(189, 66, 1, 1, '2021-08-30 06:15:47', '2021-09-13 11:38:56'),
(190, 66, 10, 0, '2021-08-30 06:15:47', '2021-08-30 06:15:47'),
(191, 67, 2, 0, '2021-08-30 06:17:52', '2021-08-30 06:17:52'),
(192, 67, 1, 1, '2021-08-30 06:17:52', '2021-09-13 11:38:56'),
(193, 67, 10, 0, '2021-08-30 06:17:52', '2021-08-30 06:17:52'),
(194, 68, 2, 0, '2021-08-30 06:19:51', '2021-08-30 06:19:51'),
(195, 68, 1, 1, '2021-08-30 06:19:51', '2021-09-13 11:38:56'),
(196, 68, 10, 0, '2021-08-30 06:19:51', '2021-08-30 06:19:51'),
(197, 69, 2, 0, '2021-08-30 06:20:25', '2021-08-30 06:20:25'),
(198, 69, 1, 1, '2021-08-30 06:20:25', '2021-09-13 11:38:56'),
(199, 69, 10, 0, '2021-08-30 06:20:25', '2021-08-30 06:20:25'),
(200, 70, 2, 0, '2021-08-30 06:22:20', '2021-08-30 06:22:20'),
(201, 70, 1, 1, '2021-08-30 06:22:20', '2021-09-13 11:38:56'),
(202, 70, 10, 0, '2021-08-30 06:22:20', '2021-08-30 06:22:20'),
(203, 71, 2, 0, '2021-08-30 06:29:10', '2021-08-30 06:29:10'),
(204, 71, 1, 1, '2021-08-30 06:29:10', '2021-09-13 11:38:56'),
(205, 71, 10, 0, '2021-08-30 06:29:10', '2021-08-30 06:29:10'),
(206, 72, 2, 0, '2021-08-30 06:40:48', '2021-08-30 06:40:48'),
(207, 72, 1, 1, '2021-08-30 06:40:48', '2021-09-13 11:38:56'),
(208, 72, 10, 0, '2021-08-30 06:40:48', '2021-08-30 06:40:48'),
(209, 73, 2, 0, '2021-08-30 06:43:15', '2021-08-30 06:43:15'),
(210, 73, 1, 1, '2021-08-30 06:43:15', '2021-09-13 11:38:56'),
(211, 73, 10, 0, '2021-08-30 06:43:15', '2021-08-30 06:43:15'),
(212, 74, 2, 0, '2021-08-30 06:46:59', '2021-08-30 06:46:59'),
(213, 74, 1, 1, '2021-08-30 06:46:59', '2021-09-13 11:38:56'),
(214, 74, 10, 0, '2021-08-30 06:46:59', '2021-08-30 06:46:59'),
(215, 75, 2, 0, '2021-08-30 06:55:52', '2021-08-30 06:55:52'),
(216, 75, 1, 1, '2021-08-30 06:55:52', '2021-09-13 11:38:56'),
(217, 75, 10, 0, '2021-08-30 06:55:52', '2021-08-30 06:55:52'),
(218, 76, 2, 0, '2021-08-30 07:05:40', '2021-08-30 07:05:40'),
(219, 76, 1, 1, '2021-08-30 07:05:40', '2021-09-13 11:38:56'),
(220, 76, 10, 0, '2021-08-30 07:05:40', '2021-08-30 07:05:40'),
(221, 77, 2, 0, '2021-08-30 07:42:53', '2021-08-30 07:42:53'),
(222, 77, 1, 1, '2021-08-30 07:42:53', '2021-09-13 11:38:56'),
(223, 77, 10, 0, '2021-08-30 07:42:53', '2021-08-30 07:42:53'),
(224, 78, 2, 0, '2021-08-30 08:05:13', '2021-08-30 08:05:13'),
(225, 78, 1, 1, '2021-08-30 08:05:13', '2021-09-13 11:38:56'),
(226, 78, 10, 0, '2021-08-30 08:05:13', '2021-08-30 08:05:13'),
(227, 79, 2, 0, '2021-08-30 08:09:01', '2021-08-30 08:09:01'),
(228, 79, 1, 1, '2021-08-30 08:09:01', '2021-09-13 11:38:56'),
(229, 79, 10, 0, '2021-08-30 08:09:01', '2021-08-30 08:09:01'),
(230, 80, 2, 0, '2021-08-30 08:09:54', '2021-08-30 08:09:54'),
(231, 80, 1, 1, '2021-08-30 08:09:54', '2021-09-13 11:38:56'),
(232, 80, 10, 0, '2021-08-30 08:09:54', '2021-08-30 08:09:54'),
(233, 81, 2, 0, '2021-08-30 08:12:33', '2021-08-30 08:12:33'),
(234, 81, 1, 1, '2021-08-30 08:12:33', '2021-09-13 11:38:56'),
(235, 81, 10, 0, '2021-08-30 08:12:33', '2021-08-30 08:12:33'),
(236, 82, 2, 0, '2021-08-30 08:14:02', '2021-08-30 08:14:02'),
(237, 82, 1, 1, '2021-08-30 08:14:02', '2021-09-13 11:38:56'),
(238, 82, 10, 0, '2021-08-30 08:14:02', '2021-08-30 08:14:02'),
(239, 83, 2, 0, '2021-08-30 08:14:18', '2021-08-30 08:14:18'),
(240, 83, 1, 1, '2021-08-30 08:14:18', '2021-09-13 11:38:56'),
(241, 83, 10, 0, '2021-08-30 08:14:18', '2021-08-30 08:14:18'),
(242, 84, 2, 0, '2021-08-30 08:23:24', '2021-08-30 08:23:24'),
(243, 84, 1, 1, '2021-08-30 08:23:24', '2021-09-13 11:38:56'),
(244, 84, 10, 0, '2021-08-30 08:23:24', '2021-08-30 08:23:24'),
(245, 85, 2, 0, '2021-08-31 00:48:20', '2021-08-31 00:48:20'),
(246, 85, 1, 1, '2021-08-31 00:48:20', '2021-09-13 11:38:56'),
(247, 85, 10, 0, '2021-08-31 00:48:20', '2021-08-31 00:48:20'),
(248, 86, 2, 0, '2021-08-31 02:43:50', '2021-08-31 02:43:50'),
(249, 86, 1, 1, '2021-08-31 02:43:50', '2021-09-13 11:38:56'),
(250, 86, 10, 0, '2021-08-31 02:43:50', '2021-08-31 02:43:50'),
(251, 87, 2, 0, '2021-08-31 04:57:04', '2021-08-31 04:57:04'),
(252, 87, 1, 1, '2021-08-31 04:57:04', '2021-09-13 11:38:56'),
(253, 87, 10, 0, '2021-08-31 04:57:04', '2021-08-31 04:57:04'),
(254, 88, 2, 0, '2021-08-31 05:07:01', '2021-08-31 05:07:01'),
(255, 88, 1, 1, '2021-08-31 05:07:01', '2021-09-13 11:38:56'),
(256, 88, 10, 0, '2021-08-31 05:07:01', '2021-08-31 05:07:01'),
(257, 89, 2, 0, '2021-08-31 06:30:38', '2021-08-31 06:30:38'),
(258, 89, 1, 1, '2021-08-31 06:30:38', '2021-09-13 11:38:56'),
(259, 89, 10, 0, '2021-08-31 06:30:38', '2021-08-31 06:30:38'),
(260, 90, 2, 0, '2021-08-31 23:34:08', '2021-08-31 23:34:08'),
(261, 90, 1, 1, '2021-08-31 23:34:08', '2021-09-13 11:38:56'),
(262, 90, 10, 0, '2021-08-31 23:34:08', '2021-08-31 23:34:08'),
(263, 91, 2, 0, '2021-08-31 23:44:19', '2021-08-31 23:44:19'),
(264, 91, 1, 1, '2021-08-31 23:44:19', '2021-09-13 11:38:56'),
(265, 91, 10, 0, '2021-08-31 23:44:19', '2021-08-31 23:44:19'),
(266, 92, 2, 0, '2021-08-31 23:50:15', '2021-08-31 23:50:15'),
(267, 92, 1, 1, '2021-08-31 23:50:15', '2021-09-13 11:38:56'),
(268, 92, 10, 0, '2021-08-31 23:50:15', '2021-08-31 23:50:15'),
(269, 93, 2, 0, '2021-08-31 23:52:54', '2021-08-31 23:52:54'),
(270, 93, 1, 1, '2021-08-31 23:52:54', '2021-09-13 11:38:56'),
(271, 93, 10, 0, '2021-08-31 23:52:54', '2021-08-31 23:52:54'),
(272, 94, 2, 0, '2021-09-02 07:23:18', '2021-09-02 07:23:18'),
(273, 94, 1, 1, '2021-09-02 07:23:18', '2021-09-13 11:38:56'),
(274, 94, 10, 0, '2021-09-02 07:23:18', '2021-09-02 07:23:18'),
(275, 95, 2, 0, '2021-09-02 07:24:56', '2021-09-02 07:24:56'),
(276, 95, 1, 1, '2021-09-02 07:24:56', '2021-09-13 11:38:56'),
(277, 95, 10, 0, '2021-09-02 07:24:56', '2021-09-02 07:24:56'),
(278, 96, 2, 0, '2021-09-02 07:28:09', '2021-09-02 07:28:09'),
(279, 96, 1, 1, '2021-09-02 07:28:09', '2021-09-13 11:38:56'),
(280, 96, 10, 0, '2021-09-02 07:28:09', '2021-09-02 07:28:09'),
(281, 97, 2, 0, '2021-09-02 07:30:08', '2021-09-02 07:30:08'),
(282, 97, 1, 1, '2021-09-02 07:30:08', '2021-09-13 11:38:56'),
(283, 97, 10, 0, '2021-09-02 07:30:08', '2021-09-02 07:30:08'),
(284, 98, 2, 0, '2021-09-02 07:31:23', '2021-09-02 07:31:23'),
(285, 98, 1, 1, '2021-09-02 07:31:23', '2021-09-13 11:38:56'),
(286, 98, 10, 0, '2021-09-02 07:31:23', '2021-09-02 07:31:23'),
(287, 99, 2, 0, '2021-09-02 08:37:37', '2021-09-02 08:37:37'),
(288, 99, 1, 1, '2021-09-02 08:37:37', '2021-09-13 11:38:56'),
(289, 99, 10, 0, '2021-09-02 08:37:37', '2021-09-02 08:37:37'),
(290, 100, 2, 0, '2021-09-02 23:38:53', '2021-09-02 23:38:53'),
(291, 100, 1, 1, '2021-09-02 23:38:53', '2021-09-13 11:38:56'),
(292, 100, 10, 0, '2021-09-02 23:38:53', '2021-09-02 23:38:53'),
(293, 101, 2, 0, '2021-09-03 02:28:52', '2021-09-03 02:28:52'),
(294, 101, 1, 1, '2021-09-03 02:28:52', '2021-09-13 11:38:56'),
(295, 101, 10, 0, '2021-09-03 02:28:52', '2021-09-03 02:28:52'),
(296, 102, 2, 0, '2021-09-03 02:38:28', '2021-09-03 02:38:28'),
(297, 102, 1, 1, '2021-09-03 02:38:28', '2021-09-13 11:38:56'),
(298, 102, 10, 0, '2021-09-03 02:38:28', '2021-09-03 02:38:28'),
(299, 103, 2, 0, '2021-09-03 02:54:35', '2021-09-03 02:54:35'),
(300, 103, 1, 1, '2021-09-03 02:54:35', '2021-09-13 11:38:56'),
(301, 103, 10, 0, '2021-09-03 02:54:35', '2021-09-03 02:54:35'),
(302, 104, 2, 0, '2021-09-03 03:00:57', '2021-09-03 03:00:57'),
(303, 104, 1, 1, '2021-09-03 03:00:57', '2021-09-13 11:38:56'),
(304, 104, 10, 0, '2021-09-03 03:00:57', '2021-09-03 03:00:57'),
(305, 105, 2, 0, '2021-09-03 03:52:54', '2021-09-03 03:52:54'),
(306, 105, 1, 1, '2021-09-03 03:52:54', '2021-09-13 11:38:56'),
(307, 105, 10, 0, '2021-09-03 03:52:54', '2021-09-03 03:52:54'),
(308, 106, 2, 0, '2021-09-03 03:53:10', '2021-09-03 03:53:10'),
(309, 106, 1, 1, '2021-09-03 03:53:10', '2021-09-13 11:38:56'),
(310, 106, 10, 0, '2021-09-03 03:53:10', '2021-09-03 03:53:10'),
(311, 107, 2, 0, '2021-09-03 03:54:38', '2021-09-03 03:54:38'),
(312, 107, 1, 1, '2021-09-03 03:54:38', '2021-09-13 11:38:56'),
(313, 107, 10, 0, '2021-09-03 03:54:38', '2021-09-03 03:54:38'),
(314, 108, 2, 0, '2021-09-03 03:55:55', '2021-09-03 03:55:55'),
(315, 108, 1, 1, '2021-09-03 03:55:55', '2021-09-13 11:38:56'),
(316, 108, 10, 0, '2021-09-03 03:55:55', '2021-09-03 03:55:55'),
(317, 109, 2, 0, '2021-09-03 03:57:21', '2021-09-03 03:57:21'),
(318, 109, 1, 1, '2021-09-03 03:57:21', '2021-09-13 11:38:56'),
(319, 109, 10, 0, '2021-09-03 03:57:21', '2021-09-03 03:57:21'),
(320, 110, 2, 0, '2021-09-03 03:58:16', '2021-09-03 03:58:16'),
(321, 110, 1, 1, '2021-09-03 03:58:16', '2021-09-13 11:38:56'),
(322, 110, 10, 0, '2021-09-03 03:58:16', '2021-09-03 03:58:16'),
(323, 111, 2, 0, '2021-09-03 04:05:46', '2021-09-03 04:05:46'),
(324, 111, 1, 1, '2021-09-03 04:05:46', '2021-09-13 11:38:56'),
(325, 111, 10, 0, '2021-09-03 04:05:46', '2021-09-03 04:05:46'),
(326, 112, 2, 0, '2021-09-03 23:46:37', '2021-09-03 23:46:37'),
(327, 112, 1, 1, '2021-09-03 23:46:37', '2021-09-13 11:38:56'),
(328, 112, 10, 0, '2021-09-03 23:46:37', '2021-09-03 23:46:37'),
(329, 113, 2, 0, '2021-09-03 23:55:43', '2021-09-03 23:55:43'),
(330, 113, 1, 1, '2021-09-03 23:55:43', '2021-09-13 11:38:56'),
(331, 113, 10, 0, '2021-09-03 23:55:43', '2021-09-03 23:55:43'),
(332, 114, 2, 0, '2021-09-04 00:02:24', '2021-09-04 00:02:24'),
(333, 114, 1, 1, '2021-09-04 00:02:24', '2021-09-13 11:38:56'),
(334, 114, 10, 0, '2021-09-04 00:02:24', '2021-09-04 00:02:24'),
(335, 115, 2, 0, '2021-09-04 00:04:26', '2021-09-04 00:04:26'),
(336, 115, 1, 1, '2021-09-04 00:04:26', '2021-09-13 11:38:56'),
(337, 115, 10, 0, '2021-09-04 00:04:26', '2021-09-04 00:04:26'),
(338, 116, 2, 0, '2021-09-04 01:03:39', '2021-09-04 01:03:39'),
(339, 116, 1, 1, '2021-09-04 01:03:39', '2021-09-13 11:38:56'),
(340, 116, 10, 0, '2021-09-04 01:03:39', '2021-09-04 01:03:39'),
(341, 117, 2, 0, '2021-09-04 01:41:49', '2021-09-04 01:41:49'),
(342, 117, 1, 1, '2021-09-04 01:41:49', '2021-09-13 11:38:56'),
(343, 117, 10, 0, '2021-09-04 01:41:49', '2021-09-04 01:41:49'),
(344, 118, 2, 0, '2021-09-04 01:43:53', '2021-09-04 01:43:53'),
(345, 118, 1, 1, '2021-09-04 01:43:53', '2021-09-13 11:38:56'),
(346, 118, 10, 0, '2021-09-04 01:43:53', '2021-09-04 01:43:53'),
(347, 119, 2, 0, '2021-09-04 01:46:18', '2021-09-04 01:46:18'),
(348, 119, 1, 1, '2021-09-04 01:46:18', '2021-09-13 11:38:56'),
(349, 119, 10, 0, '2021-09-04 01:46:18', '2021-09-04 01:46:18'),
(350, 120, 2, 0, '2021-09-04 01:48:11', '2021-09-04 01:48:11'),
(351, 120, 1, 1, '2021-09-04 01:48:11', '2021-09-13 11:38:56'),
(352, 120, 10, 0, '2021-09-04 01:48:11', '2021-09-04 01:48:11'),
(353, 121, 2, 0, '2021-09-04 01:52:25', '2021-09-04 01:52:25'),
(354, 121, 1, 1, '2021-09-04 01:52:25', '2021-09-13 11:38:56'),
(355, 121, 10, 0, '2021-09-04 01:52:25', '2021-09-04 01:52:25'),
(356, 122, 2, 0, '2021-09-04 01:53:12', '2021-09-04 01:53:12'),
(357, 122, 1, 1, '2021-09-04 01:53:12', '2021-09-13 11:38:56'),
(358, 122, 10, 0, '2021-09-04 01:53:12', '2021-09-04 01:53:12'),
(359, 123, 2, 0, '2021-09-04 01:57:56', '2021-09-04 01:57:56'),
(360, 123, 1, 1, '2021-09-04 01:57:56', '2021-09-13 11:38:56'),
(361, 123, 10, 0, '2021-09-04 01:57:56', '2021-09-04 01:57:56'),
(362, 124, 2, 0, '2021-09-04 02:01:17', '2021-09-04 02:01:17'),
(363, 124, 1, 1, '2021-09-04 02:01:17', '2021-09-13 11:38:56'),
(364, 124, 10, 0, '2021-09-04 02:01:17', '2021-09-04 02:01:17'),
(365, 125, 2, 0, '2021-09-04 02:09:17', '2021-09-04 02:09:17'),
(366, 125, 1, 1, '2021-09-04 02:09:17', '2021-09-13 11:38:56'),
(367, 125, 10, 0, '2021-09-04 02:09:17', '2021-09-04 02:09:17'),
(368, 126, 2, 0, '2021-09-04 02:11:04', '2021-09-04 02:11:04'),
(369, 126, 1, 1, '2021-09-04 02:11:04', '2021-09-13 11:38:56'),
(370, 126, 10, 0, '2021-09-04 02:11:04', '2021-09-04 02:11:04'),
(371, 127, 2, 0, '2021-09-04 02:13:00', '2021-09-04 02:13:00'),
(372, 127, 1, 1, '2021-09-04 02:13:00', '2021-09-13 11:38:56'),
(373, 127, 10, 0, '2021-09-04 02:13:00', '2021-09-04 02:13:00'),
(374, 128, 2, 0, '2021-09-04 02:14:36', '2021-09-04 02:14:36'),
(375, 128, 1, 1, '2021-09-04 02:14:36', '2021-09-13 11:38:56'),
(376, 128, 10, 0, '2021-09-04 02:14:36', '2021-09-04 02:14:36'),
(377, 129, 2, 0, '2021-09-07 01:04:56', '2021-09-07 01:04:56'),
(378, 129, 1, 1, '2021-09-07 01:04:56', '2021-09-13 11:38:56'),
(379, 129, 10, 0, '2021-09-07 01:04:56', '2021-09-07 01:04:56'),
(380, 130, 2, 0, '2021-09-07 01:08:46', '2021-09-07 01:08:46'),
(381, 130, 1, 1, '2021-09-07 01:08:46', '2021-09-13 11:38:56'),
(382, 130, 10, 0, '2021-09-07 01:08:46', '2021-09-07 01:08:46'),
(383, 131, 2, 0, '2021-09-07 01:10:19', '2021-09-07 01:10:19'),
(384, 131, 1, 1, '2021-09-07 01:10:19', '2021-09-13 11:38:56'),
(385, 131, 10, 0, '2021-09-07 01:10:19', '2021-09-07 01:10:19'),
(386, 132, 2, 0, '2021-09-07 01:11:25', '2021-09-07 01:11:25'),
(387, 132, 1, 1, '2021-09-07 01:11:25', '2021-09-13 11:38:56'),
(388, 132, 10, 0, '2021-09-07 01:11:25', '2021-09-07 01:11:25'),
(389, 133, 2, 0, '2021-09-07 01:12:24', '2021-09-07 01:12:24'),
(390, 133, 1, 1, '2021-09-07 01:12:24', '2021-09-13 11:38:56'),
(391, 133, 10, 0, '2021-09-07 01:12:24', '2021-09-07 01:12:24'),
(392, 134, 2, 0, '2021-09-07 03:09:00', '2021-09-07 03:09:00'),
(393, 134, 1, 1, '2021-09-07 03:09:00', '2021-09-13 11:38:56'),
(394, 134, 10, 0, '2021-09-07 03:09:00', '2021-09-07 03:09:00'),
(395, 135, 2, 0, '2021-09-07 03:52:02', '2021-09-07 03:52:02'),
(396, 135, 1, 1, '2021-09-07 03:52:02', '2021-09-13 11:38:56'),
(397, 135, 10, 0, '2021-09-07 03:52:02', '2021-09-07 03:52:02'),
(398, 136, 2, 0, '2021-09-08 05:47:22', '2021-09-08 05:47:22'),
(399, 136, 1, 1, '2021-09-08 05:47:22', '2021-09-13 11:38:56'),
(400, 136, 10, 0, '2021-09-08 05:47:22', '2021-09-08 05:47:22'),
(401, 137, 2, 0, '2021-09-08 05:48:50', '2021-09-08 05:48:50'),
(402, 137, 1, 1, '2021-09-08 05:48:50', '2021-09-13 11:38:56'),
(403, 137, 10, 0, '2021-09-08 05:48:50', '2021-09-08 05:48:50'),
(404, 138, 2, 0, '2021-09-08 06:01:00', '2021-09-08 06:01:00'),
(405, 138, 1, 1, '2021-09-08 06:01:00', '2021-09-13 11:38:56'),
(406, 138, 10, 0, '2021-09-08 06:01:00', '2021-09-08 06:01:00'),
(407, 139, 2, 0, '2021-09-08 06:01:49', '2021-09-08 06:01:49'),
(408, 139, 1, 1, '2021-09-08 06:01:50', '2021-09-13 11:38:56'),
(409, 139, 10, 0, '2021-09-08 06:01:50', '2021-09-08 06:01:50'),
(410, 140, 2, 0, '2021-09-08 06:02:21', '2021-09-08 06:02:21'),
(411, 140, 1, 1, '2021-09-08 06:02:21', '2021-09-13 11:38:56'),
(412, 140, 10, 0, '2021-09-08 06:02:21', '2021-09-08 06:02:21'),
(413, 141, 2, 0, '2021-09-08 06:03:58', '2021-09-08 06:03:58'),
(414, 141, 1, 1, '2021-09-08 06:03:58', '2021-09-13 11:38:56'),
(415, 141, 10, 0, '2021-09-08 06:03:58', '2021-09-08 06:03:58'),
(416, 142, 2, 0, '2021-09-08 06:04:35', '2021-09-08 06:04:35'),
(417, 142, 1, 1, '2021-09-08 06:04:35', '2021-09-13 11:38:56'),
(418, 142, 10, 0, '2021-09-08 06:04:35', '2021-09-08 06:04:35'),
(419, 143, 2, 0, '2021-09-08 06:05:16', '2021-09-08 06:05:16'),
(420, 143, 1, 1, '2021-09-08 06:05:16', '2021-09-13 11:38:56'),
(421, 143, 10, 0, '2021-09-08 06:05:16', '2021-09-08 06:05:16'),
(422, 144, 2, 0, '2021-09-08 06:06:25', '2021-09-08 06:06:25'),
(423, 144, 1, 1, '2021-09-08 06:06:25', '2021-09-13 11:38:56'),
(424, 144, 10, 0, '2021-09-08 06:06:25', '2021-09-08 06:06:25'),
(425, 145, 2, 0, '2021-09-08 06:08:07', '2021-09-08 06:08:07'),
(426, 145, 1, 1, '2021-09-08 06:08:07', '2021-09-13 11:38:56'),
(427, 145, 10, 0, '2021-09-08 06:08:07', '2021-09-08 06:08:07'),
(428, 146, 2, 0, '2021-09-08 06:10:54', '2021-09-08 06:10:54'),
(429, 146, 1, 1, '2021-09-08 06:10:54', '2021-09-13 11:38:56'),
(430, 146, 10, 0, '2021-09-08 06:10:54', '2021-09-08 06:10:54'),
(431, 147, 2, 0, '2021-09-08 06:11:46', '2021-09-08 06:11:46'),
(432, 147, 1, 1, '2021-09-08 06:11:46', '2021-09-13 11:38:56'),
(433, 147, 10, 0, '2021-09-08 06:11:46', '2021-09-08 06:11:46'),
(434, 148, 2, 0, '2021-09-08 06:43:31', '2021-09-08 06:43:31'),
(435, 148, 1, 1, '2021-09-08 06:43:31', '2021-09-13 11:38:56'),
(436, 148, 10, 0, '2021-09-08 06:43:31', '2021-09-08 06:43:31'),
(437, 149, 2, 0, '2021-09-08 06:47:30', '2021-09-08 06:47:30'),
(438, 149, 1, 1, '2021-09-08 06:47:30', '2021-09-13 11:38:56'),
(439, 149, 10, 0, '2021-09-08 06:47:30', '2021-09-08 06:47:30'),
(440, 150, 2, 0, '2021-09-08 07:37:16', '2021-09-08 07:37:16'),
(441, 150, 1, 1, '2021-09-08 07:37:16', '2021-09-13 11:38:56'),
(442, 150, 10, 0, '2021-09-08 07:37:16', '2021-09-08 07:37:16'),
(443, 151, 2, 0, '2021-09-08 07:40:29', '2021-09-08 07:40:29'),
(444, 151, 1, 1, '2021-09-08 07:40:29', '2021-09-13 11:38:56'),
(445, 151, 10, 0, '2021-09-08 07:40:29', '2021-09-08 07:40:29'),
(446, 152, 2, 0, '2021-09-08 07:46:32', '2021-09-08 07:46:32'),
(447, 152, 1, 1, '2021-09-08 07:46:32', '2021-09-13 11:38:56'),
(448, 152, 10, 0, '2021-09-08 07:46:32', '2021-09-08 07:46:32'),
(449, 153, 2, 0, '2021-09-08 07:59:07', '2021-09-08 07:59:07'),
(450, 153, 1, 1, '2021-09-08 07:59:07', '2021-09-13 11:38:56'),
(451, 153, 10, 0, '2021-09-08 07:59:07', '2021-09-08 07:59:07'),
(452, 154, 2, 0, '2021-09-10 07:58:47', '2021-09-10 07:58:47'),
(453, 154, 1, 1, '2021-09-10 07:58:47', '2021-09-13 11:38:56'),
(454, 154, 10, 0, '2021-09-10 07:58:47', '2021-09-10 07:58:47'),
(455, 155, 2, 0, '2021-09-10 08:00:09', '2021-09-10 08:00:09'),
(456, 155, 1, 1, '2021-09-10 08:00:09', '2021-09-13 11:38:56'),
(457, 155, 10, 0, '2021-09-10 08:00:09', '2021-09-10 08:00:09'),
(458, 156, 2, 0, '2021-09-10 08:20:46', '2021-09-10 08:20:46'),
(459, 156, 1, 1, '2021-09-10 08:20:46', '2021-09-13 11:38:56'),
(460, 156, 10, 0, '2021-09-10 08:20:46', '2021-09-10 08:20:46'),
(461, 157, 2, 0, '2021-09-10 09:08:19', '2021-09-10 09:08:19'),
(462, 157, 1, 1, '2021-09-10 09:08:19', '2021-09-13 11:38:56'),
(463, 157, 10, 0, '2021-09-10 09:08:19', '2021-09-10 09:08:19'),
(464, 158, 2, 0, '2021-09-10 09:18:08', '2021-09-10 09:18:08'),
(465, 158, 1, 1, '2021-09-10 09:18:08', '2021-09-13 11:38:56'),
(466, 158, 10, 0, '2021-09-10 09:18:08', '2021-09-10 09:18:08'),
(467, 159, 2, 0, '2021-09-11 07:19:11', '2021-09-11 07:19:11'),
(468, 159, 1, 1, '2021-09-11 07:19:11', '2021-09-13 11:38:56'),
(469, 159, 10, 0, '2021-09-11 07:19:11', '2021-09-11 07:19:11'),
(470, 160, 2, 0, '2021-09-11 07:23:21', '2021-09-11 07:23:21'),
(471, 160, 1, 1, '2021-09-11 07:23:21', '2021-09-13 11:38:56'),
(472, 160, 10, 0, '2021-09-11 07:23:21', '2021-09-11 07:23:21'),
(473, 161, 2, 0, '2021-09-11 07:27:59', '2021-09-11 07:27:59'),
(474, 161, 1, 1, '2021-09-11 07:27:59', '2021-09-13 11:38:56'),
(475, 161, 10, 0, '2021-09-11 07:27:59', '2021-09-11 07:27:59'),
(476, 162, 2, 0, '2021-09-11 08:19:58', '2021-09-11 08:19:58'),
(477, 162, 1, 1, '2021-09-11 08:19:58', '2021-09-13 11:38:56'),
(478, 162, 10, 0, '2021-09-11 08:19:58', '2021-09-11 08:19:58'),
(479, 163, 2, 0, '2021-09-11 08:26:55', '2021-09-11 08:26:55'),
(480, 163, 1, 1, '2021-09-11 08:26:55', '2021-09-13 11:38:56'),
(481, 163, 10, 0, '2021-09-11 08:26:55', '2021-09-11 08:26:55'),
(482, 164, 2, 0, '2021-09-11 08:27:55', '2021-09-11 08:27:55'),
(483, 164, 1, 1, '2021-09-11 08:27:55', '2021-09-13 11:38:56'),
(484, 164, 10, 0, '2021-09-11 08:27:55', '2021-09-11 08:27:55'),
(485, 165, 2, 0, '2021-09-11 08:28:32', '2021-09-11 08:28:32'),
(486, 165, 1, 1, '2021-09-11 08:28:32', '2021-09-13 11:38:56'),
(487, 165, 10, 0, '2021-09-11 08:28:32', '2021-09-11 08:28:32'),
(488, 166, 2, 0, '2021-09-11 08:29:37', '2021-09-11 08:29:37'),
(489, 166, 1, 1, '2021-09-11 08:29:37', '2021-09-13 11:38:56'),
(490, 166, 10, 0, '2021-09-11 08:29:37', '2021-09-11 08:29:37'),
(491, 167, 2, 0, '2021-09-11 08:30:27', '2021-09-11 08:30:27'),
(492, 167, 1, 1, '2021-09-11 08:30:27', '2021-09-13 11:38:56'),
(493, 167, 10, 0, '2021-09-11 08:30:27', '2021-09-11 08:30:27'),
(494, 168, 2, 0, '2021-09-11 08:31:19', '2021-09-11 08:31:19'),
(495, 168, 1, 1, '2021-09-11 08:31:19', '2021-09-13 11:38:56'),
(496, 168, 10, 0, '2021-09-11 08:31:19', '2021-09-11 08:31:19'),
(497, 169, 2, 0, '2021-09-11 08:39:29', '2021-09-11 08:39:29'),
(498, 169, 1, 1, '2021-09-11 08:39:29', '2021-09-13 11:38:56'),
(499, 169, 10, 0, '2021-09-11 08:39:29', '2021-09-11 08:39:29'),
(500, 170, 2, 0, '2021-09-11 08:40:47', '2021-09-11 08:40:47'),
(501, 170, 1, 1, '2021-09-11 08:40:47', '2021-09-13 11:38:56'),
(502, 170, 10, 0, '2021-09-11 08:40:47', '2021-09-11 08:40:47'),
(503, 171, 2, 0, '2021-09-11 08:42:18', '2021-09-11 08:42:18'),
(504, 171, 1, 1, '2021-09-11 08:42:18', '2021-09-13 11:38:56'),
(505, 171, 10, 0, '2021-09-11 08:42:18', '2021-09-11 08:42:18'),
(506, 172, 2, 0, '2021-09-11 08:51:50', '2021-09-11 08:51:50'),
(507, 172, 1, 1, '2021-09-11 08:51:50', '2021-09-13 11:38:56'),
(508, 172, 10, 0, '2021-09-11 08:51:50', '2021-09-11 08:51:50'),
(509, 173, 2, 0, '2021-09-11 08:57:26', '2021-09-11 08:57:26'),
(510, 173, 1, 1, '2021-09-11 08:57:26', '2021-09-13 11:38:56'),
(511, 173, 10, 0, '2021-09-11 08:57:26', '2021-09-11 08:57:26'),
(512, 174, 2, 0, '2021-09-11 08:59:19', '2021-09-11 08:59:19'),
(513, 174, 1, 1, '2021-09-11 08:59:19', '2021-09-13 11:38:56'),
(514, 174, 10, 0, '2021-09-11 08:59:19', '2021-09-11 08:59:19'),
(515, 175, 2, 0, '2021-09-11 09:01:56', '2021-09-11 09:01:56'),
(516, 175, 1, 1, '2021-09-11 09:01:56', '2021-09-13 11:38:56'),
(517, 175, 10, 0, '2021-09-11 09:01:56', '2021-09-11 09:01:56'),
(518, 176, 2, 0, '2021-09-11 09:09:54', '2021-09-11 09:09:54'),
(519, 176, 1, 1, '2021-09-11 09:09:54', '2021-09-13 11:38:56'),
(520, 176, 10, 0, '2021-09-11 09:09:54', '2021-09-11 09:09:54'),
(521, 177, 2, 0, '2021-09-11 09:11:03', '2021-09-11 09:11:03'),
(522, 177, 1, 1, '2021-09-11 09:11:03', '2021-09-13 11:38:56'),
(523, 177, 10, 0, '2021-09-11 09:11:03', '2021-09-11 09:11:03'),
(524, 178, 2, 0, '2021-09-13 10:28:32', '2021-09-13 10:28:32'),
(525, 178, 1, 1, '2021-09-13 10:28:32', '2021-09-13 11:38:56'),
(526, 178, 10, 0, '2021-09-13 10:28:32', '2021-09-13 10:28:32'),
(527, 179, 2, 0, '2021-09-13 10:29:25', '2021-09-13 10:29:25'),
(528, 179, 1, 1, '2021-09-13 10:29:25', '2021-09-13 11:38:56'),
(529, 179, 10, 0, '2021-09-13 10:29:25', '2021-09-13 10:29:25'),
(530, 180, 2, 0, '2021-09-13 10:30:42', '2021-09-13 10:30:42'),
(531, 180, 1, 1, '2021-09-13 10:30:42', '2021-09-13 11:38:56'),
(532, 180, 10, 0, '2021-09-13 10:30:42', '2021-09-13 10:30:42'),
(533, 181, 2, 0, '2021-09-13 10:31:33', '2021-09-13 10:31:33'),
(534, 181, 1, 1, '2021-09-13 10:31:33', '2021-09-13 11:38:56'),
(535, 181, 10, 0, '2021-09-13 10:31:33', '2021-09-13 10:31:33'),
(536, 182, 2, 0, '2021-09-13 10:32:00', '2021-09-13 10:32:00'),
(537, 182, 1, 1, '2021-09-13 10:32:00', '2021-09-13 11:38:56'),
(538, 182, 10, 0, '2021-09-13 10:32:00', '2021-09-13 10:32:00'),
(539, 183, 2, 0, '2021-09-13 10:38:09', '2021-09-13 10:38:09'),
(540, 183, 1, 1, '2021-09-13 10:38:09', '2021-09-13 11:38:56'),
(541, 183, 10, 0, '2021-09-13 10:38:09', '2021-09-13 10:38:09'),
(542, 184, 2, 0, '2021-09-13 10:42:17', '2021-09-13 10:42:17'),
(543, 184, 1, 1, '2021-09-13 10:42:17', '2021-09-13 11:38:56'),
(544, 184, 10, 0, '2021-09-13 10:42:17', '2021-09-13 10:42:17'),
(545, 185, 2, 0, '2021-09-13 10:47:01', '2021-09-13 10:47:01'),
(546, 185, 1, 1, '2021-09-13 10:47:01', '2021-09-13 11:38:56'),
(547, 185, 10, 0, '2021-09-13 10:47:01', '2021-09-13 10:47:01'),
(548, 186, 2, 0, '2021-09-13 10:47:35', '2021-09-13 10:47:35'),
(549, 186, 1, 1, '2021-09-13 10:47:35', '2021-09-13 11:38:56'),
(550, 186, 10, 0, '2021-09-13 10:47:35', '2021-09-13 10:47:35'),
(551, 187, 2, 0, '2021-09-14 10:10:30', '2021-09-14 10:10:30'),
(552, 187, 1, 0, '2021-09-14 10:10:30', '2021-09-14 10:10:30'),
(553, 187, 10, 0, '2021-09-14 10:10:30', '2021-09-14 10:10:30'),
(554, 188, 2, 0, '2021-09-14 11:00:15', '2021-09-14 11:00:15'),
(555, 188, 1, 0, '2021-09-14 11:00:15', '2021-09-14 11:00:15'),
(556, 188, 10, 0, '2021-09-14 11:00:15', '2021-09-14 11:00:15'),
(557, 189, 2, 0, '2021-09-15 09:52:41', '2021-09-15 09:52:41'),
(558, 189, 1, 0, '2021-09-15 09:52:41', '2021-09-15 09:52:41'),
(559, 189, 10, 0, '2021-09-15 09:52:41', '2021-09-15 09:52:41'),
(560, 190, 2, 0, '2021-09-21 03:52:36', '2021-09-21 03:52:36'),
(561, 190, 1, 0, '2021-09-21 03:52:36', '2021-09-21 03:52:36'),
(562, 190, 10, 0, '2021-09-21 03:52:36', '2021-09-21 03:52:36'),
(563, 191, 2, 0, '2021-09-21 03:54:22', '2021-09-21 03:54:22'),
(564, 191, 1, 0, '2021-09-21 03:54:22', '2021-09-21 03:54:22'),
(565, 191, 10, 0, '2021-09-21 03:54:22', '2021-09-21 03:54:22'),
(566, 192, 2, 0, '2021-09-21 03:56:32', '2021-09-21 03:56:32'),
(567, 192, 1, 0, '2021-09-21 03:56:32', '2021-09-21 03:56:32'),
(568, 192, 10, 0, '2021-09-21 03:56:32', '2021-09-21 03:56:32'),
(569, 193, 2, 0, '2021-09-21 04:18:56', '2021-09-21 04:18:56'),
(570, 193, 1, 0, '2021-09-21 04:18:56', '2021-09-21 04:18:56'),
(571, 193, 10, 0, '2021-09-21 04:18:56', '2021-09-21 04:18:56'),
(572, 194, 2, 0, '2021-09-22 13:45:34', '2021-09-22 13:45:34'),
(573, 194, 1, 0, '2021-09-22 13:45:34', '2021-09-22 13:45:34'),
(574, 194, 10, 0, '2021-09-22 13:45:34', '2021-09-22 13:45:34'),
(575, 195, 2, 0, '2021-09-23 03:07:36', '2021-09-23 03:07:36'),
(576, 195, 1, 0, '2021-09-23 03:07:36', '2021-09-23 03:07:36'),
(577, 195, 10, 0, '2021-09-23 03:07:36', '2021-09-23 03:07:36'),
(578, 196, 2, 0, '2021-09-23 06:16:30', '2021-09-23 06:16:30'),
(579, 196, 1, 0, '2021-09-23 06:16:30', '2021-09-23 06:16:30'),
(580, 196, 10, 0, '2021-09-23 06:16:30', '2021-09-23 06:16:30'),
(581, 197, 2, 0, '2021-09-23 07:24:58', '2021-09-23 07:24:58'),
(582, 197, 1, 0, '2021-09-23 07:24:58', '2021-09-23 07:24:58'),
(583, 197, 10, 0, '2021-09-23 07:24:58', '2021-09-23 07:24:58'),
(584, 198, 2, 0, '2021-09-24 08:52:28', '2021-09-24 08:52:28'),
(585, 198, 1, 0, '2021-09-24 08:52:28', '2021-09-24 08:52:28'),
(586, 198, 10, 0, '2021-09-24 08:52:28', '2021-09-24 08:52:28'),
(587, 199, 2, 0, '2021-09-24 12:58:41', '2021-09-24 12:58:41'),
(588, 199, 1, 0, '2021-09-24 12:58:41', '2021-09-24 12:58:41'),
(589, 199, 10, 0, '2021-09-24 12:58:41', '2021-09-24 12:58:41'),
(590, 200, 2, 0, '2021-09-24 13:27:25', '2021-09-24 13:27:25'),
(591, 200, 1, 0, '2021-09-24 13:27:25', '2021-09-24 13:27:25'),
(592, 200, 10, 0, '2021-09-24 13:27:25', '2021-09-24 13:27:25'),
(593, 201, 1, 0, '2021-10-01 07:10:31', '2021-10-01 07:10:31'),
(594, 202, 1, 0, '2021-10-01 04:12:09', '2021-10-01 04:12:09'),
(595, 203, 1, 0, '2021-10-01 07:16:51', '2021-10-01 07:16:51'),
(596, 204, 1, 0, '2021-10-01 04:17:57', '2021-10-01 04:17:57'),
(597, 205, 1, 0, '2021-10-01 13:05:46', '2021-10-01 13:05:46'),
(598, 206, 1, 0, '2021-10-06 07:38:42', '2021-10-06 07:38:42'),
(599, 207, 1, 0, '2021-10-12 13:52:59', '2021-10-12 13:52:59'),
(600, 208, 1, 0, '2021-10-12 14:07:42', '2021-10-12 14:07:42'),
(601, 209, 1, 0, '2021-10-14 07:52:04', '2021-10-14 07:52:04'),
(602, 210, 1, 0, '2021-10-14 08:33:13', '2021-10-14 08:33:13'),
(603, 211, 1, 0, '2021-10-18 12:40:32', '2021-10-18 12:40:32'),
(604, 212, 1, 0, '2021-10-22 05:57:40', '2021-10-22 05:57:40'),
(605, 213, 1, 0, '2021-10-22 05:59:35', '2021-10-22 05:59:35'),
(606, 214, 1, 0, '2021-10-22 06:02:30', '2021-10-22 06:02:30'),
(607, 215, 1, 0, '2021-10-22 06:05:27', '2021-10-22 06:05:27'),
(608, 216, 1, 0, '2021-10-25 07:07:26', '2021-10-25 07:07:26'),
(609, 217, 1, 0, '2021-10-25 09:43:59', '2021-10-25 09:43:59'),
(610, 218, 1, 0, '2021-10-25 09:50:34', '2021-10-25 09:50:34'),
(611, 219, 1, 0, '2021-10-25 10:11:33', '2021-10-25 10:11:33'),
(612, 220, 1, 0, '2021-10-25 11:35:54', '2021-10-25 11:35:54'),
(613, 221, 1, 0, '2021-10-25 12:16:33', '2021-10-25 12:16:33'),
(614, 222, 1, 0, '2021-10-25 12:57:52', '2021-10-25 12:57:52'),
(615, 223, 1, 0, '2021-10-25 14:27:42', '2021-10-25 14:27:42'),
(616, 224, 1, 0, '2021-10-26 15:52:01', '2021-10-26 15:52:01'),
(617, 225, 1, 0, '2021-10-26 15:54:18', '2021-10-26 15:54:18'),
(618, 226, 1, 0, '2021-10-26 15:55:45', '2021-10-26 15:55:45'),
(619, 227, 1, 0, '2021-10-26 15:59:28', '2021-10-26 15:59:28'),
(620, 228, 1, 0, '2021-10-26 16:01:20', '2021-10-26 16:01:20'),
(621, 229, 1, 0, '2021-10-26 16:07:29', '2021-10-26 16:07:29'),
(622, 230, 1, 0, '2021-10-26 16:13:29', '2021-10-26 16:13:29'),
(623, 231, 1, 0, '2021-10-26 16:17:39', '2021-10-26 16:17:39'),
(624, 232, 1, 0, '2021-10-26 17:29:59', '2021-10-26 17:29:59'),
(625, 233, 1, 0, '2021-10-26 17:40:17', '2021-10-26 17:40:17'),
(626, 234, 1, 0, '2021-10-27 06:35:30', '2021-10-27 06:35:30'),
(627, 235, 1, 0, '2021-10-27 06:47:56', '2021-10-27 06:47:56'),
(628, 236, 1, 0, '2021-10-27 11:38:58', '2021-10-27 11:38:58'),
(629, 237, 1, 0, '2021-10-27 11:56:48', '2021-10-27 11:56:48'),
(630, 238, 1, 0, '2021-10-27 12:01:27', '2021-10-27 12:01:27'),
(631, 239, 1, 0, '2021-10-27 12:18:18', '2021-10-27 12:18:18'),
(632, 240, 1, 0, '2021-10-27 13:11:59', '2021-10-27 13:11:59'),
(633, 241, 1, 0, '2021-10-27 13:13:35', '2021-10-27 13:13:35'),
(634, 242, 1, 0, '2021-10-27 15:09:08', '2021-10-27 15:09:08'),
(635, 243, 1, 0, '2021-10-27 15:12:53', '2021-10-27 15:12:53'),
(636, 244, 1, 0, '2021-10-27 21:01:28', '2021-10-27 21:01:28'),
(637, 245, 1, 0, '2021-10-29 03:08:46', '2021-10-29 03:08:46'),
(638, 246, 1, 0, '2021-10-29 03:13:43', '2021-10-29 03:13:43'),
(639, 247, 1, 0, '2021-10-29 03:19:04', '2021-10-29 03:19:04'),
(640, 248, 1, 0, '2021-10-29 03:21:55', '2021-10-29 03:21:55'),
(641, 249, 1, 0, '2021-10-29 03:33:52', '2021-10-29 03:33:52'),
(642, 250, 1, 0, '2021-10-29 03:36:40', '2021-10-29 03:36:40'),
(643, 251, 1, 0, '2021-10-29 04:03:09', '2021-10-29 04:03:09'),
(644, 252, 1, 0, '2021-10-29 05:04:51', '2021-10-29 05:04:51'),
(645, 253, 1, 0, '2021-11-15 07:07:17', '2021-11-15 07:07:17'),
(646, 254, 1, 0, '2021-11-16 06:33:14', '2021-11-16 06:33:14'),
(647, 255, 1, 0, '2021-11-21 01:49:06', '2021-11-21 01:49:06'),
(648, 256, 1, 0, '2021-11-21 01:49:47', '2021-11-21 01:49:47'),
(649, 257, 86, 0, '2022-01-12 14:56:21', '2022-01-12 14:56:21'),
(650, 258, 86, 0, '2022-01-12 14:58:39', '2022-01-12 14:58:39'),
(651, 259, 86, 0, '2022-01-13 06:32:42', '2022-01-13 06:32:42'),
(652, 260, 86, 0, '2022-01-13 09:24:20', '2022-01-13 09:24:20'),
(653, 261, 86, 0, '2022-01-13 09:31:47', '2022-01-13 09:31:47'),
(654, 262, 86, 0, '2022-01-13 11:11:35', '2022-01-13 11:11:35'),
(655, 263, 86, 0, '2022-01-13 11:34:12', '2022-01-13 11:34:12'),
(656, 264, 86, 0, '2022-01-13 11:37:52', '2022-01-13 11:37:52'),
(657, 265, 86, 0, '2022-01-13 11:39:35', '2022-01-13 11:39:35'),
(658, 266, 86, 0, '2022-01-13 11:41:40', '2022-01-13 11:41:40'),
(659, 267, 86, 0, '2022-01-13 11:46:33', '2022-01-13 11:46:33'),
(660, 268, 86, 0, '2022-01-14 12:01:51', '2022-01-14 12:01:51'),
(661, 269, 86, 0, '2022-01-14 13:31:42', '2022-01-14 13:31:42'),
(662, 270, 86, 0, '2022-01-15 15:41:48', '2022-01-15 15:41:48'),
(663, 271, 86, 0, '2022-01-15 15:47:10', '2022-01-15 15:47:10'),
(664, 272, 86, 0, '2022-01-15 17:32:43', '2022-01-15 17:32:43'),
(665, 273, 86, 0, '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(666, 274, 86, 0, '2022-01-15 17:50:22', '2022-01-15 17:50:22'),
(667, 275, 86, 0, '2022-01-17 09:00:44', '2022-01-17 09:00:44'),
(668, 276, 86, 0, '2022-01-17 09:03:21', '2022-01-17 09:03:21'),
(669, 277, 86, 0, '2022-01-17 09:04:07', '2022-01-17 09:04:07'),
(670, 278, 86, 0, '2022-01-17 09:04:51', '2022-01-17 09:04:51'),
(671, 279, 86, 0, '2022-01-17 09:05:26', '2022-01-17 09:05:26'),
(672, 280, 86, 0, '2022-01-17 09:06:17', '2022-01-17 09:06:17'),
(673, 281, 86, 0, '2022-01-17 09:07:08', '2022-01-17 09:07:08'),
(674, 282, 86, 0, '2022-01-17 09:07:40', '2022-01-17 09:07:40'),
(675, 283, 86, 0, '2022-01-17 09:08:02', '2022-01-17 09:08:02'),
(676, 284, 86, 0, '2022-01-17 09:08:37', '2022-01-17 09:08:37'),
(677, 285, 86, 0, '2022-01-17 09:25:14', '2022-01-17 09:25:14'),
(678, 286, 86, 0, '2022-01-17 10:10:50', '2022-01-17 10:10:50'),
(679, 287, 86, 0, '2022-01-17 11:16:42', '2022-01-17 11:16:42'),
(680, 288, 86, 0, '2022-01-17 12:18:29', '2022-01-17 12:18:29'),
(681, 289, 86, 0, '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(682, 289, 87, 0, '2022-01-17 14:32:22', '2022-01-17 14:32:22'),
(683, 290, 90, 0, '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(684, 290, 86, 0, '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(685, 290, 87, 0, '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(686, 290, 96, 0, '2022-01-18 08:23:54', '2022-01-18 08:23:54'),
(687, 291, 90, 0, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(688, 291, 86, 0, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(689, 291, 87, 0, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(690, 291, 88, 0, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(691, 291, 96, 0, '2022-01-19 09:48:13', '2022-01-19 09:48:13'),
(692, 292, 90, 0, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(693, 292, 86, 0, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(694, 292, 87, 0, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(695, 292, 88, 0, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(696, 292, 96, 0, '2022-01-19 09:50:10', '2022-01-19 09:50:10'),
(697, 293, 90, 0, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(698, 293, 86, 0, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(699, 293, 87, 0, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(700, 293, 88, 0, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(701, 293, 96, 0, '2022-01-19 09:57:26', '2022-01-19 09:57:26'),
(702, 294, 90, 0, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(703, 294, 86, 0, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(704, 294, 87, 0, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(705, 294, 88, 0, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(706, 294, 96, 0, '2022-01-21 18:54:58', '2022-01-21 18:54:58'),
(707, 295, 90, 0, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(708, 295, 86, 0, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(709, 295, 87, 0, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(710, 295, 88, 0, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(711, 295, 96, 0, '2022-01-21 19:09:55', '2022-01-21 19:09:55'),
(712, 296, 90, 0, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(713, 296, 86, 0, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(714, 296, 87, 0, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(715, 296, 88, 0, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(716, 296, 96, 0, '2022-01-22 06:18:02', '2022-01-22 06:18:02'),
(717, 297, 90, 0, '2022-01-22 09:02:25', '2022-01-22 09:02:25'),
(718, 297, 86, 0, '2022-01-22 09:02:25', '2022-01-22 09:02:25'),
(719, 297, 87, 0, '2022-01-22 09:02:25', '2022-01-22 09:02:25'),
(720, 297, 88, 0, '2022-01-22 09:02:25', '2022-01-22 09:02:25'),
(721, 297, 96, 0, '2022-01-22 09:02:25', '2022-01-22 09:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `version_check`
--

CREATE TABLE `version_check` (
  `id` int(10) UNSIGNED NOT NULL,
  `current_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `version_check`
--

INSERT INTO `version_check` (`id`, `current_version`, `new_version`, `created_at`, `updated_at`) VALUES
(1, '', '', '2016-12-13 03:19:30', '2016-12-13 03:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `name`, `title`, `value`, `created_at`, `updated_at`) VALUES
(1, 'footer1', 'Products', '<ul><li>Men</li><li>Women</li><li>Kids</li><li>Decor</li><li>Wedding Cloth<b><br /></b></li></ul>', '2016-12-13 03:19:30', '2016-12-13 03:21:13'),
(2, 'footer2', 'Company', '<ul><li>About Us</li><li>Road Map</li><li>Privacy Policy</li><li>Cancellation &amp; Refund Policy<br /></li><li>Term &amp; Condition</li></ul>', '2016-12-13 03:19:30', '2016-12-13 03:21:40'),
(3, 'footer3', 'Find out More', '<ul><li>Forums</li><li>News</li><li>Blog</li><li>Partner NOC Directory</li></ul>', '2016-12-13 03:19:30', '2016-12-13 03:22:06'),
(4, 'footer4', 'Contact Us', '<div>\r\n                                        <p><i>BTM Layout, No: #28<br />9th Cross First Stage BTM Layout Near Water Tank<br /></i><i>Bangalore – 560 029</i><br /><i>Karnataka – India<br /></i><i>Telephone: </i><i>+91 9999999999<br /></i><i>Email: </i><a><i>   support@abcclothing.com</i></a></p></div>', '2016-12-13 03:19:30', '2016-12-13 03:22:34'),
(7, 'linkedin', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(8, 'stumble', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(9, 'google', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(10, 'deviantart', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(11, 'flickr', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(12, 'skype', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(13, 'rss', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(14, 'twitter', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(15, 'facebook', NULL, NULL, '2016-12-13 03:19:31', '2016-12-13 03:19:31'),
(16, 'youtube', NULL, NULL, '2016-12-13 03:19:32', '2016-12-13 03:19:32'),
(17, 'vimeo', NULL, NULL, '2016-12-13 03:19:32', '2016-12-13 03:19:32'),
(18, 'pinterest', NULL, NULL, '2016-12-13 03:19:32', '2016-12-13 03:19:32'),
(19, 'dribbble', NULL, NULL, '2016-12-13 03:19:32', '2016-12-13 03:19:32'),
(20, 'instagram', NULL, NULL, '2016-12-13 03:19:32', '2016-12-13 03:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_action`
--

CREATE TABLE `workflow_action` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_id` int(10) UNSIGNED NOT NULL,
  `condition` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_close`
--

CREATE TABLE `workflow_close` (
  `id` int(10) UNSIGNED NOT NULL,
  `days` int(11) NOT NULL,
  `condition` int(11) NOT NULL,
  `send_email` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `workflow_close`
--

INSERT INTO `workflow_close` (`id`, `days`, `condition`, `send_email`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 3, '2016-12-13 03:19:14', '2016-12-13 03:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_name`
--

CREATE TABLE `workflow_name` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `internal_note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_rules`
--

CREATE TABLE `workflow_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_id` int(10) UNSIGNED NOT NULL,
  `matching_criteria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matching_scenario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matching_relation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matching_value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_settings`
--
ALTER TABLE `api_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bar_notifications`
--
ALTER TABLE `bar_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `canned_response`
--
ALTER TABLE `canned_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `centres`
--
ALTER TABLE `centres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_result`
--
ALTER TABLE `client_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `common_settings`
--
ALTER TABLE `common_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_centre_dept`
--
ALTER TABLE `contact_centre_dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_code`
--
ALTER TABLE `country_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_forms`
--
ALTER TABLE `custom_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_form_fields`
--
ALTER TABLE `custom_form_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_format`
--
ALTER TABLE `date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_time_format`
--
ALTER TABLE `date_time_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sla` (`sla`),
  ADD KEY `manager_2` (`manager`);

--
-- Indexes for table `dump_department`
--
ALTER TABLE `dump_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department` (`department`,`priority`,`help_topic`),
  ADD KEY `department_2` (`department`,`priority`,`help_topic`),
  ADD KEY `priority` (`priority`),
  ADD KEY `help_topic` (`help_topic`);

--
-- Indexes for table `esclation_matrix`
--
ALTER TABLE `esclation_matrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faveo_mails`
--
ALTER TABLE `faveo_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faveo_queues`
--
ALTER TABLE `faveo_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_values`
--
ALTER TABLE `field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_values_field_id_foreign` (`field_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_assign_department`
--
ALTER TABLE `group_assign_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `help_topic`
--
ALTER TABLE `help_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_form` (`custom_form`),
  ADD KEY `department` (`department`),
  ADD KEY `ticket_status` (`ticket_status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `sla_plan` (`sla_plan`),
  ADD KEY `auto_assign_2` (`auto_assign`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`);

--
-- Indexes for table `kb_article`
--
ALTER TABLE `kb_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_article_relationship`
--
ALTER TABLE `kb_article_relationship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_relationship_article_id_foreign` (`article_id`),
  ADD KEY `article_relationship_category_id_foreign` (`category_id`);

--
-- Indexes for table `kb_category`
--
ALTER TABLE `kb_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_comment`
--
ALTER TABLE `kb_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_article_id_foreign` (`article_id`);

--
-- Indexes for table `kb_pages`
--
ALTER TABLE `kb_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_settings`
--
ALTER TABLE `kb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_notification`
--
ALTER TABLE `log_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailbox_protocol`
--
ALTER TABLE `mailbox_protocol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_services`
--
ALTER TABLE `mail_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_status`
--
ALTER TABLE `master_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `head` (`head`);

--
-- Indexes for table `organization1`
--
ALTER TABLE `organization1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `head` (`head`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_services`
--
ALTER TABLE `queue_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_ref`
--
ALTER TABLE `rating_ref`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reported_table`
--
ALTER TABLE `reported_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_demo`
--
ALTER TABLE `search_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_email_level1`
--
ALTER TABLE `sent_email_level1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Indexes for table `services1`
--
ALTER TABLE `services1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Indexes for table `service_issue`
--
ALTER TABLE `service_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_issue1`
--
ALTER TABLE `service_issue1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_alert_notice`
--
ALTER TABLE `settings_alert_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_auto_response`
--
ALTER TABLE `settings_auto_response`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_company`
--
ALTER TABLE `settings_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_email`
--
ALTER TABLE `settings_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_ratings`
--
ALTER TABLE `settings_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_ratings_slug_unique` (`slug`);

--
-- Indexes for table `settings_security`
--
ALTER TABLE `settings_security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_system`
--
ALTER TABLE `settings_system`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_farmat` (`time_farmat`),
  ADD KEY `date_format` (`date_format`),
  ADD KEY `date_time_format` (`date_time_format`),
  ADD KEY `time_zone` (`time_zone`);

--
-- Indexes for table `settings_ticket`
--
ALTER TABLE `settings_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sla_plan`
--
ALTER TABLE `sla_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_report_excel`
--
ALTER TABLE `support_report_excel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_lead` (`team_lead`);

--
-- Indexes for table `team_assign_agent`
--
ALTER TABLE `team_assign_agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_sets`
--
ALTER TABLE `template_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_types`
--
ALTER TABLE `template_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `sla` (`sla`),
  ADD KEY `help_topic_id` (`help_topic_id`),
  ADD KEY `status` (`status`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `source` (`source`);

--
-- Indexes for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `ticket_collaborator`
--
ALTER TABLE `ticket_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ticket_form_data`
--
ALTER TABLE `ticket_form_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `ticket_priority`
--
ALTER TABLE `ticket_priority`
  ADD PRIMARY KEY (`priority_id`);

--
-- Indexes for table `ticket_source`
--
ALTER TABLE `ticket_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_status`
--
ALTER TABLE `ticket_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_thread`
--
ALTER TABLE `ticket_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id_2` (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `source` (`source`);

--
-- Indexes for table `ticket_token`
--
ALTER TABLE `ticket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezone`
--
ALTER TABLE `timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_format`
--
ALTER TABLE `time_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD KEY `assign_group_3` (`assign_group`),
  ADD KEY `primary_dpt_2` (`primary_dpt`);

--
-- Indexes for table `user_additional_infos`
--
ALTER TABLE `user_additional_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_assign_organization`
--
ALTER TABLE `user_assign_organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version_check`
--
ALTER TABLE `version_check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflow_action`
--
ALTER TABLE `workflow_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_action_1` (`workflow_id`);

--
-- Indexes for table `workflow_close`
--
ALTER TABLE `workflow_close`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflow_name`
--
ALTER TABLE `workflow_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflow_rules`
--
ALTER TABLE `workflow_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_rules_1` (`workflow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_settings`
--
ALTER TABLE `api_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banlist`
--
ALTER TABLE `banlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bar_notifications`
--
ALTER TABLE `bar_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `canned_response`
--
ALTER TABLE `canned_response`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_result`
--
ALTER TABLE `client_result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `common_settings`
--
ALTER TABLE `common_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_centre_dept`
--
ALTER TABLE `contact_centre_dept`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `country_code`
--
ALTER TABLE `country_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `custom_forms`
--
ALTER TABLE `custom_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_form_fields`
--
ALTER TABLE `custom_form_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_format`
--
ALTER TABLE `date_format`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `date_time_format`
--
ALTER TABLE `date_time_format`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dump_department`
--
ALTER TABLE `dump_department`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `esclation_matrix`
--
ALTER TABLE `esclation_matrix`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faveo_mails`
--
ALTER TABLE `faveo_mails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faveo_queues`
--
ALTER TABLE `faveo_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_values`
--
ALTER TABLE `field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_assign_department`
--
ALTER TABLE `group_assign_department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topic`
--
ALTER TABLE `help_topic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_article`
--
ALTER TABLE `kb_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kb_article_relationship`
--
ALTER TABLE `kb_article_relationship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_category`
--
ALTER TABLE `kb_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kb_comment`
--
ALTER TABLE `kb_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_pages`
--
ALTER TABLE `kb_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_settings`
--
ALTER TABLE `kb_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_notification`
--
ALTER TABLE `log_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mailbox_protocol`
--
ALTER TABLE `mailbox_protocol`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mail_services`
--
ALTER TABLE `mail_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_status`
--
ALTER TABLE `master_status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `organization1`
--
ALTER TABLE `organization1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_services`
--
ALTER TABLE `queue_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rating_ref`
--
ALTER TABLE `rating_ref`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reported_table`
--
ALTER TABLE `reported_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `search_demo`
--
ALTER TABLE `search_demo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sent_email_level1`
--
ALTER TABLE `sent_email_level1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `services1`
--
ALTER TABLE `services1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `service_issue`
--
ALTER TABLE `service_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `service_issue1`
--
ALTER TABLE `service_issue1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `settings_alert_notice`
--
ALTER TABLE `settings_alert_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_auto_response`
--
ALTER TABLE `settings_auto_response`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_company`
--
ALTER TABLE `settings_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_email`
--
ALTER TABLE `settings_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_ratings`
--
ALTER TABLE `settings_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_security`
--
ALTER TABLE `settings_security`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_system`
--
ALTER TABLE `settings_system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings_ticket`
--
ALTER TABLE `settings_ticket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sla_plan`
--
ALTER TABLE `sla_plan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_report_excel`
--
ALTER TABLE `support_report_excel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_assign_agent`
--
ALTER TABLE `team_assign_agent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `template_sets`
--
ALTER TABLE `template_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_types`
--
ALTER TABLE `template_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_collaborator`
--
ALTER TABLE `ticket_collaborator`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_form_data`
--
ALTER TABLE `ticket_form_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1329;

--
-- AUTO_INCREMENT for table `ticket_priority`
--
ALTER TABLE `ticket_priority`
  MODIFY `priority_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ticket_source`
--
ALTER TABLE `ticket_source`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket_status`
--
ALTER TABLE `ticket_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket_thread`
--
ALTER TABLE `ticket_thread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT for table `ticket_token`
--
ALTER TABLE `ticket_token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezone`
--
ALTER TABLE `timezone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `time_format`
--
ALTER TABLE `time_format`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `user_additional_infos`
--
ALTER TABLE `user_additional_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_assign_organization`
--
ALTER TABLE `user_assign_organization`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `version_check`
--
ALTER TABLE `version_check`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `workflow_action`
--
ALTER TABLE `workflow_action`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_close`
--
ALTER TABLE `workflow_close`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workflow_name`
--
ALTER TABLE `workflow_name`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `workflow_rules`
--
ALTER TABLE `workflow_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
