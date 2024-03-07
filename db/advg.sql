-- --------------------------------------------------------
-- Host:                         localhost
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database adventuregame
CREATE DATABASE IF NOT EXISTS `adventuregame` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `adventuregame`;

-- Dump della struttura di tabella adventuregame.responses
CREATE TABLE IF NOT EXISTS `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handler_name` varchar(255) NOT NULL,
  `phrase` text NOT NULL,
  `choices` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dump dei dati della tabella adventuregame.responses: ~10 rows (circa)
DELETE FROM `responses`;
INSERT INTO `responses` (`id`, `handler_name`, `phrase`, `choices`) VALUES
	(1, 'joinMerchants', 'Decidi di unirti ai mercanti. Viaggiate insieme, scambiando storie e merci. Sei ad un bivio devi scegliere esplorare la caverna o continui verso il sentiero abbandonato.', '[{"text": "Esplora la caverna", "handlerName": "exploreCave"}, {"text": "Continua verso il sentiero", "handlerName": "followAbandonedPath"}]'),
	(2, 'continueAlone', 'Preferisci continuare da solo il tuo viaggio. Affronti le sfide delle montagne con determinazione e arrivi alla città senza intoppi. Ora hai la possibilità di esplorare una caverna che trovi lungo il percorso o di continuare direttamente verso la città.', '[{"text": "Esplora la caverna", "handlerName": "exploreCave"}, {"text": "Continua verso la città", "handlerName": "continueToCity"}]'),
	(3, 'followAbandonedPath', 'Segui il sentiero abbandonato. Presto ti trovi davanti a una grotta nascosta. Esplori la grotta o eviti il rischio?', '[{"text": "Esplora la grotta", "handlerName": "exploreCave"}, {"text": "Continua verso la città", "handlerName": "continueToCity"}]'),
	(4, 'exploreNewPath', 'Decidi di esplorare un nuovo percorso. Trovi un sentiero più sicuro che ti porta alla città senza incidenti.', '[]'),
	(5, 'investigateShipwreck', 'Indaghi sull\'imbarcazione distrutta e trovi un carico di merci preziose. Ti porti dietro il bottino e continui il tuo viaggio con nuovi tesori. Ad un certo punto un gruppo di mercenari ti punta una pistola contro che fai?', '[{"text": "Scappa", "handlerName": "escape"}, {"text": "Rimani fermo", "handlerName": "notMove"}]'),
	(6, 'avoidArea', 'Eviti la zona e continui il tuo viaggio lungo la costa. Prosegui il viaggio senza ulteriori intoppi.', '[]'),
	(7, 'exploreCave', 'Hai esplorato la caverna e sei morto...', '[]'),
	(8, 'continueToCity', 'Arrivi alla città e decidi di riposare. Passano gli anni compri casa, ti sposi e vissero tutti felici e contenti, finchè un giorno un criminare con la pistola la punta contro. Scappi o rimani immobile.', '[{"text": "Scappa", "handlerName": "escape"}, {"text": "Rimani fermo", "handlerName": "notMove"}]'),
	(9, 'notMove', 'Ti spara e muori.', '[]'),
	(10, 'escape', 'Riesci a scappare e ti metti in salvo con un a parte del bottino.', '[]');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
