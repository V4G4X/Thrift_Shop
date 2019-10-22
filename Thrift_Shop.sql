-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Thrift_Shop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contains` (
  `o_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  `partial_amount` float NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`o_id`,`i_id`),
  KEY `i_id` (`i_id`),
  CONSTRAINT `Contains_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `Orders` (`o_id`) ON DELETE CASCADE,
  CONSTRAINT `Contains_ibfk_2` FOREIGN KEY (`i_id`) REFERENCES `Item` (`i_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;

INSERT INTO `Contains` VALUES (33,11,250,2),(33,13,100,1),(34,14,320,1),(35,15,200,1),(36,14,320,1),(37,12,680,2),(38,11,125,1),(39,13,100,1),(40,13,100,1),(41,13,200,2),(42,11,125,1),(44,11,125,1),(45,7,200,1),(46,15,400,2);
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`i_id`),
  KEY `fk_Item_1_idx` (`s_id`),
  CONSTRAINT `fk_Item_1` FOREIGN KEY (`s_id`) REFERENCES `User` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;

INSERT INTO `Item` VALUES (7,5,7,200),(8,5,6,250),(9,6,5,150),(10,6,4,175),(11,7,2,125),(12,7,6,340),(13,8,2,100),(14,8,4,320),(15,9,2,200),(16,9,4,225);

