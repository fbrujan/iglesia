<?php namespace Controllers;
	use Models\M_Sexo as Sexo;

	class sexos{
		// Atributos o Propiedades
		private $sexo;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->sexo = new Sexo;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla sexos";
			$datos = $this->sexo->lists();
			return $datos;
		}

		public function ver($id){
			$this->sexo->set("id_sexo", $id);
			$datos = $this->sexo->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->sexo->set("id_sexo", $id);
			$this->sexo->delete();
			header("Location: " . URL . "sexos");
		}

		public function editar($id){
			if($_POST){
				$this->sexo->set("id_sexo", $id);
				$this->sexo->set("sexo", $_POST['sexo']);
				$this->sexo->edit();
				header('Location: ' . URL . "sexos");
			}else{
				$this->sexo->set("id_sexo", $id);
				$datos = $this->sexo->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->sexo->set("sexo", $_POST['sexo']);
				$datos=$this->sexo->add();
					$row = mysqli_fetch_array($datos);
					echo $row[0]. "insertado";						

				//header('Location: ' . URL . "sexos");
			}
		}
	}

?>