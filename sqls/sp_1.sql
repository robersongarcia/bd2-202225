DELIMITER $$
CREATE PROCEDURE AjustarPrecios(IN nroTienda INT(11),IN porcen FLOAT)
BEGIN
    IF porcen <= 10 AND porcen >= -10 THEN
        UPDATE Posee
        SET precio = (precio + (precio*(porcen/100))) 
        WHERE nroSuc = nroTienda;    
    END IF;
END$$
DELIMITER ;