SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+07:00";



CREATE TABLE `product` (
  `keywords` varchar(30) NOT NULL,
  `productLine` varchar(10) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productQuantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `producer` varchar(30) NOT NULL,
  `productDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `product`
  ADD PRIMARY KEY (`productLine`);
COMMIT;
