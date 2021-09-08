<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Estados{
		// Atributos o Propiedades

		private $id_estado;
		private $estado;
		private $elegible_lider;		
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
			echo "Hola soy el Model de la tabla Estados";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL estado_insertar('{$this->estado}',
												'{$this->elegible_lider}'
												)";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL estado_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL estado_modificar('{$this->id_estado}',
												'{$this->estado}',
												'{$this->elegible_lider}'
												 )";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL estado_eliminar('{$this->id_estado}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL estado_buscar('{$this->id_estado}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>