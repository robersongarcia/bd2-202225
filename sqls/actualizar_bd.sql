ALTER TABLE `bd2_202225_27922357`.`Posee`   
	ADD COLUMN `cantidad` INT(11) NOT NULL AFTER `precio`;

ALTER TABLE `bd2_202225_27922357`.`Compra`   
    ADD COLUMN `precio` FLOAT NOT NULL AFTER `fecha`, 
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`nroSuc`, `codigo`, `cantidad`, `fecha`, `precio`);

ALTER TABLE `bd2_202225_27922357`.`Ventas`   
    ADD COLUMN `precio` FLOAT NOT NULL AFTER `codigo`, 
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`cantidad`, `hora`, `fecha`, `nroSuc`, `codigo`, `precio`);

ALTER TABLE `bd2_202225_27922357`.`distribuye`   
    ADD COLUMN `estatus` VARCHAR(20) NULL AFTER `codigo`;