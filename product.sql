SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+07:00";

CREATE DATABASE IF NOT EXISTS petty;
USE Petty;

CREATE TABLE `product` (
  `productCode` varchar(15) NOT NULL,
  `keywords` varchar(50) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `productQuantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `producer` varchar(30) NOT NULL,
  `productDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `product` (`productCode`, `keywords`, `productLine`, `productName`, `productQuantity`, `price`, `producer`, `productDescription`) VALUES
('DAC-01', 'đồ ăn,chăm sóc,chó', 'Đồ ăn cho chó', 'King\' pet ', 150, 250000, 'VinCorp', 'Đồ ăn phù hợp cho chó ở mọi lứa tuổi'),
('DAC-02', 'đồ ăn,sức khỏe,chó ', 'Đồ ăn cho chó', 'Smartheart Puppy ', 200, 200000, 'VinCorp', 'Sản phẩm dành cho chó từ 1 đến 2 năm tuổi'),
('DAC-03', 'đồ ăn,sức khỏe,chó ', 'Đồ ăn cho chó', 'Bánh quy chó hình xương ', 3000, 90000, 'VinCorp', 'Có hương vị và hình dáng giống xương thật giúp boss ngon miệng'),
('DAC-04', 'đồ ăn,sức khỏe,chó ', 'Đồ ăn cho chó', 'Gel dinh dưỡng ', 5000, 50000, 'VinCorp', 'Bổ sung dinh dưỡng nhanh cho chó'),
('DAC-05', 'đồ ăn,sức khỏe,chó', 'Đồ ăn cho chó', 'Taotaopet', 6000, 10000, 'VinCorp', 'Xúc xích ngon cho chó'),
('DAC-06', 'đồ ăn,sức khỏe,chó', 'Đồ ăn cho chó', 'Immupact ', 1000, 60000, 'VinCorp', 'Tăng cường khả năng miễn dịch cho chó'),
('DAC-07', 'đồ ăn,sức khỏe,chó', 'Đồ ăn cho chó', 'Kitedog', 2000, 20000, 'VinCorp', 'Socola đặc chế dành cho chó'),
('DAC-08', 'đồ ăn,sức khỏe,chó', 'Đồ ăn cho chó', 'Jerky ', 10000, 5000, 'VinCorp', 'Có giá trị dinh dưỡng cao và nhiều tính năng như: Kiểm sốt mùi hôi răng miệng. bổ sung vitamin và dưỡng chất cho thú cưng, tốt cho hệ miễn dịch và tiêu hóa'),
('DAM-01', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Nutricat ', 6546, 230000, 'PetsCare', 'Thực phẩm bổ sung dinh dưỡng giúp mèo con mạnh khỏe'),
('DAM-02', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Cateye ', 6747, 350000, 'PetsCare', 'Cateye - Thức ăn Hàn Quốc cho mèo'),
('DAM-03', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Ciao ', 6644, 380000, 'PetsCare', 'Thức ăn cho mèo đủ vị'),
('DAM-04', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Whiskas ', 7547, 550000, 'PetsCare', 'Thức ăn cho mèo gồm các vị Cá thu, Cá biển'),
('DAM-05', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Me-O ', 7578, 450000, 'PetsCare', 'Sản phẩm dành cho mèo trưởng thành đang bán chạy nhất trên thị trường\r\n'),
('DAM-06', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Mimino ', 6654, 340000, 'PetsCare', 'Thực phẩm bổ sung dinh dưỡng giúp mèo con mạnh khỏe\r\n'),
('DAM-07', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Catsrang ', 6544, 500000, 'PetsCare', 'Thức ăn cho mèo đủ vị\r\n'),
('DAM-08', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Royal canin', 7546, 400000, 'PetsCare', 'Sản phẩm dành cho mèo trưởng thành\r\n'),
('DAM-09', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Formula ', 2345, 230000, 'PetsCare', 'Thức ăn giúp tăng IQ cho mèo nhà bạn\r\n'),
('DAM-10', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Kitekat ', 2624, 420000, 'PetsCare', 'Socola đặc chế dành cho mèo'),
('DAM-11', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Nekko ', 6334, 300000, 'PetsCare', 'Pate dạng thạch dành cho mèo\r\n'),
('DAM-12', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Royal canin kitten ', 3462, 250000, 'PetsCare', 'Sản phẩm dành cho mèo con\r\n'),
('DAM-13', 'đồ ăn, chăm sóc, mèo', 'Đồ ăn cho mèo', 'Makka ', 4774, 200000, 'PetsCare', 'Hạt thức ăn cho mèo vị cá ngừ'),
('DAV-01', 'đồ ăn, chăm sóc, chim', 'Đồ ăn cho chim', 'Sausau ', 5464, 100000, 'Temptations', 'Côn trùng sấy khô dành cho chim mọi lứa tuổi'),
('DAV-02', 'đồ ăn, chăm sóc, chim', 'Đồ ăn cho chim', 'Tazzu ', 1122, 120000, 'Temptations', 'Đồ ăn khô dinh dưỡng cho vẹt\r\n'),
('DAV-03', 'đồ ăn, chăm sóc, chim', 'Đồ ăn cho chim', 'Kihd ', 3222, 90000, 'Temptations', 'Hạt khô cho chim từ 1 đến 2 tháng tuổi\r\n'),
('DAV-04', 'đồ ăn, chăm sóc, chim', 'Đồ ăn cho chim', 'Zupreem ', 1313, 110000, 'Temptations', 'Đồ ăn làm từ trái cây tự nhiên dành cho vẹt nhà bạn\r\n'),
('DAV-05', 'đồ ăn, chăm sóc, chim', 'Đồ ăn cho chim', 'Kaytee ', 1422, 150000, 'Temptations', 'Sản phâm dinh dưỡng dành cho chim non\r\n'),
('DCC-01', 'đồ chơi, chăm sóc, chó, giải trí', 'Đồ chơi cho chó', 'Bóng chuông đồ chơi ', 1000, 10000, 'Petty', 'Dùng để cho chó đuổi bắt'),
('DCC-02', 'đồ chơi, chăm sóc, chó, giải trí', 'Đồ chơi cho chó', 'Con gà la hét ', 2000, 20000, 'Petty', 'Sản phẩm hữu dụng dùng để chọc chó'),
('DCC-03', 'đồ chơi, chăm sóc, chó, giải trí', 'Đồ chơi cho chó', 'Đùi gà giả bằng bông - ', 3000, 30000, 'Petty', 'Đặt tại vị trí ngủ của chó cưng để boss có giấc mơ đẹp'),
('DCC-04', 'đồ chơi, chăm sóc, chó, giải trí', 'Đồ chơi cho chó', 'Cần câu đồ chơi - ', 400, 15000, 'Petty', 'Dùng để chơi đuổi bắt với chó'),
('DCM-01', 'đồ chơi, chăm sóc, mèo, giải trí', 'Đồ chơi cho mèo', 'Bàn cào móng cho mèo ', 6546, 160000, 'Whisket', 'Bảo vệ ghế sofa nhà bạn khỏi móng vuốt của bọn mèo'),
('DCM-02', 'đồ chơi, chăm sóc, mèo, giải trí', 'Đồ chơi cho mèo', 'Cỏ mèo ', 6654, 24000, 'Whisket', 'Giúp mèo cưng có những giây phút phê pha như khi bạn hút cần '),
('DCM-03', 'đồ chơi, chăm sóc, mèo, giải trí', 'Đồ chơi cho mèo', 'Đèn laser trêu mèo ', 5436, 14000, 'Whisket', 'Nếu biết tận dùng bạn sẽ không cần tắt đèn trước khi đi ngủ \r\n'),
('DCM-04', 'đồ chơi, chăm sóc, mèo, giải trí', 'Đồ chơi cho mèo', 'Bóng đồ chơi có chuột giả ', 43255, 20000, 'Whisket', 'Luyện tập khả năng săn bắt cho mèo 1 đến 2 tuổi'),
('DCM-05', 'đồ chơi, chăm sóc, mèo, giải trí', 'Đồ chơi cho mèo', 'Que gỗ Scorpio ', 5222, 25000, 'Whisket', 'Thu hút mèo gặm, giúp răng miệng sạch thơm \r\n'),
('DCV-01', 'đồ chơi, chăm sóc, chim, giải trí', 'Đồ chơi cho chim', 'Thang leo đồ chơi ', 1333, 20000, 'Panasonic', 'Dành cho pet giải trí, tập thể dục'),
('DCV-02', 'đồ chơi, chăm sóc, chim, giải trí', 'Đồ chơi cho chim', 'Đồ ngặm cắn/mổ - ', 4352, 20000, 'Panasonic', 'Vị trí để chim mổ vào'),
('DCV-03', 'đồ chơi, chăm sóc, chim, giải trí', 'Đồ chơi cho chim', 'Vòng gỗ nhiều màu ', 6535, 32000, 'Panasonic', 'Trang trí cho lồng chim'),
('DCV-04', 'đồ chơi, chăm sóc, chim, giải trí', 'Đồ chơi cho chim', 'Bộ 7 thanh đậu cho chim ', 2544, 65000, 'Panasonic', 'Tạo thêm nhiều vị trí đậu trong lồng cho vẹt'),
('DCV-05', 'đồ chơi, chăm sóc, chim, giải trí', 'Đồ chơi cho chim', 'Lồng treo thức ăn cho chim ', 2544, 12000, 'Panasonic', 'Dùng để đặt thức ăn, nước uống cho vẹt'),
('STM-01', 'làm đẹp,chăm sóc,sữa tắm,vệ sinh', 'Sữa tắm ', 'SOS', 50, 60000, 'iPetShop', 'Sữa tắm tạo mùi thơm lâu cho mèo'),
('STM-02', 'làm đẹp,chăm sóc,sữa tắm,vệ sinh', 'Sữa tắm ', 'KPET', 100, 100000, 'iPetShop', 'Với hương thơm tự nhiên cùng tinh chất mềm mượt lông, sản phẩm rất mát, dịu nhẹ phù hợp với mùa hè mà vẫn lôi cuốn, khiến bạn cứ phải dõi theo Boss suốt thôi.');


ALTER TABLE `product`
  ADD PRIMARY KEY (`productCode`);
COMMIT;

