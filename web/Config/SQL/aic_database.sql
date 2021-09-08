-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2018 at 04:39 PM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aic`
--
CREATE DATABASE IF NOT EXISTS `aic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aic`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `cargos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_buscar` (IN `_id_cargo` INT(10))  BEGIN
SELECT * FROM cargos WHERE  id_cargo =  _id_cargo ;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_buscar` (IN `_cargo_comite` VARCHAR(100))  BEGIN
SELECT * FROM cargos_comite_temporero WHERE  cargo_comite_temporero LIKE  CONCAT('%',_cargo_comite,'%') ;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_eliminar` (IN `_id_cargo_comite` INT)  BEGIN
DELETE FROM cargos_comite_temporero WHERE id_cargo_comite = _id_cargo_comite;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_insertar` (IN `_cargo_comite` VARCHAR(100))  BEGIN
INSERT INTO cargos_comite_temporero (cargo_comite_temporero) VALUES(_cargo_comite);
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_modificar` (IN `_id_cargo_comite` INT, `_cargo_comite` VARCHAR(100))  BEGIN
UPDATE cargos_comite_temporero SET cargo_comite_temporero = _cargo_comite WHERE id_cargo_comite = _id_cargo_comite;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_mostrar` ()  BEGIN
SELECT * FROM cargos_comite_temporero;
END$$

DROP PROCEDURE IF EXISTS `cargos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_eliminar` (IN `_id_cargo` INT)  BEGIN
DELETE FROM cargos WHERE id_cargo = _id_cargo;
END$$

DROP PROCEDURE IF EXISTS `cargos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_insertar` (IN `_cargo` VARCHAR(100))  BEGIN
INSERT INTO cargos (cargo) VALUES(_cargo);
END$$

DROP PROCEDURE IF EXISTS `cargos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_mostrar` ()  BEGIN
SELECT * FROM cargos;
END$$

DROP PROCEDURE IF EXISTS `cargos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_renombrar` (IN `_id_cargo` INT, `_cargo` VARCHAR(100))  BEGIN
UPDATE cargos SET cargo = _cargo WHERE id_cargo = _id_cargo;
END$$

DROP PROCEDURE IF EXISTS `circuitos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_buscar` (IN `_id_circuito` INT)  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  id_circuito = _id_circuito ;
END$$

DROP PROCEDURE IF EXISTS `circuitos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_eliminar` (IN `_id_circuito` INT)  BEGIN
DELETE FROM circuitos WHERE id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `circuitos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_insertar` (IN `_id_distrito` INT, `_id_provincia` INT, `_circuito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_circuito)+1,1) INTO nextID FROM circuitos ; 
INSERT INTO circuitos (id_distrito, id_provincia, id_provincia2, id_circuito, circuito) 
				VALUES(_id_distrito, _id_provincia, NULL, nextID, _circuito);
END$$

DROP PROCEDURE IF EXISTS `circuitos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_mostrar` ()  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
ORDER BY c.circuito ASC
			;
END$$

DROP PROCEDURE IF EXISTS `circuitos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_renombrar` (IN `_id_circuito` INT, `_circuito` VARCHAR(100))  BEGIN
UPDATE circuitos 
	SET circuito = _circuito
	WHERE id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_buscar` (IN `_id_comite` INT(10))  BEGIN
SELECT * FROM comite_temporero WHERE  id_comite_temporero =  _id_comite ;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_eliminar` (IN `_id_comite` INT)  BEGIN
DELETE FROM comite_temporero WHERE id_comite_temporero = _id_comite;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_insertar` (IN `_comite` VARCHAR(100))  BEGIN
INSERT INTO comite_temporero (comite_temporero) VALUES(_comite);
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_modificar` (IN `_id_comite` INT, IN `_comite` VARCHAR(100))  BEGIN
UPDATE comite_temporero SET comite_temporero = _comite WHERE id_comite_temporero = _id_comite;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_mostrar` ()  BEGIN
SELECT * FROM comite_temporero;
END$$

DROP PROCEDURE IF EXISTS `departamentos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_buscar` (IN `_id_departamento` INT(10))  BEGIN
SELECT * FROM departamentos WHERE  id_departamento =_id_departamento ;
END$$

DROP PROCEDURE IF EXISTS `departamentos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_eliminar` (IN `_id_departamento` INT)  BEGIN
DELETE FROM departamentos WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_insertar` (IN `_cod_departamento` VARCHAR(15), IN `_departamento` VARCHAR(100), IN `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO departamentos (cod_departamento, departamento, descripcion) VALUES(_cod_departamento, _departamento, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `departamentos_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_modificar` (IN `_id_departamento` INT, IN `_cod_departamento` VARCHAR(15), IN `_departamento` VARCHAR(100), IN `_descripcion` VARCHAR(200))  BEGIN
UPDATE departamentos SET 
	cod_departamento = _cod_departamento, 
    departamento = _departamento, 
	descripcion = _descripcion 
WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_mostrar` ()  BEGIN
SELECT * FROM departamentos;
END$$

DROP PROCEDURE IF EXISTS `distritos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_buscar` (IN `_id_distrito` INT)  BEGIN
SELECT d.*, p.pais
FROM distritos d INNER JOIN paises p ON d.id_pais = p.id_pais
WHERE  id_distrito = _id_distrito ;
END$$

DROP PROCEDURE IF EXISTS `distritos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_eliminar` (IN `_id_distrito` INT)  BEGIN
DELETE FROM distritos WHERE id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `distritos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_insertar` (IN `_id_pais` INT, `_distrito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_distrito)+1,1) INTO nextID FROM distritos; 
INSERT INTO distritos (id_distrito, id_pais, distrito) VALUES(nextID, _id_pais, _distrito);
END$$

DROP PROCEDURE IF EXISTS `distritos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_mostrar` ()  BEGIN
SELECT d.*, p.pais 
	FROM distritos d 
	INNER JOIN paises p ON d.id_pais = p.id_pais ;
END$$

