-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table accesscontrolapi.apiusers
CREATE TABLE IF NOT EXISTS `apiusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table accesscontrolapi.apiusers: ~2 rows (approximately)
/*!40000 ALTER TABLE `apiusers` DISABLE KEYS */;
INSERT INTO `apiusers` (`id`, `username`, `passwd`, `status`) VALUES
	(1, 'prime', 'pswd', 'A'),
	(2, 'eye-d', 'passwd', 'A'),
	(3, 'nplsu', '888888', 'A');
/*!40000 ALTER TABLE `apiusers` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.barcodes
CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table accesscontrolapi.barcodes: ~4 rows (approximately)
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` (`id`, `barcode`, `date`) VALUES
	(1, '10006127', '2020-02-12 17:33:13'),
	(2, '8904133016353', '2020-02-12 17:33:16'),
	(3, '1053598', '2020-02-12 17:33:16'),
	(4, '201908143436', '2020-02-12 17:33:28');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.boomgates
CREATE TABLE IF NOT EXISTS `boomgates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table accesscontrolapi.boomgates: ~0 rows (approximately)
/*!40000 ALTER TABLE `boomgates` DISABLE KEYS */;
INSERT INTO `boomgates` (`id`, `name`, `ip`, `port`, `username`, `password`, `status`) VALUES
	(1, 'BOOMGATE1', '192.168.100.50', 80, 'admin', '1234', 'A'),
	(2, 'BOOMGATE2', '10.70.3.133', 80, 'admin', '1234', 'A');
/*!40000 ALTER TABLE `boomgates` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.boomseqnos
CREATE TABLE IF NOT EXISTS `boomseqnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boom_id` int(11) NOT NULL,
  `seqno` int(11) NOT NULL,
  `rollovercount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table accesscontrolapi.boomseqnos: ~2 rows (approximately)
/*!40000 ALTER TABLE `boomseqnos` DISABLE KEYS */;
INSERT INTO `boomseqnos` (`id`, `boom_id`, `seqno`, `rollovercount`) VALUES
	(1, 1, 6902, 0),
	(2, 2, 2242, 0);
