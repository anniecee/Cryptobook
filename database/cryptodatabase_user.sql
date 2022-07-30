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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `email` char(40) DEFAULT NULL,
  `followingCount` int DEFAULT NULL,
  `followerCount` int DEFAULT NULL,
  `loginID` char(40) DEFAULT NULL,
  `password` char(40) DEFAULT NULL,
  `userName_user` char(40) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `loginID_idx` (`loginID`),
  KEY `userName_user_idx` (`userName_user`),
  CONSTRAINT `loginID` FOREIGN KEY (`loginID`) REFERENCES `credentials` (`loginID_credential`),
  CONSTRAINT `userName_user` FOREIGN KEY (`userName_user`) REFERENCES `personalProfile` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'Annie','anniecUtiePie12@hotmail.com',1000,500,'peannie1','annIeCungsuperKuTe@sfu','anniecungabc11'),(223,'Helen','\nhelenp12@gmail.com\n\nhelenph12@gmail.com',50,100,'helensfu11','front-door-row','superman12'),(321,'Sam','samuel12@gmail.com',800,10,'sampiu2','samUeL#11','s@muel11'),(145,'Michael','miew3@gmail.com',0,0,'gmng','dlsjg2@4$!','maicheo23'),(221,'Nathan','na12@gmail.com',4000,10,'nth@43','welcome-to-home','nnnnp21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
