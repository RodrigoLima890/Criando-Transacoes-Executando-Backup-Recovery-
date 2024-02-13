-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Data de nascimento` date NOT NULL,
  `codEndereco` int DEFAULT NULL,
  `CodPessoa` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `Fk_enreco_cliente_idx` (`codEndereco`),
  KEY `Fk_cliente_pessoa_idx` (`CodPessoa`),
  CONSTRAINT `Fk_cliente_pessoa` FOREIGN KEY (`CodPessoa`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `Fk_enreco_cliente` FOREIGN KEY (`codEndereco`) REFERENCES `enderecos` (`idEnderecos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'2000-01-01',1,1),(2,'1995-05-15',2,2),(3,'1988-11-30',3,3),(4,'1976-07-20',4,4),(5,'1990-03-10',5,5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_clientes` BEFORE DELETE ON `cliente` FOR EACH ROW BEGIN
    DECLARE cpf_var VARCHAR(11);
    DECLARE cnpj_var VARCHAR(20);
    
    SELECT cpf, cnpj INTO cpf_var, cnpj_var
    FROM pessoa WHERE idPessoa = OLD.CodPessoa;
    
    INSERT INTO clientesDeletados (cpf, cnpj) VALUES (cpf_var, cnpj_var);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientesdeletados`
--

DROP TABLE IF EXISTS `clientesdeletados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientesdeletados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientesdeletados`
--

LOCK TABLES `clientesdeletados` WRITE;
/*!40000 ALTER TABLE `clientesdeletados` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientesdeletados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `idEnderecos` int NOT NULL AUTO_INCREMENT,
  `Cidade` varchar(45) NOT NULL,
  `UF` varchar(4) NOT NULL,
  `Logradouro` varchar(45) NOT NULL,
  `Complemento` varchar(45) DEFAULT NULL,
  `Numero` varchar(10) NOT NULL,
  `CEP` varchar(8) NOT NULL,
  PRIMARY KEY (`idEnderecos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'Cidade 1','UF1','Rua 1','Complemento 1','123','12345678'),(2,'Cidade 2','UF2','Rua 2','Complemento 2','456','23456789'),(3,'Cidade 3','UF3','Rua 3','Complemento 3','789','34567890'),(4,'Cidade 4','UF4','Rua 4','Complemento 4','012','45678901'),(5,'Cidade 5','UF5','Rua 5','Complemento 5','345','56789012');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `Status` enum('Entregue','Em Processamento','Cancelado','A Caminho') NOT NULL DEFAULT 'Em Processamento',
  `idPedido` int NOT NULL,
  PRIMARY KEY (`idEntrega`),
  KEY `Fk_entrega_pedido_idx` (`idPedido`),
  CONSTRAINT `Fk_entrega_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,'Entregue',1),(2,'Em Processamento',2),(3,'Cancelado',3),(4,'A Caminho',4),(5,'Em Processamento',5);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `codEndereco` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`idEstoque`),
  KEY `Fk_estoque_enreco_idx` (`codEndereco`),
  CONSTRAINT `Fk_estoque_enreco` FOREIGN KEY (`codEndereco`) REFERENCES `enderecos` (`idEnderecos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,50),(2,2,30),(3,3,20),(4,4,10),(5,5,40);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `idForma_Pagamento` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idForma_Pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Cartão de Crédito'),(2,'Boleto Bancário'),(3,'Transferência Bancária'),(4,'Dinheiro'),(5,'PIX');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pagamento_pedido`
--

DROP TABLE IF EXISTS `formas_pagamento_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pagamento_pedido` (
  `Forma_Pagamento_idForma_Pagamento` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`Forma_Pagamento_idForma_Pagamento`,`Pedido_idPedido`),
  KEY `fk_Forma_Pagamento_has_Pedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Forma_Pagamento_has_Pedido_Forma_Pagamento1_idx` (`Forma_Pagamento_idForma_Pagamento`),
  CONSTRAINT `fk_Forma_Pagamento_has_Pedido_Forma_Pagamento1` FOREIGN KEY (`Forma_Pagamento_idForma_Pagamento`) REFERENCES `forma_pagamento` (`idForma_Pagamento`),
  CONSTRAINT `fk_Forma_Pagamento_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pagamento_pedido`
--

LOCK TABLES `formas_pagamento_pedido` WRITE;
/*!40000 ALTER TABLE `formas_pagamento_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `formas_pagamento_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) DEFAULT NULL,
  `CNPJ` char(15) NOT NULL,
  `contato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Fornecedor 1','12345678901234','Contato 1'),(2,'Fornecedor 2','56789012345678','Contato 2'),(3,'Fornecedor 3','90123456781234','Contato 3'),(4,'Fornecedor 4','34567890123456','Contato 4'),(5,'Fornecedor 5','78901234561234','Contato 5');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_produto`
--

DROP TABLE IF EXISTS `fornecedor_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_produto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_produto`
--

LOCK TABLES `fornecedor_produto` WRITE;
/*!40000 ALTER TABLE `fornecedor_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `status` enum('Em andamento','Processando','Enviado','Entregue') DEFAULT 'Processando',
  `descricao` varchar(45) DEFAULT NULL,
  `frete` float DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idPedido`,`Cliente_idCliente`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Em andamento','Pedido 1',5,1),(2,'Processando','Pedido 2',7.5,2),(3,'Enviado','Pedido 3',10,3),(4,'Entregue','Pedido 4',8.5,4),(5,'Processando','Pedido 5',6,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `TipoPessoa` char(1) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Pessoa 1','F','12345678901',NULL),(2,'Pessoa 2','J',NULL,'12345678901234'),(3,'Pessoa 3','F','23456789012',NULL),(4,'Pessoa 4','J',NULL,'23456789012345'),(5,'Pessoa 5','F','34567890123',NULL);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Eletrônicos','Produto 1','100.00'),(2,'Roupas','Produto 2','50.00'),(3,'Alimentos','Produto 3','10.00'),(4,'Livros','Produto 4','20.00'),(5,'Cosméticos','Produto 5','30.00');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_estoque`
--

DROP TABLE IF EXISTS `produtos_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_estoque` (
  `Produto_idProduto` int NOT NULL,
  `Estoque_idEstoque` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Estoque_idEstoque`),
  KEY `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque`),
  KEY `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_estoque`
--

LOCK TABLES `produtos_estoque` WRITE;
/*!40000 ALTER TABLE `produtos_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_vendedor_terceiro`
--

DROP TABLE IF EXISTS `produtos_vendedor_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_vendedor_terceiro` (
  `Terceiro_Vendedor_idTerceiro_Vendedor` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`,`Pedido_idPedido`),
  KEY `fk_Terceiro_Vendedor_has_Pedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Terceiro_Vendedor_has_Pedido_Terceiro_Vendedor1_idx` (`Terceiro_Vendedor_idTerceiro_Vendedor`),
  CONSTRAINT `fk_Terceiro_Vendedor_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Terceiro_Vendedor_has_Pedido_Terceiro_Vendedor1` FOREIGN KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`) REFERENCES `terceiro_vendedor` (`idTerceiro_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_vendedor_terceiro`
--

LOCK TABLES `produtos_vendedor_terceiro` WRITE;
/*!40000 ALTER TABLE `produtos_vendedor_terceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_vendedor_terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_produto_pedido`
--

DROP TABLE IF EXISTS `relacao_produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacao_produto_pedido` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `quantidade` int NOT NULL,
  `Status` enum('Disponivel','Sem Estoque') NOT NULL DEFAULT 'Disponivel',
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_produto_pedido`
--

LOCK TABLES `relacao_produto_pedido` WRITE;
/*!40000 ALTER TABLE `relacao_produto_pedido` DISABLE KEYS */;
INSERT INTO `relacao_produto_pedido` VALUES (1,1,5,'Disponivel'),(2,2,3,'Disponivel'),(3,3,2,'Sem Estoque'),(4,4,4,'Disponivel'),(5,5,1,'Sem Estoque');
/*!40000 ALTER TABLE `relacao_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro_vendedor`
--

DROP TABLE IF EXISTS `terceiro_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro_vendedor` (
  `idTerceiro_Vendedor` int NOT NULL,
  `razao_social` varchar(45) NOT NULL,
  `local` varchar(45) DEFAULT NULL,
  `CNPJ` varchar(45) DEFAULT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTerceiro_Vendedor`),
  UNIQUE KEY `razao_social_UNIQUE` (`razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro_vendedor`
--

LOCK TABLES `terceiro_vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro_vendedor` DISABLE KEYS */;
INSERT INTO `terceiro_vendedor` VALUES (1,'Vendedor 1','Local 1','12345678901234','Fantasia 1'),(2,'Vendedor 2','Local 2','56789012345678','Fantasia 2'),(3,'Vendedor 3','Local 3','90123456781234','Fantasia 3'),(4,'Vendedor 4','Local 4','34567890123456','Fantasia 4'),(5,'Vendedor 5','Local 5','78901234561234','Fantasia 5');
/*!40000 ALTER TABLE `terceiro_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-13 11:52:54
