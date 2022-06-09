/* 
cantidad*precio por cada tienda
    entre
sumatoria productos 
 */

DELIMITER $$

CREATE FUNCTION precioReferencia(idProducto INT)
RETURNS FLOAT
NOT DETERMINISTIC
BEGIN

DECLARE totalProductos FLOAT;
DECLARE cantidadProductos INT;
DECLARE resultado FLOAT;

SELECT SUM(cantidad*precio)
INTO totalProductos
FROM Posee
WHERE codigo = idProducto;

SELECT SUM(cantidad)
INTO cantidadProductos
FROM Posee
WHERE codigo = idProducto;

SET resultado = totalProductos/cantidadProductos;

RETURN resultado;

END$$
DELIMITER ;