/*!40000 ALTER TABLE `boomseqnos` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `card_no` varchar(255) NOT NULL DEFAULT '',
  `boom_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table accesscontrolapi.events: ~82 rows (approximately)
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `event_id`, `date`, `time`, `card_no`, `boom_id`) VALUES
	(1, 459, '19/5/2020', '13:56:46', 'AEB12341', 1),
	(2, 459, '19/5/2020', '13:56:47', 'AEB12341', 1),
	(3, 459, '19/5/2020', '13:56:49', 'AEB12341', 1),
	(4, 459, '19/5/2020', '13:56:51', 'AEB12341', 1),
	(5, 459, '19/5/2020', '13:56:53', 'AEB12341', 1),
	(6, 459, '19/5/2020', '13:56:55', 'AEB12341', 1),
	(7, 459, '19/5/2020', '13:56:56', 'AEB12341', 1),
	(8, 459, '19/5/2020', '13:56:57', 'AEB12341', 1),
	(9, 459, '19/5/2020', '13:56:58', 'AEB12341', 1),
	(10, 459, '19/5/2020', '13:57:4', 'AEB12341', 1),
	(11, 459, '19/5/2020', '13:57:19', 'AEB12341', 1),
	(12, 459, '19/5/2020', '13:57:21', 'AEB12341', 1),
	(13, 459, '19/5/2020', '13:57:22', 'AEB12341', 1),
	(14, 459, '19/5/2020', '13:57:23', 'AEB12341', 1),
	(15, 459, '19/5/2020', '13:57:25', 'AEB12341', 1),
	(16, 459, '19/5/2020', '13:57:26', 'AEB12341', 1),
	(17, 459, '19/5/2020', '13:57:28', 'AEB12341', 1),
	(18, 459, '19/5/2020', '13:57:29', 'AEB12341', 1),
	(19, 459, '19/5/2020', '13:57:30', 'AEB12341', 1),
	(20, 459, '19/5/2020', '13:57:31', 'AEB12341', 1),
	(21, 459, '19/5/2020', '14:11:40', 'AEB12341', 1),
	(22, 459, '19/5/2020', '14:11:51', 'AEB12341', 1),
	(23, 459, '19/5/2020', '14:11:53', 'AEB12341', 1),
	(24, 459, '19/5/2020', '14:20:6', 'AEB12341', 1),
	(25, 459, '19/5/2020', '14:20:7', 'AEB12341', 1),
	(26, 459, '19/5/2020', '14:20:10', 'AEB12341', 1),
	(27, 459, '19/5/2020', '14:26:0', 'AEB12341', 1),
	(28, 101, '19/5/2020', '14:26:1', 'AEB12341', 1),
	(29, 459, '19/5/2020', '14:30:16', 'AEB12341', 1),
	(30, 459, '19/5/2020', '14:32:4', 'AEB12341', 1),
	(31, 101, '19/5/2020', '14:33:10', 'AEB12341', 1),
	(32, 101, '19/5/2020', '14:33:21', 'AEB12341', 1),
	(33, 101, '19/5/2020', '14:33:22', 'AEB12341', 1),
	(34, 101, '19/5/2020', '14:33:32', 'AEB12341', 1),
	(35, 101, '19/5/2020', '14:33:37', 'AEB12341', 1),
	(36, 101, '19/5/2020', '14:33:41', 'AEB12341', 1),
	(37, 101, '19/5/2020', '14:33:42', 'AEB12341', 1),
	(38, 101, '19/5/2020', '14:33:44', 'AEB12341', 1),
	(39, 101, '19/5/2020', '14:34:0', 'AEB12341', 1),
	(40, 101, '19/5/2020', '14:34:2', 'AEB12341', 1),
	(41, 101, '19/5/2020', '14:34:2', 'AEB12341', 1),
	(42, 101, '19/5/2020', '14:34:3', 'AEB12341', 1),
	(43, 101, '19/5/2020', '14:34:4', 'AEB12341', 1),
	(44, 459, '19/5/2020', '14:34:5', 'AEB12341', 1),
	(45, 459, '19/5/2020', '14:38:38', 'AEB12341', 1),
	(46, 459, '19/5/2020', '14:48:23', 'AEB12341', 1),
	(47, 459, '19/5/2020', '15:4:46', 'AEB12341', 1),
	(48, 459, '19/5/2020', '15:11:23', 'AEB12341', 1),
	(49, 101, '19/5/2020', '15:14:59', 'AEB12341', 1),
	(50, 101, '19/5/2020', '15:15:0', 'AEB12341', 1),
	(51, 101, '19/5/2020', '15:15:1', 'AEB12341', 1),
	(52, 101, '19/5/2020', '15:15:2', 'AEB12341', 1),
	(53, 101, '19/5/2020', '15:15:3', 'AEB12341', 1),
	(54, 101, '19/5/2020', '15:15:5', 'AEB12341', 1),
	(55, 101, '19/5/2020', '15:15:6', 'AEB12341', 1),
	(56, 101, '19/5/2020', '15:15:7', 'AEB12341', 1),
	(57, 101, '19/5/2020', '15:15:9', 'AEB12341', 1),
	(58, 101, '19/5/2020', '15:15:10', 'AEB12341', 1),
	(59, 101, '19/5/2020', '15:15:11', 'AEB12341', 1),
	(60, 101, '19/5/2020', '15:15:13', 'AEB12341', 1),
	(61, 101, '19/5/2020', '15:16:10', 'AEB12341', 1),
	(62, 101, '19/5/2020', '15:16:11', 'AEB12341', 1),
	(63, 101, '19/5/2020', '15:16:27', 'AEB12341', 1),
	(64, 101, '19/5/2020', '15:16:28', 'AEB12341', 1),
	(65, 101, '19/5/2020', '15:16:29', 'AEB12341', 1),
	(66, 101, '19/5/2020', '15:17:14', 'AEB12341', 1),
	(67, 101, '19/5/2020', '15:17:15', 'AEB12341', 1),
	(68, 101, '19/5/2020', '15:17:17', 'AEB12341', 1),
	(69, 101, '19/5/2020', '15:17:19', 'AEB12341', 1),
	(70, 101, '19/5/2020', '15:17:20', 'AEB12341', 1),
	(71, 101, '19/5/2020', '15:17:21', 'AEB12341', 1),
	(72, 101, '19/5/2020', '15:17:22', 'AEB12341', 1),
	(73, 101, '19/5/2020', '15:17:24', 'AEB12341', 1),
	(74, 101, '19/5/2020', '15:17:26', 'AEB12341', 1),
	(75, 101, '19/5/2020', '15:17:27', 'AEB12341', 1),
	(76, 101, '19/5/2020', '15:17:29', 'AEB12341', 1),
	(77, 101, '19/5/2020', '15:17:30', 'AEB12341', 1),
	(78, 101, '19/5/2020', '15:17:32', 'AEB12341', 1),
	(79, 101, '19/5/2020', '15:17:33', 'AEB12341', 1),
	(80, 101, '19/5/2020', '15:17:35', 'AEB12341', 1),
	(81, 101, '19/5/2020', '15:17:36', 'AEB12341', 1),
	(82, 101, '19/5/2020', '15:17:38', 'AEB12341', 1),
	(83, 101, '19/5/2020', '15:17:39', 'AEB12341', 1),
	(84, 101, '19/5/2020', '15:17:41', 'AEB12341', 1),
	(85, 101, '19/5/2020', '15:17:42', 'AEB12341', 1),
	(86, 101, '19/5/2020', '15:17:44', 'AEB12341', 1),
	(87, 101, '19/5/2020', '15:17:45', 'AEB12341', 1),
	(88, 101, '19/5/2020', '15:17:47', 'AEB12341', 1),
	(89, 101, '19/5/2020', '15:17:49', 'AEB12341', 1),
	(90, 101, '19/5/2020', '15:17:50', 'AEB12341', 1),
	(91, 459, '19/5/2020', '15:23:13', 'AEB12341', 1),
	(92, 459, '19/5/2020', '15:23:17', 'AEB12341', 1),
	(93, 459, '19/5/2020', '15:33:20', 'AEB12341', 1),
	(94, 459, '19/5/2020', '15:33:22', 'AEB12341', 1),
	(95, 459, '19/5/2020', '15:33:24', 'AEB12341', 1),
	(96, 459, '19/5/2020', '15:33:26', 'AEB12341', 1),
	(97, 459, '19/5/2020', '15:33:33', 'AEB12341', 1),
	(98, 459, '19/5/2020', '15:33:37', 'AEB12341', 1),
	(99, 459, '19/5/2020', '15:33:39', 'AEB12341', 1),
	(100, 459, '19/5/2020', '15:33:46', 'AEB12341', 1),
	(101, 459, '19/5/2020', '15:33:47', 'AEB12341', 1),
	(102, 459, '19/5/2020', '15:33:48', 'AEB12341', 1),
	(103, 459, '19/5/2020', '15:33:51', 'AEB12341', 1),
	(104, 459, '19/5/2020', '15:33:53', 'AEB12341', 1),
	(105, 459, '19/5/2020', '15:33:55', 'AEB12341', 1),
	(106, 459, '19/5/2020', '15:33:56', 'AEB12341', 1),
	(107, 459, '19/5/2020', '15:33:59', 'AEB12341', 1),
	(108, 459, '19/5/2020', '15:34:0', 'AEB12341', 1),
	(109, 101, '19/5/2020', '12:12:20', 'AEB12341', 2),
	(110, 101, '19/5/2020', '12:12:22', 'AEB12341', 2),
	(111, 101, '19/5/2020', '15:42:20', 'AEB12341', 1),
	(112, 101, '19/5/2020', '15:42:21', 'AEB12341', 1),
	(113, 101, '19/5/2020', '15:42:22', 'AEB12341', 1),
	(114, 101, '19/5/2020', '15:42:23', 'AEB12341', 1),
	(115, 101, '19/5/2020', '15:42:24', 'AEB12341', 1),
	(116, 101, '19/5/2020', '12:12:23', 'AEB12341', 2),
	(117, 101, '19/5/2020', '12:12:24', 'AEB12341', 2),
	(118, 101, '19/5/2020', '12:12:25', 'AEB12341', 2),
	(119, 101, '19/5/2020', '12:12:26', 'AEB12341', 2),
	(120, 101, '19/5/2020', '12:12:27', 'AEB12341', 2),
	(121, 101, '19/5/2020', '15:42:25', 'AEB12341', 1),
	(122, 101, '19/5/2020', '15:42:27', 'AEB12341', 1),
	(123, 101, '19/5/2020', '15:42:28', 'AEB12341', 1),
	(124, 101, '19/5/2020', '15:42:29', 'AEB12341', 1),
	(125, 101, '19/5/2020', '12:12:29', 'AEB12341', 2),
	(126, 101, '19/5/2020', '15:43:6', 'AEB12341', 1),
	(127, 101, '19/5/2020', '15:43:7', 'AEB12341', 1),
	(128, 101, '19/5/2020', '15:43:8', 'AEB12341', 1),
	(129, 101, '19/5/2020', '12:13:7', 'AEB12341', 2),
	(130, 101, '19/5/2020', '12:13:8', 'AEB12341', 2),
	(131, 101, '19/5/2020', '12:13:9', 'AEB12341', 2),
	(132, 101, '19/5/2020', '12:13:10', 'AEB12341', 2),
	(133, 101, '19/5/2020', '12:13:11', 'AEB12341', 2),
	(134, 101, '19/5/2020', '15:43:9', 'AEB12341', 1),
	(135, 101, '19/5/2020', '15:43:10', 'AEB12341', 1),
	(136, 101, '19/5/2020', '15:43:11', 'AEB12341', 1),
	(137, 101, '19/5/2020', '15:43:13', 'AEB12341', 1),
	(138, 101, '19/5/2020', '15:43:14', 'AEB12341', 1),
	(139, 101, '19/5/2020', '12:13:12', 'AEB12341', 2),
	(140, 101, '19/5/2020', '12:13:13', 'AEB12341', 2),
	(141, 101, '19/5/2020', '12:13:14', 'AEB12341', 2),
	(142, 101, '19/5/2020', '12:13:15', 'AEB12341', 2),
	(143, 101, '19/5/2020', '12:13:16', 'AEB12341', 2),
	(144, 101, '19/5/2020', '15:43:15', 'AEB12341', 1),
	(145, 101, '19/5/2020', '15:43:17', 'AEB12341', 1),
	(146, 101, '19/5/2020', '15:43:18', 'AEB12341', 1),
	(147, 101, '19/5/2020', '15:43:20', 'AEB12341', 1),
	(148, 101, '19/5/2020', '15:43:21', 'AEB12341', 1),
	(149, 101, '19/5/2020', '12:13:17', 'AEB12341', 2),
	(150, 101, '19/5/2020', '12:13:21', 'AEB12341', 2),
	(151, 101, '19/5/2020', '12:13:22', 'AEB12341', 2),
	(152, 101, '19/5/2020', '12:13:23', 'AEB12341', 2),
	(153, 101, '19/5/2020', '12:13:24', 'AEB12341', 2),
	(154, 101, '19/5/2020', '15:43:23', 'AEB12341', 1),
	(155, 101, '19/5/2020', '15:43:24', 'AEB12341', 1),
	(156, 101, '19/5/2020', '15:43:25', 'AEB12341', 1),
	(157, 101, '19/5/2020', '15:43:26', 'AEB12341', 1),
	(158, 459, '19/5/2020', '15:43:27', 'AEB12341', 1),
	(159, 101, '19/5/2020', '12:13:25', 'AEB12341', 2),
	(160, 101, '19/5/2020', '12:13:26', 'AEB12341', 2),
	(161, 101, '19/5/2020', '12:13:29', 'AEB12341', 2),
	(162, 101, '19/5/2020', '12:13:30', 'AEB12341', 2),
	(163, 101, '19/5/2020', '12:13:31', 'AEB12341', 2),
	(164, 101, '19/5/2020', '15:43:29', 'AEB12341', 1),
	(165, 101, '19/5/2020', '15:43:30', 'AEB12341', 1),
	(166, 101, '19/5/2020', '15:43:31', 'AEB12341', 1),
	(167, 101, '19/5/2020', '15:43:32', 'AEB12341', 1),
	(168, 101, '19/5/2020', '12:13:33', 'AEB12341', 2),
	(169, 101, '19/5/2020', '12:13:34', 'AEB12341', 2),
	(170, 101, '19/5/2020', '12:13:35', 'AEB12341', 2),
	(171, 101, '19/5/2020', '15:43:33', 'AEB12341', 1),
	(172, 101, '19/5/2020', '15:43:34', 'AEB12341', 1),
	(173, 101, '19/5/2020', '15:43:35', 'AEB12341', 1),
	(174, 459, '19/5/2020', '12:13:45', 'AEB12341', 2),
	(175, 459, '19/5/2020', '15:43:43', 'AEB12341', 1),
	(176, 459, '19/5/2020', '15:43:44', 'AEB12341', 1),
	(177, 459, '19/5/2020', '15:43:47', 'AEB12341', 1),
	(178, 459, '19/5/2020', '12:13:46', 'AEB12341', 2),
	(179, 459, '19/5/2020', '12:13:47', 'AEB12341', 2),
	(180, 459, '19/5/2020', '12:13:48', 'AEB12341', 2),
	(181, 459, '19/5/2020', '15:43:48', 'AEB12341', 1),
	(182, 459, '19/5/2020', '15:43:49', 'AEB12341', 1),
	(183, 459, '19/5/2020', '12:13:50', 'AEB12341', 2),
	(184, 459, '19/5/2020', '12:13:51', 'AEB12341', 2),
	(185, 459, '19/5/2020', '15:43:50', 'AEB12341', 1),
	(186, 459, '19/5/2020', '15:43:55', 'AEB12341', 1),
	(187, 101, '19/5/2020', '15:44:0', 'AEB12341', 1),
	(188, 459, '19/5/2020', '12:13:52', 'AEB12341', 2),
	(189, 459, '19/5/2020', '12:13:53', 'AEB12341', 2),
	(190, 459, '19/5/2020', '12:13:54', 'AEB12341', 2),
	(191, 459, '19/5/2020', '12:13:55', 'AEB12341', 2),
	(192, 101, '19/5/2020', '16:5:0', 'AEB12341', 1),
	(193, 101, '19/5/2020', '16:5:1', 'AEB12341', 1),
	(194, 101, '19/5/2020', '16:5:2', 'AEB12341', 1),
	(195, 101, '19/5/2020', '16:5:3', 'AEB12341', 1),
	(196, 101, '19/5/2020', '16:5:4', 'AEB12341', 1),
	(197, 101, '19/5/2020', '12:35:3', 'AEB12341', 2),
	(198, 101, '19/5/2020', '16:56:3', 'AEB12341', 1),
	(199, 101, '19/5/2020', '13:26:4', 'AEB12341', 2),
	(200, 101, '19/5/2020', '13:26:5', 'AEB12341', 2),
	(201, 101, '19/5/2020', '13:26:6', 'AEB12341', 2),
	(202, 101, '19/5/2020', '13:26:7', 'AEB12341', 2),
	(203, 101, '19/5/2020', '13:26:8', 'AEB12341', 2),
	(204, 459, '19/5/2020', '16:56:8', 'AEB12341', 1),
	(205, 101, '19/5/2020', '16:56:9', 'AEB12341', 1),
	(206, 101, '19/5/2020', '16:56:11', 'AEB12341', 1),
	(207, 101, '19/5/2020', '13:26:9', 'AEB12341', 2),
	(208, 101, '19/5/2020', '13:26:10', 'AEB12341', 2),
	(209, 101, '19/5/2020', '13:26:11', 'AEB12341', 2),
	(210, 101, '19/5/2020', '13:26:12', 'AEB12341', 2),
	(211, 101, '19/5/2020', '13:26:13', 'AEB12341', 2),
	(212, 101, '19/5/2020', '16:56:12', 'AEB12341', 1),
	(213, 101, '19/5/2020', '16:56:13', 'AEB12341', 1),
	(214, 459, '19/5/2020', '13:26:32', 'AEB12341', 2),
	(215, 459, '19/5/2020', '16:56:31', 'AEB12341', 1),
	(216, 459, '19/5/2020', '16:56:34', 'AEB12341', 1),
	(217, 459, '19/5/2020', '16:56:35', 'AEB12341', 1),
	(218, 459, '19/5/2020', '13:26:34', 'AEB12341', 2),
	(219, 459, '19/5/2020', '13:26:35', 'AEB12341', 2),
	(220, 459, '19/5/2020', '13:26:36', 'AEB12341', 2),
	(221, 459, '19/5/2020', '16:56:36', 'AEB12341', 1),
	(222, 459, '19/5/2020', '16:56:37', 'AEB12341', 1),
	(223, 459, '19/5/2020', '14:14:26', 'AEB12341', 2),
	(224, 459, '19/5/2020', '18:9:27', 'AEB12341', 1),
	(225, 459, '19/5/2020', '14:39:27', 'AEB12341', 2),
	(226, 459, '19/5/2020', '18:9:28', 'AEB12341', 1),
	(227, 459, '19/5/2020', '18:9:31', 'AEB12341', 1),
	(228, 459, '19/5/2020', '14:39:40', 'AEB12341', 2),
	(229, 459, '19/5/2020', '14:39:42', 'AEB12341', 2),
	(230, 459, '19/5/2020', '14:39:43', 'AEB12341', 2),
	(231, 459, '19/5/2020', '18:9:41', 'AEB12341', 1),
	(232, 459, '19/5/2020', '18:9:44', 'AEB12341', 1),
	(233, 459, '19/5/2020', '14:39:44', 'AEB12341', 2),
	(234, 101, '19/5/2020', '18:9:47', 'AEB12341', 1),
	(235, 101, '19/5/2020', '18:9:49', 'AEB12341', 1),
	(236, 101, '19/5/2020', '18:9:50', 'AEB12341', 1),
	(237, 101, '19/5/2020', '18:9:51', 'AEB12341', 1),
	(238, 101, '19/5/2020', '14:39:50', 'AEB12341', 2),
	(239, 101, '19/5/2020', '14:39:52', 'AEB12341', 2),
	(240, 101, '19/5/2020', '14:39:56', 'AEB12341', 2),
	(241, 101, '19/5/2020', '18:9:53', 'AEB12341', 1),
	(242, 101, '19/5/2020', '18:9:54', 'AEB12341', 1),
	(243, 101, '19/5/2020', '18:9:55', 'AEB12341', 1),
	(244, 101, '19/5/2020', '18:9:57', 'AEB12341', 1),
	(245, 101, '19/5/2020', '18:9:58', 'AEB12341', 1),
	(246, 201, '20/5/2020', '13:35:41', 'AEB12341', 1),
	(247, 101, '20/5/2020', '13:36:33', 'AEB12341', 1),
	(248, 101, '20/5/2020', '13:36:34', 'AEB12341', 1),
	(249, 459, '20/5/2020', '13:55:50', 'AEB12341', 1),
	(250, 459, '20/5/2020', '13:55:53', 'AEB12341', 1),
	(251, 459, '20/5/2020', '13:55:54', 'AEB12341', 1),
	(252, 459, '20/5/2020', '13:55:55', 'AEB12341', 1),
	(253, 459, '20/5/2020', '13:55:56', 'AEB12341', 1),
	(254, 459, '20/5/2020', '13:55:58', 'AEB12341', 1),
	(255, 459, '20/5/2020', '13:55:59', 'AEB12341', 1),
	(256, 459, '20/5/2020', '13:56:1', 'AEB12341', 1),
	(257, 459, '20/5/2020', '13:56:2', 'AEB12341', 1),
	(258, 459, '20/5/2020', '14:2:58', 'AEB12341', 1),
	(259, 101, '20/5/2020', '14:3:3', 'AEB12341', 1),
	(260, 101, '20/5/2020', '14:3:5', 'AEB12341', 1),
	(261, 101, '20/5/2020', '14:3:6', 'AEB12341', 1),
	(262, 101, '20/5/2020', '14:3:12', 'AEB12341', 1),
	(263, 101, '20/5/2020', '14:3:14', 'AEB12341', 1),
	(264, 101, '20/5/2020', '14:4:50', 'AEB12341', 1),
	(265, 101, '20/5/2020', '14:4:55', 'AEB12341', 1),
	(266, 101, '20/5/2020', '14:5:3', 'AEB12341', 1),
	(267, 101, '20/5/2020', '14:5:20', 'AEB12341', 1),
	(268, 101, '20/5/2020', '14:5:39', 'AEB12341', 1),
	(269, 101, '20/5/2020', '14:5:44', 'AEB12341', 1),
	(270, 101, '20/5/2020', '14:5:45', 'AEB12341', 1),
	(271, 101, '20/5/2020', '14:6:13', 'AEB12341', 1),
	(272, 101, '20/5/2020', '14:6:15', 'AEB12341', 1),
	(273, 101, '20/5/2020', '14:6:29', 'AEB12341', 1),
	(274, 101, '20/5/2020', '14:6:36', 'AEB12341', 1),
	(275, 101, '20/5/2020', '14:8:31', 'AEB12341', 1),
	(276, 101, '20/5/2020', '14:15:46', 'AEB12341', 1),
	(277, 459, '20/5/2020', '14:33:50', 'AEB12341', 1),
	(278, 459, '20/5/2020', '14:33:51', 'AEB12341', 1),
	(279, 459, '20/5/2020', '14:33:52', 'AEB12341', 1),
	(280, 459, '20/5/2020', '14:33:54', 'AEB12341', 1),
	(281, 459, '20/5/2020', '14:33:55', 'AEB12341', 1),
	(282, 459, '20/5/2020', '14:33:57', 'AEB12341', 1),
	(283, 459, '20/5/2020', '14:33:58', 'AEB12341', 1),
	(284, 459, '20/5/2020', '14:34:0', 'AEB12341', 1),
	(285, 459, '20/5/2020', '14:34:1', 'AEB12341', 1),
	(286, 459, '20/5/2020', '14:34:3', 'AEB12341', 1),
	(287, 459, '20/5/2020', '14:34:4', 'AEB12341', 1),
	(288, 459, '20/5/2020', '14:34:6', 'AEB12341', 1),
	(289, 459, '20/5/2020', '14:34:7', 'AEB12341', 1),
	(290, 459, '20/5/2020', '14:34:9', 'AEB12341', 1),
	(291, 459, '20/5/2020', '14:34:10', 'AEB12341', 1),
	(292, 459, '20/5/2020', '14:34:12', 'AEB12341', 1),
	(293, 459, '20/5/2020', '14:34:13', 'AEB12341', 1),
	(294, 459, '20/5/2020', '14:34:15', 'AEB12341', 1),
	(295, 459, '20/5/2020', '14:34:16', 'AEB12341', 1),
	(296, 459, '20/5/2020', '14:34:18', 'AEB12341', 1),
	(297, 459, '20/5/2020', '14:34:19', 'AEB12341', 1),
	(298, 459, '20/5/2020', '14:34:21', 'AEB12341', 1),
	(299, 459, '20/5/2020', '14:34:22', 'AEB12341', 1),
	(300, 459, '20/5/2020', '14:34:24', 'AEB12341', 1),
	(301, 459, '20/5/2020', '14:34:25', 'AEB12341', 1),
	(302, 459, '20/5/2020', '14:34:27', 'AEB12341', 1),
	(303, 459, '20/5/2020', '14:34:28', 'AEB12341', 1),
	(304, 459, '20/5/2020', '14:34:30', 'AEB12341', 1),
	(305, 459, '20/5/2020', '14:34:31', 'AEB12341', 1),
	(306, 459, '20/5/2020', '14:34:33', 'AEB12341', 1),
	(307, 459, '20/5/2020', '14:34:34', 'AEB12341', 1),
	(308, 459, '20/5/2020', '14:34:36', 'AEB12341', 1),
	(309, 459, '20/5/2020', '14:34:37', 'AEB12341', 1),
	(310, 459, '20/5/2020', '14:34:39', 'AEB12341', 1),
	(311, 459, '20/5/2020', '14:34:40', 'AEB12341', 1),
	(312, 459, '20/5/2020', '14:34:42', 'AEB12341', 1),
	(313, 459, '20/5/2020', '14:34:43', 'AEB12341', 1),
	(314, 459, '20/5/2020', '14:34:45', 'AEB12341', 1),
	(315, 459, '20/5/2020', '14:34:46', 'AEB12341', 1),
	(316, 459, '20/5/2020', '14:34:48', 'AEB12341', 1),
	(317, 459, '20/5/2020', '14:34:49', 'AEB12341', 1),
	(318, 459, '20/5/2020', '14:34:51', 'AEB12341', 1),
	(319, 459, '20/5/2020', '14:34:53', 'AEB12341', 1),
	(320, 459, '20/5/2020', '14:34:54', 'AEB12341', 1),
	(321, 459, '20/5/2020', '14:34:56', 'AEB12341', 1),
	(322, 459, '20/5/2020', '14:34:57', 'AEB12341', 1),
	(323, 459, '20/5/2020', '14:34:59', 'AEB12341', 1),
	(324, 459, '20/5/2020', '14:35:0', 'AEB12341', 1),
	(325, 459, '20/5/2020', '14:35:2', 'AEB12341', 1),
	(326, 459, '20/5/2020', '14:35:3', 'AEB12341', 1),
	(327, 459, '20/5/2020', '14:35:5', 'AEB12341', 1),
	(328, 459, '20/5/2020', '14:35:6', 'AEB12341', 1),
	(329, 459, '20/5/2020', '14:35:8', 'AEB12341', 1),
	(330, 459, '20/5/2020', '14:35:9', 'AEB12341', 1),
	(331, 459, '20/5/2020', '14:35:11', 'AEB12341', 1),
	(332, 459, '20/5/2020', '14:35:12', 'AEB12341', 1),
	(333, 459, '20/5/2020', '14:35:14', 'AEB12341', 1),
	(334, 459, '20/5/2020', '14:35:15', 'AEB12341', 1),
	(335, 459, '20/5/2020', '14:35:17', 'AEB12341', 1),
	(336, 459, '20/5/2020', '14:35:18', 'AEB12341', 1),
	(337, 459, '20/5/2020', '14:35:20', 'AEB12341', 1),
	(338, 459, '20/5/2020', '14:35:21', 'AEB12341', 1),
	(339, 459, '20/5/2020', '14:35:23', 'AEB12341', 1),
	(340, 459, '20/5/2020', '14:35:24', 'AEB12341', 1),
	(341, 459, '20/5/2020', '14:35:26', 'AEB12341', 1),
	(342, 459, '20/5/2020', '14:35:27', 'AEB12341', 1),
	(343, 459, '20/5/2020', '14:35:29', 'AEB12341', 1),
	(344, 459, '20/5/2020', '14:35:30', 'AEB12341', 1),
	(345, 459, '20/5/2020', '14:35:31', 'AEB12341', 1),
	(346, 459, '20/5/2020', '14:35:31', 'AEB12341', 1),
	(350, 101, '2/6/2020', '14:35:31', 'AEB12341', 1),
	(351, 101, '2/6/2020', '14:35:31', 'AEB12341', 2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.event_list
CREATE TABLE IF NOT EXISTS `event_list` (
  `event_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table accesscontrolapi.event_list: ~92 rows (approximately)
/*!40000 ALTER TABLE `event_list` DISABLE KEYS */;
INSERT INTO `event_list` (`event_id`, `description`) VALUES
	(101, 'User Allowed'),
	(102, 'User Allowed - with Duress'),
	(103, 'User Allowed - Anti Pass Back-soft'),
	(104, 'User Allowed - Dead-man Zone'),
	(105, 'User Allowed - Door Not open'),
	(106, 'User Allowed - Smart Secure Access'),
	(107, 'User Allowed - Smart card based route access - soft'),
	(108, 'User Allowed - Panel route access - soft'),
	(109, 'User Allowed - two person rule - primary user'),
	(110, 'User Allowed - two person rule - secondary user'),
	(151, 'User Denied - User Invalid'),
	(152, 'User Denied - Occupancy Control'),
	(153, 'User Denied - 2-Person Rule'),
	(154, 'User Denied - Time Out'),
	(155, 'User Denied - Visitor Escort Rule'),
	(156, 'User Denied - Anti-Pass Back'),
	(157, 'User Denied - Disabled User'),
	(158, 'User Denied - Blocked User'),
	(159, 'User Denied - First IN User'),
	(160, 'User Denied - DND Enabled'),
	(161, 'User Denied - Control Zone'),
	(162, 'User Denied - Door Lock'),
	(163, 'User Denied - Invalid Access Group'),
	(164, 'User Denied - Validity date expired'),
	(165, 'User Denied - Invalid Route Access'),
	(166, 'User Denied - Invalid Shift Access'),
	(167, 'User Denied - Invalid Access Cluster'),
	(171, 'Visitor Denied'),
	(172, 'User Denied - FP Sensor Busy'),
	(201, 'Door Status Changed'),
	(202, 'Dead-man Timer Changed'),
	(203, 'DND Status Changed'),
	(204, 'Aux Input Status Changed'),
	(205, 'Aux Output Status Changed'),
	(206, 'Door Sense Input Status'),
	(207, 'Door Controller Communication Status'),
	(208, 'Door Open/Close'),
	(209, 'Lock Relay Status Changed'),
	(301, 'Dead-man Timer Expired Alarm - User IN'),
	(302, 'Duress Detection'),
	(303, 'Panic Alarm'),
	(304, 'FP Memory Full - Alarm'),
	(305, 'Door Held Open Too Long'),
	(306, 'Door Abnormal'),
	(307, 'Door Force Open'),
	(308, 'Door Controller Offline'),
	(309, 'Door Controller - Fault'),
	(310, 'Tamper Alarm'),
	(311, 'Master Controller Mains Fail Alarm'),
	(312, 'Master Controller Battery Fail'),
	(313, 'Master Alarm - MC Alarm Input'),
	(314, 'RTC'),
	(315, 'Event Buffer Full'),
	(317, 'Intercom - Panic'),
	(318, 'Occupancy Violated Alarm'),
	(319, 'Tail - Gating Alarm'),
	(320, 'Man Trap Timer Violated Alarm'),
	(321, 'Access Denied Alarm'),
	(322, 'Multiple Unauthorized Access Alarm'),
	(323, 'Custom Alarm 1'),
	(324, 'Custom Alarm 2'),
	(325, 'Custom Alarm 3'),
	(326, 'User Unidentified'),
	(327, 'Anti-Pass Back Violated Alarm'),
	(328, 'Access Route Violated Alarm'),
	(329, 'Raise Alarm'),
	(351, 'Alarm Acknowledged'),
	(352, 'Alarm Cleared'),
	(353, 'Alarm Re-Issued'),
	(401, 'User Block/Restore'),
	(402, 'Login To ACS'),
	(403, 'Message Transaction Confirmation To ACMS'),
	(404, 'Guard Tour - Status'),
	(405, 'Enrollment'),
	(406, 'Master Alarm Sense Input Status'),
	(407, 'Master Aux Output Status'),
	(408, 'Input Output Group Link Status'),
	(409, 'Credentials Deleted'),
	(410, 'Time Triggered Function'),
	(411, 'Time Stamping Function'),
	(412, 'Guard Tag'),
	(413, 'Camera Event For Timestamp'),
	(451, 'Configuration Change'),
	(452, 'Roll Over Of Events'),
	(453, 'Master Controller Power On'),
	(454, 'Configuration Defaulted'),
	(455, 'Soft Override'),
	(456, 'Backup And Update'),
	(457, 'Default System'),
	(458, 'Sensor Calibration'),
	(459, 'User Denied - Invalid Card'),
	(460, 'User PIN Change');
