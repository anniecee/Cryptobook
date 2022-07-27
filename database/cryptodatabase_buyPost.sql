-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: cryptodatabase
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `buyPost`
--

DROP TABLE IF EXISTS `buyPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyPost` (
  `buypostID` char(40) NOT NULL,
  `transactionID_buy` char(40) NOT NULL,
  `buyPrice` decimal(10,0) DEFAULT NULL,
  `buyCrypto` char(10) DEFAULT NULL,
  PRIMARY KEY (`buypostID`,`transactionID_buy`),
  KEY `transactionID_buy_idx` (`transactionID_buy`),
  CONSTRAINT `buypostID` FOREIGN KEY (`buypostID`) REFERENCES `post` (`postID`),
  CONSTRAINT `transactionID_buy` FOREIGN KEY (`transactionID_buy`) REFERENCES `transaction` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyPost`
--

LOCK TABLES `buyPost` WRITE;
/*!40000 ALTER TABLE `buyPost` DISABLE KEYS */;
INSERT INTO `buyPost` VALUES ('3939502','4932k3lg2',1025,'Ethereum'),('3940502','3i4dks302',1024,'Ethereum'),('3958603','2j30fsk4a',218,'BNB'),('4959241','329fsdk42',32,'Solana'),('5492929','23992fkja',215,'BNB');
/*!40000 ALTER TABLE `buyPost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27 15:14:52
