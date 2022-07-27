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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionID` char(40) NOT NULL,
  `crypto` char(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `postID_transaction` char(40) DEFAULT NULL,
  `accountID_transaction` char(40) DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `transactionID_idx` (`transactionID`),
  KEY `postID_transaction_idx` (`postID_transaction`),
  KEY `accountID_transaction` (`accountID_transaction`),
  CONSTRAINT `accountID_transaction` FOREIGN KEY (`accountID_transaction`) REFERENCES `account` (`accountID`) ON DELETE CASCADE,
  CONSTRAINT `postID_transaction` FOREIGN KEY (`postID_transaction`) REFERENCES `post` (`postID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('23992fkja','BNB',215,'Buy','2020-01-01 01:20:59','5492929','dglf4kfls4kl!@4l'),('2j30fsk4a','Bitcoin',20496,'Sell','2019-05-11 21:59:59','3958603','11114o%mfgfg@557'),('329fsdk42','Solana',103,'Sell','2020-11-12 20:29:49',NULL,'5969604869363n46'),('3i4dks302','Tether',1,'Buy','2018-05-12 07:09:00','3940502','ab35k6l!3l@4k3lf'),('4932k3lg2','Ethereum',1065,'Sell','2019-01-02 00:00:00','3939502','akfl35063!mbgks#');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
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
