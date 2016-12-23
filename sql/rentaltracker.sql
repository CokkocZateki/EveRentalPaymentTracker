/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Christopher Mancuso
 * Created: Dec 23, 2016
 * Project: Eve Rental Payment Tracker
 */

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `RentalTracker`
--

-- --------------------------------------------------------

--
-- Table for `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Table for `phealng-cache`
--

CREATE TABLE IF NOT EXISTS `phealng-cache` (
    `userId` INT(10) UNSIGNED NOT NULL,
    `scope` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `args` VARCHAR(250) NOT NULL,
    `cachedUntil` TIMESTAMP NOT NULL,
    `xml` LONGTEXT NOT NULL,
    PRIMARY KEY (`userId`, `scope`, `name`, `args`)
) COMMENT='Caching for PhealNG' COLLATE='utf8_general_ci' ENGINE=InnoDB CHARSET=latin1;

--
-- Table structure for `CorpWalletJournal`
--

CREATE TABLE IF NOT EXISTS `CorpWalletJournal` (
    `date` varchar(25) NOT NULL,
    `refID` int(20) NOT NULL,
    `refTypeID` int(6) NOT NULL,
    `ownerName1` varchar(50) NOT NULL,
    `ownerID1` int(12) NOT NULL,
    `ownerName2` varchar(50) NOT NULL,
    `ownerID2` int(12) NOT NULL,
    `argName1` varchar(100),
    `argID1` int(20) NOT NULL,
    `amount` decimal(25,2) NOT NULL,
    `balance` decimal(25,2) NOT NULL,
    `reason` varchar(100),
    `taxReceiverID` varchar(50),
    `taxAmount` varchar(50),
    PRIMARY KEY(`refID`),
    UNIQUE KEY `refID` (`refID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for `Rentals`
-- Value of 2592000 for Period defaults to 30 days
--

CREATE TABLE IF NOT EXISTS `Rentals` (
    `id` int(20) NOT NULL AUTO_INCREMENT,
    `Corp` varchar(50) NOT NULL DEFAULT 'None',
    `Pilot` varchar(50) NOT NULL DEFAULT 'N/A',
    `Type` int(5) NOT NULL DEFAULT '0',
    `Location` varchar(50),
    `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
    `Period` int(20) NOT NULL DEFAULT '2592000',
    PRIMARY KEY(`id`),
    UNIQUE KEY `id` (`id`)
) AUTO_INCREMENT=1 ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for `PaymentHistory`
--

CREATE TABLE IF NOT EXISTS `PaymentHistory` (
    `id` int(20) NOT NULL AUTO_INCREMENT,
    `Corp` varchar(50) NOT NULL DEFAULT 'None',
    `Pilot` varchar(50) NOT NULL DEFAULT 'N/A',
    `Time` int(20),
    `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
    `Location` varchar(50),
    PRIMARY KEY(`id`),
    UNIQUE KEY `id` (`id`)
) AUTO_INCREMENT=1 ENGINE=InnoDB DEFAULT CHARSET=latin1;