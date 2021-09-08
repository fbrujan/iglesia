<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_ComiteTemporero{
		// Atributos o Propiedades

		private $id_comite_temporero;
		private $comite_temporero;
		private $con;


		// Metodos
		//Metodo Constructor

		
		public function __construct(){
			$this->con = new Conexion();
		}

		// Metodos SET y GET
		public function set($atributo, $valor){
			$this->$atributo = $valor;
		}

		public function get($atributo){
			return $this->$atributo;
		}

		//Metodo para probar que funciona
		public function hola(){
			echo "Hola soy el Model de la tabla ComiteTemporero";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL comite_temporero_insertar('{$this->comite_temporero}')";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL comite_temporero_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL comite_temporero_modificar('{$this->id_comite_temporero}','{$this->comite_temporero}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL comite_temporero_eliminar('{$this->id_comite_temporero}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL comite_temporero_buscar('{$this->id_comite_temporero}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>