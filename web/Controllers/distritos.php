<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Distritos as Distrito;
	use Models\M_Paises as Pais;

	class distritos{
		//Atributos
		private $distrito;
		private $pais;

		//Metodos
		//Constructor
		public function __construct(){
			$this->distrito = new Distrito;
			$this->pais = new Pais;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador de distritos";
			$datos = $this->distrito->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['distrito'])) {
				$this->distrito->set('distrito',$_POST['distrito']);
				$this->distrito->set('id_pais',$_POST['id_pais']);
				$this->distrito->add();
				header('location: ' . URL . 'distritos');
			}
		}

		public function eliminar($id){
			$this->distrito->set('id_distrito', $id);
			$this->distrito->delete();
			header('location: ' . URL . 'distritos');
		}

		public function editar($id){			
			if (isset($_POST['distrito'])) {
				$this->distrito->set('id_distrito', $id);
				$this->distrito->set('distrito',$_POST['distrito']);
				$this->distrito->edit();
				header('location: ' . URL . 'distritos');
				

			}else{
				$this->distrito->set('id_distrito', $id);				
				$datos = $this->distrito->view();
				return $datos;
			}

		}

		public function listar_paises(){
			$datos = $this->pais->lists();
			return $datos;
		}

	}

	$distritos = new distritos();

?>