-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2018 at 03:38 AM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;


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
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_buscar` (IN `_cargo` VARCHAR(100))  BEGIN
SELECT * FROM cargos WHERE  cargo LIKE  CONCAT('%',_cargo,'%') ;
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
CREATE DEFINER=`aicrd`@`%` PROCEDURE `circuitos_buscar` (IN `_id_distrito` INT, `_circuito` VARCHAR(100))  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  c.id_distrito= _id_distrito and circuito LIKE  CONCAT('%',_circuito,'%') ;
END$$

DROP PROCEDURE IF EXISTS `circuitos_eliminar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `circuitos_eliminar` (IN `_id_distrito` INT, `_id_circuito` INT)  BEGIN
DELETE FROM circuitos WHERE id_distrito = _id_distrito AND id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `circuitos_insertar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `circuitos_insertar` (IN `_id_distrito` INT, `_id_provincia` INT, `_id_provincia2` INT, `_circuito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_circuito)+1,1) INTO nextID FROM circuitos WHERE id_distrito = _id_distrito; 
INSERT INTO circuitos (id_distrito, id_provincia, id_provincia2, id_circuito, circuito) 
				VALUES(_id_distrito, _id_provincia, _id_provincia2, nextID, _circuito);
END$$

DROP PROCEDURE IF EXISTS `circuitos_mostrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `circuitos_mostrar` ()  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
			;
END$$

DROP PROCEDURE IF EXISTS `circuitos_renombrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `circuitos_renombrar` (IN `_id_distrito` INT, `_id_circuito` INT, `_circuito` VARCHAR(100))  BEGIN
UPDATE circuitos 
	SET circuito = _circuito
	WHERE id_distrito = _id_distrito AND id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `departamentos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_buscar` (IN `_departamento` VARCHAR(100))  BEGIN
SELECT * FROM departamentos WHERE  departamento LIKE  CONCAT('%',_departamento,'%') ;
END$$

DROP PROCEDURE IF EXISTS `departamentos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_eliminar` (IN `_id_departamento` INT)  BEGIN
DELETE FROM departamentos WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_insertar` (IN `_departamento` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO departamentos (departamento, descripcion) VALUES(_departamento, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `departamentos_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_modificar` (IN `_id_departamento` INT, `_departamento` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
UPDATE departamentos SET departamento = _departamento, descripcion = _descripcion WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_mostrar` ()  BEGIN
SELECT * FROM departamentos;
END$$

DROP PROCEDURE IF EXISTS `distritos_buscar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `distritos_buscar` (IN `_id_pais` INT, `_distrito` VARCHAR(100))  BEGIN
SELECT d.*, p.pais
FROM distritos d INNER JOIN paises p ON d.id_pais = p.id_pais
WHERE  d.id_pais= _id_pais AND distrito LIKE  CONCAT('%',_distrito,'%') ;
END$$

DROP PROCEDURE IF EXISTS `distritos_eliminar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `distritos_eliminar` (IN `_id_pais` INT, `_id_distrito` INT)  BEGIN
DELETE FROM distritos WHERE id_pais = _id_pais AND id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `distritos_insertar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `distritos_insertar` (IN `_id_pais` INT, `_distrito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_distrito)+1,1) INTO nextID FROM distritos WHERE id_pais = _id_pais; 
INSERT INTO distritos (id_distrito, id_pais, distrito) VALUES(nextID, _id_pais, _distrito);
END$$

