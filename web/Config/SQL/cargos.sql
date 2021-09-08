DROP PROCEDURE IF EXISTS cargos_insertar;
DELIMITER $$
CREATE PROCEDURE cargos_insertar (IN _cargo varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_cargo)+1,1) INTO nextID FROM cargos;
INSERT INTO cargos (id_cargo,cargo) VALUES(nextID,_cargo);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS cargos_eliminar;
DELIMITER $$
CREATE PROCEDURE cargos_eliminar (IN _id_cargo INT)
BEGIN
DELETE FROM cargos WHERE id_cargo = _id_cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS cargos_renombrar;
DELIMITER $$
CREATE PROCEDURE cargos_renombrar (IN _id_cargo INT, _cargo VARCHAR(100))
BEGIN
UPDATE cargos SET cargo = _cargo WHERE id_cargo = _id_cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS cargos_mostrar;
DELIMITER $$
CREATE PROCEDURE cargos_mostrar ()
BEGIN
SELECT * FROM cargos;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS cargos_buscar;
DELIMITER $$
CREATE PROCEDURE cargos_buscar (IN _id_cargo INT)
BEGIN
SELECT * FROM cargos WHERE  id_cargo = _id_cargo ;
END $$
DELIMITER ;
