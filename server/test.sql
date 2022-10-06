-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: hyundai
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `DEVICE_MST`
--

DROP TABLE IF EXISTS `DEVICE_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_MST` (
  `DEVICE_ID` varchar(30) NOT NULL,
  `DEVICE_KIND` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DEVICE_ID`),
  UNIQUE KEY `DEVICE_MST_PK` (`DEVICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEVICE_MST`
--

LOCK TABLES `DEVICE_MST` WRITE;
/*!40000 ALTER TABLE `DEVICE_MST` DISABLE KEYS */;
INSERT INTO `DEVICE_MST` VALUES ('33333','test macbook'),('device-hyj','iPhone'),('device1','test macbook123'),('device2','ipadOS'),('device3','현대오토에버'),('devicetest','123');
/*!40000 ALTER TABLE `DEVICE_MST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUSH_MSG_GRP`
--

DROP TABLE IF EXISTS `PUSH_MSG_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUSH_MSG_GRP` (
  `PUSH_GRP_ID` varchar(20) NOT NULL,
  `PUSH_GRP_NAME` varchar(100) DEFAULT NULL,
  `USE_YN` varchar(1) DEFAULT NULL,
  `REG_DT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PUSH_GRP_ID`),
  UNIQUE KEY `PUSH_MSG_GRP_PK` (`PUSH_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUSH_MSG_GRP`
--

LOCK TABLES `PUSH_MSG_GRP` WRITE;
/*!40000 ALTER TABLE `PUSH_MSG_GRP` DISABLE KEYS */;
INSERT INTO `PUSH_MSG_GRP` VALUES ('p1','기기관련그룹','Y','2022-08-31 15:00:00'),('p2','all','Y','2021-12-31 15:00:00'),('p3','PushGroup','Y','2022-09-30 15:00:00');
/*!40000 ALTER TABLE `PUSH_MSG_GRP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUSH_MSG_MST`
--

DROP TABLE IF EXISTS `PUSH_MSG_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUSH_MSG_MST` (
  `PUSH_TITLE` varchar(20) DEFAULT NULL,
  `PUSH_CONTENT` varchar(50) DEFAULT NULL,
  `PUSH_REG_DT` timestamp NULL DEFAULT NULL,
  `PUSH_MSG_ID` int NOT NULL,
  PRIMARY KEY (`PUSH_MSG_ID`),
  UNIQUE KEY `PUSH_MSG_MST_PK` (`PUSH_MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUSH_MSG_MST`
--

LOCK TABLES `PUSH_MSG_MST` WRITE;
/*!40000 ALTER TABLE `PUSH_MSG_MST` DISABLE KEYS */;
INSERT INTO `PUSH_MSG_MST` VALUES ('기기이상감지','라인1의 기기 이상이 감지됨','2019-12-31 15:00:00',1),('이상발생','알람!!!!!!!','2022-08-04 15:00:00',2),('이상발생','설비 확인 요망','2022-08-06 15:00:00',3);
/*!40000 ALTER TABLE `PUSH_MSG_MST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUSH_MSG_SENT_HI`
--

DROP TABLE IF EXISTS `PUSH_MSG_SENT_HI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUSH_MSG_SENT_HI` (
  `SENT_STAT` varchar(1) DEFAULT NULL,
  `PUSH_GEN_DT` timestamp NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `DEVICE_ID` varchar(30) NOT NULL,
  `PUSH_MSG_ID` int NOT NULL,
  `SENT_DT` timestamp NULL DEFAULT NULL,
  KEY `R_161` (`PUSH_GEN_DT`,`USER_ID`,`DEVICE_ID`,`PUSH_MSG_ID`),
  CONSTRAINT `R_161` FOREIGN KEY (`PUSH_GEN_DT`, `USER_ID`, `DEVICE_ID`, `PUSH_MSG_ID`) REFERENCES `PUSH_MSG_SENT_QUEUE` (`PUSH_GEN_DT`, `USER_ID`, `DEVICE_ID`, `PUSH_MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUSH_MSG_SENT_HI`
--

LOCK TABLES `PUSH_MSG_SENT_HI` WRITE;
/*!40000 ALTER TABLE `PUSH_MSG_SENT_HI` DISABLE KEYS */;
INSERT INTO `PUSH_MSG_SENT_HI` VALUES ('s','2022-08-04 15:00:00','seunpark','device2',2,'2022-10-05 05:14:02'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-10-05 06:12:02'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-07-18 01:10:00'),('s','2022-08-04 15:00:00','seunpark','device2',2,'2022-10-05 05:14:02'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-10-05 06:12:02'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-18 03:45:03'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-18 03:45:02'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-18 03:45:02'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-18 03:45:03'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-18 03:45:02'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-18 03:45:02'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-18 03:45:03'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-18 03:45:02'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-18 03:45:02'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-09-03 01:10:00'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-09-03 01:10:00'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-09-03 01:10:00'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-09-03 01:10:00'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-09-03 01:10:00'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-09-03 01:10:00'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-09-03 01:10:03'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-09-03 01:10:03'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-18 12:45:07'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-18 12:45:07'),('N','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-18 03:45:04'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-18 03:45:04'),('N','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-18 03:45:04'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-19 03:45:04'),('N','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-19 06:45:05'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-19 04:45:06'),('Y','2019-12-31 15:00:00','seunpark','device1',1,'2022-05-19 12:45:07'),('Y','2022-08-04 15:00:00','seunpark','device2',2,'2022-05-21 12:45:07'),('Y','2022-08-04 15:00:00','seongsoo','device3',2,'2022-05-21 12:45:07');
/*!40000 ALTER TABLE `PUSH_MSG_SENT_HI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUSH_MSG_SENT_QUEUE`
--

DROP TABLE IF EXISTS `PUSH_MSG_SENT_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUSH_MSG_SENT_QUEUE` (
  `PUSH_GEN_DT` timestamp NOT NULL,
  `SENT_STAT` varchar(1) DEFAULT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `DEVICE_ID` varchar(30) NOT NULL,
  `SENT_CNT` int DEFAULT NULL,
  `PUSH_MSG_ID` int NOT NULL,
  `SENT_DT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PUSH_GEN_DT`,`USER_ID`,`DEVICE_ID`,`PUSH_MSG_ID`),
  UNIQUE KEY `PUSH_MSG_SENT_QUEUE_PK` (`PUSH_GEN_DT`,`USER_ID`,`DEVICE_ID`,`PUSH_MSG_ID`),
  KEY `R_158` (`USER_ID`,`DEVICE_ID`),
  KEY `R_159` (`PUSH_MSG_ID`),
  CONSTRAINT `R_158` FOREIGN KEY (`USER_ID`, `DEVICE_ID`) REFERENCES `USER_DEVICE_MGR` (`USER_ID`, `DEVICE_ID`),
  CONSTRAINT `R_159` FOREIGN KEY (`PUSH_MSG_ID`) REFERENCES `PUSH_MSG_MST` (`PUSH_MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUSH_MSG_SENT_QUEUE`
--

LOCK TABLES `PUSH_MSG_SENT_QUEUE` WRITE;
/*!40000 ALTER TABLE `PUSH_MSG_SENT_QUEUE` DISABLE KEYS */;
INSERT INTO `PUSH_MSG_SENT_QUEUE` VALUES ('2019-12-31 15:00:00','Y','seunpark','device1',3,1,'2022-10-03 15:00:00'),('2022-08-04 15:00:00','Y','seongsoo','device3',3,2,'2022-10-04 15:00:00'),('2022-08-04 15:00:00','Y','seunpark','device2',3,2,'2022-10-04 15:00:00');
/*!40000 ALTER TABLE `PUSH_MSG_SENT_QUEUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCR_DF`
--

DROP TABLE IF EXISTS `SCR_DF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCR_DF` (
  `SCR_NAME` varchar(100) DEFAULT NULL,
  `PARENT_SCR_ID` varchar(20) NOT NULL,
  `SCR_SORT` int DEFAULT NULL,
  `SCR_URL` varchar(200) DEFAULT NULL,
  `REG_DT` timestamp NULL DEFAULT NULL,
  `SCR_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`SCR_ID`),
  UNIQUE KEY `SCR_DF_PK` (`SCR_ID`),
  CONSTRAINT `R_48` FOREIGN KEY (`SCR_ID`) REFERENCES `SCR_DF` (`SCR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCR_DF`
--

LOCK TABLES `SCR_DF` WRITE;
/*!40000 ALTER TABLE `SCR_DF` DISABLE KEYS */;
INSERT INTO `SCR_DF` VALUES ('main','1',1,'/main','2019-12-31 16:01:01','1'),('push','1',1,'/push/history','2019-12-31 16:00:00','2'),('device','1',1,'/push/register','2019-12-31 16:00:00','3');
/*!40000 ALTER TABLE `SCR_DF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `USER_ID` varchar(20) NOT NULL,
  `USER_PWD` varchar(200) DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `REG_DT` varchar(8) DEFAULT NULL,
  `USER_FONT` varchar(20) DEFAULT NULL,
  `USER_LANG` varchar(1) NOT NULL DEFAULT 'N',
  `USER_COLOR` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_PK` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('seongsoo','pw','kimseongsoo','20221001','현대2','N','red'),('seunpark','pw','parkseunghan','20220909','현대','N','blue');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DEVICE_MGR`
--

DROP TABLE IF EXISTS `USER_DEVICE_MGR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_DEVICE_MGR` (
  `USER_ID` varchar(20) NOT NULL,
  `DEVICE_ID` varchar(30) NOT NULL,
  `MAX_RESENT_CNT` int DEFAULT NULL,
  `USE_YN` varchar(1) DEFAULT NULL,
  `USER_DEVICE_DESC` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`DEVICE_ID`),
  UNIQUE KEY `USER_DEVICE_MGR_PK` (`USER_ID`,`DEVICE_ID`),
  KEY `R_157` (`DEVICE_ID`),
  CONSTRAINT `R_144` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `R_157` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DEVICE_MST` (`DEVICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DEVICE_MGR`
--

LOCK TABLES `USER_DEVICE_MGR` WRITE;
/*!40000 ALTER TABLE `USER_DEVICE_MGR` DISABLE KEYS */;
INSERT INTO `USER_DEVICE_MGR` VALUES ('seongsoo','device3',7,'Y','123'),('seongsoo','devicetest',5,'N','123'),('seunpark','33333',3,'Y','testtest'),('seunpark','device-hyj',2,'Y','test'),('seunpark','device1',3,'Y','testtest123'),('seunpark','device2',3,'N','testtest');
/*!40000 ALTER TABLE `USER_DEVICE_MGR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FAVORITE_SCR`
--

DROP TABLE IF EXISTS `USER_FAVORITE_SCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FAVORITE_SCR` (
  `USER_ID` varchar(20) NOT NULL,
  `REG_DT` timestamp NULL DEFAULT NULL,
  `SCR_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_ID`,`SCR_ID`),
  UNIQUE KEY `USER_FAVORITE_SCR_PK` (`USER_ID`,`SCR_ID`),
  KEY `R_63` (`SCR_ID`),
  CONSTRAINT `R_62` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `R_63` FOREIGN KEY (`SCR_ID`) REFERENCES `SCR_DF` (`SCR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FAVORITE_SCR`
--

LOCK TABLES `USER_FAVORITE_SCR` WRITE;
/*!40000 ALTER TABLE `USER_FAVORITE_SCR` DISABLE KEYS */;
INSERT INTO `USER_FAVORITE_SCR` VALUES ('seunpark','2022-10-06 08:35:51','2');
/*!40000 ALTER TABLE `USER_FAVORITE_SCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_MSG_GRP`
--

DROP TABLE IF EXISTS `USER_MSG_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_MSG_GRP` (
  `USER_ID` varchar(20) NOT NULL,
  `PUSH_GRP_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_ID`,`PUSH_GRP_ID`),
  UNIQUE KEY `USER_MSG_GRP_PK` (`USER_ID`,`PUSH_GRP_ID`),
  KEY `R_156` (`PUSH_GRP_ID`),
  CONSTRAINT `R_154` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `R_156` FOREIGN KEY (`PUSH_GRP_ID`) REFERENCES `PUSH_MSG_GRP` (`PUSH_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_MSG_GRP`
--

LOCK TABLES `USER_MSG_GRP` WRITE;
/*!40000 ALTER TABLE `USER_MSG_GRP` DISABLE KEYS */;
INSERT INTO `USER_MSG_GRP` VALUES ('seongsoo','p1'),('seunpark','p1'),('seunpark','p3');
/*!40000 ALTER TABLE `USER_MSG_GRP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 20:02:49
