<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Circuitos{
		// Atributos o Propiedades

		private $id_circuito;
		private $circuito;
		private $id_provincia;
		private $id_provincia2='NULL';
		private $id_distrito;
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
			echo "Hola soy el Model de la tabla Circuitos";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL circuitos_insertar('{$this->id_distrito}'
												,'{$this->id_provincia}'
												,'{$this->circuito}'
											)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL circuitos_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL circuitos_renombrar('{$this->id_distrito}','{$this->id_circuito}','{$this->circuito}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL circuitos_eliminar('{$this->id_circuito}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL circuitos_buscar('{$this->id_circuito}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>