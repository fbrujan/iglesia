<?php namespace Models;
	// DEfinir la Clase
	class M_Default{
		// Propiedades o Atributos
		private $id;
		private $nombre;
		// Metodos
		//Metodo Constructor
		public function __construct(){
			$this->con = new Conexion;
		}

		// Metodos Get y Set

		public function set($atributo, $valor){
			$this->$atributo = $valor;
		}

		public function get($atributo){
			return $this->$atributo;
		}

		// Metodos CRUDS
		

	}
?>