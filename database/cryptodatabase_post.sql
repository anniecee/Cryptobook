SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `post`;

CREATE TABLE  `post` (
  `postID` INT NOT NULL AUTO_INCREMENT,
  `userID_post` INT DEFAULT NULL,
  `text` char(200) DEFAULT NULL,
  `likeCount` int DEFAULT NULL,
  `type` char(10) not null,
  PRIMARY KEY (`postID`),
  KEY `userID_post_idx` (`userID_post`),
  CONSTRAINT `userID_post` FOREIGN KEY (`userID_post`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE cryptodatabase.`post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,3,'Novice Traders trade 5 to 10 times too big. They are taking 5 to 10 percent risk, on a trade they should be taking 1 to 2 percent risk on.',10,'normal'),(2,2,'There is no single market secret to discover, no single correct way to trade the markets.',200,'sell'),(3,2,'Time is your friend; impulse is your enemy',100,'sell'),(4,4,'The market today is to the moon.',1000,'buy'),(5,1,'All the math you need in the stock market you get in the fourth grade.',40,'buy'),(6,2,'0.01% of Crypto Accounts Control 27% of Bitcoin According to a New Report',50,'buy'),(7,1,'If investing in crypto was easy, we would all be rich.',30,'buy'),(8,5,'I wish daycare accepted crypto',60,'normal');
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE cryptodatabase.`post` ENABLE KEYS */;
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



