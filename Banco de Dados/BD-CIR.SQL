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
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `Anuncio_id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_id` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Tipo_Categoria` int(11) NOT NULL,
  `Imagem` mediumtext NOT NULL,
  `Categoria_Produto_id` int(11) NOT NULL,
  PRIMARY KEY (`Anuncio_id`),
  KEY `anuncio_usuario_idx` (`Usuario_id`),
  KEY `catprod_idx` (`Categoria_Produto_id`),
  CONSTRAINT `catprod` FOREIGN KEY (`Categoria_Produto_id`) REFERENCES `categoria` (`Categoria_Produto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_anuncio` FOREIGN KEY (`Usuario_id`) REFERENCES `usuarios` (`Usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (2,2,'2016-05-02','Conjunto de garrafas Pet',2,'http://www.cir.com.br/img/anuncio1.jpg',2),(3,2,'2016-05-02','Fardo de embalagens plásticas',2,'http://www.cir.com.br/img/anuncio2.jpg',2);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Categoria_Produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Categoria_id` int(11) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`Categoria_Produto_id`),
  KEY `Tipo_Produto_idx` (`Tipo_Categoria_id`),
  CONSTRAINT `Tipo_Produto` FOREIGN KEY (`Tipo_Categoria_id`) REFERENCES `categoria_tipo` (`Tipo_Categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,1,'Papelão'),(2,2,'Garrafa Pet'),(3,2,'Embalagens');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_tipo`
--

DROP TABLE IF EXISTS `categoria_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_tipo` (
  `Tipo_Categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`Tipo_Categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_tipo`
--

LOCK TABLES `categoria_tipo` WRITE;
/*!40000 ALTER TABLE `categoria_tipo` DISABLE KEYS */;
INSERT INTO `categoria_tipo` VALUES (1,'Papel'),(2,'Plastico');
/*!40000 ALTER TABLE `categoria_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_detalhe`
--

DROP TABLE IF EXISTS `chat_detalhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_detalhe` (
  `Chat_Detalhe_id` int(11) NOT NULL AUTO_INCREMENT,
  `Chat_Master_id` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `Chat_Anunciante` text NOT NULL,
  `Chat_Usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`Chat_Detalhe_id`),
  KEY `master_id_idx` (`Chat_Master_id`),
  CONSTRAINT `master_id` FOREIGN KEY (`Chat_Master_id`) REFERENCES `chat_master` (`Chat_Master_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_detalhe`
--

LOCK TABLES `chat_detalhe` WRITE;
/*!40000 ALTER TABLE `chat_detalhe` DISABLE KEYS */;
INSERT INTO `chat_detalhe` VALUES (5,1,'2016-05-03 10:02:00','','Bom dia, estou querendo ver teu material'),(6,1,'2016-05-03 10:03:00','Blz, onde vc mora?',''),(7,1,'2016-05-03 10:03:00','','Catolé'),(8,1,'2016-05-03 10:03:00','ok, moro perto do Luiza Mota, nos encontramos la amanha as 10:00',''),(9,1,'2016-05-03 10:03:00','','Combinado');
/*!40000 ALTER TABLE `chat_detalhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_master`
--

DROP TABLE IF EXISTS `chat_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_master` (
  `Chat_Master_id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_id_Anuncio` int(11) NOT NULL,
  `Anuncio_id` int(11) NOT NULL,
  `Usuario_Chat` int(11) NOT NULL,
  PRIMARY KEY (`Chat_Master_id`),
  KEY `anuncio_idx` (`Anuncio_id`),
  KEY `usuario_chat_idx` (`Usuario_id_Anuncio`,`Usuario_Chat`),
  KEY `usr_chat2_idx` (`Usuario_Chat`),
  CONSTRAINT `anuncio_chat` FOREIGN KEY (`Anuncio_id`) REFERENCES `anuncio` (`Anuncio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_chat` FOREIGN KEY (`Usuario_id_Anuncio`) REFERENCES `usuarios` (`Usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_chat2` FOREIGN KEY (`Usuario_Chat`) REFERENCES `usuarios` (`Usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_master`
--

LOCK TABLES `chat_master` WRITE;
/*!40000 ALTER TABLE `chat_master` DISABLE KEYS */;
INSERT INTO `chat_master` VALUES (1,2,2,3);
/*!40000 ALTER TABLE `chat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `Cidade_id` int(11) NOT NULL AUTO_INCREMENT,
  `UF` varchar(2) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`Cidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'PB','Campina grande');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denuncias` (
  `Denuncia_id` int(11) NOT NULL AUTO_INCREMENT,
  `Anuncio_id` int(11) NOT NULL,
  `Descricao` mediumtext NOT NULL,
  `Data` date NOT NULL,
  `Usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`Denuncia_id`),
  KEY `usuario_idx` (`Usuario_id`),
  KEY `anunciodenuncia_idx` (`Anuncio_id`),
  CONSTRAINT `anunciodenuncia` FOREIGN KEY (`Anuncio_id`) REFERENCES `anuncio` (`Anuncio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usrdenuncia` FOREIGN KEY (`Usuario_id`) REFERENCES `usuarios` (`Usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
INSERT INTO `denuncias` VALUES (1,2,'Anuncio falso. O usuário não possui o material','2016-05-20',2);
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `Favorito_id` int(11) NOT NULL AUTO_INCREMENT,
  `Anuncio_id` int(11) NOT NULL,
  `Usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`Favorito_id`),
  KEY `anuncio_idx` (`Anuncio_id`),
  KEY `usuario_idx` (`Usuario_id`),
  CONSTRAINT `anuncio` FOREIGN KEY (`Anuncio_id`) REFERENCES `anuncio` (`Anuncio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_fav` FOREIGN KEY (`Usuario_id`) REFERENCES `usuarios` (`Usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (2,2,3);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CPF_CNPJ` varchar(15) NOT NULL,
  `Cidade_id` int(11) NOT NULL,
  `Data_Cadastro` date NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Senha` varchar(16) NOT NULL,
  PRIMARY KEY (`Usuario_id`),
  KEY `Cidade_idx` (`Cidade_id`),
  CONSTRAINT `Cidade` FOREIGN KEY (`Cidade_id`) REFERENCES `cidades` (`Cidade_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Luciano SIlveira','02445985412',1,'2016-05-01','',''),(3,'Diego Brow','84765367467',1,'2016-05-01','',''),(4,'Alusca Tchuca','94876374654',1,'2016-05-01','',''),(5,'Diego Miguel','0000022222',1,'2016-09-13','','');
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

-- Dump completed on 2016-09-15 13:53:01