DROP PROCEDURE IF EXISTS `distritos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_renombrar` (IN `_id_distrito` INT, `_distrito` VARCHAR(100))  BEGIN
UPDATE distritos 
	SET distrito = _distrito
	WHERE id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_buscar` (IN `_id_estado_condicion` INT(10))  BEGIN
SELECT * FROM estado_condicion WHERE  id_estado_condicion =_id_estado_condicion ;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_eliminar` (IN `_id_estado_condicion` INT)  BEGIN
DELETE FROM estado_condicion WHERE id_estado_condicion = _id_estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_insertar` (IN `_estado_condicion` VARCHAR(100), `_elegible_lider` INT)  BEGIN
INSERT INTO estado_condicion (estado_condicion, elegible_lider) VALUES(_estado_condicion, _elegible_lider);
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_modificar` (IN `_id_estado_condicion` INT, `_estado_condicion` VARCHAR(100), `_elegible_lider` INT)  BEGIN
UPDATE estado_condicion SET estado_condicion = _estado_condicion, elegible_lider = _elegible_lider WHERE id_estado_condicion = _id_estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_mostrar` ()  BEGIN
SELECT id_estado_condicion, estado_condicion, elegible_lider,
	CASE elegible_lider
		WHEN 1 then "SI"
		WHEN 0 then "NO"
		END AS elegible_cargos
FROM  estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `iglesias_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_buscar` (IN `_id_iglesia` INT)  BEGIN
SELECT i.*, d.id_pais, pa.pais, c.id_distrito, d.distrito, c.circuito,
		p.provincia
		
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  id_iglesia =_id_iglesia ;
END$$

DROP PROCEDURE IF EXISTS `iglesias_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_eliminar` (`_id_iglesia` INT)  BEGIN
DELETE FROM iglesias WHERE id_iglesia = _id_iglesia ; 
END$$

DROP PROCEDURE IF EXISTS `iglesias_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_insertar` (IN `_iglesia` VARCHAR(200), `_id_circuito` INT, `_id_provincia` INT, `_direccion` VARCHAR(200), `_telefono` VARCHAR(15), `_fundador` VARCHAR(100), `_fecha_fundada` DATE, `_imagen_iglesia` VARCHAR(100), `_imagen_fundador` VARCHAR(100), `_imagen_pastor_actual` VARCHAR(100))  BEGIN
DECLARE nextId INT;
DECLARE _fecha_creacion DATE;
SET _fecha_creacion = NOW();
SELECT IFNULL(MAX(id_iglesia)+1,1) INTO nextID FROM iglesias; 
INSERT INTO iglesias (iglesia, id_circuito, id_provincia, direccion, telefono
	, fundador, fecha_fundada, imagen_iglesia, imagen_fundador, imagen_pastor_actual, fecha_creacion) 
	 VALUES(_iglesia, _id_circuito, _id_provincia, _direccion, _telefono, 
	 	_fundador, _fecha_fundada, _imagen_iglesia,_imagen_fundador, _imagen_pastor_actual,_fecha_creacion);
END$$

DROP PROCEDURE IF EXISTS `iglesias_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_modificar` (IN `_id_iglesia` INT, `_iglesia` VARCHAR(200), `_id_circuito` INT, `_id_provincia` INT, `_direccion` VARCHAR(200), `_telefono` VARCHAR(15), `_fundador` VARCHAR(100), `_fecha_fundada` DATE, `_imagen_iglesia` VARCHAR(100), `_imagen_fundador` VARCHAR(100), `_imagen_pastor_actual` VARCHAR(100))  BEGIN
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
	imagen_iglesia = _imagen_iglesia,
	imagen_fundador = _imagen_fundador,
	imagen_pastor_actual = _imagen_pastor_actual,
	ultima_actualizacion=fecha_modificacion
	WHERE id_iglesia = _id_iglesia ;
END$$

DROP PROCEDURE IF EXISTS `iglesias_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_mostrar` ()  BEGIN
SELECT i.*, d.id_pais, pa.pais, c.id_distrito, d.distrito, c.circuito,
		p.provincia
		
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
ORDER BY d.distrito, c.circuito, i.iglesia ASC
;
END$$

DROP PROCEDURE IF EXISTS `iglesias_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_renombrar` (IN `_id_distrito` INT, `_id_iglesia` INT, `_iglesia` VARCHAR(100))  BEGIN
UPDATE iglesias 
	SET iglesia = _iglesia
	WHERE id_circuito = _id_circuito AND id_iglesia = _id_iglesia AND id_provincia=_id_provincia;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscar` (IN `_id_lider` INT)  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
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
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   l.id_lider = _id_lider;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarCargo`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarCargo` (IN `_cargo` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
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
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   c.cargo LIKE CONCAT('%', _cargo, '%') ;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarDepartamento`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarDepartamento` (IN `_depart` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
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
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo
WHERE   d.departamento LIKE CONCAT('%', _depart, '%');
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarLider`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarLider` (IN `_nombre` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
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
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo

WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _nombre, '%');
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarNombre`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarNombre` (IN `_nombre` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		p.nombres, p.apellidos,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _nombre, '%');
END$$

DROP PROCEDURE IF EXISTS `lideres_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_eliminar` (IN `_id_lider` INT)  BEGIN
DELETE FROM lideres WHERE id_lider = _id_lider; 
END$$

DROP PROCEDURE IF EXISTS `lideres_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_insertar` (IN `_id_depart` INT, `_id_miembro` INT, `_id_cargo` INT, `_fch_ini` DATE, `_fch_fin` DATE)  BEGIN
DECLARE _vigente INT;
SET _vigente = if(_fch_fin <= NOW(),0,1);
	INSERT INTO lideres (id_departamento, id_miembro, id_cargo, fecha_inicio, fecha_fin,
 				vigente) 
	 		VALUES(_id_depart, _id_miembro, _id_cargo, _fch_ini, _fch_fin, _vigente);

END$$

DROP PROCEDURE IF EXISTS `lideres_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_modificar` (IN `_id_lider` INT, `_id_miembro` INT, `_id_depart` INT, `_id_cargo` INT, `_fch_ini` DATE, `_fch_fin` DATE)  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `lideres_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_mostrar` ()  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.id_sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
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
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
			INNER JOIN sexos sexo ON p.id_sexo = sexo.id_sexo


				;
END$$

DROP PROCEDURE IF EXISTS `miembros_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_buscar` (IN `_id_miembro` INT)  BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado_condicion, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.*
		, cir.id_distrito, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE   id_miembro = _id_miembro;
END$$

DROP PROCEDURE IF EXISTS `miembros_buscar_lider`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_buscar_lider` (IN `_miembro` VARCHAR(100))  BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado_condicion, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.*
		, cir.id_distrito, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
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
END$$

DROP PROCEDURE IF EXISTS `miembros_buscar_nombre`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_buscar_nombre` (IN `_miembro` VARCHAR(100))  BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado_condicion, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.*
		, cir.id_distrito, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _miembro, '%');
END$$

DROP PROCEDURE IF EXISTS `miembros_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_eliminar` (IN `_id_miembro` INT)  BEGIN
DELETE FROM miembros WHERE id_miembro = _id_miembro; 
END$$

DROP PROCEDURE IF EXISTS `miembros_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_insertar` (IN `_id_persona` INT, `_id_iglesia` INT, `_id_sociedad` INT, `_id_estado_condicion` INT, `_fch_conv` DATE, `_fch_baut` DATE, `_id_rango` INT)  BEGIN
DECLARE fechaini DATE;
DECLARE fechafin DATE;
DECLARE existe INT;

SET fechaini = NOW();
SET fechafin = '3333-12-31';
SET existe = (SELECT COUNT(1) FROM miembros WHERE id_persona = _id_persona);

	INSERT INTO miembros (id_persona, id_iglesia, id_sociedad, id_estado_condicion, fecha_conversion, fecha_bautismo,
 				id_rango_ministerial, fecha_inicio, fecha_fin, ultimo_registro) 
	 		VALUES(_id_persona, _id_iglesia, _id_sociedad, _id_estado_condicion, _fch_conv, _fch_baut, 
	 	_id_rango, fechaini, fechafin, 1);

END$$

DROP PROCEDURE IF EXISTS `miembros_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_modificar` (IN `_id_miembro` INT, `_id_persona` INT, `_id_iglesia` INT, `_id_sociedad` INT, `_id_estado_condicion` INT, `_fch_conv` DATE, `_fch_baut` DATE, `_id_rango` INT, `_fch_ini` DATE, `_fch_fin` DATE, `_ult_reg` INT)  BEGIN
UPDATE miembros 
	SET id_persona = _id_persona,
		id_iglesia = _id_iglesia,
		id_sociedad = _id_sociedad,
		id_estado_condicion = _id_estado_condicion,
		fecha_conversion = _fch_conv,
		fecha_bautismo = _fch_baut,
		id_rango_ministerial = _id_rango,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin,
		ultimo_registro = _ult_reg
	WHERE id_miembro = _id_miembro;
END$$

DROP PROCEDURE IF EXISTS `miembros_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_mostrar` ()  BEGIN
SELECT m.*, i.iglesia, i.id_circuito, cir.circuito, s.sociedad, i.fundador as pastor
		, ec.estado_condicion, rm.rango_ministerial
		, CONCAT(p.nombres,' ', p.apellidos) miembro
		, p.*
		, cir.id_distrito, dis.distrito
		, ecivil.estado_civil
		, se.sexo
		, td.tipo_documento
		, pro.provincia
		, pa.pais
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
				INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
				INNER JOIN estado_civil ecivil ON p.id_estado_civil = ecivil.id_estado_civil
				INNER JOIN sexos se ON p.id_sexo = se.id_sexo
				INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
				INNER JOIN provincias pro ON p.id_provincia = pro.id_provincia
				INNER JOIN paises pa ON p.id_pais = pa.id_pais
				;
END$$

DROP PROCEDURE IF EXISTS `paises_buscar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_buscar` (IN `_id_pais` INT(10))  BEGIN
SELECT * FROM paises WHERE  id_pais =_id_pais ;
END$$

DROP PROCEDURE IF EXISTS `paises_eliminar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_eliminar` (IN `_id_pais` INT)  BEGIN
DELETE FROM paises WHERE id_pais = _id_pais;
END$$

DROP PROCEDURE IF EXISTS `paises_insertar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_insertar` (IN `_pais` VARCHAR(100))  BEGIN
INSERT INTO paises (pais) VALUES(_pais);
END$$

DROP PROCEDURE IF EXISTS `paises_mostrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_mostrar` ()  BEGIN
SELECT * FROM paises;
END$$

DROP PROCEDURE IF EXISTS `paises_renombrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_renombrar` (IN `_id_pais` INT, `_pais` VARCHAR(100))  BEGIN
UPDATE paises SET pais = _pais WHERE id_pais = _id_pais;
END$$

DROP PROCEDURE IF EXISTS `personas_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_buscar` (IN `_id_persona` INT)  BEGIN
SELECT p.*, pr.provincia,td.tipo_documento, pa.pais, s.sexo, ec.estado_civil , CONCAT(p.nombres,' ',p.apellidos) as persona
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	INNER JOIN estado_civil ec ON p.id_estado_civil = ec.id_estado_civil
	INNER JOIN sexos s ON p.id_sexo = s.id_sexo
	INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
WHERE  id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_eliminar` (IN `_id_persona` INT)  BEGIN
DELETE FROM personas WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_insertar` (IN `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_id_sexo` INT, `_id_tipo_documento` INT, `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT, `_apodo` VARCHAR(20), `_id_estado_civil` INT)  BEGIN
DECLARE fecha_creacion DATE;
SET fecha_creacion = now();
INSERT INTO personas (nombres, apellidos, fecha_nacimiento, telefono, direccion, id_sexo, 
						id_tipo_documento, nro_documento_identidad, imagen, id_provincia, id_pais, apodo, id_estado_civil, fecha_creacion) 
			VALUES(_nombres, _apellidos, _fch_nac, _telefono, _direccion, _id_sexo, 
				_id_tipo_documento, _nro_documento, _imagen, _id_provincia, _id_pais, _apodo, _id_estado_civil, fecha_creacion);
END$$

DROP PROCEDURE IF EXISTS `personas_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_modificar` (IN `_id_persona` INT, `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_id_sexo` INT, `_id_tipo_documento` INT, `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT, `_apodo` VARCHAR(20), `_id_estado_civil` INT)  BEGIN
DECLARE fecha_modificacion DATE;
SET fecha_modificacion = now();
UPDATE personas 
	SET nombres = _nombres, apellidos = _apellidos, fecha_nacimiento=_fch_nac, 
	telefono = _telefono, direccion = _direccion, id_sexo = _id_sexo, 
	id_tipo_documento =_id_tipo_documento, nro_documento_identidad = _nro_documento, 
	imagen = _imagen, id_provincia = _id_provincia, id_pais = _id_pais, apodo= _apodo, id_estado_civil =_id_estado_civil
	,ultima_actualizacion = fecha_modificacion
WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_mostrar` ()  BEGIN
SELECT p.*, pr.provincia,td.tipo_documento, pa.pais, s.sexo, ec.estado_civil , CONCAT(p.nombres,' ',p.apellidos) as persona
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	INNER JOIN estado_civil ec ON p.id_estado_civil = ec.id_estado_civil
	INNER JOIN sexos s ON p.id_sexo = s.id_sexo
	INNER JOIN tipo_documento td ON p.id_tipo_documento = td.id_tipo_documento
	;
END$$

DROP PROCEDURE IF EXISTS `provincias_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_buscar` (IN `_id_provincia` INT)  BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
WHERE  id_provincia = _id_provincia 
ORDER BY pr.id_pais, pr.provincia ASC;
END$$

DROP PROCEDURE IF EXISTS `provincias_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_eliminar` (IN `_id_provincia` INT)  BEGIN
DELETE FROM provincias WHERE  id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `provincias_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_insertar` (IN `_provincia` VARCHAR(100), `_ciudad_cabecera` VARCHAR(100), `_id_pais` INT)  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_provincia)+1,1) INTO nextID FROM provincias ; 
INSERT INTO provincias (id_provincia,provincia, ciudad_cabecera, id_pais) VALUES(nextID, _provincia, _ciudad_cabecera, _id_pais);
END$$

DROP PROCEDURE IF EXISTS `provincias_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_modificar` (IN `_id_provincia` INT, `_provincia` VARCHAR(100), `_ciudad_cabecera` VARCHAR(100))  BEGIN
UPDATE provincias 
	SET provincia = _provincia,
	    ciudad_cabecera = _ciudad_cabecera
	WHERE id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `provincias_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_mostrar` ()  BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
ORDER BY pr.id_pais, pr.provincia ASC;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_buscar` (IN `_id_rango` INT(10))  BEGIN
SELECT * FROM rango_ministerial WHERE  id_rango =_id_rango ;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_eliminar` (IN `_id_rango` INT)  BEGIN
DELETE FROM rango_ministerial WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_insertar` (IN `_rango` VARCHAR(100))  BEGIN
INSERT INTO rango_ministerial (rango_ministerial) VALUES(_rango);
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_mostrar` ()  BEGIN
SELECT * FROM rango_ministerial;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_renombrar` (IN `_id_rango` INT, IN `_rango` VARCHAR(100))  BEGIN
UPDATE rango_ministerial SET rango_ministerial = _rango WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `registro_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_buscar` (IN `_id_registro` INT)  BEGIN
SELECT    r.id_registro, r.id_servicio, s.nombre_servicio, r.id_distrito, d.distrito 
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
END$$

DROP PROCEDURE IF EXISTS `registro_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_eliminar` (IN `_id_registro` INT)  BEGIN
DELETE FROM registro WHERE id_registro = _id_registro; 
END$$

DROP PROCEDURE IF EXISTS `registro_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_insertar` (IN `_id_servicio` INT, `_id_distrito` INT, `_id_circuito` INT, `_id_iglesia` INT, `_id_persona` INT, `_es_miembro_iglesia` INT, `_id_miembro` INT, `_es_lider` INT, `_id_lider` INT, `_es_miembro_ministerial` INT, `_id_rango_ministerial` INT, `_es_pastor` INT, `_es_delegado` INT, `_trabaja_comite` INT, `_id_comite_temporero` INT, `_id_cargo_comite` INT, `_es_exonerado` INT, `_razon_exonerado` VARCHAR(200), `_fecha_registro` DATE, `_hora_registro` TIME, `_es_presbitero` INT, `_es_visita` INT)  BEGIN
	INSERT INTO registro (id_servicio, id_distrito,id_circuito, id_iglesia, id_persona, es_miembro_iglesia, 
							id_miembro, es_lider, id_lider, es_miembro_ministerial, id_rango_ministerial, es_pastor,
							es_delegado, es_miembro_comite_temp, id_comite_temporero, id_cargo_comite, 
							es_exonerado, fecha_registro, hora_registro,es_presbitero, es_visita,razon_exonerado) 
	 		VALUES(_id_servicio, _id_distrito,_id_circuito, _id_iglesia, _id_persona, _es_miembro_iglesia, 
							_id_miembro, _es_lider, _id_lider, _es_miembro_ministerial, _id_rango_ministerial, 
							_es_pastor, _es_delegado, _trabaja_comite, _id_comite_temporero, _id_cargo_comite, 
							_es_exonerado, _fecha_registro, _hora_registro, _es_presbitero, _es_visita,_razon_exonerado);

END$$

DROP PROCEDURE IF EXISTS `registro_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_modificar` (IN `_id_registro` INT, `_id_servicio` INT, `_id_distrito` INT, `_id_circuito` INT, `_id_iglesia` INT, `_id_persona` INT, `_es_miembro_iglesia` INT, `_id_miembro` INT, `_es_lider` INT, `_id_lider` INT, `_es_miembro_ministerial` INT, `_id_rango_ministerial` INT, `_es_pastor` INT, `_es_delegado` INT, `_trabaja_comite` INT, `_id_comite_temporero` INT, `_id_cargo_comite` INT, `_es_exonerado` INT, `_razon_exonerado` VARCHAR(200), `_fecha_registro` DATE, `_hora_registro` TIME, `_es_presbitero` INT, `_es_visita` INT)  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `registro_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_mostrar` ()  BEGIN
SELECT    r.id_registro, r.id_servicio, s.nombre_servicio, r.id_distrito, d.distrito 
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
			;
END$$

DROP PROCEDURE IF EXISTS `servicios_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_buscar` (IN `_id_servicio` INT)  BEGIN
SELECT s.id_iglesia, i.iglesia, s.id_departamento, d.departamento, d.cod_departamento,s.id_lider
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		, s.cod_servicio
		, s.nombre_servicio
		, s.id_tipo_servicio
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
		, s.descripcion, s.fecha_inicio,s.hora_inicio, s.fecha_fin,s.hora_fin, s.costo 
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicios ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
WHERE   s.id_servicio = _id_servicio;
END$$

DROP PROCEDURE IF EXISTS `servicios_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_eliminar` (IN `_id_servicio` INT)  BEGIN
DELETE FROM servicios WHERE id_servicio = _id_servicio; 
END$$

DROP PROCEDURE IF EXISTS `servicios_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_insertar` (IN `_nombre_servicio` VARCHAR(100), `_id_tipo_servicio` INT, `_cod_servicio` VARCHAR(30), `_desc_servicio` VARCHAR(200), `_fch_ini` DATE, `_hora_ini` TIME, `_fch_fin` DATE, `_hora_fin` TIME, `_id_depart` INT, `_id_lider` INT, `_id_iglesia` INT, `_costo` INT)  BEGIN
	INSERT INTO servicios (nombre_servicio, id_tipo_servicio,cod_servicio, descripcion, fecha_inicio, hora_inicio, fecha_fin, hora_fin, 
							id_departamento, id_lider, id_iglesia, costo) 
	 		VALUES(_nombre_servicio, _id_tipo_servicio,_cod_servicio, _desc_servicio, _fch_ini,_hora_ini, _fch_fin,_hora_fin,
	 				_id_depart, _id_lider, _id_iglesia,_costo);

END$$

DROP PROCEDURE IF EXISTS `servicios_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_modificar` (IN `_id_servicio` INT, `_id_tipo_servicio` INT, `_nombre_servicio` VARCHAR(100), `_cod_servicio` VARCHAR(30), `_desc_servicio` VARCHAR(200), `_fch_ini` DATE, `_hora_ini` TIME, `_fch_fin` DATE, `_hora_fin` TIME, `_id_depart` INT, `_id_lider` INT, `_id_iglesia` INT, `_costo` INT)  BEGIN
UPDATE servicios 
	SET nombre_servicio = _nombre_servicio,
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
		costo= _costo
	WHERE id_servicio = _id_servicio;
END$$

DROP PROCEDURE IF EXISTS `servicios_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_mostrar` ()  BEGIN
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
			INNER JOIN tipo_servicios ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia;
END$$

DROP PROCEDURE IF EXISTS `sociedades_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_buscar` (IN `_id_sociedad` INT)  BEGIN
SELECT * FROM sociedades WHERE  id_sociedad = _id_sociedad ;
END$$

DROP PROCEDURE IF EXISTS `sociedades_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_eliminar` (IN `_id_sociedad` INT)  BEGIN
DELETE FROM sociedades WHERE id_sociedad = _id_sociedad;
END$$

DROP PROCEDURE IF EXISTS `sociedades_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_insertar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO sociedades (siglas, sociedad, lema, descripcion) VALUES(_siglas, _sociedad, _lema, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `sociedades_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_modificar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200), `_id_sociedad` INT)  BEGIN
UPDATE sociedades 
	SET sociedad = _sociedad, 
	siglas = _siglas,
	lema = _lema,
	descripcion = _descripcion
