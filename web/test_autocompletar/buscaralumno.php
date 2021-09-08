<?php

	$servidor 	= 	'localhost';
	$usuario	=	'aicrd';
	$clave		=	'aicrd123456';
	$db 		=	'aic';

	$conexion 	= 	new mysqli($servidor, $usuario, $clave, $db, 3306);
	$matricula 		= 	$_GET['term'];
	$consulta	= 	"SELECT matricula,nombre,paterno, materno 
					FROM tblalumno 
					WHERE CONCAT(matricula,' ',nombre,' ',paterno,' ',materno) LIKE '%$matricula%'";

	$result 	= 	$conexion->query($consulta);

	//$matriculas = new stdClass();
	if($result->num_rows > 0){
		while($fila = $result->fetch_array()){
			//$matriculas[] = $fila['matricula'];
			$matriculas[] = $fila['matricula'] . '|'.$fila['nombre']. '|' . $fila['paterno']. '|' . $fila['materno'];
			
			

		}

	echo json_encode($matriculas);
	//print_r($matriculas);
	}
?>