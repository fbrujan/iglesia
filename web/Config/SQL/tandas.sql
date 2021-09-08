DROP PROCEDURE IF EXISTS tandas_insertar;
DELIMITER $$
CREATE PROCEDURE tandas_insertar (IN _tanda varchar(100))
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_tanda)+1,1) INTO nextID FROM tandas; 
INSERT INTO tandas (id_tanda,tanda) VALUES(nextID,_tanda);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS tandas_eliminar;
DELIMITER $$
CREATE PROCEDURE tandas_eliminar (IN _id_tanda INT)
BEGIN
DELETE FROM tandas WHERE id_tanda = _id_tanda;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS tandas_modificar;
DELIMITER $$
CREATE PROCEDURE tandas_modificar (IN _id_tanda INT, _tanda VARCHAR(100))
BEGIN
UPDATE tandas SET tanda = _tanda WHERE id_tanda = _id_tanda;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS tandas_mostrar;
DELIMITER $$
CREATE PROCEDURE tandas_mostrar ()
BEGIN
SELECT * FROM tandas;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS tandas_buscar;
DELIMITER $$
CREATE PROCEDURE tandas_buscar (IN _id_tanda INT)
BEGIN
SELECT * FROM tandas WHERE  id_tanda = _id_tanda ;
END $$
DELIMITER ;
