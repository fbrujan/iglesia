<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Sexo{
		// Atributos o Propiedades

		private $id_sexo;
		private $sexo;
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
			echo "Hola soy el Model de la tabla Sexos";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL Sexos_insertar('{$this->sexo}', @nextID)";
			$datos=$this->con->consultaSimple($sql);
			if ($datos) {
				$sql = "SELECT @nextID";
				$datos=$this->con->consultaSimple($sql);
			}
			
			return $datos;
			$this->con->desconectar();

		}

		//READ all
		public function lists(){
			$sql = "CALL Sexos_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL Sexos_modificar('{$this->id_sexo}','{$this->sexo}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL Sexos_eliminar('{$this->id_sexo}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL Sexos_buscar('{$this->id_sexo}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);
			return $row;
		}

	}
?>