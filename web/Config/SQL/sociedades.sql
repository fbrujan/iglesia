DROP PROCEDURE IF EXISTS sociedades_insertar;
DELIMITER $$
CREATE PROCEDURE sociedades_insertar (IN _siglas VARCHAR(10), _sociedad VARCHAR(100), _lema VARCHAR(100), _descripcion VARCHAR(200))
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_sociedad)+1,1) INTO nextID FROM sociedades; 
INSERT INTO sociedades (id_sociedad, siglas, sociedad, lema, descripcion) VALUES(nextID,_siglas, _sociedad, _lema, _descripcion);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sociedades_eliminar;
DELIMITER $$
CREATE PROCEDURE sociedades_eliminar (IN _id_sociedad INT)
BEGIN
DELETE FROM sociedades WHERE id_sociedad = _id_sociedad;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sociedades_modificar;
DELIMITER $$
CREATE PROCEDURE sociedades_modificar (IN _siglas VARCHAR(10), _sociedad VARCHAR(100), _lema VARCHAR(100), _descripcion VARCHAR(200),_id_sociedad INT)
BEGIN
UPDATE sociedades 
	SET sociedad = _sociedad, 
	siglas = _siglas,
	lema = _lema,
	descripcion = _descripcion
WHERE id_sociedad = _id_sociedad;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sociedades_mostrar;
DELIMITER $$
CREATE PROCEDURE sociedades_mostrar ()
BEGIN
SELECT * FROM sociedades;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sociedades_buscar;
DELIMITER $$
CREATE PROCEDURE sociedades_buscar (IN _id_sociedad INT)
BEGIN
SELECT * FROM sociedades WHERE  id_sociedad = _id_sociedad ;
END $$
DELIMITER ;
