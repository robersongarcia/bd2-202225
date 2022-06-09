DELIMITER $$

CREATE FUNCTION costoReposicion(idProducto INT)
RETURNS FLOAT
NOT DETERMINISTIC
BEGIN

DECLARE ultimoPrecio FLOAT;
DECLARE meses INT;
DECLARE cantidadPorMes FLOAT;
DECLARE resultado FLOAT;

SET ultimoPrecio = (SELECT precio FROM Compra WHERE codigo = idProducto    ORDER BY fecha DESC LIMIT 1);
SET meses = FLOOR(DATEDIFF(NOW(), (SELECT fecha FROM Compra WHERE codigo = idProducto ORDER BY fecha DESC LIMIT 1))/30);
SET cantidadPorMes = ultimoPrecio*0.02;

SET resultado = ultimoPrecio+(meses*cantidadPorMes);

RETURN (resultado);

END$$

DELIMITER ;