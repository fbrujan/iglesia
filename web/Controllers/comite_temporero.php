<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_ComiteTemporero as ComiteTemporero;

	class comite_temporero{
		//Atributos
		private $comite_temporero;

		//Metodos
		//Constructor
		public function __construct(){
			$this->comite_temporero = new ComiteTemporero;
		}

		public function index(){
			// Este Metodo se llama por defecto.. 
			// ver enrutador, request y autoload
			// print "Soy el controlador del comite_temporero";
			$datos = $this->comite_temporero->lists();
			return $datos;
		}

		public function agregar(){
			if (isset($_POST['comite_temporero'])) {
				$this->comite_temporero->set('comite_temporero',$_POST['comite_temporero']);
				$this->comite_temporero->add();
				header('location: ' . URL . 'comite_temporero');
			}
		}

		public function eliminar($id){
			$this->comite_temporero->set('id_comite_temporero', $id);
			$this->comite_temporero->delete();
			header('location: ' . URL . 'comite_temporero');

		}

		public function editar($id){			
			if (isset($_POST['comite_temporero'])) {
				$this->comite_temporero->set('id_comite_temporero', $id);
				$this->comite_temporero->set('comite_temporero',$_POST['comite_temporero']);
				$this->comite_temporero->edit();
				header('location: ' . URL . 'comite_temporero');
			}else{
				$this->comite_temporero->set('id_comite_temporero', $id);
				$datos = $this->comite_temporero->view();
				return $datos;
			}

		}

	}

	$comite_temporero = new comite_temporero();

?>