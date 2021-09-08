DROP PROCEDURE IF EXISTS asistencia_insertar;
DELIMITER $$
CREATE PROCEDURE asistencia_insertar (IN _id_servivio INT, _id_persona INT, _id_tanda INT
										, _fecha DATE, _usuario VARCHAR(20)
										)
BEGIN
DECLARE nextID INT;
DECLARE _es_miembro INT;
DECLARE _id_clasificacion INT;
DECLARE _es_lider INT;
DECLARE _id_miembro INT;
DECLARE _fch_trans DATE;
DECLARE _requiere_registro INT;
DECLARE _registro_valido INT;
SET _fch_trans = now();
SET _id_clasificacion= (SELECT id_clasificacion FROM personas where id_persona=_id_persona);
SELECT IFNULL(MAX(id_asistencia)+1,1) INTO nextID FROM asistencia; 
SELECT COUNT(1) INTO _es_miembro FROM miembros where id_persona=_id_persona;
SELECT COUNT(1) INTO _registro_valido FROM registro WHERE id_persona =_id_persona AND id_servicio=_id_servivio;
SELECT requiere_registro INTO _requiere_registro FROM servicios WHERE id_servicio=_id_servivio;

IF _es_miembro > 0 THEN
	SET _id_miembro = (SELECT id_miembro FROM miembros where id_persona=_id_persona);
	SET _es_lider = (SELECT COUNT(1) FROM lideres where id_miembro = _id_miembro); 
	SET _es_miembro = 1;
ELSE 
	SET _es_lider = 0;
END IF;
IF((_requiere_registro = 1 AND  _registro_valido=1 ) OR (_requiere_registro=0)) THEN
					INSERT INTO asistencia (id_asistencia, id_servicio, id_persona,id_tanda,fecha
								,fecha_transaccion,usuario, es_miembro, es_lider, id_clasificacion) 
	  							 VALUES(nextID,_id_servivio, _id_persona, _id_tanda,_fecha
	   							,_fch_trans,'fbrujan',_es_miembro, _es_lider,_id_clasificacion);
ELSE
		SELECT 1 from LaActividadRequireRegistroPrevio_EstaPersonaNoEstaRegistradaAun;
END IF;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS asistencia_eliminar;
DELIMITER $$
CREATE PROCEDURE asistencia_eliminar (IN _id_asistencia INT)
BEGIN
DELETE FROM asistencia WHERE id_asistencia = _id_asistencia;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS asistencia_modificar;
DELIMITER $$
CREATE PROCEDURE asistencia_modificar (IN _id_asistencia INT, _asistencia VARCHAR(100))
BEGIN
UPDATE asistencia SET asistencia = _asistencia WHERE id_asistencia = _id_asistencia;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS asistencia_mostrar;
DELIMITER $$
CREATE PROCEDURE asistencia_mostrar ()
BEGIN
SELECT a.*, i.id_iglesia, ts.id_tipo_servicio, CONCAT(p.nombres,' ',p.apellidos) as nombre
		, p.nro_documento_identidad, ts.tipo_servicio, s.servicio, s.fecha_inicio
		, s.fecha_fin, i.iglesia, t.tanda
		, CASE a.es_miembro
			WHEN 0 THEN 'VISITA'
			ELSE 'MIEMBRO'
			END AS condicion
		, CASE a.id_clasificacion
			WHEN 1 THEN 'DAMA'
			WHEN 2 THEN 'CABALLERO'
			WHEN 3 THEN 'JOVEN'
			WHEN 4 THEN 'JUVENIL'
			WHEN 5 THEN 'NINO'
		  END AS clasificacion
FROM  asistencia a
            INNER JOIN personas p 		ON a.id_persona = p.id_persona
            INNER JOIN servicios s 		ON a.id_servicio = s.id_servicio
            INNER JOIN iglesias i 		ON s.id_iglesia = i.id_iglesia
            INNER JOIN tipo_servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
            INNER JOIN tandas t 		ON  a.id_tanda = t.id_tanda
ORDER BY id_asistencia desc 
            ;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS asistencia_buscar;
DELIMITER $$
CREATE PROCEDURE asistencia_buscar (IN _id_asistencia INT)
BEGIN
SELECT * FROM asistencia WHERE  id_asistencia = _id_asistencia ;
END $$
DELIMITER ;


SELECT a.*,  DATE_FORMAT(a.fecha, '%Y%m') mes  
FROM asistencia a
	INNER JOIN 


--- Asistencia por servicio y clasificacion de personas

SELECT i.iglesia
	   ,s.servicio
	   ,s.id_servicio
       ,DATE_FORMAT(a.fecha, '%Y%m') mes
       ,a.fecha
       ,pc.clasificacion 
	   ,count(1) asistencia
FROM asistencia a
	INNER JOIN personas_clasificacion pc ON a.id_clasificacion=pc.id_clasificacion
	INNER JOIN servicios s ON a.id_servicio=s.id_servicio
	INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
GROUP BY i.iglesia
      , s.servicio
      ,s.id_servicio
      , DATE_FORMAT(a.fecha, '%Y%m')
	  , a.fecha
	  ,pc.clasificacion 
ORDER BY iglesia,servicio,mes, a.fecha ,pc.clasificacion 


---- asistencia por servicio Total
SELECT i.iglesia
	   ,s.servicio
	   ,s.id_servicio
       ,DATE_FORMAT(a.fecha, '%Y%m') mes
       ,a.fecha
	   ,count(1) asistencia
FROM asistencia a
	INNER JOIN personas_clasificacion pc ON a.id_clasificacion=pc.id_clasificacion
	INNER JOIN servicios s ON a.id_servicio=s.id_servicio
	INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
GROUP BY i.iglesia
      , s.servicio
      ,s.id_servicio
      , DATE_FORMAT(a.fecha, '%Y%m')
	  , a.fecha
ORDER BY iglesia,servicio,mes, a.fecha


---- Todos los Registros

---- asistencia por servicio Total
SELECT i.iglesia
	   ,s.servicio
	   ,s.id_servicio
       ,DATE_FORMAT(a.fecha, '%Y%m') mes
       ,a.fecha
	   ,CONCAT(p.nombres,' ',p.apellidos)
FROM asistencia a
	INNER JOIN personas_clasificacion pc ON a.id_clasificacion=pc.id_clasificacion
	INNER JOIN personas p ON a.id_persona=p.id_persona
	INNER JOIN servicios s ON a.id_servicio=s.id_servicio
	INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia

ORDER BY iglesia,servicio,mes, a.fecha
