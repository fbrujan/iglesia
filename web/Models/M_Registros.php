<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Registros{
		// Atributos o Propiedades

		private $id_registro;
		private $id_servicio;
		private $id_distrito;
		private $id_circuito;
		private $id_iglesia;
		private $id_persona;
		private $es_miembro_iglesia;
		private $es_lider;
		private $es_miembro_ministerial;
		private $es_pastor;
		private $es_presbitero;
		private $es_delegado;
		private $es_visita;
		private $trabaja_comite;
		private $es_exonerado;
		//private $fecha_registro;
		//private $hora_registro;
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
			echo "Hola soy el Model de la tabla miembros";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql  =  "CALL registro_insertar('{$this->id_servicio}'
											,'{$this->id_distrito}'
											,'{$this->id_circuito}'
											,'{$this->id_iglesia}'
											,'{$this->id_persona}'
											,'{$this->es_pastor}'
											,'{$this->es_delegado}'
											,'{$this->es_presbitero}'
											,'{$this->trabaja_comite}'
											,'{$this->es_visita}'
											,'{$this->es_exonerado}'
											,'{$this->es_lider}'
											,'{$this->es_miembro_ministerial}'
											,'{$this->es_miembro_iglesia}'											
										)
					";
			$datos=$this->con->consultaSimple($sql);
			return $datos;
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL registro_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			return $datos;
			$this->con->desconectar();
									
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL registro_modificar( '{$this->id_registro}'
											,'{$this->id_miembro}'
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
			
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL registro_eliminar('{$this->id_registro}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){

			$sql = "CALL registro_buscar('{$this->id_registro}')";
			$datos = $this->con->consultaRetorno($sql);			
			$row = mysqli_fetch_assoc($datos);			
			return $row;
			$this->con->desconectar();
		}

		// Otras Consultas
		
	}
?>