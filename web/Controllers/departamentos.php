<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Departamentos as Departamento;

	class departamentos{
		// Atributos o Propiedades
		private $departamento;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->departamento = new Departamento;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla departamentos";
			$datos = $this->departamento->lists();
			return $datos;
		}

		public function ver($id){
			$this->departamento->set("id_departamento", $id);
			$datos = $this->departamento->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->departamento->set("id_departamento", $id);
			$this->departamento->delete();
			header("Location: " . URL . "departamentos");
		}

		public function editar($id){
			if($_POST){
				$this->departamento->set("id_departamento", $id);
				$this->departamento->set("departamento", $_POST['departamento']);
				$this->departamento->set("descripcion", $_POST['descripcion']);
				$this->departamento->edit();
				header('Location: ' . URL . "departamentos");
			}else{
				$this->departamento->set("id_departamento", $id);
				$datos = $this->departamento->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->departamento->set("departamento", $_POST['departamento']);
				$this->departamento->set("descripcion", $_POST['descripcion']);
				$this->departamento->add();
				//header('Location: ' . URL . "departamentos");
			}
		}
	}

?>
