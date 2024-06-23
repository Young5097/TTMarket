-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: market
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (28,'옷팔아요','의류',10000,'hmddd','부산 남구 용소로 3 (대연동)','2024-06-23 16:49:20',1,'거래날짜,시간을 반드시 포함하여 작성해주세요','bottom1.gif','부경대학교 정문'),(29,'aa','aa',111,'hmddd','부산 남구 용소로 3 (대연동)','2024-06-23 17:16:41',0,'거래날짜,시간을 반드시 포함하여 작성해주세요','bottom1.gif','aaa'),(30,'bb','bb',11111,'hmddd','부산 남구 무민사로 5 (감만동)','2024-06-23 17:17:02',1,'거래날짜,시간을 반드시 포함하여 작성해주세요','bottom1.gif','bb');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 17:28:23