WHERE id_sociedad = _id_sociedad;
END$$

DROP PROCEDURE IF EXISTS `sociedades_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_mostrar` ()  BEGIN
SELECT * FROM sociedades;
END$$

DROP PROCEDURE IF EXISTS `tandas_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_buscar` (IN `_tanda` VARCHAR(100))  BEGIN
SELECT * FROM tandas WHERE  tanda LIKE  CONCAT('%',_tanda,'%') ;
END$$

DROP PROCEDURE IF EXISTS `tandas_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_eliminar` (IN `_id_tanda` INT)  BEGIN
DELETE FROM tandas WHERE id_tanda = _id_tanda;
END$$

DROP PROCEDURE IF EXISTS `tandas_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_insertar` (IN `_tanda` VARCHAR(100))  BEGIN
INSERT INTO tandas (tanda) VALUES(_tanda);
END$$

DROP PROCEDURE IF EXISTS `tandas_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_modificar` (IN `_id_tanda` INT, `_tanda` VARCHAR(100))  BEGIN
UPDATE tandas SET tanda = _tanda WHERE id_tanda = _id_tanda;
END$$

DROP PROCEDURE IF EXISTS `tandas_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_mostrar` ()  BEGIN
SELECT * FROM tandas;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_buscar` (IN `_id_tipo_servicio` INT(10))  BEGIN
SELECT * FROM tipo_servicios 
WHERE  id_tipo_servicio =_id_tipo_servicio ;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_eliminar` (IN `_id_tipo_servicio` INT)  BEGIN
DELETE FROM tipo_servicios WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_insertar` (IN `_cod_tipo_servicio` VARCHAR(100), IN `_tipo_servicio` VARCHAR(100))  BEGIN
INSERT INTO tipo_servicios (cod_tipo_servicio, tipo_servicio) VALUES(_cod_tipo_servicio, _tipo_servicio);
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_modificar` (IN `_id_tipo_servicio` INT, IN `_cod_tipo_servicio` VARCHAR(100), IN `_tipo_servicio` VARCHAR(100))  BEGIN
UPDATE tipo_servicios 
SET tipo_servicio = _tipo_servicio, 
    cod_tipo_servicio = _cod_tipo_servicio
WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_mostrar` ()  BEGIN
SELECT * FROM tipo_servicios;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
CREATE TABLE IF NOT EXISTS `asistencias` (
  `id_asistencia` int(10) NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `id_tanda` int(10) NOT NULL,
  `fecha_transaccion` datetime NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  UNIQUE KEY `asistencia` (`id_registro`,`fecha`,`id_tanda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int(10) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `cargo` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `cargo`) VALUES
(28, 'Asesor(a)'),
(10, 'Co-Pastor(a)'),
(24, 'Cuarto(a) Diacono'),
(19, 'Cuarto(a) Vocal'),
(15, 'Director(a)'),
(9, 'Pastor(a)'),
(38, 'Presbitero(a)'),
(26, 'Presidente'),
(21, 'Primer(a) Diacono'),
(16, 'Primer(a) Vocal'),
(25, 'Quinto(a) Diacono'),
(20, 'Quinto(a) Vocal'),
(7, 'Relacionador Publico'),
(2, 'Secretario/a'),
(22, 'Segundo(a) Diacono'),
(17, 'Segundo(a) Vocal'),
(4, 'Sub-Secretario(a)'),
(6, 'Sub-Tesorero(a)'),
(12, 'Superintendente'),
(23, 'Tercer(a) Diacono'),
(18, 'Tercer(a) Vocal'),
(5, 'Tesorero(a)'),
(1, 'Vice-Presidente');

-- --------------------------------------------------------

--
-- Table structure for table `circuitos`
--

