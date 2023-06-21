-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_streaming
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tb_ator`
--

DROP TABLE IF EXISTS `tb_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ator` (
  `id_ator` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `sobrenome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_nascimento` date NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_ator`),
  UNIQUE KEY `uq_foto_tb_autor` (`foto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ator`
--

LOCK TABLES `tb_ator` WRITE;
/*!40000 ALTER TABLE `tb_ator` DISABLE KEYS */;
INSERT INTO `tb_ator` VALUES (1,'Sandra','Bullock','1964-07-26','https://exemplo.com/sandra_bullock.jpg','2023-06-21'),(2,'George','Clooney','1961-05-06','https://exemplo.com/george_clooney.jpg','2023-06-21'),(3,'Mateus','Nascimento','1979-06-08','https://exemplo.com/mateus_nascimento.jpg','2023-06-21'),(4,'Selton','Mello','1972-12-30','https://exemplo.com/selton_mello.jpg','2023-06-21'),(5,'Matheus','Nachtigall','1982-02-18','https://exemplo.com/matheus_nachtigall.jpg','2023-06-21'),(6,'Leandro','Firmino','1978-06-23','https://exemplo.com/leandro_firmino.jpg','2023-06-21'),(7,'Masaki','Suda','1993-02-21','https://exemplo.com/masaki_suda.jpg','2023-06-21'),(8,'Hana','Sugisaki','1997-02-02','https://exemplo.com/hana_sugisaki.jpg','2023-06-21'),(9,'Ryo','Yoshizawa','1994-02-01','https://exemplo.com/ryo_yoshizawa.jpg','2023-06-21'),(10,'Jo','Byung-gyu','1996-04-23','https://exemplo.com/jo_byung_gyu.jpg','2023-06-21'),(11,'Yoon','Chan-young','1997-11-09','https://exemplo.com/yoon_chan_young.jpg','2023-06-21'),(12,'Itziar','Ituño','1974-06-18','https://exemplo.com/itziar_ituno.jpg','2023-06-21');
/*!40000 ALTER TABLE `tb_ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartao_credito`
--

DROP TABLE IF EXISTS `tb_cartao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cartao_credito` (
  `id_cartao` int NOT NULL AUTO_INCREMENT,
  `numero` char(19) COLLATE utf8mb4_general_ci NOT NULL,
  `data_vencimento` date NOT NULL,
  `cod_seguranca` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_cartao`),
  KEY `id_cliente_tb_cartao` (`id_cliente`),
  CONSTRAINT `id_cliente_tb_cartao` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartao_credito`
--

LOCK TABLES `tb_cartao_credito` WRITE;
/*!40000 ALTER TABLE `tb_cartao_credito` DISABLE KEYS */;
INSERT INTO `tb_cartao_credito` VALUES (1,'1234567890123456','2025-02-06','123',2,'2023-06-21'),(2,'9876543210987654','2024-12-09','321',1,'2023-06-21'),(3,'1111222233334444','2025-04-18','456',3,'2023-06-21');
/*!40000 ALTER TABLE `tb_cartao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo`
--

DROP TABLE IF EXISTS `tb_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo` (
  `id_catalogo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `ano_lancamento` year NOT NULL,
  `duracao` time DEFAULT '00:00:00',
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `imagem_capa` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `avaliacao` enum('1','2','3','4','5') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_classificacao_indicativa` int NOT NULL,
  `id_idioma_original` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_catalogo`),
  KEY `fk_id_classificacao_indicativa` (`id_classificacao_indicativa`),
  KEY `fk_id_idioma_original` (`id_idioma_original`),
  CONSTRAINT `fk_id_classificacao_indicativa` FOREIGN KEY (`id_classificacao_indicativa`) REFERENCES `tb_classificacao_indicativa` (`id_classificacao_indicativa`),
  CONSTRAINT `fk_id_idioma_original` FOREIGN KEY (`id_idioma_original`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo`
--

LOCK TABLES `tb_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_catalogo` DISABLE KEYS */;
INSERT INTO `tb_catalogo` VALUES (1,'gravidade',2013,'01:31:00','Dra. Ryan Stone e o astronauta Matt Kowalsky trabalham juntos para sobreviver\ndepois que um acidente os deixa completamente à deriva no espaço, sem ligação com a Terra e sem esperança de resgate.','https://br.web.img3.acsta.net/pictures/210/232/21023259_20130729194021309.jpg','4',3,2,'2023-06-21'),(2,'o auto da compadecida',2000,'01:44:00','As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. \nEles estão sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela região.','https://images-americanas.b2w.io/produtos/4959596043/imagens/dvd-duplo-o-auto-da-compadecida/4959596043_1_xlarge.jpg','5',3,1,'2023-06-21'),(3,'bleach',2018,'01:48:00','O jovem Ichigo é surpreendido com indesejadas habilidades de ceifeiro de almas e quer devolver os poderes.\nMas deve executar algumas tarefas antes.','https://cdn.fstatic.com/media/movies/covers/2018/06/Cartaz_-_Bleach_live-action.jpg','3',3,5,'2023-06-21'),(4,'All Of Us Are Dead',2022,'00:00:00','Uma epidemia mortal surge em uma escola. Encurralados, os alunos só tem uma opção: lutar com todas as forças para não virarem zumbis.','https://static.wikia.nocookie.net/dublagem/images/2/2f/All_Of_Us_Are_Dead.jpeg/revision/latest?cb=20220130000924&path-prefix=pt-br','4',6,5,'2023-06-21'),(5,'la casa de papel',2017,'00:00:00','Oito ladrões se trancam com reféns na Casa da Moeda da Espanha. \nSeu líder manipula a polícia para realizar um plano que pode ser o maior roubo da história ou uma missão em vão.','https://cdn.folhape.com.br/img/pc/1100/1/dn_arquivo/2021/08/pt-br-lcdp-s5-main-vertical-rgb-pre-2.jpg,','5',5,3,'2023-06-21');
/*!40000 ALTER TABLE `tb_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_categoria`
--

DROP TABLE IF EXISTS `tb_catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo_categoria` (
  `id_catalogo` int NOT NULL,
  `id_categoria` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_catalogo`,`id_categoria`),
  KEY `fk_id_categoria_tb_catalogo_categoria` (`id_categoria`),
  CONSTRAINT `fk_id_catalogo_tb_catalogo_categoria` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `fk_id_categoria_tb_catalogo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_categoria`
--

LOCK TABLES `tb_catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_categoria` DISABLE KEYS */;
INSERT INTO `tb_catalogo_categoria` VALUES (1,1,'2023-06-21'),(1,2,'2023-06-21'),(2,4,'2023-06-21'),(2,6,'2023-06-21'),(3,1,'2023-06-21'),(3,3,'2023-06-21'),(4,1,'2023-06-21'),(4,3,'2023-06-21'),(4,5,'2023-06-21'),(5,1,'2023-06-21'),(5,5,'2023-06-21');
/*!40000 ALTER TABLE `tb_catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_idioma`
--

DROP TABLE IF EXISTS `tb_catalogo_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo_idioma` (
  `id_catalogo` int NOT NULL,
  `id_idioma` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_catalogo`,`id_idioma`),
  KEY `fk_id_idioma` (`id_idioma`),
  CONSTRAINT `fk_id_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `fk_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_idioma`
--

LOCK TABLES `tb_catalogo_idioma` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_idioma` DISABLE KEYS */;
INSERT INTO `tb_catalogo_idioma` VALUES (1,1,'2023-06-21'),(1,2,'2023-06-21'),(1,3,'2023-06-21'),(1,4,'2023-06-21'),(1,5,'2023-06-21'),(2,1,'2023-06-21'),(3,1,'2023-06-21'),(3,2,'2023-06-21'),(3,3,'2023-06-21'),(3,5,'2023-06-21'),(4,1,'2023-06-21'),(4,2,'2023-06-21'),(4,3,'2023-06-21'),(4,4,'2023-06-21'),(4,5,'2023-06-21'),(5,1,'2023-06-21'),(5,2,'2023-06-21'),(5,3,'2023-06-21'),(5,4,'2023-06-21'),(5,5,'2023-06-21');
/*!40000 ALTER TABLE `tb_catalogo_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `uq_nome_tb_categoria` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'suspense','2023-06-21'),(2,'ficção','2023-06-21'),(3,'terror','2023-06-21'),(4,'nacional','2023-06-21'),(5,'drama','2023-06-21'),(6,'comedia','2023-06-21');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classificacao_indicativa`
--

DROP TABLE IF EXISTS `tb_classificacao_indicativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_classificacao_indicativa` (
  `id_classificacao_indicativa` int NOT NULL AUTO_INCREMENT,
  `idade` enum('livre','10','12','14','16','18') COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_classificacao_indicativa`),
  UNIQUE KEY `uq_idade` (`idade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classificacao_indicativa`
--

LOCK TABLES `tb_classificacao_indicativa` WRITE;
/*!40000 ALTER TABLE `tb_classificacao_indicativa` DISABLE KEYS */;
INSERT INTO `tb_classificacao_indicativa` VALUES (1,'livre','O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.','2023-06-21'),(2,'10','pode conter algum tipo de violência leve, linguagem moderada ou temas levemente mais complexos, mas adequados para crianças com pelo menos 10 anos de idade.','2023-06-21'),(3,'12',' pode conter violência um pouco mais intensa, linguagem um pouco mais forte e temas que possam ser mais complexos para crianças mais jovens. ','2023-06-21'),(4,'14',' pode conter violência mais intensa, linguagem mais forte, temas adultos e situações que podem não ser adequadas para espectadores com menos de 14 anos','2023-06-21'),(5,'16',' pode conter violência intensa, linguagem mais pesada, conteúdo sexual, temas maduros','2023-06-21'),(6,'18','é destinado apenas para adultos e pode conter violência extrema, linguagem explícita, cenas de sexo explícito, consumo de drogas, entre outros elementos que não são apropriados para espectadores menores de 18 anos.','2023-06-21');
/*!40000 ALTER TABLE `tb_classificacao_indicativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_plano` int DEFAULT NULL,
  `dt_vencimento_plano` date DEFAULT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_id_usuario_tb_cliente` (`id_usuario`),
  KEY `fk_id_plano_tb_cliente` (`id_plano`),
  CONSTRAINT `fk_id_plano_tb_cliente` FOREIGN KEY (`id_plano`) REFERENCES `tb_plano` (`id_plano`),
  CONSTRAINT `fk_id_usuario_tb_cliente` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,4,1,'2023-06-30','2023-06-21'),(2,5,3,'2023-06-30','2023-06-21'),(3,6,2,'2023-06-30','2023-06-21');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_elenco`
--

DROP TABLE IF EXISTS `tb_elenco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_elenco` (
  `id_catalogo` int NOT NULL,
  `id_ator` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_catalogo`,`id_ator`),
  KEY `fk_ator_tb_elenco` (`id_ator`),
  CONSTRAINT `fk_ator_tb_elenco` FOREIGN KEY (`id_ator`) REFERENCES `tb_ator` (`id_ator`),
  CONSTRAINT `fk_catalogo_tb_elenco` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_elenco`
--

LOCK TABLES `tb_elenco` WRITE;
/*!40000 ALTER TABLE `tb_elenco` DISABLE KEYS */;
INSERT INTO `tb_elenco` VALUES (1,1,'2023-06-21'),(1,2,'2023-06-21'),(2,3,'2023-06-21'),(2,4,'2023-06-21'),(3,5,'2023-06-21'),(3,6,'2023-06-21'),(4,7,'2023-06-21'),(4,8,'2023-06-21'),(4,9,'2023-06-21'),(5,10,'2023-06-21'),(5,11,'2023-06-21'),(5,12,'2023-06-21');
/*!40000 ALTER TABLE `tb_elenco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `setor` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_rua` int unsigned NOT NULL,
  `complemento` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_casa` int NOT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pais` int NOT NULL,
  `id_estado` int DEFAULT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_id_pais_tb_endereco` (`id_pais`),
  KEY `fk_id_estado` (`id_estado`),
  CONSTRAINT `fk_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `tb_estado` (`id_estado`),
  CONSTRAINT `fk_id_pais_tb_endereco` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,'oeste',2,'avenida das nações',12,'estrutural',1,3,'2023-06-21'),(2,'norte',25,'praca das garças',8,'Konohagakure',4,1,'2023-06-21'),(3,'sul',66,'lugar nenhum',7,'Chamartín',3,4,'2023-06-21'),(4,'leste',47,'rua silveiro silva',2,'Waryong tomb',5,2,'2023-06-21'),(5,'oeste',34,'bairro pinheiros',8,'Brentwood',2,5,'2023-06-21');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_episodio`
--

DROP TABLE IF EXISTS `tb_episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_episodio` (
  `id_episodio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` tinyint NOT NULL,
  `duracao` time NOT NULL,
  `id_temporada` int NOT NULL,
  `id_serie` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_episodio`),
  KEY `fk_id_temporada_tb_episodio` (`id_temporada`),
  KEY `fk_id_serie_tb_episodio` (`id_serie`),
  CONSTRAINT `fk_id_serie_tb_episodio` FOREIGN KEY (`id_serie`) REFERENCES `tb_serie` (`id_serie`),
  CONSTRAINT `fk_id_temporada_tb_episodio` FOREIGN KEY (`id_temporada`) REFERENCES `tb_temporada` (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_episodio`
--

LOCK TABLES `tb_episodio` WRITE;
/*!40000 ALTER TABLE `tb_episodio` DISABLE KEYS */;
INSERT INTO `tb_episodio` VALUES (1,'Efectuar lo acordado',1,'00:00:00',2,2,'2023-06-21'),(2,'Efectuar lo acordado',2,'00:00:00',2,2,'2023-06-21'),(3,'Se acabaron las máscaras ',1,'00:00:00',3,2,'2023-06-21'),(4,'Ataque zumbi na escola',1,'00:00:00',1,1,'2023-06-21'),(5,'Esta escola está FEITO!',2,'00:00:00',1,1,'2023-06-21');
/*!40000 ALTER TABLE `tb_episodio` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_episodio_temporada` AFTER INSERT ON `tb_episodio` FOR EACH ROW BEGIN
		UPDATE tb_temporada SET qtd_episodio = qtd_episodio + 1
		WHERE id_temporada = NEW.id_temporada;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_episodio_serie` AFTER INSERT ON `tb_episodio` FOR EACH ROW BEGIN
		UPDATE tb_serie SET qtd_episodios = qtd_episodios + 1
		WHERE id_serie = NEW.id_serie;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pais` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `fk_id_pais_tb_usuario` (`id_pais`),
  CONSTRAINT `fk_id_pais_tb_usuario` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES (1,'tóquio',4,'2023-06-21'),(2,'seoul',5,'2023-06-21'),(3,'brasilia',1,'2023-06-21'),(4,'madri',3,'2023-06-21'),(5,'washington',2,'2023-06-21');
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filme`
--

DROP TABLE IF EXISTS `tb_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_filme` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `id_catalogo` int NOT NULL,
  `oscar` tinyint NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_filme`),
  UNIQUE KEY `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filme`
--

LOCK TABLES `tb_filme` WRITE;
/*!40000 ALTER TABLE `tb_filme` DISABLE KEYS */;
INSERT INTO `tb_filme` VALUES (1,2,0,'2023-06-21'),(2,3,0,'2023-06-21'),(3,1,1,'2023-06-21');
/*!40000 ALTER TABLE `tb_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_foto` (`foto`),
  UNIQUE KEY `uq_id_usuario_tb_funcionario` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_tb_funcionario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (1,1,'https://i.pinimg.com/236x/47/c8/e6/47c8e62006fb9b9a8867497f843aefba--john-cena.jpg','2023-06-21'),(2,2,'https://i.pinimg.com/236x/f6/67/06/f66706e67fbf8332af7cc692834d44ca--peliculas-disney-alice-liddell.jpg','2023-06-21'),(3,3,'https://i.pinimg.com/564x/1a/4b/ee/1a4bee35be954518a7cadf00e0d08157.jpg','2023-06-21');
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_idioma`
--

DROP TABLE IF EXISTS `tb_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_idioma` (
  `id_idioma` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_idioma`),
  UNIQUE KEY `uq_nome_tb_idioma` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_idioma`
--

LOCK TABLES `tb_idioma` WRITE;
/*!40000 ALTER TABLE `tb_idioma` DISABLE KEYS */;
INSERT INTO `tb_idioma` VALUES (1,'português','2023-06-21'),(2,'inglês','2023-06-21'),(3,'espanhol','2023-06-21'),(4,'coreano','2023-06-21'),(5,'japones','2023-06-21');
/*!40000 ALTER TABLE `tb_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `dt_pagamento` datetime NOT NULL,
  `id_cartao_credito` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tipo_pagamento` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_id_cartao_credito` (`id_cartao_credito`),
  KEY `fk_id_cliente_tb_pagamento` (`id_cliente`),
  KEY `fk_id_tipo_pagamento` (`id_tipo_pagamento`),
  CONSTRAINT `fk_id_cartao_credito` FOREIGN KEY (`id_cartao_credito`) REFERENCES `tb_cartao_credito` (`id_cartao`),
  CONSTRAINT `fk_id_cliente_tb_pagamento` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_id_tipo_pagamento` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tb_tipo_pagamento` (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
INSERT INTO `tb_pagamento` VALUES (1,100,'2023-06-16 12:00:00',2,1,1,'2023-06-21'),(2,50,'2023-06-16 10:30:00',NULL,2,2,'2023-06-21'),(3,75,'2023-06-16 15:45:00',NULL,3,5,'2023-06-21');
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `codigo` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `uq_nome_tb_pais` (`nome`),
  UNIQUE KEY `uq_codigo_tb_pais` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
INSERT INTO `tb_pais` VALUES (1,'brasil','bra','2023-06-21'),(2,'estados unidos','eua','2023-06-21'),(3,'espanha','esp','2023-06-21'),(4,'japão','jpn','2023-06-21'),(5,'coreia do sul','kor','2023-06-21');
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais_catalogo`
--

DROP TABLE IF EXISTS `tb_pais_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais_catalogo` (
  `id_pais` int NOT NULL,
  `id_catalogo` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_pais`,`id_catalogo`),
  KEY `fk_id_catalogo_tb_pais_catalogo` (`id_catalogo`),
  CONSTRAINT `fk_id_catalogo_tb_pais_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `fk_id_pais_tb_pais_catalogo` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais_catalogo`
--

LOCK TABLES `tb_pais_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_pais_catalogo` DISABLE KEYS */;
INSERT INTO `tb_pais_catalogo` VALUES (1,2,'2023-06-21'),(2,1,'2023-06-21'),(3,5,'2023-06-21'),(4,3,'2023-06-21'),(5,4,'2023-06-21');
/*!40000 ALTER TABLE `tb_pais_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perfil`
--

DROP TABLE IF EXISTS `tb_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` enum('adulto','crianca','personalizado') COLLATE utf8mb4_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `fk_id_cliente_tb_perfil` (`id_cliente`),
  CONSTRAINT `fk_id_cliente_tb_perfil` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfil`
--

LOCK TABLES `tb_perfil` WRITE;
/*!40000 ALTER TABLE `tb_perfil` DISABLE KEYS */;
INSERT INTO `tb_perfil` VALUES (1,'perfil_a','https://img.freepik.com/vetores-premium/avatar-homem-barba_96853-399.jpg?w=2000','adulto',1,'2023-06-21'),(2,'perfil_c','https://static.vecteezy.com/system/resources/previews/010/141/732/non_2x/hand-drawn-kid-cartoon-sign-design-free-png.png','crianca',2,'2023-06-21'),(3,'perfil_p','https://i.ytimg.com/vi/S3iFG37kPro/maxresdefault.jpg','personalizado',3,'2023-06-21');
/*!40000 ALTER TABLE `tb_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano`
--

DROP TABLE IF EXISTS `tb_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_plano` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` float NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `uq_nome_tb_plano` (`nome`),
  UNIQUE KEY `uq_valor_tb_plano` (`valor`),
  UNIQUE KEY `uq_descricao_tb_plano` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano`
--

LOCK TABLES `tb_plano` WRITE;
/*!40000 ALTER TABLE `tb_plano` DISABLE KEYS */;
INSERT INTO `tb_plano` VALUES (1,'basico',25.9,'resolução (HD), livre de anúncios, proporciona acesso ao catálogo \ncompleto e permite que você faça downloads em dispositivos para assistir offline.','2023-06-21'),(2,'padrão',39.99,'duas telas simultâneas, (Full HD). Ideal para compartilhar o acesso com outra pessoa em uma mesma residência. Além disso, é livre de anúncios, \npermite fazer o download dos conteúdos para assistir offline','2023-06-21'),(3,'premium',55.99,'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.','2023-06-21');
/*!40000 ALTER TABLE `tb_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_serie`
--

DROP TABLE IF EXISTS `tb_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_serie` (
  `id_serie` int NOT NULL AUTO_INCREMENT,
  `id_catalogo` int NOT NULL,
  `qtd_temporadas` tinyint NOT NULL,
  `qtd_episodios` tinyint NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_serie`),
  UNIQUE KEY `uq_id_catalogo` (`id_catalogo`),
  CONSTRAINT `fk_catalogo_tb_serie` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_serie`
--

LOCK TABLES `tb_serie` WRITE;
/*!40000 ALTER TABLE `tb_serie` DISABLE KEYS */;
INSERT INTO `tb_serie` VALUES (1,4,0,0,'2023-06-21'),(2,5,0,0,'2023-06-21');
/*!40000 ALTER TABLE `tb_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_temporada`
--

DROP TABLE IF EXISTS `tb_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_temporada` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `id_serie` int NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `duracao` time DEFAULT '00:00:00',
  `qtd_episodio` tinyint NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_temporada`),
  KEY `fk_id_serie_tb_temporada` (`id_serie`),
  CONSTRAINT `fk_id_serie_tb_temporada` FOREIGN KEY (`id_serie`) REFERENCES `tb_serie` (`id_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_temporada`
--

LOCK TABLES `tb_temporada` WRITE;
/*!40000 ALTER TABLE `tb_temporada` DISABLE KEYS */;
INSERT INTO `tb_temporada` VALUES (1,'1º',1,'Uma epidemia mortal surge em uma escola. Encurralados, os alunos só tem uma opção: lutar com todas as forças para não virarem zumbis.','00:00:00',0,'2023-06-21'),(2,'1º',2,'Um grupo de 8 assaltantes,invadindo a Casa da Moeda da Espanha,porém eles não entram pra roubar o cofre e sim para FABRICAR o próprio dinheiro','00:00:00',0,'2023-06-21'),(3,'2º',2,'Oito ladrões se trancam com reféns na Casa da Moeda da Espanha. Seu líder manipula a polícia para realizar um plano. \nSerá o maior roubo da história, ou uma missão em vão?','00:00:00',0,'2023-06-21');
/*!40000 ALTER TABLE `tb_temporada` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_temporada_serie` AFTER INSERT ON `tb_temporada` FOR EACH ROW BEGIN
		UPDATE tb_serie SET qtd_temporadas = qtd_temporadas + 1
		WHERE id_serie = NEW.id_serie;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_tipo_pagamento`
--

DROP TABLE IF EXISTS `tb_tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_pagamento` (
  `id_tipo_pagamento` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `dt_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`),
  UNIQUE KEY `uq_categoria_tb_tipo_pagamento` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_pagamento`
--

LOCK TABLES `tb_tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tb_tipo_pagamento` VALUES (1,'cartão','2023-06-21'),(2,'pix','2023-06-21'),(3,'boleto','2023-06-21'),(4,'deposito bancario','2023-06-21'),(5,'WhatsApp Pay','2023-06-21');
/*!40000 ALTER TABLE `tb_tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `sobrenome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(95) COLLATE utf8mb4_general_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL,
  `id_endereco` int NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uq_email` (`email`),
  KEY `fk_id_endereco_tb_usuario` (`id_endereco`),
  CONSTRAINT `fk_id_endereco_tb_usuario` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Alice','Smith','alice.smith@example.com','1985-05-12','2023-06-16','02fc5e7e8e1f250a1f3417dc4e9d75ff',1,2,'2023-06-21'),(2,'Robert','Johnson','robert.johnson@example.com','1998-09-20','2023-06-08','574bf934c801603f9f128139d9c75c85',1,3,'2023-06-21'),(3,'Arthur','Jinner','Arthur.Jinner@example.com','2000-12-21','2023-08-12','4c04a5a49ab04f70145f46279fe78711',1,4,'2023-06-21'),(4,'Barbara','Jones','Barbara.Jones@example.com','2002-07-08','2023-10-16','5d103434f5173ff7731f20e68bef2fe8',1,5,'2023-06-21'),(5,'Joao','Mario','Joao.Mario@example.com','2001-04-29','2023-12-16','cdc85973ca5c76753aafd017f3cca250',1,5,'2023-06-21'),(6,'Bernado','Silva','Bernado.Silva@example.com','1992-10-29','2023-12-16','58e79c7ccb229717569e668ef9f802e0',1,1,'2023-06-21');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_streaming'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_ator`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_catalogo`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_catalogo
		WHERE id_catalogo = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_catalogo_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_catalogo_idioma`(valor_id_catalogo INT, valor_id_idioma INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = valor_id_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_idioma FROM tb_catalogo_idioma WHERE id_idioma = valor_id_idioma) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma invalido';
    ELSE
		DELETE FROM  tb_catalogo_idioma
		WHERE id_catalogo = valor_id_catalogo AND id_idioma = valor_id_idioma;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_categoria`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_classificacao_indicativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_classificacao_indicativa`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao_indicativa
		WHERE id_classificacao_indicativa = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cliente`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_cliente
		WHERE id_cliente = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_endereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_endereco`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_endereco FROM tb_endereco WHERE id_endereco = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_endereco
		WHERE id_endereco = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_episodio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_episodio`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_episodio FROM tb_episodio WHERE id_episodio = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_episodio
		WHERE id_episodio = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_estado`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_estado FROM tb_estado WHERE id_estado = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_estado
		WHERE id_estado = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_filme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_filme`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_filme FROM tb_filme WHERE id_filme = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_filme
		WHERE id_filme = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_funcionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_funcionario`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_funcionario FROM tb_funcionario WHERE id_funcionario = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_funcionario
		WHERE id_funcionario = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_idioma`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pagamento`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pagamento FROM tb_pagamento WHERE id_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pagamento
		WHERE id_pagamento = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pais`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pais_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pais_catalogo`(valor_id_pais INT, valor_id_catalogo INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = valor_id_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_pais FROM tb_pais_catalogo WHERE id_pais = valor_id_pais) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
	ELSE
		DELETE FROM  tb_pais_catalogo
		WHERE id_pais = valor_id_pais AND id_catalogo = valor_id_catalogo;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_perfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_perfil`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_perfil FROM tb_perfil WHERE id_perfil = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_perfil
		WHERE id_perfil = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_plano`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_serie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_serie`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_serie
		WHERE id_serie = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_temporada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_temporada`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_temporada FROM tb_temporada WHERE id_temporada = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_temporada
		WHERE id_temporada = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_pagamento`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_usuario`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_usuario FROM tb_usuario WHERE id_usuario = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_usuario
		WHERE id_usuario = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ator`(nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
BEGIN
	IF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
	ELSEIF
		nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
    ELSEIF
		(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
	ELSE
		INSERT INTO tb_ator
        (nome, sobrenome, dt_nascimento, foto, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), LOWER(sobrenome_valor), nascimento, foto_ator , CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cartao_credito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cartao_credito`(num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
BEGIN
	IF
		(num IS NULL ) OR (SELECT INSTR(fn_remover_acento(num), ' ') = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca invalido';
	ELSEIF
		(vencimento IS NULL) OR (vencimento <= CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do cartao invalida';
	ELSEIF
		(num_seguranca IS NULL ) OR ((fn_valida_texto(num_seguranca, 2)) = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	 ELSE
		INSERT INTO cartao_credito
		(num, vencimento, num_seguranca, id_do_cliente, dt_atualizacao)
		VALUES
		(numero, data_vencimento, cod_seguranca, id_cliente, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_catalogo`(nome_catalogo VARCHAR(45), lancamento YEAR, tempo TIME, valo_descricao VARCHAR(255), capa VARCHAR(200), 
avaliacao_ct ENUM('1','2','3','4','5'), classificacao_indicativa INT, idioma_original INT)
BEGIN
		IF
			fn_valida_texto(nome_catalogo, 0) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
		ELSEIF
			(lancamento IS NULL) OR (lancamento NOT BETWEEN 1894 AND YEAR(CURDATE()))  THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ano_lancamento invalido';
		ELSEIF
			(valo_descricao IS NULL ) OR (fn_valida_texto(valo_descricao, 110 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSEIF
			(capa  IS NULL ) OR (fn_valida_texto(capa, 6 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'LINK da imagem_capa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = classificacao_indicativa) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_classificacao_indicativa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = idioma_original) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma_original invalido';
		ELSE
			INSERT INTO tb_catalogo
			(titulo, ano_lancamento, duracao, descricao, imagem_capa , avaliacao, id_classificacao_indicativa, id_idioma_original, dt_atualizacao)
			VALUES
			(LOWER(nome_catalogo), lancamento, tempo, LOWER(valo_descricao), capa, 
			avaliacao, classificacao_indicativa, idioma_original, CURDATE());
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_catalogo_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_catalogo_categoria`(id_do_catalogo INT, id_da_categoria INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_da_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_categoria invalido';
	ELSEIF EXISTS
		(SELECT id_categoria, id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = id_do_catalogo AND id_categoria = id_da_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
	ELSE
		INSERT INTO tb_catalogo_categoria
		(id_catalogo, id_categoria, dt_atualizacao)
		VALUES
		(id_do_catalogo, id_da_categoria, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_catalogo_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_catalogo_idioma`(id_do_catalogo INT, id_do_idioma INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma invalido';
		ELSEIF EXISTS
			(SELECT id_idioma, id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = id_do_catalogo AND id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			INSERT INTO tb_catalogo_idioma
			(id_catalogo, id_idioma, dt_atualizacao)
			VALUES
			(id_do_catalogo, id_do_idioma, CURDATE());
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_categoria`(nome_categoria VARCHAR(45))
BEGIN
    IF 
		(nome_categoria IS NULL ) OR (fn_valida_texto(nome_categoria, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_categoria
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_categoria), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_classificacao_indicativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_classificacao_indicativa`(idade_valor ENUM('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
BEGIN
    IF 
		(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_classificacao_indicativa
        (idade, descricao, dt_atualizacao)
        VALUES
        (LOWER(idade_valor),  LOWER(descricao_valor), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
BEGIN
	IF NOT EXISTS
		(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
	ELSEIF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = id_do_plano) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_plano invalido';
	ELSEIF
		(vencimento_plano IS NULL) OR (vencimento_plano < DATE_ADD(CURDATE(), INTERVAL 30 DAY)) THEN -- 30 DIAS de prazo minimo
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do plano invalida';
	ELSE
		INSERT INTO tb_cliente
		(id_usuario, id_plano, dt_vencimento_plano, dt_atualizacao)
		VALUES
		(id_do_usuario, id_do_plano, vencimento_plano, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_elenco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_elenco`(id_do_catalogo INT, id_do_ator INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = id_do_ator) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_ator invalido';
	ELSE
			INSERT INTO tb_elenco
			(id_catalogo, id_ator, dt_atualizacao)
			VALUES
			(id_do_catalogo, id_do_ator, CURDATE());
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_endereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_endereco`(v_setor VARCHAR(45), n_rua INT, v_complemento VARCHAR(45), n_casa INT, v_cidade VARCHAR(45), id_do_pais INT, id_do_estado INT)
BEGIN
		IF
			(v_setor  IS NULL ) OR (fn_valida_texto(v_setor, 3 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do setor muito curto';
		ELSEIF
			(v_complemento  IS NULL ) OR (fn_valida_texto(v_complemento, 5 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do complemento muito curto';
		ELSEIF
			(v_cidade IS NULL ) OR (fn_valida_texto(v_cidade, 2 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome da cidade muito curto';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSEIF NOT EXISTS
			(SELECT id_estado FROM tb_estado WHERE id_estado = id_do_estado) AND (id_do_estado IS NOT NULL) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_estado invalido';
		ELSE
			INSERT INTO tb_endereco
			(setor, numero_rua, complemento, numero_casa, cidade, id_pais, id_estado, dt_atualizacao)
			VALUES
			(LOWER(v_setor), n_rua, LOWER(v_complemento), n_casa, LOWER(v_cidade), id_do_pais, id_do_estado, CURDATE());
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_episodio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_episodio`(v_nome VARCHAR(45), n_numero TINYINT, id_da_temporada INT, id_da_serie INT)
BEGIN
	IF
		(v_nome IS NULL ) OR (fn_valida_texto(v_nome, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		n_numero NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
	ELSEIF NOT EXISTS
		(SELECT id__temporada FROM tb_temporada WHERE id_temporada = id_da_temporada) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_temporada invalida';
	ELSEIF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = id_da_serie) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_serie invalido';
    ELSE
		INSERT INTO tb_episodio
		(nome, numero, id_temporada, id_serie, dt_atualizacao)
		VALUES
		(LOWER(v_nome), n_numero, id_da_temporada, id_da_serie, CURDATE());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_estado`(nome_estado VARCHAR(45), cod_pais INT)
BEGIN
    IF
		(nome_estado IS NULL ) OR (fn_valida_texto(nome_estado, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_estado muito curto';
    ELSEIF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = cod_pais) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
    ELSE
		INSERT INTO tb_estado
        (nome, id_pais, dt_atualizacao)
        VALUES
        (LOWER(nome_estado), cod_pais, CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_filme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_filme`(id_do_catalogo INT, possui_oscar BOOLEAN)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(possui_oscar IS NULL ) OR (possui_oscar NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna oscar só pode assumir valores 0 ou 1';
		ELSE
			INSERT INTO tb_filme
			(id_catalogo, oscar, dt_atualizacao)
			VALUES
			(id_do_catalogo, possui_oscar, CURDATE());
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_funcionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_funcionario`(id_do_usuario INT, foto_usuario VARCHAR(255))
BEGIN
		IF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(foto_usuario IS NULL ) OR (fn_valida_texto(foto_usuario, 5)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
		ELSE
			INSERT INTO tb_funcionario
            (id_usuario, foto, data_atualizacao)
            VALUES
            (id_do_usuario, foto_usuario, CURDATE());
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_idioma`(nome_idioma VARCHAR(45))
BEGIN
    IF 
		(nome_idioma IS NULL ) OR (fn_valida_texto(nome_idioma, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_idioma
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_idioma), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pagamento`(valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
BEGIN
	IF
		(valor_p IS NULL ) OR (valor_p NOT BETWEEN 20.00 AND 100.00) THEN -- valor minimo e maximo que meu banco vai ceitar no momento
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
    ELSEIF
		(data_pagamento IS NULL) OR (data_pagamento > CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de pagamento invalida';
	ELSEIF NOT EXISTS
		(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito = id_do_cartao_credito) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	ELSEIF NOT EXISTS
		(SELECT id_tipo_pagamento  FROM tb_tipo_pagamento  WHERE id_tipo_pagamento  = id_do_tipo_pagamento ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSE
		INSERT INTO tb__pagamento
		(valor, dt_pagamento, id_cartao_credito, id_cliente, id_tipo_pagamento, dt_atualizacao)
		VALUES
		(valor_p, data_pagamento, id_do_cartao_credito, id_do_cliente, id_do_tipo_pagamento, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pais`(nome_valor VARCHAR(45), cod_pais CHAR(3))
BEGIN
	IF
		(cod_pais IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) >3) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere invalida';
	ELSEIF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_pais
        (nome, codigo, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), LOWER(cod_pais), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pais_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pais_catalogo`(id_do_pais INT, id_do_catalogo INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSEIF EXISTS
			(SELECT id_pais, id_catalogo FROM tb_pais_catalogo WHERE id_pais = id_do_pais AND id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			INSERT INTO tb_pais_catalogo
			(id_pais, id_catalogo, dt_atualizacao)
			VALUES
			(id_do_pais, id_do_catalogo, CURDATE());
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_perfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_perfil`(valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
BEGIN
	IF
		(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
    ELSEIF
		(valor_foto IS NULL ) OR (fn_valida_texto(valor_foto, 5)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
    ELSE
		INSERT INTO tb_perfil
		(nome, foto, tipo, id_cliente, dt_atualizacao)
		VALUES
		(LOWER(valor_nome), valor_foto, LOWER(valor_tipo), id_do_cliente, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_plano`(nome_valor VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
BEGIN
	IF
		(descricao_plano IS NULL ) OR (fn_valida_texto(nome_valor, 3 )) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(valor_plano IS NULL ) OR (valor_plano NOT BETWEEN 20.00 AND 100.00) THEN -- valor máximo e mínimo de planos no momento
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
	ELSEIF
		(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
    ELSE
		INSERT INTO tb_plano
        (nome, valor, descricao, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), valor_plano, LOWER(descricao_plano), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_serie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_serie`(v_titulo VARCHAR(45), qtd_de_temporadas TINYINT, qtd_do_episodios TINYINT, id_do_catalogo INT)
BEGIN
	IF
		(v_titulo IS NULL ) OR (fn_valida_texto(v_titulo, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		qtd_de_temporadas NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 TEMPORADA para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de temporadas invalido';
	ELSEIF
		qtd_do_episodios NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
	ELSE
			INSERT INTO tb_serie
			(titulo, qtd_temporadas, qtd_episodios, id_catalogo, dt_atualizacao)
			VALUES
			(LOWER(v_titulo), qtd_de_temporadas, qtd_do_episodios, id_do_catalogo, CURDATE());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_temporada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_temporada`(v_titulo VARCHAR(45), id_da_serie INT, v_descricao VARCHAR(255), qtd_de_episodio TINYINT)
BEGIN
	IF
		(v_titulo IS NULL ) OR (fn_valida_texto(v_titulo, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = id_da_serie) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_serie invalido';
	ELSEIF
		(v_descricao IS NULL ) OR (fn_valida_texto(v_descricao, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalido';
	ELSEIF
		qtd_do_episodios NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
    ELSE
		INSERT INTO tb_temporada
		(titulo, id_serie, descricao, qtd_episodio, dt_atualizacao)
		VALUES
		(LOWER(v_titulo), id_da_serie, LOWER(v_descricao), qtd_de_episodio, CURDATE());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_pagamento`(nome_valor VARCHAR(30))
BEGIN
    IF 
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) < 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_tipo_pagamento
        (categoria, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), CURDATE());
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_usuario`(valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
dt_cadastro DATE, valor_senha VARCHAR(255), v_status BOOLEAN, id_do_endereco INT)
BEGIN
		IF
			(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(valor_sobrenome IS NULL ) OR (fn_valida_texto(valor_sobrenome, 2)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
		ELSEIF
			(valor_email IS NULL ) OR (fn_valida_texto(valor_email, 5) = 0) OR 
            (INSTR(valor_email,'@') = 0) OR (INSTR(valor_email,'.') = 0) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'email invalido';
		ELSEIF
			dt_nascimento NOT BETWEEN (DATE_ADD(CURDATE(), INTERVAL -100 YEAR)) AND (DATE_ADD(CURDATE(), INTERVAL -16 YEAR)) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de nascimento fora de parametro';
		ELSEIF
			dt_cadastro NOT BETWEEN '2023-06-16' AND CURDATE() THEN -- data de criacao do banco, não tem como se cadastrar antes disso
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de cadastro invalida';
		ELSEIF
			(valor_senha IS NULL ) OR (fn_valida_texto(valor_senha, 7)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'senha deve conter no mínimo 8 digitos';
		ELSEIF
			(v_status IS NULL ) OR (v_status NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna status só pode assumir valores 0 ou 1';
		ELSEIF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_endereco invalido';
		ELSE
			INSERT INTO tb_usuario
            (nome, sobrenome, email, data_nascimento, data_cadastro, senha, status, id_endereco, data_atualizacao)
            VALUES
            (LOWER(valor_nome), LOWER(valor_sobrenome), valor_email, dt_nascimento, dt_cadastro, MD5(valor_senha), v_status, id_do_endereco, CURDATE());
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_ator`(valor_id INT, nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
BEGIN
		IF NOT EXISTS
			(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSEIF
			(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
		ELSEIF
			nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
		ELSEIF
			(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
		ELSE
			UPDATE tb_ator SET nome = LOWER(nome_valor), sobrenome = LOWER(sobrenome_valor), dt_nascimento = nascimento , foto = foto_ator, dt_atualizacao = CURDATE()
			WHERE id_ator = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_cartao_credito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_cartao_credito`(valor_id INT, num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSEIF
			(num IS NULL ) OR (SELECT INSTR(fn_remover_acento(num), ' ') = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca invalido';
		ELSEIF
			(vencimento IS NULL) OR (vencimento <= CURDATE()) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do cartao invalida';
		ELSEIF
			(num_seguranca IS NULL ) OR ((fn_valida_texto(num_seguranca, 2)) = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
		ELSEIF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSE
			UPDATE tb_cartao_credito SET numero = num, data_vencimento = vencimento, cod_seguranca = num_seguranca, id_cliente = id_do_cliente, dt_atualizacao = CURDATE()
			WHERE id_cartao = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_catalogo`(valor_id INT, nome_catalogo VARCHAR(45), lancamento YEAR, tempo TIME, valo_descricao VARCHAR(255), capa VARCHAR(200), 
avaliacao_ct ENUM('1','2','3','4','5'), classificacao_indicativa INT, idioma_original INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			fn_valida_texto(nome_catalogo, 0) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
		ELSEIF
			(lancamento IS NULL) OR (lancamento NOT BETWEEN 1894 AND YEAR(CURDATE()))  THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ano_lancamento invalido';
		ELSEIF
			(valo_descricao IS NULL ) OR (fn_valida_texto(valo_descricao, 50 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSEIF
			(capa  IS NULL ) OR (fn_valida_texto(capa, 6 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'LINK da imagem_capa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = classificacao_indicativa) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_classificacao_indicativa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = idioma_original) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma_original invalido';
		ELSE
			UPDATE tb_catalogo SET titulo = LOWER(nome_catalogo), ano_lancamento = lancamento, duracao = tempo, descricao = valo_descricao,
				imagem_capa = capa, avaliacao = avaliacao_ct, id_classificacao_indicativa = classificacao_indicativa, id_idioma_original = id_idioma_original
			WHERE id_catalogo = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_catalogo_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_catalogo_categoria`(valor_id_catalogo INT, valor_id_categoria INT, id_do_catalogo INT, id_da_categoria INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_catalogo_categoria';
		ELSEIF NOT EXISTS
			(SELECT id_categoria FROM tb_catalogo_categoria WHERE id_categoria = valor_id_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_categoria é inexistente em tb_catalogo_categoria';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_da_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID__categoria não existe na tabela de origem - tb_categoria';
		ELSEIF EXISTS
			(SELECT id_categoria, id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = id_do_catalogo AND id_categoria = id_da_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_catalogo_categoria SET id_catalogo = id_do_catalogo, id_categoria = id_da_categoria, dt_atualizacao = CURDATE()
			WHERE id_catalogo = valor_id_catalogo AND id_categoria = valor_id_categoria;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_catalogo_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_catalogo_idioma`(valor_id_catalogo INT, valor_id_idioma INT, id_do_catalogo INT, id_do_idioma INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_catalogo_idioma';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_catalogo_idioma WHERE id_idioma = valor_id_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_idioma é inexistente em tb_catalogo_idioma';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_idioma não existe na tabela de origem - tb_idioma';
		ELSEIF EXISTS
			(SELECT id_idioma, id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = id_do_catalogo AND id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_catalogo_idioma SET id_catalogo = id_do_catalogo, id_idioma = id_do_idioma, dt_atualizacao = CURDATE()
			WHERE id_catalogo = valor_id_catalogo AND id_idioma = valor_id_idioma;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_categoria`(valor_id INT, nome_valor VARCHAR(45))
BEGIN
		IF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_categoria SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_categoria = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_classificacao_indicativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_classificacao_indicativa`(valor_id INT, idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
BEGIN
		IF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_classificacao_indicativa SET idade = idade_valor, descricao = LOWER(descricao_valor), dt_atualizacao = 	CURDATE()
			WHERE id_classificacao_indicativa = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_cliente`(valor_id INT, id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
BEGIN
		IF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSEIF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = id_do_plano) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_plano invalido';
		ELSEIF
			(vencimento_plano IS NULL) OR (vencimento_plano < DATE_ADD(CURDATE(), INTERVAL 30 DAY)) THEN -- 30 DIAS de prazo minimo
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do plano invalida';
		ELSE
			UPDATE tb_cliente SET id_do_usuario = id_usuario, id_do_plano = id_plano, vencimento_plano = dt_vencimento_plano, dt_atualizacao = CURDATE()
			WHERE id_cliente = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_endereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_endereco`(valor_id INT, v_setor VARCHAR(45), n_rua INT, v_complemento VARCHAR(45), n_casa INT, v_cidade VARCHAR(45), id_do_pais INT, id_do_estado INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		
		ELSE
			UPDATE tb_endereco SET setor= v_setor, numero_rua = n_rua, complemento = v_complemento, numero_casa = n_casa,
				cidade = v_cidade, id_pais = id_do_pais, id_estado = id_do_estado, dt_atualizacao = CURDATE()
			WHERE id_endereco = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_estado`(valor_id INT,nome_estado VARCHAR(45), cod_pais INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_estado FROM tb_estado WHERE id_estado = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_estado IS NULL ) OR (fn_valida_texto(nome_estado, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_estado muito curto';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = cod_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSE
			UPDATE tb_estado SET nome = LOWER(nome_estado), id_pais = cod_pais, dt_atualizacao = CURDATE()
			WHERE id_estado = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_filme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_filme`(valor_id INT, id_do_catalogo INT, possui_oscar BOOLEAN)
BEGIN
		IF NOT EXISTS
			(SELECT id_filme FROM tb_filme WHERE id_filme = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_filme invalido';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(possui_oscar IS NULL ) OR (possui_oscar NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna oscar só pode assumir valores 0 ou 1';
		ELSE
			UPDATE tb_filme SET id_catalogo = id_do_catalogo, oscar = possui_oscar, dt_atualizacao = CURDATE()
			WHERE id_filme = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_funcionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_funcionario`(valor_id INT, id_do_usuario INT, foto_usuario VARCHAR(255))
BEGIN
		IF NOT EXISTS
			(SELECT id_funcionario FROM tb_funcionario WHERE id_funcionario = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_funcionario invalido';
		ELSEIF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(foto_usuario IS NULL ) OR (fn_valida_texto(foto_usuario, 5)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
		ELSE
			UPDATE tb_funcionario SET id_usuario = id_do_usuario,foto = foto_usuario, dt_atualizacao = CURDATE()
			WHERE id_funcionario = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_idioma`(valor_id INT, nome_valor VARCHAR(45))
BEGIN
		IF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_idioma SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_idioma = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_pagamento`(valor_id INT, valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_pagamento FROM tb_pagamento WHERE id_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pagamento invalido';
		ELSEIF
			(valor_p IS NULL ) OR (valor_p NOT BETWEEN 20.00 AND 100.00) THEN -- valor minimo e maximo que meu banco vai ceitar no momento
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(data_pagamento IS NULL) OR (data_pagamento > CURDATE()) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de pagamento invalida';
		ELSEIF NOT EXISTS
			(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito = id_do_cartao_credito) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSEIF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSEIF NOT EXISTS
			(SELECT id_tipo_pagamento  FROM tb_tipo_pagamento  WHERE id_tipo_pagamento  = id_do_tipo_pagamento ) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSE
			UPDATE tb_pagamento SET valor = valor_p , dt_pagamento = data_pagamento, id_cartao_credito = id_do_cartao_credito, 
				id_cliente = id_do_cliente, id_tipo_pagamento = id_do_tipo_pagamento, dt_atualizacao = CURDATE()
			WHERE id_pagamento = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_pais`(valor_id INT, nome_valor VARCHAR(45), cod_pais CHAR(3))
BEGIN
		IF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_pais muito curto';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) > 3 ) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere (id_pais) invalida';
		ELSE
			UPDATE tb_pais SET nome = LOWER(nome_valor), codigo = cod_pais, dt_atualizacao = CURDATE()
			WHERE id_pais = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_pais_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_pais_catalogo`(valor_id_pais INT, valor_id_catalogo INT, id_do_pais INT, id_do_catalogo INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_pais_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais_catalogo WHERE id_pais = valor_id_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_pais é inexistente em tb_pais_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_pais não existe na tabela de origem - tb_pais';
		ELSEIF EXISTS
			(SELECT id_pais, id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = id_do_catalogo AND id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_pais_catalogo SET id_pais = id_do_pais, id_catalogo = id_do_catalogo, dt_atualizacao = CURDATE()
			WHERE  id_pais = valor_id_pais AND id_catalogo = valor_id_catalogo;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_perfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_perfil`(valor_id INT, valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_perfil FROM tb_perfil WHERE id_perfil = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_perfil invalido';
	ELSEIF
		(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
    ELSEIF
		(valor_foto IS NULL ) OR (fn_valida_texto(valor_foto, 5)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
    ELSE
			UPDATE tb_perfil SET nome = valor_nome, foto = valor_foto, tipo = valor_tipo, id_cliente = id_do_cliente, dt_atualizacao = CURDATE()
			WHERE id_perfil = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_plano`(valor_id INT, nome_valor VARCHAR(45), preco FLOAT, descricao_plano  VARCHAR(255))
BEGIN
		IF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
        ELSEIF
			(preco IS NULL ) OR (preco NOT BETWEEN 20.00 AND 100.00) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_plano SET nome = LOWER(nome_valor), valor = preco, descricao = LOWER(descricao_plano) , dt_atualizacao = CURDATE()
			WHERE id_plano = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tipo_pagamento`(valor_id INT, nome_valor VARCHAR(30))
BEGIN
		IF NOT EXISTS
			(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_tipo_pagamento SET categoria = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_tipo_pagamento = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_usuario`(valor_id INT, valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
dt_cadastro DATE, valor_senha VARCHAR(255), v_status BOOLEAN, id_do_endereco INT)
BEGIN
		IF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(valor_sobrenome IS NULL ) OR (fn_valida_texto(valor_sobrenome, 2)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
		ELSEIF
			(valor_email IS NULL ) OR (fn_valida_texto(valor_email, 5) = 0) OR 
            (INSTR(valor_email,'@') = 0) OR (INSTR(valor_email,'.') = 0) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'email invalido';
		ELSEIF
			dt_nascimento < DATE_ADD(CURDATE(), INTERVAL -100 YEAR)  OR dt_nascimento > DATE_ADD(CURDATE(), INTERVAL -16 YEAR) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de nascimento fora de parametro';
		ELSEIF
			dt_cadastro NOT BETWEEN '2023-06-16' AND CURDATE() THEN -- data de criacao do banco, não tem como se cadastrar antes disso
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de cadastro invalida';
		ELSEIF
			(valor_senha IS NULL ) OR (fn_valida_texto(valor_senha, 7)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'senha deve conter no mínimo 8 digitos';
		ELSEIF
			(v_status IS NULL ) OR (v_status NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna status só pode assumir valores 0 ou 1';
		ELSEIF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_endereco invalido';
		ELSE
			UPDATE tb_usuario SET valor_nome = nome, valor_sobrenome = sobrenome, valor_email = email, dt_nascimento = data_nasciemento, 
			dt_cadastro = data_cadastro, valor_senha = senha, v_status = status, id_do_endereco = id_endereco, dt_atualizacao = CURDATE()
			WHERE id_usuario = valor_id;
		END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 19:34:23