DROP PROCEDURE IF EXISTS `distritos_mostrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `distritos_mostrar` ()  BEGIN
SELECT d.*, p.pais 
	FROM distritos d 
	INNER JOIN paises p ON d.id_pais = p.id_pais ;
END$$

DROP PROCEDURE IF EXISTS `distritos_renombrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `distritos_renombrar` (IN `_id_pais` INT, `_id_distrito` INT, `_distrito` VARCHAR(100))  BEGIN
UPDATE distritos 
	SET distrito = _distrito
	WHERE id_pais = _id_pais AND id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_buscar` (IN `_estado_condicion` VARCHAR(100))  BEGIN
SELECT * FROM estado_condicion WHERE  estado_condicion LIKE  CONCAT('%',_estado_condicion,'%') ;
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
SELECT * FROM estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `iglesias_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_buscar` (IN `_id_circuito` INT, `_iglesia` VARCHAR(100))  BEGIN
SELECT  d.id_pais, pa.pais, c.id_distrito, d.distrito, i.id_circuito, c.circuito,
		i.id_provincia, p.provincia, i.iglesia, i.direccion, i.telefono, i.fundador,
		i.fecha_fundada, i.imagen
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  i.id_circuito= _id_circuito and iglesia LIKE  CONCAT('%',_iglesia,'%') ;
END$$

DROP PROCEDURE IF EXISTS `iglesias_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_eliminar` (IN `_id_circuito` INT, `_id_iglesia` INT, `_id_provincia` INT)  BEGIN
DELETE FROM iglesias WHERE id_circuito = _id_circuito AND id_iglesia = _id_iglesia AND id_provincia=_id_provincia; 
END$$

DROP PROCEDURE IF EXISTS `iglesias_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_insertar` (IN `_id_circuito` INT, `_id_provincia` INT, `_iglesia` VARCHAR(100), `_direccion` VARCHAR(200), `_telefono` VARCHAR(15), `_fundador` VARCHAR(100), `_fecha_fundada` DATE, `_imagen` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_iglesia)+1,1) INTO nextID FROM iglesias; 
INSERT INTO iglesias (id_iglesia, iglesia, id_circuito, id_provincia, direccion, telefono, fundador, fecha_fundada,imagen) 
	 VALUES(nextId, _iglesia, _id_circuito, _id_provincia, _direccion, _telefono, _fundador, _fecha_fundada, _imagen);
END$$

DROP PROCEDURE IF EXISTS `iglesias_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_mostrar` ()  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, i.id_circuito, c.circuito,
		i.id_provincia, p.provincia, i.iglesia, i.direccion, i.telefono, i.fundador,
		i.fecha_fundada, i.imagen
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
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
WHERE   l.id_lider = _id_lider;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarCargo`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarCargo` (IN `_cargo` VARCHAR(100))  BEGIN
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
WHERE   c.cargo LIKE CONCAT('%', _cargo, '%') ;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarDepartamento`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarDepartamento` (IN `_depart` VARCHAR(100))  BEGIN
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
WHERE   d.departamento LIKE CONCAT('%', _depart, '%');
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
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_insertar` (IN `_id_depart` INT, `_id_miembro` INT, `_id_cargo` INT, `_fch_ini` DATE, `_fch_fin` DATE, `_vigente` INT)  BEGIN
	INSERT INTO lideres (id_departamento, id_miembro, id_cargo, fecha_inicio, fecha_fin,
 				vigente) 
	 		VALUES(_id_depart, _id_miembro, _id_cargo, _fch_ini, _fch_fin, _vigente);

END$$

DROP PROCEDURE IF EXISTS `lideres_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_modificar` (IN `_id_lider` INT, `_id_depart` INT, `_id_miembro` INT, `_id_cargo` INT, `_fch_ini` DATE, `_fch_fin` DATE, `_vigente` INT)  BEGIN
UPDATE lideres 
	SET id_departamento = _id_depart,
		id_miembro = _id_miembro,
		id_cargo = _id_cargo,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin,
		vigente= _vigente
	WHERE id_lider = _id_lider;
END$$

DROP PROCEDURE IF EXISTS `lideres_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_mostrar` ()  BEGIN
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


				;
END$$

DROP PROCEDURE IF EXISTS `miembros_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_buscar` (IN `_miembro` VARCHAR(100))  BEGIN
SELECT m.*, i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, p.nombres, p.apellidos
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
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
SELECT m.*, i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, p.nombres, p.apellidos
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				;
END$$

