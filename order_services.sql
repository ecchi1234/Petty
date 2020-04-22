-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 08:38 AM
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
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `orderNumber` int(11) NOT NULL,
  `serviceID` int(10) NOT NULL,
  `orderDate` datetime NOT NULL,
  `status` enum('Đã thực hiện','Chưa thực hiện','Hủy') DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_services`
--

INSERT INTO `order_services` (`orderNumber`, `serviceID`, `orderDate`, `status`, `comments`, `userID`) VALUES
(1, 6, '2020-02-11 09:19:58', 'Đã thực hiện', NULL, 9),
(2, 1, '2020-04-22 09:00:00', 'Hủy', NULL, 14),
(3, 2, '2020-02-22 08:00:00', 'Đã thực hiện', NULL, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `order_services_ibfk_1` (`serviceID`),
  ADD KEY `order_services_ibfk_2` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_services`
--
ALTER TABLE `order_services`
  MODIFY `orderNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_services`
--
ALTER TABLE `order_services`
  ADD CONSTRAINT `order_services_ibfk_1` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_services_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
