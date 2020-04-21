-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 11:32 AM
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
-- Table structure for table `userdetail`
--

CREATE TABLE `userdetail` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `preferName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `gender` enum('nam','nữ','khác') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`ID`, `Name`, `preferName`, `DateOfBirth`, `gender`) VALUES
(31, 'Bạch Trọng Đạo', 'Đạo', '2000-04-04', 'nam'),
(40, 'Bùi Đăng Đức', 'Đức', '2000-07-30', 'nam'),
(8, 'Dương Hoài An', 'An', '1999-02-02', 'nam'),
(19, 'Hà Văn Hoài', 'Hoài', '2000-12-18', 'nam'),
(15, 'Hoàng VĂn Giáp', 'Giáp', '2000-01-01', 'nam'),
(47, 'Lê Anh Dũng', 'Dũng', '2000-10-29', 'nam'),
(6, 'Lê Mạnh Cường', 'Cường', '2000-11-30', 'nam'),
(21, 'Lê Năng Đức', 'Đức', '2000-09-17', 'nam'),
(42, 'Lê Văn Cường', 'Cường', '2000-12-01', 'nam'),
(49, 'Lê Đức Huy', 'Huy', '2000-05-22', 'nam'),
(54, 'Lương Thế Hùng', 'Hùng', '2000-03-21', 'nam'),
(2, 'Lương Thế Đại', 'Diaz', '2000-11-06', 'nam'),
(55, 'Ngô Thị Thu Hồng', 'Hồng', '2000-11-25', 'nữ'),
(34, 'Nguyễn Cao Cường', 'Cường', '2000-01-05', 'nam'),
(13, 'Nguyễn Duy Nam', 'Nam', '2000-02-09', 'nam'),
(12, 'Nguyễn Hoà Khôi', 'Khôi', '1997-06-16', 'nam'),
(11, 'Nguyễn Hoàng Anh', 'Anh', '2000-01-30', 'nữ'),
(38, 'Nguyễn Mạnh Dũng', 'Dũng', '2000-02-29', 'nam'),
(58, 'Nguyễn Minh Anh', 'Minh Anh', '2000-01-31', 'nữ'),
(27, 'Nguyễn Ngọc Bảo Trân', 'Trân', '2000-01-06', 'nữ'),
(3, 'Nguyễn Ngọc Chi', 'Chi', '2000-08-14', 'nữ'),
(51, 'Nguyễn Ngọc Dương', 'Dương', '2000-03-28', 'nữ'),
(16, 'Nguyễn Phương Thảo', 'Thảo', '2000-06-10', 'nữ'),
(28, 'Nguyễn Quang Vinh', 'Vinh', '2000-12-24', 'nam'),
(5, 'Nguyễn Quốc Dũng', 'Dũng', '2000-07-10', 'nam'),
(37, 'Nguyễn Tấn Việt Anh', 'Anh', '2000-01-01', 'nam'),
(50, 'Nguyễn Thành Công', 'Công', '1999-07-06', 'nam'),
(9, 'Nguyễn Thành Đạt', 'Đạt', '2000-06-02', 'nam'),
(57, 'Nguyễn Thị Trang', 'Trang', '2000-01-21', 'nữ'),
(22, 'Nguyễn Văn Huy', 'Huy', '2000-10-11', 'nam'),
(23, 'Nguyễn Văn Mạnh', 'Mạnh', '2000-07-11', 'nam'),
(44, 'Nguyễn Xuân Lộc', 'Lộc', '2000-02-11', 'nam'),
(10, 'Nguyễn Đăng Nam', 'Nam', '2000-07-25', 'nam'),
(41, 'Nguyễn Đồng Lực', 'Lực', '2000-01-16', 'nam'),
(39, 'Phạm Mạnh Dũng', 'Dũng', '2000-02-22', 'nam'),
(53, 'Phạm Ngọc Lan', 'Lan', '2000-09-14', 'nữ'),
(43, 'Phạm Ngọc Linh', 'Linh', '2000-02-24', 'nữ'),
(56, 'Phạm Quốc Việt', 'Việt', '2000-03-23', 'nam'),
(46, 'Phạm Thị Bích Ngọc', 'Ngọc', '2000-10-22', 'nữ'),
(25, 'Phan Bắc', 'Bắc', '2000-04-30', 'nam'),
(52, 'Phan Hứa Hân', 'Hân', '2000-08-17', 'nữ'),
(48, 'Phan Việt Đức', 'Đức', '2000-05-23', 'nam'),
(29, 'Tống Đức Cường', 'Cường', '1999-01-13', 'nam'),
(20, 'Trần Mạnh Đức', 'Đức', '2000-10-06', 'nam'),
(45, 'Trịnh Thị Nga', 'Nga', '2000-04-16', 'nữ'),
(14, 'Trịnh Tuấn Hùng', 'Hùng', '1999-10-05', 'nam'),
(26, 'Trương Gia Bảo Thao', 'Thao', '2000-01-04', 'nam'),
(35, 'Trương Hoàng Long', 'Long', '2000-05-30', 'nam'),
(60, 'Vũ Thị Mị', 'Mị', '2000-06-21', 'nữ'),
(59, 'Vũ Thị Quỳnh Trang', 'Trang', '2000-01-11', 'nữ'),
(32, 'Vũ Trọng Đạt', 'Đạt', '2000-05-15', 'nam'),
(1, 'Vương Triều', 'Diaz', '2000-11-06', 'nam'),
(36, 'Đàm Anh Tuấn', 'Long', '2000-02-24', 'nam'),
(24, 'Đặng Sơn Tùng', 'Tùng', '1999-06-03', 'nam'),
(18, 'Đào Minh Hải', 'Hải', '2000-01-29', 'nam'),
(4, 'Đào Minh Hoàn', 'Hoàn', '2000-08-17', 'khác'),
(30, 'Đào Đức Minh', 'Minh', '1999-12-05', 'nam'),
(7, 'Đỗ Ngọc Thanh Vân', 'Vân', '2000-07-29', 'nữ'),
(33, 'Đỗ Trung Đức', 'Đức', '2000-04-03', 'nam'),
(17, 'Đoàn Văn Huy', 'Huy', '2000-07-09', 'nam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `ID` (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD CONSTRAINT `userdetail_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
