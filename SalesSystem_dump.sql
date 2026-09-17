-- MySQL dump 10.13  Distrib 9.2.0, for macos15 (arm64)
--
-- Host: localhost    Database: SalesSystem
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Seamus','O\'Connor','12 Green Street, Dublin','seamus.oconnor@example.ie','0861234567'),(2,'Aoife','Murphy','45 Blue Road, Cork','aoife.murphy@example.ie','0859876543'),(3,'Ciaran','Kelly','78 Red Lane, Galway','ciaran.kelly@example.ie','0872345678'),(4,'Niamh','Walsh','90 Yellow Ave, Limerick','niamh.walsh@example.ie','0893456789'),(5,'Eoin','Byrne','102 Purple Blvd, Kilkenny','eoin.byrne@example.ie','0866543210'),(6,'Seamus','O\'Connor','12 Green Street, Dublin','seamus.oconnor@example.ie','0861234567'),(7,'Aoife','Murphy','45 Blue Road, Cork','aoife.murphy@example.ie','0859876543'),(8,'Ciaran','Kelly','78 Red Lane, Galway','ciaran.kelly@example.ie','0872345678'),(9,'Niamh','Walsh','90 Yellow Ave, Limerick','niamh.walsh@example.ie','0893456789'),(10,'Eoin','Byrne','102 Purple Blvd, Dublin','eoin.byrne@example.ie','0866543210');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerFeedback`
--

DROP TABLE IF EXISTS `CustomerFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerFeedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `comments` text NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `customerId` (`customerId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `customerfeedback_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `customerfeedback_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`),
  CONSTRAINT `customerfeedback_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerFeedback`
--

LOCK TABLES `CustomerFeedback` WRITE;
/*!40000 ALTER TABLE `CustomerFeedback` DISABLE KEYS */;
INSERT INTO `CustomerFeedback` VALUES (1,1,1,'Excellent service and product quality.',5),(2,2,2,'Delivery was slightly delayed.',3),(3,3,3,'Very satisfied with the order.',4),(4,4,4,'Product did not match the description.',2),(5,5,5,'Great experience overall.',5);
/*!40000 ALTER TABLE `CustomerFeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `deliveryId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `estimatedDeliveryTime` datetime NOT NULL,
  `trackingStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`deliveryId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,1,'2025-04-11 12:00:00','In Transit'),(2,2,'2025-04-12 15:30:00','Delivered'),(3,3,'2025-04-13 10:15:00','Delayed'),(4,4,'2025-04-14 09:00:00','Cancelled'),(5,5,'2025-04-15 18:45:00','Pending');
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `equipmentId` int NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(50) NOT NULL,
  `equipmentType` varchar(50) NOT NULL,
  `equipmentSpecifications` text NOT NULL,
  `quantityAvailable` int NOT NULL,
  `equipmentPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`equipmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'X-Ray Machine','Diagnostic','Digital X-Ray with high resolution',3,15000.00),(2,'MRI Scanner','Imaging','3 Tesla MRI system with advanced software',2,1200000.00),(3,'Ultrasound Machine','Diagnostic','Portable ultrasound with Doppler',5,25000.00),(4,'ECG Monitor','Monitoring','12-lead digital ECG monitor',10,5000.00),(5,'Ventilator','Respiratory','Modern ventilator for critical care',7,30000.00);
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FaultyItems`
--

DROP TABLE IF EXISTS `FaultyItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FaultyItems` (
  `faultId` int NOT NULL AUTO_INCREMENT,
  `equipmentId` int NOT NULL,
  `batchNumber` int NOT NULL,
  `faultDescription` text NOT NULL,
  `reportedDate` datetime NOT NULL,
  PRIMARY KEY (`faultId`),
  KEY `equipmentId` (`equipmentId`),
  CONSTRAINT `faultyitems_ibfk_1` FOREIGN KEY (`equipmentId`) REFERENCES `Equipment` (`equipmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FaultyItems`
--

LOCK TABLES `FaultyItems` WRITE;
/*!40000 ALTER TABLE `FaultyItems` DISABLE KEYS */;
INSERT INTO `FaultyItems` VALUES (6,1,1001,'Screen flickering issues','2025-04-10 08:30:00'),(7,2,1002,'Overheating during operation','2025-04-11 09:45:00'),(8,3,1003,'Battery failure under load','2025-04-12 10:15:00'),(9,4,1004,'Minor cosmetic defects','2025-04-13 11:00:00'),(10,5,1005,'Assembly error – parts missing','2025-04-14 12:20:00');
/*!40000 ALTER TABLE `FaultyItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderAndEquipment`
--

DROP TABLE IF EXISTS `OrderAndEquipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderAndEquipment` (
  `orderId` int NOT NULL,
  `equipmentId` int NOT NULL,
  PRIMARY KEY (`orderId`,`equipmentId`),
  KEY `equipmentId` (`equipmentId`),
  CONSTRAINT `orderandequipment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`),
  CONSTRAINT `orderandequipment_ibfk_2` FOREIGN KEY (`equipmentId`) REFERENCES `Equipment` (`equipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderAndEquipment`
--

LOCK TABLES `OrderAndEquipment` WRITE;
/*!40000 ALTER TABLE `OrderAndEquipment` DISABLE KEYS */;
INSERT INTO `OrderAndEquipment` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `OrderAndEquipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderReturns`
--

