<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Cargos{
		// Atributos o Propiedades

		private $id_cargo;
		private $cargo;
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
			echo "Hola soy el Model de la tabla Cargos";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL cargos_insertar('{$this->cargo}')";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL cargos_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL cargos_renombrar('{$this->id_cargo}','{$this->cargo}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL cargos_eliminar('{$this->id_cargo}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL cargos_buscar('{$this->id_cargo}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>