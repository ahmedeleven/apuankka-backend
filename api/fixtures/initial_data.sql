-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: apuankka
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `api_interest`
--

DROP TABLE IF EXISTS `api_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_interest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chosen` tinyint(1) NOT NULL,
  `service_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_interest_service_id_0b74ac18_fk_api_service_id` (`service_id`),
  KEY `api_interest_user_id_7050e18c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_interest_service_id_0b74ac18_fk_api_service_id` FOREIGN KEY (`service_id`) REFERENCES `api_service` (`id`),
  CONSTRAINT `api_interest_user_id_7050e18c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_interest`
--

LOCK TABLES `api_interest` WRITE;
/*!40000 ALTER TABLE `api_interest` DISABLE KEYS */;
INSERT INTO `api_interest` VALUES (1,1,3,2),(3,0,3,23),(4,0,2,23),(34,0,3,4),(35,0,3,15),(36,1,3,19),(37,0,3,22),(40,0,3,24),(49,0,1,3),(50,0,5,3),(51,0,10,3);
/*!40000 ALTER TABLE `api_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_service`
--

DROP TABLE IF EXISTS `api_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `date` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `user_id` int NOT NULL,
  `fee` int NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_service_user_id_ae2d71d6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_service_user_id_ae2d71d6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_service`
--

LOCK TABLES `api_service` WRITE;
/*!40000 ALTER TABLE `api_service` DISABLE KEYS */;
INSERT INTO `api_service` VALUES (1,'first service','this is the first service',NULL,NULL,2,0,'open'),(2,'updated for the first user','updated for the first user description modified date with fee','2023-09-23','2023-09-25',2,20,'done'),(3,'first service second user updated again','this is the first service for second user','2023-09-23',NULL,3,0,'open'),(4,'check response','add service to check response data','2023-10-06',NULL,3,25,'open'),(5,'add service from the app','testing adding a service from the app','2023-10-06',NULL,24,15,'open'),(6,'Request new service','request a new service using the app','2023-10-06',NULL,3,10,'open'),(7,'new request display','new request to be displayed directly','2023-10-06',NULL,3,20,'open'),(8,'Test more requests','Test more requests','2023-10-06',NULL,4,10,'open'),(9,'add another service','add another service','2023-10-06',NULL,4,5,'open'),(10,'remove the alert message','adding service after removing alert message','2023-10-06',NULL,4,1,'open'),(11,'test success border','test success border after adding a new service','2023-10-06','2023-10-06',4,5,'cancel'),(12,'test success border','test success border from another user','2023-10-06',NULL,19,10,'open'),(13,'test success class name','test success class name','2023-10-06',NULL,19,5,'open'),(14,'try again','it did not work so i am trying again','2023-10-06',NULL,19,5,'open'),(15,'test','test test test','2023-10-06',NULL,19,10,'open'),(16,'test test test3','test test test test test','2023-10-06',NULL,19,1,'open'),(17,'test success class name','test success class name to be hidden after 3 seconds','2023-10-06','2023-10-06',3,10,'done'),(18,'test test test','test test test test test','2023-10-06',NULL,3,5,'open'),(19,'add new service','adding a new service','2023-10-06','2023-10-06',3,10,'open');
/*!40000 ALTER TABLE `api_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userprofile`
--

DROP TABLE IF EXISTS `api_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) DEFAULT NULL,
  `user_id` int NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `api_userprofile_user_id_5a1c1c92_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userprofile`
--

LOCK TABLES `api_userprofile` WRITE;
/*!40000 ALTER TABLE `api_userprofile` DISABLE KEYS */;
INSERT INTO `api_userprofile` VALUES (1,'0401234567',2,'profile_pictures/Email-Icon-White-on-Grey_W2d0ern.png',NULL,NULL),(2,'04111112111',3,'profile_pictures/apuankka-avatar.jpg','First Last','I want to change the world but they wouldn\'t give me the source code.'),(3,'0412344422',23,'profile_pictures/Email-Icon-White-on-Grey_ZywIqO5.png',NULL,'I want to change the world but they wouldn\'t give me the source code.'),(5,NULL,24,'',NULL,NULL),(6,NULL,19,'profile_pictures/provider-internet_XYtusCZ.png',NULL,NULL);
/*!40000 ALTER TABLE `api_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add user profile',9,'add_userprofile'),(34,'Can change user profile',9,'change_userprofile'),(35,'Can delete user profile',9,'delete_userprofile'),(36,'Can view user profile',9,'view_userprofile'),(37,'Can add service',10,'add_service'),(38,'Can change service',10,'change_service'),(39,'Can delete service',10,'delete_service'),(40,'Can view service',10,'view_service'),(41,'Can add interest',11,'add_interest'),(42,'Can change interest',11,'change_interest'),(43,'Can delete interest',11,'delete_interest'),(44,'Can view interest',11,'view_interest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$Ntkf5vW0Z1oGg5Tkdczjml$3jQzHZr/T/frRBtCBzbkS/U0BZMtbAMio0UR0ol9bdM=',NULL,1,'admin','','','',1,1,'2023-09-21 12:40:31.364940'),(2,'pbkdf2_sha256$720000$RkuCekl0WxywuADg6kxoBg$HT0DSL6eMmYW/8YBPhkjKUb2CuktOwJObXrCpoawTfE=','2023-10-05 09:52:31.823882',0,'user1','','','example@example.com',0,1,'2023-09-22 09:42:39.477876'),(3,'pbkdf2_sha256$720000$Mgiq7PtGLnAfhoEL7kDu6c$8uCGSNOdB+qecIXTI9BYEHw/l88uGHSMrmGo6ERojps=','2023-10-09 14:44:13.441284',0,'user2','','','example@example.com',0,1,'2023-09-22 12:19:59.723394'),(4,'pbkdf2_sha256$720000$q1PtrLUEF5JPO14GpXW9P7$Xa0i0jhILnqzH3Ri9MvWv6fthuY7ghQdTCx5TeflEEQ=','2023-10-06 14:38:58.431294',0,'user5','','','user5@example.com',0,1,'2023-09-28 10:46:58.106463'),(7,'pbkdf2_sha256$720000$WrWRli5vn0heARXNO4KIQP$4r3fQcGVnWglsbbAHtM/CRFo0XFUNSJmDL7iHW7UFN4=',NULL,0,'user4','','','example@example.com',0,1,'2023-09-28 10:54:30.974090'),(15,'pbkdf2_sha256$720000$mFXyxuWISZKZrEvZ80Q2Vo$zLgUjaB7/cLbu59rn1rmojw5CxM5Cct1KDUpoyP4J38=','2023-10-03 13:47:45.267792',0,'user6','','','user6@example.com',0,1,'2023-09-28 11:08:36.289015'),(16,'pbkdf2_sha256$720000$YF9Bp7e73BF0MzyekvuhLY$Ap422AxmFYdile4+DHvpIqguraofKiz95wFQroHus4o=',NULL,0,'user7','','','user7@example.com',0,1,'2023-09-28 11:08:58.850232'),(17,'pbkdf2_sha256$720000$RYGCJU5uvERpZu9EUPEyGu$CQPB8XFBzPVxtoGMupYumR47G4NBxLxvKBEte2yYzng=',NULL,0,'user8','','','user8@example.com',0,1,'2023-09-28 11:09:57.335164'),(18,'pbkdf2_sha256$720000$mTU4FzWYrI1kET5FgyiJcT$8m+qj6tjVzcqdX4D1+Yii77wQH7g4gpz+csqQcTZPJ4=',NULL,0,'user9','','','user9@example.com',0,1,'2023-09-28 11:13:17.628725'),(19,'pbkdf2_sha256$720000$jysGwIdEExt2QsCmiFDGga$1ZMsnnGfZh/pIdmLrb6r2HlVSoLPr+X8BXKPE6Q9zj0=','2023-10-09 14:18:59.296869',0,'user10','','','user10@example.com',0,1,'2023-09-28 11:17:55.692052'),(20,'pbkdf2_sha256$720000$rr0h0ncqQTsHMcUYty9g2d$Bx5L8cjx51HxTc0o3DTU8s1l0dK1HQvItvuFuikv0kU=',NULL,0,'user11','','','user11@example.com',0,1,'2023-09-28 11:57:52.863392'),(21,'pbkdf2_sha256$720000$vlrpWcw2jkmZcRIiX7XrpX$+F/JK2EX6MbQXcLZEmaoIHNAbhUBinc0oQoYrXt35ik=',NULL,0,'user13','','','user13@example.com',0,1,'2023-09-28 11:59:25.315848'),(22,'pbkdf2_sha256$720000$WgkNwrz6FKqRKTdkvQSdks$AmVaFLNzdsyaORTTzcxNzyUynOphg35Bw+xJNegWF4w=','2023-10-03 13:48:22.659609',0,'user15','','','example@example.com',0,1,'2023-09-29 12:01:27.119446'),(23,'pbkdf2_sha256$720000$zw34Sft6xasWKHoTji5lJ2$YkPpedgGADze+WfweSbxoVI4Y4g98qFvow+fNcNT84c=','2023-10-06 08:29:45.560260',0,'user16','','','example@example.com',0,1,'2023-10-01 09:11:42.776516'),(24,'pbkdf2_sha256$720000$GRkZVqB6Q7mZjAie8OMCKP$PoGopzsC6PwaDscQdQBbgK3EDUI1HOgX1NtvdTQc/uE=','2023-10-06 08:30:11.866573',0,'user17','','','example@example.com',0,1,'2023-10-05 08:20:33.475385');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('295963037d02cfff9b7c07255fd76a3553daee89','2023-09-22 12:20:00.122618',3),('3c8fcc1557a240c560a03fe73892acb348a41f2e','2023-10-01 09:11:43.182557',23),('44a782ba35656567967e124b6b76c72a99f53ae3','2023-09-28 11:59:25.751678',21),('50debe8de2fada64e2f9912d98c44715d3660152','2023-09-28 11:09:57.771675',17),('70d9296349c5e0a142831b64a197c9665a30c9b0','2023-09-28 11:08:36.705399',15),('80c3daa422f99fd36cb24df8e0fbe27b7f728aa0','2023-10-05 08:20:33.905981',24),('91487ca4200413b0e5f8c5dfd98e49e3e4adee86','2023-09-28 11:08:59.276579',16),('97b520cb84f85d2d99e0b4e4dd6117fdd08c5ca7','2023-09-28 11:13:18.063761',18),('a4aece07940968b5bbe3c293f5738ac05ddec40a','2023-09-28 11:57:53.283727',20),('a7711936b867914e7b19ac2266fd277c23d487c7','2023-09-28 11:17:56.108867',19),('c4dd5ae0adb2dfb1e9148a08f799bddf0f6b960d','2023-09-28 10:54:31.408770',7),('e39520e9124e2a9e4d4d7d1e0fe6060d84063852','2023-09-22 09:42:39.904646',2),('f373974f48409e75b2710f1a20efdca9d4d495ec','2023-09-29 12:01:27.527516',22),('ff858f25cbc9a4aa4f2b0140a72ba76675455ca1','2023-09-28 10:46:58.526487',4);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'api','interest'),(10,'api','service'),(9,'api','userprofile'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-21 12:22:08.389957'),(2,'auth','0001_initial','2023-09-21 12:22:08.587526'),(3,'admin','0001_initial','2023-09-21 12:22:08.639749'),(4,'admin','0002_logentry_remove_auto_add','2023-09-21 12:22:08.646292'),(5,'admin','0003_logentry_add_action_flag_choices','2023-09-21 12:22:08.653560'),(6,'contenttypes','0002_remove_content_type_name','2023-09-21 12:22:08.691514'),(7,'auth','0002_alter_permission_name_max_length','2023-09-21 12:22:08.720038'),(8,'auth','0003_alter_user_email_max_length','2023-09-21 12:22:08.735495'),(9,'auth','0004_alter_user_username_opts','2023-09-21 12:22:08.741845'),(10,'auth','0005_alter_user_last_login_null','2023-09-21 12:22:08.768468'),(11,'auth','0006_require_contenttypes_0002','2023-09-21 12:22:08.770632'),(12,'auth','0007_alter_validators_add_error_messages','2023-09-21 12:22:08.779099'),(13,'auth','0008_alter_user_username_max_length','2023-09-21 12:22:08.810363'),(14,'auth','0009_alter_user_last_name_max_length','2023-09-21 12:22:08.836993'),(15,'auth','0010_alter_group_name_max_length','2023-09-21 12:22:08.853135'),(16,'auth','0011_update_proxy_permissions','2023-09-21 12:22:08.860421'),(17,'auth','0012_alter_user_first_name_max_length','2023-09-21 12:22:08.888709'),(18,'sessions','0001_initial','2023-09-21 12:22:08.907459'),(19,'authtoken','0001_initial','2023-09-22 09:30:56.343448'),(20,'authtoken','0002_auto_20160226_1747','2023-09-22 09:30:56.376698'),(21,'authtoken','0003_tokenproxy','2023-09-22 09:30:56.379118'),(22,'api','0001_initial','2023-09-22 10:00:21.088807'),(23,'api','0002_service','2023-09-23 08:55:09.688222'),(24,'api','0003_alter_service_date_alter_service_modified','2023-09-23 09:11:46.105586'),(25,'api','0004_alter_service_description','2023-09-23 10:43:19.331825'),(26,'api','0005_service_fee','2023-09-25 10:24:25.898576'),(27,'api','0006_service_status','2023-09-25 11:58:39.791944'),(28,'api','0007_interest','2023-09-25 13:25:46.686760'),(29,'api','0008_userprofile_profile_picture','2023-10-01 10:41:09.958893'),(30,'api','0009_userprofile_full_name','2023-10-02 06:41:01.550359'),(31,'api','0010_userprofile_bio','2023-10-04 07:58:52.623226');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01jtaccliles010cl8vv29kde6hvd86o','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qneHk:33b7jFLrf5gi7g-ppm-6VYa13OD4bQV9APTZfx4vD_s','2023-10-17 12:13:56.660926'),('0mo5q45q3ap9fuj192nbf0mq6w9hffhz','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qohWW:TpV6Ss029_MXD1nn6Bwe67gBp_GEEgx27ptOEWZ1XS0','2023-10-20 09:53:32.960764'),('204r64ez8clge7ya1x6k9cw86shwsup6','.eJxVjDsOwjAQBe_iGlnrBGObkj5niPZnHECJFCcV4u7IUgpo38y8txlx38q4V13HSczVnM3pdyPkp84NyAPn-2J5mbd1ItsUe9Bqh0X0dTvcv4OCtbT6AgjaJY4BYw6S0Hl0SRMzRnaCCh0S9RSgyx5yz4GcQADvI4iK-XwBBFA4rQ:1qmUma:8xqDSgaZ3O3UKB4F3T2I88nBOfQ85ROP1PmIgK_i0mg','2023-10-14 07:53:00.819428'),('2uqh64siu8o51r580cnf6u0nx1lv1ps1','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnCdD:D2ZAW6r9nu9TfdEWHM-2PyusoD07_N_dMxPs7A8jHD8','2023-10-16 06:42:15.279869'),('33xji5ek7gwynlpk2ozs11qvq2qs6atc','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmYCw:OVlceGW_XrJc0a2KTD_ADYh0vpm-H32qi1pl3NWqb_M','2023-10-14 11:32:26.146067'),('36rqs51yxj3u9tsw28hw6p6zdijcviof','.eJxVjEEOwiAURO_C2hAQCnyX7j0Dgc9HqgaS0q6Md5cmXehy5r2ZN_NhW4vfOi1-TuzCzoqdfssY8El1J-kR6r1xbHVd5sh3hR-081tL9Loe7t9BCb2M9aSkcCSztEGCAiOd1mAsZURBFoQTKHJ2g-FkjQ5kNQGIiIR2JGCfL95AN5Q:1qneG2:LCW0wBK6tkx8CcCsX04_tC1gAe11sJR8c1jcZUSzuXk','2023-10-17 12:12:10.382071'),('4cttmpmbuvak3aox3nft57ifprfhl9bk','.eJxVjDsOwjAQBe_iGlnrBGObkj5niPZnHECJFCcV4u7IUgpo38y8txlx38q4V13HSczVnM3pdyPkp84NyAPn-2J5mbd1ItsUe9Bqh0X0dTvcv4OCtbT6AgjaJY4BYw6S0Hl0SRMzRnaCCh0S9RSgyx5yz4GcQADvI4iK-XwBBFA4rQ:1qoi9D:MmSPP2o3iC57RnbSg9XnSklBpMF_hUnqefbW1B2Xl54','2023-10-20 10:33:31.881361'),('4ps29cfnvqlu8oq8qsb5u06inp81s2gn','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qncOv:TiYEQJ7vkQHg7zF7DYSFBbai8X6a-vSL9Iilc3BxVWM','2023-10-17 10:13:13.964782'),('4z66z3maezlxzkn3rup3swfynefllipq','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnJGh:IOycLCru37CYmi_l0_Bz-vmbY38Vsfiie2PYwJfRrEw','2023-10-16 13:47:27.210313'),('6qlvfklw7crs5bkf1vukodido5eo9i9t','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qolzF:Wmg3Y3iR0nbfLbWRTcPi8aqQ6RfTCBtR_y6TLrrQYxA','2023-10-20 14:39:29.307275'),('7546kamssj8nmegmh4pcik18ly36dgdy','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qma0u:oCmMJwJgDOQ8tPYdUknZ5HnnNwl56szSe6xpbGQBxaM','2023-10-14 13:28:08.383101'),('77tqyab8ju1kb8z8nxqiphxo9gufxx9u','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnflO:ZRufEFFLA6fdp8FzZkkznT1vfWKE_xnp2C0OdUc74uI','2023-10-17 13:48:38.154084'),('7oogwleah5fphw7q25p6vnqvbjs7kyxh','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnH7m:N5XD_O0Jcv9i5ihSo4ibD-d72NLqAI-5jDHICsMHtN4','2023-10-16 11:30:06.080198'),('85hdl8r6ws5m3tktsjvge2xg86t36laa','.eJxVjLEOwjAMRP8lM4qUYJzAyM43RI4dkwJKpaadEP9OK3WA4ZZ77-5tEi1zTUsvUxrEXIw3h98uEz9L24A8qN1Hy2ObpyHbTbE77fY2Snldd_fvoFKv65r1nFFCQBLwwArkkQAdnHyJQaMvTrygxCM41shljapGJIroGMznC_itOKw:1qoL1z:Ltmj8LOSIyiod8pnhZigncfyyuoLXb1g-xAMuvyl22M','2023-10-19 09:52:31.826234'),('8wey4kejuwoctvzhan5oia6r3y5w03yl','.eJxVjEEOwiAURO_C2hAQCnyX7j0Dgc9HqgaS0q6Md5cmXehy5r2ZN_NhW4vfOi1-TuzCzoqdfssY8El1J-kR6r1xbHVd5sh3hR-081tL9Loe7t9BCb2M9aSkcCSztEGCAiOd1mAsZURBFoQTKHJ2g-FkjQ5kNQGIiIR2JGCfL95AN5Q:1qnDcc:O_jfk1ViQPbuoaKbahsj03VT_ZN8C02UrKRO4GXoB7M','2023-10-16 07:45:42.952119'),('99s4j71slcqjtzmh91qvzady2p5cz51q','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoLty:7jcHsLeXQybo71ntGQVRsLJLJKE6g6DK4NaUH_KVa88','2023-10-19 10:48:18.122063'),('cbarti84tw23ok5x0kyrxazqkc9hureq','.eJxVjEEOwiAURO_C2hAQCnyX7j0Dgc9HqgaS0q6Md5cmXehy5r2ZN_NhW4vfOi1-TuzCzoqdfssY8El1J-kR6r1xbHVd5sh3hR-081tL9Loe7t9BCb2M9aSkcCSztEGCAiOd1mAsZURBFoQTKHJ2g-FkjQ5kNQGIiIR2JGCfL95AN5Q:1qogDR:eu6E2yaS6Wt-jiDGd00XhfNCNST0emj-yuoFjPkd8vw','2023-10-20 08:29:45.562449'),('co2qy9k3ty80laq6ayzk2g3q3y7n8q8e','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnC2E:sQMF1u2HrS1UMuJBWsmb_XlzsXsQX7jSDBgsAmU-Gcg','2023-10-16 06:04:02.260244'),('dqfx1r9x6bswvcjyb3j6ydmyx854l4xx','.eJxVjEEOwiAQRe_C2hCmMBRcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEW4MXpd4yUHtx2ku_UbrNMc1uXKcpdkQft8jpnfl4O9--gUq_fWmunvAJji0EdEQZrvC1DQTNG8jlxcmS1RyAzWmBCUBGIlGMHBamI9wfZ0Ddz:1qoiHa:lt-qkZ9QUTrMGu4wWfr3dgpi8E7d76r-Y8X9nNHqB8I','2023-10-20 10:42:10.168744'),('eto6jbqn1za0n3wsf24w75qazvs5c7n4','.eJxVjDsOwjAQBe_iGlnrBGObkj5niPZnHECJFCcV4u7IUgpo38y8txlx38q4V13HSczVnM3pdyPkp84NyAPn-2J5mbd1ItsUe9Bqh0X0dTvcv4OCtbT6AgjaJY4BYw6S0Hl0SRMzRnaCCh0S9RSgyx5yz4GcQADvI4iK-XwBBFA4rQ:1qmVbl:IoUdrtnA5gyXF1X5ChM3R3XS7pXZYebaehyMdJFxrgU','2023-10-14 08:45:53.220304'),('gl070jmn64lcavveiahw08uyskb2sfnn','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoigr:LQDI0VlcvaJfGDG6evp6HnNXOKQnd40dd6ApXANUJ30','2023-10-20 11:08:17.858534'),('h3tql3xsy6nvmvki4e19wlif3ztjptp6','.eJxVjMsOwiAQRf-FtSEMr4JL934DGQaQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYEzszMOz0O0akR247SXdst86pt3WZI98VftDBrz3l5-Vw_w4qjvqtSVgTEzoF3soCUkk_SXAaLQjvtAVjlMqknfMJREmgjYCJCgoLTpBi7w_JOzZK:1qnfkX:uRU9tkHmQWvNhzxOQK8_9oHnwQP884vz9fM10KeAcq0','2023-10-17 13:47:45.270473'),('h9dqj0cpjai7bg2ayn8qwa9jmreiyisu','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmDBt:gPF_X2K8cg_vFM0PdvfTisMdGuBSuf4BMXZ__-dNDLw','2023-10-13 13:05:57.261733'),('i55glpi3wm0qfbesvvl6venn5x3bb9kr','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoKgb:mXNLa78bFgFdcXnm2MQHLkGhMw59mqK726BqRIbZuYA','2023-10-19 09:30:25.808142'),('jmbgwqsop8c3gjuk1qi7j20ixahwkywp','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmCd1:A8BIH-LWOFJQMujLyKD2b-EQbKbnedMA7f5oIt3aR6Y','2023-10-13 12:29:55.701313'),('kbs4ethrulyxhcgryn90bd4esolcz7rq','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoOYN:lkzQUpKDRAvRMrTarVSrflbIlDfV36UuLNZlwmcxXlA','2023-10-19 13:38:11.136963'),('mkl5lfplirm9edckjmqtj3dklfbbpf0c','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qprUT:iLJHQA3l3wRUgJT4wjQM-9ZrZ6ZljulLa7YQJz1LUvk','2023-10-23 14:44:13.443871'),('nc82tp1jfxdts3zi69b58qvwfes5kutw','.eJxVjDsOwjAQBe_iGlnrBGObkj5niPZnHECJFCcV4u7IUgpo38y8txlx38q4V13HSczVnM3pdyPkp84NyAPn-2J5mbd1ItsUe9Bqh0X0dTvcv4OCtbT6AgjaJY4BYw6S0Hl0SRMzRnaCCh0S9RSgyx5yz4GcQADvI4iK-XwBBFA4rQ:1qolyk:xVimAEUfaYfHDcZpwvnS5MF6Cj5Wg3sEX8qvkWVi3Vs','2023-10-20 14:38:58.434846'),('npf30nuu01nskdesh4ey2jrulo9p4bd5','.eJxVjDsOwjAQBe_iGln2xusPJT1nsNY_HEC2FCcV4u4QKQW0b2bei3na1uq3kRc_J3ZmoNjpdwwUH7ntJN2p3TqPva3LHPiu8IMOfu0pPy-H-3dQadRvPRlwljACkDQIyriMRk9SWIPFUqYii9MIsgQpJ4GpRCOyUAgOYyTN3h_W7jcZ:1qogDr:EV3urD7eaoBzpcaUNPKVRDZpLlmaff6dcATPRDxIAtM','2023-10-20 08:30:11.868960'),('ohm64cr1qe9hobiil3v4bcx115mzrqmx','.eJxVjEEOwiAQRe_C2hCmMBRcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEW4MXpd4yUHtx2ku_UbrNMc1uXKcpdkQft8jpnfl4O9--gUq_fWmunvAJji0EdEQZrvC1DQTNG8jlxcmS1RyAzWmBCUBGIlGMHBamI9wfZ0Ddz:1qpr63:Z_N4qIi7ZDUXcnzJhH0KTWAXXhuDWzkGdT0w6JBfM3A','2023-10-23 14:18:59.299153'),('qs8mrbzj5nb13iwgj4lwdxo73bphi9a1','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qogCd:xjYNjY0kCz4FA0gpMoY7JcLiwZAjzIQV9RGIcRQVRnc','2023-10-20 08:28:55.314814'),('r2sh4zqw3jmvcs2etvjgm6bmy8907ro9','.eJxVjEEOwiAQRe_C2hCmMBRcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEW4MXpd4yUHtx2ku_UbrNMc1uXKcpdkQft8jpnfl4O9--gUq_fWmunvAJji0EdEQZrvC1DQTNG8jlxcmS1RyAzWmBCUBGIlGMHBamI9wfZ0Ddz:1qnfkp:x0x7ul_h7jTJoeoymbkDe3R04Pmg9ebfRvKvjvnE1Zo','2023-10-17 13:48:03.535562'),('r7w29wbelqqzw1btz93o1lh6o9nycwvs','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmXt2:2O4BI-yOJmTgGiNwkAgejpY-HR9qXPyrmDaAeax3OGQ','2023-10-14 11:11:52.651961'),('s0jwiuhsggcxxzmpmpxnquqre37zsap0','.eJxVjLEOwjAMRP8lM4qUYJzAyM43RI4dkwJKpaadEP9OK3WA4ZZ77-5tEi1zTUsvUxrEXIw3h98uEz9L24A8qN1Hy2ObpyHbTbE77fY2Snldd_fvoFKv65r1nFFCQBLwwArkkQAdnHyJQaMvTrygxCM41shljapGJIroGMznC_itOKw:1qnH5K:OiHxDbB-JH--exaCzyU61Mrb7WK4-L2AMR2PBVKVlFM','2023-10-16 11:27:34.545090'),('sb6pwoi56w4zc72umwzmm4kuid7cov0x','.eJxVjEEOwiAURO_C2hAQCnyX7j0Dgc9HqgaS0q6Md5cmXehy5r2ZN_NhW4vfOi1-TuzCzoqdfssY8El1J-kR6r1xbHVd5sh3hR-081tL9Loe7t9BCb2M9aSkcCSztEGCAiOd1mAsZURBFoQTKHJ2g-FkjQ5kNQGIiIR2JGCfL95AN5Q:1qmuf0:HX7zL-rNHc1lamXpnClxtFCyJN8-cYecgqihhVJJAto','2023-10-15 11:30:54.677497'),('si5yas3audaec6dytnfr918pygpumxwq','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qnD0e:OPmn3WxkLjYe-DKIEG9DJrqXPeqKx9C_Olt4O-fo9y0','2023-10-16 07:06:28.608619'),('sqzuh7x6k1f1zs59x9rog5pp5blolapm','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoJaU:M63trpUppRQRC6SLwgqRAmdM1JxClt373cUBoOrNIEE','2023-10-19 08:20:02.474031'),('t27iollda3e4qkpq34lt2nikz33g9ewt','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qohuY:41AIvoYIaAJJThWhd4SE5Wl25M2-ZtsjIEBLU70EZV8','2023-10-20 10:18:22.145467'),('toqyiihft7chl3b90il99maiolksyn4y','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qma18:zD3YkQwYtiuweelo_ULPBkh0oQoV7pT3rr2N-BFj5UE','2023-10-14 13:28:22.510167'),('uppthqnmp0bc40czz2vilwqx3r4sprwb','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmZns:I53RsQqBIJhZIfSwyeVoZR5DIOm9icHySfWIB_h9q2s','2023-10-14 13:14:40.856210'),('uzbyzm71txcjwoteorvdzwnf26j3q3r3','.eJxVjLEOwjAMRP8lM4qUYJzAyM43RI4dkwJKpaadEP9OK3WA4ZZ77-5tEi1zTUsvUxrEXIw3h98uEz9L24A8qN1Hy2ObpyHbTbE77fY2Snldd_fvoFKv65r1nFFCQBLwwArkkQAdnHyJQaMvTrygxCM41shljapGJIroGMznC_itOKw:1qjeEm:4V-SWF0KZFd_MhdbKuRaqOQoGmkqK2l0PJHYparLT1U','2023-10-06 11:22:20.718734'),('v83x4jys3rxessm6k6l9bi7xz53exttt','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qoJbO:dTS-9jE9ByGygYDt0sQ9KmQarO4jegQtOYRq7s86SbU','2023-10-19 08:20:58.015705'),('w37jp43zgi0jtql26ra2qgqwlodkzf3d','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qms5t:T0wDpclTT5xTH5y0m2Vq4J5E2ESTZauUtPzcpX0eGgs','2023-10-15 08:46:29.805228'),('w99any57uk5e20qjb8qehhvjizjuz246','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmwEe:x8W3qlRplDmdYFkF3lyZO7XGz9v2tExhL_xKofOrO9I','2023-10-15 13:11:48.353513'),('wlkozta5eboq3bp1oqrobemb8s41vg8z','.eJxVjDsOwjAQBe_iGlnrBGObkj5niPZnHECJFCcV4u7IUgpo38y8txlx38q4V13HSczVnM3pdyPkp84NyAPn-2J5mbd1ItsUe9Bqh0X0dTvcv4OCtbT6AgjaJY4BYw6S0Hl0SRMzRnaCCh0S9RSgyx5yz4GcQADvI4iK-XwBBFA4rQ:1qnfUx:vPQLZcbx_vzmt2X0eCdLAz0mOgYYeK9Sgbnr1X3y1VA','2023-10-17 13:31:39.445030'),('wzws5lvj1p8rhatj930efzzmbcgw1o7c','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qmDCa:rQq4woRwzjk8fZeEJRB-Z0NdqrG5ZeBLasHFtfAIs1Q','2023-10-13 13:06:40.674046'),('xya4cju6nudbn9fic25y7k2i11ta7wf5','.eJxVjDsOwjAQBe_iGln-xpiSnjNYu941DiBHipMKcXcSKQW0b-bNWyRYl5rWznMaSVyEMeL0OyLkJ7ed0APafZJ5ass8otwVedAubxPx63q4f4EKvW7vs3FATgOr4KPVJWoKNrLHiDiQi2jZ2UJgFFJBrbaysbYMWTOAhyA-Xw9tON0:1qnfl8:tKmoo5d5iQ5v1po0g4qMGbX7GznQVO0QkVk4qDQPXYg','2023-10-17 13:48:22.661948'),('yi7x3gpbv2nx1cl9yy7ebi6vithn323l','.eJxVjDsOwyAQBe9CHSHw8k2Z3mdALKyDkwgkY1dR7h5bcpG0b2bem4W4rSVsnZYwZ3ZlwC6_G8b0pHqA_Ij13nhqdV1m5IfCT9r52DK9bqf7d1BiL3uNTlg0DtKU9JCtIhBRa4vKCBelFjJLqwdHQiEY6wkNyMmDp11xwmn2-QLG_za9:1qo3dP:y772phXYTzwNRqHtjsdn5ACfd-Rg7Vv_YQE6hnr-FnM','2023-10-18 15:17:59.607627');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-09 19:24:23