DROP TABLE IF EXISTS `OrderReturns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderReturns` (
  `returnId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `equipmentId` int NOT NULL,
  `reason` text NOT NULL,
  `orderReturnStatus` varchar(50) NOT NULL,
  `replacementRequested` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`returnId`),
  KEY `orderId` (`orderId`),
  KEY `equipmentId` (`equipmentId`),
  CONSTRAINT `orderreturns_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`),
  CONSTRAINT `orderreturns_ibfk_2` FOREIGN KEY (`equipmentId`) REFERENCES `Equipment` (`equipmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderReturns`
--

LOCK TABLES `OrderReturns` WRITE;
/*!40000 ALTER TABLE `OrderReturns` DISABLE KEYS */;
INSERT INTO `OrderReturns` VALUES (1,1,1,'Defective unit','Processed',1),(2,2,2,'Wrong item delivered','Pending',0),(3,3,3,'Damaged in transit','Processed',1),(4,4,4,'Customer changed mind','Completed',0),(5,5,5,'Late delivery','Pending',1);
/*!40000 ALTER TABLE `OrderReturns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `orderDate` datetime NOT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `orderStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2025-04-10 10:00:00',100.00,'Pending'),(2,2,'2025-04-11 11:30:00',250.50,'Shipped'),(3,3,'2025-04-12 14:15:00',300.00,'Delivered'),(4,4,'2025-04-13 09:45:00',150.75,'Cancelled'),(5,5,'2025-04-14 16:20:00',500.00,'Pending');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `reportId` int NOT NULL AUTO_INCREMENT,
  `reportType` varchar(50) NOT NULL,
  `reportData` text NOT NULL,
  `reportDate` datetime NOT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reports`
--

LOCK TABLES `Reports` WRITE;
/*!40000 ALTER TABLE `Reports` DISABLE KEYS */;
INSERT INTO `Reports` VALUES (1,'Daily','Sales increased by 5%','2025-04-10 23:59:59'),(2,'Weekly','New customers: 15','2025-04-11 23:59:59'),(3,'Monthly','Revenue up by 10%','2025-04-12 23:59:59'),(4,'Annual','Record profit for the year','2025-04-13 23:59:59'),(5,'Custom','Positive feedback from 80% of customers','2025-04-14 23:59:59');
/*!40000 ALTER TABLE `Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `staffId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `staffRole` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Brendan','Doyle','Manager','brendan.doyle@example.ie','0861112222'),(2,'Grainne','Foster','Sales','grainne.foster@example.ie','0873334444'),(3,'Kevin','Reilly','Tech','kevin.reilly@example.ie','0895556666'),(4,'Maeve','Ryan','Admin','maeve.ryan@example.ie','0857778888'),(5,'Conor','Smith','HR','conor.smith@example.ie','0869990000'),(6,'Brendan','Doyle','Manager','brendan.doyle@example.ie','0861112222'),(7,'Grainne','Foster','Sales','grainne.foster@example.ie','0873334444'),(8,'Kevin','Reilly','Tech','kevin.reilly@example.ie','0895556666'),(9,'Maeve','Ryan','Admin','maeve.ryan@example.ie','0857778888'),(10,'Conor','Smith','HR','conor.smith@example.ie','0869990000'),(11,'Brendan','Doyle','Manager','brendan.doyle@example.ie','0861112222'),(12,'Grainne','Foster','Sales','grainne.foster@example.ie','0873334444'),(13,'Kevin','Reilly','Tech','kevin.reilly@example.ie','0895556666'),(14,'Maeve','Ryan','Admin','maeve.ryan@example.ie','0857778888'),(15,'Conor','Smith','HR','conor.smith@example.ie','0869990000'),(16,'Brendan','Doyle','Manager','brendan.doyle@example.ie','0861112222'),(17,'Grainne','Foster','Sales','grainne.foster@example.ie','0873334444'),(18,'Kevin','Reilly','Tech','kevin.reilly@example.ie','0895556666'),(19,'Maeve','Ryan','Admin','maeve.ryan@example.ie','0857778888'),(20,'Conor','Smith','HR','conor.smith@example.ie','0869990000');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11  0:33:12
