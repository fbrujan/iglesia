<?php

	$servidor 	= 	'localhost';
	$usuario	=	'aicrd';
	$clave		=	'aicrd123456';
	$db 		=	'aic';
	
	$conexion 	= 	new mysqli($servidor, $usuario, $clave, $db, 3306);
	$matricula 	= 	substr($_POST['matricula'], 0,13);
	$consulta 	= 	"SELECT matricula,nombre, paterno, materno FROM tblalumno WHERE matricula = '$matricula'";

	$result = $conexion->query($consulta);
	
	$respuesta = new stdClass();
	if($result->num_rows > 0){
		$fila = $result->fetch_array();
		$respuesta->nombre = $fila['nombre'];
		$respuesta->paterno = $fila['paterno'];
		$respuesta->materno = $fila['materno'];	
		$respuesta->matricula = $fila['matricula'];	
	}
	echo json_encode($respuesta);

?>