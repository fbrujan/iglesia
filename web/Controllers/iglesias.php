<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);


	//use Models\M_Personas				as Persona;
	//use Models\M_Servicios			as Servicio;
	//use Models\M_Lideres 				as Lider;
	//use Models\M_TipoServicio			as TipoServicio;
	//use Models\M_Cargos 				as Cargo;
	use Models\M_Iglesias 			as Iglesia;
	//use Models\M_Departamentos 		as Departamento;
	//use Models\M_Miembros 			as Miembro;
	use Models\M_Distritos 			as Distrito;
	use Models\M_Provincias			as Provincia;
	use Models\M_Paises 			as Pais;
	use Models\M_Circuitos 			as Circuito;

	class iglesias{
		//Atributos
		private $iglesia;
		private $pais;
		private $provincia;
		private $distrito;
		private $circuito;
		


		//Metodos
		//Constructor
		public function __construct(){
			$this->iglesia 		= new Iglesia;
			$this->pais 		= new Pais;
			$this->provincia 	= new Provincia;
			$this->distrito 	= new Distrito;
			$this->circuito 	= new Circuito;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del lideres";
			$datos = $this->iglesia->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['id_circuito'])) {
					$this->iglesia->set('iglesia',$_POST['iglesia']);
					$this->iglesia->set('id_circuito',$_POST['id_circuito']);
					$this->iglesia->set('id_provincia',$_POST['id_provincia']);
					$this->iglesia->set('direccion',$_POST['direccion']);
					$this->iglesia->set('telefono',$_POST['telefono']);
					$this->iglesia->set('fundador',$_POST['fundador']);
					$this->iglesia->set('fecha_fundada',$_POST['fecha_fundada']);
					$this->iglesia->set('imagen_iglesia',$_POST['imagen_iglesia']);
					$this->iglesia->set('imagen_fundador',$_POST['imagen_fundador']);
					$this->iglesia->set('imagen_pastor_actual',$_POST['imagen_pastor_actual']);
					$this->iglesia->add();
					//header('location: ' . URL . 'iglesias');	

			}
		}

		public function eliminar($id){
			$this->iglesia->set('id_iglesia', $id);
			$this->iglesia->delete();
			header('location: ' . URL . 'iglesias');
		}

		public function editar($id){			
			if (isset($_POST['id_iglesia'])) {
					$this->iglesia->set('id_iglesia',$_POST['id_iglesia']);
					$this->iglesia->set('iglesia',$_POST['iglesia']);
					$this->iglesia->set('id_circuito',$_POST['id_circuito']);
					$this->iglesia->set('id_provincia',$_POST['id_provincia']);
					$this->iglesia->set('direccion',$_POST['direccion']);
					$this->iglesia->set('telefono',$_POST['telefono']);
					$this->iglesia->set('fundador',$_POST['fundador']);
					$this->iglesia->set('fecha_fundada',$_POST['fecha_fundada']);
					$this->iglesia->set('imagen_iglesia',$_POST['imagen_iglesia']);
					$this->iglesia->set('imagen_fundador',$_POST['imagen_fundador']);
					$this->iglesia->set('imagen_pastor_actual',$_POST['imagen_pastor_actual']);
					$this->iglesia->edit();
				//header('location: ' . URL . 'iglesias');
					
			}else{
				$this->iglesia->set('id_iglesia', $id);				
				$datos = $this->iglesia->view();
				return $datos;
			}			

		}

		
		// Metodos adicionales y Necesarios y Utiles para esta aplicacion

		public function detalles($id){
			$this->iglesia->set('id_iglesia', $id);
			$datos = $this->iglesia->view();
			return $datos;
		}
		public function listar_paises(){
			$datos = $this->pais->lists();
			return $datos;
		}

		public function listar_provincias(){
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function listar_distritos(){
			$datos = $this->distrito->lists();
			return $datos;
		}

		public function listar_circuitos(){
			$datos = $this->circuito->lists();
			return $datos;
		}

	}

	$iglesias = new iglesias();

?>