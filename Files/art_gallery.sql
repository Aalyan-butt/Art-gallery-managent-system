-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2022 at 01:14 PM
-- Server version: 5.7.23
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_gallery`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `display`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `display` ()  SELECT Cu.custid, gid, artid, fname, lname, dob, address, Co.PHONE from CUSTOMER Cu JOIN contacts Co on Cu.custid=Co.CUSTID$$

DROP PROCEDURE IF EXISTS `GetAge`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAge` ()  BEGIN 
SELECT *, year(CURRENT_DATE())-year(DOB) as age from CUSTOMER;
END$$

DELIMITER ;

-- --------------------------------------------------------
--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `artistid` varchar(20) NOT NULL,
  `gid` varchar(20) DEFAULT NULL,
  `custid` varchar(20) DEFAULT NULL,
  `eid` varchar(20) DEFAULT NULL,
  `fname1` char(25) DEFAULT NULL,
  `lname1` char(25) DEFAULT NULL,
  `birthplace` char(25) DEFAULT NULL,
  `style` char(25) DEFAULT NULL,
  PRIMARY KEY (`artistid`),
  KEY `gid` (`gid`),
  KEY `eid` (`eid`),
  KEY `custid` (`custid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artistid`, `gid`, `custid`, `eid`, `fname1`, `lname1`, `birthplace`, `style`) VALUES
('500', '100', '400', '200', 'Salman', 'Arshad', 'USA', 'Oil on Canvas'),
('501', '101', '401', '201', 'Pablo', 'Picasso', 'Spain', 'Analytic Cubism'),
('502', '102', '402', '202', 'Rembrandt', 'Rudy', 'Netherlands', 'Oil Painting'),
('503', '103', '403', '203', 'Theodore', 'Sama', 'France', 'Oil Painting'),
('504', '104', '404', '204', 'Leonardo', 'Caprio', 'Italy', 'High Renaissance'),
('505', '105', '405', '205', 'Mind', 'Hunter', 'USA', 'Oil Painting'),
('506', '106', '406', '206', 'Rehan', 'Aslam', 'Pakistan', 'Entique');


-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
CREATE TABLE IF NOT EXISTS `artwork` (
  `artid` varchar(20) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `type_of_art` varchar(20) DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `eid` varchar(20) DEFAULT NULL,
  `gid` varchar(20) DEFAULT NULL,
  `artistid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`artid`),
  KEY `eid` (`eid`),
  KEY `gid` (`gid`),
  KEY `artistid` (`artistid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artwork`
--

INSERT INTO `artwork` (`artid`, `title`, `year`, `type_of_art`, `price`, `eid`, `gid`, `artistid`) VALUES
('300', 'Mona Lisa', '2003', 'Painting', '10000', '203', '103', '500'),
('301', 'Beauty', '1973', 'Atraction', '150000', '204', '100', '503'),
('302', 'Horror', '2017', 'Animation', '250000', '206', '104', '505'),
('303', 'The Night Watch', '2002', 'Sweetness', '890000', '205', '103', '501'),
('304', 'Two Legends', '2010', 'Sculpture', '20000', '201', '101', '502'),
('305', 'Nature', '1990', 'Rainbow', '19000', '202', '102', '506'),
('306', 'Anime', '2005', 'Animals', '670000', '200', '106', '504');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `CUSTID` varchar(20) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL,
  KEY `CUSTID` (`CUSTID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`CUSTID`, `PHONE`) VALUES
('400', '0301346676'),
('401', '03213487376'),
('404', '03013467325'),
('406', '0301346849'),
('405', '03003835976'),
('402', '03006606676'),
('403', '03013387652');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `custid` varchar(20) NOT NULL,
  `gid` varchar(20) DEFAULT NULL,
  `artworkid` varchar(20) DEFAULT NULL,
  `fname` char(25) DEFAULT NULL,
  `lname` char(25) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` char(25) DEFAULT NULL,
  PRIMARY KEY (`custid`),
  KEY `gid` (`gid`),
  KEY `artworkid` (`artworkid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `gid`, `artworkid`, `fname`, `lname`, `dob`, `address`) VALUES
('400', '100', '300', 'Aalyan', 'Riasat', '2004-04-16', 'Faisalabad'),
('401', '101', '301', 'Ali', 'Butt', '1998-02-04', 'Lahore'),
('402', '102', '302', 'Kashif', 'Jutt', '1999-09-28', 'London'),
('403', '103', '303', 'Abdullah', 'Arshad', '2003-10-05', 'Faisalabad'),
('404', '104', '304', 'Ayesha', 'Asjad', '2005-06-18', 'Washington'),
('405', '105', '305', 'Maryam', 'Khan', '2002-05-10', 'Karachi'),
('406', '106', '306', 'Rehan', 'Aslam', '2001-05-11', 'Rawalpindi');

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
CREATE TABLE IF NOT EXISTS `exhibition` (
  `eid` varchar(20) NOT NULL,
  `gid` varchar(20) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exhibition`
--

INSERT INTO `exhibition` (`eid`, `gid`, `startdate`, `enddate`) VALUES
('200', '100', '2000-12-21', '2020-01-05'),
('201', '101', '2006-01-25', '2023-02-08'),
('202', '102', '2003-12-01', '2024-12-15'),
('203', '103', '2018-12-15', '2024-01-15'),
('204', '104', '2021-03-09', '2025-03-16'),
('205', '105', '2016-03-09', '2024-03-27'),
('206', '106', '2010-03-09', '2023-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `gid` varchar(26) NOT NULL DEFAULT 'not null',
  `gname` varchar(24) DEFAULT NULL,
  `location` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gid`, `gname`, `location`) VALUES
('100', 'Entique Gallery', 'Faisalabad'),
('101', 'Super Gallery', 'Lahore'),
('102', 'NATIONAL GALLERY', 'Washington'),
('103', 'BRITISH MUSEUM', 'London'),
('104', 'Ancient GALLERY', 'Los Angeles'),
('105', 'THE MUSEUM', 'Paris'),
('106', 'METROPOLITAN MUSEUM', 'New York');

--
-- Triggers `gallery`
--
DROP TRIGGER IF EXISTS `UPPERCASE`;
DELIMITER $$
CREATE TRIGGER `UPPERCASE` BEFORE INSERT ON `gallery` FOR EACH ROW BEGIN
              SET NEW.gname=UPPER(NEW.gname);
              END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
