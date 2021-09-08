<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Paises as Pais;

	class paises{
		//Atributos
		private $pais;

		//Metodos
		//Constructor
		public function __construct(){
			$this->pais = new Pais;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del paises";
			$datos = $this->pais->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['pais'])) {
				$this->pais->set('pais',$_POST['pais']);
				$this->pais->add();
				header('location: ' . URL . 'paises');
			}
		}

		public function eliminar($id){
			$this->pais->set('id_pais', $id);
			$this->pais->delete();
			header('location: ' . URL . 'paises');

		}

		public function editar($id){			
			if (isset($_POST['pais'])) {
				$this->pais->set('id_pais', $id);
				$this->pais->set('pais',$_POST['pais']);
				$this->pais->edit();
				header('location: ' . URL . 'paises');
			}else{
				$this->pais->set('id_pais', $id);
				$datos = $this->pais->view();
				return $datos;
			}

		}

	}

	$paises = new paises();

?>