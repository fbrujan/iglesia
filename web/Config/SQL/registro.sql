DROP PROCEDURE IF EXISTS registro_insertar;
DELIMITER $$
CREATE PROCEDURE registro_insertar (IN _id_servicio INT, _id_distrito INT, _id_circuito INT, _id_iglesia INT,
									_id_persona INT,_es_pastor INT, _es_delegado INT, _es_presbitero INT, _trabaja_comite INT,
									_es_visita INT, _es_exonerado INT, _es_lider INT, _es_miembro_ministerial INT, _es_miembro_iglesia INT
									 )
-- 
BEGIN
DECLARE nextID INT;
SELECT IFNULL(MAX(id_registro)+1,1) INTO nextID FROM registro; 
	INSERT INTO registro (id_registro, id_servicio, id_distrito,id_circuito, id_iglesia, id_persona, es_miembro_iglesia, 
							es_lider, es_miembro_ministerial, es_pastor, es_presbitero, es_delegado, es_visita, es_miembro_comite_temp,
							es_exonerado, fecha_registro, hora_registro)

	 		VALUES(nextID, _id_servicio, _id_distrito, _id_circuito, _id_iglesia, _id_persona, _es_miembro_iglesia, 
							_es_lider, _es_miembro_ministerial, _es_pastor, _es_presbitero, _es_delegado,  _es_visita,
							_trabaja_comite, _es_exonerado, CURDATE(), CURTIME());

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS registro_mostrar;
DELIMITER $$
CREATE PROCEDURE registro_mostrar()
BEGIN
SELECT r.*
	,s.servicio
	,igs.iglesia as iglesia_anfitrion
	,d.distrito
	,c.circuito
	,i.iglesia 
	,p.nombres
	,p.apellidos
	,pc.clasificacion
	,CASE r.es_miembro_comite_temp
		WHEN 0 THEN NULL
		ELSE 
			(SELECT ct.comite_temporero 
			FROM comite_temporero ct
			INNER JOIN personas_trabajan_comite pt ON ct.id_comite_temporero = pt.id_comite_temporero
			WHERE pt.id_registro = r.id_registro)
	END AS comite_temporero

	,CASE r.es_miembro_comite_temp
		WHEN 0 THEN NULL
		ELSE 
			(SELECT cc.cargo
			FROM cargos cc
			INNER JOIN personas_trabajan_comite pt ON cc.id_cargo = pt.id_cargo
			WHERE pt.id_registro = r.id_registro)
	END AS cargo_comite

	,CASE r.es_miembro_ministerial
		WHEN 0 THEN NULL
		ELSE 
			(SELECT rm.rango_ministerial
			FROM rango_ministerial rm
			INNER JOIN miembros mm ON mm.id_rango_ministerial  = rm.id_rango
			WHERE mm.id_persona =r.id_persona)
	END AS rango_ministerial
	,CASE
		WHEN r.es_miembro_comite_temp 	= 1 THEN 'TRABAJA EN COMITE TEMPORERO'		
		WHEN r.es_presbitero 			= 1 THEN 'PRESBITERO'
		WHEN r.es_pastor 				= 1 THEN 'PASTOR'
		WHEN r.es_miembro_ministerial 	= 1 THEN 'CUERPO MINISTERIAL'
		WHEN r.es_delegado 				= 1 THEN 'DELEGADO'
		ELSE 'ASAMBLEISTA EN GENERAL'
	END AS condicion

FROM registro r
	INNER JOIN servicios   s ON r.id_servicio = s.id_servicio
	INNER JOIN distritos   d ON r.id_distrito = d.id_distrito
	INNER JOIN circuitos   c ON r.id_circuito = c.id_circuito
	INNER JOIN iglesias    i ON r.id_iglesia  = i.id_iglesia
	INNER JOIN personas    p ON r.id_persona  = p.id_persona
	INNER JOIN iglesias  igs ON s.id_iglesia  = igs.id_iglesia
	INNER JOIN personas_clasificacion pc ON p.id_clasificacion=pc.id_clasificacion
