<?php namespace Controllers; 

	use Models\M_Estados as Estado;

	class estados{
		// Atributos o Propiedades
		private $estado;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->estado = new Estado;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla estados";
			$datos = $this->estado->lists();
			return $datos;
		}

		public function ver($id){
			$this->estado->set("id_estado", $id);
			$datos = $this->estado->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->estado->set("id_estado", $id);
			$this->estado->delete();
			header("Location: " . URL . "estados");
		}

		public function editar($id){
			if($_POST){
				$this->estado->set("id_estado", $id);
				$this->estado->set("estado", $_POST['estado']);
				$this->estado->set("elegible_lider", $_POST['elegible_lider']);
				$this->estado->edit();
				header('Location: ' . URL . "estados");
			}else{
				$this->estado->set("id_estado", $id);
				$datos = $this->estado->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->estado->set("estado", $_POST['estado']);
				$this->estado->set("elegible_lider", $_POST['elegible_lider']);
				$this->estado->add();
				//header('Location: ' . URL . "estados");
			}
		}
	}

?>
