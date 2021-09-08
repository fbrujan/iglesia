DROP PROCEDURE IF EXISTS cargos_comite_temporero_insertar;
DELIMITER $$
CREATE PROCEDURE cargos_comite_temporero_insertar (IN _cargo_comite varchar(100))
BEGIN
INSERT INTO cargos_comite_temporero (cargo_comite_temporero) VALUES(_cargo_comite);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS cargos_comite_temporero_eliminar;
DELIMITER $$
CREATE PROCEDURE cargos_comite_temporero_eliminar (IN _id_cargo_comite INT)
BEGIN
DELETE FROM cargos_comite_temporero WHERE id_cargo_comite = _id_cargo_comite;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS cargos_comite_temporero_modificar;
DELIMITER $$
CREATE PROCEDURE cargos_comite_temporero_modificar (IN _id_cargo_comite INT, _cargo_comite VARCHAR(100))
BEGIN
UPDATE cargos_comite_temporero SET cargo_comite_temporero = _cargo_comite WHERE id_cargo_comite = _id_cargo_comite;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS cargos_comite_temporero_mostrar;
DELIMITER $$
CREATE PROCEDURE cargos_comite_temporero_mostrar ()
BEGIN
SELECT * FROM cargos_comite_temporero;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS cargos_comite_temporero_buscar;
DELIMITER $$
CREATE PROCEDURE cargos_comite_temporero_buscar (IN _cargo_comite VARCHAR(100))
BEGIN
SELECT * FROM cargos_comite_temporero WHERE  cargo_comite_temporero LIKE  CONCAT('%',_cargo_comite,'%') ;
END $$
DELIMITER ;
