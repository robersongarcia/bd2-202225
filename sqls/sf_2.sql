DELIMITER $$

CREATE FUNCTION AltaDemanda(idProducto INT)
RETURNS BOOL
NOT DETERMINISTIC
BEGIN
    DECLARE cantidadTotal INT;
    DECLARE cantidadVendidas INT;
    DECLARE resultado BOOL;    
    
    SELECT SUM(cantidad)
    INTO cantidadTotal
    FROM Posee
    WHERE codigo = idProducto;
    
    SELECT SUM(cantidad)
    INTO cantidadVendidas
    FROM Ventas
    WHERE codigo = idProducto AND CURDATE() = fecha;    
    
    IF cantidadVendidas > (0.5*cantidadTotal) THEN
        SET resultado = TRUE;
    ELSE
        SET resultado = FALSE;
    END IF;
    
    RETURN(resultado);
END$$

DELIMITER ;