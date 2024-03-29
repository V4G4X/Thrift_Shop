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
INSERT INTO `Contains` VALUES (13,1,441,1),(13,2,69,1),(17,1,882,2),(17,2,69,1),(18,1,6174,14),(18,2,621,9),(19,1,3528,8),(19,2,414,6),(22,1,1764,4),(23,1,1323,3),(23,2,414,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (1,1,66,441),(2,1,68,69),(3,1,12,456),(4,1,3,15),(5,1,5,15);
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
INSERT INTO `Item_Detail` VALUES (1,'dsaads','teri maa',3,'dasdas'),(2,'pregnancy','It is my personal memoirs',5,'Ayushi'),(3,'UNIX/Linux','ok ok',5,'S. Das'),(4,'more or less','its more or less',3,'jash gujatahi'),(5,'more or less','kuch kaam ka nahi hai book',4,'jash gujaathi');
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
INSERT INTO `Login` VALUES (1,'anuj16','ayushi16'),(2,'komal24','kammo21'),(3,'kota500','delhiexpress'),(4,'kitkat45','breakuptobantahai');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (13,1,'2019-10-09 12:53:37','Confirmed',510),(17,1,'2019-10-10 06:59:18','Cart',951),(18,3,'2019-10-10 06:21:25','Confirmed',6795),(19,2,'2019-10-10 07:00:45','Confirmed',3942),(22,3,'2019-10-10 06:41:05','Cart',1764),(23,2,'2019-10-10 07:02:58','Cart',1737);
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
  KEY `uid` (`uid`),
  CONSTRAINT `Phone_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,1000,422003,'Nashik','college road','Rachit heritage','Jain','Anuj','anuj16@gmail.com'),(2,1000,411037,'Pune','Vit ke samne','SBI nagar','Mekala','Komal','komal99@gmail.com'),(3,1000,422311,'Kota','Allen ke samne','SBI nagar','sharma','Kota','kota99@gmail.com'),(4,1000,412411,'Pune','PICT ke samne','Friends','Khandelwal','Ritika','ritika99@gmail.com');
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

-- Dump completed on 2019-10-10 17:39:03
