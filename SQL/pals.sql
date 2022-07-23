-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pals
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentID`),
  UNIQUE KEY `departmentID_UNIQUE` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cleaning'),(2,'Landscaping'),(3,'Building'),(4,'Removal'),(5,'Other');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribution` (
  `distributionID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `streetnumber` int DEFAULT NULL,
  `firstlineaddress` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`distributionID`),
  UNIQUE KEY `distributionID_UNIQUE` (`distributionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution`
--

LOCK TABLES `distribution` WRITE;
/*!40000 ALTER TABLE `distribution` DISABLE KEYS */;
INSERT INTO `distribution` VALUES (1,'Head Office',55,'Ridyard Street','M38 9LD','MAPS@gmail.com');
/*!40000 ALTER TABLE `distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` bigint DEFAULT NULL,
  `distributionID` int DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`),
  KEY `eID2dID_idx` (`distributionID`),
  CONSTRAINT `eID2dID` FOREIGN KEY (`distributionID`) REFERENCES `distribution` (`distributionID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Andrew Taylor','Andy@aol.com',1612882628,1),(2,'Ben Price','Ben@aol.com',1612882624,1),(3,'Fred Merdock','fred@gmail.com',779978114,1),(4,'Robert Agnew','robbo@gmail.com',785454455,1),(5,'Paul Agnew','aggie@gmail.com',788866453,1),(6,'Simon Agnew','SAgnew@talktalk.com',786365451,1),(7,'Jamie Taylor','TayTay@BT.com',787454666,1),(8,'Michael Wood','MJW@aol.com',746441343,1),(9,'James Kesley','Kezza@aol.com',1612662826,1),(10,'Paul Ipkiss','IppySnizz@aol.com',1617997878,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedepartment`
--

DROP TABLE IF EXISTS `employeedepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedepartment` (
  `employeedepartmentID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int DEFAULT NULL,
  `departmentID` int DEFAULT NULL,
  PRIMARY KEY (`employeedepartmentID`),
  UNIQUE KEY `employeedepartmentID_UNIQUE` (`employeedepartmentID`),
  KEY `ed2e_idx` (`employeeID`),
  KEY `ed2d_idx` (`departmentID`),
  CONSTRAINT `ed2d` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  CONSTRAINT `ed2e` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedepartment`
--

LOCK TABLES `employeedepartment` WRITE;
/*!40000 ALTER TABLE `employeedepartment` DISABLE KEYS */;
INSERT INTO `employeedepartment` VALUES (1,1,1),(2,1,3),(3,1,2),(4,2,4),(5,2,5),(6,2,1),(7,3,4),(8,3,3),(9,3,5),(10,4,4),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3),(16,6,1),(17,6,4),(18,6,5),(19,7,4),(20,7,1),(21,7,2),(22,8,3),(23,8,4),(24,8,5),(25,9,3),(26,9,2),(27,9,1),(28,10,3),(29,10,5),(30,10,1);
/*!40000 ALTER TABLE `employeedepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hire`
--

DROP TABLE IF EXISTS `hire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hire` (
  `hireID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  `toolID` int DEFAULT NULL,
  PRIMARY KEY (`hireID`),
  UNIQUE KEY `hireID_UNIQUE` (`hireID`),
  KEY `h2e_idx` (`employeeID`),
  KEY `h2t_idx` (`toolID`),
  CONSTRAINT `h2e` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `h2t` FOREIGN KEY (`toolID`) REFERENCES `tool` (`toolID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hire`
--

LOCK TABLES `hire` WRITE;
/*!40000 ALTER TABLE `hire` DISABLE KEYS */;
INSERT INTO `hire` VALUES (1,'2021-02-25',1,3),(5,'2021-06-19',2,15),(6,'2021-05-23',5,10),(7,'2022-01-01',6,16),(8,'2021-12-25',7,1),(9,'2021-11-24',10,25),(10,'2021-11-20',3,23),(11,'2021-11-16',2,21),(12,'2021-10-19',1,10),(13,'2022-01-07',8,15),(14,'2021-01-05',9,3),(15,'2021-04-06',6,4),(16,'2021-05-23',1,5),(17,'2021-05-23',2,4),(18,'2021-01-01',3,3),(19,'2020-01-16',4,2),(20,'2021-01-23',5,1),(21,'2021-01-24',1,6),(22,'2020-02-26',3,7),(23,'2020-02-27',4,6),(24,'2021-03-30',8,7),(25,'2020-07-15',9,8),(26,'2020-06-29',10,9),(27,'2020-05-30',1,14),(28,'2020-10-30',2,9),(29,'2021-11-03',3,8),(30,'2021-11-03',10,11),(31,'2020-10-30',3,12),(32,'2020-07-15',4,13),(33,'2021-11-03',5,17),(34,'2020-10-30',8,18),(35,'2021-03-30',9,19),(36,'2020-07-15',10,20),(37,'2021-11-03',2,22),(38,'2020-10-30',3,24),(39,'2021-05-23',4,25),(40,'2020-01-16',5,19);
/*!40000 ALTER TABLE `hire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query` (
  `queryID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  `visitorID` int DEFAULT NULL,
  `departmentID` int DEFAULT NULL,
  PRIMARY KEY (`queryID`),
  UNIQUE KEY `queryID_UNIQUE` (`queryID`),
  KEY `q2v_idx` (`visitorID`),
  KEY `q2d_idx` (`departmentID`),
  CONSTRAINT `q2d` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  CONSTRAINT `q2v` FOREIGN KEY (`visitorID`) REFERENCES `visitor` (`visitorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query`
--

LOCK TABLES `query` WRITE;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` VALUES (1,'my gutters','can you give quote for manchester area to clear gutters please? should be front and back of regular house',1,1),(2,'hi','hey, do you open weekends?',2,1),(3,'do you valet to Shefield?','see title',3,1),(4,'CarpetCleaning','hey, could you please advice if you clean carpets on site or away?',4,1),(5,'hey','do you have any jobs going?',5,1);
/*!40000 ALTER TABLE `query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `distributionID` int DEFAULT NULL,
  `departmentID` int DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  UNIQUE KEY `saleID_UNIQUE` (`itemID`),
  KEY `service2distribution_idx` (`distributionID`),
  KEY `service3department_idx` (`departmentID`),
  CONSTRAINT `service2distribution` FOREIGN KEY (`distributionID`) REFERENCES `distribution` (`distributionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `service3department` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Window',10.00,1,1),(2,'Patio',16.00,1,1),(3,'Upholdstry',17.00,1,1),(4,'Car',20.00,1,1),(5,'Hard Floor',17.00,1,1),(6,'Garden',12.00,1,4),(7,'Ruble',17.00,1,4),(8,'Bricks and Motar',18.00,1,4),(9,'Decorating Waste',16.00,1,4),(10,'Decking',13.00,1,4),(11,'Lawnmowering',22.99,1,2),(12,'General Gardening',25.99,1,2),(13,'Tree Removal',35.99,1,2),(14,'Digging',25.99,1,2),(15,'Returfing',36.99,1,2),(16,'Plastering',25.99,1,3),(17,'Scafhold Work',36.99,1,3),(18,'Flagging',25.99,1,3),(19,'Shed Building',25.99,1,3),(20,'Roofing Work',35.99,1,3),(21,'Guttering',25.99,1,5),(22,'Valet',35.99,1,5),(23,'Snow Removal',15.99,1,5),(24,'Taxi',15.99,1,5),(25,'Furniture Assembly',16.99,1,5);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplierID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `distributionID` int DEFAULT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE KEY `supplierID_UNIQUE` (`supplierID`),
  KEY `s2d_idx` (`distributionID`),
  CONSTRAINT `s2d` FOREIGN KEY (`distributionID`) REFERENCES `distribution` (`distributionID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Stax',1),(2,'Wilkos',1),(3,'Staples',1),(4,'BnM',1),(5,'Home Garden',1),(6,'Tesco',1),(7,'Letso',1),(8,'GardenShore',1),(9,'Bridgewater Supplies',1),(10,'Homebase',1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `toolID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`toolID`),
  UNIQUE KEY `toolID_UNIQUE` (`toolID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'Spade','Wilkinson'),(2,'Lawn Mower','Flymo'),(3,'Shears','supaTool'),(4,'Window Wiper','Bayer'),(5,'Hammer','Doff'),(6,'Nail Gun','Bayer'),(7,'Wheelbarrow','Flymo'),(8,'Ladders','Wilkinson'),(9,'Hedge Trimmer','Flymo'),(10,'Cement Mixer','supaTool'),(11,'Paint Brushes','supaTool'),(12,'Strimmer','Flymo'),(13,'Hacksaw','Wilkson'),(14,'Rotator Blade','Bayer'),(15,'Fork','Flymo'),(16,'Pothole Digger','supaTool'),(17,'Bypass Lopers','Flymo'),(18,'Pruning Shear','Flymo'),(19,'Paint Bucket','supaTool'),(20,'Paint Rollers','Wilkinson'),(21,'Painting Bench','supaTool'),(22,'Jigsaw','Wilkinson'),(23,'Bench','Wilkinson'),(24,'Brush','supaTool'),(25,'Vaccum Cleaner','Dyson');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicleID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `REG` varchar(10) DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`vehicleID`),
  UNIQUE KEY `vehicleID_UNIQUE` (`vehicleID`),
  KEY `e2v_idx` (`employeeID`),
  CONSTRAINT `e2v` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'Fiesta','Ford','BD52 RXZ',1),(2,'Skyline','Nissan','BZ51 SMR',3),(3,'Focus','Ford','HA14 0RD',4),(4,'Yaris','Toyta','MY02 ZR0',10),(5,'Qashqai','Nissan','Y0UR R3G',8);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `visitorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `telephone` bigint DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `distributionID` int DEFAULT NULL,
  PRIMARY KEY (`visitorID`),
  UNIQUE KEY `visitorID_UNIQUE` (`visitorID`),
  KEY `v2d_idx` (`distributionID`),
  CONSTRAINT `v2d` FOREIGN KEY (`distributionID`) REFERENCES `distribution` (`distributionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,'Mike',1612882628,'mikey85@aol.com',1),(2,'Andew',779978881,'Andew@aol.com',1),(3,'Alisa',778833311,'Alisa@gmail.com',1),(4,'Luda',1612666863,'Luda@outlook.com',1),(5,'Olga',1612828282,'Olga@outlook.com',1);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-08 14:22:15
