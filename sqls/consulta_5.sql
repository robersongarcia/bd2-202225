SELECT DISTINCT v.codigo
FROM Ventas v
WHERE (SELECT SUM(cantidad)
    FROM Ventas ve
    WHERE ve.codigo = v.codigo AND MONTH(ve.fecha) = MONTH(NOW()))
      > 2*(SELECT SUM(cantidad)
         FROM Ventas ve
         WHERE ve.codigo = v.codigo AND MONTH(ve.fecha) = MONTH(NOW())-1)