DROP PROCEDURE IF EXISTS comite_temporero_insertar;
DELIMITER $$
CREATE PROCEDURE comite_temporero_insertar (IN _comite varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_comite_temporero)+1,1) INTO nextID FROM comite_temporero;
INSERT INTO comite_temporero (id_comite_temporero, comite_temporero) VALUES(nextID, _comite);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS comite_temporero_eliminar;
DELIMITER $$
CREATE PROCEDURE comite_temporero_eliminar (IN _id_comite INT)
BEGIN
DELETE FROM comite_temporero WHERE id_comite_temporero = _id_comite;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS comite_temporero_modificar;
DELIMITER $$
CREATE PROCEDURE comite_temporero_modificar (IN _id_comite INT, _comite VARCHAR(100))
BEGIN
UPDATE comite_temporero SET comite_temporero = _comite WHERE id_comite_temporero = _id_comite;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS comite_temporero_mostrar;
DELIMITER $$
CREATE PROCEDURE comite_temporero_mostrar ()
BEGIN
SELECT * FROM comite_temporero;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS comite_temporero_buscar;
DELIMITER $$
CREATE PROCEDURE comite_temporero_buscar (IN _id_comite INT)
BEGIN
SELECT * FROM comite_temporero WHERE  id_comite_temporero = _id_comite ;
END $$
DELIMITER ;
