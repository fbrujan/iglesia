<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Lideres{
		// Atributos o Propiedades

		private $id_lider;
		private $id_cargo;
		private $id_departamento;
		private $id_miembro;
		private $id_distrito;
		private $fecha_ini;
		private $fecha_fin;
		private $nombre;

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
			echo "Hola soy el Model de la tabla lideres";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL lideres_insertar(	 '{$this->id_departamento}'
											,'{$this->id_miembro}'
											,'{$this->id_cargo}'
											,'{$this->fecha_ini}'
											,'{$this->fecha_fin}'
										)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL lideres_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 

		//READ all
		public function listsAll(){
			$sql = "CALL lideres_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL lideres_modificar(  '{$this->id_lider}'
											,'{$this->id_miembro}'
											,'{$this->id_departamento}'
											,'{$this->id_cargo}'
											,'{$this->fecha_ini}'
											,'{$this->fecha_fin}'
											)
					";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL lideres_eliminar('{$this->id_lider}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL lideres_buscar('{$this->id_lider}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

		public function buscar_liderNombre(){
			$sql = "CALL lideres_buscarNombre('{$this->nombre}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

		public function cargosMiembro(){
			$sql = "CALL lideres_buscarNombre('{$this->nombre}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			//$row = mysqli_fetch_assoc($datos);			
			//return $row;
			return $datos;
		}
	}
?>