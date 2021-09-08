<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_RangoMinisterial{
		// Atributos o Propiedades

		private $id_rango;
		private $rango_ministerial;
		private $cod_rango;
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
			echo "Hola soy el Model de la tabla Rango Ministerial";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL rango_ministerial_insertar('{$this->rango_ministerial}','{$this->cod_rango}')";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL rango_ministerial_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL rango_ministerial_modificar('{$this->id_rango}','{$this->rango_ministerial}','{$this->cod_rango}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL rango_ministerial_eliminar('{$this->id_rango}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL rango_ministerial_buscar('{$this->id_rango}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>