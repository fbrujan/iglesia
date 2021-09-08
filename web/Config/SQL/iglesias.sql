DROP PROCEDURE IF EXISTS iglesias_insertar;
DELIMITER $$
CREATE PROCEDURE iglesias_insertar (IN _iglesia VARCHAR(200),_id_circuito INT, _id_provincia INT, 
									_direccion VARCHAR(200), _telefono VARCHAR(15), _fundador VARCHAR(100), 
									_fecha_fundada DATE, _imagen_iglesia VARCHAR(100), _imagen_fundador VARCHAR(100),
									_imagen_pastor_actual VARCHAR(100))
BEGIN
DECLARE nextId INT;
DECLARE _fecha_creacion DATE;
SET _fecha_creacion = NOW();
SELECT IFNULL(MAX(id_iglesia)+1,1) INTO nextID FROM iglesias; 
INSERT INTO iglesias (id_iglesia, iglesia, id_circuito, id_provincia, direccion, telefono
	, fundador, fecha_fundada, fecha_creacion, ultima_actualizacion) 
	 VALUES(nextID, _iglesia, _id_circuito, _id_provincia, _direccion, _telefono, 
	 	_fundador, _fecha_fundada, _fecha_creacion, _fecha_creacion);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS iglesias_mostrar;
DELIMITER $$
CREATE PROCEDURE iglesias_mostrar()
BEGIN
SELECT i.*, d.id_pais, pa.pais, c.id_distrito, d.distrito, c.circuito,
		p.provincia
		
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
ORDER BY d.distrito, c.circuito, i.iglesia ASC
;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS iglesias_eliminar;
DELIMITER $$
CREATE PROCEDURE iglesias_eliminar(_id_iglesia INT)
BEGIN
DELETE FROM iglesias WHERE id_iglesia = _id_iglesia ; 
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS iglesias_modificar;
DELIMITER $$
CREATE PROCEDURE iglesias_modificar (IN _id_iglesia INT, _iglesia VARCHAR(200),_id_circuito INT, _id_provincia INT, 
									_direccion VARCHAR(200), _telefono VARCHAR(15), _fundador VARCHAR(100), 
									_fecha_fundada DATE, _imagen_iglesia VARCHAR(100), _imagen_fundador VARCHAR(100),
									_imagen_pastor_actual VARCHAR(100))
BEGIN
DECLARE fecha_modificacion DATE;
SET fecha_modificacion = NOW();
UPDATE iglesias 
	SET iglesia = _iglesia,
	id_circuito= _id_circuito,
	id_provincia = _id_provincia,
	direccion = _direccion,
	telefono = _telefono,
	fundador = _fundador,
	fecha_fundada = _fecha_fundada,
	ultima_actualizacion=fecha_modificacion
	WHERE id_iglesia = _id_iglesia ;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS iglesias_buscar;
DELIMITER $$
CREATE PROCEDURE iglesias_buscar (IN _id_iglesia INT)
BEGIN
SELECT i.*, d.id_pais, pa.pais, c.id_distrito, d.distrito, c.circuito,
		p.provincia
		
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  id_iglesia =_id_iglesia ;
END $$
DELIMITER ;