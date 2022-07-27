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
-- Table structure for table `transactionStoredInAccount`
--

DROP TABLE IF EXISTS `transactionStoredInAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionStoredInAccount` (
  `transactionID_stored` char(40) NOT NULL,
  `fromAccountID` char(40) DEFAULT NULL,
  `toAccountID` char(40) DEFAULT NULL,
  PRIMARY KEY (`transactionID_stored`),
  KEY `toAccountID_idx` (`toAccountID`),
  KEY `fromAccountID_idx` (`fromAccountID`),
  CONSTRAINT `fromAccountID` FOREIGN KEY (`fromAccountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `toAccountID` FOREIGN KEY (`toAccountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transactionID_stored` FOREIGN KEY (`transactionID_stored`) REFERENCES `transaction` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionStoredInAccount`
--

LOCK TABLES `transactionStoredInAccount` WRITE;
/*!40000 ALTER TABLE `transactionStoredInAccount` DISABLE KEYS */;
INSERT INTO `transactionStoredInAccount` VALUES ('23992fkja','dglf4kfls4kl!@4l','ab35k6l!3l@4k3lf'),('2j30fsk4a','11114o%mfgfg@557','5969604869363n46'),('329fsdk42','5969604869363n46','akfl35063!mbgks#'),('3i4dks302','ab35k6l!3l@4k3lf','ab35k6l!3l@4k3lf'),('4932k3lg2','akfl35063!mbgks#','dglf4kfls4kl!@4l');
/*!40000 ALTER TABLE `transactionStoredInAccount` ENABLE KEYS */;
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
