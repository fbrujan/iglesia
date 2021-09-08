<?php
ini_set("display_errors","1");
error_reporting(E_ALL);
class Conexion{
		// Atributos 
		private $datos = array(
			"host"	=>	"localhost",
			"user"	=>	"irefugio5to",
			"pass"	=>	"irefugio5to123",
			"db"	=>	"iglesias"
		);

		private $con;

		// Metodos
		// Metodo Constructor

		public function __construct(){
			$this->con 	= new \mysqli(
							$this->datos['host'],
							$this->datos['user'],
							$this->datos['pass'],
							$this->datos['db']
						);
		}


		public function consultaRetorno($sql){
			$datos	=	$this->con->query($sql);
			print $this->con->error;
			return $datos;
			//echo "Hola";
		}

		public function desconectar(){
			\mysqli_close($this->con);
		}		
	}
?>