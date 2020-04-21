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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text DEFAULT NULL,
  `ID_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNumber`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `ID_user`) VALUES
(1, '2019-12-18', '2019-12-25', '2019-12-24', 'Shipped', NULL, 8),
(2, '2019-12-18', '2019-12-20', '2019-12-21', 'Shipped', 'Giao muộn', 48),
(3, '2019-12-19', '2019-12-24', '2019-12-24', 'Shipped', NULL, 33),
(4, '2019-12-19', '2019-12-24', '2019-12-24', 'Shipped', NULL, 33),
(5, '2019-12-19', '2019-12-25', '2019-12-23', 'Shipped', NULL, 40),
(6, '2019-01-20', '2019-12-25', '2019-12-26', 'Shipped', 'Giao muộn', 37),
(7, '2019-12-20', '2019-12-26', '2019-12-26', 'Shipped', NULL, 1),
(8, '2019-12-20', '2019-12-26', '2019-12-26', 'Shipped', NULL, 1),
(9, '2019-12-21', '2019-12-26', '2019-12-26', 'Shipped', NULL, 6),
(10, '2019-12-21', '2019-12-26', '2019-12-25', 'Shipped', NULL, 20),
(11, '2019-12-21', '2019-12-30', '2019-12-27', 'Shipped', NULL, 25),
(12, '2019-12-22', '2019-12-28', '2019-12-24', 'Shipped', NULL, 34),
(13, '2019-12-22', '2019-12-26', '2019-12-26', 'Shipped', NULL, 37),
(14, '2019-12-22', '2019-12-27', '2019-12-26', 'Shipped', NULL, 23),
(15, '2019-12-23', '2019-12-30', '2019-12-28', 'Shipped', NULL, 15),
(16, '2019-12-23', '2019-12-29', '2019-12-28', 'Shipped', NULL, 30),
(17, '2019-12-23', '2020-01-01', '2019-12-29', 'Shipped', 'Giao không đúng màu', 17),
(18, '2019-12-24', '2019-12-29', '2019-12-30', 'Shipped', 'Giao muộn', 49),
(19, '2019-12-24', '2019-12-30', '2019-12-30', 'Shipped', NULL, 24),
(20, '2019-12-24', '2020-01-02', '2019-12-30', 'Shipped', NULL, 21),
(21, '2019-12-25', '2019-12-29', '2019-12-30', 'Shipped', 'Giao muộn', 60),
(22, '2019-12-25', '2019-12-29', '2019-12-30', 'Shipped', NULL, 19),
(23, '2019-12-25', '2019-12-29', '2019-12-28', 'Shipped', NULL, 12),
(24, '2019-12-25', '2019-12-30', '2019-12-30', 'Shipped', NULL, 26),
(25, '2019-12-25', '2019-12-31', '2019-12-30', 'Shipped', NULL, 54),
(26, '2019-12-25', '2019-12-29', '2019-12-30', 'Shipped', 'Giao muộn', 36),
(27, '2019-12-26', '2020-01-03', '2020-01-03', 'Shipped', NULL, 8),
(28, '2019-12-26', '2020-01-03', '2020-01-03', 'Shipped', NULL, 19),
(29, '2019-12-26', '2020-01-04', '2020-01-03', 'Shipped', NULL, 29),
(30, '2019-12-28', '2020-01-05', '2020-01-04', 'Shipped', NULL, 51),
(31, '2019-12-28', '2020-01-05', '2020-01-05', 'Shipped', NULL, 19),
(32, '2019-12-28', '2020-01-05', '2020-01-05', 'Shipped', NULL, 23),
(33, '2019-12-28', '2020-01-05', '2020-01-05', 'Shipped', NULL, 20),
(34, '2019-12-29', '2020-01-06', '2020-01-05', 'Shipped', NULL, 39),
(35, '2019-12-29', '2020-01-06', '2020-01-05', 'Shipped', NULL, 48),
(36, '2019-12-29', '2020-01-06', '2020-01-06', 'Shipped', 'Không đúng màu', 30),
(37, '2019-12-29', '2020-01-06', '2020-01-06', 'Shipped', NULL, 50),
(38, '2019-12-29', '2020-01-06', '2020-01-06', 'Shipped', NULL, 14),
(39, '2019-12-30', '2020-01-07', '2020-01-06', 'Shipped', NULL, 22),
(40, '2019-12-30', '2020-01-07', '2020-01-07', 'Shipped', NULL, 52),
(41, '2019-12-30', '2020-01-07', '2020-01-07', 'Shipped', NULL, 31),
(42, '2019-12-30', '2020-01-07', '2020-01-08', 'Shipped', 'Giao muộn', 29),
(43, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 57),
(44, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 13),
(45, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 55),
(46, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 42),
(47, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 32),
(48, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 30),
(49, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 18),
(50, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', NULL, 60),
(51, '2019-12-31', '2020-01-08', '2020-01-08', 'Shipped', 'Hiệu quả không như mong đợi', 44),
(52, '2020-01-02', '2020-01-10', '2020-01-09', 'Shipped', NULL, 52),
(53, '2020-01-02', '2020-01-10', '2020-01-09', 'Shipped', NULL, 25),
(54, '2020-01-06', '2020-01-14', '2020-01-13', 'Shipped', NULL, 46),
(55, '2020-01-07', '2020-01-15', '2020-01-14', 'Shipped', NULL, 3),
(56, '2020-01-09', '2020-01-17', '2020-01-16', 'Shipped', 'Sản phẩm không đúng', 15),
(57, '2020-01-09', '2020-01-17', '2020-01-17', 'Shipped', NULL, 45),
(58, '2020-01-10', '2020-01-18', '2020-01-18', 'Shipped', NULL, 55),
(59, '2020-01-11', '2020-01-19', '2020-01-18', 'Shipped', NULL, 59);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `orders_ibfk_1` (`ID_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
