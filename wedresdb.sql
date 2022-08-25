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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Súp hải sản',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(2,'Gỏi ngó sen tôm thịt',1,'https://cdn.tgdd.vn/Files/2022/04/04/1423782/goi-y-8-mon-nguoi-khai-vi-cho-nhung-buoi-tiec-hoi-hop-voi-gia-dinh-202204040914134517.jpg',150),(3,'Tôm chiên xù',1,'https://naifood.com/wp-content/uploads/2022/03/tom-chien-xu.jpg',200),(4,'Chả giò hải sản',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',150),(5,'Bò kho bánh mì',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(6,'Gà bó xôi',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',300),(7,'Cơm chiên',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',200),(8,'Tôm hấp bia',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',250),(9,'Dê hấp sả',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(10,'Lẩu cá lăng',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(11,'Lẩu thái',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(12,'Lẩu rêu cua đồng',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(13,'Chè bưởi',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(14,'Bánh tiramisu',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',120),(15,'Trái cây',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',80),(16,'Rau câu',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',80),(17,'Chè đậu xanh',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',100),(18,'Sữa chua',3,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',50),(19,'Gỏi thái',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',150),(20,'Salad cá ngừ',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',200),(21,'Salad trái cây',1,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',150),(22,'Bò sốt vang',2,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',350),(23,'Bia',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',20),(24,'Nước ngọt',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',15),(25,'Nước suối',4,'https://naifood.com/wp-content/uploads/2022/02/cha-gio-re-dat-tiec-buffet9.jpg',10);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `describe` varchar(45) DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dish`
--

LOCK TABLES `menu_dish` WRITE;
/*!40000 ALTER TABLE `menu_dish` DISABLE KEYS */;
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
INSERT INTO `price_wedding_time` VALUES (1,1,'morning'),(2,1.3,'affternoon'),(3,1.5,'night'),(4,2,'wekkend');
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
  `price` float NOT NULL,
  `describe` text,
  `name` varchar(45) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `wpo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_id_idx` (`service_id`),
  KEY `fk_wpo_id_idx` (`wpo_id`),
  CONSTRAINT `fk_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_wpo_id` FOREIGN KEY (`wpo_id`) REFERENCES `wedding_party_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_detail`
--

LOCK TABLES `services_detail` WRITE;
/*!40000 ALTER TABLE `services_detail` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'dangkhoa123bn@gmail.com','$2a$10$gnpQh3uP25DhFyAG/BIPB.N5uhD0SKE3hK7kuAOZ2AqSsyqGUjUFm','Khoa','2022-08-10','ROLE_USER',NULL,'0972257687'),(3,'dangkhoa1234bn@gmail.com','$2a$10$YbNwmkfLeCdYLvENfC48qum7quN5IOGsHlki6Qi8Zi8uH34YmqiwK','Hoa','2022-08-15','ROLE_USER',NULL,'0972257688');
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
  `describe` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `price` int NOT NULL,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_hall`
--

LOCK TABLES `wedding_hall` WRITE;
/*!40000 ALTER TABLE `wedding_hall` DISABLE KEYS */;
INSERT INTO `wedding_hall` VALUES (1,'Rose',30,NULL,NULL,3000,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(2,'SunFlower',30,NULL,NULL,2800,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(3,'Camellia',30,NULL,NULL,2700,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(4,'Daisy',20,NULL,NULL,2000,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(5,'Tulip',20,NULL,NULL,2800,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(6,'Lotus',20,NULL,NULL,2700,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(7,'Pense',10,NULL,NULL,1000,'https://melisacenter.vn/uploads/CN5A8538.jpg'),(8,'Violet',10,NULL,NULL,1200,'https://melisacenter.vn/uploads/CN5A8538.jpg');
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
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_menu_id_idx` (`menu_id`),
  KEY `fk_pwt_id_idx` (`pwt_id`),
  KEY `fk_wh_id_idx` (`wh_id`),
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pwt_id` FOREIGN KEY (`pwt_id`) REFERENCES `price_wedding_time` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wh_id` FOREIGN KEY (`wh_id`) REFERENCES `wedding_hall` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_party_orders`
--

LOCK TABLES `wedding_party_orders` WRITE;
/*!40000 ALTER TABLE `wedding_party_orders` DISABLE KEYS */;
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

-- Dump completed on 2022-08-24 20:17:52
