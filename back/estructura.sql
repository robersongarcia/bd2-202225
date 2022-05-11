/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.7-MariaDB-1:10.5.7+maria~focal : Database - bd2_202225_27922357
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd2_202225_27922357` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd2_202225_27922357`;

/*Table structure for table `Compra` */

DROP TABLE IF EXISTS `Compra`;

CREATE TABLE `Compra` (
  `nroSuc` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`nroSuc`,`codigo`,`cantidad`,`fecha`),
  KEY `ProductoComprado` (`codigo`),
  CONSTRAINT `CompraProducto` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`),
  CONSTRAINT `ProductoComprado` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Posee` */

DROP TABLE IF EXISTS `Posee`;

CREATE TABLE `Posee` (
  `codigo` int(11) NOT NULL,
  `nroSuc` int(11) NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`codigo`,`nroSuc`),
  KEY `PoseeProducto` (`nroSuc`),
  CONSTRAINT `PoseeProducto` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`),
  CONSTRAINT `SucursalPosee` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Producto` */

DROP TABLE IF EXISTS `Producto`;

CREATE TABLE `Producto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Sucursal` */

DROP TABLE IF EXISTS `Sucursal`;

CREATE TABLE `Sucursal` (
  `nroSuc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `estado` varbinary(40) NOT NULL,
  `es-central` tinyint(1) NOT NULL,
  PRIMARY KEY (`nroSuc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Ventas` */

DROP TABLE IF EXISTS `Ventas`;

CREATE TABLE `Ventas` (
  `cantidad` int(11) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `nroSuc` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`nroSuc`,`cantidad`,`fecha`,`hora`,`codigo`),
  KEY `Tiene` (`codigo`),
  CONSTRAINT `Tiene` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`),
  CONSTRAINT `Vende` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `distribuye` */

DROP TABLE IF EXISTS `distribuye`;

CREATE TABLE `distribuye` (
  `distribuye` int(11) NOT NULL,
  `recibe` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`distribuye`,`recibe`,`cantidad`,`fecha`,`codigo`),
  KEY `centralEnvia` (`recibe`),
  KEY `esDistribuido` (`codigo`),
  CONSTRAINT `centralEnvia` FOREIGN KEY (`recibe`) REFERENCES `Sucursal` (`nroSuc`),
  CONSTRAINT `esDistribuido` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`),
  CONSTRAINT `sucursalRecibe` FOREIGN KEY (`distribuye`) REFERENCES `Sucursal` (`nroSuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
