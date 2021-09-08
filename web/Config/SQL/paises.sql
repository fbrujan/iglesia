DROP PROCEDURE IF EXISTS paises_insertar;
DELIMITER $$
CREATE PROCEDURE paises_insertar (IN _pais varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_pais)+1,1) INTO nextID FROM paises; 
INSERT INTO paises (id_pais, pais) VALUES(nextID, _pais);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS paises_eliminar;
DELIMITER $$
CREATE PROCEDURE paises_eliminar (IN _id_pais INT)
BEGIN
DELETE FROM paises WHERE id_pais = _id_pais;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS paises_renombrar;
DELIMITER $$
CREATE PROCEDURE paises_renombrar (IN _id_pais INT, _pais VARCHAR(100))
BEGIN
UPDATE paises SET pais = _pais WHERE id_pais = _id_pais;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS paises_mostrar;
DELIMITER $$
CREATE PROCEDURE paises_mostrar ()
BEGIN
SELECT * FROM paises;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS paises_buscar;
DELIMITER $$
CREATE PROCEDURE paises_buscar (IN _id_pais INT)
BEGIN
SELECT * FROM paises WHERE  id_pais =_id_pais;
END $$
DELIMITER ;
