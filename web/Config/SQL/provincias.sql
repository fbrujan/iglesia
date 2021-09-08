DROP PROCEDURE IF EXISTS provincias_insertar;
DELIMITER $$
CREATE PROCEDURE provincias_insertar (IN _provincia varchar(100), _ciudad_cabecera VARCHAR(100), _id_pais INT)
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_provincia)+1,1) INTO nextID FROM provincias ; 
INSERT INTO provincias (id_provincia,provincia, ciudad_cabecera, id_pais) VALUES(nextID, _provincia, _ciudad_cabecera, _id_pais);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS provincias_mostrar;
DELIMITER $$
CREATE PROCEDURE provincias_mostrar()
BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
ORDER BY pr.id_pais, pr.provincia ASC;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS provincias_eliminar;
DELIMITER $$
CREATE PROCEDURE provincias_eliminar(IN _id_provincia INT)
BEGIN
DELETE FROM provincias WHERE  id_provincia = _id_provincia;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS provincias_modificar;
DELIMITER $$
CREATE PROCEDURE provincias_modificar(IN _id_provincia INT, _provincia VARCHAR(100), _ciudad_cabecera VARCHAR(100))
BEGIN
UPDATE provincias 
	SET provincia = _provincia,
	    ciudad_cabecera = _ciudad_cabecera
	WHERE id_provincia = _id_provincia;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS provincias_buscar;
DELIMITER $$
CREATE PROCEDURE provincias_buscar (IN  _id_provincia INT)
BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
WHERE  id_provincia = _id_provincia 
ORDER BY pr.id_pais, pr.provincia ASC;
END $$
DELIMITER ;