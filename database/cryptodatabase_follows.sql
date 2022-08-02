SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `userID_follows` INT DEFAULT NULL,
  `followed_userID` INT NOT NULL,
  `following_userID` INT NOT NULL,
  PRIMARY KEY (`followed_userID`,`following_userID`),
  KEY `followed_userID_idx` (`followed_userID`),
  KEY `following_userID` (`following_userID`),
  CONSTRAINT `followed_userID` FOREIGN KEY (`followed_userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `following_userID` FOREIGN KEY (`following_userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*INSERT INTO `follows` VALUES ('a0b12c','fj4i4903','493glfd4'),('c2xze3k','fj4jgk24','395kjld3'),('g5khi6','gh592k22','44390rw3'),('af2jj3k','jg409e4w','5305jnf2'),('g3kgj5','sk4204g3','295mn343');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
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