DROP PROCEDURE IF EXISTS `paises_buscar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_buscar` (IN `_pais` VARCHAR(100))  BEGIN
SELECT * FROM paises WHERE  pais LIKE  CONCAT('%',_pais,'%') ;
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
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_buscar` (IN `_nombres_apellidos` VARCHAR(100))  BEGIN
SELECT p.*, pr.provincia, pa.pais 
FROM personas p
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE  p.nombres LIKE  CONCAT('%',_nombres_apellidos,'%') 
	 OR p.apellidos LIKE  CONCAT('%',_nombres_apellidos,'%')
	 OR CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%',_nombres_apellidos,'%');
END$$

DROP PROCEDURE IF EXISTS `personas_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_eliminar` (IN `_id_persona` INT)  BEGIN
DELETE FROM personas WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_insertar` (IN `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_sexo` VARCHAR(10), `_tipo_documento` VARCHAR(15), `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT)  BEGIN
INSERT INTO personas (nombres, apellidos, fecha_nacimiento, telefono, direccion, sexo, 
						tipo_documento_identidad, nro_documento_identidad, imagen, id_provincia, id_pais) 
			VALUES(_nombres, _apellidos, _fch_nac, _telefono, _direccion, _sexo, 
				_tipo_documento, _nro_documento, _imagen, _id_provincia, _id_pais);
END$$

DROP PROCEDURE IF EXISTS `personas_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_modificar` (IN `_id_persona` INT, `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_sexo` VARCHAR(10), `_tipo_documento` VARCHAR(15), `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT)  BEGIN
UPDATE personas 
	SET nombres = _nombres, apellidos = _apellidos, fecha_nacimiento=_fch_nac, 
	telefono = _telefono, direccion = _direccion, sexo = _sexo, 
	tipo_documento_identidad =_tipo_documento, nro_documento_identidad = _nro_documento, 
	imagen = _imagen, id_provincia = _id_provincia, id_pais = _id_pais
WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_mostrar` ()  BEGIN
SELECT p.*, pr.provincia, pa.pais 
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	;
END$$

DROP PROCEDURE IF EXISTS `provincias_buscar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `provincias_buscar` (IN `_id_pais` INT, `_provincia` VARCHAR(100))  BEGIN
SELECT * FROM provincias WHERE  id_pais= _id_pais and provincia LIKE  CONCAT('%',_provincia,'%') ;
END$$

DROP PROCEDURE IF EXISTS `provincias_eliminar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `provincias_eliminar` (IN `_id_pais` INT, `_id_provincia` INT)  BEGIN
DELETE FROM provincias WHERE id_pais = _id_pais AND id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `provincias_insertar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `provincias_insertar` (IN `_id_pais` INT, `_provincia` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_provincia)+1,1) INTO nextID FROM provincias WHERE id_pais = _id_pais; 
INSERT INTO provincias (id_provincia, id_pais, provincia) VALUES(nextID, _id_pais, _provincia);
END$$

