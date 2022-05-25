/* 2. Obtenga el precio más económico en que se ha vendido un producto en particular y la fecha y tienda de la venta. */

SELECT s.nombre, pr.nombre, p.precio, v.fecha
FROM Posee p, Ventas v, Sucursal s, Producto pr
WHERE p.codigo = v.codigo 
      AND p.nroSuc = v.nroSuc 
      AND v.codigo = 1 
      AND p.precio = (SELECT MIN(precio) FROM Posee WHERE codigo = 1 AND nroSuc != 1)
      AND p.nroSuc = s.nroSuc
      AND pr.codigo = p.codigo