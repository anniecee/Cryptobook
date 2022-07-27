
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
  `userID_account` CHAR(40) NULL,
  PRIMARY KEY (`accountID`),
  INDEX `userID_account_idx` (`userID_account` ASC) VISIBLE,
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
  `cardID_addBanking` CHAR(40) NOT NULL,
  `userID_addBanking` CHAR(40) NOT NULL,
  PRIMARY KEY (`cardID_addBanking`, `userID_addBanking`),
  INDEX `userID_addBanking_idx` (`userID_addBanking` ASC) VISIBLE,
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
  `cardID_bankinginfo` CHAR(40) NOT NULL,
  `cardNumber_bankinginfo` INT NULL,
  `nameOnCard` CHAR(40) NULL,
  PRIMARY KEY (`cardID_bankinginfo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`businessUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`businessUser` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`businessUser` (
  `userID_business` CHAR(40) NOT NULL,
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
  `buypostID` CHAR(40) NOT NULL,
  `transactionID_buy` CHAR(40) NOT NULL,
  `buyPrice` DECIMAL(10) NULL,
  `buyCrypto` CHAR(10) NULL,
  PRIMARY KEY (`buypostID`, `transactionID_buy`),
  INDEX `transactionID_buy_idx` (`transactionID_buy` ASC) VISIBLE,
  CONSTRAINT `buypostID`
    FOREIGN KEY (`buypostID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transactionID_buy`
    FOREIGN KEY (`transactionID_buy`)
    REFERENCES `cryptodatabase`.`transaction` (`transactionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cryptodatabase`.`credentials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`credentials` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`credentials` (
  `loginID_credential` CHAR(40) NOT NULL,
  `userID_credential` CHAR(40) NULL,
  `password_credential` CHAR(40) NULL,
  PRIMARY KEY (`loginID_credential`),
  INDEX `userID_credential_idx` (`userID_credential` ASC) VISIBLE,
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
  `userID_follows` CHAR(40) NULL,
  `followed_userID` CHAR(40) NOT NULL,
  `following_userID` CHAR(40) NOT NULL,
  PRIMARY KEY (`followed_userID`, `following_userID`),
  INDEX `followed_userID_idx` (`followed_userID` ASC) VISIBLE,
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
  `influencerID` CHAR(40) NOT NULL,
  `mostEngagedPostID` CHAR(40) NULL,
  PRIMARY KEY (`influencerID`),
  INDEX `mostEngagedPostID_idx` (`mostEngagedPostID` ASC) VISIBLE,
  CONSTRAINT `influencerID`
    FOREIGN KEY (`influencerID`)
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
  `postID_likeEvent` CHAR(40) NOT NULL,
  `likeUserID` CHAR(40) NULL,
  PRIMARY KEY (`postID_likeEvent`),
  INDEX `likeUserID_idx` (`likeUserID` ASC) VISIBLE,
  CONSTRAINT `postID_likeEvent`
    FOREIGN KEY (`postID_likeEvent`)
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
  `profileID` CHAR(40) NULL,
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
  `postID` CHAR(40) NOT NULL,
  `userID_post` CHAR(40) NULL,
  `text` CHAR(200) NULL,
  `likeCount` INT NULL,
  PRIMARY KEY (`postID`),
  INDEX `userID_post_idx` (`userID_post` ASC) VISIBLE,
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
  `transactionID` CHAR(40) NOT NULL,
  `crypto` CHAR(20) NULL,
  `price` DECIMAL(10) NULL,
  `type` CHAR(10) NULL,
  `time` DATETIME NULL,
  `postID_transaction` CHAR(40) NULL,
  `accountID_transaction` CHAR(40) NULL,
  PRIMARY KEY (`transactionID`),
  INDEX `transactionID_idx` (`transactionID` ASC),
  INDEX `postID_transaction_idx` (`postID_transaction` ASC),
  CONSTRAINT `postID_transaction`
    FOREIGN KEY (`postID_transaction`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
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
  `sell_postID` CHAR(40) NOT NULL,
  `sell_transactionID` CHAR(40) NOT NULL,
  `sellPrice` DECIMAL(10) NULL,
  `sellCrypto` CHAR(10) NULL,
  PRIMARY KEY (`sell_postID`, `sell_transactionID`),
  INDEX `sell_transactionID_idx` (`sell_transactionID` ASC),
  CONSTRAINT `sell_postID`
    FOREIGN KEY (`sell_postID`)
    REFERENCES `cryptodatabase`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sell_transactionID`
    FOREIGN KEY (`sell_transactionID`)
    REFERENCES `cryptodatabase`.`transaction` (`transactionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cryptodatabase`.`transactionStoredInAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cryptodatabase`.`transactionStoredInAccount` ;

CREATE TABLE IF NOT EXISTS `cryptodatabase`.`transactionStoredInAccount` (
  `transactionID_stored` CHAR(40) NOT NULL,
  `fromAccountID` CHAR(40) NULL,
  `toAccountID` CHAR(40) NULL,
  PRIMARY KEY (`transactionID_stored`),
  INDEX `toAccountID_idx` (`toAccountID` ASC) VISIBLE,
  INDEX `fromAccountID_idx` (`fromAccountID` ASC) VISIBLE,
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
  `userID` CHAR(40) NOT NULL,
  `name` CHAR(40) NULL,
  `email` CHAR(40) NULL,
  `followingCount` INT NULL,
  `followerCount` INT NULL,
  `loginID` CHAR(10) NULL,
  `password` CHAR(40) NULL,
  `userName_user` CHAR(40) NULL,
  PRIMARY KEY (`userID`),
  INDEX `loginID_idx` (`loginID` ASC),
  INDEX `userName_user_idx` (`userName_user` ASC),
  CONSTRAINT `userName_user`
    FOREIGN KEY (`userName_user`)
    REFERENCES `cryptodatabase`.`personalProfile` (`userName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `loginID`
    FOREIGN KEY (`loginID`)
    REFERENCES `cryptodatabase`.`credentials` (`loginID_credential`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
