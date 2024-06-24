DROP TABLE IF EXISTS `deal`;

CREATE TABLE `deal` (
  `deal_num` int NOT NULL AUTO_INCREMENT,
  `product_num` int NOT NULL,
  `seller_nick` varchar(45) NOT NULL,
  `buyer_nick` varchar(45) NOT NULL,
  `select_buyer` varchar(45) DEFAULT NULL,
  `requestDealDate` date DEFAULT NULL,
  `seller_check` tinyint NOT NULL DEFAULT '0',
  `buyer_check` tinyint NOT NULL DEFAULT '0',
  `IsCheckedDeal` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`deal_num`)
) engine = InnoDB comment="거래신청내역"


