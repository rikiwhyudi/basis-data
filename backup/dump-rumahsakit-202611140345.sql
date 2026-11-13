-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: rumahsakit
-- ------------------------------------------------------
-- Server version	26.10.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '20b449cc-dec0-11f1-ba2d-46a078a4e44f:1-2';

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nama_admin` varchar(30) DEFAULT NULL,
  `waktu_jaga` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `administrator_id_admin_IDX` (`id_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Dentra','Shift-Pagi');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daftar`
--

DROP TABLE IF EXISTS `daftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daftar` (
  `id_daftar` int NOT NULL AUTO_INCREMENT,
  `id_pasien` int DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  PRIMARY KEY (`id_daftar`),
  KEY `daftar_id_pasien_IDX` (`id_pasien`) USING BTREE,
  KEY `daftar_id_admin_IDX` (`id_admin`) USING BTREE,
  CONSTRAINT `daftar_administrator_FK` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `daftar_pasien_FK` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftar`
--

LOCK TABLES `daftar` WRITE;
/*!40000 ALTER TABLE `daftar` DISABLE KEYS */;
/*!40000 ALTER TABLE `daftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(30) DEFAULT NULL,
  `alamat_dokter` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `spesialis` varchar(15) DEFAULT NULL,
  `waktu_kerja` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_dokter`),
  KEY `dokter_id_dokter_IDX` (`id_dokter`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
INSERT INTO `dokter` VALUES (1,'Riki Wahyudi','Tg Priok, Jakarta Utara',NULL,NULL,'Jantung','Shift-Pagi'),(2,'John Doe','Tangerang Selatan','2000-10-26',NULL,'Jantung','Shift-Malam');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokter_admin`
--

DROP TABLE IF EXISTS `dokter_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokter_admin` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_dokter` int DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `dokter_admin_id_dokter_IDX` (`id_dokter`) USING BTREE,
  KEY `dokter_admin_id_admin_IDX` (`id_admin`) USING BTREE,
  CONSTRAINT `dokter_admin_administrator_FK` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dokter_admin_dokter_FK` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter_admin`
--

LOCK TABLES `dokter_admin` WRITE;
/*!40000 ALTER TABLE `dokter_admin` DISABLE KEYS */;
INSERT INTO `dokter_admin` VALUES (1,1,1);
/*!40000 ALTER TABLE `dokter_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obat` (
  `id_obat` int NOT NULL AUTO_INCREMENT,
  `kode_obat` varchar(5) DEFAULT NULL,
  `nama_obat` varchar(30) DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `stok` int DEFAULT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
INSERT INTO `obat` VALUES (1,'A001','Amikacin',20000,10),(2,'A002','Amoxillin',15000,15),(3,'A003','Betadine',7000,5);
/*!40000 ALTER TABLE `obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `alamat_pasien` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `penyakit` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`),
  KEY `pasien_id_pasien_IDX` (`id_pasien`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien`
--

LOCK TABLES `pasien` WRITE;
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
INSERT INTO `pasien` VALUES (1,'Septin','Permai Koja','1',NULL,NULL),(2,'Tito','Jl. Pakis Haji no 23','1',NULL,NULL),(3,'Hanif','Jl. Babakan loa no 22','1',NULL,NULL),(5,'Luthfi','Jl. Dipenogoro 24','1',NULL,NULL);
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien_dokter`
--

DROP TABLE IF EXISTS `pasien_dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasien_dokter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dokter` int DEFAULT NULL,
  `id_pasien` int DEFAULT NULL,
  `waktu_periksa` date DEFAULT NULL,
  `resep` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasien_dokter_id_dokter_IDX` (`id_dokter`) USING BTREE,
  KEY `pasien_dokter_id_pasien_IDX` (`id_pasien`) USING BTREE,
  CONSTRAINT `pasien_dokter_dokter_FK` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_dokter_pasien_FK` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien_dokter`
--

LOCK TABLES `pasien_dokter` WRITE;
/*!40000 ALTER TABLE `pasien_dokter` DISABLE KEYS */;
INSERT INTO `pasien_dokter` VALUES (1,1,1,'2026-10-27','Pil obat jantung 3x sehari');
/*!40000 ALTER TABLE `pasien_dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_obat`
--

DROP TABLE IF EXISTS `transaksi_obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi_obat` (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `id_pasien` int DEFAULT NULL,
  `id_obat` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `transaksi_obat_id_pasien_IDX` (`id_pasien`) USING BTREE,
  KEY `transaksi_obat_id_obat_IDX` (`id_obat`) USING BTREE,
  CONSTRAINT `transaksi_obat_obat_FK` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksi_obat_pasien_FK` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_obat`
--

LOCK TABLES `transaksi_obat` WRITE;
/*!40000 ALTER TABLE `transaksi_obat` DISABLE KEYS */;
INSERT INTO `transaksi_obat` VALUES (1,1,2,5,0);
/*!40000 ALTER TABLE `transaksi_obat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tg_jual` AFTER INSERT ON `transaksi_obat` FOR EACH ROW BEGIN
    UPDATE obat 
    SET stok = stok - NEW.jumlah 
    WHERE id_obat = NEW.id_obat;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'rumahsakit'
--
/*!50003 DROP PROCEDURE IF EXISTS `transaksi1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `transaksi1`()
BEGIN
	START TRANSACTION;
	
	INSERT INTO pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin) VALUES (2, 'Tito', 'Jl. Pakis Haji no 23', 1);
	
	SELECT * FROM pasien;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaksi2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `transaksi2`()
BEGIN
	START TRANSACTION;
	
	INSERT INTO pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin) VALUES (2, 'Tito', 'Jl. Pakis Haji no 23', 1);
	
	SELECT * FROM pasien;
	
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaksi3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `transaksi3`()
BEGIN
	START TRANSACTION;
	
	UPDATE rumahsakit.pasien SET nama_pasien='Danar' WHERE id_pasien=1;
	
	SELECT * FROM pasien;
	
	ROLLBACK;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaksi4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `transaksi4`()
BEGIN
	START TRANSACTION;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (3, 'Hanif', 'Jl. Babakan loa no 22', 1);
	
	ROLLBACK;
	
	UPDATE rumahsakit.pasien SET nama_pasien='Septin' WHERE id_pasien=1;
	
	COMMIT;
	
	SELECT * FROM pasien;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaksi5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `transaksi5`()
BEGIN
	START TRANSACTION;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (3, 'Hanif', 'Jl. Babakan loa no 22', 1);
	SAVEPOINT POINT1;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (4, 'Tina', 'Jl. Sangkuriang no 45', 2);
	ROLLBACK TO SAVEPOINT POINT1;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (5, 'Luthfi', 'Jl. Dipenogoro 24', 1);
	COMMIT;
	
	SELECT * FROM pasien;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14  3:45:45
