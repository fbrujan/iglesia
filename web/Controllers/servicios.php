<?php namespace Controllers;
	use Models\M_Servicios		as Servicio;
	use Models\M_Miembros		as Miembro;
	use Models\M_Lideres		as Lider;
	use Models\M_Tipo_Servicio	as Tipo_Servicio;
	use Models\M_Departamentos	as Departamento;
	use Models\M_Iglesias		as Iglesias;
	
	class servicios{
		// Atributos o Propiedades
		private $servicio;
		private $miembro;
		private $lider;
		private $tipo_servicio;		
		private $departamento;		

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->servicio			= new Servicio;
			$this->miembro			= new Miembro;
			$this->lider 			= new Lider;
			$this->tipo_servicio	= new Tipo_Servicio;	
			$this->departamento		= new Departamento;		
			$this->iglesias			= new Iglesias;					
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla miembros";
			$datos = $this->servicio->lists();
			return $datos;
		}

		public function ver($id){
			$this->servicio->set("id_servicio", $id);
			$datos = $this->servicio->view();
			return $datos; 
		}

		public function listar_todos(){
			$datos = $this->servicio->listsAll();
			return $datos;
			header("Location: " . URL . "servicios");
		}

		public function eliminar($id){
			$this->servicio->set("id_servicio", $id);
			$this->servicio->delete();
			header("Location: " . URL . "servicios");
		}

		public function editar($id){
			if($_POST){
					$this->servicio->set("id_servicio", $id);
					$this->servicio->set("servicio", $_POST['servicio']);
					$this->servicio->set("fecha_inicio", $_POST['fecha_inicio']);
					$this->servicio->set("hora_inicio", $_POST['hora_inicio']);
					$this->servicio->set("id_tipo_servicio", $_POST['id_tipo_servicio']);
					$this->servicio->set("id_departamento", $_POST['id_departamento']);
					$this->servicio->set("id_iglesia", $_POST['id_iglesia']);
					$this->servicio->set("id_lider", $_POST['id_lider']);
					$this->servicio->set("descripcion", $_POST['descripcion']);
					$this->servicio->set("costo", $_POST['costo']);
					//$this->servicio->set("requiere_registro", $_POST['requiere_registro']);
					$this->servicio->edit();
				header('Location: ' . URL . "servicios");
			}else{
				$this->servicio->set("id_servicio", $id);
				$datos = $this->servicio->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
					$this->servicio->set("servicio", $_POST['servicio']);
					$this->servicio->set("fecha_inicio", $_POST['fecha_inicio']);
					$this->servicio->set("hora_inicio", $_POST['hora_inicio']);
					$this->servicio->set("id_tipo_servicio", $_POST['id_tipo_servicio']);
					$this->servicio->set("id_departamento", $_POST['id_departamento']);
					$this->servicio->set("id_iglesia", $_POST['id_iglesia']);
					$this->servicio->set("id_lider", $_POST['id_lider']);
					$this->servicio->set("descripcion", $_POST['descripcion']);
					$this->servicio->set("costo", $_POST['costo']);
					$this->servicio->set("requiere_registro", $_POST['requiere_registro']);
					$this->servicio->add();
					header('Location: ' . URL . "servicios");

			}
		}

		
		public function listarTiposServicios(){
			$datos = $this->tipo_servicio->lists();
			return $datos;
		}

		public function listarLideres(){
			$datos = $this->lider->lists();
			return $datos;
		}

		public function listarDepartamentos(){
			$datos = $this->departamento->lists();
			return $datos;
		}

		public function listarMiembros(){
			$datos = $this->miembro->lists();
			return $datos;
		}

		public function listarIglesias(){
			$datos = $this->iglesias->lists();
			return $datos;
		}
	}

	$servicios = new servicios();


?>