CREATE FUNCTION NroSucursal() RETURNS INTEGER DETERMINISTIC RETURN @cod; /*Funcion auxiliar que nos ayuda a o */

CREATE VIEW InventarioTienda  /* Creacion de la vista*/
AS SELECT p.codigo AS CodigoProducto, pr.nombre AS NombreProducto, p.nroSuc, s.nombre NombreTienda, p.precio AS precioProducto, p.cantidad AS Cantidad
    FROM Posee p, Producto pr, Sucursal s
    WHERE p.nroSuc = NroSucursal() AND p.codigo = pr.codigo AND p.nroSuc = s
    
SELECT s.* FROM (SELECT @cod:=3 p) pass,InventarioTienda s;  /* esta es la forma de llamar a la vista con el parametro, el 3 es un ejemplo */