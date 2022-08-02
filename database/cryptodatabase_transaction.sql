SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionID` INT NULL ,
  `crypto` char(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `postID_transaction` INT DEFAULT NULL,
  `accountID_transaction` INT DEFAULT NULL,
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
INSERT INTO `transaction` VALUES (1,'Ethereum',1002,'Sell','2018-05-12 07:09:00',2,1),(2,'Bitcoin',20496,'Sell','2020-01-01 01:20:59',3,2),(3,'Solana',32,'Buy','2019-01-02 00:00:00',4,3),(4,'BNB',215,'Buy','2020-11-12 20:29:49',5,4),(5,'Bitcoin',23000,'Buy','2019-05-11 21:59:59',6,5), (6,'Bitcoin',21000,'Buy','2021-05-11 21:59:59',7,5);
SET FOREIGN_KEY_CHECKS=1;
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
SET FOREIGN_KEY_CHECKS=1;
