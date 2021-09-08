<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Servicios{
		// Atributos o Propiedades

		private $id_servicio;
		private $id_tipo_servicio;
		private $servicio;
		private $cod_servicio;
		private $descripcion;
		private $fecha_inicio;
		private $fecha_fin;
		private $hora_inicio;
		private $hora_fin;
		private $id_departamento;
		private $id_lider;
		private $id_iglesia;
		private $costo;
		private $con;
		private $requiere_registro;


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
			echo "Hola soy el Model de la tabla servicios";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL servicios_insertar('{$this->servicio}'
											,'{$this->id_tipo_servicio}'
											,'{$this->cod_servicio}'
											,'{$this->descripcion}'
											,'{$this->fecha_inicio}'
											,'{$this->hora_inicio}'
											,'{$this->fecha_fin}'
											,'{$this->hora_fin}'
											,'{$this->id_departamento}'
											,'{$this->id_lider}'
											,'{$this->id_iglesia}'
											,'{$this->costo}'
											,'{$this->requiere_registro}'
										)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL servicios_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 

		public function lists2(){
			$sql = "CALL servicios_mostrar2";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL servicios_modificar('{$this->id_servicio}'
											,'{$this->id_tipo_servicio}'
											,'{$this->servicio}'
											,'{$this->cod_servicio}'
											,'{$this->descripcion}'
											,'{$this->fecha_inicio}'
											,'{$this->hora_inicio}'
											,'{$this->fecha_fin}'
											,'{$this->hora_fin}'
											,'{$this->id_departamento}'
											,'{$this->id_lider}'
											,'{$this->id_iglesia}'
											,'{$this->costo}'
											
											)
					";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL servicios_eliminar('{$this->id_servicio}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL servicios_buscar('{$this->id_servicio}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>