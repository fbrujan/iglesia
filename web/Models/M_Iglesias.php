<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Iglesias{
		// Atributos o Propiedades

		private $id_iglesia;
		private $iglesia;
		private $id_circuito;
		private $id_provincia;
		private $direccion;
		private $telefono;
		private $fundador;
		private $fecha_fundada;
		private $imagen_iglesia;
		private $imagen_fundador;
		private $imagen_pastor_actual;
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

			
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql  =  "CALL iglesias_insertar('{$this->iglesia}'
											,'{$this->id_circuito}'
											,'{$this->id_provincia}'
											,'{$this->direccion}'
											,'{$this->telefono}'
											,'{$this->fundador}'
											,'{$this->fecha_fundada}'
											,'{$this->imagen_iglesia}'
											,'{$this->imagen_fundador}'
											,'{$this->imagen_pastor_actual}'
										)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL iglesias_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			return $datos;	
			$this->con->desconectar();					
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL iglesias_modificar('{$this->id_iglesia}'
											,'{$this->iglesia}'
											,'{$this->id_circuito}'
											,'{$this->id_provincia}'
											,'{$this->direccion}'
											,'{$this->telefono}'
											,'{$this->fundador}'
											,'{$this->fecha_fundada}'
											,'{$this->imagen_iglesia}'
											,'{$this->imagen_fundador}'
											,'{$this->imagen_pastor_actual}'
											)
					";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL iglesias_eliminar('{$this->id_iglesia}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL iglesias_buscar('{$this->id_iglesia}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
			$this->con->desconectar();
		}


	}
?>