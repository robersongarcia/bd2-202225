ALTER TABLE `bd2_202225_27922357`.`Posee`   
	ADD COLUMN `cantidad` INT(11) NOT NULL AFTER `precio`;

ALTER TABLE `bd2_202225_27922357`.`Compra`   
    ADD COLUMN `precio` FLOAT NOT NULL AFTER `fecha`, 
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`nroSuc`, `codigo`, `cantidad`, `fecha`, `precio`);