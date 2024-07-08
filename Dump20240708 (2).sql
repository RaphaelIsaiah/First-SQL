CREATE DATABASE  IF NOT EXISTS `schooldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schooldb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb
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
-- Table structure for table `assemblyattendance`
--

DROP TABLE IF EXISTS `assemblyattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assemblyattendance` (
  `EntryID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `AssemblyDate` date NOT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int NOT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `assembly_student_fk_idx` (`StudentID`),
  KEY `assembly_staff_fk_idx` (`CreatedBy`),
  CONSTRAINT `assembly_staff_fk` FOREIGN KEY (`CreatedBy`) REFERENCES `staffinformation` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assembly_student_fk` FOREIGN KEY (`StudentID`) REFERENCES `studentinformation` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assemblyattendance`
--

LOCK TABLES `assemblyattendance` WRITE;
/*!40000 ALTER TABLE `assemblyattendance` DISABLE KEYS */;
INSERT INTO `assemblyattendance` VALUES (2,2,'2024-07-03','2024-07-08 13:13:13',1);
/*!40000 ALTER TABLE `assemblyattendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `assemblyattendance_AFTER_INSERT` AFTER INSERT ON `assemblyattendance` FOR EACH ROW BEGIN
INSERT INTO attendancedate(AttendanceDate,CreatedBy) VALUES (NEW.AssemblyDate,NEW.CreatedBy);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `attendance_student_view`
--

DROP TABLE IF EXISTS `attendance_student_view`;
/*!50001 DROP VIEW IF EXISTS `attendance_student_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendance_student_view` AS SELECT 
 1 AS `AttendanceID`,
 1 AS `StudentID`,
 1 AS `AssemblyDate`,
 1 AS `StudentName`,
 1 AS `Age`,
 1 AS `StudentCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `attendancedate`
--

DROP TABLE IF EXISTS `attendancedate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendancedate` (
  `EntryID` int NOT NULL AUTO_INCREMENT,
  `AttendanceDate` date NOT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int NOT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `attendancedate_staff_fk_idx` (`CreatedBy`),
  CONSTRAINT `attendance_staff_fk` FOREIGN KEY (`CreatedBy`) REFERENCES `staffinformation` (`EntryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendancedate`
--

LOCK TABLES `attendancedate` WRITE;
/*!40000 ALTER TABLE `attendancedate` DISABLE KEYS */;
INSERT INTO `attendancedate` VALUES (1,'2024-07-03','2024-07-08 13:13:13',1);
/*!40000 ALTER TABLE `attendancedate` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50003 DROP FUNCTION IF EXISTS `addition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `addition`(num1 int, num2 int) RETURNS int
BEGIN
DECLARE num3 int;
SELECT num1+num2 INTO num3;
RETURN num3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `attendance_student_view`
--

/*!50001 DROP VIEW IF EXISTS `attendance_student_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_student_view` AS select `a`.`EntryID` AS `AttendanceID`,`s`.`EntryID` AS `StudentID`,`a`.`AssemblyDate` AS `AssemblyDate`,`s`.`StudentName` AS `StudentName`,`s`.`Age` AS `Age`,`s`.`StudentCode` AS `StudentCode` from (`assemblyattendance` `a` join `studentinformation` `s` on((`a`.`StudentID` like `s`.`EntryID`))) */;
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

-- Dump completed on 2024-07-08 17:48:57
