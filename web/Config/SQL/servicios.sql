DROP PROCEDURE IF EXISTS servicios_insertar;
DELIMITER $$
CREATE PROCEDURE servicios_insertar (IN _servicio VARCHAR(100), _id_tipo_servicio INT, _cod_servicio VARCHAR(30), _desc_servicio VARCHAR(200),
									_fch_ini DATE, _hora_ini TIME, _fch_fin DATE, _hora_fin TIME, _id_depart INT, 
									_id_lider INT, _id_iglesia INT, _costo INT, _requiere_registro INT)
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_servicio)+1,1) INTO nextID FROM servicios; 
	INSERT INTO servicios (id_servicio, servicio, id_tipo_servicio,cod_servicio, descripcion, fecha_inicio, hora_inicio, fecha_fin, hora_fin, 
							id_departamento, id_lider, id_iglesia, costo, requiere_registro ) 
	 		VALUES(nextID,_servicio, _id_tipo_servicio,_cod_servicio, _desc_servicio, _fch_ini,_hora_ini, _fch_fin,_hora_fin,
	 				_id_depart, _id_lider, _id_iglesia,_costo, _requiere_registro );

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS servicios_mostrar;
DELIMITER $$
CREATE PROCEDURE servicios_mostrar()
BEGIN
SELECT s.*, d.departamento, d.cod_departamento,s.id_lider
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		,i.iglesia
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
		
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
ORDER BY s.fecha_inicio desc;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS servicios_mostrar2;
DELIMITER $$
CREATE PROCEDURE servicios_mostrar2()
BEGIN
SELECT s.*, d.departamento, d.cod_departamento,s.id_lider
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		,i.iglesia
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
		
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
WHERE s.requiere_registro = 1
;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS servicios_eliminar;
DELIMITER $$
CREATE PROCEDURE servicios_eliminar(IN _id_servicio INT)
BEGIN
DELETE FROM servicios WHERE id_servicio = _id_servicio; 
END $$
DELIMITER ;

-- Queda pendiente determinar si utilizare un historico en la misma tabla o en otra.....
DROP PROCEDURE IF EXISTS servicios_modificar;
DELIMITER $$
CREATE PROCEDURE servicios_modificar(IN _id_servicio INT, _id_tipo_servicio INT, _servicio VARCHAR(100), _cod_servicio VARCHAR(30), 
									_desc_servicio VARCHAR(200), _fch_ini DATE, _hora_ini TIME, _fch_fin DATE, 
									_hora_fin TIME, _id_depart INT,	_id_lider INT, _id_iglesia INT, _costo INT)
BEGIN
UPDATE servicios 
	SET servicio = _servicio,
		id_departamento = _id_depart,
		id_lider = _id_lider,
		id_iglesia = _id_iglesia,
		cod_servicio = _cod_servicio,
		ID_TIPO_SERVICIO = _id_tipo_servicio,
		descripcion = _desc_servicio,
		fecha_inicio = _fch_ini,
		hora_inicio = _hora_ini,
		fecha_fin = _fch_fin,
		hora_fin = _fch_fin,
		costo= _costo, 
		requiere_registro=_requiere_registro
	WHERE id_servicio = _id_servicio;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS servicios_buscar;
DELIMITER $$
CREATE PROCEDURE servicios_buscar (IN  _id_servicio INT)
BEGIN
SELECT s.*, i.iglesia, d.departamento, d.cod_departamento
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
	
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
WHERE   s.id_servicio = _id_servicio;
END $$
DELIMITER ;