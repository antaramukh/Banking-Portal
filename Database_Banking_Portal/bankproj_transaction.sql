-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bankproj
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_amount` double DEFAULT NULL,
  `transaction_time` timestamp NULL DEFAULT NULL,
  `customer_id_by` int DEFAULT NULL,
  `account_id_to` int DEFAULT NULL,
  `transaction_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`),
  KEY `customer_id_by` (`customer_id_by`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id_by`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64648 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (64591,2000,'2021-02-05 06:23:16',10007,10008,'Transfer'),(64597,20,'2021-02-06 17:15:47',10010,0,'Withdraw'),(64598,300,'2021-02-06 17:17:10',10010,0,'Deposit'),(64599,2000,'2021-02-07 06:52:12',10012,NULL,'Deposit'),(64602,20,'2021-02-07 07:17:51',10012,NULL,'Withdraw'),(64603,2000,'2021-02-07 07:20:01',10012,NULL,'Deposit'),(64606,2000,'2021-02-07 07:24:05',10012,NULL,'Deposit'),(64607,200,'2021-02-07 07:24:27',10012,NULL,'Withdraw'),(64635,12,'2021-03-12 21:15:59',10007,NULL,'Withdraw'),(64636,1000,'2021-03-12 21:22:00',10007,NULL,'Deposit'),(64637,1000,'2021-03-12 21:22:23',10007,NULL,'Deposit'),(64638,100,'2021-03-12 21:22:45',10007,10008,'Transfer'),(64641,1200,'2021-03-13 06:45:25',10008,NULL,'Deposit'),(64642,345,'2021-03-13 06:54:55',10008,10007,'Transfer'),(64643,12,'2021-03-13 07:05:04',10007,10008,'Transfer'),(64644,10,'2021-03-13 07:35:19',10015,NULL,'Deposit'),(64645,12,'2021-03-13 07:35:47',10015,NULL,'Withdraw'),(64646,20,'2021-05-07 14:33:05',10019,10009,'Transfer'),(64647,1000,'2021-05-07 14:33:48',10019,NULL,'Deposit');
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

-- Dump completed on 2021-07-17 17:15:13
