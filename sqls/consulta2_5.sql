/* 5. El producto que más rotación tuvo (la mayor cantidad de veces que la central compró el producto, sin importar la cantidad). */

SELECT p.codigo, p.nombre ,COUNT(p.codigo) cantidad_de_compras
FROM Compra c, Producto p
WHERE c.codigo = p.codigo
GROUP BY p.codigo
ORDER BY cantidad_de_compras DESC
LIMIT 1 a