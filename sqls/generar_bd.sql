/*
Created: 4/5/2022
Modified: 4/5/2022
Model: MySQL 8.0
Database: MySQL 8.0
Creado a las 4:50 PM
*/

-- Create tables section -------------------------------------------------

-- Table Sucursal

CREATE TABLE `Sucursal`
(
  `nroSuc` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(40) NOT NULL,
  `ciudad` Varchar(40) NOT NULL,
  `estado` Varbinary(40) NOT NULL,
  `es-central` Bool NOT NULL,
  PRIMARY KEY (`nroSuc`)
)
;

-- Table Producto

CREATE TABLE `Producto`
(
  `codigo` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`)
)
;

-- Table Ventas

CREATE TABLE `Ventas`
(
  `cantidad` Int NOT NULL,
  `hora` Datetime NOT NULL,
  `fecha` Date NOT NULL,
  `nroSuc` Int NOT NULL,
  `codigo` Int NOT NULL
)
;

ALTER TABLE `Ventas` ADD PRIMARY KEY (`nroSuc`, `cantidad`, `fecha`, `hora`, `codigo`)
;

-- Table Posee

CREATE TABLE `Posee`
(
  `codigo` Int NOT NULL,
  `nroSuc` Int NOT NULL,
  `precio` Float NOT NULL
)
;

ALTER TABLE `Posee` ADD PRIMARY KEY (`codigo`, `nroSuc`)
;

-- Table Compra

CREATE TABLE `Compra`
(
  `nroSuc` Int NOT NULL,
  `codigo` Int NOT NULL,
  `cantidad` Int NOT NULL,
  `fecha` Date NOT NULL
)
;

ALTER TABLE `Compra` ADD PRIMARY KEY (`nroSuc`, `codigo`)
;

-- Table distribuye

CREATE TABLE `distribuye`
(
  `distribuye` Int NOT NULL,
  `recibe` Int NOT NULL,
  `cantidad` Int NOT NULL,
  `fecha` Date NOT NULL,
  `codigo` Int NOT NULL
)
;

ALTER TABLE `distribuye` ADD PRIMARY KEY (`distribuye`, `recibe`, `codigo`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Ventas` ADD CONSTRAINT `Vende` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Ventas` ADD CONSTRAINT `Tiene` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Posee` ADD CONSTRAINT `SucursalPosee` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Posee` ADD CONSTRAINT `PoseeProducto` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Compra` ADD CONSTRAINT `CompraProducto` FOREIGN KEY (`nroSuc`) REFERENCES `Sucursal` (`nroSuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Compra` ADD CONSTRAINT `ProductoComprado` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `distribuye` ADD CONSTRAINT `sucursalRecibe` FOREIGN KEY (`distribuye`) REFERENCES `Sucursal` (`nroSuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `distribuye` ADD CONSTRAINT `centralEnvia` FOREIGN KEY (`recibe`) REFERENCES `Sucursal` (`nroSuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `distribuye` ADD CONSTRAINT `esDistribuido` FOREIGN KEY (`codigo`) REFERENCES `Producto` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

