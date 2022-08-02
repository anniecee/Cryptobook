-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `buyPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyPost` (
  `buypostID` INT NOT NULL,
  `transactionID_buy` INT NOT NULL,
  `buyPrice` decimal(10,0) DEFAULT NULL,
  `buyCrypto` char(10) DEFAULT NULL,
  PRIMARY KEY (`buypostID`),
  KEY `transactionID_buy_idx` (`transactionID_buy`),
  CONSTRAINT `buypostID` FOREIGN KEY (`buypostID`) REFERENCES `post` (`postID`) ON DELETE CASCADE,
  CONSTRAINT `transactionID_buy` FOREIGN KEY (`transactionID_buy`) REFERENCES `transaction` (`transactionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyPost`
--

LOCK TABLES `buyPost` WRITE;
/*!40000 ALTER TABLE `buyPost` DISABLE KEYS */;
INSERT INTO `buyPost` VALUES (4,3,32,'Solana'),(5,4,215,'BNB'),(6,5,23000,'Bitcoin'),(7,6,21000,'Bitcoin');
SET FOREIGN_KEY_CHECKS=1;
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
SET FOREIGN_KEY_CHECKS=1;
