-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for klinik_312010141
CREATE DATABASE IF NOT EXISTS `klinik_312010141` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `klinik_312010141`;

-- Dumping structure for table klinik_312010141.berobat
CREATE TABLE IF NOT EXISTS `berobat` (
  `id_berobat` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(5) NOT NULL,
  `id_dokter` int(5) NOT NULL,
  `tgl_berobat` date NOT NULL,
  `keluhan_pasien` varchar(200) NOT NULL,
  `hasil_diagnosa` varchar(200) NOT NULL,
  `penatalaksana` enum('Rawat Jalan','Rawat Inap','Rujuk','Lainnya') NOT NULL,
  PRIMARY KEY (`id_berobat`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_dokter` (`id_dokter`),
  CONSTRAINT `FK_berobat_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_berobat_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.berobat: ~4 rows (approximately)
INSERT INTO `berobat` (`id_berobat`, `id_pasien`, `id_dokter`, `tgl_berobat`, `keluhan_pasien`, `hasil_diagnosa`, `penatalaksana`) VALUES
	(1, 9, 11, '2022-06-12', 'Depresi', 'Diputusin Pacar', 'Rawat Jalan'),
	(2, 6, 10, '2022-06-12', 'Maag', 'Telat Makan', 'Rujuk'),
	(3, 8, 12, '2022-06-10', 'Pusing', 'Gapunya Duit', 'Rujuk'),
	(4, 7, 13, '2022-06-09', 'Muntaber', 'Diare', 'Rawat Inap');

-- Dumping structure for table klinik_312010141.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `id_dokter` int(5) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.dokter: ~4 rows (approximately)
INSERT INTO `dokter` (`id_dokter`, `nama_dokter`) VALUES
	(10, 'Bambang'),
	(11, 'Ketut'),
	(12, 'Rudi'),
	(13, 'Septi');

-- Dumping structure for table klinik_312010141.obat
CREATE TABLE IF NOT EXISTS `obat` (
  `id_obat` int(5) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(100) NOT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.obat: ~4 rows (approximately)
INSERT INTO `obat` (`id_obat`, `nama_obat`) VALUES
	(1, 'Paracetamol'),
	(2, 'Panadol'),
	(3, 'Aspirin'),
	(4, 'Oskadon');

-- Dumping structure for table klinik_312010141.pasien
CREATE TABLE IF NOT EXISTS `pasien` (
  `id_pasien` int(5) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `umur` int(2) NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.pasien: ~4 rows (approximately)
INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `umur`) VALUES
	(6, 'Ica', 'P', 20),
	(7, 'Asep', 'L', 18),
	(8, 'Agung', 'L', 30),
	(9, 'Andre', 'L', 25);

-- Dumping structure for table klinik_312010141.resep_obat
CREATE TABLE IF NOT EXISTS `resep_obat` (
  `id_resep` int(11) NOT NULL AUTO_INCREMENT,
  `id_berobat` int(11) NOT NULL,
  `id_obat` int(5) NOT NULL,
  PRIMARY KEY (`id_resep`),
  KEY `id_obat` (`id_obat`),
  KEY `id_berobat` (`id_berobat`),
  CONSTRAINT `FK_resep_obat_berobat` FOREIGN KEY (`id_berobat`) REFERENCES `berobat` (`id_berobat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_resep_obat_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.resep_obat: ~0 rows (approximately)
INSERT INTO `resep_obat` (`id_resep`, `id_berobat`, `id_obat`) VALUES
	(1, 3, 2),
	(3, 2, 4),
	(4, 1, 3);

-- Dumping structure for table klinik_312010141.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_lengkap` varchar(40) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table klinik_312010141.user: ~0 rows (approximately)
INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`) VALUES
	(1, 'dinda', '1234', 'Dinda Adriani'),
	(2, 'ramdhan123', '4321', 'Ramdhan S'),
	(3, 'septyuye', 'qwerty', 'Septy Ningsih'),
	(4, 'rezariy', 'poiu', 'Reza Riyaldi');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
