
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `bd2_202225_27922357`.`ProductosAltaDemanda` 
    AS
(SELECT `pr`.`nombre` AS `NombreProducto`,`s`.`nombre` AS `NombreSucursal`,`p`.`precio` AS `PrecioProducto`,(SELECT MAX(`ps`.`precio`) FROM `Posee` `ps` WHERE `ps`.`codigo` = `p`.`codigo`) * 1.15 AS `PrecioSugerido`
    FROM Posee p, Producto pr, Sucursal s
    WHERE AltaDemanda(pr.codigo) AND pr.codigo = p.codigo AND p.nroSuc = s.nroSuc);