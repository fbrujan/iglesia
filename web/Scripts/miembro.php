<?php
ini_set("display_errors","1");
error_reporting(E_ALL);
require_once "S_Conexion.php";	

		$persona = new Conexion();
		$sql = "CALL personas_buscar('".$_POST['id_persona'] ."')";
		$datos=$persona->consultaRetorno($sql);
		$persona->desconectar();		

	$respuesta = new stdClass();
	if($datos->num_rows > 0){
		$fila = $datos->fetch_array();
		$respuesta->id_persona = $fila['id_persona'];
		$respuesta->nombres = $fila['nombres'];
		$respuesta->apellidos = $fila['apellidos'];
		$respuesta->telefono = $fila['telefono'];
		$respuesta->apodo = $fila['apodo'];
		$respuesta->id_sexo = $fila['id_sexo'];
		$respuesta->direccion = $fila['direccion'];
		$respuesta->nro_documento = $fila['nro_documento_identidad'];
		$respuesta->fchNacimiento = $fila['fecha_nacimiento'];
		
	}
	echo json_encode($respuesta);

?>