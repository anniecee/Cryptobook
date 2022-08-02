SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `influencerUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `influencerUser` (
  `influencerID` INT NOT NULL,
  `mostEngagedPostID` INT DEFAULT NULL,
  PRIMARY KEY (`influencerID`),
  KEY `mostEngagedPostID_idx` (`mostEngagedPostID`),
  CONSTRAINT `influencerID` FOREIGN KEY (`influencerID`) REFERENCES `user` (`userID`),
  CONSTRAINT `mostEngagedPostID` FOREIGN KEY (`mostEngagedPostID`) REFERENCES `post` (`postID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `influencerUser`
--

LOCK TABLES `influencerUser` WRITE;
/*!40000 ALTER TABLE `influencerUser` DISABLE KEYS */;
/*INSERT INTO `influencerUser` VALUES (123,'439fkd432gfk3'),(321,'aslw325j54l3'),(223,'ds345j6l2m23l'),(221,'gkfj495030fk2'),(145,'welkf32lkf245');
/*!40000 ALTER TABLE `influencerUser` ENABLE KEYS */;
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
