/*1. El producto más vendido los días domingo */

SELECT codigo AS producto, SUM(cantidad) AS cantidad_vendida
FROM Ventas
WHERE DAYNAME(fecha) = "Sunday"
GROUP BY codigo
HAVING MAX(cantidad_vendida)