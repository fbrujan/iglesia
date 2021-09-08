DROP PROCEDURE IF EXISTS personas_insertar;
DELIMITER $$
CREATE PROCEDURE personas_insertar (IN _nombres VARCHAR(100), _apellidos VARCHAR(100), _fch_nac DATE, 
									_telefono VARCHAR(15), _direccion VARCHAR(100), _id_sexo INT, 
									_id_tipo_documento INT, _nro_documento VARCHAR(20), _imagen VARCHAR(100),
									_id_provincia INT, _id_pais INT,_apodo VARCHAR(20), _id_estado_civil INT,
									_id_clasificacion INT, OUT nextID INT)
BEGIN
DECLARE fecha_creacion DATE;
SELECT IFNULL(MAX(id_persona)+1,1) INTO nextID FROM personas; 
SET fecha_creacion = now();
INSERT INTO personas (id_persona, nombres, apellidos, fecha_nacimiento, telefono, direccion, id_sexo, 
						id_tipo_documento, nro_documento_identidad, imagen, id_provincia, id_pais, 
						apodo, id_estado_civil, fecha_creacion,id_clasificacion) 
			VALUES(nextID, _nombres, _apellidos, _fch_nac, _telefono, _direccion, _id_sexo, 
				_id_tipo_documento, _nro_documento, _imagen, _id_provincia, _id_pais, 
				_apodo, _id_estado_civil, fecha_creacion,_id_clasificacion);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS personas_eliminar;
DELIMITER $$
CREATE PROCEDURE personas_eliminar (IN _id_persona INT)
BEGIN
DELETE FROM personas WHERE id_persona = _id_persona;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS personas_modificar;
DELIMITER $$
CREATE PROCEDURE personas_modificar (IN _id_persona INT, _nombres VARCHAR(100), _apellidos VARCHAR(100), _fch_nac DATE, 
									_telefono VARCHAR(15), _direccion VARCHAR(100), _id_sexo INT, 
									_id_tipo_documento INT, _nro_documento VARCHAR(20), _imagen VARCHAR(100),
									_id_provincia INT, _id_pais INT,_apodo VARCHAR(20), _id_estado_civil INT,
									_id_clasificacion INT)
BEGIN
DECLARE fecha_modificacion DATE;
SET fecha_modificacion = now();
UPDATE personas 
	SET nombres = _nombres, apellidos = _apellidos, fecha_nacimiento=_fch_nac, 
	telefono = _telefono, direccion = _direccion, id_sexo = _id_sexo, 
	id_tipo_documento =_id_tipo_documento, nro_documento_identidad = _nro_documento, 
	imagen = _imagen, id_provincia = _id_provincia, id_pais = _id_pais, apodo= _apodo, id_estado_civil =_id_estado_civil
	,ultima_modificacion = fecha_modificacion
	,id_clasificacion=_id_clasificacion
WHERE id_persona = _id_persona;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS personas_mostrar;
DELIMITER $$
CREATE PROCEDURE personas_mostrar ()
BEGIN
SELECT p.*, pr.provincia,td.tipo_documento, pa.pais, s.sexo, ec.estado_civil 
, CONCAT(p.nombres,' ',p.apellidos) as persona
, pc.clasificacion
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	INNER JOIN estado_civil ec ON p.id_estado_civil = ec.id_estado_civil
	INNER JOIN sexos s ON p.id_sexo = s.id_sexo
	INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
	INNER JOIN personas_clasificacion pc on p.id_clasificacion=pc.id_clasificacion
ORDER BY persona
	;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS personas_buscar;
DELIMITER $$
CREATE PROCEDURE personas_buscar (IN _id_persona INT)
BEGIN
SELECT p.*, pr.provincia,td.tipo_documento, pa.pais, s.sexo, ec.estado_civil , CONCAT(p.nombres,' ',p.apellidos) as persona
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	INNER JOIN estado_civil ec ON p.id_estado_civil = ec.id_estado_civil
	INNER JOIN sexos s ON p.id_sexo = s.id_sexo
	INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
WHERE  id_persona = _id_persona;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS personas_buscar_nombre;
DELIMITER $$
CREATE PROCEDURE personas_buscar_nombre (IN _persona VARCHAR(50))
BEGIN
SELECT p.*, pr.provincia,td.tipo_documento, pa.pais, s.sexo, ec.estado_civil , CONCAT(p.nombres,' ',p.apellidos) as persona
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	INNER JOIN estado_civil ec ON p.id_estado_civil = ec.id_estado_civil
	INNER JOIN sexos s ON p.id_sexo = s.id_sexo
	INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
WHERE  nombres LIKE CONCAT('%', _persona, '%')
	   or apellidos LIKE CONCAT('%', _persona, '%')
	   or apodo LIKE CONCAT('%', _persona, '%');
END $$
DELIMITER ;
