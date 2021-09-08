<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Circuitos as Circuito;
	use Models\M_Distritos as Distrito;
	use Models\M_Provincias as Provincia;

	class circuitos{
		//Atributos
		private $circuito;
		private $distrito;
		private $provincia;

		//Metodos
		//Constructor
		public function __construct(){
			$this->circuito = new Circuito;
			$this->distrito = new Distrito;
			$this->provincia = new Provincia;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del circuitos";
			$datos = $this->circuito->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['circuito'])) {
				$this->circuito->set('circuito',$_POST['circuito']);
				$this->circuito->set('id_distrito',$_POST['id_distrito']);
				$this->circuito->set('id_provincia',$_POST['id_provincia']);
				$this->circuito->add();
				//header('location: ' . URL . 'circuitos');
			}
		}

		public function eliminar($id){
			$this->circuito->set('id_circuito', $id);
			$this->circuito->delete();
			header('location: ' . URL . 'circuitos');
		}

		public function editar($id){			
			if (isset($_POST['circuito'])) {
				$this->circuito->set('circuito',$_POST['circuito']);
				$this->circuito->set('id_circuito',$_POST['id_circuito']);
				$this->circuito->set('id_distrito',$_POST['id_distrito']);
				$this->circuito->edit();
				header('location: ' . URL . 'circuitos');
			}else{
				$this->circuito->set('id_circuito', $id);				
				$datos = $this->circuito->view();
				return $datos;
			}

		}

		// Metodos adicionales y Necesarios y Utiles para esta aplicacion

		public function listar_provincias(){
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function listar_provincias2(){
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function listar_distritos(){
			$datos = $this->distrito->lists();
			return $datos;
		}

	}

	$circuitos = new circuitos();

?>