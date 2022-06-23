DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    TRIGGER `bd2_202225_27922357`.`ExisteProductoAlRegistrar` BEFORE INSERT
    ON `bd2_202225_27922357`.`Producto`
    FOR EACH ROW BEGIN
    IF NEW.nombre = (SELECT nombre FROM Producto WHERE nombre = NEW.nombre) THEN
        SET NEW.nombre = CONCAT(NEW.nombre,'*DUPLICADO*');
    END IF;
    END$$

DELIMITER ;