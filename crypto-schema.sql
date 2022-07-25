
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
  `accountID` CHAR(40) NOT NULL,
  `balance` DECIMAL(10) NULL,
  `userID` CHAR(40) NULL,
  PRIMARY KEY (`accountID`),
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`addBanking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`addBanking` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`addBanking` (
  `cardID` CHAR(40) NOT NULL,
  `userID` CHAR(40) NOT NULL,
  PRIMARY KEY (`cardID`, `userID`),
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `cardID`
    FOREIGN KEY (`cardID`)
    REFERENCES `cryptodatabase`.`bankingInfo` (`cardID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`bankingInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`bankingInfo` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`bankingInfo` (
  `cardID` CHAR(40) NOT NULL,
  `cardNumber` INT NULL,
  `nameOnCard` CHAR(40) NULL,
  PRIMARY KEY (`cardID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`businessUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`businessUser` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`businessUser` (
  `userID` CHAR(40) NOT NULL,
  `totalRevenue` DECIMAL(10) NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`buyPost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`buyPost` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`buyPost` (
  `postID` CHAR(40) NOT NULL,
  `transactionID` CHAR(40) NOT NULL,
  `buyPrice` DECIMAL(10) NULL,
  `buyCrypto` CHAR(10) NULL,
  PRIMARY KEY (`postID`, `transactionID`),
  INDEX `transactionID_idx` (`transactionID` ASC) VISIBLE,
  CONSTRAINT `postID`
    FOREIGN KEY (`postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transactionID`
    FOREIGN KEY (`transactionID`)
    REFERENCES `cryptodatabase`.`transaction` (`transactionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`credentials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`credentials` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`credentials` (
  `loginID` CHAR(40) NOT NULL,
  `userID` CHAR(40) NULL,
  `password` CHAR(40) NULL,
  PRIMARY KEY (`loginID`),
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`follows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`follows` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`follows` (
  `userID` CHAR(40) NULL,
  `followed_userID` CHAR(40) NOT NULL,
  `following_userID` CHAR(40) NOT NULL,
  PRIMARY KEY (`followed_userID`, `following_userID`),
  INDEX `followed_userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `following_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `followed_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`influencerUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`influencerUser` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`influencerUser` (
  `userID` CHAR(40) NOT NULL,
  `mostEngagedPostID` CHAR(40) NULL,
  PRIMARY KEY (`userID`),
  INDEX `mostEngagedPostID_idx` (`mostEngagedPostID` ASC) VISIBLE,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mostEngagedPostID`
    FOREIGN KEY (`mostEngagedPostID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`likeEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`likeEvent` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`likeEvent` (
  `postID` CHAR(40) NOT NULL,
  `likeUserID` CHAR(40) NULL,
  PRIMARY KEY (`postID`),
  INDEX `likeUserID_idx` (`likeUserID` ASC) VISIBLE,
  CONSTRAINT `postID`
    FOREIGN KEY (`postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `likeUserID`
    FOREIGN KEY (`likeUserID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`personalProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`personalProfile` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`personalProfile` (
  `userName` CHAR(40) NOT NULL,
  `userID` CHAR(40) NULL,
  `gender` CHAR(10) NULL,
  `DOB` DATETIME NULL,
  PRIMARY KEY (`userName`),
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`post` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`post` (
  `postID` CHAR(40) NOT NULL,
  `userID` CHAR(40) NULL,
  `text` CHAR(400) NULL,
  `likeCount` INT NULL,
  PRIMARY KEY (`postID`),
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `cryptodatabase`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`sellPost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`sellPost` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`sellPost` (
  `postID` CHAR(40) NOT NULL,
  `transactionID` CHAR(40) NOT NULL,
  `sellPrice` DECIMAL(10) NULL,
  `sellCrypto` CHAR(10) NULL,
  PRIMARY KEY (`postID`, `transactionID`),
  INDEX `transactionID_idx` (`transactionID` ASC) VISIBLE,
  CONSTRAINT `postID`
    FOREIGN KEY (`postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transactionID`
    FOREIGN KEY (`transactionID`)
    REFERENCES `cryptodatabase`.`transaction` (`transactionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`transaction` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`transaction` (
  `transactionID` CHAR(40) NOT NULL,
  `crypto` CHAR(20) NULL,
  `price` DECIMAL(10) NULL,
  `type` CHAR(10) NULL,
  `time` DATETIME NULL,
  `postID` CHAR(40) NULL,
  `accountID` CHAR(40) NULL,
  PRIMARY KEY (`transactionID`),
  INDEX `accountID_idx` (`accountID` ASC) VISIBLE,
  INDEX `postID_idx` (`postID` ASC) VISIBLE,
  CONSTRAINT `postID`
    FOREIGN KEY (`postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `accountID`
    FOREIGN KEY (`accountID`)
    REFERENCES `cryptodatabase`.`account` (`accountID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`transactionStoredInAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`transactionStoredInAccount` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`transactionStoredInAccount` (
  `transactionID` CHAR(40) NOT NULL,
  `fromAccountID` CHAR(40) NULL,
  `toAccountID` CHAR(40) NULL,
  PRIMARY KEY (`transactionID`),
  INDEX `toAccountID_idx` (`toAccountID` ASC) VISIBLE,
  INDEX `fromAccountID_idx` (`fromAccountID` ASC) VISIBLE,
  CONSTRAINT `transactionID`
    FOREIGN KEY (`transactionID`)
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
  `userID` CHAR(40) NOT NULL,
  `name` CHAR(40) NULL,
  `email` CHAR(40) NULL,
  `followingCount` INT NULL,
  `followerCount` INT NULL,
  `loginID` CHAR(10) NULL,
  `password` CHAR(40) NULL,
  `userName` CHAR(40) NULL,
  PRIMARY KEY (`userID`),
  INDEX `loginID_idx` (`loginID` ASC) VISIBLE,
  INDEX `userName_idx` (`userName` ASC) VISIBLE,
  CONSTRAINT `userName`
    FOREIGN KEY (`userName`)
    REFERENCES `cryptodatabase`.`personalProfile` (`userName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `loginID`
    FOREIGN KEY (`loginID`)
    REFERENCES `cryptodatabase`.`credentials` (`loginID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
