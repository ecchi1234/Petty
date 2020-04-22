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
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serviceID` int(10) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `serviceDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceID`, `serviceName`, `serviceDescription`) VALUES
(1, 'Grooming và spa ', '-Thời gian: 8h-17h các ngày trong tuần\r\n-Thú cưng của bạn sẽ được hưởng những dịch vụ làm đẹp an toàn và tốt nhất hiện nay bao gồm:\r\n\r\n1. Dịch vụ tắm chải thú cưng\r\n2. Dịch vụ cắt tỉa lông\r\n3. Dịch vụ nhuộm lông, làm móng\r\n4. Dịch vụ vệ sinh tai, làm sạch tuyến hậu môn\r\n\r\n'),
(2, 'Khách sạn thú cưng', '-Thời gian:phục vụ 24/24\r\n\r\n-Thú cưng của bạn sẽ được chăm sóc với chế độ ăn uống hợp lí và vui chơi phù hợp với từng giai đoạn phát triển.'),
(3, 'Bệnh viện thú cưng', '-Thời gian:phục vụ 24/24\r\n\r\n-Thú cưng của bạn sẽ được chăm sóc tận tình với đội ngũ bác sĩ giàu kinh nghiệm'),
(4, 'Huấn luyện chó', '-Thời gian: theo khóa học từ 2 đến 4 tháng theo lịch rảnh của khách\r\n\r\nThú cưng của bạn sẽ được huấn luyện chuyên nghiệp và giúp bạn gần gũi với thú cưng của mình hơn'),
(5, 'Dắt chó đi dạo', '-Thời gian: 7h-17h các ngày trong tuần\r\n\r\nNếu thú cưng của bạn muốn được ra ngoài nhưng bạn lại không có thời gian, bạn hãy sử dụng dịch vụ này. Thú cưng của bạn sẽ được đội ngũ của chúng tôi chăm sóc'),
(6, 'Bảo hiểm thú cưng', '-Thời gian: Đăng kí tham gia bảo hiểm từ 8h-17h từ thứ 2 đến thứ 7\r\n\r\n-Thú cưng của bạn sẽ được tận hưởng nhiều dịch vụ ưu đại ở hệ thống của chúng tôi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
