<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Personas{
		// Atributos o Propiedades

		private $id_persona;
		private $nombres;
		private $apellidos;
		private $fecha_nacimiento;
		private $telefono;
		private $direccion;
		private $id_provincia;
		private $id_pais;
		private $id_sexo;
		private $id_tipo_documento;
		private $nro_documento_identidad;
		private $imagen;
		private $apodo;
		private $id_estado_civil;
		private $id_clasificacion;
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
			echo "Hola soy el Model de la tabla personas";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql  =  "CALL personas_insertar('{$this->nombres}'
											,'{$this->apellidos}'
											,'{$this->fecha_nacimiento}'
											,'{$this->telefono}'
											,'{$this->direccion}'
											,'{$this->id_sexo}'
											,'{$this->id_tipo_documento}'
											,'{$this->nro_documento_identidad}'
											,'{$this->imagen}'
											,'{$this->id_provincia}'
											,'{$this->id_pais}'
											,'{$this->apodo}'
											,'{$this->id_estado_civil}'
											,'{$this->id_clasificacion}'
											,@nextID
										)
					";
			$datos=$this->con->consultaSimple($sql);
			if ($datos) {
				$sql = "SELECT @nextID";
				$datos=$this->con->consultaSimple($sql);	
				return $datos;					
			}else{
				echo 'No se pudo inserter persona';
			}
			

			
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL personas_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL personas_modificar( '{$this->id_persona}'
											,'{$this->nombres}'
											,'{$this->apellidos}'
											,'{$this->fecha_nacimiento}'
											,'{$this->telefono}'
											,'{$this->direccion}'
											,'{$this->id_sexo}'
											,'{$this->id_tipo_documento}'
											,'{$this->nro_documento_identidad}'
											,'{$this->imagen}'
											,'{$this->id_provincia}'
											,'{$this->id_pais}'
											,'{$this->apodo}'
											,'{$this->id_estado_civil}'
											,'{$this->id_clasificacion}'
											)
					";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL personas_eliminar('{$this->id_persona}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL personas_buscar('{$this->id_persona}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

		// Otras Consultas
		public function sexos_lists(){
			$sql = "SELECT * FROM sexos ORDER BY sexo ASC";
			$datos=$this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;
		}

		public function estadoCivil_lists(){
			$sql = "SELECT * FROM estado_civil ORDER BY estado_civil ASC";
			$datos=$this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;
		}

		public function tiposDocumento_lists(){
			$sql = "SELECT * FROM tipos_documento ORDER BY tipo_documento ASC";
			$datos=$this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;
		}

	}
?>