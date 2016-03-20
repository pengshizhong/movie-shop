-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	5.6.25-0ubuntu1

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `buy_time` datetime DEFAULT NULL,
  `schedule_id` int(11) NOT NULL,
  `col` int(11) DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `fk_account_to_user` (`user_id`),
  KEY `sch_id` (`schedule_id`),
  CONSTRAINT `fk_account_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sch_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,5,'2015-11-11 00:00:00',1,3,4),(2,7,'2015-11-17 10:20:20',1,9,7),(3,7,'2015-11-17 10:20:20',1,9,14),(4,7,'2015-11-17 10:20:20',1,10,8),(5,7,'2015-11-17 10:33:25',1,10,14),(6,7,'2015-11-17 10:34:07',1,5,7),(7,7,'2015-11-17 10:34:38',1,6,14),(8,7,'2015-11-17 10:34:38',1,14,14),(9,7,'2015-11-17 10:35:07',1,5,4),(10,7,'2015-11-17 10:36:24',1,1,14),(11,7,'2015-11-17 10:38:00',1,14,1),(12,7,'2015-11-17 10:38:48',1,14,8),(13,7,'2015-11-17 10:40:04',1,13,14),(14,7,'2015-11-17 10:40:27',1,12,14),(15,7,'2015-11-17 10:40:32',1,7,14),(16,7,'2015-11-17 10:42:00',1,14,13),(17,7,'2015-11-17 11:03:24',1,1,1),(18,7,'2015-11-17 11:09:35',1,2,1),(19,7,'2015-11-22 11:13:57',1,3,1),(20,7,'2015-11-24 08:57:39',1,5,1),(21,7,'2015-11-25 11:09:38',2,7,5),(22,7,'2015-11-25 11:09:55',2,4,6),(23,9,'2016-03-02 07:48:09',2,8,10),(24,9,'2016-03-02 07:48:09',2,11,6),(25,9,'2016-03-02 07:48:09',2,12,12),(26,9,'2016-03-02 07:49:04',5,5,8),(27,9,'2016-03-02 07:49:04',5,9,9),(28,9,'2016-03-02 07:55:44',3,9,5),(29,9,'2016-03-02 08:06:41',3,11,11),(30,9,'2016-03-02 08:06:41',3,10,12),(31,9,'2016-03-02 08:06:41',3,13,13);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@163.com','sign');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`author_id`),
  KEY `movie_author` (`movie_id`),
  KEY `cinema_author` (`cinema_id`),
  CONSTRAINT `cinema_author` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_author` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `coverurl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (5,'','大杭州','112','你个鸡',''),(8,NULL,'sadass','asdas','sd的','img/c5.jpg'),(9,NULL,'sadass','asdas','sd','img/c6.jpg'),(10,'','34','dsadsa','112','');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `score` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `adddate` datetime NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_movie_id` (`movie_id`),
  CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (18,'fdsgzxngfjtrgf','6.0',5,6,'2015-09-05 13:04:51','654'),(19,'dsagdsgds','gd',5,6,'2015-09-05 13:06:53','6y5');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`hall_id`),
  KEY `cinema_to_hall` (`cinema_id`),
  CONSTRAINT `cinema_to_hall` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (5,'叶子厅','3D',5),(6,'天河城一号','3D',8),(7,'成都一号','3D',9),(8,'广州天娱厅','3D',10);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(9999) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `coverurl` varchar(45) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `actor` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `runningtime` int(11) DEFAULT NULL,
  `showtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (6,'破风','飚车少年彭于晏又一运动题材电影，跟王珞丹窦骁等通常飚车好不刺激','9.0','img/5.jpg','林超贤','彭于晏，窦骁','3D','大陆',2,'2015-08-11 14:18:41','2015-08-21 14:18:45'),(7,'煎饼侠','吊丝男士大棚在吃煎饼的时候被煎饼呛到摇身一变煎饼侠拯救世界','9.0','img/6.jpg','大鹏','大鹏，柳岩','3D','大陆',2,'2015-08-17 14:20:29','2015-08-27 14:20:33'),(8,'太平轮','矫情女人章子怡本色出演出航遇险变寡妇，然后跟隔壁老王的爱恨情仇','9.0','img/7.jpg','吴申宇','章子怡，金城武','3D','大陆',2,'2015-08-11 14:23:06','2015-08-28 14:23:10'),(9,'终结者：创世纪','国产保护月结束的第一部外文片，中国观众报复性观影严重各种自来水你不来看看？','1.0','img/8.jpg','鬼佬','外国路人甲','3D','美国',2,'2015-08-23 14:24:57','2015-08-31 14:25:02'),(10,'的撒大',NULL,NULL,'大厦达','的撒大',NULL,'3D',NULL,NULL,NULL,NULL),(11,'让人',NULL,NULL,'淡定','淡定',NULL,'3D',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `price` double(60,0) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `s_movie` (`movie_id`),
  KEY `s_hall` (`hall_id`),
  CONSTRAINT `s_hall` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2015-11-12 00:00:00',50,5,6),(2,'2015-11-12 00:00:00',50,5,7),(3,'2015-11-12 00:00:00',50,5,8),(4,'2015-11-12 00:00:00',50,5,9),(5,'2015-11-12 00:00:00',50,5,6);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `col` int(11) DEFAULT NULL,
  `cow` int(11) DEFAULT NULL,
  `seatcol` varchar(45) DEFAULT '',
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `headurl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'er@qq.com','12231231','456','bigbig','qwe'),(5,'test@163.com','test','13711686138','霹雳娇娃','img/head.jpg'),(6,'68@163.com','98',NULL,NULL,NULL),(7,'523724329@qq.com','1213','13538805451','dsa1212','image/33.jpg'),(8,'1231@qq.com','123','13538805451','dsa1212','image/33.jpg'),(9,'','','-','aa1f0b27d04f17b80f7cf5cc6cd3455d','headicon.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-18 15:32:53
