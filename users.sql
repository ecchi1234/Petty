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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `email`, `phonenumber`) VALUES
(1, 'ltdai010', '$2y$10$AJC/Hil5kbe/kINFMJkBKuC5n7/RASJtjxUOdWfBZjMu8LLMsNeQy', 'luongdai246@gmail.com', '0123456789'),
(2, '18020263', '$2y$10$uYab7HS/Eug.f3XO76QpcOsUcJ0nFcsOD6ehRcT2FzhD9JGecVHUm', 'luongdai246@gmail.com', '0123456789'),
(3, 'ecchi123', '123456', 'nguyenngocc0800@gmail.com', '0393008335'),
(4, '18020535', '123456', '18020535@vnu.edu.vn', '0902019365'),
(5, '18020361', '10072000', '18020361@vnu.edu.vn', '0347088691'),
(6, '18020257', '30112000', '18020257@vnu.edu.vn', '0378383553'),
(7, '18021414', '29072000', '18021414@vnu.edu.vn', '0915919357'),
(8, '17020560', '02021999', '17020560@vnu.edu.vn', '0356164948'),
(9, '18020291', '02062000', '18020291@vnu.edu.vn', '0966998657'),
(10, '18020931', '25072000', '18020931@vnu.edu.vn', '0868236239'),
(11, '18020113', '30012000', '18020113@vnu.edu.vn', '0365065527'),
(12, '18020720', '16061997', '18020720@vnu.edu.vn', '0384064435'),
(13, '18020930', '09022000', '18020930@vnu.edu.vn', '0337470773'),
(14, '18020070', '05101999', '18020070@vnu.edu.vn', '0915518128'),
(15, '18020432', '01012000', '18020432@vnu.edu.vn', '0383377901'),
(16, 'phuongthaon', 'tabitabi305', 'tabitabi305@gmail.com', '0355847056'),
(17, '18020645', '09072000', '18020645@vnu.edu.vn', '0368310864'),
(18, '18020445', '29012000', '18020445@vnu.edu.vn', '0944703687'),
(19, '18020529', '18122000', '18020529@vnu.edu.vn', '0364120570'),
(20, '18020341', '06102000', '18020341@vnu.edu.vn', '0964875742'),
(21, '18020348', '17092000', '18020348@vnu.edu.vn', '0337816938'),
(22, '18020651', '11102000', '18020651@vnu.edu.vn', '0355163203'),
(23, '18020881', '11072000', '18020881@vnu.edu.vn', '0398566421'),
(24, '17021111', '03061999', '17021111@vnu.edu.vn', '0356359859'),
(25, '18020187', '30042000', '18020187@vnu.edu.vn', '0945156995'),
(26, '18021195', '04012000', '18021195@vnu.edu.vn', '0945156995'),
(27, '18021294', '06012000', '18021294@vnu.edu.vn', '0338335941'),
(28, '18020065', '24122000', '18020065@vnu.edu.vn', '0911482412'),
(29, '17020629', '13011999', '17020629@vnu.edu.vn', '0915809899'),
(30, '18020908', '05122000', '18020908@vnu.edu.vn', '0357453372'),
(31, '18020274', '04042000', '18020274@vnu.edu.vn', '0376542730'),
(32, '18020293', '15052000', '18020293@vnu.edu.vn', '0904115913'),
(33, '18020345', '03042000', '18020345@vnu.edu.vn', '0356983371'),
(34, '18020261', '05012000', '18020261@vnu.edu.vn', '0365414845'),
(35, '18020853', '30052000', '18020853@vnu.edu.vn', '0397621879'),
(36, '18021374', '24022000', '18021374@vnu.edu.vn', '0582173989'),
(37, '18020120', '03012000', '18020120@vnu.edu.vn', '0915658659'),
(38, '18020364', '22092000', '18020364@vnu.edu.vn', '0366056649'),
(39, '18020369', '22022000', '18020369@vnu.edu.vn', '0869257715'),
(40, '18020331', '30072000', '18020331@vnu.edu.vn', '0354830236'),
(41, '18020864', '16012000', '18020864@vnu.edu.vn', '0337271359'),
(42, '18020006', '01122000', '18020006@vnu.edu.vn', '0911130699'),
(43, '18020768', '24022000', '18020768@vnu.edu.vn', '0329519729'),
(44, '18020784', '11022000', '18020784@vnu.edu.vn', '0376061378'),
(45, '18020943', '16042000', '18020943@vnu.edu.vn', '0975109203'),
(46, '18020956', '22102000', '18020956@vnu.edu.vn', '0702052392'),
(47, '18020359', '29102000', '18020359@vnu.edu.vn', '0354429302'),
(48, '18020340', '23052000', '18020340@vnu.edu.vn', '0378964241'),
(49, '18020641', '22052000', '18020641@vnu.edu.vn', '0325936415'),
(50, '17020619', '06071999', '17020619@vnu.edu.vn', '0341253678'),
(51, 'hoahuongduong', '3759562', 'hoahuongduong@gmail.com', '03527878683'),
(52, 'hanhan', '157894512345654', 'hanhanbqt@gmail.com', '0902145683'),
(53, 'lanktht', '54542133545456', 'builan145@gmail.com', '0347344525'),
(54, 'hunglt3787', 'hung250634', 'hunglt@gmail.com', '0905748552'),
(55, 'hongch224', 'hong2242000', 'hongch224@gmail.com', '07689495331'),
(56, 'vietpq5296', '212154645464', 'vietpq5296@gmail.com', '0374525637'),
(57, 'trangren', '34076897521', 'trangrenng@gmail.com', '0903126545'),
(58, 'minhanh', '31012000', 'minhanh3101@gmail.com', '0907814223'),
(59, 'trangquynh', '11012000', 'trangquynh1101@gmail.com', '0325848432'),
(60, 'minuong', '21062000', 'mi2106@gmail.com', '0382576535');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
