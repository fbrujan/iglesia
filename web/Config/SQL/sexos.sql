DROP PROCEDURE IF EXISTS sexos_insertar;
DELIMITER $$
CREATE PROCEDURE sexos_insertar (IN _sexo varchar(100), 
									OUT nextID INT)
BEGIN

SELECT IFNULL(MAX(id_sexo)+1,1) INTO nextID FROM sexos; 
INSERT INTO sexos (id_sexo, sexo) VALUES(nextID,_sexo);

END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sexos_eliminar;
DELIMITER $$
CREATE PROCEDURE sexos_eliminar (IN _id_sexo INT)
BEGIN
DELETE FROM sexos WHERE id_sexo = _id_sexo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sexos_modificar;
DELIMITER $$
CREATE PROCEDURE sexos_modificar (IN _id_sexo INT, _sexo VARCHAR(100))
BEGIN
UPDATE sexos SET sexo = _sexo WHERE id_sexo = _id_sexo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sexos_mostrar;
DELIMITER $$
CREATE PROCEDURE sexos_mostrar ()
BEGIN
SELECT * FROM sexos;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sexos_buscar;
DELIMITER $$
CREATE PROCEDURE sexos_buscar (IN _id_sexo INT)
BEGIN
SELECT * FROM sexos WHERE  id_sexo =  _id_sexo ;
END $$
DELIMITER ;
