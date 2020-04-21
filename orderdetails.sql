-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 11:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petty`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` int(10) NOT NULL,
  `quantityOrdered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderNumber`, `productCode`, `quantityOrdered`) VALUES
(1, 10025, 1),
(2, 10206, 1),
(3, 10188, 1),
(4, 10010, 1),
(5, 10039, 1),
(6, 10042, 2),
(7, 10083, 1),
(8, 10094, 1),
(9, 10212, 1),
(10, 10301, 3),
(11, 10278, 1),
(12, 10250, 5),
(13, 10179, 1),
(14, 10070, 1),
(15, 10109, 1),
(16, 10141, 1),
(17, 10018, 1),
(18, 10041, 1),
(20, 10152, 1),
(21, 10088, 10),
(22, 10176, 1),
(23, 10235, 1),
(24, 10281, 1),
(25, 10129, 2),
(26, 10112, 1),
(27, 10167, 3),
(28, 10216, 1),
(29, 10238, 1),
(30, 10254, 1),
(31, 10269, 10),
(32, 10277, 8),
(33, 10298, 2),
(34, 10307, 1),
(35, 10233, 1),
(36, 10125, 1),
(37, 10167, 3),
(38, 10216, 1),
(39, 10238, 1),
(40, 10254, 1),
(41, 10269, 10),
(42, 10151, 1),
(43, 10277, 8),
(44, 10298, 2),
(45, 10307, 1),
(46, 10233, 1),
(47, 10209, 1),
(48, 10214, 1),
(49, 10280, 1),
(50, 10285, 1),
(51, 10213, 1),
(52, 10167, 3),
(53, 10216, 1),
(54, 10238, 1),
(55, 10254, 1),
(56, 10231, 1),
(57, 10269, 10),
(58, 10277, 8),
(59, 10233, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `orderdetails_ibfk_2` (`productCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
