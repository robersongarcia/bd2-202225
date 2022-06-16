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

insert  into `Compra`(`nroSuc`,`codigo`,`cantidad`,`fecha`,`precio`) values 
(1,1,40,'2022-05-04',20),
(1,1,60,'2022-06-03',80),
(1,2,25,'2022-05-11',2),
(1,3,12,'2022-05-11',5),
(1,4,20,'2022-05-11',66),
(1,5,15,'2022-05-11',8),
(1,6,22,'2022-05-11',2),
(1,7,20,'2022-05-05',0),
(1,9,20,'2022-04-05',10);

/*Data for the table `Posee` */

insert  into `Posee`(`codigo`,`nroSuc`,`precio`,`cantidad`) values 
(1,1,1,5),
(1,2,50,20),
(1,3,1.2,80),
(1,4,1.3,90),
(2,1,35.1579,36),
(2,2,45.313,78),
(3,2,13.9531,58),
(3,3,13.9531,73),
(3,4,13.9531,82),
(4,1,8.17862,25),
(4,2,8.17862,12),
(4,3,8.17862,50),
(4,5,8.17862,74),
(4,7,8.17862,150),
(5,1,6.3983,25),
(5,2,6.3983,30),
(5,4,6.3983,63),
(6,1,8,20),
(6,2,9,10),
(6,3,5,73),
(7,1,4.5,40),
(7,2,3,45),
(7,5,50,20),
(8,2,15,30),
(8,3,3,50),
(8,7,0.729,50),
(9,7,1.5309,2000);

/*Data for the table `Producto` */

insert  into `Producto`(`codigo`,`nombre`) values 
(1,'Harina PAN'),
(2,'Pan Bimbo'),
(3,'Nestea'),
(4,'Pirulin'),
(5,'Toddy'),
(6,'Mayonesa Mavesa'),
(7,'Mantequilla Nelly'),
(8,'pan arabe'),
(9,'zaatar'),
(10,'aceite oliva'),
(11,'halawa'),
(12,'tambak manzana'),
(13,'te negro'),
(14,'semilla patilla');

/*Data for the table `Sucursal` */

insert  into `Sucursal`(`nroSuc`,`nombre`,`ciudad`,`estado`,`es-central`) values 
(1,'Central','Ciudad Guayana','Bolivar',1),
(2,'Sucursal Maturin','Maturin','Monagas',0),
(3,'Sucursal Pto La Cruz','Puerto La Cruz','Anzoategui',0),
(4,'Sucursal Oriental','Cumana','Sucre',0),
(5,'Sucursal Los Llanos','Barinas','Barinas',0),
(6,'los morichales','ciudad piar','',0),
(7,'bodegon baraki','valencia','',0),
(8,'dinar a27','puerto ordaz','',0),
(9,'casa dana','lecheria','',0),
(10,'el tio n','la paragua','',0);

/*Data for the table `Ventas` */

insert  into `Ventas`(`cantidad`,`hora`,`fecha`,`nroSuc`,`codigo`,`precio`) values 
(50,'00:00:10','2022-05-22',1,3,NULL),
(8,'08:00:00','2022-05-11',2,2,NULL),
(12,'07:00:00','2022-05-11',2,1,NULL),
(15,'00:00:15','2022-06-15',2,1,23),
(15,'00:00:15','2022-06-16',2,4,3),
(20,'00:00:10','2022-06-15',2,1,23),
(25,'00:00:04','2022-06-16',2,4,3),
(45,'00:00:00','2022-05-19',2,8,NULL),
(50,'17:00:00','2022-05-05',2,2,NULL),
(100,'00:00:05','2022-05-15',2,3,NULL),
(100,'00:00:45','2022-05-24',2,1,NULL),
(1000,'00:00:16','2022-06-15',2,1,23),
(1000,'00:00:15','2022-06-16',2,4,3),
(1200,'00:00:16','2022-06-16',2,8,2),
(1500,'00:00:16','2022-06-16',2,6,56),
(5,'06:00:00','2022-05-11',3,4,NULL),
(5,'00:56:46','2022-06-08',3,3,1),
(10,'00:00:15','2022-05-19',3,1,NULL),
(15,'00:00:05','2022-06-08',3,8,3),
(25,'00:00:05','2022-04-18',3,10,NULL),
(60,'00:00:05','2022-05-22',3,2,NULL),
(7,'15:00:00','2022-04-12',4,5,NULL),
(20,'01:00:00','2022-05-18',4,1,NULL),
(200,'00:50:00','2022-05-18',4,6,NULL),
(5,'13:00:00','2022-05-11',5,7,NULL),
(40,'06:00:00','2021-02-25',5,8,NULL),
(50,'05:00:00','2021-05-13',5,6,NULL),
(1010,'00:01:55','2022-06-08',6,9,15),
(53,'00:00:10','2022-05-18',7,10,NULL);

/*Data for the table `distribuye` */

insert  into `distribuye`(`distribuye`,`recibe`,`cantidad`,`fecha`,`codigo`,`estatus`) values 
(1,2,3,'2022-05-11',3,NULL),
(1,2,5,'2022-05-11',2,NULL),
(1,2,12,'2022-05-11',1,NULL),
(1,2,1000,'2022-06-16',4,'Sin Inventario'),
(1,2,1025,'2022-06-16',4,'Sin Inventario'),
(1,2,1035,'2022-06-15',1,'Sin Inventario'),
(1,2,1040,'2022-06-16',4,'Sin Inventario'),
(1,2,1200,'2022-06-16',8,'Sin Inventario'),
(1,2,1500,'2022-06-16',6,'Sin Inventario'),
(1,3,3,'2022-05-11',4,NULL),
(1,3,5,'2022-05-11',6,NULL),
(1,4,3,'2022-05-11',5,NULL),
(1,4,5,'2022-05-11',3,NULL),
(1,4,17,'2022-06-15',6,'Por Procesar'),
(1,4,25,'2022-06-15',5,'Por Procesar'),
(1,4,25,'2022-06-15',6,'Sin Inventario'),
(1,4,45,'2022-06-15',5,'Sin Inventario'),
(1,5,5,'2022-05-11',7,NULL),
(1,5,10,'2022-05-11',4,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