WHERE s.requiere_registro=1
ORDER BY r.id_registro DESC
;
END $$
			
DELIMITER ;


DROP PROCEDURE IF EXISTS registro_eliminar;
DELIMITER $$
CREATE PROCEDURE registro_eliminar(IN _id_registro INT)
BEGIN
DELETE FROM registro WHERE id_registro = _id_registro; 
END $$
DELIMITER ;

-- Queda pendiente determinar si utilizare un historico en la misma tabla o en otra.....
DROP PROCEDURE IF EXISTS registro_modificar;
DELIMITER $$
CREATE PROCEDURE registro_modificar(IN _id_registro INT, _id_servicio INT, _id_distrito INT, _id_circuito INT, _id_iglesia INT,
									_id_persona INT, _es_miembro_iglesia INT, _id_miembro INT, _es_lider INT, 
									_id_lider INT, _es_miembro_ministerial INT, _id_rango_ministerial INT, 
									_es_pastor INT, _es_delegado INT, _trabaja_comite INT, _id_comite_temporero INT, 
									_id_cargo_comite INT, _es_exonerado INT, _razon_exonerado VARCHAR(200), 
									_fecha_registro DATE, _hora_registro TIME, _es_presbitero INT, _es_visita INT)
BEGIN
UPDATE registro 
	SET id_servicio = _id_servicio,
	    id_distrito = _id_distrito,
	    id_circuito = _id_circuito,
	    id_iglesia = _id_iglesia,
	    id_persona = _id_persona,
	    es_miembro_iglesia = _es_miembro_iglesia,
	    id_miembro = _id_miembro,
	    es_lider = _es_lider,
	    id_lider = _id_lider,
	    es_miembro_ministerial =_es_miembro_ministerial,
	    id_rango_ministerial =_id_rango_ministerial,
	    es_pastor =_es_pastor,
	    es_presbitero = _es_presbitero,
	    es_delegado = _es_delegado,
	    es_visita = _es_visita,
	    es_miembro_comite_temp = _trabaja_comite,
	    id_comite_temporero = _id_comite_temporero,
	    id_cargo_comite = _id_cargo_comite,
	    es_exonerado = _es_exonerado,
	    razon_exonerado = _razon_exonerado,
	    fecha_registro = _fecha_registro,
	    hora_registro = _hora_registro
	WHERE id_registro = _id_registro;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS registro_buscar;
DELIMITER $$
CREATE PROCEDURE registro_buscar (IN  _id_registro INT)
BEGIN
SELECT    r.id_registro, r.id_servicio, s.servicio, r.id_distrito, d.distrito 
		, r.id_circuito, c.circuito, r.id_iglesia, i.iglesia, r.id_persona 
		, (SELECT CONCAT(p.nombres, ' ', p.apellidos) FROM personas p WHERE p.id_persona = r.id_persona) AS persona 
		, r.es_miembro_iglesia, r.id_miembro
		, r.es_lider, r.id_lider
		, r.es_miembro_ministerial, r.id_rango_ministerial
		, (SELECT rango_ministerial FROM rango_ministerial WHERE id_rango_ministerial = r.id_rango_ministerial) AS rango_ministerial
		, r.es_pastor, r.es_presbitero, r.es_delegado, r.es_visita, r.es_miembro_comite_temp, r.id_comite_temporero
		, (SELECT comite_temporero FROM comite_temporero WHERE id_comite_temporero = r.id_comite_temporero) AS comite_temporero
		, r.id_cargo_comite
		, (SELECT cargo FROM cargos WHERE id_cargo = r.id_cargo_comite) AS cargo_comite
		, r.es_exonerado, r.razon_exonerado 
		, r.fecha_registro, r.hora_registro
FROM registro r
			INNER JOIN servicios s ON r.id_servicio = s.id_servicio
			INNER JOIN distritos d ON r.id_distrito = d.id_distrito
			INNER JOIN circuitos c ON r.id_circuito = c.id_circuito
			INNER JOIN iglesias i ON r.id_iglesia = i.id_iglesia
			
WHERE   r.id_registro = _id_registro;
END $$
DELIMITER ;










