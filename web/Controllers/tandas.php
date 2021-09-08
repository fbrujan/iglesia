<?php namespace Controllers;
	use Models\M_Tandas as Tanda;

	class tandas{
		// Atributos o Propiedades
		private $tanda;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->tanda = new Tanda;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla tandas";
			$datos = $this->tanda->lists();
			return $datos;
		}

		public function ver($id){
			$this->tanda->set('id_tanda', $id);
			$datos = $this->tanda->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->tanda->set('id_tanda', $id);
			$this->tanda->delete();
			header("Location: " . URL . "tandas");
		}

		public function editar($id){
			if($_POST){
				$this->tanda->set('id_tanda', $id);
				$this->tanda->set('tanda', $_POST['tanda']);
				$this->tanda->edit();
				header('Location: ' . URL . "tandas");
			}else{
				$this->tanda->set('id_tanda', $id);
				$datos = $this->tanda->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->tanda->set('tanda', $_POST['tanda']);
				$this->tanda->add();
				header('Location: ' . URL . "tandas");
			}
		}
	}

?>