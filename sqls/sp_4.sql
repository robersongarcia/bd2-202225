DELIMITER $$
CREATE PROCEDURE PedidoEmergencia(idTienda INT)
BEGIN
    DECLARE cod INTEGER;
    DECLARE fin INTEGER DEFAULT 0;
    DECLARE cur CURSOR FOR 
        SELECT p.codigo 
        FROM Posee p
        WHERE AltaDemanda(p.codigo) = TRUE AND p.nroSuc = idTienda;
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET fin = 1;
        
    OPEN cur;
    
    hacerPedidos: LOOP
        FETCH cur INTO cod;
        IF fin = 1 THEN 
            LEAVE hacerPedidos;
        END IF;
        
        CALL SolicitudProducto(idTienda, cod, CantidadVendidaHoy(idTienda,cod));    
        
    END LOOP hacerPedidos;                
    
    CLOSE cur;
END$$
DELIMITER ;

/*
Declaración de CantidadVendidaHoy

DELIMITER $$

CREATE FUNCTION CantidadVendidaHoy(
    idTienda INT(11),
    idProducto INT(11)
)
RETURNS INT
NOT DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    
    SELECT SUM(cantidad)
    INTO total
    FROM Ventas
    WHERE nroSuc = idTienda AND fecha = CURDATE() AND codigo = idProducto;
    
    IF (total IS NULL) THEN
	RETURN 0;
    ELSE
	RETURN total;
    END IF;	
END$$

DELIMITER ;
 */