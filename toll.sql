-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 25, 2020 at 03:29 PM
-- Server version: 8.0.18
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toll`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `tollstable_proc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tollstable_proc` ()  select * from tollstable$$

DROP PROCEDURE IF EXISTS `tollvehiclesmonthly_proc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tollvehiclesmonthly_proc` ()  select * from tollvehiclesmonthly$$

DROP PROCEDURE IF EXISTS `tollvehicles_proc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tollvehicles_proc` ()  select * from tollvehicles$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customerslogin`
--

DROP TABLE IF EXISTS `customerslogin`;
CREATE TABLE IF NOT EXISTS `customerslogin` (
  `customerid` int(10) NOT NULL AUTO_INCREMENT,
  `cemail` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  UNIQUE KEY `customerid` (`customerid`,`cemail`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerslogin`
--

INSERT INTO `customerslogin` (`customerid`, `cemail`, `password`) VALUES
(20, 'ravit@gmail.com', 'qwerty'),
(21, 'vamshi@gmail.com', 'qwerty123');

-- --------------------------------------------------------

--
-- Table structure for table `customerstable`
--

DROP TABLE IF EXISTS `customerstable`;
CREATE TABLE IF NOT EXISTS `customerstable` (
  `customerid` int(10) NOT NULL AUTO_INCREMENT,
  `clicense` varchar(15) NOT NULL,
  `cfirstname` varchar(15) NOT NULL,
  `clastname` varchar(15) NOT NULL,
  `cemail` varchar(30) NOT NULL,
  `cphone` varchar(10) NOT NULL,
  `cregion` varchar(20) NOT NULL,
  `caddress` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gdidcardno` varchar(20) NOT NULL,
  UNIQUE KEY `clicense` (`clicense`),
  UNIQUE KEY `gdidcardno` (`gdidcardno`),
  KEY `customerid` (`customerid`),
  KEY `customerid_2` (`customerid`),
  KEY `customerid_3` (`customerid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerstable`
--

INSERT INTO `customerstable` (`customerid`, `clicense`, `cfirstname`, `clastname`, `cemail`, `cphone`, `cregion`, `caddress`, `password`, `gdidcardno`) VALUES
(1, '9676755790123', 'ravi', 'teja', 'ravit@gmail.com', '9741988287', 'Karnataka', 'bangalore', 'qwerty', '12345678902349'),
(2, '98877665544', 'Vamshi', 'Reddy', 'vamshi@gmail.com', '8197881555', 'Karnataka', 'bangalore karnataka', 'qwerty123', '980987684478');

--
-- Triggers `customerstable`
--
DROP TRIGGER IF EXISTS `insertintologin`;
DELIMITER $$
CREATE TRIGGER `insertintologin` AFTER INSERT ON `customerstable` FOR EACH ROW insert into customerslogin(cemail,password) VALUES (new.cemail,new.password)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fromtoplace`
--

DROP TABLE IF EXISTS `fromtoplace`;
CREATE TABLE IF NOT EXISTS `fromtoplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromplace` varchar(30) NOT NULL,
  `toplace` varchar(30) NOT NULL,
  `tollid` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fromtoplace`
--

INSERT INTO `fromtoplace` (`id`, `fromplace`, `toplace`, `tollid`) VALUES
(1, 'Bengaluru', 'Mysore', 0),
(3, 'Bengaluru', 'Hassan', 6),
(4, 'Bengaluru', 'Devanhalli', 29),
(5, 'Bengaluru', 'Bagepalli', 29),
(6, 'Mysore', 'Tumkur', 2),
(7, 'Mysore', 'Hassan', 30),
(8, 'Mysore', 'Devanhalli', 29),
(9, 'Mysore', 'Bagepalli', 3),
(10, 'Tumkur', 'Hassan', 2),
(11, 'Tumkur', 'Devanhalli', 3),
(12, 'Tumkur', 'Bagepalli', 2),
(13, 'Hassan', 'Devanhalli', 2),
(14, 'Hassan', 'Bagepalli', 3),
(15, 'Devanhalli', 'Bagepalli', 2),
(17, 'Bengaluru', 'Tumkur', 30),
(18, 'Bengaluru', 'Hassan', 23);

-- --------------------------------------------------------

--
-- Table structure for table `tollstable`
--

DROP TABLE IF EXISTS `tollstable`;
CREATE TABLE IF NOT EXISTS `tollstable` (
  `tollid` int(6) NOT NULL,
  `tollname` varchar(100) NOT NULL,
  `NH No` int(3) NOT NULL,
  `tolladdress` varchar(100) NOT NULL,
  `tollorganization` varchar(10) NOT NULL,
  `tollhelpline` varchar(20) NOT NULL,
  `tolllanes` varchar(10) NOT NULL,
  `tollregoin` varchar(20) NOT NULL,
  PRIMARY KEY (`tollid`),
  UNIQUE KEY `tollname` (`tollname`,`tolladdress`,`tollhelpline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tollstable`
--

INSERT INTO `tollstable` (`tollid`, `tollname`, `NH No`, `tolladdress`, `tollorganization`, `tollhelpline`, `tolllanes`, `tollregoin`) VALUES
(1, 'Attibele (BETL)', 7, 'Silk Board Junction - Hosur', 'NHAI', '8023112233', '4', 'Karnataka'),
(2, 'Bagepalli', 7, 'AP/ Karnataka Border - Devanhalli (Km 462.164 to Km 533.619)', 'NHAI', '8023112222', '8', 'Karnataka'),
(3, 'Bankapur', 4, 'Gabbur - Devgiri (Km 404.000 To Km 340.000)', 'NHAI', '8023112233', '6', 'Karnataka'),
(4, 'Brahamarakotlu', 73, 'B.C.Road - Padil & Padil Bypass (Km 328.000 to Km 345.00 & Km of Padil Bypass)', 'NHAI', '8023112244', '4', 'Karnataka'),
(5, 'Chalageri', 4, 'Hadadi - Devgiri (Km 260.000 to Km 340.000)', 'NHAI', '8023112255', '6', 'Karnataka'),
(6, 'Doddakarenahalli (Neelmangala )', 75, 'Neelmangala Junction to Devihalli', 'NHAI', '8023112266', '6', 'Karnataka'),
(7, 'Elevated Section/ Electronic City', 44, 'Silk Board Junction - Hosur', 'NHAI', '8023112277', '8', 'Karnataka'),
(8, 'Gabbur (MoRTH)', 4, 'Hubli ? Dharwad bypass from Km.403.800 to 433.200', 'NHAI', '8023112288', '8', 'Karnataka'),
(9, 'Gaddurur', 75, 'Mulbagal-AP/KNT Border (km.216.912 to 239.100', 'NHAI', '8023112299', '6', 'Karnataka'),
(10, 'Guilalu', 48, 'Tumkur - Chitradurga', 'NHAI', '8023112200', '6', 'Karnataka'),
(11, 'Gundmi', 66, 'Kundapur - Surathkal', 'NHAI', '8023113311', '4', 'Karnataka'),
(12, 'Hattargi', 4, 'Hattargi - Hirebagewadi (Km 537.000 to Km 515.000)', 'NHAI', '8023113322', '6', 'Karnataka'),
(13, 'Hazamady', 66, 'Kundapur - Surathkal', 'NHAI', '8023113333', '4', 'Karnataka'),
(14, 'Hebbalu', 48, 'Doddasiddavanahally - Hadadi (Km 189.000 to Km 260.000)', 'NHAI', '8023113344', '6', 'Karnataka'),
(15, 'Hirebagewadi', 4, 'Belgaum - Dharwad', 'NHAI', '8023113355', '8', 'Karnataka'),
(16, 'Hitnal', 13, 'Hungund - Hospet (Km 202.000 to 299.000)', 'NHAI', '8023113366', '4', 'Karnataka'),
(17, 'Hoskote', 75, 'Bangalore Kolar Mulbagal', 'NHAI', '8023113377', '8', 'Karnataka'),
(18, 'Kamkole', 65, 'MH KNT Border to Sangareddy', 'NHAI', '8023113388', '6', 'Karnataka'),
(19, 'Karbylu (Bellur Cross)', 75, 'Neelamangla Junction - Devihalli', 'NHAI', '8023113399', '6', 'Karnataka'),
(20, 'Karjeevanhalli', 48, 'Tumkur - Chitradurga including Tumkur Bypass', 'NHAI', '8023113300', '4', 'Karnataka'),
(21, 'Kasaba (Bijapur)', 50, 'Bijapur - Hungund', 'NHAI', '8023114411', '4', 'Karnataka'),
(22, 'Kaythsandra/Tumkur/Chokkanahalli', 4, 'Nelamangala - Tumkur', 'NHAI', '8023114422', '6', 'Karnataka'),
(23, 'Kirasave', 75, 'Hassan - Devihalli', 'NHAI', '8023114433', '6', 'Karnataka'),
(24, 'Kognoli', 4, 'Maharashtra Border -Belgaum (Km 592.240 to Km 537.000)', 'NHAI', '8023114444', '6', 'Karnataka'),
(25, 'Mangalgi', 65, 'MH KNT Border to Sangareddy', 'NHAI', '8023114455', '4', 'Karnataka'),
(26, 'Mulbagal', 75, 'Mulbagal-Kolar-Bangalore section (Km 237.000 to Km 318.000)', 'NHAI', '8023114466', '6', 'Karnataka'),
(27, 'Nagarhalla', 50, 'Bijapur - Hungund', 'NHAI', '8023114477', '4', 'Karnataka'),
(28, 'Narendra (MoRTH)', 4, 'Bangalore Pune Section', 'NHAI', '8023114488', '8', 'Karnataka'),
(29, 'Navayuga Devanahalli / Sadahalli / Pujanahalli', 44, 'Devanahalli - Bangalore (Km 534.720 - Km 556.84 of Bangalore - Hyderabad)', 'NHAI', '8023114499', '8', 'Karnataka'),
(30, 'Neelamangala - Tumkur', 4, 'Neelmangla - Tumkur', 'NHAI', '8023114400', '8', 'Karnataka'),
(31, 'Shahapur', 13, 'Hungund - Hospet (Km 202.000 to 299.000)', 'NHAI', '8023115511', '6', 'Karnataka'),
(32, 'Shanthigrama', 75, 'Hassan - Devihalli', 'NHAI', '8023115522', '4', 'Karnataka'),
(33, 'Surathkal', 66, 'Surathkal - Nantoor & Nantoor Bypass (Km 358.000 to 375.300 & 1.6 Km of Nantoor ByPass)', 'NHAI', '8023115533', '6', 'Karnataka'),
(34, 'Talapady', 66, 'Kundapur - Surathkal', 'NHAI', '8023115544', '4', 'Karnataka'),
(35, 'Towards Bengaluru', 4, 'Banglore - Neelamangla (Km 10.00 to Km 29.50)', 'NHAI', '8023115555', '8', 'Karnataka'),
(36, 'Towards Neelmangla', 4, 'Banglore - Neelamangla (Km 10.00 to Km 29.50)', 'NHAI', '8023115566', '8', 'Karnataka'),
(37, 'Vanagari', 13, 'Hungund - Hospet (Km 202.000 to 299.000)', 'NHAI', '8023115577', '6', 'Karnataka');

-- --------------------------------------------------------

--
-- Table structure for table `tollvehicles`
--

DROP TABLE IF EXISTS `tollvehicles`;
CREATE TABLE IF NOT EXISTS `tollvehicles` (
  `tollid` int(6) NOT NULL,
  `tollname` varchar(100) NOT NULL,
  `twowheeler` float NOT NULL,
  `cjv` float NOT NULL,
  `lcv` float NOT NULL,
  `bt` float NOT NULL,
  `HCM/EME` float NOT NULL,
  `govt-defence` float NOT NULL,
  UNIQUE KEY `tollname` (`tollname`),
  KEY `tollid` (`tollid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tollvehicles`
--

INSERT INTO `tollvehicles` (`tollid`, `tollname`, `twowheeler`, `cjv`, `lcv`, `bt`, `HCM/EME`, `govt-defence`) VALUES
(100001, 'Attibele (BETL)', 0, 30, 50, 95, 205, 0),
(100002, 'Bagepalli', 0, 90, 150, 310, 490, 0),
(100003, 'Bankapur', 0, 55, 85, 180, 285, 0),
(100004, 'Brahamarakotlu', 0, 25, 40, 85, 135, 0),
(100005, 'Chalageri', 0, 75, 125, 260, 540, 0),
(100006, 'Doddakarenahalli (Neelmangala)', 0, 45, 80, 155, 255, 0),
(100007, 'Elevated Section/Electronic City', 0, 50, 70, 135, 270, 0),
(100008, 'Gabbur (MoRTH)', 0, 45, 113, 151, 178, 0),
(100009, 'Gaddurur', 0, 25, 40, 85, 135, 0),
(100010, 'Guilalu', 0, 65, 115, 225, 350, 0),
(100011, 'Gundmi', 0, 45, 70, 145, 230, 0),
(100012, 'Hattargi', 0, 25, 45, 95, 145, 0),
(100013, 'Hazamady', 0, 35, 60, 120, 190, 0),
(100014, 'Hebbalu', 0, 60, 95, 195, 310, 0),
(100015, 'Hirebagewadi', 0, 90, 150, 310, 485, 0),
(100016, 'Hitnal', 0, 40, 60, 125, 190, 0),
(100017, 'Hoskote', 0, 20, 30, 65, 100, 0),
(100018, 'Kamkole', 0, 90, 145, 305, 475, 0),
(100019, 'Karbylu (Bellur Cross)', 0, 45, 80, 155, 255, 0),
(100020, 'Karjeevanhalli', 0, 80, 130, 280, 435, 0),
(100021, 'Kasaba (Bijapur)', 0, 55, 90, 190, 300, 0),
(100022, 'Kaythsandra/Tumkur/Chokkanahalli', 0, 35, 65, 130, 200, 0),
(100023, 'Kirasave', 0, 45, 70, 145, 230, 0),
(100024, 'Kognoli', 0, 70, 115, 235, 370, 0),
(100025, 'Mangalgi', 0, 85, 140, 290, 455, 0),
(100026, 'Mulbagal', 0, 70, 125, 250, 400, 0),
(100027, 'Nagarhalla', 0, 90, 140, 290, 445, 0),
(100028, 'Narendra (MoRTH)', 0, 45, 113, 151, 195, 0),
(100029, 'Navayuga Devanahalli/Sadahalli/Pujanahalli', 0, 90, 140, 280, 425, 0),
(100030, 'Neelamangala -Tumkur/kulumepalya', 0, 35, 65, 130, 210, 0),
(100031, 'Shahapur', 0, 50, 80, 170, 265, 0),
(100032, 'Shanthigrama', 0, 35, 60, 125, 195, 0),
(100033, 'Surathkal', 0, 50, 85, 175, 275, 0),
(100034, 'Talapady', 0, 40, 60, 125, 185, 0),
(100035, 'Towards Bengaluru', 0, 20, 35, 75, 125, 0),
(100036, 'Towards Neelmangla', 0, 20, 30, 75, 125, 0),
(100037, 'Vanagari', 0, 50, 80, 170, 265, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tollvehiclesmonthly`
--

DROP TABLE IF EXISTS `tollvehiclesmonthly`;
CREATE TABLE IF NOT EXISTS `tollvehiclesmonthly` (
  `tollid` int(6) NOT NULL,
  `tollname` varchar(100) NOT NULL,
  `twowheeler` float NOT NULL,
  `cjv` float NOT NULL,
  `lcv` float NOT NULL,
  `bt` float NOT NULL,
  `HCM/EME` float NOT NULL,
  `govt-defence` float NOT NULL,
  UNIQUE KEY `tollname` (`tollname`),
  KEY `tollid` (`tollid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tollvehiclesmonthly`
--

INSERT INTO `tollvehiclesmonthly` (`tollid`, `tollname`, `twowheeler`, `cjv`, `lcv`, `bt`, `HCM/EME`, `govt-defence`) VALUES
(100001, 'Attibele (BETL)', 0, 870, 1445, 2895, 6080, 0),
(100002, 'Bagepalli', 0, 3070, 4960, 10395, 16300, 0),
(100003, 'Bankapur', 0, 1795, 2905, 6080, 9540, 0),
(100004, 'Brahamarakotlu', 0, 835, 1350, 2825, 4430, 0),
(100005, 'Chalageri', 0, 2545, 4110, 8615, 18010, 0),
(100006, 'Doddakarenahalli (Neelmangala)', 0, 1350, 2360, 4725, 7590, 0),
(100007, 'Elevated Section/Electronic City', 0, 1445, 2025, 4050, 8105, 0),
(100008, 'Gabbur (MoRTH)', 0, 1040, 2030, 4050, 6750, 0),
(100009, 'Gaddurur', 0, 855, 1380, 2890, 4530, 0),
(100010, 'Guilalu', 0, 2190, 3540, 7420, 11635, 0),
(100011, 'Gundmi', 0, 1450, 2345, 4910, 7700, 0),
(100012, 'Hattargi', 0, 915, 1475, 3090, 4845, 0),
(100013, 'Hazamady', 0, 1195, 1930, 4040, 6335, 0),
(100014, 'Hebbalu', 0, 1935, 3125, 6545, 10265, 0),
(100015, 'Hirebagewadi', 0, 3050, 4930, 10330, 16200, 0),
(100016, 'Hitnal', 0, 1325, 2035, 4140, 6280, 0),
(100017, 'Hoskote', 0, 540, 950, 1900, 3050, 0),
(100018, 'Kamkole', 0, 2985, 4820, 10100, 15840, 0),
(100019, 'Karbylu (Bellur Cross)', 0, 1350, 2360, 4725, 7590, 0),
(100020, 'Karjeevanhalli', 0, 2715, 4390, 9200, 14425, 0),
(100021, 'Kasaba (Bijapur)', 0, 1870, 3020, 6325, 9920, 0),
(100022, 'Kaythsandra/Tumkur/Chokkanahalli', 0, 2030, 4050, 6050, 7050, 0),
(100023, 'Kirasave', 0, 1440, 2330, 4880, 7650, 0),
(100024, 'Kognoli', 0, 2335, 3775, 7905, 12395, 0),
(100025, 'Mangalgi', 0, 2855, 4615, 9665, 15160, 0),
(100026, 'Mulbagal', 0, 2140, 3745, 7485, 12030, 0),
(100027, 'Nagarhalla', 0, 3000, 4695, 9635, 14810, 0),
(100028, 'Narendra (MoRTH)', 0, 2050, 4030, 6700, 8050, 0),
(100029, 'Navayuga Devanahalli/Sadahalli/Pujanahalli', 0, 3020, 4640, 9330, 14160, 0),
(100030, 'Neelamangala - Tumkur/kulumepalya', 0, 2040, 4050, 5060, 12350, 0),
(100031, 'Shahapur', 0, 1660, 2680, 5615, 8810, 0),
(100032, 'Shanthigrama', 0, 1240, 2000, 4190, 6570, 0),
(100033, 'Surathkal', 0, 1740, 2810, 5885, 9225, 0),
(100034, 'Talapady', 0, 1305, 2015, 4100, 6230, 0),
(100035, 'Towards Bengaluru', 0, 670, 1115, 2290, 4200, 0),
(100036, 'Towards Neelmangla', 0, 670, 1115, 2290, 4200, 0),
(100037, 'Vanagari', 0, 1660, 2680, 5615, 8810, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicleregistration`
--

DROP TABLE IF EXISTS `vehicleregistration`;
CREATE TABLE IF NOT EXISTS `vehicleregistration` (
  `vehicletype` varchar(10) NOT NULL,
  `vehiclenumber` varchar(10) NOT NULL,
  `customername` varchar(20) NOT NULL,
  `vehicleboard` varchar(6) NOT NULL,
  `vehiclercno` varchar(20) NOT NULL,
  `vehiclecolour` varchar(10) NOT NULL,
  `vehiclename` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicleregistration`
--

INSERT INTO `vehicleregistration` (`vehicletype`, `vehiclenumber`, `customername`, `vehicleboard`, `vehiclercno`, `vehiclecolour`, `vehiclename`) VALUES
('lcv', '4342425', 'VAMSHI', '23', '2r2r222r', '2r2rr', '23rrr3r'),
('twowheeler', '4342425', 'YourName', '23r', '2r2r222r', '2r2rr', '23rrr3r'),
('bt', '4342425', 'VA', '2', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', '4342425', 'VAMS', 'black', '2r2r222r', '2r2rr', '23rrr3r'),
('cjv', '4342425', 'YourName', 'Yellow', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', '4342425', 'VAMSHI', 'White', '2r2r222r', '2r2rr', '23rrr3r'),
('cjv', '4342425', 'Vjj', 'White', 'fg', 'uyg', 'iuhghj'),
('cjv', '4342425', 'Vjj', 'White', 'fg', 'uyg', 'iuhghj'),
('cjv', '4342425', 'Vjj', 'White', 'fg', 'uyg', 'iuhghj'),
('cjv', '4342425', 'Vjj', 'White', 'fg', 'uyg', 'iuhghj'),
('HCM/EME', '4342425', 'VAMSHI', 'Yellow', '2r2r222r', 'blue', '23rrr3r'),
('lcv', '4342425', 'YourName', 'Yellow', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', '4342425', 'VAMSHI', 'Yellow', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', '4342425', 'VAMSHI', 'Yellow', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', '4342425', 'VAMSHI', 'Yellow', '2r2r222r', '2r2rr', '23rrr3r'),
('lcv', 'sv\'ljs', '1jbs', 'White', 'u', 'vsljddckn', 'ljlbjkln'),
('lcv', 'sv\'ljs', '1jbs', 'White', 'u', 'vsljddckn', 'ljlbjkln'),
('lcv', 'sv\'ljs', 'YourName', 'Yellow', 'kjbdslj', 'kbkb', 'kjhv'),
('lcv', 'retdfh', 'rtygh;', 'White', 'werstkl', 'edtgul', 'erdjk,'),
('cjv', 'ka04ns1432', 'VAMSHI', 'White', 'rcn234565', 'black', 'fortuner'),
('twowheeler', 'dfghg', 'sSEGUdceuis', 'White', 'sefhusizubfeg', 'ilsyewfg', 'kxducb'),
('lcv', 'ddfghj', 'errtt', 'White', 'uyldul', 'yuu', 'htdyt');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
