<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Tipo_Servicio{
		// Atributos o Propiedades

		private $id_tipo_servicio;
		private $cod_tipo_servicio;
		private $tipo_servicio;		
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
			echo "Hola soy el Model de la tabla TiposServicio";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL tipo_servicios_insertar('{$this->tipo_servicio}','{$this->cod_tipo_servicio}'
												)";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL tipo_servicios_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL tipo_servicios_modificar('{$this->id_tipo_servicio}',
												'{$this->cod_tipo_servicio}',
												'{$this->tipo_servicio}'
												 )";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL tipo_servicios_eliminar('{$this->id_tipo_servicio}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL tipo_servicios_buscar('{$this->id_tipo_servicio}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>