<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Provincias{
		// Atributos o Propiedades

		private $id_provincia;
		private $provincia;
		private $ciudad_cabecera;
		private $id_pais;
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
			echo "Hola soy el Model de la tabla Provincias";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL provincias_insertar('{$this->provincia}'
												,'{$this->ciudad_cabecera}'
												,'{$this->id_pais}'
											)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL provincias_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL provincias_modificar('{$this->id_provincia}'
												,'{$this->provincia}'
												,'{$this->ciudad_cabecera}'											
												
											)
					";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL provincias_eliminar('{$this->id_provincia}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL provincias_buscar('{$this->id_provincia}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>