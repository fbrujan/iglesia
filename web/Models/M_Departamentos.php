<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Departamentos{
		// Atributos o Propiedades

		private $id_departamento;
		private $departamento;
		private $cod_departamento;
		private $descripcion;
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
			echo "Hola soy el Model de la tabla Departamentos";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL departamentos_insertar('{$this->departamento}','{$this->descripcion}' )";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL departamentos_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL departamentos_modificar('{$this->id_departamento}','{$this->departamento}','{$this->descripcion}' )";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL departamentos_eliminar('{$this->id_departamento}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL departamentos_buscar('{$this->id_departamento}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>
