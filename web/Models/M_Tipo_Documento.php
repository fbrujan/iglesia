<?php namespace Models;
	// DEfinir la Clase
	class M_Tipo_Documento{
		// Propiedades o Atributos
		private $id_tipo_documento;
		private $tipo_documento;
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
		public function lists(){ // READ
			$sql = "SELECT * FROM tipo_documento";
			$datos = $this->con->consultaRetorno($sql);
			//$row = mysqli_fetch_assoc($datos);
			return $datos;
		}

		public function view(){ //SHOW
			$sql = "SELECT * FROM tipo_documento WHERE id_tipo_documento = '{$this->id_tipo_documento}'";
			$datos = $this->con->consultaRetorno($sql);
			$row = mysqli_fetch_assoc($datos);
			return $row;
		}

		public function delete(){
			$sql = "DELETE FROM tipo_documento WHERE id_tipo_documento = '{$this->id_tipo_documento}'";
			$this->con->consultaSimple($sql);
		}

		public function edit(){
			$sql = "UPDATE tipo_documento SET tipo_documento = '{$this->tipo_documento}' WHERE id_tipo_documento ='{$this->id_tipo_documento}'";
			$this->con->consultaSimple($sql);
		}

		public function add(){
			$sql = "INSERT INTO tipo_documento(id_tipo_documento,tipo_documento) VALUES(null,'{$this->tipo_documento}')";
			$this->con->consultaSimple($sql);
		}

	}
?>