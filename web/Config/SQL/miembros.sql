DROP PROCEDURE IF EXISTS miembros_insertar;
DELIMITER $$
CREATE PROCEDURE miembros_insertar (IN _id_persona INT, _id_iglesia INT, _id_sociedad INT, 
									_id_estado INT, _fch_conv DATE, _fch_baut DATE, _id_rango INT, _fch_ini DATE, _fch_fin DATE)
BEGIN
DECLARE _fecha_creacion DATE;
DECLARE fechafin DATE;
DECLARE existe INT;
DECLARE nextID INT;
SELECT IFNULL(MAX(id_miembro)+1,1) INTO nextID FROM miembros; 
SET _fecha_creacion = NOW();
SET fechafin = '3333-12-31';
SET existe = (SELECT COUNT(1) FROM miembros WHERE id_persona = _id_persona);

	INSERT INTO miembros (id_miembro, id_persona, id_iglesia, id_sociedad, id_estado, fecha_conversion, fecha_bautismo,
 				id_rango_ministerial, fecha_inicio, fecha_fin, fecha_creacion) 
	 		VALUES(nextID, _id_persona, _id_iglesia, _id_sociedad, _id_estado, _fch_conv, _fch_baut, 
	 	_id_rango, _fch_ini, _fch_fin, _fecha_creacion);

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS miembros_mostrar;
DELIMITER $$
CREATE PROCEDURE miembros_mostrar()
BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.nombres
		, p.apellidos
		, p.fecha_nacimiento
		, p.telefono
		, p.imagen
		, p.nro_documento_identidad
		, cir.id_distrito
		, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado=ec.id_estado
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
				;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS miembros_eliminar;
DELIMITER $$
CREATE PROCEDURE miembros_eliminar(IN _id_miembro INT)
BEGIN
DELETE FROM miembros WHERE id_miembro = _id_miembro; 
END $$
DELIMITER ;

-- Queda pendiente determinar si utilizare un historico en la misma tabla o en otra.....
DROP PROCEDURE IF EXISTS miembros_modificar;
DELIMITER $$
CREATE PROCEDURE miembros_modificar(IN _id_miembro INT, _id_persona INT, _id_iglesia INT, _id_sociedad INT,	_id_estado INT, _fch_conv DATE, _fch_baut DATE, _id_rango INT,
									 _fch_ini DATE, _fch_fin DATE, _ult_reg INT)
BEGIN
UPDATE miembros 
	SET id_persona = _id_persona,
		id_iglesia = _id_iglesia,
		id_sociedad = _id_sociedad,
		id_estado = _id_estado,
		fecha_conversion = _fch_conv,
		fecha_bautismo = _fch_baut,
		id_rango_ministerial = _id_rango,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin
		
	WHERE id_miembro = _id_miembro;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS miembros_buscar;
DELIMITER $$
CREATE PROCEDURE miembros_buscar (IN _id_miembro INT )
BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.nombres
		, p.apellidos
		, p.fecha_nacimiento
		, p.telefono
		, p.nro_documento_identidad
		, cir.id_distrito
		, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado=ec.id_estado
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE   id_miembro = _id_miembro;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS miembros_buscar_nombre;
DELIMITER $$
CREATE PROCEDURE miembros_buscar_nombre (IN _miembro VARCHAR(100))
BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.nombres
		, p.apellidos
		, p.fecha_nacimiento
		, p.telefono
		, p.nro_documento_identidad
		, cir.id_distrito
		, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado=ec.id_estado
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _miembro, '%');
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS miembros_buscar_lider;
DELIMITER $$
CREATE PROCEDURE miembros_buscar_lider (IN _miembro VARCHAR(100))
BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.nombres
		, p.apellidos
		, p.fecha_nacimiento
		, p.telefono
		, p.nro_documento_identidad
		, cir.id_distrito
		, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado=ec.id_estado
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _miembro, '%')
AND ec.elegible_lider=1
;
END $$
DELIMITER ;



SELECT * FROM  asistencia a
WHERE es_miembro=0
and exists(select 1 from miembros where id_persona=a.id_persona)


update asistencia a
	set es_miembro=1
WHERE es_miembro=0
and exists(select 1 from miembros where id_persona=a.id_persona)