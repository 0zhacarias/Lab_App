-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para sala
DROP DATABASE IF EXISTS `sala`;
CREATE DATABASE IF NOT EXISTS `sala` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sala`;

-- A despejar estrutura para tabela sala.laboratorios
DROP TABLE IF EXISTS `laboratorios`;
CREATE TABLE IF NOT EXISTS `laboratorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) DEFAULT NULL,
  `funciona` int DEFAULT '0',
  `nao_funciona` int DEFAULT '0',
  `total` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- A despejar dados para tabela sala.laboratorios: ~18 rows (aproximadamente)
DELETE FROM `laboratorios`;
INSERT INTO `laboratorios` (`id`, `designacao`, `funciona`, `nao_funciona`, `total`, `created_at`, `updated_at`) VALUES
	(1, 'Sala de aula teorica', 0, 0, 0, '2024-04-17 02:03:35', '2024-04-17 02:03:35'),
	(2, 'Salas de Informatica', 1, 0, 1, '2024-04-17 06:55:44', '2024-04-17 14:22:31'),
	(3, 'Laboratório de Automação', 1, 0, 1, '2024-04-17 07:01:27', '2024-04-17 09:42:11'),
	(4, 'Laboratórios de Biologia', 1, 1, 2, '2024-04-17 08:27:13', '2024-04-17 14:22:31'),
	(5, 'Laboratórios de CAD', 1, 0, 1, '2024-04-17 09:39:03', '2024-04-17 14:29:44'),
	(6, 'Laboratórios de CNC', 0, 1, 1, '2024-04-17 10:29:17', '2024-04-17 14:00:58'),
	(7, 'Laboratórios de Electrónica', 1, 0, 1, '2024-04-17 10:30:23', '2024-04-17 14:00:58'),
	(8, 'Laboratórios de Energias Renováveis', 0, 1, 1, '2024-04-17 10:32:41', '2024-04-17 10:32:41'),
	(9, 'Laboratórios de Física', 1, 0, 1, '2024-04-17 10:33:58', '2024-04-17 14:00:58'),
	(10, 'Laboratórios de Frio e Climatização', 1, 0, 1, '2024-04-17 10:40:38', '2024-04-17 14:00:58'),
	(11, 'Laboratórios de Instalações Eléctricas', 1, 0, 1, '2024-04-17 10:40:50', '2024-04-17 14:00:58'),
	(12, 'Laboratórios de Máquinas Eléctricas', 1, 1, 2, '2024-04-17 10:41:02', '2024-04-17 14:00:58'),
	(13, 'Laboratórios de Metalomecânica', 1, 0, 1, '2024-04-17 10:41:13', '2024-04-17 14:22:31'),
	(14, 'Laboratórios de Química', 1, 1, 2, '2024-04-17 10:41:22', '2024-04-17 14:00:58'),
	(15, 'Laboratórios de Telecomunicações', 1, 0, 1, '2024-04-17 10:41:31', '2024-04-17 14:00:58'),
	(16, 'Oficinas de Construções Mecânicas', 1, 0, 1, '2024-04-17 10:41:43', '2024-04-17 14:00:58'),
	(17, 'Oficinas de Máquinas e Motores', 1, 0, 1, '2024-04-17 10:41:53', '2024-04-17 14:22:06'),
	(18, 'Oficinas de Soldadura', 1, 0, 1, '2024-04-17 10:42:13', '2024-04-17 14:22:01');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
