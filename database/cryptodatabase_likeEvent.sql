SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `likeEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likeEvent` (
  `postID_likeEvent` INT NOT NULL,
  `likeUserID` INT NOT NULL,
  PRIMARY KEY (`postID_likeEvent`, `likeUserID`),
  KEY `likeUserID_idx` (`likeUserID`),
  CONSTRAINT `likeUserID` FOREIGN KEY (`likeUserID`) REFERENCES `user` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `postID_likeEvent` FOREIGN KEY (`postID_likeEvent`) REFERENCES `post` (`postID`) ON DELETE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likeEvent`
--

LOCK TABLES `likeEvent` WRITE;
/*!40000 ALTER TABLE `likeEvent` DISABLE KEYS */;
INSERT INTO `likeEvent` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `likeEvent` ENABLE KEYS */;
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


