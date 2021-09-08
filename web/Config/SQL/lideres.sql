DROP PROCEDURE IF EXISTS lideres_insertar;
DELIMITER $$
CREATE PROCEDURE lideres_insertar (IN _id_depart INT, _id_miembro INT, _id_cargo INT, 
									_fch_ini DATE, _fch_fin DATE)
BEGIN
DECLARE _vigente INT;
DECLARE nextId INT;
SET _vigente = if(_fch_fin <= NOW(),0,1);
SELECT IFNULL(MAX(id_lider)+1,1) INTO nextID FROM lideres;
	INSERT INTO lideres (id_lider, id_departamento, id_miembro, id_cargo, fecha_inicio, fecha_fin,
 				vigente) 
	 		VALUES(nextID, _id_depart, _id_miembro, _id_cargo, _fch_ini, _fch_fin, _vigente);

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS lideres_mostrar;
DELIMITER $$
CREATE PROCEDURE lideres_mostrar()
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo


				;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS lideres_eliminar;
DELIMITER $$
CREATE PROCEDURE lideres_eliminar(IN _id_lider INT)
BEGIN
DELETE FROM lideres WHERE id_lider = _id_lider; 
END $$
DELIMITER ;

-- Queda pendiente determinar si utilizare un historico en la misma tabla o en otra.....
DROP PROCEDURE IF EXISTS lideres_modificar;
DELIMITER $$
CREATE PROCEDURE lideres_modificar(IN _id_lider INT, _id_miembro INT, 
									_id_depart INT, _id_cargo INT, 
									_fch_ini DATE, _fch_fin DATE)
BEGIN
DECLARE _vigente INT;
SET _vigente = if(_fch_fin <= NOW(),0,1);
UPDATE lideres 
	SET id_miembro = _id_miembro,
		id_departamento = _id_depart,
		id_cargo=_id_cargo,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin,
		vigente= _vigente
	WHERE id_lider = _id_lider;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS lideres_buscarCargo;
DELIMITER $$
CREATE PROCEDURE lideres_buscarCargo (IN _cargo VARCHAR(100))
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   c.cargo LIKE CONCAT('%', _cargo, '%') ;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS lideres_buscarDepartamento;
DELIMITER $$
CREATE PROCEDURE lideres_buscarDepartamento (IN  _depart VARCHAR(100))
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   d.departamento LIKE CONCAT('%', _depart, '%');
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS lideres_buscarLider;
DELIMITER $$
CREATE PROCEDURE lideres_buscarLider (IN  _nombre VARCHAR(100))
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo

WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _nombre, '%');
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS lideres_buscar;
DELIMITER $$
CREATE PROCEDURE lideres_buscar (IN  _id_lider INT)
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   l.id_lider = _id_lider;
END $$
DELIMITER ;


DROP PROCEDURE lideres_buscarNombre;
DELIMITER $$
CREATE PROCEDURE lideres_buscarNombre (IN _nombre VARCHAR(100)) 
BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado, rm.rango_ministerial, 
		cir.circuito, dis.distrito,sexo.sexo,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado = ec.id_estado
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _nombre, '%');
END $$
DELIMITER ;