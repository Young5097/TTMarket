DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_num` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(20) NOT NULL,
  `pCategory` varchar(20) NOT NULL,
  `pPrice` int NOT NULL,
  `userNickname` varchar(20) NOT NULL,
  `pLocation` varchar(50) NOT NULL,
  `pDate` datetime NOT NULL,
  `pIsTransaction` tinyint NOT NULL,
  `pExplain` varchar(500) NOT NULL,
  `pImage` varchar(50) DEFAULT NULL,
  `pLocation2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_num`)
) engine = InnoDB comment="중고제품목록"