DROP PROCEDURE IF EXISTS `provincias_mostrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `provincias_mostrar` ()  BEGIN
SELECT * FROM provincias;
END$$

DROP PROCEDURE IF EXISTS `provincias_renombrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `provincias_renombrar` (IN `_id_pais` INT, `_id_provincia` INT, `_provincia` VARCHAR(100))  BEGIN
UPDATE provincias 
	SET provincia = _provincia
	WHERE id_pais = _id_pais AND id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_buscar` (IN `_rango` VARCHAR(100))  BEGIN
SELECT * FROM rango_ministerial WHERE  rango_ministerial LIKE  CONCAT('%',_rango,'%') ;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_eliminar` (IN `_id_rango` INT)  BEGIN
DELETE FROM rango_ministerial WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_insertar` (IN `_rango` VARCHAR(100))  BEGIN
INSERT INTO rango_ministerial (rango_ministerial) VALUES(_rango);
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_modificar` (IN `_id_rango` INT, `_rango` VARCHAR(100))  BEGIN
UPDATE rango_ministerial SET rango_ministerial = _rango WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_mostrar` ()  BEGIN
SELECT * FROM rango_ministerial;
END$$

DROP PROCEDURE IF EXISTS `sociedades_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_buscar` (IN `_sociedad` VARCHAR(100))  BEGIN
SELECT * FROM sociedades WHERE  sociedad LIKE  CONCAT('%',_sociedad,'%') ;
END$$

DROP PROCEDURE IF EXISTS `sociedades_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_eliminar` (IN `_id_sociedad` INT)  BEGIN
DELETE FROM sociedades WHERE id_sociedad = _id_sociedad;
END$$

DROP PROCEDURE IF EXISTS `sociedades_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_insertar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO sociedades (siglas, sociedad, lema, descripcion) 
			VALUES(_siglas, _sociedad, _lema, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `sociedades_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_modificar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
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

DROP PROCEDURE IF EXISTS `tipo_servicios_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_buscar` (IN `_tipo_servicio` VARCHAR(100))  BEGIN
SELECT * FROM tipo_servicios WHERE  tipo_servicio LIKE  CONCAT('%',_tipo_servicio,'%') ;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_eliminar` (IN `_id_tipo_servicio` INT)  BEGIN
DELETE FROM tipo_servicios WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_insertar` (IN `_tipo_servicio` VARCHAR(100))  BEGIN
INSERT INTO tipo_servicios (tipo_servicio) VALUES(_tipo_servicio);
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_mostrar` ()  BEGIN
SELECT * FROM tipo_servicios;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_renombrar` (IN `_id_tipo_servicio` INT, `_tipo_servicio` VARCHAR(100))  BEGIN
UPDATE tipo_servicios SET tipo_servicio = _tipo_servicio WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--
-- Creation: Apr 28, 2018 at 09:38 PM
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int(10) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `cargo` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `cargo`) VALUES
(1, 'Presidente'),
(2, 'Secretario/a');

-- --------------------------------------------------------

--
-- Table structure for table `circuitos`
--
-- Creation: Apr 28, 2018 at 09:37 PM
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
(1, 1, 'San Cristobal Centro', 1, NULL),
(1, 2, 'San Cristobal Oeste', 1, NULL),
(1, 3, 'Haina', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--
-- Creation: Apr 28, 2018 at 09:37 PM
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` int(10) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `departamento` (`departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `departamento`, `descripcion`) VALUES
(1, 'Damas', 'Mujeres Casadas o mayores de 35 anos'),
(2, 'Caballeros', 'Mujeres Casadas o mayores de 35 anos'),
(3, 'Escuela Biblica', 'Educacion Cristiana');

-- --------------------------------------------------------

--
-- Table structure for table `distritos`
--
-- Creation: Apr 28, 2018 at 09:39 PM
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
-- Table structure for table `estado_condicion`
--
-- Creation: Apr 28, 2018 at 09:51 PM
--

DROP TABLE IF EXISTS `estado_condicion`;
CREATE TABLE IF NOT EXISTS `estado_condicion` (
  `id_estado_condicion` int(10) NOT NULL AUTO_INCREMENT,
  `estado_condicion` varchar(100) NOT NULL,
  `elegible_lider` int(1) NOT NULL,
  PRIMARY KEY (`id_estado_condicion`),
  UNIQUE KEY `estado` (`estado_condicion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado_condicion`
--

INSERT INTO `estado_condicion` (`id_estado_condicion`, `estado_condicion`, `elegible_lider`) VALUES
(1, 'Bautizado', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iglesias`
--
-- Creation: Apr 28, 2018 at 09:31 PM
--

DROP TABLE IF EXISTS `iglesias`;
CREATE TABLE IF NOT EXISTS `iglesias` (
  `id_iglesia` int(10) NOT NULL,
  `iglesia` varchar(100) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fundador` varchar(100) DEFAULT NULL,
  `fecha_fundada` date DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_iglesia`),
  UNIQUE KEY `iglesia` (`iglesia`,`id_circuito`,`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iglesias`
--

INSERT INTO `iglesias` (`id_iglesia`, `iglesia`, `id_circuito`, `id_provincia`, `direccion`, `telefono`, `fundador`, `fecha_fundada`, `imagen`) VALUES
(1, 'Iglesia Evangelica Fraternal', 1, 1, 'Calle Principal No. 18, Los Molina', '8095287401', 'Federico Claudio Alvarez', '1990-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lideres`
--
-- Creation: Apr 29, 2018 at 02:29 AM
-- Last update: Apr 29, 2018 at 03:14 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lideres`
--

INSERT INTO `lideres` (`id_lider`, `id_departamento`, `id_miembro`, `id_cargo`, `fecha_inicio`, `fecha_fin`, `vigente`) VALUES
(1, 1, 1, 1, '2018-01-01', '2019-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `miembros`
--
-- Creation: Apr 28, 2018 at 09:30 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miembros`
--

INSERT INTO `miembros` (`id_miembro`, `id_persona`, `id_iglesia`, `id_sociedad`, `id_estado_condicion`, `fecha_conversion`, `fecha_bautismo`, `id_rango_ministerial`, `fecha_inicio`, `fecha_fin`, `ultimo_registro`) VALUES
(1, 1, 1, 1, 1, '1990-03-19', '1992-10-19', 1, '2018-04-28', '3333-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--
-- Creation: Apr 27, 2018 at 07:42 PM
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `id_pais` int(10) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id_pais`, `pais`) VALUES
(1, 'Republica Dominicana');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--
-- Creation: Apr 28, 2018 at 09:44 PM
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_provincia` int(10) NOT NULL,
  `id_pais` int(10) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `tipo_documento_identidad` varchar(15) DEFAULT NULL,
  `nro_documento_identidad` varchar(20) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `persona` (`nombres`,`apellidos`,`id_provincia`,`id_pais`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id_persona`, `nombres`, `apellidos`, `fecha_nacimiento`, `telefono`, `direccion`, `id_provincia`, `id_pais`, `sexo`, `tipo_documento_identidad`, `nro_documento_identidad`, `imagen`) VALUES
(1, 'Francisco', 'Brujan Arias', '1977-04-06', '8094232642', 'calle 19 Marzo No. 16, Los Molina', 1, 1, 'Masculino', 'Cedula', '002-0097492-1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--
-- Creation: Apr 28, 2018 at 09:33 PM
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE IF NOT EXISTS `provincias` (
  `id_pais` int(10) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE KEY `provincia` (`id_pais`,`provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id_pais`, `id_provincia`, `provincia`) VALUES
(1, 3, 'Puerto Plata'),
(1, 1, 'San Cristobal'),
(1, 6, 'San Pedro Macoris'),
(1, 2, 'Santiago'),
(1, 4, 'Santo Domingo Este'),
(1, 5, 'Santo Domingo Oeste');

-- --------------------------------------------------------

--
-- Table structure for table `rango_ministerial`
--
-- Creation: Apr 28, 2018 at 09:34 PM
--

DROP TABLE IF EXISTS `rango_ministerial`;
CREATE TABLE IF NOT EXISTS `rango_ministerial` (
  `id_rango` int(10) NOT NULL AUTO_INCREMENT,
  `rango_ministerial` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rango`),
  UNIQUE KEY `rango_ministerial` (`rango_ministerial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rango_ministerial`
--

INSERT INTO `rango_ministerial` (`id_rango`, `rango_ministerial`) VALUES
(1, 'Miembro Laico');

-- --------------------------------------------------------

--
-- Table structure for table `sociedades`
--
-- Creation: Apr 28, 2018 at 09:36 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sociedades`
--

INSERT INTO `sociedades` (`id_sociedad`, `siglas`, `sociedad`, `lema`, `descripcion`) VALUES
(1, 'ADAIC', 'Sociedad de Damas', 'Portadoras de Luz', 'Mujeres casadas o mayores de 35 anios');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_servicios`
--
-- Creation: Apr 28, 2018 at 09:53 PM
--

DROP TABLE IF EXISTS `tipo_servicios`;
CREATE TABLE IF NOT EXISTS `tipo_servicios` (
  `id_tipo_servicio` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_servicio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`),
  UNIQUE KEY `tipo_servicio` (`tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_servicios`
--

INSERT INTO `tipo_servicios` (`id_tipo_servicio`, `tipo_servicio`) VALUES
(4, 'Concierto'),
(3, 'Conferencia'),
(1, 'Oraciones'),
(2, 'Taller');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
