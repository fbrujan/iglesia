<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);

	class M_Sociedades{
		// Atributos o Propiedades

		private $id_sociedad;
		private $siglas;
		private $sociedad;		
		private $lema;
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
			echo "Hola soy el Model de la tabla Sociedades";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL sociedades_insertar('{$this->siglas}',
												'{$this->sociedad}',
												'{$this->lema}',
												'{$this->descripcion}')";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL sociedades_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL sociedades_modificar('{$this->siglas}',
												'{$this->sociedad}',
												'{$this->lema}',
												'{$this->descripcion}',
												'{$this->id_sociedad}' )";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL sociedades_eliminar('{$this->id_sociedad}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL sociedades_buscar('{$this->id_sociedad}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>