<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Asistencia{
		// Atributos o Propiedades

		private $id_asistencia;
		private $id_servicio;
		private $id_persona;
		private $id_tanda;
		private $usuario='fbrujan';
		private $id_clasificacion;
		private $fecha;
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
			echo "Hola soy el Model de la tabla Asistencia";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL asistencia_insertar('{$this->id_servicio}'
											,'{$this->id_persona}'
											,'{$this->id_tanda}'
											,'{$this->fecha}'
											,'{$this->usuario}'
										)";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL asistencia_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL asistencia_modificar('{$this->id_asistencia}'
											 ,'{$this->id_servicio}'
											 ,'{$this->id_persona}'
											 ,'{$this->id_tanda}'
											 ,'{$this->fecha}'
											 ,'{$this->usuario}'
										)";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL asistencia_eliminar('{$this->id_asistencia}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL asistencia_buscar('{$this->id_asistencia}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

		public function add_multiple(){
			$sql = "CALL asistencia_insertar('{$this->id_servicio}'
											,'{$this->id_persona}'
											,'{$this->id_tanda}'
											,'{$this->fecha}'
											,'{$this->usuario}'
										)";
			$this->con->conectar();
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

	}
?>