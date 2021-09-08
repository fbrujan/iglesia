DROP PROCEDURE IF EXISTS estado_insertar;
DELIMITER $$
CREATE PROCEDURE estado_insertar (IN _estado VARCHAR(100), _elegible_lider INT)
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_estado)+1,1) INTO nextID FROM estado_condicion;
INSERT INTO estado_condicion (id_estado, estado, elegible_lider) VALUES(nextID,_estado, _elegible_lider);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS estado_eliminar;
DELIMITER $$
CREATE PROCEDURE estado_eliminar (IN _id_estado INT)
BEGIN
DELETE FROM estado_condicion WHERE id_estado = _id_estado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS estado_modificar;
DELIMITER $$
CREATE PROCEDURE estado_modificar (IN _id_estado INT, _estado VARCHAR(100), _elegible_lider INT)
BEGIN
UPDATE estado_condicion SET estado = _estado, elegible_lider = _elegible_lider WHERE id_estado = _id_estado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS estado_mostrar;
DELIMITER $$
CREATE PROCEDURE estado_mostrar ()
BEGIN
SELECT * FROM estado_condicion;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS estado_buscar;
DELIMITER $$
CREATE PROCEDURE estado_buscar (IN _id_estado VARCHAR(100))
BEGIN
SELECT * FROM estado_condicion WHERE  id_estado = _id_estado ;
END $$
DELIMITER ;
