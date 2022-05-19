SELECT codigo
FROM Producto
WHERE codigo NOT IN(
        SELECT codigo
        FROM Ventas
        WHERE MONTH(Fecha) BETWEEN MONTH(CURDATE())-3 AND MONTH(CURDATE()))