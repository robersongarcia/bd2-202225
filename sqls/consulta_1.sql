SELECT nroSuc AS Sucursales, SUM(cantidad) AS CantidadVendida
FROM Ventas
WHERE MONTH(fecha) = MONTH(NOW()) AND YEAR(fecha) = YEAR(NOW())
GROUP BY nroSuc