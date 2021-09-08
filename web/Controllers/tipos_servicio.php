<?php namespace Controllers;
	use Models\M_Tipo_Servicio as Tipo_Servicio;

	class tipos_servicio{
		// Atributos o Propiedades
		private $tipo_servicio;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->tipo_servicio = new Tipo_Servicio;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla tipo_servicioumentos";
			$datos = $this->tipo_servicio->lists();
			return $datos;
		}

		public function ver($id){
			$this->tipo_servicio->set("id_tipo_servicio", $id);
			$datos = $this->tipo_servicio->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->tipo_servicio->set("id_tipo_servicio", $id);
			$this->tipo_servicio->delete();
			header("Location: " . URL . "tipos_servicio");
		}

		public function editar($id){
			if($_POST){
				$this->tipo_servicio->set("id_tipo_servicio", $id);
				$this->tipo_servicio->set("tipo_servicio", $_POST['tipo_servicio']);
				$this->tipo_servicio->set("cod_tipo_servicio", $_POST['cod_tipo_servicio']);
				$this->tipo_servicio->edit();
				header('Location: ' . URL . "tipos_servicio");
			}else{
				$this->tipo_servicio->set("id_tipo_servicio", $id);
				$datos = $this->tipo_servicio->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->tipo_servicio->set("tipo_servicio", $_POST['tipo_servicio']);
				$this->tipo_servicio->set("cod_tipo_servicio", $_POST['cod_tipo_servicio']);
				$this->tipo_servicio->add();
				header('Location: ' . URL . "tipos_servicio");
			}
		}
	}

?>