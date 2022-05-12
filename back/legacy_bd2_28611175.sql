/*
SQLyog Community v13.1.7 (64 bit)a
MySQL - 10.5.7-MariaDB-1:10.5.7+maria~focal : Database - bd2_202225_28611175
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd2_202225_28611175` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd2_202225_28611175`;

/*Data for the table `Comprar` */

insert  into `Compra`(`codigo`,`nroSuc`,`cantidad`,`fecha`) values 
(7,1,20,'2022-05-05');

/*Table structure for table `Inventario` */

/*DROP TABLE IF EXISTS `Inventario`;

CREATE TABLE `Inventario` (
  `cantidad` int(11) DEFAULT NULL,
  `codigo_p` varchar(20) NOT NULL,
  `codigo_s` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_p`,`codigo_s`),
  KEY `tiene` (`codigo_s`),
  CONSTRAINT `se_almacena` FOREIGN KEY (`codigo_p`) REFERENCES `Producto` (`codigo_p`),
  CONSTRAINT `tiene` FOREIGN KEY (`codigo_s`) REFERENCES `Sucursal` (`codigo_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `Inventario` */

/*insert  into `Inventario`(`cantidad`,`codigo_p`,`codigo_s`) values 
(50,'0001','0001'),
(0,'0001','0002'),
(0,'0001','0003'),
(0,'0001','0004'),
(0,'0001','0005'),
(20,'0002','0001'),
(0,'0002','0002'),
(15,'0003','0002'),
(12,'0004','0002'),
(15,'0005','0001'); */

/*Table structure for table `Producto` */

/*DROP TABLE IF EXISTS `Producto`;

CREATE TABLE `Producto` (
  `codigo_p` varchar(20) NOT NULL,
  `nombre_p` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `Producto` */

insert  into `Producto`(`nombre`) values 
('pan arabe'),
('zaatar'),
('aceite oliva'),
('halawa'),
('tambak manzana'),
('te negro'),
('semilla patilla');

/*Table structure for table `Sucursal` */

/*DROP TABLE IF EXISTS `Sucursal`;

CREATE TABLE `Sucursal` (
  `coigo_s` varchar(20) NOT NULL,
  `direccion_s` varchar(20) DEFAULT NULL,
  `es_central` tinyint(1) DEFAULT NULL,
  `nombre_s` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `Sucursal` */

insert  into `Sucursal`(`ciudad`,`es-central`,`nombre`) values 
('ciudad piar',0,'los morichales'),
('valencia',0,'bodegon baraki'),
('puerto ordaz',0,'dinar a27'),
('lecheria',0,'casa dana'),
('la paragua',0,'el tio n');

/*Table structure for table `Traslado` */

/*DROP TABLE IF EXISTS `Traslado`;

CREATE TABLE `Traslado` (
  `codigo_p_s` varchar(20) NOT NULL,
  `codigo_s_s` varchar(20) NOT NULL,
  `codigo_p_e` varchar(20) NOT NULL,
  `codigo_s_e` varchar(20) NOT NULL,
  `cantidad_t` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`codigo_p_s`,`codigo_s_s`,`codigo_p_e`,`codigo_s_e`),
  KEY `Relationship24` (`codigo_p_e`,`codigo_s_e`),
  CONSTRAINT `Relationship23` FOREIGN KEY (`codigo_p_s`, `codigo_s_s`) REFERENCES `Inventario` (`codigo_p`, `codigo_s`),
  CONSTRAINT `Relationship24` FOREIGN KEY (`codigo_p_e`, `codigo_s_e`) REFERENCES `Inventario` (`codigo_p`, `codigo_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `Traslado` */

/*insert  into `Traslado`(`codigo_p_s`,`codigo_s_s`,`codigo_p_e`,`codigo_s_e`,`cantidad_t`,`fecha`,`hora`) values 
('0002','0001','0002','0002',5,'2022-04-01','13:00:00'); */

/*Table structure for table `Venta` */

/*DROP TABLE IF EXISTS `Ventas`;

CREATE TABLE `Venta` (
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `costo` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `codigo_p` varchar(20) NOT NULL,
  `codigo_s` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_p`,`codigo_s`,`hora`,`fecha`),
  CONSTRAINT `vende` FOREIGN KEY (`codigo_p`, `codigo_s`) REFERENCES `Inventario` (`codigo_p`, `codigo_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `Venta` */

insert  into `Ventas`(`fecha`,`hora`,`cantidad`,`codigo`,`nroSuc`) values 
('2022-05-05','17:00:00',50,2,2);

/*Table structure for table `posee` */

/*DROP TABLE IF EXISTS `posee`;

CREATE TABLE `posee` (
  `codigo_p` varchar(20) NOT NULL,
  `codigo_s` varchar(20) NOT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`codigo_p`,`codigo_s`),
  KEY `posee` (`codigo_s`),
  CONSTRAINT `posee` FOREIGN KEY (`codigo_s`) REFERENCES `Sucursal` (`codigo_s`),
  CONSTRAINT `se_posee` FOREIGN KEY (`codigo_p`) REFERENCES `Producto` (`codigo_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; */

/*Data for the table `posee` */

INSERT  INTO `Posee`(`codigo`,`nroSuc`,`precio`) VALUES 
(1,1,1),
(1,3,1.2),
(1,4,1.3),
(1,5,1.1),
(2,1,3),
(3,3,4),
(4,1,3.5),
(4,2,3),
(5,1,2),
(5,2,2.5),
(6,1,8),
(6,2,9),
(7,1,4.5),
(7,2,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
