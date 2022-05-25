/* 4. Listado de productos cuya venta en el año en curso es superior al mismo período del año anterior. */

SELECT DISTINCT v.codigo, p.nombre
FROM Ventas v, Producto p
WHERE (SELECT SUM(cantidad)
    FROM Ventas ve
    WHERE ve.codigo = v.codigo AND YEAR(ve.fecha) = YEAR(NOW()))
      > (SELECT SUM(cantidad)
         FROM Ventas ve
         WHERE ve.codigo = v.codigo AND YEAR(ve.fecha) = YEAR(NOW())-1) 
     AND v.codigo = p.codigo