SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cryptodatabase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cryptodatabase` ;

-- -----------------------------------------------------
-- Schema cryptodatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cryptodatabase` DEFAULT CHARACTER SET utf8 ;
USE `cryptodatabase` ;

-- -----------------------------------------------------
-- Table `cryptodatabase`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`account` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`account` (
  `accountID` INT NOT NULL,
  `balance` DECIMAL(10) NULL,
  `userID_account` INT NULL,
  PRIMARY KEY (`accountID`),
  INDEX `userID_account_idx` (`userID_account` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID_account`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`addBanking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`addBanking` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`addBanking` (
  `cardID_addBanking` INT NOT NULL,
  `userID_addBanking` INT NOT NULL,
  PRIMARY KEY (`cardID_addBanking`, `userID_addBanking`),
  INDEX `userID_addBanking_idx` (`userID_addBanking` ASC),
  CONSTRAINT `cardID_addBanking`
    FOREIGN KEY (`cardID_addBanking`)
    REFERENCES `cryptodatabase`.`bankingInfo` (`cardID_bankinginfo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID_addBanking`
    FOREIGN KEY (`userID_addBanking`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`bankingInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`bankingInfo` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`bankingInfo` (
  `cardID_bankinginfo` INT NOT NULL,
  `cardNumber_bankinginfo` INT NULL,
  `nameOnCard` CHAR(40) NULL,
  PRIMARY KEY (`cardID_bankinginfo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`businessUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`businessUser` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`businessUser` (
  `userID_business` INT NOT NULL,
  `totalRevenue` DECIMAL(10) NULL,
  PRIMARY KEY (`userID_business`),
  CONSTRAINT `userID_business`
    FOREIGN KEY (`userID_business`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`buyPost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`buyPost` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`buyPost` (
  `buypostID` INT NOT NULL,
  `transactionID_buy` INT NOT NULL,
  `buyPrice` DECIMAL(10) NULL,
  `buyCrypto` CHAR(10) NULL,
  PRIMARY KEY (`buypostID`, `transactionID_buy`),
  INDEX `transactionID_buy_idx` (`transactionID_buy` ASC),
  CONSTRAINT `buypostID`
    FOREIGN KEY (`buypostID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`credentials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`credentials` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`credentials` (
  `loginID_credential`CHAR(40) NOT NULL,
  `userID_credential` INT NULL,
  `password_credential` CHAR(40) NULL,
  PRIMARY KEY (`loginID_credential`),
  INDEX `userID_credential_idx` (`userID_credential` ASC),
  CONSTRAINT `userID_credential`
    FOREIGN KEY (`userID_credential`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`follows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`follows` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`follows` (
  `userID_follows` INT NULL,
  `followed_userID` INT NOT NULL,
  `following_userID` INT NOT NULL,
  PRIMARY KEY (`followed_userID`, `following_userID`),
  INDEX `followed_userID_idx` (`followed_userID` ASC) ,
  CONSTRAINT `following_userID`
    FOREIGN KEY (`following_userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `followed_userID`
    FOREIGN KEY (`followed_userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`influencerUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`influencerUser` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`influencerUser` (
  `influencerID` INT NOT NULL,
  `mostEngagedPostID` INT NULL,
  PRIMARY KEY (`influencerID`),
  INDEX `mostEngagedPostID_idx` (`mostEngagedPostID` ASC) ,
  CONSTRAINT `influencerID`
    FOREIGN KEY (`influencerID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mostEngagedPostID`
    FOREIGN KEY (`mostEngagedPostID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`likeEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`likeEvent` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`likeEvent` (
  `postID_likeEvent` INT NOT NULL,
  `likeUserID` INT NULL,
  PRIMARY KEY (`postID_likeEvent`),
  INDEX `likeUserID_idx` (`likeUserID` ASC) ,
  CONSTRAINT `postID_likeEvent`
    FOREIGN KEY (`postID_likeEvent`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `likeUserID`
    FOREIGN KEY (`likeUserID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`personalProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`personalProfile` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`personalProfile` (
  `userName` CHAR(40) NOT NULL,
  `profileID` INT NULL,
  `gender` CHAR(10) NULL,
  `DOB` DATETIME NULL,
  PRIMARY KEY (`userName`),
  INDEX `profileID_idx` (`profileID` ASC),
  CONSTRAINT `profileID`
    FOREIGN KEY (`profileID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`post` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`post` (
  `postID` INT NOT NULL,
  `userID_post` INT NULL,
  `text` CHAR(200) NULL,
  `likeCount` INT NULL,
  `type` CHAR(40) NULL,
  PRIMARY KEY (`postID`),
  INDEX `userID_post_idx` (`userID_post` ASC),
  CONSTRAINT `userID_post`
    FOREIGN KEY (`userID_post`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `cryptodatabase`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`transaction` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`transaction` (
  `transactionID` INT NOT NULL,
  `crypto` CHAR(20) NULL,
  `price` DECIMAL(10) NULL,
  `type` CHAR(10) NULL,
  `time` DATETIME NULL,
  `postID_transaction` INT NULL,
  `accountID_transaction` INT NULL,
  PRIMARY KEY (`transactionID`),
  INDEX `transactionID_idx` (`transactionID` ASC),
  INDEX `postID_transaction_idx` (`postID_transaction` ASC),
  CONSTRAINT `postID_transaction`
    FOREIGN KEY (`postID_transaction`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `accountID_transaction`
    FOREIGN KEY (`accountID_transaction`)
    REFERENCES `cryptodatabase`.`account` (`accountID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cryptodatabase`.`sellPost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`sellPost` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`sellPost` (
  `sell_postID` INT NOT NULL,
  `sell_transactionID` INT NOT NULL,
  `sellPrice` DECIMAL(10) NULL,
  `sellCrypto` CHAR(10) NULL,
  PRIMARY KEY (`sell_postID`, `sell_transactionID`),
  INDEX `sell_transactionID_idx` (`sell_transactionID` ASC),
  CONSTRAINT `sell_postID`
    FOREIGN KEY (`sell_postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cryptodatabase`.`transactionStoredInAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`transactionStoredInAccount` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`transactionStoredInAccount` (
  `transactionID_stored` INT NOT NULL,
  `fromAccountID` INT NULL,
  `toAccountID` INT NULL,
  PRIMARY KEY (`transactionID_stored`),
  INDEX `toAccountID_idx` (`toAccountID` ASC) ,
  INDEX `fromAccountID_idx` (`fromAccountID` ASC),
  CONSTRAINT `transactionID_stored`
    FOREIGN KEY (`transactionID_stored`)
    REFERENCES `cryptodatabase`.`transaction` (`transactionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fromAccountID`
    FOREIGN KEY (`fromAccountID`)
    REFERENCES `cryptodatabase`.`account` (`accountID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `toAccountID`
    FOREIGN KEY (`toAccountID`)
    REFERENCES `cryptodatabase`.`account` (`accountID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`user` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `name` CHAR(40) NULL,
  `email` CHAR(40) NULL,
  `followingCount` INT NULL,
  `followerCount` INT NULL,
  `loginID` CHAR(40) NULL,
  `password` CHAR(40) NULL,
  `userName_user` CHAR(40) NULL,
  PRIMARY KEY (`userID`),
  INDEX `loginID_idx` (`loginID` ASC),
  INDEX `userName_user_idx` (`userName_user` ASC),
  CONSTRAINT `userName_user`
    FOREIGN KEY (`userName_user`)
    REFERENCES `cryptodatabase`.`personalProfile` (`userName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `loginID`
    FOREIGN KEY (`loginID`)
    REFERENCES `cryptodatabase`.`credentials` (`loginID_credential`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=1;
SET GLOBAL FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


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

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `email` char(40) DEFAULT NULL,
  `followingCount` int DEFAULT 0,
  `followerCount` int DEFAULT 0,
  `loginID` CHAR(40) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'Annie','anniecUtiePie12@hotmail.com',1000,500,'peannie1','annIeCungsuperKuTe@sfu','anniecungabc11'),(2,'Helen','\nhelenp12@gmail.com\n\nhelenph12@gmail.com',50,100,'helensfu11','front-door-row','superman12'),(3,'Sam','samuel12@gmail.com',800,10,'sampiu2','samUeL#11','s@muel11'),(4,'Michael','miew3@gmail.com',0,0,'gmng','dlsjg2@4$!','maicheo23'),(5,'Nathan','na12@gmail.com',4000,10,'nth@43','welcome-to-home','nnnnp21');
SET FOREIGN_KEY_CHECKS=1;
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
SET FOREIGN_KEY_CHECKS=1;

-- storeinaccount
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `transactionStoredInAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionStoredInAccount` (
  `transactionID_stored` INT NOT NULL,
  `fromAccountID` INT DEFAULT NULL,
  `toAccountID` INT DEFAULT NULL,
  PRIMARY KEY (`transactionID_stored`),
  KEY `toAccountID_idx` (`toAccountID`),
  KEY `fromAccountID_idx` (`fromAccountID`),
  CONSTRAINT `fromAccountID` FOREIGN KEY (`fromAccountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `toAccountID` FOREIGN KEY (`toAccountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transactionID_stored` FOREIGN KEY (`transactionID_stored`) REFERENCES `transaction` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionStoredInAccount`
--

LOCK TABLES `transactionStoredInAccount` WRITE;
/*!40000 ALTER TABLE `transactionStoredInAccount` DISABLE KEYS */;
/*INSERT INTO `transactionStoredInAccount` VALUES (23992,'dglf4kfls4kl!@4l','ab35k6l!3l@4k3lf'),(49323,'11114o%mfgfg@557','5969604869363n46'),(34123,'5969604869363n46','akfl35063!mbgks#'),(23124,'ab35k6l!3l@4k3lf','ab35k6l!3l@4k3lf'),(32945,'akfl35063!mbgks#','dglf4kfls4kl!@4l');
/*!40000 ALTER TABLE `transactionStoredInAccount` ENABLE KEYS */;
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


SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionID` INT NOT NULL ,
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
INSERT INTO `likeEvent` VALUES (4,1),(5,2),(1,5),(2,5),(3,5);
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
-- Table structure for table `credentials`
--
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `loginID_credential` char(40) NOT NULL,
  `userID_credential` INT DEFAULT NULL,
  `password_credential` char(40) DEFAULT NULL,
  PRIMARY KEY (`loginID_credential`),
  KEY `userID_credential_idx` (`userID_credential`),
  CONSTRAINT `userID_credential` FOREIGN KEY (`userID_credential`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('gmng',4,'daksl2@4$!hmg'),('helensfu11',2,'frdft-rofdw-12'),('nth@43',5,'wvfdklv324kl1!!4'),('peannie1',1,'amvlekc3@gjs!'),('sampiu2',3,'sbk53kf1#11\nbk53kf1#11\nsbk53kf1#11');
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
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

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `businessUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businessUser` (
  `userID_business` INT NOT NULL,
  `totalRevenue` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`userID_business`),
  CONSTRAINT `userID_business` FOREIGN KEY (`userID_business`) REFERENCES `user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessUser`
--

LOCK TABLES `businessUser` WRITE;
/*!40000 ALTER TABLE `businessUser` DISABLE KEYS */;
INSERT INTO `businessUser` VALUES (123,438414),(321,3459431),(223,45693),(221,0),(145,546954);
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `businessUser` ENABLE KEYS */;
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

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `bankingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankingInfo` (
  `cardID_bankinginfo` INT NOT NULL AUTO_INCREMENT,
  `cardNumber_bankinginfo` INT DEFAULT NULL,
  `nameOnCard` char(40) DEFAULT NULL,
  `userID_bankingInfo` INT NOT NULL,
  PRIMARY KEY (`cardID_bankinginfo`),
  CONSTRAINT `userID_bankingInfo` FOREIGN KEY (`userID_bankingInfo`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankingInfo`
--

LOCK TABLES `bankingInfo` WRITE;
/*!40000 ALTER TABLE `bankingInfo` DISABLE KEYS */;
INSERT INTO `bankingInfo` VALUES (12345,398593038,'NATHAN DINH',1),(12346,123456543,'ANNIE CUNG',2),(12347,234567804,'SAM P',3),(12348,294859329,'HELEN M',4),(123459,129434828,'MICHAEL LEE',5);
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `bankingInfo` ENABLE KEYS */;
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


SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountID` INT NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,0) DEFAULT 0,
  `userID_account` INT DEFAULT NULL,
  PRIMARY KEY (`accountID`),
  KEY `userID_account_idx` (`userID_account`),
  CONSTRAINT `userID` FOREIGN KEY (`userID_account`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;

INSERT INTO `account` VALUES (1,235,1),(2,0,2),(3,4864,3),(4,498,4),(5,1206,5);
SET FOREIGN_KEY_CHECKS=1;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
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


