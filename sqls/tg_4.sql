DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    TRIGGER `bd2_202225_27922357`.`VerificaDespuesVenta` AFTER INSERT
    ON `bd2_202225_27922357`.`Ventas`
    FOR EACH ROW BEGIN
    CALL PedidoEmergencia(NEW.nroSuc);
    END$$

DELIMITER ;