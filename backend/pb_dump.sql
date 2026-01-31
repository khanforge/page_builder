-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: pagebuilder_db
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.22.04.2

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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add page',7,'add_page'),(26,'Can change page',7,'change_page'),(27,'Can delete page',7,'delete_page'),(28,'Can view page',7,'view_page'),(29,'Can add component',8,'add_component'),(30,'Can change component',8,'change_component'),(31,'Can delete component',8,'delete_component'),(32,'Can view component',8,'view_component'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add sub component',10,'add_subcomponent'),(38,'Can change sub component',10,'change_subcomponent'),(39,'Can delete sub component',10,'delete_subcomponent'),(40,'Can view sub component',10,'view_subcomponent'),(41,'Can add content block',11,'add_contentblock'),(42,'Can change content block',11,'change_contentblock'),(43,'Can delete content block',11,'delete_contentblock'),(44,'Can view content block',11,'view_contentblock'),(45,'Can add contact',12,'add_contact'),(46,'Can change contact',12,'change_contact'),(47,'Can delete contact',12,'delete_contact'),(48,'Can view contact',12,'view_contact'),(49,'Can add icon',13,'add_icon'),(50,'Can change icon',13,'change_icon'),(51,'Can delete icon',13,'delete_icon'),(52,'Can view icon',13,'view_icon'),(53,'Can add link',14,'add_link'),(54,'Can change link',14,'change_link'),(55,'Can delete link',14,'delete_link'),(56,'Can view link',14,'view_link'),(57,'Can add stat',15,'add_stat'),(58,'Can change stat',15,'change_stat'),(59,'Can delete stat',15,'delete_stat'),(60,'Can view stat',15,'view_stat');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$PKzzc2p1Ms1jjTm1JvCKFU$eBU2dtDR/Q3gvuweUAyFMoRfTA1Zwt+hrECDm593t6E=','2026-01-30 16:59:41.000000',1,'anurag','Anurag','Singh','anuragsg@nitdelhi.ac.in',1,1,'2026-01-30 16:58:06.000000'),(2,'pbkdf2_sha256$1000000$meYt7fbtUx9jesSL63fkYt$KVzW17dIpmHH6+Uy191mIFpqQbpAtOt4JHYlA3msvzs=',NULL,1,'parvej','','','1999monustp@gmail.com',1,1,'2026-01-31 11:40:45.630519');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `common_contact`
--

DROP TABLE IF EXISTS `common_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `value` varchar(200) NOT NULL,
  `order` smallint NOT NULL,
  `profile_id` int NOT NULL,
  `icon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `common_contact_profile_id_878e3424_fk_page_builder_profile_id` (`profile_id`),
  KEY `common_contact_icon_id_bbd8ed00_fk_common_icon_id` (`icon_id`),
  CONSTRAINT `common_contact_icon_id_bbd8ed00_fk_common_icon_id` FOREIGN KEY (`icon_id`) REFERENCES `common_icon` (`id`),
  CONSTRAINT `common_contact_profile_id_878e3424_fk_page_builder_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `page_builder_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_contact`
--

LOCK TABLES `common_contact` WRITE;
/*!40000 ALTER TABLE `common_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_icon`
--

DROP TABLE IF EXISTS `common_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_icon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_icon`
--

LOCK TABLES `common_icon` WRITE;
/*!40000 ALTER TABLE `common_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_link`
--

DROP TABLE IF EXISTS `common_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_link`
--

LOCK TABLES `common_link` WRITE;
/*!40000 ALTER TABLE `common_link` DISABLE KEYS */;
INSERT INTO `common_link` VALUES (1,'Linked In','https://www.linkedin.com/in/anurag-singh-67b19719/');
/*!40000 ALTER TABLE `common_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_stat`
--

DROP TABLE IF EXISTS `common_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_stat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `value` varchar(200) NOT NULL,
  `order` smallint NOT NULL,
  `icon_id` int DEFAULT NULL,
  `link_id` int DEFAULT NULL,
  `profile_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_stat_icon_id_4fa00683_fk_common_icon_id` (`icon_id`),
  KEY `common_stat_link_id_5977e33f_fk_common_link_id` (`link_id`),
  KEY `common_stat_profile_id_2ac67252_fk_page_builder_profile_id` (`profile_id`),
  CONSTRAINT `common_stat_icon_id_4fa00683_fk_common_icon_id` FOREIGN KEY (`icon_id`) REFERENCES `common_icon` (`id`),
  CONSTRAINT `common_stat_link_id_5977e33f_fk_common_link_id` FOREIGN KEY (`link_id`) REFERENCES `common_link` (`id`),
  CONSTRAINT `common_stat_profile_id_2ac67252_fk_page_builder_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `page_builder_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_stat`
--

LOCK TABLES `common_stat` WRITE;
/*!40000 ALTER TABLE `common_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_stat` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-01-30 17:06:42.034652','1','anurag-1',2,'[{\"changed\": {\"fields\": [\"Image badge\", \"Designation\", \"Organisation\", \"Org short name\", \"Address\"]}}]',9,1),(2,'2026-01-30 17:19:55.862196','1','anurag-1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(3,'2026-01-30 17:20:16.827396','1','anurag',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'common','contact'),(13,'common','icon'),(14,'common','link'),(15,'common','stat'),(5,'contenttypes','contenttype'),(8,'page_builder','component'),(11,'page_builder','contentblock'),(7,'page_builder','page'),(9,'page_builder','profile'),(10,'page_builder','subcomponent'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-01-30 16:56:49.120864'),(2,'auth','0001_initial','2026-01-30 16:56:50.926130'),(3,'admin','0001_initial','2026-01-30 16:56:51.424573'),(4,'admin','0002_logentry_remove_auto_add','2026-01-30 16:56:51.489650'),(5,'admin','0003_logentry_add_action_flag_choices','2026-01-30 16:56:51.505368'),(6,'contenttypes','0002_remove_content_type_name','2026-01-30 16:56:51.807984'),(7,'auth','0002_alter_permission_name_max_length','2026-01-30 16:56:52.002226'),(8,'auth','0003_alter_user_email_max_length','2026-01-30 16:56:52.089660'),(9,'auth','0004_alter_user_username_opts','2026-01-30 16:56:52.111094'),(10,'auth','0005_alter_user_last_login_null','2026-01-30 16:56:52.306881'),(11,'auth','0006_require_contenttypes_0002','2026-01-30 16:56:52.312114'),(12,'auth','0007_alter_validators_add_error_messages','2026-01-30 16:56:52.329192'),(13,'auth','0008_alter_user_username_max_length','2026-01-30 16:56:52.518265'),(14,'auth','0009_alter_user_last_name_max_length','2026-01-30 16:56:52.726712'),(15,'auth','0010_alter_group_name_max_length','2026-01-30 16:56:52.802615'),(16,'auth','0011_update_proxy_permissions','2026-01-30 16:56:52.819680'),(17,'auth','0012_alter_user_first_name_max_length','2026-01-30 16:56:53.023012'),(18,'common','0001_initial','2026-01-30 16:56:53.238740'),(19,'page_builder','0001_initial','2026-01-30 16:56:55.424542'),(20,'common','0002_initial','2026-01-30 16:56:56.541047'),(21,'sessions','0001_initial','2026-01-30 16:56:56.701857');
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
INSERT INTO `django_session` VALUES ('eu5ybmjo4qd00ea7thxap6lhqoloq004','.eJxVjEEOwiAQRe_C2hCGQqe4dN8zkIEZpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uzAnX63RLlh9Qd8J3qbdZ5rusyJb0r-qBNjzPL83K4fweFWvnW1kE2OYE4I9YyIkEn6F0IJgceeoAreMLMvQvkrBAOCX0i7Mgab1m9P83zN2A:1vlrqP:2kTSmhKSg3huwPBFXaPz2iMpBAyTxYlA8XWOR8-6B-I','2026-02-13 16:59:41.494365');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_component`
--

DROP TABLE IF EXISTS `page_builder_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `order` smallint NOT NULL,
  `layout` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_builder_component_page_id_1b92fc1a_fk_page_builder_page_id` (`page_id`),
  KEY `page_builder_component_slug_34afe7df` (`slug`),
  CONSTRAINT `page_builder_component_page_id_1b92fc1a_fk_page_builder_page_id` FOREIGN KEY (`page_id`) REFERENCES `page_builder_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_component`
--

