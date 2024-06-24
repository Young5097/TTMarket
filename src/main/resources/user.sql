DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_num` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(10) NOT NULL,
  `phoneNum` varchar(20) NOT NULL,
  `userNickname` varchar(20) NOT NULL,
  `userAddress1` varchar(500) NOT NULL,
  `userAddress2` varchar(500) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`user_num`)
) engine=InnoDB comment="회원정보"

