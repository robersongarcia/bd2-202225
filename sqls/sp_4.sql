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