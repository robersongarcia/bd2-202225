DELIMITER $$

USE `bd2_202225_27922357`$$

DROP TRIGGER /*!50032 IF EXISTS */ `AjustarInventario`$$

CREATE
    /*!50017 DEFINER = 'bd2_202225_27922357'@'%' */
    TRIGGER `AjustarInventario` AFTER UPDATE ON `distribuye` 
    FOR EACH ROW BEGIN
    DECLARE precioCentral FLOAT;
    IF NEW.estatus = 'Entregado' THEN
        UPDATE Posee SET cantidad=cantidad-NEW.cantidad WHERE nroSuc = NEW.distribuye AND codigo=NEW.codigo;                
        
        IF EXISTS(SELECT codigo FROM Posee WHERE nroSuc=NEW.recibe AND codigo=NEW.codigo) THEN
            UPDATE Posee SET cantidad=cantidad+NEW.cantidad WHERE nroSuc = NEW.recibe AND codigo=NEW.codigo;
        ELSE
            SET precioCentral = (SELECT precio FROM Posee WHERE codigo=NEW.codigo AND nroSuc=NEW.distribuye);
            INSERT INTO Posee (codigo,nroSuc,precio,cantidad)
            VALUES (NEW.codigo,NEW.recibe,precioCentral,NEW.cantidad);
        END IF;
    END IF;
    END;
$$

DELIMITER ;