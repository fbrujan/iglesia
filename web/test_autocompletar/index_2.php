<?php
	$servidor 	= 	'localhost';
	$usuario	=	'aicrd';
	$clave		=	'aicrd123456';
	$db 		=	'aic';
	
	//echo $servidor;
	$conexion = new mysqli($servidor, $usuario, $clave, $db, 3306);
	$consulta = "SELECT nombre, paterno, materno FROM tblalumno WHERE matricula LIKE '%1%'";

	$result = $conexion->query($consulta);
	print_r($result->fetch_array());
?>