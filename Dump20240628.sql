-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
create database if not exists schooldb;
use schooldb;
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `staffinformation`
--

DROP TABLE IF EXISTS `staffinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffinformation` (
  `EntryID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(145) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EntryID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffinformation`
--

LOCK TABLES `staffinformation` WRITE;
/*!40000 ALTER TABLE `staffinformation` DISABLE KEYS */;
INSERT INTO `staffinformation` VALUES (1,'Suleiman Hayat Tuge','hsmltuge','hsmltuge','2024-06-28 15:26:23'),(3,'Gloria Omale','go1234','go1234','2024-06-28 15:41:16');
/*!40000 ALTER TABLE `staffinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentclasses`
--

DROP TABLE IF EXISTS `studentclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentclasses` (
  `EntryID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(145) NOT NULL,
  `Status` tinyint DEFAULT '1' COMMENT '1 = Active, 2 = Not Active',
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  UNIQUE KEY `ClassName_UNIQUE` (`ClassName`),
  KEY `staff_student_fk_idx` (`CreatedBy`),
  CONSTRAINT `staff_student_fk` FOREIGN KEY (`CreatedBy`) REFERENCES `staffinformation` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentclasses`
--

LOCK TABLES `studentclasses` WRITE;
/*!40000 ALTER TABLE `studentclasses` DISABLE KEYS */;
INSERT INTO `studentclasses` VALUES (1,'JSS 1',1,'2024-06-28 15:05:52',1),(2,'JSS 2',1,'2024-06-28 15:06:27',1),(3,'JSS 3',1,'2024-06-28 15:07:25',1),(8,'SS 1',1,'2024-06-28 15:42:49',3),(9,'SS 2',1,'2024-06-28 15:43:54',3),(10,'SS 3',1,'2024-06-28 15:43:54',3);
/*!40000 ALTER TABLE `studentclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentinformation`
--

DROP TABLE IF EXISTS `studentinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentinformation` (
  `EntryID` int NOT NULL AUTO_INCREMENT,
  `ClassID` int NOT NULL,
  `StudentCode` varchar(11) NOT NULL,
  `StudentName` varchar(145) NOT NULL,
  `Age` int NOT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  UNIQUE KEY `StudentCode_UNIQUE` (`StudentCode`),
  KEY `student_class_fk_idx` (`ClassID`),
  KEY `student_staff_fk_idx` (`CreatedBy`),
  CONSTRAINT `student_class_fk` FOREIGN KEY (`ClassID`) REFERENCES `studentclasses` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_staff_fk` FOREIGN KEY (`CreatedBy`) REFERENCES `staffinformation` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinformation`
--

LOCK TABLES `studentinformation` WRITE;
/*!40000 ALTER TABLE `studentinformation` DISABLE KEYS */;
INSERT INTO `studentinformation` VALUES (1,1,'245363452','God\'stime Okeke',11,'2024-06-28 16:12:30',1),(2,2,'456343524','Fatima Ali Maikudi',9,'2024-06-28 16:12:30',3),(3,1,'366324523','Stella Maris',10,'2024-06-28 16:12:30',1),(4,9,'232254252','Chimezie',17,'2024-06-28 16:12:30',3);
/*!40000 ALTER TABLE `studentinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'schooldb'
--

--
-- Dumping routines for database 'schooldb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 16:17:53
