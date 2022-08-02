DELIMITER $$

CREATE PROCEDURE `bd2_202225_27922357`.`CierreDeCaja`(idTienda INT)
	BEGIN
		DECLARE total_vendido FLOAT DEFAULT 0;
		DECLARE cantidad_vendida INT DEFAULT 0;
		
		SELECT SUM(precio*cantidad)
		INTO total_vendido
		FROM Ventas
		WHERE fecha = CURDATE() AND nroSuc = idTienda;
		
		SELECT SUM(cantidad)
		INTO cantidad_vendida
		FROM Ventas
		WHERE fecha = CURDATE() AND nroSuc = idTienda;
		
		IF (total_vendido>0 OR cantidad_vendida>0) THEN
			INSERT INTO Cierres VALUES (idTienda,CURDATE(),total_vendido,cantidad_vendida);
		END IF;
	END$$

DELIMITER ;