/*!40000 ALTER TABLE `event_list` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.hosts
CREATE TABLE IF NOT EXISTS `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `host_ip` varchar(16) NOT NULL,
  `host_user` varchar(255) NOT NULL,
  `host_passwd` varchar(255) NOT NULL,
  `host_status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table accesscontrolapi.hosts: ~8 rows (approximately)
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` (`id`, `host_name`, `host_ip`, `host_user`, `host_passwd`, `host_status`) VALUES
	(1, 'G1', '10.70.3.101', 'admin', '888888', 'A'),
	(2, 'G2', '10.70.3.102', 'admin', '888888', 'A'),
	(3, 'G3', '10.70.3.103', 'admin', '888888', 'A'),
	(5, 'G4', '10.70.3.104', 'admin', '888888', 'A'),
	(6, 'G5', '10.70.3.105', 'admin', '888888', 'A'),
	(7, 'G6', '10.70.3.106', 'admin', '888888', 'A'),
	(8, 'G7', '10.70.3.107', 'admin', '888888', 'A'),
	(9, 'G8', '10.70.3.108', 'admin', '888888', 'A'),
	(10, 'G9', '10.70.3.109', 'admin', '888888', 'A'),
	(11, 'G10', '10.70.3.110', 'admin', '888888', 'A');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;

-- Dumping structure for table accesscontrolapi.used_disabled_tickets
CREATE TABLE IF NOT EXISTS `used_disabled_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_no` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table accesscontrolapi.used_disabled_tickets: ~0 rows (approximately)
/*!40000 ALTER TABLE `used_disabled_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_disabled_tickets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;