<?php namespace Controllers;
	use Models\M_Tipo_Documento as Tipo_Documento;

	class tipos_documento{
		// Atributos o Propiedades
		private $tipo_doc;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->tipo_doc = new Tipo_Documento;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla tipo_documentos";
			$datos = $this->tipo_doc->lists();
			return $datos;
		}

		public function ver($id){
			$this->tipo_doc->set("id_tipo_documento", $id);
			$datos = $this->tipo_doc->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->tipo_doc->set("id_tipo_documento", $id);
			$this->tipo_doc->delete();
			header("Location: " . URL . "tipos_documento");
		}

		public function editar($id){
			if($_POST){
				$this->tipo_doc->set("id_tipo_documento", $id);
				$this->tipo_doc->set("tipo_documento", $_POST['tipo_documento']);
				$this->tipo_doc->edit();
				header('Location: ' . URL . "tipos_documento");
			}else{
				$this->tipo_doc->set("id_tipo_documento", $id);
				$datos = $this->tipo_doc->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->tipo_doc->set("tipo_documento", $_POST['tipo_documento']);
				$this->tipo_doc->add();
				header('Location: ' . URL . "tipos_documento");
			}
		}
	}

?>