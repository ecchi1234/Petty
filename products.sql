-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2020 lúc 12:56 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petty`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `keywords` varchar(50) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `image` text NOT NULL,
  `productQuantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `producer` varchar(30) NOT NULL,
  `productDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`productCode`, `keywords`, `productLine`, `productName`, `image`, `productQuantity`, `price`, `producer`, `productDescription`) VALUES
('DAC-01', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Smartheart puppy', 'https://drive.google.com/open?id=1MpROsX8sVTXK6ozLJbSqCbHqcS_sYDWf', 198, 164, 'PetInc', 'Sản phẩm dành cho chó từ 1 đến 2 năm tuổi'),
('DAC-02', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'King\' pet', 'https://drive.google.com/open?id=19c6ETLQT4El9McAgpH9akQbw9QJ3lgD2', 289, 50, 'PetInc', 'Đồ ăn phù hợp cho chó ở mọi lứa tuổi'),
('DAC-03', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Bánh quy chó hình xương ', 'https://drive.google.com/open?id=1VLC6i4N9Vv_-5LQlvp6PveyyHHuueT3w', 140, 119, 'PetInc', 'Có hương vị và hình dáng giống xương thật giúp chó ngon miệng'),
('DAC-04', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Gel dinh dưỡng ', 'https://drive.google.com/open?id=1VLoyOA6EE9h6fYAbRoL7VwUO5veQxe-o', 197, 36, 'PetInc', 'Bổ sung dinh dưỡng nhanh cho chó'),
('DAC-05', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Taotaopet', 'https://drive.google.com/open?id=17hpLTIDukCDzGVNWHP6cBzkTzbvcYf7g', 258, 179, 'PetInc', 'Xúc xích ngon cho chó'),
('DAC-06', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Immupact', 'https://drive.google.com/open?id=1pEWdsircM9kH4vdbigPt6PxKVALBfDpY', 363, 83, 'PetInc', 'Tăng cường khả năng miễn dịch cho chó'),
('DAC-07', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Kitedog ', 'https://drive.google.com/open?id=1vvo0G9-J6mnwANqDDj_c0s72zwTlbrDY', 412, 88, 'PetInc', 'Socola đặc chế dành cho chó'),
('DAC-08', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Jerky ', 'https://drive.google.com/open?id=1WmbuxN6DBSs9xUPr0eyJG4i9F4tl0EbU', 372, 94, 'PetInc', 'Có giá trị dinh dưỡng cao và nhiều tính năng như: Kiểm sốt mùi hôi răng miệng. bổ sung vitamin và dưỡng chất cho thú cưng, tốt cho hệ miễn dịch và tiêu hóa'),
('DAC-09', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Đồ thưởng cho chó', 'https://drive.google.com/open?id=1XnRwK095xyg2mZkrApvopWAye8mnvDoY', 404, 119, 'PetInc', ''),
('DAC-10', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Ganador vị sữa Ganador sữa ', 'https://drive.google.com/open?id=1dCbYmHZ-PqnHvWgpFkMlGdpy8DttE2Yw', 424, 30, 'PetInc', 'Với DHA phù hợp cho nhu cầu tăng trưởng của Chó con nhiều giống loài và kích cỡ trong giai đoạn những năm đầu đời.'),
('DAC-11', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Ganador vị cá hồi', 'https://drive.google.com/open?id=1ib73_3A_n0aoB69aqqdyO7XWRx5wBHxi', 332, 165, 'PetInc', 'Thức ăn cho chó trưởng thành vị cá hồi và gạo Ganador Adult Salmon and Rice được làm từ cá hồi thật, giàu vitamin B tự nhiên, tham gia sản xuất năng lượng. Bổ sung Omega 3 và 6 cho làn da và bộ lông khỏe mạnh. Thành phần gạo/cơm và yucca cho tiêu hóa tốt và giảm mùi. Canxi, phốt pho và đạm cân đối giúp xương và cơ khỏe mạnh'),
('DAC-12', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Dental Gum ', 'https://drive.google.com/open?id=13d2Y3rvlaeTEfrEBbEMv1lmJFVwnSp0Q', 453, 112, 'PetInc', 'Đồ Ăn Vặt Xương Gặm Sạch Răng Thơm Miệng Nha Khoa Vị Sữa Milk & Dental Gum Denteal EffEcts 160g'),
('DAC-13', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Hạt Hàn Quốc', 'https://drive.google.com/open?id=1ajLI-fgivCjTcZjFxGa7FDZOnXrfz1z9', 430, 87, 'PetInc', 'Đồ cao cấp xuất xứ từ Hàn Quốc'),
('DAC-14', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Pure and Nature', 'https://drive.google.com/open?id=1qYsKnvyOXFhk7H8Q6DtogTEsaJC0O7kR', 388, 56, 'PetInc', 'Nguyên liệu hoàn toàn tự nhiên tốt cho sức khỏe'),
('DAC-15', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Fineset', 'https://drive.google.com/open?id=1QPpUOu5pWQVT50bu5vaWL8RRvuGoomuq', 249, 143, 'PetInc', 'Thực phẩm giảm cân dành cho chó'),
('DAC-16', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Royal Canin Puppy', 'https://drive.google.com/open?id=1K2euruUmmzYGmmCx_8YYyrj6mZa50V3f', 308, 31, 'PetInc', 'Hạt khô cao cấp đang bán chạy nhất hiện nay'),
('DAC-17', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Pro Plan', 'https://drive.google.com/open?id=1wDV0DzgRBZGSD7KyD0QtUNl22m7N0mXj', 454, 110, 'PetInc', 'Với DHA phù hợp cho nhu cầu tăng trưởng của Chó con nhiều giống loài và kích cỡ trong giai đoạn những năm đầu đời.'),
('DAC-18', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Buzz', 'https://drive.google.com/open?id=1T9_ggdZ9z79rjD2deItc09QgbFVAAlnU', 337, 55, 'PetInc', 'Thức tỉnh mọi giác quan'),
('DAC-19', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Hạt Hàn Quốc vị dâu', 'https://drive.google.com/open?id=1-48tISKpGVdDcOHS8r3dwd2TWv2jtr5t', 170, 71, 'PetInc', 'Đồ cao cấp xuất xứ từ Hàn Quốc'),
('DAC-20', 'Đồ ăn, chăm sóc, sức khỏe, chó', 'Đồ ăn cho chó', 'Máy cho ăn tự động', 'https://drive.google.com/open?id=1RgUMsUKhYfK0vVUKe0N5UPkCgIwFAnUy', 118, 147, 'PetInc', 'Boss sẽ được ăn uống đúng giờ ngay cả khi bạn không có ở nhà'),
('DAM-01', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Cateye - Thức ăn Hàn Quốc cho ', 'https://drive.google.com/open?id=1WrLosEpjvHdVsmkWIbr2oLSH8HwhvA7_', 239, 35, 'Dog&Cat Corp', 'Thức ăn Hàn Quốc cho mèo'),
('DAM-02', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Whiskas', 'https://drive.google.com/open?id=1PhSWkvLCyGt9L9xT66lZVc8PYPW4hjWa', 380, 151, 'Dog&Cat Corp', 'Thức ăn cho mèo gồm các vị Cá thu, Cá biển'),
('DAM-03', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Me-O ', 'https://drive.google.com/open?id=1sW59-yI0CIXIaETgp-LSLVMuQzLqET4i', 115, 188, 'Dog&Cat Corp', 'Sản phẩm dành cho mèo trưởng thành đang bán chạy nhất trên thị trường'),
('DAM-04', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Máy cho ăn tự động', 'https://drive.google.com/open?id=1bIi6DEU7bS1tGNAHjM0KKEZlcbHhrAYW', 350, 47, 'Dog&Cat Corp', 'Boss sẽ được ăn uống đúng giờ ngay cả khi bạn không có ở nhà'),
('DAM-05', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Catsrang ', 'https://drive.google.com/open?id=1OROyvDYzzyXgFkE5-Ojx4SzD0-PSVDw5', 470, 31, 'Dog&Cat Corp', 'Thức ăn cho mèo đủ vị'),
('DAM-06', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Pro Cat', 'https://drive.google.com/open?id=1YnGCfVp5Ny8lQam9qq100C0npYkQ9OCZ', 387, 133, 'Dog&Cat Corp', 'Sản phẩm dành cho mèo trưởng thành đang bán chạy nhất trên thị trường'),
('DAM-07', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Joy', 'https://drive.google.com/open?id=1vtDryKp1M3GEH6dYrmPSq_xgTLauqGQj', 351, 130, 'Dog&Cat Corp', 'Hạt thức ăn cho mèo vị cá ngừ'),
('DAM-08', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Formula ', 'https://drive.google.com/open?id=1Cnj6oYML0i6bd-QfHk4G4UsAIOf2nYK_', 343, 110, 'Dog&Cat Corp', 'Thức ăn giúp tăng IQ cho mèo nhà bạn'),
('DAM-09', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Nekko ', 'https://drive.google.com/open?id=1TJbFJIFPf0qtbJRoQsiiuA6eHabaj5Ei', 281, 28, 'Dog&Cat Corp', 'Pate dạng thạch dành cho mèo'),
('DAM-10', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'Royal canin kitten ', 'https://drive.google.com/open?id=1YZ1_b02jat-zwWw-BY5egSA5JswzZRH-', 390, 183, 'Dog&Cat Corp', 'Sản phẩm dành cho mèo con'),
('DAM-11', 'Đồ ăn, chăm sóc, sức khỏe, mèo', 'Đồ ăn cho mèo', 'KiteKat', 'https://drive.google.com/open?id=1vvo0G9-J6mnwANqDDj_c0s72zwTlbrDY', 151, 47, 'Dog&Cat Corp', 'Socola đặc chế dành cho mèo'),
('DAV-01', 'Đồ ăn, chăm sóc, sức khỏe, chim, vẹt', 'Đồ ăn cho vẹt', 'Sữa tiệt trùng', 'https://drive.google.com/open?id=17J4btAozrzEj_nb06RQdoZBDJEPGhWMH', 364, 199, 'Tom Company', 'Sữa dinh dưỡng đặc chế cho vẹt'),
('DAV-02', 'Đồ ăn, chăm sóc, sức khỏe, chim, vẹt', 'Đồ ăn cho vẹt', 'Tazzu ', 'https://drive.google.com/open?id=1tUt2xPgL0_dL8F8v24Mwu2Iz2r41s0py', 248, 39, 'Tom Company', 'Đồ ăn khô dinh dưỡng cho vẹt'),
('DAV-03', 'Đồ ăn, chăm sóc, sức khỏe, chim, vẹt', 'Đồ ăn cho vẹt', 'Kihd ', 'https://drive.google.com/open?id=1K7c2Ko-qdJ8xlYcAVgj8wQnjX8z8K3LO', 297, 119, 'Tom Company', 'Hạt khô cho chim từ 1 đến 2 tháng tuổi'),
('DAV-04', 'Đồ ăn, chăm sóc, sức khỏe, chim, vẹt', 'Đồ ăn cho vẹt', 'Zupreem ', 'https://drive.google.com/open?id=10PAkD7haYF3KtsvR88S71J_VSiKPvOq7', 111, 180, 'Tom Company', 'Đồ ăn làm từ trái cây tự nhiên dành cho vẹt nhà bạn'),
('DAV-05', 'Đồ ăn, chăm sóc, sức khỏe, chim, vẹt', 'Đồ ăn cho vẹt', 'Kaytee ', 'https://drive.google.com/open?id=1ApWphHgA2B2_T1fph7z1sTvjZSQFmeSj', 185, 155, 'Tom Company', 'Sản phâm dinh dưỡng dành cho chim non'),
('DCC-01', 'Đồ chơi, chăm sóc, sức khỏe, chó, giải trí, đồ dùn', 'Đồ dùng cho chó', 'Áo Boss', 'https://drive.google.com/open?id=1Qca75gBx7WekeLJOH9a6dWblTQWuXhHH', 481, 83, 'Dog&Cat Corp', 'Tăng thêm vẻ đẹp cho Boss'),
('DCC-02', 'Đồ chơi, chăm sóc, sức khỏe, chó, giải trí, đồ dùn', 'Đồ dùng cho chó', 'Vòng chống liếm', 'https://drive.google.com/open?id=1qG6VljRWiDmWS5TFwQTSQuYEsUUT7Q7J', 255, 30, 'Dog&Cat Corp', 'Đeo quanh cổ để boss không tự liếm vào các vết thương'),
('DCC-03', 'Đồ chơi, chăm sóc, sức khỏe, chó, giải trí, đồ dùn', 'Đồ dùng cho chó', 'Con gà la hét', 'https://drive.google.com/open?id=1wVDHd1grskKe_3KeAMwXMV-28QPGrR7l', 134, 128, 'Dog&Cat Corp', 'Sản phẩm hữu dụng dùng để chọc chó'),
('DCC-04', 'Đồ chơi, chăm sóc, sức khỏe, chó, giải trí, đồ dùn', 'Đồ dùng cho chó', 'Đệm nằm', 'https://drive.google.com/open?id=168BUt8XUOdxJ4h58RuCuXZ_u07ZrHU_y', 297, 159, 'Dog&Cat Corp', 'Đặt tại vị trí ngủ của chó cưng để chó có giấc mơ đẹp'),
('DCC-05', 'Đồ chơi, chăm sóc, sức khỏe, chó, giải trí, đồ dùn', 'Đồ dùng cho chó', 'Bóng chuột giả', 'https://drive.google.com/open?id=1f-JU7dBPHVS_OefzlAiwIOCdUAQWHLFz', 239, 31, 'Dog&Cat Corp', 'Dùng để chơi đuổi bắt với chó'),
('DCM-01', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Balo phi hành gia', 'https://drive.google.com/open?id=17G-_hUxN8RqLzG_LqWM62ze6ebYP4WPw', 383, 21, 'PrettyPet Shop', 'Đeo boss trên vai trên mọi ngả đường'),
('DCM-02', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Áo Boss', 'https://drive.google.com/open?id=1x6S5IqHt-hmRqkyH1bpTen79CvWLqkh3', 209, 36, 'PrettyPet Shop', 'Tăng thêm vẻ đẹp cho Boss'),
('DCM-03', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Vòng chống liếm', 'https://drive.google.com/open?id=1ILPiKmjcObmmhqTStbwoINP2QIO-ig59', 242, 26, 'PrettyPet Shop', 'Đeo quanh cổ để boss không tự liếm vào các vết thương'),
('DCM-04', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Con gà la hét', 'https://drive.google.com/open?id=1TPSkxjJESiVF-Htz6Tua7E8CrmiKi_a0', 456, 163, 'PrettyPet Shop', 'Sản phẩm hữu dụng dùng để chọc mèo'),
('DCM-05', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Túi vận chuyển pet đường dài', 'https://drive.google.com/open?id=1Sv39NPtTG_AV8rfi4PbA7Nhua8VSmPJC', 424, 113, 'PrettyPet Shop', 'Mang boss theo trong cuộc du lịch, về quê'),
('DCM-06', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Đệm nằm', 'https://drive.google.com/open?id=1KiOuwmr-KZ2A58B0bXBH2nN8Jam2Ldet', 180, 85, 'PrettyPet Shop', 'Đặt tại vị trí ngủ của mèo cưng để mèo có giấc mơ đẹp'),
('DCM-07', 'Đồ chơi, chăm sóc, sức khỏe, mèo, giải trí, đồ dùn', 'Đồ dùng cho mèo', 'Bóng chuột giả', 'https://drive.google.com/open?id=1zyg8NsVXrp0bpQ_h-N25x8mJnH2-Z6xD', 229, 67, 'PrettyPet Shop', 'Dùng để chơi đuổi bắt với mèo'),
('DCV-01', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây đậu trên không', 'https://drive.google.com/open?id=1F-LmVPAzXrGnLAYQj3IZWVYCI8scaAt1', 318, 199, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-02', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Vòng gỗ nhiều màu ', 'https://drive.google.com/open?id=1OrtNHQWF16D74ibC1mg5pgcuaOSTDnyc', 394, 145, 'Vin Group', 'Trang trí cho lồng chim'),
('DCV-03', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Cú đồ chơi', 'https://drive.google.com/open?id=1LEzCxuMyDMcGVsJBxxb_3aMg0mJ-_O6E', 396, 69, 'Vin Group', 'Thêm bạn cho vẹt cưng'),
('DCV-04', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Lồng thủy tinh', 'https://drive.google.com/open?id=1EbUnQ8mp5ueuChba8BeUMm6yi_Noiir2', 166, 80, 'Vin Group', 'Đổi mới căn nhà cho vẹt'),
('DCV-05', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây gỗ hạt tròn nhiều màu', 'https://drive.google.com/open?id=1O4O2ShW4drwtKoiEFxyjCUXSt_hNExnF', 282, 138, 'Vin Group', 'Trang trí cho lồng vẹt'),
('DCV-06', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Phụ kiện sặc sỡ cho lồng vẹt', 'https://drive.google.com/open?id=12zHHfd9wlMTkWk7u5tOTO5wozM5P--6p', 224, 120, 'Vin Group', 'Trang trí cho lồng vẹt'),
('DCV-07', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Bộ 7 thanh đậu cho chim ', 'https://drive.google.com/open?id=17O1bET7OHle_jYoyhXZHgeZG2bOMZ6Nu', 313, 116, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-08', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây chuông nhỏ', 'https://drive.google.com/open?id=1yJr_0vLSBhPTJ9JDadkImZFHVWc77SUG', 424, 61, 'Vin Group', 'Trang trí cho lồng vẹt'),
('DCV-09', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây bóng tròn', 'https://drive.google.com/open?id=1wblGbFKtPZl-02U56MWH3HID9iW4lGwq', 476, 117, 'Vin Group', 'Trang trí cho lồng vẹt'),
('DCV-10', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây có đính ngôi sao', 'https://drive.google.com/open?id=1atfe9bdM_dPks2YcBnYWlyAsReIkoc_q', 240, 82, 'Vin Group', 'Trang trí cho lồng vẹt'),
('DCV-11', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Thanh đứng dọc', 'https://drive.google.com/open?id=1Xw6Kq7aa2QiCi3gd6P_LYEuau7g1Q07E', 300, 177, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-12', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Bàn đứng lớn', 'https://drive.google.com/open?id=1s5KX0jdwq_sUeM6qOOOCLPhBo4XQsF5f', 488, 194, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-13', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Hộp đựng thức ăn', 'https://drive.google.com/open?id=1_Sc77bWz5zoMhU-1SwwqD1DvS-Fly3vX', 257, 82, 'Vin Group', 'Treo thức ăn trên không'),
('DCV-14', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Lồng đựng thức ăn ngoài trời', 'https://drive.google.com/open?id=1R7O56D4q0ZthPxUGh0-26iAOyEjFTKaC', 231, 90, 'Vin Group', 'Đựng thức ăn cho vẹt'),
('DCV-15', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Máy cho ăn tự động', 'https://drive.google.com/open?id=17lQp7EenS3QHiiVMydB1IveMROKomYM5', 477, 118, 'Vin Group', 'Vẹt sẽ được ăn uống đúng giờ ngay cả khi bạn không có ở nhà'),
('DCV-16', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Tổ chim giả', 'https://drive.google.com/open?id=1bZdaiZpDEb4qwCyaoMj-pyTINLZpJYey', 178, 119, 'Vin Group', 'Trang trí nhà cửa'),
('DCV-17', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Đồ chơi hình chim kiểng', 'https://drive.google.com/open?id=1FW1aoSwDi_uLC6Z3lpCOHr3xsvFPK23m', 316, 49, 'Vin Group', 'Trang trí nhà cửa'),
('DCV-18', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Xô đựng thức ăn mini', 'https://drive.google.com/open?id=1vgfSFOH0M8Ni-9LbMfFmVSDktOdAmRMo', 382, 190, 'Vin Group', 'Đựng thức ăn cho vẹt'),
('DCV-19', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây đậu ngang treo chuông', 'https://drive.google.com/open?id=1GFGbWl44vim-lp19fwaZStAiWV0MyaVh', 289, 192, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-20', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Thang leo đồ chơi ', 'https://drive.google.com/open?id=1geYGpHdToFnRYionnhHeJDTzIwWaOlxn', 420, 96, 'Vin Group', 'Dành cho vẹt giải trí, tập thể dục'),
('DCV-21', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Cột chứa thức ăn', 'https://drive.google.com/open?id=19lwHqq6kqLwBEn-Ja3syIDwubZmQ0oim', 185, 28, 'Vin Group', 'Đựng thức ăn cho vẹt'),
('DCV-22', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Vòng đậu đủ màu', 'https://drive.google.com/open?id=1J0lUUmaImCHcoMUYwa8ilwxEnkP6gMa4', 228, 75, 'Vin Group', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-23', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Thanh đậu ngang vintage', 'https://drive.google.com/open?id=1-tLXEtJNJH8vI5eOoH75jMnW0Jipt1n9', 235, 16, 'Vin Group', 'Chỗ đậu sang chảnh bằng gỗ cho vẹt'),
('DCV-24', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Lồng chứa hạt ', 'https://drive.google.com/open?id=1VoDXwVCeWe3Q9kxwMjsfeXsxtd4B8fEv', 309, 48, 'Vin Group', 'Đựng thức ăn cho vẹt'),
('DCV-25', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Bóng chuột giả', 'https://drive.google.com/open?id=1kcHcBos9VmVY-s1TgkLpfey3-JZwej_e', 316, 175, 'Vin Group', 'Đồ giải trí cho vẹt'),
('DCV-26', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Đồ ngặm cắn/mổ ', 'https://drive.google.com/open?id=1u4MGrw6gU5J42Upj7GX3ia34D1M-9tgs', 247, 91, 'Vin Group', 'Vị trí để chim mổ vào'),
('DCV-27', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Thang đi bộ ', 'https://drive.google.com/open?id=1rnxpb1xP9S0lWJZthW5NTp7H9M137bOS', 240, 71, 'Vin Group', 'Giúp vẹt di chuyển linh động trong lồng'),
('DCV-28', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Bình đựng nước trắng', 'https://drive.google.com/open?id=1lFUPzAHxDBIJdqOD0qtRTtd4u-louKXd', 464, 169, 'Vin Group', 'Đựng nước cho vẹt'),
('DCV-29', 'Đồ chơi, chăm sóc, sức khỏe, vẹt , giải trí, đồ dù', 'Đồ dùng cho vẹt', 'Dây mổ đan', 'https://drive.google.com/open?id=1Dj-D5ApmEdPG54MbYVdmvwlSsc7SOLki', 133, 149, 'Vin Group', 'Vị trí để chim mổ vào');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
