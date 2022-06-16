DELIMITER $$
CREATE PROCEDURE SolicitudProducto(idTienda INT(11),idProducto INT(11),cantidadSol INT(11))
BEGIN
    DECLARE cantidadCentral INT(11) DEFAULT 0;
    SET cantidadCentral = (SELECT cantidad FROM Posee WHERE codigo = idProducto AND nroSuc = 1);
    IF cantidadCentral >= cantidadSol THEN
        INSERT INTO distribuye (distribuye,recibe,cantidad,fecha,codigo,estatus)
        VALUES (1,idTienda,cantidadSol,CURDATE(),idProducto,"Por Procesar");
    ELSE
        INSERT INTO distribuye (distribuye,recibe,cantidad,fecha,codigo,estatus)
        VALUES (1,idTienda,cantidadSol,CURDATE(),idProducto,"Sin Inventario");
    END IF;    
END$$
DELIMITER ;