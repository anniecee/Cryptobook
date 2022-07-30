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
-- Table structure for table `sellPost`
--

DROP TABLE IF EXISTS `sellPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellPost` (
  `sell_postID` char(40) NOT NULL,
  `sell_transactionID` INT NOT NULL AUTO_INCREMENT,
  `sellPrice` decimal(10,0) DEFAULT NULL,
  `sellCrypto` char(10) DEFAULT NULL,
  PRIMARY KEY (`sell_postID`,`sell_transactionID`),
  KEY `sell_transactionID_idx` (`sell_transactionID`),
  CONSTRAINT `sell_postID` FOREIGN KEY (`sell_postID`) REFERENCES `post` (`postID`),
  CONSTRAINT `sell_transactionID` FOREIGN KEY (`sell_transactionID`) REFERENCES `transaction` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellPost`
--

LOCK TABLES `sellPost` WRITE;
/*!40000 ALTER TABLE `sellPost` DISABLE KEYS */;
INSERT INTO `sellPost` VALUES ('3939502','4932k3lg2',1065,'Ethereum'),('3940502','3i4dks302',1002,'Ethereum'),('3958603','2j30fsk4a',20496,'Bitcoin'),('4959241','329fsdk42',103,'Solana'),('5492929','23992fkja',250,'BNB');
/*!40000 ALTER TABLE `sellPost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27 15:14:51
