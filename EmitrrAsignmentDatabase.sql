-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: emitrrdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `answerlist`
--

DROP TABLE IF EXISTS `answerlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answerlist` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Marks` int NOT NULL,
  `OptionId` int DEFAULT NULL,
  `QuesionId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OptionId` (`OptionId`),
  KEY `QuesionId` (`QuesionId`),
  CONSTRAINT `answerlist_ibfk_1` FOREIGN KEY (`OptionId`) REFERENCES `optionstable` (`Id`),
  CONSTRAINT `answerlist_ibfk_2` FOREIGN KEY (`QuesionId`) REFERENCES `questions` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answerlist`
--

LOCK TABLES `answerlist` WRITE;
/*!40000 ALTER TABLE `answerlist` DISABLE KEYS */;
INSERT INTO `answerlist` VALUES (1,2,2,1),(2,1,8,2),(3,1,9,3);
/*!40000 ALTER TABLE `answerlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languagelsit`
--

DROP TABLE IF EXISTS `languagelsit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languagelsit` (
  `Id` int NOT NULL,
  `Language_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languagelsit`
--

LOCK TABLES `languagelsit` WRITE;
/*!40000 ALTER TABLE `languagelsit` DISABLE KEYS */;
INSERT INTO `languagelsit` VALUES (1,'Angular'),(2,'Java'),(3,'NodeJS'),(4,'HTML');
/*!40000 ALTER TABLE `languagelsit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionstable`
--

DROP TABLE IF EXISTS `optionstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionstable` (
  `Id` int NOT NULL,
  `OptionsString` varchar(255) DEFAULT NULL,
  `QuestionId` int DEFAULT NULL,
  `LanguageId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `QuestionID_idx` (`QuestionId`),
  KEY `LanguageId_idx` (`LanguageId`),
  CONSTRAINT `optionstable_ibfk_1` FOREIGN KEY (`LanguageId`) REFERENCES `languagelsit` (`Id`),
  CONSTRAINT `QuestionID` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionstable`
--

LOCK TABLES `optionstable` WRITE;
/*!40000 ALTER TABLE `optionstable` DISABLE KEYS */;
INSERT INTO `optionstable` VALUES (1,'Java Framework',1,1),(2,'Javascript Framework',1,1),(3,'HTML Framework',1,1),(4,'SQL Framework',1,1),(5,'@Output()',2,1),(6,'@Input()',2,1),(7,'@Event()',2,1),(8,'@HostListener()',2,1),(9,'True',3,2),(10,'False',3,2);
/*!40000 ALTER TABLE `optionstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `Id` int NOT NULL,
  `questionsString` varchar(255) DEFAULT NULL,
  `LanguageId` int DEFAULT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LanguageId_idx` (`LanguageId`),
  CONSTRAINT `LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languagelsit` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'AngularJS is a ',1,'checkbox'),(2,'Which Angular decorator is used to listen to DOM events?',1,'radio'),(3,'Java program processing always starts with main() method',2,'radio');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentexamdetails`
--

DROP TABLE IF EXISTS `studentexamdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentexamdetails` (
  `Id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `LangId` int DEFAULT NULL,
  `QuesId` int DEFAULT NULL,
  `ansId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentexamdetails`
--

LOCK TABLES `studentexamdetails` WRITE;
/*!40000 ALTER TABLE `studentexamdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentexamdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `roleid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pratikkore@gmail.com','1234',1),(2,'xyz@gmail.com','1234',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'emitrrdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-23 15:43:28
