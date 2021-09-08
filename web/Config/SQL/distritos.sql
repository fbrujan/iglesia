DROP PROCEDURE IF EXISTS distritos_insertar;
DELIMITER $$
CREATE PROCEDURE distritos_insertar (IN _id_pais INT, _distrito varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_distrito)+1,1) INTO nextID FROM distritos; 
INSERT INTO distritos (id_distrito, id_pais, distrito) VALUES(nextID, _id_pais, _distrito);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS distritos_mostrar;
DELIMITER $$
CREATE PROCEDURE distritos_mostrar()
BEGIN
SELECT d.*, p.pais 
	FROM distritos d 
	INNER JOIN paises p ON d.id_pais = p.id_pais ;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS distritos_eliminar;
DELIMITER $$
CREATE PROCEDURE distritos_eliminar(IN  _id_distrito INT)
BEGIN
DELETE FROM distritos WHERE id_distrito = _id_distrito;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS distritos_renombrar;
DELIMITER $$
CREATE PROCEDURE distritos_renombrar(IN _id_distrito INT, _distrito VARCHAR(100))
BEGIN
UPDATE distritos 
	SET distrito = _distrito
	WHERE id_distrito = _id_distrito;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS distritos_buscar;
DELIMITER $$
CREATE PROCEDURE distritos_buscar (IN _id_distrito INT)
BEGIN
SELECT d.*, p.pais
FROM distritos d INNER JOIN paises p ON d.id_pais = p.id_pais
WHERE  id_distrito = _id_distrito ;
END $$
DELIMITER ;
