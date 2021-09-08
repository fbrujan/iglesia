<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Miembros{
		// Atributos o Propiedades

		private $id_miembro;
		private $id_persona;
		private $id_iglesia;
		private $id_sociedad;
		private $id_estado_condicion;
		private $fecha_conversion;
		private $fecha_bautismo;
		private $id_rango_ministerial;
		private $fecha_inicio;
		private $fecha_fin;
		private $con;
		private $fecha_creacion;


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
			echo "Hola soy el Model de la tabla miembros";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql  =  "CALL miembros_insertar('{$this->id_persona}'
											,'{$this->id_iglesia}'
											,'{$this->id_sociedad}'
											,'{$this->id_estado_condicion}'
											,'{$this->fecha_conversion}'
											,'{$this->fecha_bautismo}'
											,'{$this->id_rango_ministerial}'
											,'{$this->fecha_inicio}'
											,'{$this->fecha_fin}'
										)
					";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL miembros_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 

		public function listsMiembros(){
			$sql = "CALL miembros_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL miembros_modificar( '{$this->id_miembro}'
											,'{$this->id_persona}'
											,'{$this->id_iglesia}'
											,'{$this->id_sociedad}'
											,'{$this->id_estado_condicion}'
											,'{$this->fecha_conversion}'
											,'{$this->fecha_bautismo}'
											,'{$this->id_rango_ministerial}'
											,'{$this->fecha_inicio}'
											,'{$this->fecha_fin}'
											,'{$this->fecha_creacion}'
											)
					";
			$this->con->conectar();
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL miembros_eliminar('{$this->id_miembro}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){

			$sql = "CALL miembros_buscar('{$this->id_miembro}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

		// Otras Consultas

		public function BuscaIdPersona($nombres,$apellidos){
			$sql = "SELECT * FROM personas WHERE nombres='" . $nombres . "' AND apellidos='" . $apellidos . "'" ;
			$datos = $this->con->consultaSimple($sql);			
			$row = mysqli_fetch_assoc($datos);			
			return $row;
			$this->con->desconectar();
		}
		
	}
?>