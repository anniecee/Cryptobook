SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `addBanking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addBanking` (
  `cardID_addBanking` INT NOT NULL,
  `userID_addBanking` INT NOT NULL,
  PRIMARY KEY (`cardID_addBanking`,`userID_addBanking`),
  KEY `userID_addBanking_idx` (`userID_addBanking`),
  CONSTRAINT `cardID_addBanking` FOREIGN KEY (`cardID_addBanking`) REFERENCES `bankingInfo` (`cardID_bankinginfo`),
  CONSTRAINT `userID_addBanking` FOREIGN KEY (`userID_addBanking`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addBanking`
--

LOCK TABLES `addBanking` WRITE;
/*!40000 ALTER TABLE `addBanking` DISABLE KEYS */;
INSERT INTO `addBanking` VALUES (12,123),(22,1),(32,2),(42,3),(52,4);
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `addBanking` ENABLE KEYS */;
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