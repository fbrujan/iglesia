<?php namespace Controllers;
	use Models\M_Sociedades as Sociedad;

	class sociedades{
		// Atributos o Propiedades
		private $sociedad;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->sociedad = new Sociedad;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla sociedads";
			$datos = $this->sociedad->lists();
			return $datos;
		}

		public function ver($id){
			$this->sociedad->set("id_sociedad", $id);
			$datos = $this->sociedad->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->sociedad->set("id_sociedad", $id);
			$this->sociedad->delete();
			header("Location: " . URL . "sociedades");
		}

		public function editar($id){
			if($_POST){
				$this->sociedad->set("id_sociedad", $id);
				$this->sociedad->set("sociedad", $_POST['sociedad']);
				$this->sociedad->set("lema", $_POST['lema']);
				$this->sociedad->set("siglas", $_POST['siglas']);
				$this->sociedad->set("descripcion", $_POST['descripcion']);
				$this->sociedad->edit();
				header('Location: ' . URL . "sociedades");
			}else{
				$this->sociedad->set("id_sociedad", $id);
				$datos = $this->sociedad->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->sociedad->set("sociedad", $_POST['sociedad']);
				$this->sociedad->set("descripcion", $_POST['descripcion']);
				$this->sociedad->set("lema", $_POST['lema']);
				$this->sociedad->set("siglas", $_POST['siglas']);
				$this->sociedad->add();
				header('Location: ' . URL . "sociedades");
			}
		}
	}

?>