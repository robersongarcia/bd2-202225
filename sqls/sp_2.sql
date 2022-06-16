DELIMITER $$
CREATE PROCEDURE ActualizarPrecioReferencia(idProducto INT(11))
BEGIN
    DECLARE precioNuevo FLOAT;
    SET precioNuevo = precioReferencia(idProducto);
    UPDATE Posee
    SET precio = precioNuevo
    WHERE idProducto = codigo;
END$$
DELIMITER ;