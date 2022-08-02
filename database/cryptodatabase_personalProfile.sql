SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `personalProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalProfile` (
  `userName` char(40) NOT NULL,
  `profileID` INT DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `profileID_idx` (`profileID`),
  CONSTRAINT `profileID` FOREIGN KEY (`profileID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalProfile`
--

LOCK TABLES `personalProfile` WRITE;
/*!40000 ALTER TABLE `personalProfile` DISABLE KEYS */;
INSERT INTO `personalProfile` VALUES ('anniecungabc11',1,'Female','1998-01-01 00:00:00'),('maicheo23',4,'Male','1996-04-12 00:00:00'),('nnnnp21',5,'Male','1999-07-06 00:00:00'),('s@muel11',3,'Male','2001-02-02 00:00:00'),('superman12',2,'Female','2003-02-03 00:00:00');
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `personalProfile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27 15:14:53
SET FOREIGN_KEY_CHECKS=1;
