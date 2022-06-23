DELIMITER $$

CREATE
    /*!50017 DEFINER = 'bd2_202225_27922357'@'%' */
    TRIGGER ImpedirModificarPrecio BEFORE UPDATE ON Posee 
    FOR EACH ROW BEGIN
    DECLARE error_mens VARCHAR(255);    
    
    IF NEW.precio > ((0.15*OLD.precio)+OLD.precio) THEN
        SET error_mens = CONCAT('El nuevo precio ',
                        NEW.precio,
                        ' no puede ser mayor al 15% del precio anterior ',
                        OLD.precio);
                 SIGNAL SQLSTATE '45000' 
         SET MESSAGE_TEXT = error_mens;
    END IF;
    END$$

DELIMITER ;