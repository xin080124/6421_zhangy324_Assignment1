-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(10) NOT NULL DEFAULT '0',
  `book_name` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (11,'c sharp 1'),(12,'c sharp 2'),(71,'agile book 1'),(72,'agile book2');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `execution_id` int(10) NOT NULL DEFAULT '0',
  `testplan_id` int(10) NOT NULL DEFAULT '0',
  `tcversion_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
INSERT INTO `cfield_execution_values` VALUES (10,1,1,1,'qwreqwer');
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(10) NOT NULL DEFAULT '0',
  `course_name` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'C#'),(7,'agile');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `number` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (34,'\0','2017-09-04');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_courses`
--

DROP TABLE IF EXISTS `person_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_courses` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_courses`
--

LOCK TABLES `person_courses` WRITE;
/*!40000 ALTER TABLE `person_courses` DISABLE KEYS */;
INSERT INTO `person_courses` VALUES (1,1),(8,1),(8,7);
/*!40000 ALTER TABLE `person_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_courses_books`
--

DROP TABLE IF EXISTS `recommend_courses_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend_courses_books` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`course_id`,`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_courses_books`
--

LOCK TABLES `recommend_courses_books` WRITE;
/*!40000 ALTER TABLE `recommend_courses_books` DISABLE KEYS */;
INSERT INTO `recommend_courses_books` VALUES (1,1,11),(1,1,71),(1,1,72),(1,7,71);
/*!40000 ALTER TABLE `recommend_courses_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_books_notes`
--

DROP TABLE IF EXISTS `student_books_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_books_notes` (
  `note_id` int(10) NOT NULL AUTO_INCREMENT,
  `person_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_books_notes`
--

LOCK TABLES `student_books_notes` WRITE;
/*!40000 ALTER TABLE `student_books_notes` DISABLE KEYS */;
INSERT INTO `student_books_notes` VALUES (1,8,71,'hhhhhhhhh'),(2,8,72,'ttttttttt'),(3,2,71,'sssssss'),(4,8,71,'haha'),(5,8,71,'haha1002'),(6,8,71,'haha1003'),(7,8,71,'haha1005'),(8,8,71,'welcome adding notes 1028\r\n'),(9,8,71,'welcome adding notes dsfgsdfgdfgw  3333333\r\n');
/*!40000 ALTER TABLE `student_books_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses_books`
--

DROP TABLE IF EXISTS `student_courses_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courses_books` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`course_id`,`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses_books`
--

LOCK TABLES `student_courses_books` WRITE;
/*!40000 ALTER TABLE `student_courses_books` DISABLE KEYS */;
INSERT INTO `student_courses_books` VALUES (8,7,71),(8,7,72);
/*!40000 ALTER TABLE `student_courses_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` char(8) NOT NULL,
  `passcode` char(8) NOT NULL,
  `userflag` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin123',0,0),('alan','1',1,1),('yx','2',2,8);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-15 15:10:24
