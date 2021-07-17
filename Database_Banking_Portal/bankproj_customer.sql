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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `bank_branch_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `userid_UNIQUE` (`customer_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `bank_branch_id` (`bank_branch_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`bank_branch_id`) REFERENCES `bank_branch` (`bank_branch_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10007,'Betty Draper','betty123','root123','12th St, BG Road, Kolkata','F','8769475886','betty@gmail.com',1234,5921,9),(10008,'Don Draper','dondraper','root1234','45th No., Delhi','M','9856734567','don123@gmail.com',2233,1967,8),(10009,'Holly R','hollyrr12','hthtthth','HF Apts, Kerala','F','7895634567','holly@yahoo.com',4567,2020,10),(10010,'Rohan Kumar','rohanjr45','fdd','House No. 25, Nidhile Apts, Bangalore','F','9675654567','rohan.jr@gmail.com',4455,26680,9),(10012,'Antara M','antara123','root12','Evermore Apts, Gottigere, Bangalore','F','9879856342','antara.tanu1929@gmail.com',1912,55594,8),(10015,'Patricia','pat.lore','root','GH Apts, Jaipur','F','9543452301','froggy@gmail.com',5678,1998,9),(10017,'Ophelia','opheliafl','dgg','HJIU Society, Kerala','F','9864526543','opheloa.francis@gmail.com',5678,2000,9),(10018,'Megan Calvet','megan123','root123','Folk Apts, MG Road, Delhi','F','8775667894','megan123@gmail.com',2345,2000,9),(10019,'Glenn Rhee','glenn123','twd123','No. 56, Prestige Apts., Kolkata','M','9876473847','glenn34@yahoo.com',3456,2980,10);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-17 17:15:12
