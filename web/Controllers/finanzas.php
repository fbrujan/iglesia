<?php namespace Controllers;
	use Models\M_Finanzas as Transaccion;

	class finanzas{
		// Atributos o Propiedades
		private $transaccion;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->transaccion = new Transaccion;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla Finanzas
			$datos = $this->transaccion->lists();
			return $datos;
		}

		public function ver($id){
			$this->transaccion->set("id_transaccion", $id);
			$datos = $this->transaccion->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->transaccion->set("id_transaccion", $id);
			$this->transaccion->delete();
			header("Location: " . URL . "finanzas");
		}

		public function editar($id){
			if($_POST){
				$this->transaccion->set("id_transaccion", $id);
				$this->transaccion->set("transaccion", $_POST['transaccion']);
				$this->transaccion->edit();
				header('Location: ' . URL . "finanzas");
			}else{
				$this->transaccion->set("id_transaccion", $id);
				$datos = $this->transaccion->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
				$this->transaccion->set("fecha", $_POST['fecha']);
				$this->transaccion->set("id_tipo_transaccion", $_POST['id_tipo_transaccion']);
				$this->transaccion->set("id_concepto", $_POST['id_concepto_transaccion']);
				$this->transaccion->set("id_persona", $_POST['id_persona']);
				$this->transaccion->set("monto", $_POST['monto']);
				$this->transaccion->set("comentario", $_POST['comentario']);
				$this->transaccion->set("estado", $_POST['estado']);

				$this->transaccion->add();
				//header('Location: ' . URL . "finanzas");
			}
		}


		public function listar_personas(){
			$datos = $this->transaccion->personas();
			return $datos;
		}

		public function listar_conceptos(){
			$datos = $this->transaccion->conceptos();
			return $datos;
		}

		public function listar_tipos_transaccion(){
			$datos = $this->transaccion->tipo_transacciones();
			return $datos;
		}
	}

	$finanzas = new finanzas();

?>
