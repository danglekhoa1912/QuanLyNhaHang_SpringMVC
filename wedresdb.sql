-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: wedresdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `category_dish`
--

DROP TABLE IF EXISTS `category_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_dish`
--

LOCK TABLES `category_dish` WRITE;
/*!40000 ALTER TABLE `category_dish` DISABLE KEYS */;
INSERT INTO `category_dish` VALUES (1,'Khai vị'),(2,'Món chính'),(3,'Thức uống'),(4,'Tráng miệng');
/*!40000 ALTER TABLE `category_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  `imgae` varchar(150) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_category_dish_id_idx` (`category_id`),
  CONSTRAINT `fk_category_dish_id` FOREIGN KEY (`category_id`) REFERENCES `category_dish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Súp hải sản',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(2,'Gỏi ngó sen tôm thịt',1,'https://cdn.tgdd.vn/Files/2022/04/04/1423782/goi-y-8-mon-nguoi-khai-vi-cho-nhung-buoi-tiec-hoi-hop-voi-gia-dinh-202204040914134517.jpg',150),(3,'Tôm chiên xù',1,'https://naifood.com/wp-content/uploads/2022/03/tom-chien-xu.jpg',200),(4,'Chả giò hải sản',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',150),(5,'Bò kho bánh mì',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(6,'Gà bó xôi',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',300),(7,'Cơm chiên',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',200),(8,'Tôm hấp bia',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',250),(9,'Dê hấp sả',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(10,'Lẩu cá lăng',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(11,'Lẩu thái',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(12,'Lẩu rêu cua đồng',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(13,'Chè bưởi',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(14,'Bánh tiramisu',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',120),(15,'Trái cây',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',80),(16,'Rau câu',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',80),(17,'Chè đậu xanh',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(20,'Salad cá ngừ',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',200),(21,'Salad trái cây',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',150),(22,'Bò sốt vang',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(23,'Bia',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',20),(24,'Nước ngọt',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',15),(25,'Nước suối',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',10),(50,'Gà tầm',2,'https://res.cloudinary.com/dzznkotwg/image/upload/v1662270009/mlx6cl1vsbcucnbn20t0.jpg',200),(51,'Com',1,'https://res.cloudinary.com/dzznkotwg/image/upload/v1662291343/ybj01ux0fgvgxeismtjr.jpg',2000);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content` varchar(250) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (6,11,'hello','2022-09-03 22:23:44'),(7,11,'gà vcl','2022-09-03 22:47:15');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_service`
--

DROP TABLE IF EXISTS `list_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_service`
--

LOCK TABLES `list_service` WRITE;
/*!40000 ALTER TABLE `list_service` DISABLE KEYS */;
INSERT INTO `list_service` VALUES (1,100),(2,10500),(3,10500),(4,12500),(5,10500),(6,2000),(7,500),(8,10000),(9,10500),(10,500),(11,500),(12,10000),(13,10500),(14,10000),(15,10000),(16,10000),(17,10000),(18,10000),(19,1000),(20,1000),(21,500),(22,500),(23,500),(24,500),(25,500),(26,500),(27,1000),(28,1000),(29,10000),(30,10000),(31,10000),(32,10000),(33,10000),(34,500),(35,500),(36,500),(37,500),(38,500),(39,10000),(40,10000),(41,500),(42,500),(43,500),(44,500),(45,500),(46,500),(47,500),(48,500),(49,500),(50,10500),(51,10500),(52,10500),(53,10000),(54,10000),(55,10000),(56,10000),(57,10000),(58,10500),(59,10500),(60,500),(61,10000),(62,500),(63,500),(64,500),(65,10000),(66,10000),(67,10000),(68,500),(69,10500),(70,500),(71,10000),(72,10000),(73,500),(74,500),(75,500),(76,10500),(77,10500),(78,500),(79,10500),(80,10500),(81,500);
/*!40000 ALTER TABLE `list_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_describe` varchar(45) DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,200),(8,NULL,350),(9,NULL,350),(10,NULL,450),(11,NULL,350),(12,NULL,250),(13,NULL,250),(14,NULL,100),(15,NULL,150),(16,NULL,450),(17,NULL,150),(18,NULL,100),(19,NULL,250),(20,NULL,250),(21,NULL,350),(22,NULL,250),(23,NULL,250),(24,NULL,200),(25,NULL,200),(26,NULL,100),(27,NULL,100),(28,NULL,100),(29,NULL,100),(30,NULL,100),(31,NULL,100),(32,NULL,450),(33,NULL,450),(34,NULL,150),(35,NULL,150),(36,NULL,200),(37,NULL,200),(38,NULL,150),(39,NULL,150),(40,NULL,150),(41,NULL,250),(42,NULL,250),(43,NULL,250),(44,NULL,250),(45,NULL,250),(46,NULL,250),(47,NULL,250),(48,NULL,250),(49,NULL,250),(50,NULL,100),(51,NULL,100),(52,NULL,100),(53,NULL,100),(54,NULL,100),(55,NULL,250),(56,NULL,250),(57,NULL,250),(58,NULL,250),(59,NULL,250),(60,NULL,250),(61,NULL,250),(62,NULL,150),(63,NULL,150),(64,NULL,150),(65,NULL,250),(66,NULL,250),(67,NULL,350),(68,NULL,150),(69,NULL,100),(70,NULL,100),(71,NULL,100),(72,NULL,350),(73,NULL,350),(74,NULL,350),(75,NULL,250),(76,NULL,350),(77,NULL,350),(78,NULL,150),(79,NULL,350),(80,NULL,150),(81,NULL,150),(82,NULL,150),(83,NULL,500),(84,NULL,250),(85,NULL,350),(86,NULL,250),(87,NULL,250),(88,NULL,350);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_dish`
--

DROP TABLE IF EXISTS `menu_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_id_idx` (`menu_id`),
  KEY `fk_dish_id_idx` (`dish_id`),
  CONSTRAINT `fk_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dish`
--

LOCK TABLES `menu_dish` WRITE;
/*!40000 ALTER TABLE `menu_dish` DISABLE KEYS */;
INSERT INTO `menu_dish` VALUES (26,1,2),(27,1,3),(28,8,3),(29,8,2),(30,9,2),(31,9,3),(32,10,1),(33,10,2),(34,10,3),(35,11,2),(36,11,3),(37,12,1),(38,12,2),(39,13,1),(40,13,2),(41,14,1),(42,15,2),(43,16,1),(44,16,2),(45,16,3),(47,18,1),(48,19,1),(49,19,2),(50,20,1),(51,20,2),(52,21,2),(53,21,3),(54,22,1),(55,22,2),(56,23,1),(57,23,2),(58,24,20),(59,25,20),(60,26,1),(61,27,1),(62,28,1),(63,29,1),(64,30,1),(65,31,1),(66,32,1),(67,32,2),(68,32,3),(69,33,1),(70,33,2),(71,33,3),(74,36,20),(75,37,20),(76,38,2),(77,39,2),(78,40,2),(79,41,1),(80,41,2),(81,42,1),(82,42,2),(83,43,1),(84,43,2),(85,45,1),(86,44,1),(87,44,2),(88,45,2),(89,46,1),(90,46,2),(91,47,1),(92,47,2),(93,48,1),(94,48,2),(95,49,1),(96,49,2),(97,50,1),(98,51,1),(99,52,1),(100,53,1),(101,54,1),(102,55,1),(103,55,2),(104,56,1),(105,56,2),(106,57,1),(107,57,2),(108,58,1),(109,58,2),(110,59,1),(111,59,2),(112,60,1),(113,60,2),(114,61,1),(115,61,2),(116,62,2),(117,63,2),(118,64,2),(119,65,1),(120,65,2),(121,66,1),(122,66,2),(123,67,2),(124,67,3),(125,68,2),(126,69,1),(127,70,1),(128,71,1),(129,72,2),(130,72,3),(131,73,2),(132,73,3),(133,74,2),(134,74,3),(135,75,1),(136,75,2),(137,76,2),(138,76,3),(139,77,2),(140,77,3),(141,78,2),(142,79,2),(143,79,3),(144,80,2),(145,81,2),(146,82,2),(147,83,2),(148,83,3),(149,83,4),(150,84,1),(151,84,2),(152,85,2),(153,85,3),(154,87,1),(155,86,1),(156,87,2),(157,86,2),(158,88,2),(159,88,3);
/*!40000 ALTER TABLE `menu_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_wedding_time`
--

DROP TABLE IF EXISTS `price_wedding_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_wedding_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `session` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_wedding_time`
--

LOCK TABLES `price_wedding_time` WRITE;
/*!40000 ALTER TABLE `price_wedding_time` DISABLE KEYS */;
INSERT INTO `price_wedding_time` VALUES (1,1,'morning'),(2,1.3,'affternoon'),(3,1.5,'night');
/*!40000 ALTER TABLE `price_wedding_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `service_describe` text,
  `name` varchar(45) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,2000,'Người dẫn chương trình trong tiệc cưới','MC','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg'),(2,500,NULL,'Bánh kem','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg'),(3,10000,NULL,'Thuê trang phục cưới','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg'),(4,2000,NULL,'Trang điểm','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg'),(5,3000,NULL,'Quay phim ngày cưới','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg'),(6,1000,NULL,'Trang trí tiệc cưới','https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_detail`
--

DROP TABLE IF EXISTS `services_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `list_service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_id_idx` (`service_id`),
  KEY `fk_list_service_id_idx` (`list_service_id`),
  CONSTRAINT `fk_list_service_id` FOREIGN KEY (`list_service_id`) REFERENCES `list_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_detail`
--

LOCK TABLES `services_detail` WRITE;
/*!40000 ALTER TABLE `services_detail` DISABLE KEYS */;
INSERT INTO `services_detail` VALUES (1,2,1),(2,3,1),(3,3,2),(4,2,2),(5,3,3),(6,2,3),(7,3,4),(8,2,4),(9,1,4),(10,2,5),(11,3,5),(12,1,6),(13,2,7),(14,3,8),(15,2,9),(16,3,9),(17,2,10),(18,2,11),(19,3,12),(20,2,13),(21,3,13),(22,3,14),(23,3,15),(24,3,16),(25,3,17),(26,3,18),(27,6,19),(28,6,20),(29,2,21),(30,2,22),(31,2,23),(32,2,24),(33,2,25),(34,2,26),(35,6,27),(36,6,28),(37,3,29),(38,3,30),(39,3,31),(40,3,32),(41,3,33),(42,2,34),(43,2,35),(44,2,36),(45,2,37),(46,2,38),(47,3,39),(48,3,40),(49,2,41),(50,2,42),(51,2,43),(52,2,44),(53,2,45),(54,2,46),(55,2,47),(56,2,48),(57,2,49),(58,2,50),(59,3,50),(60,2,51),(61,3,51),(62,2,52),(63,3,52),(64,3,53),(65,3,54),(66,3,55),(67,3,56),(68,3,57),(69,2,58),(70,3,58),(71,2,59),(72,3,59),(73,2,60),(74,3,61),(75,2,62),(76,2,63),(77,2,64),(78,3,65),(79,3,66),(80,3,67),(81,2,68),(82,2,69),(83,3,69),(84,2,70),(85,3,71),(86,3,72),(87,2,73),(88,2,74),(89,2,75),(90,3,76),(91,2,76),(92,2,77),(93,3,77),(94,2,78),(95,2,80),(96,2,79),(97,3,79),(98,3,80),(99,2,81);
/*!40000 ALTER TABLE `services_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `role` varchar(45) NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `mobile` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'dan12gkhoa123bn@gmail.com','$2a$10$exSrFxGh4KoMIkT5tNry8uGa5n117ybwmYExbV0jJDeJkCFH0R0Ay','Ho112','2002-12-19','ROLE_ADMIN','https://res.cloudinary.com/dzznkotwg/image/upload/v1662212938/cly4agr9gnnenmmmmcgh.jpg','0972257123'),(12,'dangkhoa123bn@gmail.com','$2a$10$JfAK.83LdMkDSPpAy2WEXeSbyzIsFaZ/zr/9wkNNQDbttFUnkSefG','Khoa12','2001-12-19','ROLE_USER','https://res.cloudinary.com/dzznkotwg/image/upload/v1662217054/q4mzax97snlrvdm04rr2.jpg','0972257687'),(13,'khoa@gmail.com','$2a$10$jYbbBLc/e4OLP8kkLYj0HOR7QPidGB1zxgT6tHtiwzD8FgqnlErw2','khoa','2001-12-19','ROLE_STAFF','https://res.cloudinary.com/dzznkotwg/image/upload/v1662226668/b6droti0livth1warkik.png','1111111111');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_hall`
--

DROP TABLE IF EXISTS `wedding_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_hall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `capacity` int NOT NULL,
  `describe_hall` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `price` int NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_hall`
--

LOCK TABLES `wedding_hall` WRITE;
/*!40000 ALTER TABLE `wedding_hall` DISABLE KEYS */;
INSERT INTO `wedding_hall` VALUES (1,'Rose',30,NULL,NULL,3000,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(2,'SunFlower',30,NULL,'Hỏng',2800,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(3,'Camellia',30,NULL,NULL,2700,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(5,'Tulip',20,NULL,NULL,2800,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(6,'Lotus',20,NULL,NULL,2700,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(7,'Pense',10,NULL,NULL,1000,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(8,'Violet',10,NULL,NULL,1200,'https://melisacenter.vn/uploads/CN5A8538.jpg');
/*!40000 ALTER TABLE `wedding_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_party_orders`
--

DROP TABLE IF EXISTS `wedding_party_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_party_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `wh_id` int DEFAULT NULL,
  `pwt_id` int DEFAULT NULL,
  `order_date` date NOT NULL,
  `menu_id` int NOT NULL,
  `amount` int NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `type_pay` varchar(45) NOT NULL,
  `quantity_table` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  `list_service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id_UNIQUE` (`menu_id`),
  UNIQUE KEY `list_service_id_UNIQUE` (`list_service_id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_menu_id_idx` (`menu_id`),
  KEY `fk_pwt_id_idx` (`pwt_id`),
  KEY `fk_wh_id_idx` (`wh_id`),
  KEY `fk_list_service_idx` (`list_service_id`),
  CONSTRAINT `fk_list_service` FOREIGN KEY (`list_service_id`) REFERENCES `list_service` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pwt_id` FOREIGN KEY (`pwt_id`) REFERENCES `price_wedding_time` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wh_id` FOREIGN KEY (`wh_id`) REFERENCES `wedding_hall` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_party_orders`
--

LOCK TABLES `wedding_party_orders` WRITE;
/*!40000 ALTER TABLE `wedding_party_orders` DISABLE KEYS */;
INSERT INTO `wedding_party_orders` VALUES (104,11,1,2,'2022-09-21',82,7400,1,'momo',20,NULL,75),(105,11,1,1,'2022-12-12',83,23500,1,'momo-card',20,NULL,76),(106,11,1,3,'2022-09-16',84,20000,1,'momo',20,NULL,77),(107,11,1,3,'2022-09-07',85,12000,0,'momo-card',20,NULL,78),(108,13,1,1,'2022-09-21',86,33500,1,'momo',80,NULL,80),(109,13,1,1,'2022-09-21',87,33500,0,'momo',80,NULL,79),(110,13,1,1,'2022-09-21',88,10500,0,'momo',20,NULL,81);
/*!40000 ALTER TABLE `wedding_party_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-04 18:47:33
