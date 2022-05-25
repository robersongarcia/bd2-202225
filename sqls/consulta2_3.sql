/* 3. Obtenga el producto que más ha generado ganancias económicas (todas sus compras - todas sus venta) en todas las tiendas. */

 
SELECT ingresos.codigo, ingreso-costo AS Ganancias
FROM 
(
    SELECT codigo, SUM(precio*cantidad) AS costo
    FROM Compra
    GROUP BY codigo
) AS costos,
(
    SELECT v.codigo, SUM(p.precio*v.cantidad) AS ingreso
    FROM Ventas v, Posee p
    WHERE v.codigo = p.codigo
    GROUP BY v.codigo
) AS ingresos
WHERE costos.codigo = ingresos.codigo
ORDER BY Ganancias DESC
LIMIT 1