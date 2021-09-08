<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_RangoMinisterial as RangoMinisterial;

	class rango_ministerial{
		//Atributos
		private $rango_ministerial;

		//Metodos
		//Constructor
		public function __construct(){
			$this->rango_ministerial = new RangoMinisterial;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del rango_ministerials";
			$datos = $this->rango_ministerial->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['rango_ministerial'])) {
				$this->rango_ministerial->set('rango_ministerial',$_POST['rango_ministerial']);
				$this->rango_ministerial->set('cod_rango',$_POST['cod_rango']);
				$this->rango_ministerial->add();
				header('location: ' . URL . 'rango_ministerial');
			}
		}

		public function eliminar($id){
			$this->rango_ministerial->set('id_rango', $id);
			$this->rango_ministerial->delete();
			header('location: ' . URL . 'rango_ministerial');

		}

		public function editar($id){			
			if (isset($_POST['rango_ministerial'])) {
				$this->rango_ministerial->set('id_rango', $id);
				$this->rango_ministerial->set('rango_ministerial',$_POST['rango_ministerial']);
				$this->rango_ministerial->set('cod_rango',$_POST['cod_rango']);
				$this->rango_ministerial->edit();
				//header('location: ' . URL . 'rango_ministerial');
			}else{
				$this->rango_ministerial->set('id_rango', $id);
				$datos = $this->rango_ministerial->view();
				return $datos;
			}

		}

	}

	$rango_ministerial = new rango_ministerial();

?>