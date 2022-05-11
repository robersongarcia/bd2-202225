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

/*Data for the table `Compra` */

insert  into `Compra`(`nroSuc`,`codigo`,`cantidad`,`fecha`) values 
(1,1,40,'2022-05-11'),
(1,2,25,'2022-05-11'),
(1,3,12,'2022-05-11'),
(1,4,20,'2022-05-11'),
(1,5,15,'2022-05-11'),
(1,6,22,'2022-05-11');

/*Data for the table `Posee` */

insert  into `Posee`(`codigo`,`nroSuc`,`precio`) values 
(1,2,50),
(2,2,50),
(3,2,25),
(3,4,15),
(4,3,30),
(4,5,8),
(5,4,10),
(6,3,5),
(7,5,50);

/*Data for the table `Producto` */

insert  into `Producto`(`codigo`,`nombre`) values 
(1,'Harina PAN'),
(2,'Pan Bimbo'),
(3,'Nestea'),
(4,'Pirulin'),
(5,'Toddy'),
(6,'Mayonesa Mavesa'),
(7,'Mantequilla Nelly');

/*Data for the table `Sucursal` */

insert  into `Sucursal`(`nroSuc`,`nombre`,`ciudad`,`estado`,`es-central`) values 
(1,'Central','Ciudad Guayana','Bolivar',1),
(2,'Sucursal Maturin','Maturin','Monagas',0),
(3,'Sucursal Pto La Cruz','Puerto La Cruz','Anzoategui',0),
(4,'Sucursal Oriental','Cumana','Sucre',0),
(5,'Sucursal Los Llanos','Barinas','Barinas',0);

/*Data for the table `Ventas` */

insert  into `Ventas`(`cantidad`,`hora`,`fecha`,`nroSuc`,`codigo`) values 
(8,'08:00:00','2022-05-11',2,2),
(12,'07:00:00','2022-05-11',2,1),
(5,'06:00:00','2022-05-11',3,4),
(7,'15:00:00','2022-05-11',4,5),
(5,'13:00:00','2022-05-11',5,7);

/*Data for the table `distribuye` */

insert  into `distribuye`(`distribuye`,`recibe`,`cantidad`,`fecha`,`codigo`) values 
(1,2,3,'2022-05-11',3),
(1,2,5,'2022-05-11',2),
(1,2,12,'2022-05-11',1),
(1,3,3,'2022-05-11',4),
(1,3,5,'2022-05-11',6),
(1,4,3,'2022-05-11',5),
(1,4,5,'2022-05-11',3),
(1,5,5,'2022-05-11',7),
(1,5,10,'2022-05-11',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
