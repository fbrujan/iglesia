DROP PROCEDURE IF EXISTS tipo_servicios_insertar;
DELIMITER $$
CREATE PROCEDURE tipo_servicios_insertar (IN _tipo_servicio varchar(100), _cod_tipo_servicio VARCHAR(10))
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_tipo_servicio)+1,1) INTO nextID FROM tipo_servicio; 
INSERT INTO tipo_servicio (id_tipo_servicio,tipo_servicio,cod_tipo_servicio)
	 VALUES(nextID,_tipo_servicio,_cod_tipo_servicio);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS tipo_servicios_eliminar;
DELIMITER $$
CREATE PROCEDURE tipo_servicios_eliminar (IN _id_tipo_servicio INT)
BEGIN
DELETE FROM tipo_servicio WHERE id_tipo_servicio = _id_tipo_servicio;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS tipo_servicios_modificar;
DELIMITER $$
CREATE PROCEDURE tipo_servicios_modificar (IN _id_tipo_servicio INT, _cod_tipo_servicio VARCHAR(10), _tipo_servicio VARCHAR(100))
BEGIN
UPDATE tipo_servicio 
	SET tipo_servicio 		= _tipo_servicio, 
		cod_tipo_servicio 	=_cod_tipo_servicio
WHERE id_tipo_servicio = _id_tipo_servicio;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS tipo_servicios_mostrar;
DELIMITER $$
CREATE PROCEDURE tipo_servicios_mostrar ()
BEGIN
SELECT * FROM tipo_servicio;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS tipo_servicios_buscar;
DELIMITER $$
CREATE PROCEDURE tipo_servicios_buscar (IN _id_tipo_servicio INT)
BEGIN
SELECT * FROM tipo_servicio WHERE  id_tipo_servicio =  _id_tipo_servicio;
END $$
DELIMITER ;