/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `price_before_insert` BEFORE INSERT ON `Item` FOR EACH ROW
BEGIN
     IF (new.price < 0) THEN
         SET new.price = -1*(new.price);
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `stock_before_insert` BEFORE INSERT ON `Item` FOR EACH ROW
BEGIN
     IF (new.stock < 0) THEN
         SET new.stock = -1*(new.stock);
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Item_Detail`
--

DROP TABLE IF EXISTS `Item_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item_Detail` (
  `i_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`i_id`),
  CONSTRAINT `fk_Item_Detail_1` FOREIGN KEY (`i_id`) REFERENCES `Item` (`i_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_Detail`
--

LOCK TABLES `Item_Detail` WRITE;
/*!40000 ALTER TABLE `Item_Detail` DISABLE KEYS */;
INSERT INTO `Item_Detail` VALUES (7,'Life of PI','Publisher : Pearson Publication\r\nOld Edition',4,'R J Guruswamy'),(8,'UNIX/Linux','Publisher : McGraww Hill\r\nNewest Edition\r\nIn Pristine Condition\r\nAbsolute must for preparation of Operating Systems',5,'Sumitabhdhas Charan'),(9,'Basics of Civil Engineering','Published : Techmaxx Publications\r\nPart of the curriculum at IIT Mumbai',3,'Tejasvi Radheya'),(10,'How to crack JEE Advanced','Essential,tried and tested formula for cracking the ultimate exam! Specially made for JEE aspirants hailing from Nashik!',5,'Juna Naij'),(11,'Kota Diaries','A very good read and gives a very insightful understanding about the dark and the mafia underbelly of Kota.\r\nOnly few in stock ',4,'Prakash Gupta'),(12,'The Total Guide to Front End Development','Offers a complete guide into the totality of life and Front End Development. Must for all wishing to apply practical concepts of HCI in project end product Development',3,'Runav Ednawag'),(13,'Using Big Data Effectively!','This book covers all basics of Big Data,Scala and Hadoop environments. Essential for all those pursuing a career in Big Data.',2,'Shrikant Gawande'),(14,'12 Rules of Life','NewYork Time\'s best selling book for over a year. Must read for people who wish to turn around their lives',4,'Jordan Peterson'),(15,'The Fourth Estate','This book covers the story of a jewish kid in Germany during the Holocaust. It is an absolutely amazing book and a touching story. A steal at only 200/-',5,'Jeffery Archer'),(16,'Concepts of Physics ','This book is the bible for everyone who wishes to crack JEE. Used and recommended by everyone who has ever made it in the Engineering Field.',3,'H C Verma');
/*!40000 ALTER TABLE `Item_Detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `condition_before_insert` BEFORE INSERT ON `Item_Detail` FOR EACH ROW
BEGIN
     IF (new.condition < 0) THEN
         SET new.condition = -1*(new.condition);
     END IF;
     IF(new.condition>5) THEN
     SET new.condition = 5;
     END IF;
     IF(new.condition=0) THEN
     SET new.condition = 1;
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `uid` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_Login_1_idx` (`uid`),
  CONSTRAINT `fk_Login_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;

INSERT INTO `Login` VALUES (5,'ayushi16','ayushi16'),(6,'anuj@32','anuj@32'),(7,'yash@29','yash@29'),(8,'varun@69','varun@69'),(9,'jash@14','jash@14'),(12,'ayushi855','123'),(13,'ayushi85','a'),(15,'Varun69','12'),(17,'anuj@321','Yashgupta@123'),(18,'guptaji','Guptaji@123');

/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NOT NULL,
  `timestmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` float NOT NULL,
  PRIMARY KEY (`o_id`),
  KEY `fk_Orders_1_idx` (`b_id`),
  CONSTRAINT `fk_Orders_1` FOREIGN KEY (`b_id`) REFERENCES `User` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` VALUES (33,5,'2019-10-11 03:04:01','Confirmed',350),(34,5,'2019-10-11 03:08:11','Confirmed',320),(35,6,'2019-10-11 03:34:34','Confirmed',200),(36,6,'2019-10-11 03:33:30','Confirmed',320),(37,5,'2019-10-11 03:46:30','Cart',680),(38,9,'2019-10-11 04:19:19','Confirmed',125),(39,9,'2019-10-11 05:37:52','Confirmed',100),(40,6,'2019-10-11 06:06:16','Confirmed',100),(41,12,'2019-10-11 07:06:15','Confirmed',200),(42,6,'2019-10-11 08:44:40','Confirmed',125),(44,6,'2019-10-11 09:31:23','Confirmed',125),(45,6,'2019-10-16 06:40:05','Cart',200),(46,6,'2019-10-16 07:27:08','Confirmed',400);

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `timestmp_before_insert` BEFORE INSERT ON `Orders` FOR EACH ROW
BEGIN
         SET new.timestmp = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `status_before_insert` BEFORE INSERT ON `Orders` FOR EACH ROW
BEGIN
         SET new.status = 'Cart';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `timestmp_before_update` BEFORE UPDATE ON `Orders` FOR EACH ROW
BEGIN
         SET new.timestmp = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phone` (
  `uid` int(11) NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`,`phone`),
  KEY `uid` (`uid`),
  CONSTRAINT `Phone_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;

INSERT INTO `Phone` VALUES (5,'7896541230'),(5,'9766825588'),(6,'7845129632'),(6,'8256874596'),(7,'9181817888'),(7,'9262428642'),(8,'8451629598'),(8,'9481526787'),(9,'7030548435'),(9,'9822048620'),(12,'1223312335'),(12,'9405607845'),(13,'3214569871'),(15,'4561363564'),(17,'9874563215'),(18,'7894561230'),(18,'9876543210');

/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET is there a offline help manual command for mongodbsql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `phone_before_insert` BEFORE INSERT ON `Phone` FOR EACH ROW
BEGIN
     IF (new.phone < 0) THEN
         SET new.phone = -1*(new.phone);
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `wallet` float NOT NULL DEFAULT '1000',
  `pincode` int(11) NOT NULL,
  `city` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `neighbourhood` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (5,1330,411043,'Pune','Dhankawadi','PICT Girls Hostel','Patani','Ayushi','ayushi16199@gmail.com'),(6,730,422312,'Mumbai','Powai','CharanSingh Apartments','Jain','Anuj','anuj.jain@gmail.com'),(7,2625,411043,'Pune','Dhankawadi','Swami Apartments','Gupta','Yash','yash.gupta@gmail.com'),(8,3140,411043,'Pune','Dhankawadi','201-Duttaraya','Gawande','Varun','varun.gawande@gmail.com'),(9,2375,411048,'Pune','Wanowrie','Green Acres','Gujarathi','Jash','jashgujarathi@gmail.com'),(12,1300,123456,'puj','varun','nnnnnnn','sbhjs','sam','sslsl@j.com'),(13,1500,123654,'z','z','z','aa','aa','anuj.jain1@gmail.com'),(15,1500,123456,'1234','1234','1234','Gawande','Varun','varun.1gawande@gmail.com'),(17,1500,123654,'a','a','a','a','a','anuj.jain12@gmail.com'),(18,1500,789456,'ghjgjk','hvjhvj','ytfh','gupta','yash','yash.gupta123@gmail.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `wallet_before_insert` BEFORE INSERT ON `User` FOR EACH ROW
BEGIN
     IF (new.wallet < 0) THEN
         SET new.wallet = 0;
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `pincode_before_insert` BEFORE INSERT ON `User` FOR EACH ROW
BEGIN
     IF (new.pincode < 0) THEN
         SET new.pincode = -1*(new.pincode);
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Admin`@`localhost`*/ /*!50003 TRIGGER `wallet_before_update` BEFORE UPDATE ON `User` FOR EACH ROW
BEGIN
     IF (new.pincode < 0) THEN
         SET new.pincode = -1*(new.pincode);
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `itemlist`
--

DROP TABLE IF EXISTS `itemlist`;
/*!50001 DROP VIEW IF EXISTS `itemlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itemlist` AS SELECT 
 1 AS `i_id`,
 1 AS `s_id`,
 1 AS `stock`,
 1 AS `quantity`,
 1 AS `partial_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!50001 DROP VIEW IF EXISTS `transaction_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `transaction_details` AS SELECT 
 1 AS `title`,
 1 AS `quantity`,
 1 AS `partial_amount`,
 1 AS `timestmp`,
 1 AS `s_id`,
 1 AS `i_id`,
 1 AS `b_id`,
 1 AS `o_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vieww`
--

DROP TABLE IF EXISTS `vieww`;
/*!50001 DROP VIEW IF EXISTS `vieww`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vieww` AS SELECT 
 1 AS `i_id`,
 1 AS `s_id`,
 1 AS `stock`,
 1 AS `quantity`,
 1 AS `partial_amount`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `itemlist`
--

/*!50001 DROP VIEW IF EXISTS `itemlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itemlist` AS select `Item`.`i_id` AS `i_id`,`Item`.`s_id` AS `s_id`,`Item`.`stock` AS `stock`,`Contains`.`quantity` AS `quantity`,`Contains`.`partial_amount` AS `partial_amount` from (`Item` join `Contains` on((`Item`.`i_id` = `Contains`.`i_id`))) where (`Contains`.`o_id` = 12) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaction_details`
--

/*!50001 DROP VIEW IF EXISTS `transaction_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transaction_details` AS select `Item_Detail`.`title` AS `title`,`Contains`.`quantity` AS `quantity`,`Contains`.`partial_amount` AS `partial_amount`,`Orders`.`timestmp` AS `timestmp`,`Item`.`s_id` AS `s_id`,`Item`.`i_id` AS `i_id`,`Orders`.`b_id` AS `b_id`,`Orders`.`o_id` AS `o_id` from (`Item` join (`Orders` join (`Contains` join `Item_Detail` on((`Contains`.`i_id` = `Item_Detail`.`i_id`))) on((`Orders`.`o_id` = `Contains`.`o_id`))) on((`Item`.`i_id` = `Contains`.`i_id`))) where (`Orders`.`status` = 'Confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vieww`
--

/*!50001 DROP VIEW IF EXISTS `vieww`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vieww` AS select `Item`.`i_id` AS `i_id`,`Item`.`s_id` AS `s_id`,`Item`.`stock` AS `stock`,`Contains`.`quantity` AS `quantity`,`Contains`.`partial_amount` AS `partial_amount`,`Item_Detail`.`title` AS `title` from (`Item` join (`Contains` join `Item_Detail` on((`Contains`.`i_id` = `Item_Detail`.`i_id`))) on((`Item`.`i_id` = `Contains`.`i_id`))) where (`Contains`.`o_id` = 12) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-22 20:14:07