DROP TABLE IF EXISTS `circuitos`;
CREATE TABLE IF NOT EXISTS `circuitos` (
  `id_distrito` int(10) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `circuito` varchar(100) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `id_provincia2` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_circuito`),
  UNIQUE KEY `circuito` (`id_distrito`,`circuito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circuitos`
--

INSERT INTO `circuitos` (`id_distrito`, `id_circuito`, `circuito`, `id_provincia`, `id_provincia2`) VALUES
(1, 1, 'Higuey', 1, NULL),
(1, 2, 'Bani-Azua', 10, NULL),
(1, 3, 'San Cristobal Centro', 7, NULL),
(1, 4, 'San Cristobal Oeste', 7, NULL),
(1, 5, 'Haina', 7, NULL),
(1, 6, 'Santiago', 2, NULL),
(1, 8, 'Santo Domingo Este', 4, NULL),
(1, 9, 'Puerto Plata', 3, NULL),
(1, 10, 'Sosua', 3, NULL),
(1, 11, 'La Romana', 24, NULL),
(1, 12, 'Barahona', 14, NULL),
(1, 13, 'Ocoa', 9, NULL),
(1, 14, 'San Juan', 11, NULL),
(1, 15, 'Monte Plata', 29, NULL),
(1, 16, 'San Pedro Macoris', 6, NULL),
(1, 17, 'Cibao Norte', 17, NULL),
(1, 18, 'Cibao Nordeste', 26, NULL),
(1, 19, 'Linea Noroeste', 2, NULL),
(1, 20, 'Santo Domingo Oeste', 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comite_temporero`
--

DROP TABLE IF EXISTS `comite_temporero`;
CREATE TABLE IF NOT EXISTS `comite_temporero` (
  `id_comite_temporero` int(10) NOT NULL AUTO_INCREMENT,
  `comite_temporero` varchar(100) NOT NULL,
  PRIMARY KEY (`id_comite_temporero`),
  UNIQUE KEY `comite_temporero` (`comite_temporero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comite_temporero`
--

INSERT INTO `comite_temporero` (`id_comite_temporero`, `comite_temporero`) VALUES
(4, 'Actas'),
(1, 'Registro');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` int(10) NOT NULL AUTO_INCREMENT,
  `cod_departamento` varchar(15) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `departamento` (`departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `cod_departamento`, `departamento`, `descripcion`) VALUES
(1, 'ACAIC', 'Caballeros', 'Hombres Casados o mayores de 35 aÃ±os'),
(3, 'EBAIC', 'Escuela Biblica', 'Educacion Cristiana'),
(5, 'ANAIC', 'Ni&ntilde;os', 'Ni&ntilde;os menores de 12 anios'),
(6, 'AJUVAIC', 'Juveniles', 'Para las actividades dirigidas por las personas miembros de la sociedad de juveniles'),
(7, 'ADAIC', 'Damas', 'Sociedad de Damas');

-- --------------------------------------------------------

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
CREATE TABLE IF NOT EXISTS `distritos` (
  `id_pais` int(10) NOT NULL,
  `id_distrito` int(10) NOT NULL,
  `distrito` varchar(100) NOT NULL,
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `distrito` (`id_pais`,`distrito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distritos`
--

INSERT INTO `distritos` (`id_pais`, `id_distrito`, `distrito`) VALUES
(1, 1, 'Republica Dominicana');

-- --------------------------------------------------------

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id_estado_civil` int(10) NOT NULL AUTO_INCREMENT,
  `estado_civil` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado_civil`
--

INSERT INTO `estado_civil` (`id_estado_civil`, `estado_civil`) VALUES
(1, 'Soltero(a)'),
(2, 'Casado(a)'),
(3, 'Viudo(a)'),
(4, 'Divorciado(a)'),
(5, 'Union Libre');

-- --------------------------------------------------------

--
-- Table structure for table `estado_condicion`
--

DROP TABLE IF EXISTS `estado_condicion`;
CREATE TABLE IF NOT EXISTS `estado_condicion` (
  `id_estado_condicion` int(10) NOT NULL AUTO_INCREMENT,
  `estado_condicion` varchar(100) NOT NULL,
  `elegible_lider` int(1) NOT NULL,
  PRIMARY KEY (`id_estado_condicion`),
  UNIQUE KEY `estado` (`estado_condicion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado_condicion`
--

INSERT INTO `estado_condicion` (`id_estado_condicion`, `estado_condicion`, `elegible_lider`) VALUES
(1, 'Bautizado Activo', 1),
(2, 'Visita', 0),
(5, 'Bautizado Pasivo', 1),
(6, 'En Disciplina', 0),
(7, 'Descarriado', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iglesias`
--

DROP TABLE IF EXISTS `iglesias`;
CREATE TABLE IF NOT EXISTS `iglesias` (
  `id_iglesia` int(10) NOT NULL AUTO_INCREMENT,
  `iglesia` varchar(100) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fundador` varchar(100) DEFAULT NULL,
  `fecha_fundada` date DEFAULT NULL,
  `imagen_iglesia` varchar(100) DEFAULT NULL,
  `imagen_fundador` varchar(50) DEFAULT NULL,
  `imagen_pastor_actual` varchar(50) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `ultima_actualizacion` date DEFAULT NULL,
  `usuario_creacion` varchar(25) DEFAULT NULL,
  `usuario_modificacion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_iglesia`),
  UNIQUE KEY `iglesia` (`iglesia`,`id_circuito`,`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iglesias`
--

INSERT INTO `iglesias` (`id_iglesia`, `iglesia`, `id_circuito`, `id_provincia`, `direccion`, `telefono`, `fundador`, `fecha_fundada`, `imagen_iglesia`, `imagen_fundador`, `imagen_pastor_actual`, `fecha_creacion`, `ultima_actualizacion`, `usuario_creacion`, `usuario_modificacion`) VALUES
(5, 'Jesus La &Uacute;nica Esperanza', 2, 10, 'Calle Gregorio Luperon No. 11, Palmar de Ocoa', '8092437389', 'Rev. Pedro SÃ¡nchez', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(6, 'Vida Eterna', 2, 10, 'Villa Sombrero', '8093802548', 'Lpa. Idelania Lora Pe&ntilde;a', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(7, 'Genezaret', 2, 10, 'Calle Se&ntilde;ora de Regla No.81 sur', '8099734896', 'Rev.David de los Santos', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(8, 'Monte Sina&iacute;', 2, 10, 'Calle Central No. 66, Pizarrete, Ban&iacute;', '809522963', 'Rev. Eddy Gonz&aacute;lez Prandy', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(9, '2da. Genezaret', 2, 10, 'calle Canela Mota, Santa Rosa No. 41', '8095222951', 'Rev. Miguel Ant. Dominguez Mezquita', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(10, 'La Chequina de Jehova', 2, 10, 'Calle Francisco Gregorio Billini No. 8, Bani', '8095226273', 'Rev. Tania de Pilar Perez de Mejia', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(11, 'Asamblea de Iglecias Cristianas', 2, 10, 'Reparto 7 de Mayo No.4-A, los Jovillos, azua', '8297403990', 'Lpa.Santiago Sierra', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(12, 'Roca de Salvacion 2da', 2, 12, 'km.8 de Azua', '8296061053', 'Exh. Carmen Dayana Garcia', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(13, 'Centro Evangelistico Chalon de AIC', 2, 10, 'Calle Maximo Gomez No. 53, Boca Canasta', '8097430038', 'Rev. Florencio Minier', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(14, 'Puerta de la Misericordia de AIC', 2, 10, 'Calle Duverge Paya, Bani', '8295404081', 'Lpa. Bernabet Pinet', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(15, 'Bethel de AIC', 12, 14, 'C/ Victor Mola #43, Barahona', '8298566749', 'Exh. Felix M. Beltre', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(16, '2da. Puerta de Refugio', 2, 10, 'Matanza Bani', '', 'Exh dayanira soto', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(17, 'Bethania de AIC', 12, 14, 'Calle Princial  #22, Coleton Enriquillo', '8296221262', 'Lpa. Santo Felix', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(19, 'Tesalonica de AIC', 12, 14, 'Calle Sanchez #36, Enriquillo', '8296062115', 'Exh. Cesar Arturo Arias', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(20, 'La hermosa de AIC', 12, 14, 'Calle Arrollo dulce Enriquillo', '8099734377', 'Lpa Exporminio Matos Perez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(21, 'Fuente de Vida Eterna', 2, 10, 'Jaguarizo Moterio', '8096944873', 'Jose Manuel Medina', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(22, 'Getsemani del AIC', 12, 23, 'El Baulio Soto #23, Postrer Rio', '8299619215', 'Lpa John Kennedy Jimenez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(23, 'Tesalonica 2da', 12, 14, 'Calle Caonabo', '8292324889', 'Exh. Josefa Beriguete', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(24, 'Faro de Luz de AIC', 2, 10, 'Enriquillo', '8293255185', 'Exh Wandel Medina', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(25, 'Getsemani de AIC', 20, 16, 'C/ San Gabriel #33 Km. 9, Carretera Sanchez', '8096495771', 'Rev. Joel de lo Santos', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(26, 'Puerta del cielo Central de AIC', 13, 9, 'Calle Cabral ', '8098898490', 'Lp. Margarita Peguero', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(27, 'del Pentecostes de AIC', 20, 16, 'C/ La Puya #19, La Cuesta de Arroyo Hondo', '', 'Rev. Wenseslao Mejia De Los Santos', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(28, 'Puerta del refugio Sta. de AIC', 13, 9, 'El mogote ', '8099121112', 'Daniel Martinez Tejeda', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(29, 'Jesus Erec, Salvatores', 2, 10, 'Cruce de Ocoa', '8097520117', 'Exh. Lleuri Manuel Tejeda', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(30, 'Jehova de los Ejercitos de AIC', 20, 16, 'C/ Principal #16, Ensanche Holguin', '8296883277', 'Rev. Rafael Estrella', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(31, 'Puerta del cielo 2da de AIC', 2, 9, 'Bo. San Luis', '8099743939', 'Exh. Marino Antonio Mejia', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(32, 'Faro de Luz de AIC', 20, 16, 'C/ 27 de Febrero #13, Bo. Obras Publicas', '8093160569', 'Exh. Felix Benz Lorenzo', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(33, 'Sentro de Renovacion Shadday', 2, 10, 'calle Raul Abreu Mi nino', '', 'Santa Rosa', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(34, 'Justicia y Verdad de AIC', 20, 16, 'C/ Progreso #21, Bo. Eriquillo Km. 9 Ant. Duarte', '8295616428', 'Rev. Antonio BÃ¡ez NuÃ±ez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(35, 'Nuevo Amanecer', 13, 9, 'Centro de la ciudad', '8293796105', 'Exh. Juan Santos', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(36, 'Juan 8:38, de AIC', 20, 16, 'C/ ProlongaciÃ³n Independencia #9', '8492441984', 'Lpa. ElÃ­as PÃ©rez Arias', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(37, 'Puerta de la Misericordia II de AIC', 2, 10, 'Calle Maximo Gomez, los Quemaos de Paya', '', 'Exh Ramon Antonio Soto Castillo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(38, 'Pentecostal Ministerio de oracion y Liberacion', 13, 9, 'Los Banilejos de rancho arriba', '8297314059', 'Alfredo Ortiz', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(39, 'Justicia y Verdad II, de AIC', 20, 16, 'C/ 1ra. #41, Villa Del Palmar, Pantoja', '8293013418', 'Exh. Francisco Agramonte', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(40, 'Voz Que Clama en el Desierto, de AIC', 20, 16, 'C/ La MontaÃ±a de Bellas Colina Manoguayabo', 'No Especificado', 'No Especificado', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(41, 'Fuente de amor de AIC', 13, 9, 'Calle Gral . Los quemados', '8298897293', 'Lpa. Ramon Andres Lluveres', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(42, 'Bethesda de AIC', 2, 10, 'Calle Mercedes Garcia Escondido Bani', '8095228894', 'Lpa. Apolonia Peguero ', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(43, 'Fuente de Esperanza', 20, 16, 'C/1ra. UrbanizaciÃ³n Justino de la Cruz, Sabana Perdida', '', 'Exh. Daniel Coma Castillo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(44, 'Monte de SiÃ³n, de AIC', 20, 16, 'C/ Anacaona #440, Bo. Los Alcarrizos Americanos', '8095489459', 'Rev. Domingo Antonio PeÃ±a', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(45, 'Puerta del cielo 5ta', 2, 9, 'La barra #8 ', '8298049799', 'Exh. Federico Castillo Perez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(46, 'Roca De SalvaciÃ³n, de AIC', 20, 16, 'C/ Central #48, Bo. El CafÃ© de Herrera', '8095375525', 'Rev. Felipe MartÃ­nez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(47, 'Jesus Es el Rey ', 2, 10, 'Bani R.D.', '', 'Exh. Alexis Nova', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(48, 'Eben-Ezer, de AIC', 20, 16, 'C/Respaldo MÃ©xico #21 Bo. Buenos Aires de Herrera', '8092387892', 'Rev. Antonio MejÃ­a', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(49, 'La Roca, de AIC', 20, 16, 'Av. Del Guaricano #60, Santa Cruz', '8093248984', 'Rev. Julio Arsenio SÃ¡nchez', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(50, 'Puerta del cielo de AIC', 15, 29, 'Cruce de la Hermo, Munic.', '8099168092', 'Exh. Nesly Vital', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(51, 'UnciÃ³n de JehovÃ¡, de AIC', 20, 16, 'C/ 31 #45, San Felipe Villa Mella', '8092399033', 'Exh. Flavia Alvarez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(52, 'Asamblea de iglesias cristianas, Inc', 15, 29, 'Hato San Pedro', '', 'Lpa. Luis Jean Batis', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(53, 'Roca de SalvaciÃ³n II, de AIC ', 20, 16, 'C/ 25 #32, Bo. El CafÃ© de Herrera', '8294581876', 'Lpa. Antonio Mateo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(54, 'Esmira de AIC', 17, 25, 'Jose Maria Lora', '8299630679', 'Exh. jose francisco Enriquez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(55, 'La Puerta de La FÃ©, de AIC', 20, 16, 'C/ Santa Rosa de Rieles S/N, Villa Linda de Pantoja', '8098734196', 'Exh. EpifanÃ­a Prefil de LeÃ³n', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(56, 'Oracion contestada 7ma', 17, 32, 'cotui', '', 'Exh. Gertrudis olivares', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(57, 'Columna de Fuego de AIC', 20, 16, 'El CafÃ© de Herrera', '8095374301', 'Lpa. Juana Rosario', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(58, 'Oracion contestada 6ta', 17, 32, 'cotui', '', 'No definido', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(59, 'JehovÃ¡ Nissi', 20, 16, 'El CafÃ© de Herrera', '8095317632', 'Exh. Porfirio Antonio Rosa', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(60, 'Monte de Sion', 4, 7, 'Calle Domingo Sabio No. 39 canastica', '8095280540', 'Rev. Felix Armando Severino', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(61, 'JehovÃ¡ Reyna de AIC', 20, 16, 'Villa Linda Pantoja', '8298551356', 'Exh. ValentÃ­n Reyes Tejeda', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(62, 'Pentecostal de AIC', 20, 16, 'Hato Nuevo De Manoguayabo', '', 'Exh. Lemet DupÃ¡r', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(63, 'Manantial de vida', 17, 2, 'Las flores blanco arriba', '8296892762', 'LPA. Leocadio Lara', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(64, 'Oasis de Amor de A.I.C.', 20, 16, 'C/ Paseo de la Gracia de Dios #79, Villa Marina, Distrito Nacional', '', 'Exh. Anastalia Green Vanderhost', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(65, 'Nueva JerusalÃ©n', 20, 16, 'Los Girasoles III, C/ Emma Valaguer', '', 'Dilermy Alexis', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(66, '1er. Santuario de AIC', 17, 17, 'Calle Duarte #270', '', 'Exh. Bienvenido Baez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(67, 'Eben-Ezer Santidad por la Fe', 20, 16, 'Palave, Manoguayabo, Barrio Chulito', '', 'Exh. Arry Prudhomme', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(68, 'Oracion contestada Decimo Tercera', 17, 32, 'cotui', '', 'Exh. Daniel Saint-ville', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(69, 'Lirio de los valles', 17, 17, 'San Francisco', '8096710961', 'Susano Paredes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(70, 'Pentecostal Marcado Por el EspÃ­ritu Santo', 20, 27, 'C/ BÃ¡ez Sector MÃ¡ximo GÃ³mez #17', '', 'Exh. Fausto Antonio Oliver', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(71, 'Cristo dador de vida', 17, 12, 'Hoyo de Jaya', '8095166540', 'Exh. Ramon Espinal', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(72, 'JehovÃ¡ de los Ejercitos II', 20, 16, 'C/ Centrel #17, Las Palmeras, Los Girasoles', '', 'Lpa. Mirella Ferreras', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(73, 'Jesucristo te salva', 4, 7, 'Carretera Cambita No. 4', '8095278882', 'Rev. Virgilio Figuereo ', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(74, 'Luz de la Esperanza, de AIC', 8, 4, 'C/ Yolanda GuzmÃ¡n #240, Esq. 17', '8299145441', 'Rev. Marcial Reyes SobÃ¡', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(75, 'Oracion contestada 8va', 18, 26, 'Factor de Nagua', '8492095484', 'Exh. Marcelino Santo Taveras', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(76, 'Bethel, de AIC', 8, 4, 'C/ Paseo De Los Profesores #1, Los Frailes', '8298861156', 'Rev. Yuni Roque Laureano', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(77, 'El Camino, de AIC', 8, 4, 'C/ Jardines del Norte #20, El Rosal, Alma Rosa', '8298513973', 'Rev. Miguelin Morillo', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(78, 'Vida y luz AIC', 18, 26, 'La Jaguita de Nagua', '8295432515', 'Exh. Ignacio Reyes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(79, 'Bethel 1ra ', 4, 7, 'Calle Sanchez km. 7, Sector de Camba, paraje Dona Ana', '8297700360', 'Rev. Juan Isabel Jimenez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(80, 'Esmirna, de AIC', 8, 4, 'C/F #22, Ensanche Isabelita', '8095996414', 'Rev. NicolÃ¡s Cuevas Sena', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(81, 'Rio Nueva Sinai de AIC', 19, 34, 'Calle 1ra. Juan de Jesus reyes #45', '8296859199', 'Rev. Ramon Ant. Rodriguez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(82, 'Senda Maravilla', 4, 7, 'Calle altagracia #4, Najayo Arriba, km. 6', '8299659004', 'Exh. Milagro felix', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(83, 'Pan y Vida, de AIC', 8, 4, 'C/12 #158, La Isabelita', '8095954780', 'Rev. Eduardo Terrero', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(84, 'Templo Bethesda de AIC', 19, 34, 'Calle dr. Pena Gomez #40 guatapanal', '', 'Exh. Isidro Goris ', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(85, 'Santidad a JehovÃ¡, de AIC', 8, 4, 'C/ 311 No. 58, Bo. Puerto Rico, Los Minas ', 'No Especificado', 'No Especificado', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(86, 'Nueva luz de AIC', 19, 34, 'Calle Luperon, #26, ', '8297417453', 'Exh. Kelvin Aventura', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(87, 'Fuente de Agua Viva', 4, 7, 'Cambita Uribe', '', 'Exh. Dionicio Florentino', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(88, 'Escala al Cielo, de AIC', 8, 4, 'C/ Altagracia #41 Sec. Gualey', '8097718615', 'Rev. JosÃ© Manuel de la Rosa', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(89, 'la Hermosa de AIC', 19, 34, 'Calle Esperanza valverde', '', 'Exh. Hector noesi', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(90, 'Nueva VisiÃ³n, de AIC', 8, 4, 'Sec. La Caleta, Boca Chica', '8297250001', 'Rev. Carlos Manuel GuzmÃ¡n Guance', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(91, 'Aposento Alto, de AIC', 8, 4, 'C/ Respaldo San AndrÃ©s #35, AndrÃ©s Boca Chica', '8094228586', 'Rev. Angelo Feliciano', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(92, 'La Hermosa Fuente de Amor', 4, 7, 'Paraje la Manigua', '', 'Exh. Matea Guzman', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(93, 'Casa de Refugio, de AIC', 8, 4, 'Naranjo, Batey San Luis, Central Ozama', '8297794572', 'Lpa. Victor De La Cruz Marte', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(94, 'El Sembrador de AIC ', 8, 4, 'Cura, #5, Bo. Las Flores, San Luis', '8099671325', 'Exh. Juan Pacheco VizcaÃ­no', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(95, 'Siloe III', 4, 7, 'Calle Privada No. Hoyo del Barro ', '8096349532', 'Lpa. Brigido de la cruz Jimenez.', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(96, 'Asamblea de Iglesia Cristiana ', 19, 34, 'Buen Hombre, Villa Vasquez', '8099133187', 'Lpa. Maritza Martinez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(97, 'JehovÃ¡ Shalom de AIC', 8, 4, 'C/8, Brisa del EdÃ©n', '8292087742', 'Exh. Miguel Angel Rosado', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(98, 'Monte Sinai', 19, 28, 'catanuela, Monte Cristi', '8094575332', 'Exh. Andreina Alvarez Ramoz', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(99, 'GetsemanÃ­, de AIC', 8, 4, 'Chirino, Monte Plata', '8097748761', 'Rev. AgustÃ­n Febles', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(100, 'El Consolador I', 8, 4, 'C/Progreso #6 Bo. Libertad, Sabana Perdida', '8295466111', 'Rev. TeÃ³filo GonzÃ¡lez', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(101, 'Ciudad de Luz 1ra', 4, 7, 'Dona Ana San Cristobal', '8096129837', 'Exh. Demetrio Martes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(102, 'A Dios Sea la Gloria de AIC', 19, 34, 'Barrio los Palitos #6', '8294581813', 'Exh. Joselin Perez Valdez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(103, 'Caminando con Jesucristo de AIC', 19, 25, 'Calle Juan bosch, El canal', '', 'Exh. Yosi Magalis Aquino', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(104, '2da. Eben-Ezer', 4, 7, 'Sector las Casillas', '8092582627', 'Rev. Bartolo Figuereo Medrano', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(105, 'Alfa y Omega', 4, 7, 'Los Cacaos', '8293790652', 'Exh Manuel Diaz Castillo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(106, 'El Consolador II', 8, 4, 'C/ Principal #11, Villa Pompa, Sabana Perdida', '8093508883', 'Exh. Dominga Antonia JÃ©rez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(107, 'Remanente Fiel', 8, 4, 'Sec. Las Flores San Luis', '8298601972', 'Exh. Daniel Quezada', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(108, 'JehovÃ¡ Nissi', 8, 4, 'El Naranjo C/Primera', '8292861290', 'Lpa. Antero Liriano', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(109, 'Fuente de Esperanza', 8, 4, 'C/Respaldo Caracoles #25, La Mina', '8296909679', 'Lpa. BenjamÃ­n Jorge MejÃ­a', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(110, 'Casa de OraciÃ³n 1ra', 8, 4, 'Buenaventura de Mendoza', '8298833886', 'Lpa. Isidro ColÃ³n', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(111, 'Bethel 4ta', 4, 7, 'La capilla, Najayo Arriba', '8098092787536', 'Lpa. Jose Antonio Febrillet', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(112, 'Templo Misionero Avivamiento y Poder', 8, 4, 'C/2da. Esq. B, Almirante Kennedy', '8097223576', 'Exh. Francisco MartÃ­nez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(113, 'Jehova Jireh de AIC', 10, 3, 'Entrada los Molina #126', '8094538755', 'Rev. Quirico Diaz alcantara', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(114, 'Templo Bethel', 4, 7, 'Najallo Arriba', '8094700051', 'Rev. Crispin Aquino Alvarez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(115, '7mo Refugio de AIC', 10, 3, 'Calle eugenio kunhardt #92 Sosua', '8299232865', 'Rev. Cristian Rivas Andujar', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(116, 'Los Doce Apostoles', 4, 7, 'La Laguna Cambita Garabito', '8298856596', 'Exh. Jose E. Encarnacion', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(117, 'El 1er Refugio de AIC', 10, 3, 'Calle Principal Villa Maranatha', '8298859191', 'Rev. Paulino Gomez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(118, 'Emmanuel de AIC', 10, 3, 'Calle Viejo Perez #7', '8293411553', 'Rev Miledis Moquete Ramirez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(119, 'Emben-Ezer', 4, 7, 'canasta', '8297476419', 'Rev. Juan Rosa Amador', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(120, 'Monte de Dios 3ra. Consagrada para Dios', 4, 7, 'Paraje la Loma, Najayo', '', 'Exh. Miguel Angel Guzman', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(121, 'Mizpa', 4, 7, 'Proyecto Canasta', '8098566486', 'Rev. Rafael Perez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(123, 'Fuente de Agua Viva 2da.', 4, 7, 'Cambita Uribe', '8299175375', 'Rev. Jose Elias Del Rosario', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(124, '2ddo Refugio de AIC', 10, 3, 'Paso Valiente', '8498835137', 'Rev. Franklin Contreras', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(125, '6to Refugio de AIC', 10, 3, 'Proyecto Habitacional', '8092049697', 'Rev Pablo Toribio', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(126, 'Bethel 3ra', 4, 7, 'Najallo Arriba, La Victorina', '8093409704', 'Lpa. Yulis Alberto Batel', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(127, '2do Tabernaculo de AIC', 10, 3, 'Yasica Arriba', '8295998335', 'Lpa Jose Antonio Hernandez Rodriguez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(128, 'Arca de Noe', 4, 7, 'Calles Andres Bremon #63', '8492121291', 'Lpa. Pastor Julio Rodriguez ', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(129, '4to Tabernaculo de AIC', 10, 3, 'Arroyo de leche ', '8096120626', 'Exh. Candida Elogio Placido de Reyes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(130, 'Fuente de Agua Viva 3ra.', 4, 7, 'Yamile 1ra.', '', 'Exh. Altagracia Figuereo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(131, 'Area de salvacion de AIC', 10, 3, 'Cano dulce, Gaspar Hernandez', '8292289782', 'Exh. Ramon Bonilla Severino', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(132, 'Monte de Sion 2da.', 4, 7, 'La Guama, Cambita ', '8093863392', 'Exh. Jacinto Guzman', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(133, '7mo Tercer Refugio', 10, 3, 'La cienega de Cabarete', '8292740640', 'Exh. Ramon Ant. De Jesus Peralta', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(134, 'Filadelfia', 4, 7, 'Lecheria San Cristobal', '8097032718', 'Exh Carmen Castillo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(135, 'La Hermosa Ven y Ve', 4, 7, 'Villa Vista San Cristobal', '', 'No definido', '2018-05-19', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(136, 'Casa de Oracion', 4, 7, 'La Palmita', '', 'Exh. Juanita Romero ', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(137, 'Casa de Dios y Puerta del cielo de AIC', 10, 3, 'Batey severet Distrito Municipal Montellano', '8292992257', 'Rev.  Pedro Florencio Decena', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(138, 'Ciudad de Luz Hija', 4, 7, 'Calle Andres Bremon', '8297804803', 'Exh. Pedro Valdes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(139, '5to Refugio de AIC ', 10, 3, 'Batey la union, Frente a la base Aerea', '8092501153', 'Rev. Augustin Vargas', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(140, '2da. Jireh de AIC', 10, 3, 'Calle 10 Cabrete ', '8097048134', 'Exh. Guillermina Castillo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(141, 'Monte de Sion 4ta', 4, 7, 'Calle Prinsipal #8, Carrete Sanches, km.2 San Rafael', '', 'Exh. Sonia Maria Rosario Gonzalez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(142, '2da Emmanuel de AIC', 10, 3, 'Los Gomez Montellano', '8294516056', 'Exh.Cesar A. Frica', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(143, 'Principe de Paz de AIC', 10, 3, 'Villa Emmanuel', '8298495940', 'Rev. Jose Polanco', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(144, 'Ciudad de Luz 3ra', 4, 7, ' Dona Ana, San Cristobal', '', 'Exh. Pura Gusman', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(145, '3ra Iglesia Jireh de AIC', 10, 3, 'Cuesta Barrosa, Sabaneta', '8099078388', 'Lpa. Julio Mena Martinez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(146, 'Retono de Bethel II', 4, 7, 'Santa Lucia de Gamba, San Cristobal', '', 'Francisco Javier Sierra Mateo', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(147, '5ta Jeova Jireh AIC', 10, 3, 'Eslabon ', '8298109999', 'Lpa. Edilio Diaz', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(148, '4ta Enmanuel', 10, 3, 'Calle Pincipal, El Mango Yasica', '8297037582', 'Yovany Rojas', '2018-05-04', '', '', '', '2018-05-19', '2018-05-19', NULL, NULL),
(149, '8vo Refugio de AIC', 10, 3, 'Bella Vista', '8297568932', 'Exh. Arismendy Reyes', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(150, 'Filadelfia de AIC', 10, 3, 'Calle 1ra #1 el Higuero', '8099645269', 'Exh. Roosevelt charles', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(151, '3er Tabernaculo', 10, 3, 'Calle Prinsipal, yaroa abajo', '8293171810', 'Exh. Esmeralda Rodrigez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(152, 'Luz en las tinieblas Tabernaculo X||', 10, 3, 'Caraballo ', '8298833569', 'Antonia Bruno', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(153, 'Fuente de adoracion de AIC', 10, 33, 'Sabaneta de cangrejo', '8094514072', 'Exh. Guillermo Reynoso', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(154, '3ra. Emmanuel (El Calvario)', 10, 3, 'Calle Principal', '', 'Exh. Martin Almonte', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(155, '7mo, Segundo Refugio', 10, 3, 'Villa Liberacion, Sosua', '8295583044', 'Yovany Hernandes Martinez', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL),
(156, '7mo, Cuarto Refugio Adonai', 10, 10, 'Cuesta Barros Sabaneta de Yasica', '8298835335', 'Evaristo Morales Martines', '2018-05-19', '', '', '', '2018-05-19', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lideres`
--

DROP TABLE IF EXISTS `lideres`;
CREATE TABLE IF NOT EXISTS `lideres` (
  `id_lider` int(15) NOT NULL AUTO_INCREMENT,
  `id_departamento` int(10) NOT NULL,
  `id_miembro` int(10) NOT NULL,
  `id_cargo` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `vigente` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_lider`),
  UNIQUE KEY `id_departamento` (`id_departamento`,`id_miembro`,`id_cargo`,`fecha_inicio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lideres`
--

INSERT INTO `lideres` (`id_lider`, `id_departamento`, `id_miembro`, `id_cargo`, `fecha_inicio`, `fecha_fin`, `vigente`) VALUES
(1, 1, 5, 15, '2016-01-01', '2016-12-31', 0),
(2, 3, 1, 12, '2015-01-01', '2016-12-31', 0),
(3, 6, 5, 26, '2017-01-01', '2018-12-31', 1),
(5, 3, 5, 12, '2012-01-01', '2013-12-31', 0),
(6, 3, 5, 15, '2002-01-01', '2003-12-31', 0),
(7, 3, 5, 10, '2018-05-01', '2018-05-14', 0),
(8, 5, 1, 26, '2018-05-01', '2018-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `miembros`
--

DROP TABLE IF EXISTS `miembros`;
CREATE TABLE IF NOT EXISTS `miembros` (
  `id_miembro` int(15) NOT NULL AUTO_INCREMENT,
  `id_persona` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `id_sociedad` int(10) NOT NULL,
  `id_estado_condicion` int(10) NOT NULL,
  `fecha_conversion` date DEFAULT NULL,
  `fecha_bautismo` date DEFAULT NULL,
  `id_rango_ministerial` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL DEFAULT '3333-12-31',
  `ultimo_registro` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_miembro`),
  UNIQUE KEY `miembro_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miembros`
--

INSERT INTO `miembros` (`id_miembro`, `id_persona`, `id_iglesia`, `id_sociedad`, `id_estado_condicion`, `fecha_conversion`, `fecha_bautismo`, `id_rango_ministerial`, `fecha_inicio`, `fecha_fin`, `ultimo_registro`) VALUES
(1, 1, 23, 2, 1, '1990-03-19', '1992-10-19', 1, '2018-04-28', '3333-12-31', 1),
(4, 7, 143, 1, 2, '1990-03-19', '1992-10-19', 1, '2018-04-28', '3333-12-31', 1),
(5, 9, 5, 1, 1, '1990-03-19', '1992-10-19', 1, '2018-04-28', '3333-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `id_pais` int(10) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id_pais`, `pais`) VALUES
(1, 'Republica Dominicana'),
(5, 'Estados Unidos de America'),
(6, 'Espana'),
(7, 'Suecia');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `apodo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_provincia` int(10) NOT NULL,
  `id_pais` int(10) NOT NULL,
  `id_sexo` int(10) NOT NULL,
  `id_tipo_documento` int(10) DEFAULT NULL,
  `nro_documento_identidad` varchar(20) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `id_estado_civil` int(10) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `ultima_actualizacion` date DEFAULT NULL,
  `cod_usuario_creacion` varchar(20) DEFAULT NULL,
  `cod_usuario_modificacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `persona` (`nombres`,`apellidos`,`id_provincia`,`id_pais`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id_persona`, `nombres`, `apellidos`, `fecha_nacimiento`, `telefono`, `apodo`, `direccion`, `id_provincia`, `id_pais`, `id_sexo`, `id_tipo_documento`, `nro_documento_identidad`, `imagen`, `id_estado_civil`, `fecha_creacion`, `ultima_actualizacion`, `cod_usuario_creacion`, `cod_usuario_modificacion`) VALUES
(1, 'Francisco', 'Brujan Arias', '1977-04-06', '8094232642', 'brujan', 'calle 19 Marzo No. 16, Los Molina', 7, 1, 1, 1, '002-0097492-1', 'fbrujan.jpg', 1, '2018-05-01', '2018-05-19', 'fbrujan', NULL),
(7, 'Clarivel Jacqueline', 'Batel Ramirez', '1975-12-20', '8094362642', 'clari', 'Los Molina', 2, 1, 2, 1, '', 'clari.jpg', 1, '2018-05-01', '2018-05-01', 'fbrujan', NULL),
(9, 'Franyelis Yeliza', 'Brujan Batel', '2001-06-10', '8294092642', 'franye', 'Los Molina', 9, 1, 2, 3, '', 'franye.jpg', 1, '2018-05-01', '2018-05-18', 'fbrujan', NULL),
(11, 'Yulyssa Esthefany', 'Batel Martinez', '2000-07-14', '8297576716', 'Yuly', 'Calle Tercera, Manzana J,  No. 12,  Urbanizacion los agronomos', 7, 1, 2, 1, '402-3229619-0', '', 1, '2018-05-18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE IF NOT EXISTS `provincias` (
  `id_provincia` int(10) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `ciudad_cabecera` varchar(200) DEFAULT 'NULL',
  `id_pais` int(10) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE KEY `provincia` (`id_pais`,`provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`, `ciudad_cabecera`, `id_pais`) VALUES
(1, 'La Altagracia', 'Higuey', 1),
(2, 'Santiago', 'Santiago de los Caballeros', 1),
(3, 'Puerto Plata', 'San Felipe de Puerto Plata', 1),
(4, 'Santo Domingo', 'Santo Domingo Este', 1),
(6, 'San Pedro Macoris', 'San Pedro de Macoris', 1),
(7, 'San Crist&oacute;bal', 'San Crist&oacute;bal', 1),
(8, 'Chicago', 'Chicago', 5),
(9, 'San Jos&eacute; de Ocoa', 'San Jos&eacute; de Ocoa', 1),
(10, 'Peravia', 'Bani', 1),
(11, 'San Juan', 'San Juan de la Maguana', 1),
(12, 'Azua', 'Azua de Compostela', 1),
(13, 'Bahoruco', 'Neiba', 1),
(14, 'Barahona', 'Barahona', 1),
(15, 'Dajab&oacute;n', 'Dajab&oacute;n', 1),
(16, 'Distrito Nacional', 'Santo Domingo de Guzman', 1),
(17, 'Duarte', 'San Francisco de Macoris', 1),
(18, 'Elias Pi&ntilde;a', 'Comendador', 1),
(19, 'El Seibo', 'Santa Cruz de El Seibo', 1),
(20, 'Espaillat', 'Moca', 1),
(21, 'Hato Mayor', 'Hato Mayor del Rey', 1),
(22, 'Hermanas Mirabal', 'Salcedo', 1),
(23, 'Independencia', 'Jiman&iacute;', 1),
(24, 'La Romana', 'La Romana', 1),
(25, 'La Vega', 'Concepcion de la Vega', 1),
(26, 'Mar&iacute;a Trinidad S&aacute;nchez', 'Nagua', 1),
(27, 'Monse&ntilde;or Nouel', 'Bonao', 1),
(28, 'Monte Cristi', 'Monte Cristi', 1),
(29, 'Monte Plata', 'Bayaguana', 1),
(30, 'Pedernales', 'Pedernales', 1),
(31, 'Saman&aacute;', 'Santa Barbara de Saman&aacute;', 1),
(32, 'S&aacute;nchez Ram&iacute;rez', 'Cotu&iacute;', 1),
(33, 'Santiago Rodr&iacute;guez', 'San Ignacio de Sabaneta', 1),
(34, 'Valverde', 'Santa Cruz de Mao', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rango_ministerial`
--

DROP TABLE IF EXISTS `rango_ministerial`;
CREATE TABLE IF NOT EXISTS `rango_ministerial` (
  `id_rango` int(10) NOT NULL AUTO_INCREMENT,
  `rango_ministerial` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rango`),
  UNIQUE KEY `rango_ministerial` (`rango_ministerial`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rango_ministerial`
--

INSERT INTO `rango_ministerial` (`id_rango`, `rango_ministerial`) VALUES
(6, 'Exhortador'),
(5, 'Laico Registrado'),
(1, 'Miembro Laico');

-- --------------------------------------------------------

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `id_registro` int(10) NOT NULL AUTO_INCREMENT,
  `id_servicio` int(10) NOT NULL,
  `id_distrito` int(10) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `id_persona` int(10) NOT NULL,
  `es_miembro_iglesia` int(1) NOT NULL DEFAULT 0,
  `id_miembro` int(10) DEFAULT NULL,
  `es_lider` int(1) NOT NULL DEFAULT 0,
  `id_lider` int(10) DEFAULT NULL,
  `es_miembro_ministerial` int(1) NOT NULL DEFAULT 0,
  `id_rango_ministerial` int(10) DEFAULT NULL,
  `es_pastor` int(1) NOT NULL DEFAULT 0,
  `es_presbitero` int(11) NOT NULL DEFAULT 0,
  `es_delegado` int(1) NOT NULL DEFAULT 0,
  `es_visita` int(11) NOT NULL DEFAULT 0,
  `es_miembro_comite_temp` int(1) NOT NULL DEFAULT 0,
  `id_comite_temporero` int(10) DEFAULT NULL,
  `id_cargo_comite` int(10) DEFAULT NULL,
  `es_exonerado` int(1) NOT NULL DEFAULT 0,
  `razon_exonerado` varchar(200) DEFAULT 'NULL',
  `fecha_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `id_servicio` (`id_servicio`,`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registro`
--

INSERT INTO `registro` (`id_registro`, `id_servicio`, `id_distrito`, `id_circuito`, `id_iglesia`, `id_persona`, `es_miembro_iglesia`, `id_miembro`, `es_lider`, `id_lider`, `es_miembro_ministerial`, `id_rango_ministerial`, `es_pastor`, `es_presbitero`, `es_delegado`, `es_visita`, `es_miembro_comite_temp`, `id_comite_temporero`, `id_cargo_comite`, `es_exonerado`, `razon_exonerado`, `fecha_registro`, `hora_registro`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en Comite', '2018-01-01', '20:18:00'),
(4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en Comite', '2018-01-01', '20:18:00'),
(5, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en comite Temporero', '2018-01-01', '20:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` int(15) NOT NULL AUTO_INCREMENT,
  `id_tipo_servicio` int(10) NOT NULL,
  `nombre_servicio` varchar(100) NOT NULL,
  `cod_servicio` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_departamento` int(10) NOT NULL,
  `id_lider` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `costo` int(10) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `nombre_servicio` (`nombre_servicio`,`fecha_inicio`,`id_iglesia`,`hora_inicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `id_tipo_servicio`, `nombre_servicio`, `cod_servicio`, `descripcion`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `id_departamento`, `id_lider`, `id_iglesia`, `direccion`, `costo`) VALUES
(1, 1, 'Culto de Sociedad de Damas', 'ORAC-ADAIC-2018-05-03', 'Culto dirigido por la sociedad de damas', '2018-05-03', '2018-05-03', '19:00:00', '22:00:00', 1, 1, 1, '', 200),
(3, 1, 'Culto de Sociedad de Caballeros', 'ORAC-ACAIC-2018-05-04', 'Culto dirigido por la sociedad de caballeros', '2018-05-04', '2018-05-04', '19:00:00', '22:00:00', 3, 1, 1, '', 200);

-- --------------------------------------------------------

--
-- Table structure for table `sexos`
--

DROP TABLE IF EXISTS `sexos`;
CREATE TABLE IF NOT EXISTS `sexos` (
  `id_sexo` int(10) NOT NULL AUTO_INCREMENT,
  `sexo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sexos`
--

INSERT INTO `sexos` (`id_sexo`, `sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Table structure for table `sociedades`
--

DROP TABLE IF EXISTS `sociedades`;
CREATE TABLE IF NOT EXISTS `sociedades` (
  `id_sociedad` int(10) NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) NOT NULL,
  `sociedad` varchar(100) NOT NULL,
  `lema` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_sociedad`),
  UNIQUE KEY `sociedad_siglas` (`siglas`),
  UNIQUE KEY `sociedad_nombre` (`sociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sociedades`
--

INSERT INTO `sociedades` (`id_sociedad`, `siglas`, `sociedad`, `lema`, `descripcion`) VALUES
(1, 'ADAIC', 'Sociedad de Damas', 'Portadoras de Luz', 'Mujeres casadas o mayores de 35 a&ntilde;os'),
(2, 'ACAIC', 'Sociedad de Caballeros', 'Embajadores del Rey', 'Formada por hombres casados, viudos, divorciados o mayores de 35 a&ntilde;os de edad'),
(5, 'ANAIC', 'Sociedad de NiÃ±os', 'Joyas de Cristo', 'NiÃ±os');

-- --------------------------------------------------------

--
-- Table structure for table `tandas`
--

DROP TABLE IF EXISTS `tandas`;
CREATE TABLE IF NOT EXISTS `tandas` (
  `id_tanda` int(10) NOT NULL AUTO_INCREMENT,
  `tanda` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tanda`),
  UNIQUE KEY `tanda` (`tanda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tandas`
--

INSERT INTO `tandas` (`id_tanda`, `tanda`) VALUES
(1, 'Matutina');

-- --------------------------------------------------------

--
-- Table structure for table `tblalumno`
--

DROP TABLE IF EXISTS `tblalumno`;
CREATE TABLE IF NOT EXISTS `tblalumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`),
  UNIQUE KEY `nombre` (`nombre`,`paterno`,`materno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblalumno`
--

INSERT INTO `tblalumno` (`id`, `matricula`, `nombre`, `paterno`, `materno`) VALUES
(1, '13-sisn-1-056', 'Francisco', 'Brujan', 'Arias'),
(2, '12-mist-1-057', 'Clarivel Jacqueline', 'Batel', 'Ramirez');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `tipo_documento`) VALUES
(1, 'Cedula'),
(2, 'Pasaporte'),
(3, 'Ninguno');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_servicios`
--

DROP TABLE IF EXISTS `tipo_servicios`;
CREATE TABLE IF NOT EXISTS `tipo_servicios` (
  `id_tipo_servicio` int(10) NOT NULL AUTO_INCREMENT,
  `cod_tipo_servicio` varchar(6) NOT NULL,
  `tipo_servicio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`),
  UNIQUE KEY `tipo_servicio` (`tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_servicios`
--

INSERT INTO `tipo_servicios` (`id_tipo_servicio`, `cod_tipo_servicio`, `tipo_servicio`) VALUES
(1, 'CONF', 'Conferencia'),
(4, 'CONC', 'Concierto'),
(5, 'CONV', 'Convencion');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
