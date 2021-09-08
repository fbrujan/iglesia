DROP PROCEDURE IF EXISTS circuitos_insertar;
DELIMITER $$
CREATE PROCEDURE circuitos_insertar (IN _id_distrito INT, _id_provincia INT,  _circuito varchar(100))
BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_circuito)+1,1) INTO nextID FROM circuitos ; 
INSERT INTO circuitos (id_distrito, id_provincia, id_provincia2, id_circuito, circuito) 
				VALUES(_id_distrito, _id_provincia, NULL, nextID, _circuito);
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS circuitos_mostrar;
DELIMITER $$
CREATE PROCEDURE circuitos_mostrar()
BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
ORDER BY c.id_distrito, c.circuito ASC
			;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS circuitos_eliminar;
DELIMITER $$
CREATE PROCEDURE circuitos_eliminar(IN _id_circuito INT)
BEGIN
DELETE FROM circuitos WHERE id_circuito = _id_circuito;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS circuitos_renombrar;
DELIMITER $$
CREATE PROCEDURE circuitos_renombrar(IN _id_circuito INT, _circuito VARCHAR(100))
BEGIN
UPDATE circuitos 
	SET circuito = _circuito
	WHERE id_circuito = _id_circuito;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS circuitos_buscar;
DELIMITER $$
CREATE PROCEDURE circuitos_buscar (IN  _id_circuito INT)
BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  id_circuito = _id_circuito ;
END $$
DELIMITER ;