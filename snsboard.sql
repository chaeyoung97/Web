-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: snsboard
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `boardNum` varchar(3) DEFAULT NULL,
  `view` int(11) DEFAULT 0,
  `good` int(11) DEFAULT 0,
  `comment` int(11) DEFAULT 0,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (51,'admin','2020-07-01 21:02:18','첫번째 게시글','안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 ','1',26,0,5),(52,'aaa','2020-07-01 21:37:20','두번째 글이네요','ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅍ','2',4,0,2),(53,'bbb','2020-07-01 21:44:26','안녕하세요','오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?오늘은 뭐 먹지?\r\n오늘은 뭐 먹지?','2',3,0,1),(54,'bbb','2020-07-01 21:45:46','으아아','아아아아하하하하하하','1',2,0,1),(55,'bbb','2020-07-01 21:46:04','하하','하하하하하!!','2',6,2,2),(56,'ccc','2020-07-01 21:51:40','글 써봐요','풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n풍경보고가세요~!\r\n','1',14,8,1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT NULL,
  `id` varchar(10) DEFAULT NULL,
  `ment` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (19,51,'admin','안녕','2020-07-01 21:06:58'),(20,51,'admin','안녕하세요','2020-07-01 21:32:02'),(22,51,'aaa','ㅎㅎㅎ','2020-07-01 22:21:43'),(23,52,'aaa','댓글 좀 남겨주세요','2020-07-01 21:40:38'),(24,55,'ccc','g하하하하!','2020-07-01 21:50:00'),(25,54,'ccc','하하하ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ!','2020-07-01 21:50:13'),(26,53,'ccc','삼겹살','2020-07-01 21:50:22'),(27,52,'ccc','ㅎㅇㅎㅇ','2020-07-01 21:50:29'),(28,51,'ccc','안녕하세요','2020-07-01 21:50:40'),(29,56,'aaa','안녕하세요','2020-07-01 22:20:03'),(30,55,'aaa','^____^','2020-07-01 22:20:14');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (44,52,'images1.png'),(45,52,'sun1.jpg'),(46,52,'daffy1.gif'),(47,53,'run1.gif'),(48,53,'hahah1.jpg'),(49,56,'daffy2.gif'),(50,56,'hahah2.jpg'),(51,56,'images1.jpg'),(52,56,'images3.png');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (7,'admin','1234','admin.@inha.ac.kr'),(8,'aaa','a1234','aaa@inha.com'),(9,'bbb','b1234','bbb@inha.com'),(10,'ccc','c1234','ccc@inha.ac.kr');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-01 23:30:10
