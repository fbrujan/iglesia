DROP PROCEDURE IF EXISTS departamentos_insertar;
DELIMITER $$
CREATE PROCEDURE departamentos_insertar (IN _departamento VARCHAR(100), _descripcion VARCHAR(200))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_departamento)+1,1) INTO nextID FROM departamentos;
INSERT INTO departamentos (id_departamento,departamento, descripcion) VALUES(nextID, _departamento, _descripcion);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS departamentos_eliminar;
DELIMITER $$
CREATE PROCEDURE departamentos_eliminar (IN _id_departamento INT)
BEGIN
DELETE FROM departamentos WHERE id_departamento = _id_departamento;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS departamentos_modificar;
DELIMITER $$
CREATE PROCEDURE departamentos_modificar (IN _id_departamento INT, _departamento VARCHAR(100), _descripcion VARCHAR(200))
BEGIN
UPDATE departamentos SET departamento = _departamento, descripcion = _descripcion WHERE id_departamento = _id_departamento;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS departamentos_mostrar;
DELIMITER $$
CREATE PROCEDURE departamentos_mostrar ()
BEGIN
SELECT * FROM departamentos;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS departamentos_buscar;
DELIMITER $$
CREATE PROCEDURE departamentos_buscar (IN _id_departamento INT)
BEGIN
SELECT * FROM departamentos WHERE  id_departamento = _id_departamento;
END $$
DELIMITER ;
