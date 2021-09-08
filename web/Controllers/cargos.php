<?php namespace Controllers;
	use Models\M_Cargos as Cargo;

	class cargos{
		// Atributos o Propiedades
		private $cargo;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->cargo = new Cargo;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla cargos";
			$datos = $this->cargo->lists();
			return $datos;
		}

		public function ver($id){
			$this->cargo->set("id_cargo", $id);
			$datos = $this->cargo->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->cargo->set("id_cargo", $id);
			$this->cargo->delete();
			header("Location: " . URL . "cargos");
		}

		public function editar($id){
			if($_POST){
				$this->cargo->set("id_cargo", $id);
				$this->cargo->set("cargo", $_POST['cargo']);
				$this->cargo->edit();
				header('Location: ' . URL . "cargos");
			}else{
				$this->cargo->set("id_cargo", $id);
				$datos = $this->cargo->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->cargo->set("cargo", $_POST['cargo']);
				$this->cargo->add();
				header('Location: ' . URL . "cargos");
			}
		}
	}

?>
