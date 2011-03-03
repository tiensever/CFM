-- MySQL dump 10.13  Distrib 5.5.8, for osx10.6 (i386)
--
-- Host: localhost    Database: movies_dev
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Hong Kong','2011-02-22 13:56:42','2011-02-22 13:56:42'),(2,'Chicago','2011-02-22 13:56:49','2011-02-22 13:56:49'),(3,'LA','2011-02-22 13:56:57','2011-02-22 13:56:57'),(4,'London','2011-02-22 13:57:28','2011-02-22 13:57:28'),(5,'Glendale California','2011-02-22 13:57:57','2011-02-22 13:57:57'),(6,'Downey California','2011-02-22 13:58:05','2011-02-22 13:58:05'),(7,'Culver City California','2011-02-22 13:58:12','2011-02-22 13:58:12'),(8,'Hai Phong','2011-02-23 05:00:58','2011-02-23 05:00:58'),(9,'Giang Coi City','2011-02-25 04:13:14','2011-02-25 04:13:14');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmings`
--

DROP TABLE IF EXISTS `filmings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmings`
--

LOCK TABLES `filmings` WRITE;
/*!40000 ALTER TABLE `filmings` DISABLE KEYS */;
INSERT INTO `filmings` VALUES (10,2,13,'2011-02-22 19:51:49','2011-02-22 19:51:49'),(11,1,13,'2011-02-22 19:53:10','2011-02-22 19:53:10'),(12,1,14,'2011-02-22 20:12:32','2011-02-22 20:12:32'),(14,1,15,'2011-02-22 20:39:51','2011-02-22 20:39:51'),(15,2,14,'2011-02-22 20:58:53','2011-02-22 20:58:53'),(16,2,15,'2011-02-22 21:11:01','2011-02-22 21:11:01'),(17,2,16,'2011-02-22 21:21:14','2011-02-22 21:21:14'),(18,3,14,'2011-02-22 21:39:54','2011-02-22 21:39:54'),(19,3,17,'2011-02-22 21:40:20','2011-02-22 21:40:20'),(20,3,18,'2011-02-22 23:01:59','2011-02-22 23:01:59'),(21,2,18,'2011-02-22 23:04:36','2011-02-22 23:04:36'),(22,2,18,'2011-02-22 23:04:37','2011-02-22 23:04:37'),(23,2,13,'2011-02-22 23:16:53','2011-02-22 23:16:53'),(24,2,19,'2011-02-22 23:17:28','2011-02-22 23:17:28'),(25,1,19,'2011-02-22 23:17:38','2011-02-22 23:17:38'),(26,1,20,'2011-02-22 23:22:51','2011-02-22 23:22:51'),(27,1,21,'2011-02-22 23:23:45','2011-02-22 23:23:45'),(28,3,22,'2011-02-23 05:01:19','2011-02-23 05:01:19'),(29,4,22,'2011-02-23 05:09:39','2011-02-23 05:09:39'),(30,3,17,'2011-02-23 05:15:11','2011-02-23 05:15:11'),(31,1,15,'2011-02-23 05:17:16','2011-02-23 05:17:16'),(32,5,14,'2011-02-23 05:23:07','2011-02-23 05:23:07'),(33,6,22,'2011-02-23 05:23:53','2011-02-23 05:23:53'),(34,6,22,'2011-02-23 05:25:53','2011-02-23 05:25:53'),(35,6,14,'2011-02-23 05:27:57','2011-02-23 05:27:57'),(36,6,13,'2011-02-23 05:28:05','2011-02-23 05:28:05'),(37,6,23,'2011-02-23 05:28:18','2011-02-23 05:28:18'),(38,2,13,'2011-02-25 04:23:40','2011-02-25 04:23:40');
/*!40000 ALTER TABLE `filmings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostings`
--

DROP TABLE IF EXISTS `hostings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostings`
--

LOCK TABLES `hostings` WRITE;
/*!40000 ALTER TABLE `hostings` DISABLE KEYS */;
INSERT INTO `hostings` VALUES (8,2,1,'2011-02-22 19:51:49','2011-02-22 19:51:49'),(9,1,1,'2011-02-22 19:53:10','2011-02-22 19:53:10'),(10,1,4,'2011-02-22 20:12:32','2011-02-22 20:12:32'),(12,1,6,'2011-02-22 20:39:51','2011-02-22 20:39:51'),(13,2,4,'2011-02-22 20:58:53','2011-02-22 20:58:53'),(14,2,6,'2011-02-22 21:11:01','2011-02-22 21:11:01'),(15,2,3,'2011-02-22 21:21:14','2011-02-22 21:21:14'),(16,2,3,'2011-02-22 21:26:09','2011-02-22 21:26:09'),(17,3,3,'2011-02-22 21:26:32','2011-02-22 21:26:32'),(18,3,4,'2011-02-22 21:39:54','2011-02-22 21:39:54'),(19,3,1,'2011-02-22 21:40:20','2011-02-22 21:40:20'),(20,1,2,'2011-02-22 23:16:09','2011-02-22 23:16:09'),(21,2,1,'2011-02-22 23:16:19','2011-02-22 23:16:19'),(22,2,1,'2011-02-22 23:16:53','2011-02-22 23:16:53'),(23,2,2,'2011-02-22 23:17:28','2011-02-22 23:17:28'),(24,1,2,'2011-02-22 23:17:38','2011-02-22 23:17:38'),(25,1,1,'2011-02-22 23:21:57','2011-02-22 23:21:57'),(26,1,1,'2011-02-22 23:22:51','2011-02-22 23:22:51'),(27,1,1,'2011-02-22 23:23:45','2011-02-22 23:23:45'),(28,3,8,'2011-02-23 05:01:19','2011-02-23 05:01:19'),(29,1,3,'2011-02-23 05:03:46','2011-02-23 05:03:46'),(30,4,4,'2011-02-23 05:04:13','2011-02-23 05:04:13'),(31,4,8,'2011-02-23 05:09:39','2011-02-23 05:09:39'),(32,3,1,'2011-02-23 05:15:11','2011-02-23 05:15:11'),(33,1,6,'2011-02-23 05:17:16','2011-02-23 05:17:16'),(34,5,4,'2011-02-23 05:20:24','2011-02-23 05:20:24'),(35,6,8,'2011-02-23 05:23:47','2011-02-23 05:23:47'),(36,6,8,'2011-02-23 05:25:53','2011-02-23 05:25:53'),(37,6,4,'2011-02-23 05:27:57','2011-02-23 05:27:57'),(38,6,1,'2011-02-23 05:28:05','2011-02-23 05:28:05'),(39,6,1,'2011-02-23 05:28:18','2011-02-23 05:28:18');
/*!40000 ALTER TABLE `hostings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Dark Night','2011-02-22 13:55:55','2011-02-22 13:55:55'),(2,'Pineapple Express','2011-02-22 13:56:08','2011-02-22 13:56:08'),(3,'Moi Tinh','2011-02-22 21:26:20','2011-02-22 21:26:20'),(4,'Co dau dai chien','2011-02-23 04:56:11','2011-02-23 04:56:11'),(5,'Than Chet','2011-02-23 05:19:59','2011-02-23 05:19:59'),(6,'Alice','2011-02-23 05:23:29','2011-02-23 05:23:29'),(7,'newnewnew','2011-02-25 03:30:21','2011-02-25 03:30:21');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (13,'Dong Bat',1,'2011-02-22 19:51:49','2011-02-22 19:51:49'),(14,'Van Chi',4,'2011-02-22 20:12:32','2011-02-22 20:12:32'),(15,'Dong Hoa',6,'2011-02-22 20:39:51','2011-02-22 20:39:51'),(18,'Nha Hoang',3,'2011-02-22 21:51:33','2011-02-22 21:51:33'),(19,'aaaaaa',2,'2011-02-22 23:17:14','2011-02-22 23:17:14'),(20,'bbbbbb',1,'2011-02-22 23:21:57','2011-02-22 23:21:57'),(21,'cccc',1,'2011-02-22 23:23:45','2011-02-22 23:23:45'),(22,'Kien An',8,'2011-02-23 05:01:19','2011-02-23 05:01:19'),(23,'Bach Thao',1,'2011-02-23 05:28:18','2011-02-23 05:28:18'),(24,'Ngo Quyen',8,'2011-02-23 05:29:22','2011-02-23 05:29:22');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110222135101'),('20110222135118'),('20110222135138'),('20110222140641'),('20110222140657');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-02-27 11:52:54
