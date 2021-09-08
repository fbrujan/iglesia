DROP PROCEDURE IF EXISTS paises_insertar;
DELIMITER $$
CREATE PROCEDURE paises_insertar (IN _pais varchar(100))
BEGIN
INSERT INTO paises (pais) VALUES(_pais);
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
CREATE PROCEDURE paises_buscar (IN _pais VARCHAR(100))
BEGIN
SELECT * FROM paises WHERE  pais LIKE  CONCAT('%',_pais,'%') ;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS distritos_insertar;
DELIMITER $$
CREATE PROCEDURE distritos_insertar (IN _id_pais INT, _distrito varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_distrito)+1,1) INTO nextID FROM distritos WHERE id_pais = _id_pais; 
INSERT INTO distritos (id_distrito, id_pais, distrito) VALUES(nextID, _id_pais, _distrito);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS distritos_mostrar;
DELIMITER $$
CREATE PROCEDURE distritos_mostrar()
BEGIN
SELECT * FROM distritos;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS distritos_eliminar;
DELIMITER $$
CREATE PROCEDURE distritos_eliminar(IN _id_pais INT, _id_distrito INT)
BEGIN
DELETE FROM distritos WHERE id_pais = _id_pais AND id_distrito = _id_distrito;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS distritos_renombrar;
DELIMITER $$
CREATE PROCEDURE distritos_renombrar(IN _id_pais INT, _id_distrito INT, _distrito VARCHAR(100))
BEGIN
UPDATE distritos 
	SET distrito = _distrito
	WHERE id_pais = _id_pais AND id_distrito = _id_distrito;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS distritos_buscar;
DELIMITER $$
CREATE PROCEDURE distritos_buscar (IN _id_pais INT, _distrito VARCHAR(100))
BEGIN
SELECT * FROM distritos WHERE  id_pais= _id_pais and distrito LIKE  CONCAT('%',_distrito,'%') ;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS provincias_insertar;
DELIMITER $$
CREATE PROCEDURE provincias_insertar (IN _id_pais INT, _provincia varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_provincia)+1,1) INTO nextID FROM provincias WHERE id_pais = _id_pais; 
INSERT INTO provincias (id_provincia, id_pais, provincia) VALUES(nextID, _id_pais, _provincia);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS provincias_mostrar;
DELIMITER $$
CREATE PROCEDURE provincias_mostrar()
BEGIN
SELECT * FROM provincias;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS provincias_eliminar;
DELIMITER $$
CREATE PROCEDURE provincias_eliminar(IN _id_pais INT, _id_provincia INT)
BEGIN
DELETE FROM provincias WHERE id_pais = _id_pais AND id_provincia = _id_provincia;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS provincias_renombrar;
DELIMITER $$
CREATE PROCEDURE provincias_renombrar(IN _id_pais INT, _id_provincia INT, _provincia VARCHAR(100))
BEGIN
UPDATE provincias 
	SET provincia = _provincia
	WHERE id_pais = _id_pais AND id_provincia = _id_provincia;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS provincias_buscar;
DELIMITER $$
CREATE PROCEDURE provincias_buscar (IN _id_pais INT, _provincia VARCHAR(100))
BEGIN
SELECT * FROM provincias WHERE  id_pais= _id_pais and provincia LIKE  CONCAT('%',_provincia,'%') ;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS circuitos_insertar;
DELIMITER $$
CREATE PROCEDURE circuitos_insertar (IN _id_distrito INT, _id_provincia INT, _id_provincia2 INT, _circuito varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_circuito)+1,1) INTO nextID FROM circuitos WHERE id_distrito = _id_distrito; 
INSERT INTO circuitos (id_distrito, id_provincia, id_provincia2, id_circuito, circuito) 
				VALUES(_id_distrito, _id_provincia, _id_provincia2, nextID, _circuito);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS circuitos_mostrar;
DELIMITER $$
CREATE PROCEDURE circuitos_mostrar()
BEGIN
SELECT * FROM circuitos;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS circuitos_eliminar;
DELIMITER $$
CREATE PROCEDURE circuitos_eliminar(IN _id_distrito INT, _id_circuito INT)
BEGIN
DELETE FROM circuitos WHERE id_distrito = _id_distrito AND id_circuito = _id_circuito;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS circuitos_renombrar;
DELIMITER $$
CREATE PROCEDURE circuitos_renombrar(IN _id_distrito INT, _id_circuito INT, _circuito VARCHAR(100))
BEGIN
UPDATE circuitos 
	SET circuito = _circuito
	WHERE id_distrito = _id_distrito AND id_circuito = _id_circuito;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS circuitos_buscar;
DELIMITER $$
CREATE PROCEDURE circuitos_buscar (IN _id_distrito INT, _circuito VARCHAR(100))
BEGIN
SELECT * FROM circuitos WHERE  id_pais= _id_distrito and circuito LIKE  CONCAT('%',_circuito,'%') ;
END $$
DELIMITER ;







