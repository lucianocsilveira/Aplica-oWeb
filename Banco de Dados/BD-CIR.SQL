CREATE DATABASE  IF NOT EXISTS `cir` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cir`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: cir
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (2,2,'2016-05-02','Conjunto de garrafas Pet',2,'http://www.cir.com.br/img/anuncio1.jpg',2),(3,2,'2016-05-02','Fardo de embalagens plásticas',2,'http://www.cir.com.br/img/anuncio2.jpg',2);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,1,'Papelão'),(2,2,'Garrafa Pet'),(3,2,'Embalagens');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria_tipo`
--

LOCK TABLES `categoria_tipo` WRITE;
/*!40000 ALTER TABLE `categoria_tipo` DISABLE KEYS */;
INSERT INTO `categoria_tipo` VALUES (1,'Papel'),(2,'Plastico');
/*!40000 ALTER TABLE `categoria_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `chat_detalhe`
--

LOCK TABLES `chat_detalhe` WRITE;
/*!40000 ALTER TABLE `chat_detalhe` DISABLE KEYS */;
INSERT INTO `chat_detalhe` VALUES (5,1,'2016-05-03 10:02:00','','Bom dia, estou querendo ver teu material'),(6,1,'2016-05-03 10:03:00','Blz, onde vc mora?',''),(7,1,'2016-05-03 10:03:00','','Catolé'),(8,1,'2016-05-03 10:03:00','ok, moro perto do Luiza Mota, nos encontramos la amanha as 10:00',''),(9,1,'2016-05-03 10:03:00','','Combinado');
/*!40000 ALTER TABLE `chat_detalhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `chat_master`
--

LOCK TABLES `chat_master` WRITE;
/*!40000 ALTER TABLE `chat_master` DISABLE KEYS */;
INSERT INTO `chat_master` VALUES (1,2,2,3);
/*!40000 ALTER TABLE `chat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'PB','Campina grande');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
INSERT INTO `denuncias` VALUES (1,2,'Anuncio falso. O usuário não possui o material','2016-05-20',2);
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (2,2,3);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Luciano SIlveira','luciano@email.com', '02445985412',1),(3,'Diego Brow','dimiiguel@gmail.com','84765367467',1),(4,'Alusca Tchuca','aluska@email.com','94876374654',1),(5,'Diego Miguel','dms@email.com','0000022222',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cir'
--

--
-- Dumping routines for database 'cir'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-14 14:33:00
