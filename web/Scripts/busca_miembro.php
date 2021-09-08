<?php
ini_set("display_errors","1");
error_reporting(E_ALL);
require_once "S_Conexion.php";
if (isset($_GET['term'])) {
	$buscar = $_GET['term'];
	
}else{
	$buscar='a';
}

	$personas = new Conexion();
	$sql = "CALL personas_buscar_nombre('".$buscar."')";
	$datos=$personas->consultaRetorno($sql);
	$personas->desconectar();
	
		
	//$matriculas = new stdClass();
	if($datos->num_rows > 0){
		while($row = $datos->fetch_array()){			
			$persona[] = $row['id_persona'] . '|' . $row['nombres'] . '|' . $row['apellidos'] . ' ( ALIAS: ' . $row['apodo']. ')';
		}

			echo json_encode($persona);
			//print_r($matriculas);
	}
?>