LOCK TABLES `page_builder_component` WRITE;
/*!40000 ALTER TABLE `page_builder_component` DISABLE KEYS */;
INSERT INTO `page_builder_component` VALUES (1,'Research Summary','research-summary',0,'default',1,1),(2,'Areas of Interest','areas-of-interest',0,'default',1,1),(3,'Teaching and Mentoring','teaching-and-mentoring',0,'default',1,1),(4,'Research Areas','research-areas',0,'default',1,1),(5,'Recent Publications','recent-publications',0,'publications',1,1),(7,'Miscellaneous links','miscellaneous-links',0,'default',1,1),(8,'Biography','biography',0,'default',1,2),(9,'Educational','educational',0,'timeline',1,2),(10,'Awards & Grants','awards-grants',0,'publications',1,2),(11,'Book Chapters','book-chapters',0,'default',1,2),(12,'Sponsored Projects','sponsored-projects',0,'default',1,2),(16,'Journal Publications','journal-publications',0,'publications',1,2),(17,'Conference Papers','conference-papers',0,'publications',1,2),(18,'Presentations & Talks Delivered','presentations-talks-delivered',0,'default',1,2),(19,'Teaching Experience','teaching-experience-1',0,'default',1,3),(20,'Courses','courses',0,'default',1,3),(21,'Collaborations','collaborations',0,'publications',1,4),(22,'Students','students',0,'publications',1,4),(23,'Memberships','memberships',0,'publications',1,5),(24,'Professional Activities','professional-activities',0,'publications',1,5),(25,'Test','test',0,'default',1,6);
/*!40000 ALTER TABLE `page_builder_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_component_link`
--

DROP TABLE IF EXISTS `page_builder_component_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_component_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component_id` int NOT NULL,
  `link_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_builder_component_link_component_id_link_id_c673dcbb_uniq` (`component_id`,`link_id`),
  KEY `page_builder_component_link_link_id_46b6fb7f_fk_common_link_id` (`link_id`),
  CONSTRAINT `page_builder_compone_component_id_f1c3fbb3_fk_page_buil` FOREIGN KEY (`component_id`) REFERENCES `page_builder_component` (`id`),
  CONSTRAINT `page_builder_component_link_link_id_46b6fb7f_fk_common_link_id` FOREIGN KEY (`link_id`) REFERENCES `common_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_component_link`
--

LOCK TABLES `page_builder_component_link` WRITE;
/*!40000 ALTER TABLE `page_builder_component_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_builder_component_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_contentblock`
--

DROP TABLE IF EXISTS `page_builder_contentblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_contentblock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_type` varchar(50) NOT NULL,
  `data` json DEFAULT NULL,
  `order` smallint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `subcomponent_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_builder_content_subcomponent_id_23a8c0f0_fk_page_buil` (`subcomponent_id`),
  CONSTRAINT `page_builder_content_subcomponent_id_23a8c0f0_fk_page_buil` FOREIGN KEY (`subcomponent_id`) REFERENCES `page_builder_subcomponent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_contentblock`
--

LOCK TABLES `page_builder_contentblock` WRITE;
/*!40000 ALTER TABLE `page_builder_contentblock` DISABLE KEYS */;
INSERT INTO `page_builder_contentblock` VALUES (1,'text','\"I study the structure and dynamics of large networks, with a particular emphasis on information propagation and information control over it with and without Community Structure. I also study the modelling of large dynamic communication networks and its performance. Link prediction in monoplex and multiplex networks.\"',0,1,1),(2,'text','\"Machine Learning, Intelligent Transportation System, Federated Learning, Video Analysis, Video Captioning, Networks, Network Reconstruction, Social Network Analysis, Complex Networks, Graph Spectra, Time Varying Networks, Recommender Systems, Opinion Dynamics, Data Analytics, Mathematical Modeling of Epidemic Spreading, Efficient routing in Communication Networks.\"',0,1,2),(3,'text','\"I have teaching experience at both undergraduate and graduate level. Initially, I was a lecturer at Ajay Kumar Garg Engineering College, Ghaziabad, India and assistant professor at Maharaja Agrasen Institute of Technology, Delhi, India. Later, as a teaching assistant and tutor during my Ph.D. at Indian Institute of Technology Kanpur, India and Indian Institute of Technology Rajasthan, India. After my Ph.D. I had joined PDPM Indian Institute of Information Technology, Manufacturing and Design, Jabalpur, India and later at National Institute of Technology Delhi, India. I have taught courses ranging from the introductory level to specialized courses in computer science and engineering and Mathematics. Currently, I am mentoring graduate, master and undergraduate students at National Institute of Technology Delhi India. In addition, I am supervising Ph.D. students in NIT Delhi India.\"',0,1,3),(4,'text','\"Information dynamics in correlated and uncorrelated Complex networks, Inoculation of nodes in Complex Networks, Dynamics on Networks using the community structure of Complex Networks, Epidemic modeling over human contact networks, Data Analytics, Video Captioning, Network Reconstruction\"',0,1,4),(5,'list','[\"B. Sajja and A. Singh, \\\"Detection of Violent Content in Videos Using Attention-Augmented\\n        3-D Convolutional\\n        Networks,\\\"\\n        IEEE MultiMedia, vol. 32, no. 1, pp. 72-82, 2025-02-20, doi:\\n        10.1109/MMUL.2025.3544110.\", \"Prasad, R., Kumar, P., Singh, A. et al.\\n        Trend Analysis of Extreme Wind and Wave Height at Key Port Locations Along the Indian\\n        Coastline.\\n        Thalassas 41(1) Page No: 1-23, 2024-11-06.\", \"Kamlesh Kumar Saha, Prashant Kumar, Anurag Singh, Bahareh Kamranzad, Ian R. Young,\\n        Rajni,\\n        Assessment and future projections of storm surge using CMIP6 models in the Indo-Pacific\\n        region,\\n        Ocean Modelling, Volume 196, 2025.\", \"Jha, Aarya, Anurag Singh, Ankur Kumar Singhal, and Pradumn Kumar Pandey.\\n        \\\"Extending Opinion Changing Rate model to world of higher order interactions.\\\"\\n        Chaos, Solitons & Fractals 204 (2026): 117654.\", \"N. Sinha and A. Singh,\\n        \\\"Opinion Dynamics & Synchronization in Higher-Order Networks: Using the Kuramoto\\n        Model and Simplicial\\n        Complexes,\\\"\\n        2024 International Conference on Artificial Intelligence and Emerging Technology\\n            (Global AI Summit),\\n        Greater Noida, India, 2024, pp. 630-635 (Best Paper Award).\", \"B. Chakraborty and A. Singh,\\n        \\\"An End-to-End Vision-Based Approach for Indian Sign Language Recognition and\\n        Captioning,\\\"\\n        2025 IEEE International Conference on Computer, Electronics, Electrical Engineering\\n            & their Applications\\n            (IC2E3),\\n        Srinagar Garhwal, India, 2025, pp. 1-6, doi: 10.1109/IC2E365635.2025.11167226.\", \"A. Kumar and A. Singh,\\n        \\\"Smart Precision Farming: A Water Efficient Irrigation System,\\\"\\n        2025 International Conference on Electronics, AI and Computing (EAIC),\\n        Jalandhar, India, 2025, pp. 1-6, doi: 10.1109/EAIC66483.2025.11101486.\", \"Tyagi, D., Singh, A., Cherifi, H. (2025).\\n        MAVS: An Ensemble-Based Multi-agent Framework for Fake News Detection.\\n        In: Paszynski, M., Barnard, A.S., Zhang, Y.J. (eds)\\n        Computational Science – ICCS 2025 Workshops. ICCS 2025.\\n        Lecture Notes in Computer Science, vol 15908. Springer, Cham.\\n        https://doi.org/10.1007/978-3-031-97557-8_20.\", \"V. Sharma, B. Chakraborty, A. Singh and A.S. Chauhan,\\n        \\\"Integrating Skeleton Graphs with Transformers for Gloss-Free Indian Sign Language\\n        Captioning\\\",\\n        14th International Conference on Computational Data and Social Networks,\\n        2025, Springer, Danang, Vietnam (Accepted for presentation and publication).\", \"A. K. Singhal and A. Singh,\\n        \\\"Integrating Network-Derived Metrics: A Feature Augmentation Framework for Improved\\n        Prediction,\\\"\\n        14th International Conference on Computational Data and Social Networks,\\n        2025, Springer, Danang, Vietnam (Accepted for presentation and publication).\"]',0,1,5),(10,'text','\"Dr. Anurag Singh is an Associate Professor in the Department of Computer Science and Engineering at the National Institute of Technology (NIT) Delhi. He has previously served as the Dean of Research and Consultancy and as the Head of the Department (HoD) at NIT Delhi. Dr. Singh earned his Ph.D. from the Indian Institute of Technology (IIT) Kanpur, further solidifying his expertise and commitment to academic excellence.\"',0,1,10),(11,'text','\"Dr. Singh\'s primary research interests span a diverse range of areas, including Network Theory, Dynamics on and of Networks, Epidemic Modeling, Synchronization, Artificial Intelligence (AI) and Machine Learning (ML), Quantum Networks, Video Captioning, and Time-Varying Networks. His research work has made significant contributions to the field, reflecting his deep knowledge and innovative approach to complex problems.\"',0,1,11),(12,'text','\"With extensive teaching experience at both the undergraduate and graduate levels, Dr. Singh has taught courses ranging from foundational subjects to advanced, specialized topics in computer science, engineering, and mathematics. He is dedicated to mentoring students and currently guides graduate, master\'s, and undergraduate students at NIT Delhi. He has also supervised numerous Ph.D. students, with ongoing supervision of several candidates as well. He has been invited as Keynote speakers in various reputed international conferences like Complex Networks, Cambridge University, UK, Game Theory and Management 2025 Conference in Saint Petersburg, Russia. He is also the Founder and Promoter of the startup, Palanam Technology Pvt. Ltd. which works in the direction of Video Analytics. Recently this startup is recognized as one of the outstanding startups for the breakthrough solutions in SPRINT – North Edition, a flagship initiative under 100 Startups, 100 Days Mission! by AWaDH IIT Ropar and DST. He is also a Senior IEEE member and Fellow of the Soft Computing Research Society.\"',0,1,12),(13,'text','\"Dr. Singh\'s academic portfolio includes approximately 90 publications in leading journals and conferences, highlighting his thought leadership and extensive contributions to research. His 3 patents are published in his various research domains. He has successfully completed three research projects funded by the Department of Science and Technology (DST), one of which involved collaboration with a startup. Presently, he is working on a project supported by the Ministry of Earth Sciences and the Technology Innovation Hub (TIH) at IIT Patna, AWaDH IIT Ropar and the Indian Sign Language project funded by DST reflecting his ongoing dedication to impactful research and innovation.\"',0,1,13),(23,'list','[\"The grant of Rs 34,00,000 sanctioned for the project titled <b>“Empowering\\n                communication Video Captioning of Indian Sign\\n                Language”</b> by <b>Cognitive Science Research Initiative (CSRI)\\n                DST</b>.\", \"<p>MATRICS, SERB, DST Project on <b>\\\"Mathematical Model for Multidimensional\\n                    Multilayer Networks Using Quantum Mechanics\\\"</b> started from Feb\\n                20., 2020 and completed (Rs 6,60,000 for 3 years)\\n            </p>\", \"<p>MARICS SERB: A special call on COVID 19 modelling, <b>\\\"Development of Dynamic Mathematical Modeling for COVID-19 Spread and                                                     Containment\\\"</b> is accepted for MATRICS, SERB, DST. (Rs 5,50,000 for 1 year, completed, July 2020, July 2021).  </p>\", \"<p> A startup grant of Rs 10,00,000 received in 2022 from TIH IIT Patna and\\n                a company, <b>\\\"Palanan Technology Pvt. Ldiv.\\\"</b> is established for\\n                video analytics project.</p>\", \"<p> Received Rs 1,18,00,000 under <b>FIST 2023</b> program as Co-PI. </p>\", \"<p> INCOIS Project on <b>\\\"Extended Forecast of Wind-wave Parameters along\\n                    the Indian Coastline using Multi-tasking Machine-learning\\n                    Techniques\\\"</b> (Rs. 17,31, 000 Ongoing). </p>\", \"<p>Project titled <b>\\\"Design and Development of an IOT based Hybrid System\\n                    for accurate detection of distinct soil parameters to monitor the\\n                    water and fertilizer operation in the Agricultural fields\\\"</b> has\\n                been granted under SPRINT - Ideathon initiative, AWaDH IIT Ropar with\\n                grant of Rs. 7 lakhs. (Ongoing from March 2025).</p>\", \"<p>Project titled <b>\\\"TraceBite: Representing traceability and integrity in\\n                    every bite of food\\\"</b> has been granted under SPRINT - Ideathon\\n                initiative, AWaDH IIT Ropar with grant of Rs. 2.5 lakhs. (Ongoing\\n                from March 2025).</p>\"]',0,1,23),(24,'numbered_list','[\"<p>Anurag Singh, Y N Singh <b>\\\"Rumor Dynamics and Inoculation of the Nodes in Complex Networks\\\"</b> book chapter entitled \\\"Complex Networks and their applications\\\" by Cambridge Scholars Publishing, January 2014.</p>\", \"<p>Niranjan, Utkarsh, Anurag Singh, and Ramesh Kumar Agrawal. <b>\\\"Competitive Novel Dual Rumour Diffusion Model.\\\"</b> New Perspectives and Challenges in Econophysics and Sociophysics. Springer, Cham, 2019. 229-240.</p>\"]',0,1,24),(71,'list','[\"<b>Jha</b>, <b>Aarya</b>, <b>Anurag Singh</b>, <b>Ankur Kumar Singhal</b>, and <b>Pradumn Kumar Pandey</b>. \\\"Extending Opinion Changing Rate model to world of higher order interactions.\\\" <i>Chaos, Solitons &amp; Fractals 204 (2026)</i>: 117654.\", \"<b>Sunil</b>, <b>Anushka</b>, <b>Prashant Kumar</b>, <b>Anurag Singh</b>, <b>Ankit Agarwal</b>, <b>Avinash Kumar</b>, <b>Sung Yong Kim</b>, and <b>Rajni</b>. \\\"Indian Ocean Sea Surface Temperature Modulates the Arctic Oscillation: A Multi‐Model Assessment Using CMIP6.\\\" <i>International Journal of Climatology</i>: e70259.\"]',0,1,74),(72,'list','[\"KK Saha, P Kumar, <b>A Singh</b>, B Kamranzad, IR Young (2025). \\\"Assessment and Future Projections of Storm Surge Using CMIP6 Models in the Indo-Pacific Region\\\". Ocean Modelling, 102560.\", \"R Prasad, P Kumar, <b>A Singh</b>, A Sunil, A Kumar, A Patra (2025). \\\"Trend analysis of extreme wind and wave height at key port locations along the Indian coastline\\\". Thalassas: An International Journal of Marine Sciences 41(1), 1-23.\", \"B Sajja, <b>A Singh</b> (2025). \\\"Detection of Violent Content in Videos Using Attention-Augmented 3D Convolutional Networks\\\". IEEE MultiMedia.\", \"AK Singhal, S Manhas, <b>A Singh</b> (2025). \\\"Beyond the traditional models: a network reconstruction based model for predicting and analysing individual health status\\\". Computing 107(1), 1-21.\"]',0,1,75),(73,'list','[\"Singhal, A. K., &amp; <b>Singh, A.</b> (2024). Mapping health pathways: A network analysis for improved illness prediction. Concurrency and Computation: Practice and Experience, e8301.\", \"Kumar, Pankaj, <b>Singh, Anurag</b>, and Ajay K. Sharma. \\\"Identification of influential vertices in complex networks: A hitting time-based approach.\\\" Journal of Concurrency and Computation: Practice and Experience e8031 (2024).\", \"R Prasad, P Kumar, A Yadav, <b>Singh, A.</b>, D Sardana, Y Hisaki (2024). CMIP6 Model Evaluation for Wind Speed Responses to IOD during Monsoon Season over the Indian Ocean.\", \"P Kumar, KK Saha, <b>Singh, A.</b>, PK Bhaskaran, TM Balakrishnan, Y Hisaki (2024). Integrated Analysis of Seasonal Swells, Wind-seas and associated Wave Energy along the major Indian Ports.\"]',0,1,76),(74,'list','[\"Jain, Eeti, and <b>Anurag Singh</b>. \\\"Trust-and reputation-based opinion dynamics modelling over temporal networks.\\\" Journal of Complex Networks 10.4 (2022): cnac019.\", \"<b>Singh, Anurag</b>, and Md Arquam. \\\"Epidemiological modeling for COVID-19 spread in India with the effect of testing.\\\" Physica A: Statistical Mechanics and its Applications 592 (2022): 126774.\", \"<b>Singh, Anurag</b>, and Binshumesh Sachan. \\\"Quantum Walk Circuits to Analyze Networks.\\\" 2022 8th International Conference on Advanced Computing and Communication Systems (ICACCS). Vol. 1. IEEE, 2022.\"]',0,1,77),(75,'list','[\"Jain, Eeti, and <b>Anurag Singh</b>. \\\"Opinion evolution in society with stubborn agents using Temporal Model for Opinion and Triad Network Formation (TMOTNF).\\\" Journal of Complex Networks 9.5 (2021): cnab033.\", \"<b>Singh, A.</b>, Bhasin, S., Gakhar, B., &amp; Arquam, M. (2022). Modeling the Effect of Quarantine and Isolation for COVID-19 Spreading. In Artificial Intelligence and Sustainable Computing (pp. 437-450). Springer, Singapore.\", \"Arquam, M., <b>Singh, A.</b> &amp; Sharma, R. \\\"A blockchain-based secured and trusted framework for information propagation on online social networks.\\\" Soc. Netw. Anal. Min. 11, 49 (2021).\"]',0,1,78),(76,'list','[\"Arquam, Md, and <b>Anurag Singh</b>. \\\"Epidemic Spreading in Geometric Network with Mobile Agents.\\\" Acta Physica Polonica B 51.9 (2020): 1853.\", \"M. Arquam, <b>A. Singh</b> and H. Cherifi, \\\"Impact of Seasonal Conditions on Vector-Borne Epidemiological Dynamics,\\\" in IEEE Access, vol. 8, pp. 94510-94525, 2020, doi:10.1109/ACCESS.2020.2995650.\", \"Agrawal, Rimjhim, Md. Arquam, and <b>Anurag Singh</b>. \\\"Community detection in Networks using Graph Embedding.\\\" Procedia Computer Science 173 (2020): 372-381.\", \"Eeti, <b>Singh, Anurag</b>. \\\"Effect of Influential Nodes on Time Varying Opinion Formation Models.\\\" Procedia Computer Science 173 (2020): 120-129.\", \"Singh, Nidhi, <b>Anurag Singh</b>, and Rajesh Sharma. \\\"Predicting Information Cascade on Twitter Using Random Walk.\\\" Procedia Computer Science 173 (2020): 201-209.\", \"Trivedi, Nitesh, and <b>Anurag Singh</b>. \\\"Efficient Influence Maximization in Social-Networks Under Independent Cascade Model.\\\" Procedia Computer Science 173 (2020): 315-324.\", \"Kumar, Rajesh, and <b>Anurag Singh</b>. \\\"Robustness in Multilayer Networks Under Strategical and Random Attacks.\\\" Procedia Computer Science 173 (2020): 94-103.\"]',0,1,79),(77,'list','[\"Kumar, Prem, Puneet Verma, <b>Anurag Singh</b>, and Hocine Cherifi. \\\"Choosing Optimal Seed Nodes in Competitive Contagion.\\\" Frontiers in Big Data 2 (2019): 16.\", \"Eeti, <b>Singh A</b>, Cherifi H. \\\"Centrality-based Opinion Modeling on Temporal Networks.\\\" IEEE Access. 2019 Dec 24.\", \"Arquam, Md, <b>Anurag Singh</b>, and Hocine Cherifi. \\\"Integrating Environmental Temperature Conditions into the SIR Model for Vector-Borne Diseases.\\\" In International Conference on Complex Networks and Their Applications, pp. 412-424. Springer, Cham, 2019.\", \"Kumari, Suchi, Abhishek Saroha, and <b>Anurag Singh</b>. \\\"Efficient edge rewiring strategies for enhancement in network capacity.\\\" Physica A: Statistical Mechanics and its Applications (2019): 123552.\", \"Rajesh Kumar and <b>Anurag Singh</b>. \\\"Consensus dynamics on weighted multiplex networks: A long-range interactions (LRIs) perspective.\\\" Journal of Statistical Mechanics: Theory and Experiment (Accepted Aug. 2019).\", \"Shivam Bathla, Omprakash Sah Kanu, and <b>Anurag Singh</b>. \\\"SHOMAN: An Efficient Method for Finding the Important Nodes in a Network.\\\" Int. J. of Business Intelligence and Data Mining, (Accepted Jul 2019).\", \"Kumari, Suchi, and <b>Anurag Singh</b>. \\\"Effect of correlation on the traffic capacity of Time Varying Communication Network.\\\" Modern Physics Letters B, (2019).\", \"Kumari, Suchi, and <b>Anurag Singh</b>. \\\"Fair end‐to‐end window‐based congestion control in time‐varying data communication networks.\\\" International Journal of Communication Systems, Vol 32(11), e3986 (2019).\", \"Suchi Kumari, <b>Anurag Singh</b>. \\\"Effect of correlations on routing and modeling of time-varying communication networks.\\\" Acta Physica Polonica B, Vol. 50 (2) (2019).\", \"Md. Arquam and <b>Anurag Singh</b>. \\\"Challenges in Network Modeling of communicable and Noncommunicable Diseases in Complex Network.\\\" Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, April 11-12, 2019.\", \"Eeti and <b>Anurag Singh</b>. \\\"Threshold Time Varying Opinion Convergence.\\\" Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, April 11-12, 2019.\", \"Suchi Kumari and <b>Anurag Singh</b>. \\\"Network Capacity Enhancement Over Time-Varying Communication Networks: A Survey and Inherent Directives.\\\" Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, April 11-12, 2019.\", \"Rajesh Kumar, <b>Anurag Singh</b>. \\\"Stability of Synchronization Processes in Weighted Multiplex Networks.\\\" Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, April 11-12, 2019.\", \"Goel, Rahul, <b>Anurag Singh</b>, and Fakhteh Ghanbarnejad. \\\"Modeling Competitive Marketing Strategies in Social Networks.\\\" Physica A: Statistical Mechanics and its Applications 518 (2019): 50-70.\", \"Niranjan, Utkarsh, <b>Anurag Singh</b>, and Ramesh Kumar Agrawal. \\\"A mean-field-theoretic model for dual information propagation in networks.\\\" Journal of Complex Networks (2019).\", \"Niranjan, Utkarsh, <b>Anurag Singh</b>, and Ramesh Kumar Agrawal. \\\"Competitive Novel Dual Rumour Diffusion Model.\\\" New Perspectives and Challenges in Econophysics and Sociophysics. Springer, Cham, 2019. 229-240.\"]',0,1,80),(78,'list','[\"Kumar, Prem, Puneet Verma, and <b>Anurag Singh</b>. \\\"A Study of Epidemic Spreading and Rumor Spreading over Complex Networks.\\\" Towards Extensible and Adaptable Methods in Computing. Springer, Singapore, 2018. 131-143.\", \"Jain, Eeti, <b>Anurag Singh</b>, and Rajesh Sharma. \\\"TTPROF: A Weighted Threshold Model for Studying Opinion Dynamics in Directed Temporal Network.\\\" International Workshop on Complex Networks and their Applications. Springer, 2018.\", \"Arquam, Md, <b>Anurag Singh</b>, and Rajesh Sharma. \\\"Modelling and Analysis of Delayed SIR Model on Complex Network.\\\" International Workshop on Complex Networks and their Applications. Springer, 2018.\", \"Kumar, Rajesh, <b>Anurag Singh</b>, and Hocine Cherifi. \\\"Effect of Topological Structure and Coupling Strength in Weighted Multiplex Networks.\\\" International Conference on Computational Social Networks. Springer, 2018.\", \"Kumar, M., <b>Singh, A.</b>, &amp; Cherifi, H. \\\"An Efficient Immunization Strategy Using Overlapping Nodes and Its Neighborhoods.\\\" Companion of the The Web Conference 2018 (pp. 1269-1275). International World Wide Web Conferences Steering Committee.\", \"Kumari, Suchi, and <b>Anurag Singh</b>. \\\"Community structured time varying communication networks.\\\" 2018 10th International Conference on Communication Systems &amp; Networks (COMSNETS), Bengaluru, 2018, pp. 513-515.\", \"Kumari, Suchi, and <b>Anurag Singh</b>. \\\"Time-Varying Network Modeling and its Optimal Routing Strategy.\\\" Advances in Complex Systems (2017): 1850006.\", \"V. Singh, <b>Anurag Singh</b>, Jain, D., Kumar, V., &amp; Verma, P. Patterns affecting structural properties of social networking site \'Twitter\'. International Journal of Business Information Systems, 27(4), 411-432, 2018.\"]',0,1,81),(79,'list','[\"Prity Kumari, <b>Anurag Singh</b>, “Approximation and Updation of Betweenness Centrality in Dynamic Complex Networks”, International Conference on Computational Intelligence: Theories, Applications, and Future Directions (ICCI-2017), IIT Kanpur, India, Dec. 6-8, 2017.\", \"Suchi Kumari, <b>Anurag Singh</b>, Hocine Cherifi, <a href=\\\"https://link.springer.com/chapter/10.1007/978-3-319-62389-4_53\\\">\\\"Optimal Local Routing Strategies for Community Structured Time Varying Communication Networks.\\\"</a> CSoNet 2017 (Computational Social Network), Hong Kong, Aug. 3-5, 2017.\", \"Md. Arquam and <b>Anurag Singh</b>, <a href=\\\"Personal_Papers/ICEIT_2017.pdf\\\">\\\"Masquerade Detection Technique based on User Profilings.\\\"</a> Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, 16-17 Feb 2017.\"]',0,1,82),(80,'list','[\"Sharma, Shikhar, and <b>Anurag Singh</b>, <a href=\\\"http://link.springer.com/article/10.1186/s40649-016-0034-y\\\">\\\"An efficient method for link prediction in weighted multiplex networks.\\\"</a> Computational Social Networks 3, no. 1 (2016): 7.\", \"Suchi Kumari and <b>Anurag Singh</b>, <a href=\\\"http://link.springer.com/chapter/10.1007/978-3-319-50901-3_3\\\">\\\"Modeling of Data Communication Networks using Dynamic Complex Networks and its Performance Studies.\\\"</a> In 5th International Workshop on Complex Networks and their Applications, November 30-December 02, 2016, Milan, Italy (accepted for presentation and publication).\", \"Debayan Chakraborty, <b>Anurag Singh</b>, and Hocine Cherifi, <a href=\\\"http://link.springer.com/chapter/10.1007/978-3-319-42345-6_6\\\">\\\"Immunization Strategies Based on the Overlapping Nodes in Networks with Community Structure.\\\"</a> In International Conference on Computational Social Networks, pp. 62-73. Springer International Publishing, 2016.\", \"Naveen Gupta, <b>Anurag Singh</b>, and Hocine Cherifi, <a href=\\\"http://www.sciencedirect.com/science/article/pii/S0378437116001205\\\">\\\"Centrality measures for networks with community structure.\\\"</a> Physica A: Statistical Mechanics and its Applications 452 (2016): 46-59.\", \"Suchi Kumari, <b>Anurag Singh</b>, and Priya Ranjan, <a href=\\\"http://dl.acm.org/citation.cfm?id=2896397\\\">\\\"Towards A Framework for Rate Control on Dynamic Communication Networks.\\\"</a> In Proceedings of the International Conference on Internet of Things and Cloud Computing (ICC \'16), ACM, New York, NY, USA, Article 12, 7 pages, 2016.\"]',0,1,83),(81,'list','[\"Shikhar Sharma, and <b>Anurag Singh</b>, <a href=\\\"http://ieeexplore.ieee.org/document/7400602/\\\">\\\"An Efficient Method for Link Prediction in Complex Multiplex Networks.\\\"</a> 2015 11th International Conference on Signal-Image Technology &amp; Internet-Based Systems (SITIS). IEEE, 2015.\", \"Naveen Gupta and <b>Anurag Singh</b>, <a href=\\\"Personal_Papers/ICEIT_2015.pdf\\\">\\\"Predicting the Weights of Future Connections in Social Networks.\\\"</a> Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, 16-17 Apr 2015.\", \"<b>Anurag Singh</b>, Rahul Kumar, and Yatindra Nath Singh, <a href=\\\"http://www.actaphys.uj.edu.pl/vol46/abs/v46p0305\\\">\\\"IMPACT OF STRUCTURAL CENTRALITY BASED ATTACKS IN COMPLEX NETWORKS.\\\"</a> Acta Physica Polonica B 46.2 (2015).\", \"Naveen Gupta, <b>Anurag Singh</b>, and Hocine Cherifi, <a href=\\\"http://www.sciencedirect.com/science/article/pii/S0378437116001205\\\">\\\"Community-based immunization strategies for epidemic control.\\\"</a> 2015 7th International Conference on Communication Systems and Networks (COMSNETS). IEEE, 2015.\", \"<b>Anurag Singh</b>, and Yatindra Nath Singh, <a href=\\\"http://comnet.oxfordjournals.org/content/3/3/450.short\\\">\\\"Rumor dynamics in weighted scale-free networks with degree correlations.\\\"</a> Journal of Complex Networks 3.3 (2015): 450-468.\"]',0,1,84),(82,'list','[\"<b>Anurag Singh</b>, and Yatindra Nath Singh, <a href=\\\"https://books.google.co.in/books?hl=en&amp;lr=&amp;id=kGFJDAAAQBAJ&amp;oi=fnd&amp;pg=PA132&amp;ots=O9tXtNxHnw&amp;sig=huzQ4soMjVA2zcqaxYKv79fD52s#v=onepage&amp;q&amp;f=false\\\">\\\"Rumor Dynamics and Inoculation of the Nodes in Complex Networks.\\\"</a> Complex Networks and their Applications (2014): 132.\", \"Naveen Gupta, and <b>Anurag Singh</b>, <a href=\\\"http://dl.acm.org/citation.cfm?id=2680839\\\">\\\"A novel strategy for link prediction in social networks.\\\"</a> In Proceedings of the 2014 CoNEXT Student Workshop, pp. 12-14. ACM, 2014.\"]',0,1,85),(83,'list','[\"<b>Anurag Singh</b>, Rahul Kumar, Y N Singh, \\\"Effects of Inoculation based on Structural Centrality on Rumor Dynamics in Social Networks.\\\"\", \"Amit Munjal, <b>Anurag Singh</b>, and Yatindra Nath Singh, <a href=\\\"Personal_Papers/ICEIT_2013.pdf\\\">\\\"Using Complex Network in Wireless Sensor Networks.\\\"</a> Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing, New Delhi, 27-28 Sept 2013.\", \"<b>Anurag Singh</b>, Y N Singh, \\\"Nonlinear Spread of Rumor and Inoculation Strategies in the Nodes with Degree Dependent Tie Strength in Complex Networks.\\\"\", \"<a href=\\\"http://www.comsnets.org/phd_forum_accepted.html\\\">\\\"Rumor dynamics and Inoculation strategies for Rumor Control in Social Networks.\\\"</a> <b>Anurag Singh</b>, Yatindra Nath Singh, Ph.D. forum in COMSNETS 2013, 7-10 January, Bangalore, India.\", \"<b>Anurag Singh</b>, Y N Singh, \\\"Rumor Dynamics with Inoculations for Correlated Scale Free Networks,\\\" NCC 2013, IIT Delhi, February 2013.\"]',0,1,86),(84,'list','[\"<a href=\\\"http://dl.acm.org/citation.cfm?id=2188178\\\">\\\"Rumor Spreading and Inoculation of node in Complex Networks\\\"</a>, <b>Anurag Singh</b>, Yatindra Nath Singh, WWW2012 at Lyon, France, 16-20 April 2012.\", \"<a href=\\\"http://ieeexplore.ieee.org/xpl/articleDetails.jsp?tp=&amp;arnumber=6395172&amp;contentType=Conference+Publications&amp;searchField%3DSearch_All%26queryText%3DRumor+Dynamics+with+Acceptability+Factor+and+Inoculation+of+Nodes+in+Scale+Free+Networks#\\\">\\\"Rumor Dynamics with Acceptability Factor and Inoculation of Nodes in Scale Free Networks\\\"</a>, <b>Anurag Singh</b>, Rahul Kumar, Yatindra Nath Singh, SITIS 2012, 25-29 November 2012 - Sorrento - Naples, Italy.\"]',0,1,87),(87,'list','[\"A. Kumar and A. Singh, \\\"Smart Precision Farming: A Water Efficient Irrigation System,\\\" <b>2025 International Conference on Electronics, AI and Computing (EAIC)</b>, Jalandhar, India, 2025, pp. 1-6, doi: 10.1109/EAIC66483.2025.11101486.\", \"Tyagi, D., Singh, A., Cherifi, H. (2025). MAVS: An Ensemble-Based Multi-agent Framework for Fake News Detection. In: Paszynski, M., Barnard, A.S., Zhang, Y.J. (eds) <b>Computational Science – ICCS 2025 Workshops</b>. ICCS 2025. Lecture Notes in Computer Science, vol 15908. Springer, Cham. https://doi.org/10.1007/978-3-031-97557-8_20.\", \"N. Sinha and A. Singh, \\\"Opinion Dynamics &amp; Synchronization in Higher-Order Networks: Using the Kuramoto Model and Simplicial Complexes,\\\" <b>2024 International Conference on Artificial Intelligence and Emerging Technology (Global AI Summit)</b>, Greater Noida, India, 2024, pp. 630-635 (Best Paper Award).\", \"B. Chakraborty and A. Singh, \\\"An End-to-End Vision-Based Approach for Indian Sign Language Recognition and Captioning,\\\" <b>2025 IEEE International Conference on Computer, Electronics, Electrical Engineering &amp; their Applications (IC2E3)</b>, Srinagar Garhwal, India, 2025, pp. 1-6, doi: 10.1109/IC2E365635.2025.11167226.\", \"V. Sharma, B. Chakraborty, A. Singh and A.S. Chauhan, \\\"Integrating Skeleton Graphs with Transformers for Gloss-Free Indian Sign Language Captioning,\\\" <b>14th International Conference on Computational Data and Social Networks</b>, 2025, Springer, Danang, Vietnam (Accepted for presentation and publication).\", \"A. K. Singhal and A. Singh, \\\"Integrating Network-Derived Metrics: A Feature Augmentation Framework for Improved Prediction,\\\" <b>14th International Conference on Computational Data and Social Networks</b>, 2025, Springer, Danang, Vietnam (Accepted for presentation and publication).\", \"V. Sharma, A. Singh, S. Gaito, \\\"Indian Sign Language recognition and translation: An Encoder-Decoder Approach,\\\" <b>2025 17th International Conference on COMmunication Systems and NETworks (COMSNETS)</b>.\", \"A. Jha, A. Singh, H. Cherifi, \\\"Synchronization in Higher Order Network of Simplicial Complexes,\\\" <b>International Conference on Complex Networks and Their Applications</b>, 2024.\", \"V. Sharma, A. Singh, S. Gaito, \\\"Object Centered Video Captioning using Spatio-temporal Graphs,\\\" <b>2024 IEEE International Conference on Interdisciplinary Approaches in Technology and Management for Social Innovation (IATMSI)</b>, Gwalior, India, 2024.\", \"A. Singh, P. Singh, V. Sharma, D. Tyagi, N. Pandey and B. Vaid, \\\"Palanam: A Deep Learning Based Childhood Defense System,\\\" <b>2024 16th International Conference on COMmunication Systems &amp; NETworkS (COMSNETS)</b>, Bengaluru, India, 2024, pp. 273-275.\", \"V. Sharma, A. Singh, S. Gaito, \\\"Video Captioning using Spatio-temporal Graphs: An Encoder-Decoder Approach,\\\" <b>2024 16th International Conference on COMmunication Systems &amp; NETworkS (COMSNETS)</b>, Bengaluru, India, 2024, pp. 424-426.\", \"A. K. Singhal, S. Manhas and A. Singh, \\\"Health Prediction Using Network Reconstruction Based Model,\\\" <b>2024 16th International Conference on COMmunication Systems &amp; NETworkS (COMSNETS)</b>, Bengaluru, India, 2024, pp. 409-411.\", \"B. Sajja and A. Singh, \\\"Detection of Violent Content in Videos Using 2D Attention-Augmented Convolutional Networks and Gated Recurrent Unit,\\\" <b>2023 IEEE 20th India Council International Conference (INDICON)</b>, Hyderabad, India, 2023, pp. 967-972.\", \"<a href=\\\"https://ieeexplore.ieee.org/document/10177015\\\">Bharadwaj, R. Gupta, R. Gurjar and A. Singh, \\\"Importance of CURE Clustering Algorithm over K-Means Clustering Algorithm for Large Data-set,\\\" <b>2023 Third International Conference on Secure Cyber Computing and Communication (ICSCCC)</b>, Jalandhar, India, 2023, pp. 421-426.</a>\", \"<a href=\\\"https://link.springer.com/chapter/10.1007/978-3-031-26303-3_20\\\">Vashishtha, R., Singh, A., Cherifi, H. (2023). A Community Detection Algorithm Using Random Walk. In: Dinh, T.N., Li, M. (eds) <b>Computational Data and Social Networks. CSoNet 2022</b>. Lecture Notes in Computer Science, vol 13831. Springer, Cham.</a>\", \"<a href=\\\"https://link.springer.com/chapter/10.1007/978-3-031-21131-7_10\\\">Vashishtha, R., Singh, A., Cherifi, H. (2023). A Biased Random Walk Scale-Free Network Growth Model with Tunable Clustering. In: Cherifi, H., et al. <b>Complex Networks and Their Applications XI. COMPLEX NETWORKS 2016-2022</b>. Springer, Cham.</a>\", \"<a href=\\\"https://link.springer.com/chapter/10.1007/978-3-031-21131-7_28\\\">Kumar, P., Singh, A., Sharma, A.K., Cherifi, H. (2023). Mean Hitting Time of Q-subdivision Complex Networks. In: Cherifi, H., et al. <b>Complex Networks and Their Applications XI. COMPLEX NETWORKS 2016-2022</b>. Springer, Cham.</a>\", \"<a href=\\\"https://ieeexplore.ieee.org/document/9785059\\\">A. Singh and B. Sachan, \\\"Quantum Walk Circuits to Analyze Networks,\\\" <b>2022 8th International Conference on Advanced Computing and Communication Systems (ICACCS)</b>, Coimbatore, India, 2022, pp. 277-284.</a>\", \"Singh, Anurag, and Binshumesh Sachan. \\\"A quantum approach to walk on networks.\\\" <b>2021 6th International Conference on Signal Processing, Computing and Control (ISPCC). IEEE, 2022</b>\", \"Singh, A., Bhasin, S., Gakhar, B., &amp; Arquam, M. (2022). Modeling the Effect of Quarantine and Isolation for COVID-19 Spreading. In <b>Artificial Intelligence and Sustainable Computing</b> (pp. 437-450). Springer, Singapore.\", \"Kumar, Rajesh, and Anurag Singh. \\\"Robustness in Multilayer Networks Under Strategical and Random Attacks.\\\" <b>Procedia Computer Science 173 (2020): 94-103.</b>\", \"Trivedi, Nitesh, and Anurag Singh. \\\"Efficient Influence Maximization in Social-Networks Under Independent Cascade Model.\\\" <b>Procedia Computer Science 173 (2020): 315-324.</b>\", \"Singh, Nidhi, Anurag Singh, and Rajesh Sharma. \\\"Predicting Information Cascade on Twitter Using Random Walk.\\\" <b>Procedia Computer Science 173 (2020): 201-209.</b>\", \"Eeti, Singh, Anurag. \\\"Effect of Influential Nodes on Time Varying Opinion Formation Models.\\\" <b>Procedia Computer Science 173 (2020): 120-129.</b>\", \"Agrawal, Rimjhim, Md. Arquam, and Anurag Singh. \\\"Community detection in Networks using Graph Embedding.\\\" <b>Procedia Computer Science 173 (2020): 372-381.</b>\", \"Arquam, Md, Anurag Singh, and Hocine Cherifi. \\\"Integrating Environmental Temperature Conditions into the SIR Model for Vector-Borne Diseases.\\\" <b>International Conference on Complex Networks and Their Applications. Springer</b>, Cham, 2019.\", \"Kumar, Prem, Puneet Verma, Anurag Singh, and Hocine Cherifi. \\\"Choosing Optimal Seed Nodes in Competitive Contagion.\\\" <b>Frontiers in Big Data 2 (2019): 16.</b>\", \"Eeti, A. Singh, \\\"Threshold Time Varying Opinion Convergence\\\" in <b>Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing</b>, New Delhi, April 11-12, 2019.\", \"Rajesh Kumar, A. Singh, \\\"Stability of Synchronization Processes in Weighted Multiplex Networks\\\" in <b>Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing</b>, New Delhi, April 11-12, 2019.\", \"Md. Arquam, A. Singh, \\\"Challenges in Modeling of Communicable and Non-Communicable Diseases in Complex Network\\\" in <b>Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing</b>, New Delhi, April 11-12, 2019.\", \"S. Kumari and A. Singh, \\\"Network Capacity Enhancement Over Time-Varying Communication Networks: A Survey and Inherent Directives\\\" in <b>Proc. ICEIT Conference on Advances in Mobile Communications, Networking and Computing</b>, New Delhi, April 11-12, 2019.\", \"Kumar, Rajesh, Anurag Singh, and Hocine Cherifi. \\\"Effect of Topological Structure and Coupling Strength in Weighted Multiplex Networks.\\\" <b>International Conference on Computational Social Networks. Springer, 2018.</b>\", \"Arquam, Md, Anurag Singh, and Rajesh Sharma. \\\"Modelling and Analysis of Delayed SIR Model on Complex Network.\\\" <b>International Workshop on Complex Networks and their Applications. Springer, 2018.</b>\", \"Jain, Eeti, Anurag Singh, and Rajesh Sharma. \\\"TTPROF: A Weighted Threshold Model for Studying Opinion Dynamics in Directed Temporal Network.\\\" <b>International Workshop on Complex Networks and their Applications. Springer, 2018.</b>\", \"Kumar, Prem, Puneet Verma, and Anurag Singh. \\\"A Study of Epidemic Spreading and Rumor Spreading over Complex Networks.\\\" <b>Towards Extensible and Adaptable Methods in Computing. Springer, Singapore, 2018. 131-143.</b>\", \"Kumari, Prity, and Anurag Singh. \\\"Approximation and Updation of Betweenness Centrality in Dynamic Complex Networks.\\\" <b>Computational Intelligence: Theories, Applications and Future Directions-Volume I. Springer, Singapore, 2019. 25-37.</b>\", \"Kumar, M., Singh, A., &amp; Cherifi, H. (2018, April). An Efficient Immunization Strategy Using Overlapping Nodes and Its Neighborhoods. In <b>Companion of the The Web Conference 2018 on The Web Conference 2018 (pp. 1269-1275). International World Wide Web Conferences Steering Committee.</b>\", \"S. Kumari and A. Singh, \\\"Community structured time varying communication networks,\\\" <b>2018 10th International Conference on Communication Systems &amp; Networks (COMSNETS)</b>, Bengaluru, 2018, pp. 513-515.\"]',0,1,90),(88,'list','[\"<b>IEEE-INDICON, 2023</b>, Hyderabad, 14-17 Dec 2023\", \"One week research visit in <b>Rey Juan Carlos University, Spain</b>, Jan 2023\", \"<b>11th International Conference on Complex Networks and their Applications</b>, Nov 8-10, 2022, Palermo, Italy\", \"<b>ICTS program \\\"Dynamics of Complex Systems - Workshop\\\"</b>, June 26-30, 2018, ICTS-TIFR, Bengaluru\", \"Short Term Course on <b>Deep Learning and Computational Intelligence in Automation &amp; Control</b>, Dec 4-8, 2017, IIT Kanpur\", \"<b>Network and Games Workshop</b>, Dec 1, 2015, IIT Ropar\", \"<b>SITIS 2015</b>, Nov 23-27, 2015, Bangkok, Thailand\", \"<b>SITIS 2013</b>, Dec 2-5, 2013, Kyoto, Japan\", \"<b>ICEIT Conference</b>, Sept 27-28, 2013, New Delhi, India\", \"<b>COCOON 2013 Conference</b>, June 21-24, 2013, Hangzhou, China\", \"<b>NCC 2013 Conference</b>, Feb 15-17, 2013, IIT Delhi, India\", \"<b>ACM COMSNETS 2013 International Conference</b>, Jan 7-10, 2013, Bangalore, India\", \"<b>ACM CoNEXT 2012 International Conference</b>, Aug 13-17, 2012, Nice, France\", \"<b>ACM SIGCOMM 2012 International Conference</b>, Dec 10-13, 2012, Helsinki, Finland\", \"<b>World Wide Web 2012 Conference</b>, Apr 16-20, 2012, Lyon, France\", \"<b>Workshop on Network Science in Electrical Engineering and Computer Science</b>, Jan 9-13, 2012, IISc Bangalore, India\", \"<b>School on Network Science in Electrical Engineering and Computer Science</b>, Jan 2-6, 2012, IISc Bangalore, India\", \"<b>Workshop on Network Science</b>, Aug 29-Sep 2, 2011, IISc Bangalore, India\", \"<b>ACM SIGCOMM 2010 International Conference</b>, Aug-Sep 2010, New Delhi, India\", \"<b>JTG Summer School</b>, May 18-21, 2010, IISc Bangalore, India\"]',0,1,91),(89,'list','[\"<p><b>ACM SIGCOMM 2010 Travel Grant</b> to attend ACM SIGCOMM Conference at\\n                New\\n                Delhi, India (550 USD).</p>\", \"<p><b>ACM SIGCOMM 2012 Travel Grant</b> to attend ACM SIGCOMM Conference at\\n                Helsinki, Finland (2000 USD).</p>\", \"<p><b>ACM CoNEXT 2012 Travel Grant</b> to attend ACM CoNEXT Conference at\\n                Nice,\\n                France (2200 USD).</p>\", \"<p>Received <b>cash award</b> from <b>IIT Kanpur</b> for journal paper\\n                publication.</p>\", \"<p><b>MHRD fellowship</b> for 4 years and 6 months.</p>\", \"<p>M.Tech. student <b>Naveen Gupta</b> received best thesis award at PDPM\\n                IIITDM\\n                Jabalpur.</p>\", \"<p><b>SERB International Travel Grant</b> for attending the CSoNet 2017\\n                conference\\n                at Hong Kong.</p>\", \"<p>Elevated as <b>IEEE Sr. Member</b> in 2018.</p>\"]',0,1,92),(91,'list','[\"Thesis title: Rumor Dynamics and Inoculation of Nodes in Complex Networks.\", \"Supervisor: Prof. Yatindra Nath Singh\"]',0,1,95),(92,'list','[\"GGSIPU, Delhi, India, Percentage - 76.26 %\", \"University School of Information Technology, Guru Gobind Singh Indraprastha University Delhi in 2006.\"]',0,1,96),(93,'list','[\"Dr. B.R. Ambedkar University, Agra, Percentage - 75 %\", \"Faculty of Engineering & Technology, R.B.S. College, Bichpuri, Agra, India in 2000.\"]',0,1,97),(94,'list','[\"UP Board, Percentage - 73.4 %\", \"Pt. Deendayal Upadhyay Sanatan Dharam Vidyalaya, Kanpur, India.1994.\"]',0,1,98),(95,'list','[\"UP Board, Percentage - 79.16 %\", \"Pt. Deendayal Upadhyay Sanatan Dharam Vidyalaya, Kanpur, India in 1992.\"]',0,1,99),(96,'list','[\"An expert talk on, \\\"Federated Learning in Computer Vision\\\", in <b>SERB High-End Workshop (KARYASHALA) on A Practical Approach to Machine Learning and Deep Learning for Computer Vision Applications using High End Computing Resources</b> from March 15 -22, 2024 at MLNIT Allahabad.\", \"Taught DBMS course in <b>IIIT Kota</b> in 2023.\", \"Taught Compiler Design course in 2023 and 2022 at <b>South Asian University Delhi</b>.\", \"Research Presentation is delivered in <b>Rey Juan Carlos University, Spain</b> (Jan. 2023.)\", \"A keynote is delivered on \\\"Introduction to Machine Learning\\\" in an <b>International Conference on Communication, Security and Artificial Intelligence (ICCSAI-2023)</b> from 23rd Nov to 25th Nov 2023 at Galgotia University, India.\", \"A research paper on, \\\"Detection of Violent Content in Videos Using 2D Attention-Augmented Convolutional Networks and Gated Recurrent Unit\\\" is presented in <b>IEEE- INDICON, 2023, Hyderabad</b> (14-17, Dec., 2023)\", \"Delivered an expert talk on, \\\"Social Network Analysis\\\" in online monthly research meeting at <b>Deptt. of CSc, University of Delhi</b> on May 24, 2023.\", \"Delivered an expert lecture on, <b>\\\"Social Network Analysis\\\"</b> one-week Faculty Development Programme on \\\"Intelligent Computing and Communications\\\" as a guest speaker on April 12th, 2023 at <b>Banasthali Vidyapith, Rajasthan</b> in Offline mode supported by <b>Department of Science and Technology (DST)</b>, Govt. of India.\", \"Delivered a expert lecture on, <b>\\\"Federated Learning\\\"</b> in online SEMINAR on \\\"Artificial Intelligence Techniques for Healthcare Applications (AITHA-2023)\\\", dated: 22Feb.-2023 to 27th Feb.-2023 (Feb. 26)\\\" sponsored by <b>SERB at NIT Delhi</b>.\", \"Delivered a talk on, <b>\\\"Optimization Techniques\\\"</b> at Lovely University on Nov. 15, 2022.\", \"Delivered a talk on, <b>\\\"Spectral Graph Theory\\\"</b> in a one day symposium in mathematics on the National Mathematics Day on 22nd December, 2022 (Ramanujan\'s birthday) at <b>School of Physical Sciences (SPS), JNU Delhi</b>.\", \"Delivered a talk on <b>\\\"Federated Learning\\\"</b> at SRM University, Amravati, AP on September 16, 2022.\", \"Delivered a talk on <b>\\\"How to write Research Proposal in emerging area of Engineering &amp; Technology\\\"</b> at G L Bajaj Institute of Technology &amp; Management, Greater Noida Delhi on Sept. 10, 2022.\", \"Delivered a talk on, <b>\\\"Federated Learning\\\"</b>, in GH Raisoni Lecture series, G. H. Raisoni Institute of Engineering and Technology (GHRIET) Pune on April 12, 2022.\", \"Delivered a talk on <b>\\\"Spectral Graph Theory\\\"</b> in Three-Day 5th International Conference on \\\"Recent Advances in Mathematical Sciences with Applications in Engineering and Technology\\\" (IC-RA-MSA-ET-2022) on the occasion of Golden Jubilee Celebration of Vijnana Parishad of India (Society for Applications of Mathematics) on June 16, 2022.\", \"Delivered a talk on, <b>\\\"Information Security in MIS and Cloud Computing\\\"</b> a two weeks ONLINE International Training Programme (ITP) on \\\"Manpower Information System (MIS)\\\" commenced from 29th November to 10th December, 2021 at National Institute of Labour Economics Research and Development (NILERD) Narela, Delhi.\", \"Delivered a talk on <b>\\\"Federated Learning\\\"</b>, Faculty Development at CDAC Noida on Dec. 3, 2021.\", \"Guest Speaker for <b>Three-Days International Conference on Recent Advances in Mathematics and Computational Optimizations(RAMCO-2021)</b> jointly organised by SCIS, JNU and IAPS, Pragra, India, and talk was on, \\\"Spectral Analysis in q-triangulation Networks for Calculating Hitting times\\\" scheduled on October 26-28, 2021.\", \"Delivered a talk on,<b> \\\"Community detection and Assortativity\\\"</b> One-week online Faculty Development Programme (FDP) on \\\"Network Science: Theory, Challenges and Applications\\\" under the <b>ATAL AICTE FDP programme</b> from 23rd August 2021 to 27th August 2021 organized by Amity University Rajasthan, Jaipur, India.\", \"Delivered a talk on <b>\\\"Mathematical Optimization in Healthcare\\\"</b>, ATAL FDP on <b>Machine Learning Frontiers in Healthcare ( MLFH-21)</b>, NIT Delhi, India on July 30, 2021.\", \"Delivered a talk on <b>\\\"Federated Learning\\\"</b>, Second Faculty Development Programme on Innovations and Research Trends in Artificial Intelligence, Banasthali Vidyapith, Rajasthan, India on March 7, 2021.\", \"Delivered a talk on <b>\\\"COVID-19 Modeling and its Containment\\\"</b>, Faculty development programme (FDP) on \\\"Technology as a Bridge in Different of Life During Covid -19\\\" from 19th to 23th October 2020 at B.T Kumaon Institute of Technology, Dwarahat, India.\", \"Delivered a talk on <b>\\\"Modeling and Analysis of COVID 19 data\\\"</b>, One Week Faculty Development Programme On topic \\\"Data Analytics: Present and Future\\\" (12th to 16th Oct., 2020), MMMUT, Gorakhpur, India.\", \"Delivered a talk on <b>\\\"Epidemic Modelling and Containment\\\"</b>, Online training program through Webinar on thrust areas in various domains of computer, Information Technology, Electrical, Electronics &amp; Telecommunication, Civil &amp; Mechanical Engineering, July 18, 2020, GHRIET, Wagholi, Pune, India.\", \"Delivered a talk on <b>\\\"Social Network Analysis\\\"</b> during On-Campus Online Training for RGI Faculties [OOTP] on 23-May-20. GHRIET, Wagholi, Pune, India.\"]',0,1,100),(99,'list','[\"<a href=\\\"http://le2i.cnrs.fr/-Hocine-Cherifi,354-?lang=fr\\\">Hocine Cherifi, Professor, LE2I, UMR6306 CNRS, University of Burgundy, Dijon, France</a>\", \"<a href=\\\"http://kodu.ut.ee/~rajesh/\\\">Rajesh Sharma, Senior Researcher, Software Engineering &amp; Information Systems Group, Institute of Computer Science University of Tartu, Estonia</a>\", \"<a href=\\\"https://www.unimi.it/en/ugov/person/sabrina-gaito/\\\">Sabrina Gaito, Full Professor of Computer Science, Università degli Studi di Milano</a>\", \"<a href=\\\"https://sites.google.com/site/fakhtehghanbarnejad/home\\\">Fakhteh Ghanbarnejad, Researcher (Principal Investigator), idonate project Institute of Theoretical Physics (ITP), Technical University of Berlin</a>\", \"<a href=\\\"http://mathem.krc.karelia.ru/member.php?id=1&amp;plang=e\\\">Mazalov Vladimir V., Director of the Institute of Applied Mathematical Research KarRC RAS, Head of the Laboratory for Mathematical Cybernetics Institute of Applied Mathematical Research KarRC RAS </a>\"]',0,1,104),(100,'list','[\"<a href=\\\"#\\\">Uday Deo</a> (registered in 2024), (with Prof.(Dr.) Ajay K. Sharma and Prof.(Dr.) Swades De - Professor IIT Delhi) Domain of work: <b>\\\"Securing BLE Communications\\\"</b> (ongoing).\", \"<a href=\\\"#\\\">Shivank</a> (registered in 2024), (with Prof.(Dr.) Fakhteh Ghanbarnejad - Professor of Computer Science SRH Berlin University of Applied Sciences) Domain of work: <b>\\\"Mathematical Modeling of Vector borne Diseases based on Climatic Factors.\\\"</b> (ongoing).\", \"<a href=\\\"#\\\">Kamlesh Kumar Shah</a> (registered in 2023), (with Dr. Prashant Kumar) Domain of work: <b>\\\"Sea Level Rise and its Amplification over the Global Coastline\\\"</b> (ongoing, Comprehensive done).\", \"<a href=\\\"#\\\">Ankur Kumar Singhal</a> (registered in 2022) Domain of work: <b>\\\"Network Reconstruction\\\"</b> (ongoing, Comprehensive done).\", \"<a href=\\\"#\\\">Vibhor Sharma </a>(registered in 2022), Part Time Domain of work: <b>\\\"Video Captioning\\\"</b> (ongoing, Comprehensive done)\", \"<a href=\\\"#\\\">Ramakant Prasad </a>(registered in 2022), (with Dr. Prashant Kumar) Part Time Domain of work: <b>\\\"Wind Wave climate in Indian Ocean\\\"</b> (ongoing, Comprehensive done)\", \"<a href=\\\"#\\\">Rajesh Kumar</a> (registered in Jan. 2017), <b>\\\"Dynamics on Multilayer Networks: Synchronization and Robustness\\\"</b> (Completed on April 28, 2023)\", \"<a href=\\\"#\\\">Eeti </a> (registered in Jan. 2017), <b>\\\"Performance analysis of Opinion Dynamics Models Over Time-Varying Networks\\\"</b> (Completed on May 31, 2022).\", \"<a href=\\\"#\\\">Md. Arquam </a> (registered in Aug. 2016), <b>\\\"Modelling of Disease and Information Dynamics in Complex Networks\\\"</b> (Completed on April 4, 2022).\", \"<a href=\\\"#\\\">Such Kumari </a>(Completed on March 18, 2020), <b>\\\"Modeling and Performance Study of Time-Varying Communication Network: A Complex System Approach\\\"</b>. Current Affiliation: <em>Assistant Professor in Computer Science and Engineering department at Bennet University, India</em>\"]',0,1,105),(101,'list','[\"Pankaj Kumar (with Prof.(Dr.) Ajay K. Sharma), topic: <b>\\\"Hitting Time and Consensus in Higher Ordered Network\\\"</b> (2023).\", \"Anupama Singh, topic: <b>\\\"Community Detection in Complex Networks\\\"</b> (2023).\", \"Pandla Balakrishna Vijay Kumar, topic: <b>\\\"A Study of Video Captioning using Spatio-temporal attention\\\"</b> (2023).\", \"Pawan Yadav (with Dr. Chandra Prakash), topic: <b>\\\"Efficient Communication Transportation System Using Federated Learning\\\"</b> (2023).\", \"Amit Kumar, NIT Delhi, topic: <b>Federated Learning </b>(2021-22).\", \"Ch Chaitanya, NIT Delhi, topic: <b>Intelligent Transport System for Buses.</b>\", \"Moh Khalid, NIT Delhi, topic: <b>Federated Learning Based Traffic Flow Prediction Using GCN.</b>\", \"Rimjhim Agrawal, topic: <b>Temporal Networks</b> (Ongoing).\", \"Rekha Meena, topic: <b>Community Detection using Spiking Neural Network</b> (Ongoing).\", \"Nitesh Trivedi, topic: <b>Efficient Influence Maximization in Social Networks Under Independent Cascade Model.</b> Current Affiliation: <em>Pursuing Ph.D. at IIT Kanpur.</em>\", \"Nishkal Prakash, topic: <b>Contemporary Political Frontier: Analyzing Trends in Online Social Media using Politics-Related Data from Twitter.</b> Current Affiliation: <em>Pursuing Ph.D. at IIT Kharagpur.</em>\", \"Manish Kumar, topic: <b>Efficient Immunization Strategy Using Overlapping Community Structure in Networks (2016-18).</b>\", \"Nidhi Singh, topic: <b>Social Network Analysis and Text Mining on Twitter (2016-18).</b> Current Affiliation: <em>Data Science Engineer at Envestnet Data Analytics.</em>\", \"Rajesh Vashishtha, topic: <b>Network Modeling and Community Detection Algorithm (2015-2017).</b>\", \"Mithun, topic: <b>Edge Centrality in Hypergraphs (2015-2017).</b>\", \"Rahul Goel, topic: <b>Competitive Marketing Strategies in Social Networks (2015-2017).</b> Current Affiliation: <em>Pursuing Ph.D. at University of Tartu, Estonia.</em>\", \"Puspita Majumdar, topic: <b>Cross-Domain Recommender System (2015-2017).</b> Current Affiliation: <em>Pursuing Ph.D. at IIIT Delhi.</em>\", \"Debayan Chakraborty, topic: <b>Diffusion Dynamics in Complex Networks Using Overlapping and Non-Overlapping Community Structures (2014-2016).</b> Current Affiliation: <em>AI Specialist at AI Research Labs, Accenture.</em>\", \"Prity Kumari, topic: <b>Computation and Updation of Betweenness Centrality in Dynamic Network (2014-2016).</b>\", \"Deepak Malik, topic: <b>Link Prediction in Multiplex Network (2014-2016).</b> Current Affiliation: <em>Lecturer (CS) in Govt. Co-ed SSS Sainik Vihar, Delhi.</em>\", \"Roshan Agarwal, topic: <b>A Rule-Based Improvement to Time Series Model Output for Short-Term Load Forecasting (2014-2016).</b> Current Affiliation: <em>Data Science Lead at Impact Analytics, Bangalore.</em>\", \"Naveen Gupta, topic: <b>Influence and Evolutionary Dynamics on Social Networks (2013-2015).</b> Joint supervision with Dr. Atul Gupta (PDPM IIIdivM Jabalpur).\", \"Abhishek Saroha, topic: <b>Study the Structure and Properties of Networks and Make Performance Enhancements.</b>\", \"Prajval Koul, topic: <b>Proving/Disproving Li and Li\'s Conjecture Using Lovasz Local Lemma.</b>\", \"Prem Verma, Puneek Kumar, topic: <b>Modeling Competitive and Cooperative Contagion over Complex Networks.</b>\", \"Shivam Bathla, Boppana Amulya Sai, topic: <b>Study of Attacks on Various Operating Systems.</b>\", \"Mritunjay Mohitesh, Rishu Bhagat, topic: <b>Edge Weight Prediction in Weighted Signed Networks.</b>\", \"Sunil Meena, Sanjay Kumar Saini, topic: <b>Implementation of Epidemic Spreading Model in Human Population Networks.</b>\", \"Abhishek Adarsh, Pankaj, topic: <b>Public Transportation Network (Ongoing).</b>\", \"Chandrashekhar, Himanshu, Harish, topic: <b>Multiplex Networks (Ongoing).</b>\", \"Arnav, Karan Khanna, Prateek Goyal, topic: <b>Online Auction (2016).</b>\", \"Mohammad Asif, Vijay Yadav, Md Miran Ahmed Ansari, topic: <b>Robustness of Real-World Networks Using Community Structure (2016).</b>\", \"Pushpendra Choudhary, Surjeet Kumar Jaiswal, topic: <b>The Role of Centrality for the Identification of Influential Spreaders in Complex Networks (2014).</b>\", \"Chelmatkari Venkatesh, topic: <b>Attacks on Complex Networks (2014).</b>\", \"D Girish, topic: <b>Development of Social Media for Collaborative Travelling (2014).</b>\", \"Nellore Manikanta Reddy, topic: <b>Betweenness Centrality in Complex Networks (2014).</b>\", \"Archi Sahni, topic: <b>.NET - A Framework (ExperdivoctorForum) (2014).</b>\", \"D Sandilya, topic: <b>In-Vehicle Infotainment (2014).</b>\"]',0,1,106),(102,'list','[\"ACM (annual professional membership)\", \"IEEE Senior Member (annual professional membership)\", \"IEEE Computer Society (annual professional membership)\", \"ICEIT (lifetime membership)\", \"ISTE (lifetime membership)\", \"Network Science Society\", \"Fellow of the Soft Computing Research Society.\"]',0,1,107),(103,'list','[\"<span class=\\\"textcolor\\\">Nonlinear dynamics Journal, Springer</span>\", \"<span class=\\\"textcolor\\\">\\\"Smart cities challenges, technologies and trends.\\\" <em>Frontiers in big Data 6</em> (2023)</span>\", \"<span class=\\\"textcolor\\\">Machine Learning and Artificial Intelligence for Smart Systems in Engineering and Healthcare - Select Proceedings of FLAME 2024, Springer</span>\"]',0,1,108),(104,'list','[\"<span class=\\\"textcolor\\\">Reviewed manuscript for China Communications journal. </span>\", \"<span class=\\\"textcolor\\\">Reviewed manuscript for Journal of Communications and Networks. </span>\", \"<span class=\\\"textcolor\\\">Reviewed manuscript for Journal of Internet Technology. </span>\", \"<span class=\\\"textcolor\\\">CARE 2013 </span>\", \"<span class=\\\"textcolor\\\">NCC 2014 </span>\", \"<span class=\\\"textcolor\\\">SITIS 2014 </span>\", \"<span class=\\\"textcolor\\\">SITIS 2015 </span>\", \"<span class=\\\"textcolor\\\">IEEE Communication Letters </span>\", \"<span class=\\\"textcolor\\\">IEEE Transactions on Cybernetics </span>\", \"<span class=\\\"textcolor\\\">Applied Network Science </span>\", \"<span class=\\\"textcolor\\\">EURASIP Journal on Image and Video Processing</span>\", \"<span class=\\\"textcolor\\\">PLOS ONE </span>\", \"<span class=\\\"textcolor\\\">Physica A: Statistical Mechanics and its Applications </span>\", \"<span class=\\\"textcolor\\\">Complex Networks 2016 </span>\", \"<span class=\\\"textcolor\\\">IEEE Transaction on Network Science and Engineering </span>\", \"<span class=\\\"textcolor\\\">IEEE Transaction on Communications</span>\", \"<span class=\\\"textcolor\\\">IEEE Access</span>\", \"<span class=\\\"textcolor\\\">Information Sciences</span>\", \"<span class=\\\"textcolor\\\">Applied Network Science</span>\"]',0,1,109),(105,'list','[\"<span class=\\\"textcolor\\\"><a href=\\\"http://complexnetworks.org/\\\">Complex Networks 2017</a> </span>\", \"<span class=\\\"textcolor\\\"><a href=\\\"http://complexnetworks.org/\\\">Complex Networks 2016 (<b> Session Chair</b>)</a> </span>\", \"<span class=\\\"textcolor\\\"><a href=\\\"http://complexnetworks.org/\\\">Complex Networks 2015</a> </span>\", \"<span class=\\\"textcolor\\\"><a href=\\\"http://complexnetworks.org/\\\">Complex Networks 2014</a> </span>\", \"<span class=\\\"textcolor\\\"><a href=\\\"http://spacl.kennesaw.edu/csonet2017/index.html\\\">CSoNet 2017 (<b> Session Chair in CSoNet 2016</b>)</a> </span>\", \"<a class=\\\"textcolor\\\" href=\\\"https://www.care-statement.org/\\\">CARE 2013</a>\", \"<a class=\\\"textcolor\\\" href=\\\"https://www.iitk.ac.in/ncc2014/\\\">NCC 2014</a>\", \"<a class=\\\"textcolor\\\" href=\\\"http://www.wikicfp.com/cfp/servlet/event.showcfp?eventid=45251©ownerid=76857\\\">NGCT 2015</a>\", \"<a class=\\\"textcolor\\\" href=\\\"http://www.wikicfp.com/cfp/servlet/event.showcfp?eventid=46040\\\">International Conference on Computational Techniques in Information and Communication Technology, ICCC-2015</a>\", \"<a class=\\\"textcolor\\\" href=\\\"https://tie.org/tie-videos/\\\">GLOBAL TIE Summit 2016</a>\", \"<a class=\\\"textcolor\\\" href=\\\"https://icacca.aconf.org/\\\">ICACCA 2016</a>\", \"<a class=\\\"textcolor\\\" href=\\\"https://computingconf.com/2016/\\\">IACC-2016</a>\", \"<a class=\\\"textcolor\\\" href=\\\"https://embassyofindiabangkok.gov.in/listview/Mjg2\\\">DASA 2016</a>\", \"<a class=\\\"textcolor\\\" href=\\\"http://www.wikicfp.com/cfp/servlet/event.showcfp?eventid=41281©ownerid=70922\\\">RDCAPE 2015</a>\"]',0,1,110),(106,'list','[\"<span class=\\\"textcolor\\\">TPC member, CARE 2013, ICCCS 2015, NGCT 2015, ICCCA-2015, International Conference on Computational Techniques in Information and Communication Technology, ICCCC-2015, GLOBAL TIE Summit 2016, SITIS 2015, IACC-2016, ICACCA 2016., DASA</span>\", \"<span class=\\\"textcolor\\\">Complex Networks 2016, CSONET 2017</span>\", \"<span class=\\\"textcolor\\\">Advisory Committee member, RDCAPE 2015</span>\", \"<span class=\\\"textcolor\\\">Session Chair in CSoNet 2016, Ho-Chi Minh, Vietnam</span>\", \"<span class=\\\"textcolor\\\">Session Chair in COMPLEX NETWORKS 2016, Milan, Italy</span>\", \"<span class=\\\"textcolor\\\">Session Chair in International Conference on Future Learning Aspects of Mechanical Engineering 2020 (FLAME 2020).</span>\", \"<span class=\\\"textcolor\\\">Session Chair in 12th International Conference CICN 2020 to be held on 25-26 Sep 2020 at BIAS Bhimtal.</span>\", \"<span class=\\\"textcolor\\\">Session Chair in International Conference on Future Learning Aspects of Mechanical Engineering 2022 (FLAME 2022).</span>\", \"<span class=\\\"textcolor\\\">Session chair in VIIC-2022 event of ANTIC-2022, BHU Varanasi, India on Dec. 23, 2022</span>\", \"<span class=\\\"textcolor\\\">Session Chair in CSONet 2022 on Dec. 6, 2023</span>\", \"<span class=\\\"textcolor\\\">Session Chair in 7th International Joint Conference on Computing Sciences (ICCS) on 5th May 2023.</span>\", \"<span class=\\\"textcolor\\\">Session Chair in Third International Conference on Secure Cyber Computing and Communications (ICSCCC-2023). The conference will take place from 26th to 28th May 2023 at the Department of Computer Science &amp; Engineering, Dr B R Ambedkar National Institute of Technology Jalandhar, Punjab, India.</span>\"]',0,1,111),(107,'list','[\"Associate Professor in CSE Department, <b>NIT Delhi</b> since Jul 21, 2022.\", \"Assistant Professor in CSE Department, <b>NIT Delhi</b>, Delhi from December 12, 2014 to Jul 20, 2022.\", \"Assistant Professor in CSE Discipline, <b>PDPM Indian Institute of Information Technology Design and Manufacturing, Jabalpur</b> - 482005, from Aug. 12, 2013 to December 11, 2014.\", \"Worked as Assistant Professor in Computer Science &amp; Engineering Department w.e.f. 1st June 2007 to Dec. 2008, Senior lecturer: 1st March, 07 - 31st May, 07 and Lecturer: August, 2002-February, 2007 in <b>\\\"Maharaja Agrasen Institute of Technology\\\"</b>, Sec.-22, Rohini, Delhi, India (under G.G.S.I.P. Univ., Delhi).\", \"Worked as Lecturer in <b>\\\"Ajay Kumar Garg Engineering College\\\", Ghaziabad</b>, India (Under U.P. Technical Univ., Lucknow) : August, 2001,- July 2002 .\", \"Worked as a tutor and TA for ESc 102 lab (Basic Electronics) in <b>IIT Kanpur</b>.\", \"Worked as a tutor and TA for EE673 (Digital Communication Networks) in <b>IIT Kanpur</b>.\", \"Worked as tutor for CS220 (Computer Organization) in <b>IIT Rajasthan</b>\", \"Worked as TA for EE629 (Digital Switching) and EE646 (Photonic Networks and Switching).\"]',0,1,112),(108,'numbered_list','[\"<b>CSBB 303:</b> Data Mining\", \"<b>CSBB 252:</b> Artificial Intelligence\", \"<b>CSL 251:</b> Theory of Automata\", \"<b>CSL 512:</b> Optimization Techniques\", \"<b>CSL 353:</b> Compiler Design\", \"<b>CSB 304:</b> Computer Networks\", \"<b>CSL 501:</b> Computational Mathematics\", \"<b>CSL 526:</b> Large Network Analysis\", \"<b>CSB 302:</b> Operating System\", \"<b>CSL 477:</b> Game Theory (UG)\", \"<b>CSL 529:</b> Game Theory (PG)\"]',0,1,113),(109,'text','\"<p>This is data for <strong>test</strong></p>\"',0,1,114),(110,'list','[\"<p><a href=\\\"https://www.microsoft.com/en-us/research/academic-program/give-great-research-talk/\\\">How to write a good research paper</a></p>\", \"<p><a href=\\\"http://www.cs.cmu.edu/~mblum/research/pdf/grad.html/\\\">Advice to a Beginning Graduate Student by Prof. Manuel Blum</a></p>\", \"<p><a href=\\\"https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/\\\">MIT OPENCOURSEWARE for Electrical Engineering and Computer Science</a></p>\", \"<p><a href=\\\"http://www.ise.ufl.edu/cole/students/tips/\\\">Writing Tips and Style Guidelines by Prof. J. Cole Smith</a></p>\"]',0,1,115);
/*!40000 ALTER TABLE `page_builder_contentblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_page`
--

DROP TABLE IF EXISTS `page_builder_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `slug` varchar(50) DEFAULT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `footer` varchar(255) DEFAULT NULL,
  `profile_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_builder_page_profile_id_d2e08d8b_fk_page_builder_profile_id` (`profile_id`),
  KEY `page_builder_page_slug_af10aa00` (`slug`),
  CONSTRAINT `page_builder_page_profile_id_d2e08d8b_fk_page_builder_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `page_builder_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_page`
--

LOCK TABLES `page_builder_page` WRITE;
/*!40000 ALTER TABLE `page_builder_page` DISABLE KEYS */;
INSERT INTO `page_builder_page` VALUES (1,'Home','home',NULL,NULL,1),(2,'About','about',NULL,NULL,1),(3,'Teaching Experience','teaching-experience',NULL,NULL,1),(4,'Groups','groups',NULL,NULL,1),(5,'Miscellaneous','miscellaneous',NULL,NULL,1),(6,'home','home',NULL,NULL,2);
/*!40000 ALTER TABLE `page_builder_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_profile`
--

DROP TABLE IF EXISTS `page_builder_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `image_badge` varchar(100) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `organisation` longtext,
  `org_short_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `page_builder_profile_slug_bc571dfe` (`slug`),
  CONSTRAINT `page_builder_profile_user_id_99abf3fa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_profile`
--

LOCK TABLES `page_builder_profile` WRITE;
/*!40000 ALTER TABLE `page_builder_profile` DISABLE KEYS */;
INSERT INTO `page_builder_profile` VALUES (1,'profiles/img/profile_photo.jpg','Associate Professor@NITDelhi','Head, Computer Centre, Associate Professor (Former HoD, CSE and Dean R&C)','National Institute of Technology, Delhi','NIT Delhi','Plot No. FA7, Zone P1, GT Karnal Road, Delhi-110036',NULL,'anurag',1),(2,'',NULL,NULL,NULL,NULL,NULL,NULL,'parvej',2);
/*!40000 ALTER TABLE `page_builder_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_profile_link`
--

DROP TABLE IF EXISTS `page_builder_profile_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_profile_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `link_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_builder_profile_link_profile_id_link_id_ea55b226_uniq` (`profile_id`,`link_id`),
  KEY `page_builder_profile_link_link_id_1afce819_fk_common_link_id` (`link_id`),
  CONSTRAINT `page_builder_profile_link_link_id_1afce819_fk_common_link_id` FOREIGN KEY (`link_id`) REFERENCES `common_link` (`id`),
  CONSTRAINT `page_builder_profile_profile_id_f0ec556c_fk_page_buil` FOREIGN KEY (`profile_id`) REFERENCES `page_builder_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_profile_link`
--

LOCK TABLES `page_builder_profile_link` WRITE;
/*!40000 ALTER TABLE `page_builder_profile_link` DISABLE KEYS */;
INSERT INTO `page_builder_profile_link` VALUES (1,1,1);
/*!40000 ALTER TABLE `page_builder_profile_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_builder_subcomponent`
--

DROP TABLE IF EXISTS `page_builder_subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_builder_subcomponent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `order` smallint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `component_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_builder_subcomp_component_id_47f8f444_fk_page_buil` (`component_id`),
  CONSTRAINT `page_builder_subcomp_component_id_47f8f444_fk_page_buil` FOREIGN KEY (`component_id`) REFERENCES `page_builder_component` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_builder_subcomponent`
--

LOCK TABLES `page_builder_subcomponent` WRITE;
/*!40000 ALTER TABLE `page_builder_subcomponent` DISABLE KEYS */;
INSERT INTO `page_builder_subcomponent` VALUES (1,'',0,1,1),(2,'',0,1,2),(3,'',0,1,3),(4,'',0,1,4),(5,NULL,0,1,5),(10,'',0,1,8),(11,'',1,1,8),(12,'',2,1,8),(13,'',3,1,8),(23,NULL,0,1,12),(24,'',0,1,11),(74,'2026',0,1,16),(75,'2025',0,1,16),(76,'2024',0,1,16),(77,'2022',0,1,16),(78,'2021',0,1,16),(79,'2020',0,1,16),(80,'2019',0,1,16),(81,'2018',0,1,16),(82,'2017',0,1,16),(83,'2016',0,1,16),(84,'2015',0,1,16),(85,'2014',0,1,16),(86,'2013',0,1,16),(87,'2012',0,1,16),(90,' Published papers in Conferences',0,1,17),(91,'Conferences, Summer Schools and Workshops Attended',1,1,17),(92,NULL,0,1,10),(95,'PhD from IIT Kanpur, India (CPI 8.5) (Nov2013)',0,1,9),(96,'Master of Technology in Information Technology ',1,1,9),(97,'Bachelor of Engineering in Computer Science & Engineering',2,1,9),(98,'Intermediate ',3,1,9),(99,'High School ',4,1,9),(100,NULL,0,1,18),(101,NULL,1,1,18),(104,'International Collaborations',0,1,21),(105,'Ph.D. Students',0,1,22),(106,'M.Tech. Students',0,1,22),(107,NULL,0,1,23),(108,'Editor',0,1,24),(109,'External Reviewer',0,1,24),(110,'Technical Program Committiee',0,1,24),(111,'Other Professional Activities',0,1,24),(112,NULL,0,1,19),(113,'All Recently Taught Courses',0,1,20),(114,'',0,1,25),(115,NULL,0,1,7);
/*!40000 ALTER TABLE `page_builder_subcomponent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-31 17:03:48
