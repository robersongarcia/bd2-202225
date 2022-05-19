SELECT nroSuc AS Sucursal
FROM Sucursal
WHERE nroSuc NOT IN(
        SELECT nroSuc
        FROM Ventas
        WHERE codigo = 1) /* Cambiar el 1 por el codigo del producto que se desea */