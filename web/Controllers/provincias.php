<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Provincias as Provincia;
	use Models\M_Paises as Pais;

	class provincias{
		//Atributos
		private $provincia;
		private $pais;

		//Metodos
		//Constructor
		public function __construct(){
			$this->provincia = new Provincia;
			$this->pais = new Pais;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del provincias";
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['provincia'])) {
				$this->provincia->set('provincia',$_POST['provincia']);
				$this->provincia->set('ciudad_cabecera',$_POST['ciudad_cabecera']);
				$this->provincia->set('id_pais',$_POST['id_pais']);
				$this->provincia->add();
				//header('location: ' . URL . 'provincias');
			}
		}

		public function eliminar($id){
			$this->provincia->set('id_provincia', $id);
			$this->provincia->delete();
			header('location: ' . URL . 'provincias');
		}

		public function editar($id){			
			if (isset($_POST['provincia'])) {
				$this->provincia->set('id_provincia', $id);
				$this->provincia->set('provincia',$_POST['provincia']);
				$this->provincia->set('ciudad_cabecera',$_POST['ciudad_cabecera']);
				$this->provincia->set('id_pais',$_POST['id_pais']);
				$this->provincia->edit();
				//header('location: ' . URL . 'provincias');
			}else{
				$this->provincia->set('id_provincia', $id);				
				$datos = $this->provincia->view();
				return $datos;
			}

		}

		public function listar_paises(){
			$datos = $this->pais->lists();
			return $datos;
		}

	}

	$provincias = new provincias();

?>