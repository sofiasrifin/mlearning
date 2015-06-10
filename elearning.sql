# Host: localhost  (Version: 5.5.36)
# Date: 2014-11-16 16:45:50
# Generator: MySQL-Front 5.3  (Build 2.16)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id_admin` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT 'administrator',
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'admin',
  `alamat` text NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (4,'admin','21232f297a57a5a743894a0e4a801fc3','Redo Kusuma','admin','Bengkulu','0853 ','gudugkusuma@gmail.com','N','4s9rht101uou703vc4m2mabvp7');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

#
# Source for table "chat"
#

DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "chat"
#


#
# Source for table "file_materi"
#

DROP TABLE IF EXISTS `file_materi`;
CREATE TABLE `file_materi` (
  `id_file` int(7) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(5) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(50) NOT NULL,
  `hits` int(3) NOT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

#
# Data for table "file_materi"
#

/*!40000 ALTER TABLE `file_materi` DISABLE KEYS */;
INSERT INTO `file_materi` VALUES (78,'B.Ind','8b','BI1','','2014-10-28','7',0);
/*!40000 ALTER TABLE `file_materi` ENABLE KEYS */;

#
# Source for table "jawaban"
#

DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_tq` int(50) NOT NULL,
  `id_quiz` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `jawaban` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "jawaban"
#

INSERT INTO `jawaban` VALUES (5,28,77,5,'persamaan kata'),(6,28,78,5,'perlawanan kata'),(7,29,79,5,'persamaan kata'),(8,29,80,5,'pelawanaan kata');

#
# Source for table "kelas"
#

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_kelas` varchar(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

#
# Data for table "kelas"
#

/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (12,'8b','VIII - B',7,12),(13,'8c','VIII - C',0,0),(14,'8d','VIII - D',0,0),(15,'8e','VIII - E',0,0),(16,'9a','VIIII - A',0,0),(17,'9b','VIIII - B',0,0),(18,'9c','VIIII - C',0,0),(19,'9d','VIIII - D',0,0),(20,'9e','VIIII - E',0,0);
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;

#
# Source for table "mata_pelajaran"
#

DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_matapelajaran` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kelas` (`id_kelas`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Data for table "mata_pelajaran"
#

/*!40000 ALTER TABLE `mata_pelajaran` DISABLE KEYS */;
INSERT INTO `mata_pelajaran` VALUES (10,'M1','Matematika','7a',1,''),(11,'BI1','Bahasa Indonesia','8b',7,''),(12,'B1','Bahasa Inggris','7a',0,''),(13,'G1','Geografi','7a',0,''),(15,'BI2','Bahasa Indonesia','7b',6,''),(16,'B2','Bahasa Inggris','7b',0,'');
/*!40000 ALTER TABLE `mata_pelajaran` ENABLE KEYS */;

#
# Source for table "modul"
#

DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `status` enum('pengajar','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "modul"
#

/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
INSERT INTO `modul` VALUES (2,'Manajemen Admin','?module=admin','','','N','admin','N',2,''),(10,'Manajemen Modul','?module=modul','','','N','admin','N',1,''),(18,'Materi','?module=materi','','','N','pengajar','Y',6,'semua-berita.html'),(31,'Mata Pelajaran','?module=matapelajaran','','','Y','pengajar','Y',5,''),(37,'Manajemen Siswa','?module=siswa','','gedungku.jpg','Y','admin','Y',3,'profil-kami.html'),(41,'Manajemen Kelas',' ?module=kelas','','','N','pengajar','Y',4,'semua-agenda.html'),(63,'Manajemen Quiz','?module=quiz','','','N','pengajar','Y',7,''),(65,'Registrasi Siswa','?module=registrasi','','','Y','admin','Y',8,'');
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;

#
# Source for table "nilai"
#

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE `nilai` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `benar` int(10) NOT NULL,
  `salah` int(10) NOT NULL,
  `tidak_dikerjakan` int(50) NOT NULL,
  `persentase` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "nilai"
#

INSERT INTO `nilai` VALUES (1,29,5,2,0,0,100),(2,30,7,4,1,0,80),(3,32,12,0,1,0,0);

#
# Source for table "nilai_soal_esay"
#

DROP TABLE IF EXISTS `nilai_soal_esay`;
CREATE TABLE `nilai_soal_esay` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `nilai` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Data for table "nilai_soal_esay"
#

/*!40000 ALTER TABLE `nilai_soal_esay` DISABLE KEYS */;
INSERT INTO `nilai_soal_esay` VALUES (14,29,5,'80');
/*!40000 ALTER TABLE `nilai_soal_esay` ENABLE KEYS */;

#
# Source for table "online"
#

DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `ip` varchar(20) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `online` varchar(1) NOT NULL,
  PRIMARY KEY (`id_siswa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "online"
#

/*!40000 ALTER TABLE `online` DISABLE KEYS */;
INSERT INTO `online` VALUES ('127.0.0.1',5,'2011-07-14','T'),('::1',7,'2012-03-31','T'),('::1',9,'2011-12-28','T'),('::1',11,'2014-10-28','T'),('::1',12,'2014-10-28','Y');
/*!40000 ALTER TABLE `online` ENABLE KEYS */;

#
# Source for table "pengajar"
#

DROP TABLE IF EXISTS `pengajar`;
CREATE TABLE `pengajar` (
  `id_pengajar` int(9) NOT NULL AUTO_INCREMENT,
  `nip` char(12) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(100) NOT NULL,
  `password_login` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'pengajar',
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `jabatan` varchar(200) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pengajar`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "pengajar"
#

/*!40000 ALTER TABLE `pengajar` DISABLE KEYS */;
INSERT INTO `pengajar` VALUES (7,'100100','Redo Kusuma','pengajar','21232f297a57a5a743894a0e4a801fc3','pengajar','bengkulu','seluma','2010-07-21','L','Islam','0987','gudugkusuma@gmail.com','1536751_704799576221539_1857547251_n (1).jpg','http://www.redokusuma.net','Kepsek','N','lsis9lm4mbvfgoncqpocn3t7u1');
/*!40000 ALTER TABLE `pengajar` ENABLE KEYS */;

#
# Source for table "quiz_esay"
#

DROP TABLE IF EXISTS `quiz_esay`;
CREATE TABLE `quiz_esay` (
  `id_quiz` int(9) NOT NULL AUTO_INCREMENT,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'esay',
  PRIMARY KEY (`id_quiz`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

#
# Data for table "quiz_esay"
#

/*!40000 ALTER TABLE `quiz_esay` DISABLE KEYS */;
INSERT INTO `quiz_esay` VALUES (79,29,'pengertian dari sinonim','','2011-07-13','esay'),(80,29,'pengertian dari antonim','','2011-07-13','esay');
/*!40000 ALTER TABLE `quiz_esay` ENABLE KEYS */;

#
# Source for table "quiz_pilganda"
#

DROP TABLE IF EXISTS `quiz_pilganda`;
CREATE TABLE `quiz_pilganda` (
  `id_quiz` int(10) NOT NULL AUTO_INCREMENT,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `kunci` varchar(1) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'pilganda',
  PRIMARY KEY (`id_quiz`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

#
# Data for table "quiz_pilganda"
#

/*!40000 ALTER TABLE `quiz_pilganda` DISABLE KEYS */;
INSERT INTO `quiz_pilganda` VALUES (203,29,'pengertina dari sinonim','','persamaan','perlawanan','perumpamaan','perulangan','A','2011-07-13','pilganda'),(204,29,'pengertian dari antonim<span class=\"Apple-tab-span\" style=\"white-space:pre\">\t</span>','','persamaan','perlawanan','perumpamaan','perulangan','B','2011-07-13','pilganda'),(205,30,'adfa','','asda','asdf','asdf','asdf','B','2012-03-10','pilganda'),(206,30,'asdfaasd','','asd','asd','asdfsd','asdf','B','2012-03-10','pilganda'),(207,30,'asdfasdf','','asdf','asd','asd','asdfasd','B','2012-03-10','pilganda'),(208,30,'fgderd','','sdf','asdfgasdfg','sdfgs','sdf','B','2012-03-10','pilganda'),(209,30,'jjhljhlj','',';kj','kjjh','jhkjh','kjhkjhjkh','B','2012-03-10','pilganda'),(210,31,'test pertanyaan','','iya','tidak ','bukan','bukan sekali','C','2012-03-22','pilganda'),(211,29,'tanya 1','','a','b','c','d','A','2014-09-14','pilganda'),(212,32,'tanya 1','','a','b','c','d','A','2014-10-28','pilganda');
/*!40000 ALTER TABLE `quiz_pilganda` ENABLE KEYS */;

#
# Source for table "registrasi_siswa"
#

DROP TABLE IF EXISTS `registrasi_siswa`;
CREATE TABLE `registrasi_siswa` (
  `id_registrasi` int(9) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(50) NOT NULL,
  `password_login` varchar(50) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `th_masuk` varchar(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `blokir` enum('Y','N') NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `id_session_soal` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'siswa',
  PRIMARY KEY (`id_registrasi`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "registrasi_siswa"
#

/*!40000 ALTER TABLE `registrasi_siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrasi_siswa` ENABLE KEYS */;

#
# Source for table "siswa"
#

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `id_siswa` int(9) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(50) NOT NULL,
  `password_login` varchar(50) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `th_masuk` varchar(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `blokir` enum('Y','N') NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `id_session_soal` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'siswa',
  PRIMARY KEY (`id_siswa`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "siswa"
#

/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES (11,'100100','Redo Kusuma','siswa','21232f297a57a5a743894a0e4a801fc3','1','Ketua Kelas','Bengkulu','Bengkulu','2013-12-10','L','Islam','Babbagge','KD','2010','gudugkusuma@gmail.com','0897','','N','hp91j9jkrn2b6g3ssvh3agl712','','siswa'),(12,'10','asrifin','asrifin','e10adc3949ba59abbe56e057f20f883e','8b','Ketua Kelas','','','2014-10-28','','0','','','','','','','N','2fq0lofqdu3ps7oh3rjrc9k2f2','10','siswa');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;

#
# Source for table "siswa_sudah_mengerjakan"
#

DROP TABLE IF EXISTS `siswa_sudah_mengerjakan`;
CREATE TABLE `siswa_sudah_mengerjakan` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_tq` int(20) NOT NULL,
  `id_siswa` varchar(200) NOT NULL,
  `dikoreksi` varchar(1) NOT NULL DEFAULT 'B',
  `hits` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "siswa_sudah_mengerjakan"
#

INSERT INTO `siswa_sudah_mengerjakan` VALUES (1,29,'5','S',1),(2,30,'7','B',1),(3,32,'12','B',1);

#
# Source for table "templates"
#

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id_templates` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_templates`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "templates"
#

/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (4,'Standar','Almazari','templates/almazari','Y');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;

#
# Source for table "topik_quiz"
#

DROP TABLE IF EXISTS `topik_quiz`;
CREATE TABLE `topik_quiz` (
  `id_tq` int(9) NOT NULL AUTO_INCREMENT,
  `judul` varchar(150) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(100) NOT NULL,
  `waktu_pengerjaan` int(50) NOT NULL,
  `info` text NOT NULL,
  `terbit` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_tq`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Data for table "topik_quiz"
#

/*!40000 ALTER TABLE `topik_quiz` DISABLE KEYS */;
INSERT INTO `topik_quiz` VALUES (29,'Tes Ulangan','7a','BI1','2011-07-13','6',3600,'mohon dikerjakan dengan benar','Y'),(30,'Ujian Bahasa Indonesia','7a','BI1','2012-03-10','admin',5400,'ini test bahasa indonesia','Y'),(31,'Test Masuk','7a','M1','2012-03-22','1',3000,'','Y'),(32,'Latihan Soal','8b','BI1','2014-10-28','7',1800,'','Y'),(33,'SOal','8b','BI1','2014-10-28','7',3600,'','Y');
/*!40000 ALTER TABLE `topik_quiz` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
