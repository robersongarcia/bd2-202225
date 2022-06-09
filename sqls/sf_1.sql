DELIMITER $$

CREATE FUNCTION VentasTotales(
    idTienda INT(11),
    fechaInp DATE
)
RETURNS FLOAT
NOT DETERMINISTIC
BEGIN
    DECLARE total FLOAT;
    
    SELECT SUM(cantidad*precio)
    INTO total
    FROM Ventas
    WHERE nroSuc = idTienda AND fecha = fechaInp;
    
    RETURN (total);
    
END$$

DELIMITER ;