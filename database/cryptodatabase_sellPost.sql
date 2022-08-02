SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `sellPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellPost` (
  `sell_postID` INT NOT NULL,
  `sell_transactionID` INT NOT NULL,
  `sellPrice` decimal(10,0) DEFAULT NULL,
  `sellCrypto` char(10) DEFAULT NULL,
  PRIMARY KEY (`sell_postID`),
  KEY `sell_transactionID_idx` (`sell_transactionID`),
  CONSTRAINT `sell_postID` FOREIGN KEY (`sell_postID`) REFERENCES `post` (`postID`) ON DELETE CASCADE,
  CONSTRAINT `sell_transactionID` FOREIGN KEY (`sell_transactionID`) REFERENCES `transaction` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellPost`
--

LOCK TABLES `sellPost` WRITE;
/*!40000 ALTER TABLE `sellPost` DISABLE KEYS */;
INSERT INTO `sellPost` VALUES (2,1,1002,'Ethereum'),(3,2,20496,'Bitcoin');
SET FOREIGN_KEY_CHECKS=1;
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
SET FOREIGN_KEY_CHECKS=1;
