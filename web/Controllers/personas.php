<?php namespace Controllers;
//ini_set("display_errors","1");
//error_reporting(E_ALL);

	use Models\M_Personas			as Persona;
	//use Models\M_Servicios			as Servicio;
	//use Models\M_Lideres 			as Lider;
	//use Models\M_TipoServicio		as TipoServicio;
	//use Models\M_Cargos 			as Cargo;
	//use Models\M_Iglesias 			as Iglesia;
	//use Models\M_Departamentos 		as Departamento;
	//use Models\M_Miembros 		as Miembro;
	//use Models\M_Distritos 		as Distrito;
	use Models\M_Provincias			as Provincia;
	use Models\M_Paises 			as Pais;

	class personas{
		//Atributos
		private $persona;
		private $provincia;
		private $pais;


		//Metodos
		//Constructor
		public function __construct(){
			$this->persona 		= new Persona;
			$this->provincia 	= new Provincia;
			$this->pais 		= new Pais;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del lideres";
			$datos = $this->persona->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['nombres'])) {
					$this->persona->set('nombres',$_POST['nombres']);
					$this->persona->set('apellidos',$_POST['apellidos']);
					$this->persona->set('fecha_nacimiento',$_POST['fecha_nacimiento']);
					$this->persona->set('telefono',$_POST['telefono']);
					$this->persona->set('direccion',$_POST['direccion']);
					$this->persona->set('id_provincia',$_POST['id_provincia']);
					$this->persona->set('id_pais',$_POST['id_pais']);
					$this->persona->set('id_sexo',$_POST['id_sexo']);
					$this->persona->set('id_tipo_documento',$_POST['id_tipo_documento']);
					$this->persona->set('nro_documento_identidad',$_POST['nro_documento_identidad']);
					$this->persona->set('imagen',$_POST['imagen']);
					$this->persona->set('apodo',$_POST['apodo']);
					$this->persona->set('id_clasificacion',$_POST['id_clasificacion']);
					$this->persona->set('id_estado_civil',$_POST['id_estado_civil']);
					
					$datos=$this->persona->add();

				//	return $datos;
					
				//	header('location: ' . URL . 'personas/agregar');				
			}
		}

		public function eliminar($id){
			$this->persona->set('id_persona', $id);
			$this->persona->delete();
			header('location: ' . URL . 'personas');
		}

		public function editar($id){			
			if (isset($_POST['id_persona'])) {
					$this->persona->set('id_persona',$_POST['id_persona']);
					$this->persona->set('nombres',$_POST['nombres']);
					$this->persona->set('apellidos',$_POST['apellidos']);
					$this->persona->set('fecha_nacimiento',$_POST['fecha_nacimiento']);
					$this->persona->set('telefono',$_POST['telefono']);
					$this->persona->set('direccion',$_POST['direccion']);
					$this->persona->set('id_provincia',$_POST['id_provincia']);
					$this->persona->set('id_pais',$_POST['id_pais']);
					$this->persona->set('id_sexo',$_POST['id_sexo']);
					$this->persona->set('id_tipo_documento',$_POST['id_tipo_documento']);
					$this->persona->set('nro_documento_identidad',$_POST['nro_documento_identidad']);
					$this->persona->set('imagen',$_POST['imagen']);
					$this->persona->set('apodo',$_POST['apodo']);
					$this->persona->set('id_clasificacion',$_POST['id_clasificacion']);
					$this->persona->set('id_estado_civil',$_POST['id_estado_civil']);
					$this->persona->edit();
				header('location: ' . URL . 'personas');
			}else{
				$this->persona->set('id_persona', $id);				
				$datos = $this->persona->view();
				return $datos;
			}			

		}

		public function detalles($id){
			$this->persona->set('id_persona', $id);
			$datos = $this->persona->view();
			return $datos;
		}

		// Metodos adicionales y Necesarios y Utiles para esta aplicacion

		public function listar_paises(){
			$datos = $this->pais->lists();
			return $datos;
		}

		public function listar_provincias(){
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function listar_sexos(){
			$datos = $this->personas->sexos_lists();
			return $datos;
		}

		public function listar_tiposDocumento(){
			$datos = $this->personas->tiposDocumento_lists();
			return $datos;
		}

		public function listar_estadoCivil(){
			$datos = $this->personas->estadoCivil_lists();
			return $datos;
		}


	}

	$personas = new personas();

?>