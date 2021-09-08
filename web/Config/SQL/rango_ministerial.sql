DROP PROCEDURE IF EXISTS rango_ministerial_insertar;
DELIMITER $$
CREATE PROCEDURE rango_ministerial_insertar (IN _rango varchar(100), _cod_rango VARCHAR(5))
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_rango)+1,1) INTO nextID FROM rango_ministerial; 
INSERT INTO rango_ministerial (id_rango,rango_ministerial,cod_rango) VALUES(nextID, _rango, _cod_rango);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rango_ministerial_eliminar;
DELIMITER $$
CREATE PROCEDURE rango_ministerial_eliminar (IN _id_rango INT)
BEGIN
DELETE FROM rango_ministerial WHERE id_rango = _id_rango;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rango_ministerial_modificar;
DELIMITER $$
CREATE PROCEDURE rango_ministerial_modificar (IN _id_rango INT, _rango VARCHAR(100), _cod_rango VARCHAR(5))
BEGIN
UPDATE rango_ministerial SET rango_ministerial = _rango , cod_rango=_cod_rango
WHERE id_rango = _id_rango;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rango_ministerial_mostrar;
DELIMITER $$
CREATE PROCEDURE rango_ministerial_mostrar ()
BEGIN
SELECT * FROM rango_ministerial;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rango_ministerial_buscar;
DELIMITER $$
CREATE PROCEDURE rango_ministerial_buscar (IN _id_rango INT)
BEGIN
SELECT * FROM rango_ministerial WHERE  id_rango = _id_rango ;
END $$
DELIMITER ;
